Rails.application.routes.draw do
  root 'homes#index'
  resources :homes
  devise_for :users
  resources :categories
  resources :adsenses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
