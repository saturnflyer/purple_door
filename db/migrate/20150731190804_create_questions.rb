class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :worksheet_id
      t.string :description

      t.timestamps null: false
    end
  end
end
