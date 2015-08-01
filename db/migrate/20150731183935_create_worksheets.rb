class CreateWorksheets < ActiveRecord::Migration
  def change
    create_table :worksheets do |t|
      t.text :summary
      t.string :title

      t.timestamps null: false
    end
  end
end
