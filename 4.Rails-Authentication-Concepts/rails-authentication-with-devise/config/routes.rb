Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # user routes
      get "/user/index", to:"user#index"
      post "/user/create", to:"user#create"
      put "/user/update", to:"user#update"
      delete "/user/destroy", to:"user#destroy"

      get "/user/authenticated_user", to:"user#get_authenticated_user"
      get "/user/check_whether_the_token_exists_for_the_user", to:"user#check_whether_the_token_exists_for_the_user"


      # notes routes
      resources :todos

    end
  end

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions',
  #   registrations: 'users/registrations'
  # }

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # get the current user
  get '/current_user', to: 'current_user#index'

  # Defines the root path route ("/")
  root "home#index"
end
