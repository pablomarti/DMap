# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130417020339) do

  create_table "dmap_categories", :force => true do |t|
    t.string   "name",       :default => ""
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "dmap_favorites", :force => true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.string   "user_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "dmap_favorites", ["post_id"], :name => "index_dmap_favorites_on_post_id"
  add_index "dmap_favorites", ["user_id"], :name => "index_dmap_favorites_on_user_id"
  add_index "dmap_favorites", ["user_type"], :name => "index_dmap_favorites_on_user_type"

  create_table "dmap_posts", :force => true do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "title",             :default => ""
    t.text     "description",       :default => ""
    t.string   "description_short", :default => ""
    t.boolean  "active",            :default => false
    t.datetime "published_at"
    t.string   "state",             :default => ""
    t.string   "slug",              :default => ""
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "dmap_posts", ["category_id"], :name => "index_dmap_posts_on_category_id"
  add_index "dmap_posts", ["slug"], :name => "index_dmap_posts_on_slug"
  add_index "dmap_posts", ["title"], :name => "index_dmap_posts_on_title"
  add_index "dmap_posts", ["user_id"], :name => "index_dmap_posts_on_user_id"
  add_index "dmap_posts", ["user_type"], :name => "index_dmap_posts_on_user_type"

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "roles_n_rt_rid"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "simple_user_admin_users", :force => true do |t|
    t.string   "email",                  :default => "",   :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.boolean  "active",                 :default => true
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "simple_user_admin_users", ["email"], :name => "index_simple_user_admin_users_on_email", :unique => true
  add_index "simple_user_admin_users", ["reset_password_token"], :name => "index_simple_user_admin_users_on_reset_password_token", :unique => true

  create_table "simple_user_authentications", :force => true do |t|
    t.string   "provider"
    t.string   "token"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "simple_user_authentications", ["user_id"], :name => "index_simple_user_authentications_on_user_id"

  create_table "simple_user_users", :force => true do |t|
    t.string   "email",                  :default => "",   :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.boolean  "active",                 :default => true
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "simple_user_users", ["email"], :name => "index_simple_user_users_on_email", :unique => true
  add_index "simple_user_users", ["reset_password_token"], :name => "index_simple_user_users_on_reset_password_token", :unique => true

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "simple_user_admin_user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["simple_user_admin_user_id", "role_id"], :name => "user_role_i_auid_urid"

end
