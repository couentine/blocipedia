Rails.application.routes.draw do
  devise_for :users
  resources :wikis
  resources :users, only: [:update]
  
  get 'welcome/index'
  
root 'welcome#index'

end

