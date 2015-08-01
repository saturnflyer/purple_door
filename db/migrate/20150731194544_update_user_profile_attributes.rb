class UpdateUserProfileAttributes < ActiveRecord::Migration
  def change
    add_column  :users, :first_name,    :string
    add_column  :users, :last_name,     :string
    add_column  :users, :birthdate,     :datetime
    add_column  :users, :profile_image, :string
  end
end
