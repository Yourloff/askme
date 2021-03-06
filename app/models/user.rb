class User < ApplicationRecord
  REG_NICKNAME = /\A[a-zA-Z0-9_]*\Z/
  REG_COLOR = /\A#[a-f0-9]{6}\z/i
  REG_EMAIL = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  has_secure_password
  has_many :questions, dependent: :delete_all
  has_many :authored_questions, class_name: 'Question', foreign_key: 'author_id', dependent: :nullify

  after_validation :downcase_nickname
  validates :email, presence: true, uniqueness: true, format: { with: REG_EMAIL }
  validates :nav_color, format: { with: REG_COLOR }
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: REG_NICKNAME }

  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: 'retro')

  def to_param
    nickname
  end

  private

  def downcase_nickname
    nickname&.downcase!
  end
end
