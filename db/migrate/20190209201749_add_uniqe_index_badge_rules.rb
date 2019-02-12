class AddUniqeIndexBadgeRules < ActiveRecord::Migration[5.2]
  def change
    add_index :budge_rules, [:badge_id, :rule_id], unique: true
  end
end
