class RenameResponseTimeToTimeLimit < ActiveRecord::Migration[5.2]
  def change
    rename_column :tests, :response_time, :time_limit
  end
end
