class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :responses
  has_many :users, through: :responses
  has_many :questions

  scope :by_level, ->(level) { where(level: level) }
  scope :low, -> { by_level(0..1)}
  scope :middle, -> { by_level(2..4) }
  scope :difficult, -> { by_level(5..Float::INFINITY) }
  scope :by_category, ->(category) { joins(:category)
    .where(categories: { title: category }) }

  validates :title, presence: true
  validates :level, format: { with: /\A[\d]+\z/, message: "Only digits are possible" }
  validates :title, uniqueness: { scope: :level, message:  "Such test already exists" }

  def self.tests_by_category(category)
    by_category(category).order(title: :desc).pluck(:title)
  end
end
