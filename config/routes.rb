Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :pools do
    resources :reservations, only: [:create]
  end

  resources :reservations, only: [:index, :show, :edit, :destroy]
end
