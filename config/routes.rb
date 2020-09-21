Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :notes do
    collection do
      get 'search'
    end
  end
  get '/notes/dust', to: 'notes#dust'
  get '/:id', to: 'notes#throw'
  get '/notes/dust/:id', to: 'notes#revival'
  root to: "notes#index"
end
