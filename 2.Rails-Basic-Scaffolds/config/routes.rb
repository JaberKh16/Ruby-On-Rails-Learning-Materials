Rails.application.routes.draw do
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # defining routes
  get 'home/about'


  # Defines the root path route ("/")
  root to: "home#index"
  
end
