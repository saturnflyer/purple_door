# This migration comes from thredded (originally 20140508021424)
class AddPrivateTopicsCountToThreddedMessageboards < ActiveRecord::Migration
  def change
    add_column :thredded_messageboards, :private_topics_count, :integer, default: 0
  end
end
