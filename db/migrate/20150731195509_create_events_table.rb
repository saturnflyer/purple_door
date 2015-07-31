class CreateEventsTable < ActiveRecord::Migration
  def change
    create_table :events_tables do |t|
      t.string    :type
      t.date      :start_date
      t.date      :end_date
      t.text      :notes
    end
  end
end
