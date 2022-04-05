class PostComment < ApplicationRecord
  belongs_to :customer
  belongs_to :post
  
  validates :title, presence: true
  validates :comment, presence: true
  validates :confession_result, presence: true
  
  has_one_attached :comment_image

  def get_comment_image
    (comment_image.attached?) ? coment_image : 'no_image.jpg'
  end
end
