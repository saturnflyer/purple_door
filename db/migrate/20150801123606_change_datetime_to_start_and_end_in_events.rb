class ChangeDatetimeToStartAndEndInEvents < ActiveRecord::Migration
  def change
    rename_column :events, :datetime, :start
    add_column :events, :end, :datetime
  end
end
