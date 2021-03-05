Rails.application.routes.draw do
  resources :accounts
  resources :lesson_payments
  resources :bookings
  devise_for :users
  resources :courses
  resources :users, only: [:create, :index, :edit, :show, :update]
  get "home/activity"
  root "home#index"
  get 'privacy_policy', to: "static_pages#privacy_policy"

  resources :schedules
  resources :clients
  resources :trainers
  resources :lessons
  get "new_user", to: "users#new"
  get "create_user", to: "users#create"
end
