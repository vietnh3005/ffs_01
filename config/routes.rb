Rails.application.routes.draw do
  root "pages#show", page: "home"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
