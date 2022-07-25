class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :quest_tags, dependent: :destroy
  has_many :tags, through: :quest_tags

  validates :body, presence: true, length: { maximum: 255 }

  after_save_commit :create_hashtags

  private

  def create_hashtags
    self.tags =
      "#{body} #{answer}".downcase.
        scan(Tag::HASHTAG_REGEX).
        uniq.
        map { |tag| Tag.find_or_create_by(name: tag.delete('#'))}
  end
end
