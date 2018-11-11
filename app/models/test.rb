class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :responses
  has_many :users, through: :responses
  has_many :questions
  def self.tests_by_category(category)
    joins("join categories on tests.category_id = categories.id")
      .where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
