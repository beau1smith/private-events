Rails.application.routes.draw do
  get 'site/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users
  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "site#index"
end
