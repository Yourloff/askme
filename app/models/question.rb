class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  validates :body, length: { maximum: 280 }, allow_blank: false, presence: true
end
