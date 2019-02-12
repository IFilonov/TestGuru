class Rule < ApplicationRecord
  has_many :budge_rules
  has_many :badges, through: :budge_rules

  PROC_HASH = {
    'Category' => Proc.new { |response, value| response.test.category.title == value },
    'Attempt' => Proc.new { |response, value|
      Response.where(user_id: response.user.id, test_id: response.test.id).count == value.to_i },
    'Level' => Proc.new { |response, value| response.test.level == value.to_i }
  }

  def check_rule(response)
    return PROC_HASH[name].call(response, value)
  end
end
