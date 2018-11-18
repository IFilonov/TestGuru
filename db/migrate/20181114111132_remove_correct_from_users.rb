class RemoveCorrectFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column(:answers, :correct, :string)
    add_column(:answers, :correct, :string)
    change_column_default(:answers, :correct, false)
    add_index(:tests, [:title, :level], unique: true)
  end
end
