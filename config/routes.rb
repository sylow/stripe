StripeSample::Application.routes.draw do
  devise_for :users
  resources :subscriptions

  post 'stripe/webhook'
  root 'home#index'
end
