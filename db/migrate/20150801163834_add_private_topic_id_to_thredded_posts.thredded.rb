# This migration comes from thredded (originally 20140508023858)
class AddPrivateTopicIdToThreddedPosts < ActiveRecord::Migration
  def change
    add_column :thredded_posts, :private_topic_id, :integer
  end
end
