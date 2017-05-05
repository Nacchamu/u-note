Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'notes#index'
  devise_for :users
  resources :notes, only:[:index, :show, :new, :create]
  resources :mypages, only:[:favorite, :pv, :show] do
    get 'favorite'
    get 'pv'
  end
end
