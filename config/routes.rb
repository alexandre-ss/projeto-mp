Rails.application.routes.draw do
  resources :ratings
  root "homepage#index"

  devise_for :users #do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  #   get '/users/sign_in' => 'devise/sessions#create'
  # end
  resources :songs
  #resources :interests
  post 'create_interests', to: 'interests#create'
  get 'index_interests', to: 'interests#index', as: :index
  patch 'update_interests', to: 'interests#update'

  post 'create_rating', to: 'ratings#create'
  patch 'update_rating', to: 'ratings#update'

  get 'most_popular', to: 'songs#most_popular', as: :most_popular
  get 'user_dashboard', to: 'dashboards#dashboard', as: :user_dashboard
end
