Rails.application.routes.draw do
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

 
  # Defines the root path route ("/")
  # root "posts#index"

  # creating a book route
  namespace :api do
    namespace :v1 do 
      # books routes
      resources :books, only: [:index, :create, :show, :edit, :update, :destroy]

      # archive routes
      resources :archive, only: [:index, :create, :show, :edit, :update, :destroy]
    end
  end

end
