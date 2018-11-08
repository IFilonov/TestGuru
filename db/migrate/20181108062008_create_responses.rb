class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.boolean :passed

      t.timestamps
    end
  end
end
