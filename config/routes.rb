Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :comment]
  end
  post '/users/:user_id/posts/:id', to: 'posts#create_comment'
  post '/like/:id', to: 'posts#add_like'
  root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
