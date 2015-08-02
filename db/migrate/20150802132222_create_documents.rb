class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :url
      t.string :title
      t.belongs_to :topic

      t.timestamps null: false
    end
  end
end
