# This migration comes from thredded (originally 20140829155857)
require 'thredded/category'

class AddSlugToThreddedCategories < ActiveRecord::Migration
  def up
    add_column :thredded_categories, :slug, :string, limit: (191 if connection.adapter_name.downcase =~ /mysql/)
    add_index :thredded_categories, [:messageboard_id, :slug], unique: true

    if defined?(Thredded::Category)
      Thredded::Category.all.each do |category|
        category.save!
      end
    end

    change_column_null :thredded_categories, :slug, false
  end

  def down
    remove_column :thredded_categories, :slug
  end
end
