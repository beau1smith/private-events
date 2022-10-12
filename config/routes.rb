Rails.application.routes.draw do
  get 'site/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users, except: [:index, :delete]
  resources :events do
    member do
      get 'rsvp'
      get 'cancel_rsvp'
    end
  end

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "site#index"
end
