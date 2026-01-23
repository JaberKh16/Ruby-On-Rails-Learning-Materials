Rails.application.routes.draw do
  # Sessions (login/logout)
  get "/login",  to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  
  # define routes for blog resource
  root 'blog#index'


  get '/blog/show', to: 'blog#show'
  get '/blog/:id', to:'blog#edit'
  put '/blog/:id', to: 'blog#update'
  delete '/blog/:id', to: 'blog#destroy'

  resources :comments

  resources :users

  get '/profile', to: 'users#show', as: :profile
  delete '/profile/delete', to: 'users#destroy', as: :delete_profile
  
 
  # Defines the root path route ("/")
  # root "posts#index"
end
