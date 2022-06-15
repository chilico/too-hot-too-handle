require "stripe_event"
Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :chillis do
    resources :sales_chillis, only: %i[create]
    resources :reviews, only: %i[new create]
  end
  resources :users, only: %i[show]
  resources :sales, only: %i[index show] do
    resources :payments, only: %i[new]
  end
  resources :sales_chillis, only: %i[update]
  delete '/sales_chillis/:id', to: 'sales_chillis#destroy', as: :remove_item

  mount StripeEvent::Engine, at: '/stripe-webhooks'

  patch '/sales/:id', to: 'sales#update', as: :update_basket
  get '/sales/:id/confirm', to: 'sales#confirm', as: :order_confirmation

  resources :chatrooms, only: %i[index show create] do
    resources :messages, only: :create
  end
end
