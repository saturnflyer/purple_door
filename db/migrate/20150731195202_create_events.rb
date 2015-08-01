class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.datetime :datetime
      t.string :name

      t.timestamps null: false
    end
  end
end
