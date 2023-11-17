Rails.application.routes.draw do
  # Defines the root path route ("/")
  root to: "home#index"

  get '/about', to: "home#about"

  resources :owners, only: [:index, :show] do
    # :owner_id ->
    # /owners/

    resources :pets, only: [:index, :show]
  end

  resources :animals, only: [:index, :show]
end
