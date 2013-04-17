module Dmap
  class Favorite < ActiveRecord::Base
    
    belongs_to :post
    belongs_to :user, :polymorphic => true
    
    attr_accessible :post_id, :user_id, :user_type

  end
end
