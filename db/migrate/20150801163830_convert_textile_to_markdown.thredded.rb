# This migration comes from thredded (originally 20131029034507)
class ConvertTextileToMarkdown < ActiveRecord::Migration
  def up
    execute <<-sql
      UPDATE thredded_posts SET filter='markdown' WHERE filter = 'textile'
    sql
  end
end
