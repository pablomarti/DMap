module Dmap
  class Post < ActiveRecord::Base
    
    belongs_to :category
    belongs_to :user, :polymorphic => true
    
    attr_accessible :active, :description, :description_short, :published_at, :slug, :state, :title
    attr_accessible :category_id, :user_id, :user_type

  end
end
