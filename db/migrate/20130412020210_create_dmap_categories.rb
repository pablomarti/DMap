class CreateDmapCategories < ActiveRecord::Migration
  def change
    create_table :dmap_categories do |t|
      t.string :name, :default => ""

      t.timestamps
    end
  end
end
