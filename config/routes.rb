Rails.application.routes.draw do
  resources :enrollments
  devise_for :users
  resources :courses do
    resources :lessons
    resources :enrollments, only: [:new, :create]
  end
  resources :users, only: [:index, :edit, :show, :update]
  get 'activity', to: 'home#activity'
  root "home#index"
  get 'privacy_policy', to: "static_pages#privacy_policy"
end
