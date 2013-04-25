Fruitly::Application.routes.draw do
  #products
  resources :products, only: [:index,:show] do
    #add and delete things from basket
    resource :basket, only: [:create, :destroy]
  end
  #orders
  resources :orders, only: [:show, :new, :create]
  #homepage
  root to: "products#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
