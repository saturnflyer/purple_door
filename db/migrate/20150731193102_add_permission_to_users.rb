class AddPermissionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :permissions, :string, array:true, default: []
  end
end
