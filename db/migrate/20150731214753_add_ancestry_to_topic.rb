class AddAncestryToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :ancestry, :string
    add_index :topics, :ancestry
  end
end