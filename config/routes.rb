Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :pools do
    resources :reservations, only: [:new, :create, :edit, :update]
  end

  resources :reservations, only: [:index, :show, :destroy]
end
