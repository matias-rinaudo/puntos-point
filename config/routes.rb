Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'

  resources :users

  namespace :api do
    namespace :v1 do
      resources :products
    end
  end 
end
