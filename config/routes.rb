require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  
  post 'authenticate', to: 'authentication#authenticate'

  resources :users

  namespace :api do
    namespace :v1 do
      resources :products
      resources :buys do
        get :most_purchased_products_by_category, on: :collection
        get :get_three_products_with_the_most_profit_by_category, on: :collection
        get :get_total_buys_by_granularity, on: :collection
      end
    end
  end 
end
