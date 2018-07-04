Rails.application.routes.draw do
  root 'homes#index'
  resources :homes do
    collection do
      get 'index'
      post 'index'
    end
  end
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :categories
  resources :adsenses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
