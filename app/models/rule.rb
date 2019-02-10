class Rule < ApplicationRecord
  has_many :budge_rules
  has_many :badges, through: :budge_rules

  CATEGORY = 'Category'
  ATTEMPT = 'Attempt'
  LEVEL = 'Level'

  def check_rule(response)
    case name
    when CATEGORY
      return response.test.category.title == value
    when ATTEMPT
      return Response.where(user_id: response.user.id, test_id: response.test.id).count == value.to_i
    when LEVEL
      return response.test.level == value.to_i
    end
  end
end
