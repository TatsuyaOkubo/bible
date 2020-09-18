Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :notes do
    collection do
      get 'dust'
    end
  end
  get '/:id', to: 'notes#throw'
  root to: "notes#index"
end
