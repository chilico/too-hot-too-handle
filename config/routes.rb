require "stripe_event"
Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :chillis do
    resources :sales_chillis, only: %i[create]
  end
  resources :users, only: %i[show]
  resources :sales, only: %i[show] do
    resources :payments, only: :new
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'

  patch '/sales/:id', to: 'sales#update', as: :update_basket
  get '/sales/:id/confirm', to: 'sales#confirm', as: :order_confirmation
end
