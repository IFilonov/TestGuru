class RenameColumnTests < ActiveRecord::Migration[5.2]
  def change
    rename_column(:tests, :user_id, :author_id)
  end
end
