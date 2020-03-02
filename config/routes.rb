Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :appointments
  resources :availibilities
  root to: 'home#index'
  resources :doctors, only: [] do 
    resources :availabilities
  end
end
