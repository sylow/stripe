StripeSample::Application.routes.draw do
  devise_for :users
  resources :subscriptions
  
  root 'subscriptions#index'
end
