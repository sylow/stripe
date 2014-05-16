StripeSample::Application.routes.draw do
  get "home/index"
  post 'stripe/webhook'
  devise_for :users
  resources :subscriptions
  
  root 'home#index'
end
