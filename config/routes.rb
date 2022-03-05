Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "registrations"
  }
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :comment, :destroy]
  end
  post '/users/:user_id/posts/:id', to: 'comments#create'
  post '/like/:id', to: 'likes#create'
  delete '/deletecomment/:comment_id', to: 'comments#destroy'
  root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
