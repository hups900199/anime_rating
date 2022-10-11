Rails.application.routes.draw do
  root to: "home#index"

  # get 'home/index'
  get 'about/index'
  get 'anime/index'
  get 'anime/show'

  resources :anime
end
