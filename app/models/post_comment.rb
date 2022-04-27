class PostComment < ApplicationRecord
  belongs_to :customer
  belongs_to :post

  validates :title, presence: true
  validates :comment, presence: true
  validates :atmosphere_rate, presence: true
  validates :few_people_rate, presence: true
  validates :standard_rate, presence: true
  validates :all_rate, presence: true
  validates :confession_result, presence: true

  enum confession_result: { yes: 0, no: 1, no_answer: 2 }

  has_one_attached :comment_image

  def get_comment_image
    comment_image.attached? ? comment_image : 'no_image.jpg'
  end
  
end
