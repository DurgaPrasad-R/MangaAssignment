Rails.application.routes.draw do
  get 'comments/create'
  get 'ratings/create'
  devise_for :users
  root "mangas#index"
  resources :mangas do
    resources :chapters
    resources :ratings, only: [:create]
    resources :comments, only: [:create]
  end
end
