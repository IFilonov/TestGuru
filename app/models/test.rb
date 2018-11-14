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
    .where(categories: { title: category }).order(title: :desc).pluck(:title) }

  validates :title, presence: true
  validates :level, format: { with: /\A[\d]+\z/, message: "Only digits are possible" }
  validate :check_test, on: :create

  def check_test
    errors.add(:title, :level) << "Such test already exist" if Test.
      where(level: level, title: title).count >= 1
  end


  def self.tests_by_category(category)
    joins("join categories on tests.category_id = categories.id")
      .where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
