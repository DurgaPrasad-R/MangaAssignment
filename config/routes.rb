Rails.application.routes.draw do
  devise_for :users
  root "mangas#index"
  resources :mangas do
    resources :chapters
  end
end
