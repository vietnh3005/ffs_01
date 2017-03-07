Rails.application.routes.draw do
  devise_for :staffs, controllers: {sessions: "staffs/sessions"}
  devise_for :users, controllers: {registrations: "users/registrations"}
  root "pages#home", page: "home"
  devise_scope :staff do
    get "staffs/pages/*page", to: "staffs/pages#show", page: "home", as: "staff_root"
  root "pages#show", page: "home"
  end

  namespace :admin do
    resources :users
  end
end
