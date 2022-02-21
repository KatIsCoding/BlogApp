Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :comment]
  end
  post '/users/:user_id/posts/:id', to: 'comments#create'
  post '/like/:id', to: 'likes#create'
  root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
