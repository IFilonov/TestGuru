class Test < ApplicationRecord
  def self.tests(category)
    joins("join categories on tests.category_id = categories.id")
      .where("categories.title = ?", category).order(title: :desc)
      .pluck(:title)
  end
end
