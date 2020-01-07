Rails.application.routes.draw do
  get 'logs/index'
  devise_for :employees
  root :to => 'logs#index'
  resources :commit_webhooks, only: %i[create]
end
