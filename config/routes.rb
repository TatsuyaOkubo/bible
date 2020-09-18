Rails.application.routes.draw do
  devise_for :users
  resources :notes
  get '/:id', to: 'notes#throw'
  root to: "notes#index"
  resources :users, only: [:show, :edit, :update]
end
