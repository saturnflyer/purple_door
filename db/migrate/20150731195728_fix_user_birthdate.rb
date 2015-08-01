class FixUserBirthdate < ActiveRecord::Migration
  def change
    change_column :users, :birthdate, :date
  end
end
