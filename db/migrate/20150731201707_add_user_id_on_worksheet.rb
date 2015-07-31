class AddUserIdOnWorksheet < ActiveRecord::Migration
  def change
    add_column :worksheets, :user_id, :integer
  end
end
