# This migration comes from thredded (originally 20141122160545)
class NormalizePostUserEmail < ActiveRecord::Migration
  def change
    remove_column :thredded_posts, :user_email
  end
end
