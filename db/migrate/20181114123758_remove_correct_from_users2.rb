class RemoveCorrectFromUsers2 < ActiveRecord::Migration[5.2]
  def change
    remove_column(:answers, :correct, :string)
    add_column(:answers, :correct, :boolean)
    change_column_default(:answers, :correct, false)
  end
end
