Rails.application.routes.draw do
  get 'notes/index'
  root to: "notes#index"
end
