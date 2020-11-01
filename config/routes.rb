Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: [:show, :edit, :update]
  resources :notes do
    collection do
      get 'search'
      get 'dust'
    end
  end
  get '/:id', to: 'notes#throw'
  get '/notes/dust/:id', to: 'notes#revival'
  root to: "notes#index"
end
