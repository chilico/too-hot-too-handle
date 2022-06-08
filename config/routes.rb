Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :chillis
  resources :users, only: %i[show]
end
