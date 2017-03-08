Rails.application.routes.draw do
  devise_for :staffs, controllers: {sessions: "staffs/sessions"}
  devise_for :users, controllers: {registrations: "users/registrations"}
  root "pages#home", page: "home"
  devise_scope :staff do
    get "staffs/pages/*page", to: "staffs/pages#show", page: "home", as: "staff_root"
  end
  namespace :admin do
    resources :orders, only: [:index]
    resources :users, only: [:index, :delete]
    resources :staffs, except: [:show]
  end
end
