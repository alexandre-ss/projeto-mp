Rails.application.routes.draw do
  resources :ratings
  root "songs#index"

  devise_for :users
  resources :songs
  #resources :interests
  post 'create_interests', to: 'interests#create'
  get 'index_interests', to: 'interests#index'
  patch 'update_interests', to: 'interests#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'create_rating', to: 'ratings#create'
  patch 'update_rating', to: 'ratings#update'
end
