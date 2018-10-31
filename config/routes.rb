Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :update, :create]
      resources :trips, only: [:index, :update]
      resources :flights, only: [:index, :update]
      resources :activities, only: [:index, :update]
      resources :hotels, only: [:index, :update]
      resources :restaurants, only: [:index, :update]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
