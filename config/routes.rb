Rails.application.routes.draw do
  get 'genres/index'
  get 'types/index'
  root to: "home#index"

  # get 'home/index'
  get 'about/index'
  get 'anime/index'
  get 'anime/show'
  get 'users/index'
  get 'users/show'

  resources :types, only: [:index]
  resources :genres, only: [:index]

  resources :anime, only: [:index, :show] do
    #movies/search/(:format)
    collection do
      get "search"
    end

    get '/page/:page', action: :index, on: :collection
  end

  resources :users, only: [:index, :show] do
    get '/page/:page', action: :index, on: :collection
  end
end
