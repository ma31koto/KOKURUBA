class Tag < ApplicationRecord
  has_many :post_tags, dependet: :destroy
  has_many :posts, through: :post_tags

  validates :name, presence: true
end
