Rails.application.routes.draw do
  devise_for :employees
  root :to => 'homes#index'
  resources :commit_webhooks, only: %i[create]
end
