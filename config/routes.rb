Rails.application.routes.draw do



  resources :users, only: [:new, :create, :show]
  resource :session
  resources :goals
end
