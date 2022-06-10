Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :chillis do
    resources :sales_chillis, only: %i[create]
  end
  resources :users, only: %i[show]
  resources :sales, only: %i[show]

  patch '/sales/:id' => 'sales#update', as: :update_basket
  get '/sales/:id' => 'sales#confirm', as: :order_confirmation
end
