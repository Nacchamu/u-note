Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'notes#index'
  get 'search' => 'notes#search'
  devise_for :users, controllers: {
    registrations:  "users/registrations",
    sessions:       "users/sessions",
    passwords:      "users/passwords"
  }
  resources :notes, only: [:index, :show, :new, :create] do
    resources :favorites, only: [:create, :update, :destroy]
  end
  get 'mypages/pv' => 'mypages#pv'
  get 'mypages/favorite' => 'mypages#favorite'
  resources :mypages, only: [:show]
end
