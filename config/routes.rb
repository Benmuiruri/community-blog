Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #API routes
  get '/api/users/:user_id/posts/', to: 'api_endpoints#user_posts'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :create, :new, :show, :destroy] do
      resources :comments, only: [:index, :create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end

  root to: 'users#index'
end
