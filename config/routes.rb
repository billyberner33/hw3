Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "places#index"

  get "/places", to: "places#index"
  get "/places/new", to: "places#new"
  post "/places", to: "places#create"
  get "/places/:id", to: "places#show"

   get "/entries/new", to: "entries#new"
  post "/entries", to: "entries#create"

  # Defines the root path route ("/")
  # get("/", { :controller => "articles", :action => "index" })
end
