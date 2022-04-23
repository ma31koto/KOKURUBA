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
    spot_image.attached? ? spot_image : 'no_image.jpg'
  end

  # タグ追加機能
  def save_tag(sent_tags)
    # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = tags.pluck(:name) unless tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      tags.delete Tag.find_by(name: old)
    end
    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      tags << new_post_tag
    end
  end

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  # 告白成功率の計算
  def avg_confession_result
  # 分子：numerator
  # 分母：enominator

    post_numerator = 0
    post_denominator = 0

    all_numerator = 0
    all_denominator = 0

    # 全体分子に対する、post投稿主の告白結果の数値変換
    if confession_result == "yes"
      post_numerator = 1
    elsif confession_result == "no"
      post_numerator = 0
    elsif confession_result == "no_answer"
      post_numerator = 0
    end
    # 全体分母に対する、post投稿主の告白結果の数値変換
    if confession_result == "yes"
      post_denominator = 1
    elsif confession_result == "no"
      post_denominator = 1
    elsif confession_result == "no_answer"
      post_denominator = 0
    end

    # 全体分子の計算
    all_numerator = post_numerator + post_comments.where(confession_result: 0).count
    # 全体分母の計算
    all_denominator = post_denominator + post_comments.where(confession_result: 0).or(post_comments.where(confession_result: 1)).count

    # 全体分母が０の時、計算をしないものとする
    if all_denominator == 0
      false
    elsif all_denominator > 0
      ((all_numerator.to_f / all_denominator) * 100).round(1)
    end
  end

  # 告白成功率のランキング検索の際、未回答を−１と定義
  def avg_confession_result_num
    if avg_confession_result == false
      -1
    else
      avg_confession_result
    end
  end

  # スポットの平均評価
  def avg_atmosphere_rate
    (atmosphere_rate + post_comments.sum(:atmosphere_rate)).to_f / (1 + post_comments.count).to_f
  end

  def avg_few_people_rate
    (few_people_rate + post_comments.sum(:few_people_rate)).to_f / (1 + post_comments.count).to_f
  end

  def avg_standard_rate
    (standard_rate + post_comments.sum(:standard_rate)).to_f / (1 + post_comments.count).to_f
  end

  def avg_all_rate
    (all_rate + post_comments.sum(:all_rate)).to_f / (1 + post_comments.count).to_f
  end

  # 以下ランキング機能
  def self.new_ranking(sort, posts)
    if sort == 'asc'
      posts.order(:created_at)
    else
      posts.order(created_at: :desc)
    end
  end

  def self.avg_atmosphere_rate_ranking(sort, posts)
    if sort == 'asc'
      posts.sort_by{|post| post.avg_atmosphere_rate}
    else
      posts.sort_by{|post| post.avg_atmosphere_rate}.reverse
    end
  end

  def self.avg_few_people_rate_ranking(sort, posts)
    if sort == 'asc'
      posts.sort_by{|post| post.avg_few_people_rate}
    else
      posts.sort_by{|post| post.avg_few_people_rate}.reverse
    end
  end

  def self.avg_standard_rate_ranking(sort, posts)
    if sort == 'asc'
      posts.sort_by{|post| post.avg_standard_rate}
    else
      posts.sort_by{|post| post.avg_standard_rate}.reverse
    end
  end

  def self.avg_all_rate_ranking(sort, posts)
    if sort == 'asc'
      posts.sort_by{|post| post.avg_all_rate}
    else
      posts.sort_by{|post| post.avg_all_rate}.reverse
    end
  end

  def self.avg_confession_result_ranking(sort, posts)
    if sort == 'asc'
      posts.sort_by{|post| post.avg_confession_result_num}
    else
      posts.sort_by{|post| post.avg_confession_result_num}.reverse
    end
  end

end
