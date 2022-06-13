Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :chillis do
    resources :sales_chillis, only: %i[create]
  end
  resources :users, only: %i[show]
  resources :sales, only: %i[index show]

  patch '/sales/:id', to: 'sales#update', as: :update_basket
  get '/sales/:id/confirm', to: 'sales#confirm', as: :order_confirmation
end
