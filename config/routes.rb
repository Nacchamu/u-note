Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'notes#index'
  get 'search' => 'notes#search'
  devise_for :users
  resources :notes, only: [:index, :show, :new, :create] do
    resources :favorites, only: [:create, :update, :destroy]
  end
  resources :mypages, only: [:index, :pv, :show] do
    get 'pv'
  end
end
