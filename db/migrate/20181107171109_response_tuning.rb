class ResponseTuning < ActiveRecord::Migration[5.2]
  def change
    add_index(:responses, :question_id)
    add_index(:responses, :user_id)
    change_column_default(:responses, :correct, false)
    add_foreign_key(:responses, :questions)
    add_foreign_key(:responses, :users)    
  end
end
