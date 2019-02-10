class BudgeRule < ApplicationRecord
  belongs_to :badge
  belongs_to :rule

  validates :badge_id, uniqueness: { scope: :rule_id}

  def self.check_badges(response)
    budge_rules = BudgeRule.all
    budges = false
    budge_rules.each { |budge_rule|
      if budge_rule.rule.check_rule(response)
        response.user.grants.new(badge: budge_rule.badge).save!
        budges = true
      end
    }
    return budges
  end
end
