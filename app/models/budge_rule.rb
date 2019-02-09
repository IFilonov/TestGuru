class BudgeRule < ApplicationRecord
  belongs_to :badge
  belongs_to :rule

  validates :badge_id, uniqueness: { scope: :rule_id}
end
