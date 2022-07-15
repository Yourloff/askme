class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :quest_tags
  has_many :tags, through: :quest_tags

  validates :body, length: { maximum: 280 }, allow_blank: false, presence: true

  after_save_commit :create_hashtags

  private

  def create_hashtags
    question = Question.find(self.id)
    hashtags = take_hashtags("#{body} #{answer.to_s}")
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.delete('#'))
      question.tags << tag
    end
  end

  def take_hashtags(text)
    text.downcase.scan(Tag::HASHTAG_REGEX)
  end
end
