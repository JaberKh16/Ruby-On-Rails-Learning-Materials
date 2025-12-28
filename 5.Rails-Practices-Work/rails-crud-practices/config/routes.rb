Rails.application.routes.draw do
  
  get '/blog/index', to: 'blog#index'
  get '/blog/show', to: 'blog#show'
  get '/blog/:id', to:'blog#edit'
  put '/blog/:id', to: 'blog#update'
  delete '/blog/:id', to: 'blog#destroy'

  resources :comments

  resources :users
 
  # Defines the root path route ("/")
  # root "posts#index"
end
