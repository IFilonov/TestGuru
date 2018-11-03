class CorrectKeys < ActiveRecord::Migration[5.2]
  def change
    add_column(:answers, :correct, :string)
    change_column_default(:answers, :correct, 'N')
    add_foreign_key(:answers, :questions)
    add_foreign_key(:tests, :categories)    
  end
end
