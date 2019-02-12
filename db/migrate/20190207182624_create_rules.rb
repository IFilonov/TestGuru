class CreateRules < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
    add_index :rules, :name, unique: true
  end
end
