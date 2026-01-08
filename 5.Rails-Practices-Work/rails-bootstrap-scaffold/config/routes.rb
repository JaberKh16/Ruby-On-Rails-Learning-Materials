Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/about'
  get 'pages/services'
  get 'pages/contact'
  get 'pages/privacy'
  get 'pages/testimonials'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
