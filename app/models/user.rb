class User < ApplicationRecord
  has_secure_password

  REG_NICKNAME = /\A[a-zA-Z0-9_]*\Z/
  REG_COLOR = /\A#[a-f0-9]{6}\z/i

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true
  validates :nav_color, format: { with: REG_COLOR }
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: REG_NICKNAME }

  has_many :questions, dependent: :delete_all

  def downcase_nickname
    nickname.downcase!
  end
end
