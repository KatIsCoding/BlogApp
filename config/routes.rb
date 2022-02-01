Rails.application.routes.draw do
  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'
  root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
