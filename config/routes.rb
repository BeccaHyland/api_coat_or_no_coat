Rails.application.routes.draw do
  root 'dashboard#index'

  namespace :api do
    namespace :v1 do
      namespace :forecasts do
        get '/search', to: 'search#show'
      end
    end
  end
end
