StripeSample::Application.routes.draw do
  get "home/index"
  post 'callback/index'
  devise_for :users
  resources :subscriptions
  
  root 'home#index'
end
