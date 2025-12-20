Rails.application.routes.draw do
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

 
  # Defines the root path route ("/")
  # root "posts#index"

  # creating a book route
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
 

end
