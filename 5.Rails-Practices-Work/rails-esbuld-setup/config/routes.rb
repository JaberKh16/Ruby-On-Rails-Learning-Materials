Rails.application.routes.draw do
  
  # pages routes
  # Defines the root path route ("/")
  root "pages#index"

  get "about",        to: "pages#about"
  get "services",      to: "pages#services"
  get "contact",      to: "pages#contact"
  get "testimonials", to: "pages#testimonials"
  get "privacy",      to: "pages#privacy"
  
end
