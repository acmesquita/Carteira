Rails.application.routes.draw do
  devise_for :users

  resources :dividendos
  resources :saldos
  resources :bancos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/saldo/new', to: 'saldo#new'
  post '/saldo/create', to: 'saldo#create'
  match '/dividendos/:id/pagar', to: 'dividendos#pagar', via: [:get],  as: "pagar"
  root 'dashboards#index'
end
