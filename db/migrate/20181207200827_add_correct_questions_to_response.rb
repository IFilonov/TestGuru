class AddCorrectQuestionsToResponse < ActiveRecord::Migration[5.2]
  def change
    add_column :responses, :correct_questions, :integer, default: 0 
  end
end
