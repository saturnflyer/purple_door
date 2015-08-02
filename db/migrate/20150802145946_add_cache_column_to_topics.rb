class AddCacheColumnToTopics < ActiveRecord::Migration
  def self.up
    add_column :topics, :ancestry_depth, :integer, :default => 0
    
    Topic.reset_column_information
    
    Topic.rebuild_depth_cache!
  end

  def self.down
    remove_column :topics, :ancestry_depth
  end
end