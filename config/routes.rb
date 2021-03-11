Rails.application.routes.draw do
  root 'pages#home'

  resources :hosts
  resources :listings
end
