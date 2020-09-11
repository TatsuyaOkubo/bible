Rails.application.routes.draw do
  devise_for :users
  get 'notes/index'
  root to: "notes#index"
end
