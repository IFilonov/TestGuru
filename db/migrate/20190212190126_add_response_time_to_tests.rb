class AddResponseTimeToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :response_time, :string
  end
end
