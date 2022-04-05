class Area < ApplicationRecord
  has_many :areas, dependent: :destroy

  validates :name, presence: true
end
