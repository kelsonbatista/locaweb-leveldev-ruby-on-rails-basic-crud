Rails.application.routes.draw do
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "topics#index"

  # get "/topics", to: "topics#index"
  # post "/topics", to: "topics#create"
  # get "/topics/new", to: "topics#new", as: :new_topic
  # get "/topics/:id/edit", to: "topics#edit", as: :edit_topic
  # get "/topics/:id", to: "topics#show", as: :topic
  # patch "/topics/:id", to: "topics#update"
  # put "/topics/:id", to: "topics#update"
  resources :topics, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
