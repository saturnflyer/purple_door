class ChangeEventsToHaveOneDate < ActiveRecord::Migration
  def change
    remove_column :events, :end, :datetime
    rename_column :events, :start, :date
    change_column :events, :date, :date
  end
end
