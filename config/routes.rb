Rails.application.routes.draw do
  root to: "home#index"

  # get 'home/index'
  get 'about/index'
  get 'anime/index'
  get 'anime/show'

  resources :anime, only: [:index, :show] do
    #movies/search/(:format)
    collection do
      get "search"
    end
  end
end
