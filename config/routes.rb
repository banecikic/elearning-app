Rails.application.routes.draw do
  devise_for :users
  resources :courses
  resources :users, only: [:index]
  root "home#index"
  get 'privacy_policy', to: "static_pages#privacy_policy"

end
