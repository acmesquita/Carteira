Rails.application.routes.draw do
  
  devise_for :users
  resources :saldos
  resources :bancos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dashboards#index'
end
