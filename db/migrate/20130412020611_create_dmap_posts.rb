class CreateDmapPosts < ActiveRecord::Migration
  def change
    create_table :dmap_posts do |t|
      t.references :category
      t.references :user, :polymorphic => true
      t.string :title, :default => ""
      t.text :description, :default => ""
      t.string :description_short, :default => ""
      t.boolean :active, :default => false
      t.datetime :published_at, :default => ""
      t.string :state, :default => ""
      t.string :slug, :default => ""

      t.timestamps
    end
    add_index :dmap_posts, :category_id
    add_index :dmap_posts, :user_id
    add_index :dmap_posts, :user_type
    add_index :dmap_posts, :title
    add_index :dmap_posts, :slug
  end
end
