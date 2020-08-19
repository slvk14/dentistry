
require 'sidekiq/web'
require 'sidekiq/cron/web'
Rails.application.routes.draw do
  devise_for :users
  mount Sidekiq::Web => '/sidekiq'

  # root to:

end
