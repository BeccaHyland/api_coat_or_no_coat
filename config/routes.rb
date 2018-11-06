Rails.application.routes.draw do
  root 'dashboard#index'

  namespace :api do
    namespace :v1 do
      namespace :forecasts do
        get '/search', to: 'search#show'
      end
      resources :users, only: [:create]
      resources :sessions, only: [:create]
    end
  end
end
