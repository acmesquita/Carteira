Rails.application.routes.draw do
  
  resources :dividendos
  devise_for :users
  resources :saldos
  resources :bancos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match '/dividendos/:id/pagar', to: 'dividendos#pagar', via: [:get],  as: "pagar"
  root 'dashboards#index'
end
