Rails.application.routes.draw do
  devise_for :users
  resources :notes
  root to: "notes#index"
  resources :users, only: [:edit, :update]
end
