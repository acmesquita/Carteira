Rails.application.routes.draw do
  devise_for :users

  resources :dividendos
  resources :saldos
  resources :bancos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match '/dividendos/:id/pagar', to: 'dividendos#pagar', via: [:get],  as: "pagar"
  root 'dashboards#index'
end
