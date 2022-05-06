class Question < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :body, length: { maximum: 280 }, presence: true
end
