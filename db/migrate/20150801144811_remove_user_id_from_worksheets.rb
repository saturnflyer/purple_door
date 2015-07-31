class RemoveUserIdFromWorksheets < ActiveRecord::Migration
  def change
    remove_column :worksheets, :user_id
  end
end
