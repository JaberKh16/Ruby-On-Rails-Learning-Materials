Rails.application.routes.draw do
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

 
  # Defines the root path route ("/")
  # root "posts#index"

  # creating a book route
  namespace :api do
    namespace :v1 defaults: { format: :json } do 
      # books routes
      resources :books, only: [:index, :create, :show, :edit, :update, :destroy]

      # archive routes
      resources :archive, only: [:index, :create, :show, :edit, :update, :destroy]

    end
  end



  # bands routes
  get    "/api/v1/bands/index",       to: "api/v1/bands#index"
  post   "/api/v1/bands/create",      to: "api/v1/bands#create"
  get    "/api/v1/bands/:id/show",    to: "api/v1/bands#show"
  get    "/api/v1/bands/:id/edit",    to: "api/v1/bands#edit"
  put    "/api/v1/bands/:id/update",  to: "api/v1/bands#update"
  delete "/api/v1/bands/:id/destroy", to: "api/v1/bands#destroy"


end
