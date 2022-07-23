Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  get '/api/users/:user_id/posts/', to: 'api_endpoints#user_posts'
  get '/api/users/:user_id/posts/:post_id/comments', to: 'api_endpoints#user_post_comments'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :create, :new, :show, :destroy] do
      resources :comments, only: [:index, :create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end

  root to: 'users#index'
end
