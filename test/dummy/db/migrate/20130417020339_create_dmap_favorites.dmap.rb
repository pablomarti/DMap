# This migration comes from dmap (originally 20130412021631)
class CreateDmapFavorites < ActiveRecord::Migration
  def change
    create_table :dmap_favorites do |t|
      t.references :post
      t.references :user, :polymorphic => true

      t.timestamps
    end
    add_index :dmap_favorites, :post_id
    add_index :dmap_favorites, :user_id
    add_index :dmap_favorites, :user_type
  end
end
