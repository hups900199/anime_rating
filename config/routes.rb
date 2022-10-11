Rails.application.routes.draw do
  root "anime#index"

  get 'anime/index'
  get 'anime/show'

  resources :anime
end
