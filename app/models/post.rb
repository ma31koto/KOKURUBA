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

  enum confession_result: { yes: 0, no: 1, no_answer: 3 }

  has_one_attached :spot_image
  has_many_attached :main_spot_image

  def get_spot_image
    (spot_image.attached?) ? spot_image : 'no_image.jpg'
  end

  def get_main_spot_image
    (main_spot_image.attached?) ? main_spot_image : 'no_image.jpg'
  end

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
    end
  end

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

end
