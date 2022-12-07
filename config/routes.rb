Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "/dashboard", to: "pages#dashboard"
  get "/profile", to: "pages#profile"

  get "/tours/:id/lock", to: "tours#lock"
  get "/tours/:id/blog_view", to: "tours#show_notes", as: "tours_show_notes"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :tours, only: %i[new create] do
    resources :tour_users, only: %i[new create]
  end

  resources :tours, except: %i[new create] do
    resources :sites, only: %i[new create]
  end
  # Defines the root path route ("/")
  # root "articles#index"
  resources :sites, only: %i[show edit update destroy] do
    resources :notes, only: %i[new create]
  end

  resources :notes, only: %i[edit update destroy]

  resources :tour_users, only: :destroy

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

end
