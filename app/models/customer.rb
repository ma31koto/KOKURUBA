class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :gender, presence: true
  validates :age, presence: true, numericality: {only_integer: true, greater_than: 1, less_than_or_equal_to: 100}
  validates :biography, length: { maximum: 168 }

  enum gender: { man: 0, woman: 1, another: 2, no_answer: 3 }

  has_one_attached :profile_image

  def get_profile_image
    profile_image.attached? ? profile_image : 'no_image.jpg'
  end

  def follow(customer_id)
    active_relationships.create(followed_id: customer_id)
  end

  def unfollow(customer_id)
    active_relationships.find_by(followed_id: customer_id).destroy
  end

  def following?(customer)
    followings.include?(customer)
  end

end
