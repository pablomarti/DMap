Dmap::Engine.routes.draw do
  
  resources :categories

  get 'get_all_tags', to: 'posts#get_all_tags'
  get 'tags/:tag', to: 'posts#index', as: :tag

  resources :posts
  get 'personal_posts', to: 'posts#personal', as: :personal_posts
  get 'favorites', to: 'posts#favorites', as: :favorites
  get 'add_to_favorites/:id/:kind', to: 'posts#add_to_favorites', as: :add_to_favorites

  root :to => 'posts#index'

end
