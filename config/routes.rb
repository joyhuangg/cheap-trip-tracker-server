Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
      get '/current_user', to: "auth#show"
      # get '/yelp_restaurants', to: 'restaurants#yelp_restaurants'
      resources :users, only: [:index, :update, :create]
      resources :trips
      resources :trip_hotels
      resources :trip_restaurants
      resources :flights
      resources :activities, only: [:index, :update]
      resources :hotels
      resources :restaurants
      get '/profile', to: 'users#profile'
    end
  end
end
