class CreateBudgeRules < ActiveRecord::Migration[5.2]
  def change
    create_table :budge_rules do |t|
      t.references :badge, foreign_key: true
      t.references :rule, foreign_key: true

      t.timestamps
    end
  end
end
