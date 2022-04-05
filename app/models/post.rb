class Post < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  belongs_to :customer
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  belongs_to :area
  
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :title, presence: true
  validates :introduction, presence: true
  validates :confession_result, presence: true
  

  has_one_attached :spot_image
  has_many_attached :main_spot_image

  def get_spot_image
    (spot_image.attached?) ? spot_image : 'no_image.jpg'
  end

  def get_main_spot_image
    (main_spot_image.attached?) ? main_spot_image : 'no_image.jpg'
  end

end
