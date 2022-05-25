class Tag < ApplicationRecord
  HASHTAG_REGEX = /#[[:word:]-]+/

  has_many :quest_tags
  has_many :questions, through: :quest_tags

  def to_param
    name
  end
end
