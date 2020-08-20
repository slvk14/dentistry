require 'sidekiq/web'
require 'sidekiq/cron/web'
Rails.application.routes.draw do
  devise_for :users
  mount Sidekiq::Web => '/sidekiq'

  root to: 'clients#index'

  resources :clients
  resources :doctors
  resources :procedures
  resources :appointments
end
