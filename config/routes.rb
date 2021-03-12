Rails.application.routes.draw do
  root 'hosts#new'

  get 'apis', to: 'pages#home', as: :home

  resources :hosts
  resources :listings
end
