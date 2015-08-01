# This migration comes from thredded (originally 20131026202621)
class MoveFilterToMessageboards < ActiveRecord::Migration
  def up
    add_column :thredded_messageboards, :filter, :string, null: false, default: 'markdown'
    remove_column :thredded_messageboard_preferences, :filter
  end

  def down
    add_column :thredded_messageboard_preferences, :filter, :string, null: false, default: 'markdown'
    remove_column :thredded_messageboards, :filter
  end
end
