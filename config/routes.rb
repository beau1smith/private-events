Rails.application.routes.draw do
  get 'site/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users
  resources :events do
    member do
      get 'rsvp'
      get 'cancel_rsvp'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "site#index"
end
