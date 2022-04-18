class Post < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  belongs_to :customer
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  belongs_to :area

  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :address, presence: true, uniqueness: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :title, presence: true
  validates :introduction, presence: true
  validates :atmosphere_rate, presence: true
  validates :few_people_rate, presence: true
  validates :standard_rate, presence: true
  validates :all_rate, presence: true
  validates :confession_result, presence: true
  validates :area_id, presence: true

  enum confession_result: { yes: 0, no: 1, no_answer: 2 }

  has_one_attached :spot_image

  def get_spot_image
    (spot_image.attached?) ? spot_image : 'no_image.jpg'
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

  def avg_confession_result
    # 告白の成功率を定義
    # 分子：numerator
    # 分母：enominator
    post_numerator = 0
    post_denominator = 0

    all_numerator = 0
    all_denominator = 0


    if self.confession_result == "yes"
      post_numerator = 1
    elsif self.confession_result == "no"
      post_numerator = 0
    elsif self.confession_result == "no_answer"
      post_numerator = 0
    end

    if self.confession_result == "yes"
      post_denominator = 1
    elsif self.confession_result == "no"
      post_denominator = 1
    elsif self.confession_result == "no_answer"
      post_denominator = 0
    end


    all_numerator = post_numerator +  post_comments.where(confession_result: 0).count
    all_denominator = post_denominator +  post_comments.where(confession_result: 0).or(post_comments.where(confession_result: 1)).count


    if all_denominator == 0
      return false
    elsif all_denominator > 0
      return ((all_numerator.to_f/all_denominator)*100).round(1)
    end
  end

  def avg_confession_result_num
    if avg_confession_result == false
      return -1
    else
      return avg_confession_result
    end
  end

  def avg_atmosphere_rate
    (self.atmosphere_rate + self.post_comments.sum(:atmosphere_rate)).to_f/(1 + self.post_comments.count).to_f
  end

  def avg_few_people_rate
    (self.few_people_rate + self.post_comments.sum(:few_people_rate)).to_f/(1 + self.post_comments.count).to_f
  end

  def avg_standard_rate
    (self.standard_rate + self.post_comments.sum(:standard_rate)).to_f/(1 + self.post_comments.count).to_f
  end

  def avg_all_rate
    (self.all_rate + self.post_comments.sum(:all_rate)).to_f/(1 + self.post_comments.count).to_f
  end

  def self.avg_confession_result_ranking(sort,posts)
    if sort == 'asc'
      posts.sort { |a, b| b.avg_confession_result_num <=> a.avg_confession_result_num }
    else
      posts.sort { |a, b| a.avg_confession_result_num <=> b.avg_confession_result_num }
    end
  end

  def self.avg_atmosphere_rate_ranking(sort,posts)
    if sort == 'asc'
      posts.sort { |a, b| b.avg_atmosphere_rate <=> a.avg_atmosphere_rate }
    else
      posts.sort { |a, b| a.avg_atmosphere_rate <=> b.avg_atmosphere_rate }
    end
  end

  def self.avg_few_people_rate_ranking(sort,posts)
    if sort == 'asc'
      posts.sort { |a, b| b.avg_few_people_rate <=> a.avg_few_people_rate }
    else
      posts.sort { |a, b| a.avg_few_people_rate <=> b.avg_few_people_rate }
    end
  end

  def self.avg_standard_rate_ranking(sort,posts)
    if sort == 'asc'
      posts.sort { |a, b| b.avg_standard_rate <=> a.avg_standard_rate }
    else
      posts.sort { |a, b| a.avg_standard_rate <=> b.avg_standard_rate }
    end
  end

  def self.avg_all_rate_ranking(sort,posts)
    if sort == 'asc'
      posts.sort { |a, b| b.avg_all_rate <=> a.avg_all_rate }
    else
      posts.sort { |a, b| a.avg_all_rate <=> b.avg_all_rate }
    end
  end

end
