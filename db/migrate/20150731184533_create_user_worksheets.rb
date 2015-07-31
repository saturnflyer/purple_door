class CreateUserWorksheets < ActiveRecord::Migration
  def change
    create_table :user_worksheets do |t|
      t.integer :worksheet_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
