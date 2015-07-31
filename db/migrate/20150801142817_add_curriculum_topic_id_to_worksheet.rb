class AddCurriculumTopicIdToWorksheet < ActiveRecord::Migration
  def change
    add_column :worksheets, :topic_id, :integer
  end
end
