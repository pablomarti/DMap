Rails.application.routes.draw do

  mount Dmap::Engine => "/dmap", :as => "dmap"
  mount SimpleUser::Engine => "/simple_user", :as => "simple_user"

  root :to => 'welcome#index'
  
end
