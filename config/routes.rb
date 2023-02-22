Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :restaurants, only: [:new, :create, :show, :index] do
    resources :reviews, only: [:new, :create, :show, :index]
  end
end
