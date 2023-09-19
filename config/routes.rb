Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments, only: [:create, :destroy], module: :posts
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
