Rails.application.routes.draw do
  
  # pages routes
  # Defines the root path route ("/")
  root "pages#index"

  # pages routes
  get "about",        to: "pages#about"
  get "services",     to: "pages#services"
  get "contact",      to: "pages#contact"
  get "testimonials", to: "pages#testimonials"
  get "privacy",      to: "pages#privacy"


  # user routes
  # resources :users, only: %i[new create show]
  get "user/index", to: "user#index"
  get "user/new", to: "user#new"
  post "user/create", to: "user#create"
  get "user/:id", to: "user#show", as: "user_show"
  get "user/:id/edit", to: "user#edit", as: "user_edit"
  patch "user/:id", to: "user#update", as: "user_update"
  delete "user/:id", to: "user#destroy", as: "user_delete"
  get "user/search", to: "user#search", as: "user_search"
  
  # signup routes
  get "signup", to: "users#new"
  post "signup", to: "user#create"

end
