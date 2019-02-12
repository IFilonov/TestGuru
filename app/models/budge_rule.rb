class BudgeRule < ApplicationRecord
  belongs_to :badge
  belongs_to :rule

  validates :badge_id, uniqueness: { scope: :rule_id}

  def self.check_badges(response)
    budge_rules = BudgeRule.all
    count_badges = 0
    budge_rules.each do |budge_rule|
      if budge_rule.rule.check_rule(response)
        response.user.grants.create(badge: budge_rule.badge)
        count_badges += 1
      end
    end
    return count_badges
  end
end
