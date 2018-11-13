class ErDiagramm < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:answers, :question_id, false)
    change_column_null(:questions, :test_id, false)
    change_column_null(:responses, :user_id, false)
    change_column_null(:responses, :test_id, false)
  end
end
