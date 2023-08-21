Rails.application.routes.draw do
  get 'reservation/index'
  get 'reservation/new'
  get 'reservation/create'
  get 'reservation/edit'
  get 'reservation/update'
  get 'reservation/show'
  get 'reservation/delete'
  get 'pools/index'
  get 'pools/new'
  get 'pools/create'
  get 'pools/edit'
  get 'pools/update'
  get 'pools/show'
  get 'pools/delete'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :reservations
  resources :pool
end
