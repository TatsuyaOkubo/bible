Rails.application.routes.draw do
  devise_for :users
  resources :notes
  get 'notes/:id', to: 'notes#trash'
  root to: "notes#index"
  resources :users, only: [:show, :edit, :update]
end
