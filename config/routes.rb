Rails.application.routes.draw do
  devise_for :staffs, controllers: {sessions: "staffs/sessions"}
  devise_for :users, controllers: {registrations: "users/registrations"}
  root "products#index"
  devise_scope :staff do
    get "staffs/pages/*page", to: "staffs/pages#show", page: "home", as: "staff_root"
  end
  namespace :admin do
    resources :orders, only: [:index, :edit, :update]
    resources :users, only: [:index, :destroy]
    resources :staffs, except: [:show]
    resources :products, except: [:show]
    resources :categories
    resources :discounts
    get "chefs/*page", to: "chefs#index", page: "index", as: "chef_order"
  end

  resources :products, only: [:show, :index]
  resources :order_details, except: [:show]
  resources :orders
end
