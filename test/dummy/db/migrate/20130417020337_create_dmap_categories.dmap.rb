# This migration comes from dmap (originally 20130412020210)
class CreateDmapCategories < ActiveRecord::Migration
  def change
    create_table :dmap_categories do |t|
      t.string :name, :default => ""

      t.timestamps
    end
  end
end
