Rails.application.routes.draw do
  # Set the root path to the places index
  root "places#index"

  # Places routes
  resources :places do
    # Nested routes for entries under places
    resources :entries, only: [:new, :create]
  end
end
