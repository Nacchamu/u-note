Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'notes#index'
  get 'search' => 'notes#search'
  get 'category_search/:id' => 'notes#category_search'
  devise_for :users
  resources :notes, only: [:index, :show, :new, :create] do
    resources :favorites, only: [:create, :update, :destroy]
  end
  get 'mypages/pv' => 'mypages#pv'
  get 'mypages/favorite' => 'mypages#favorite'
  resources :mypages, only: [:show]
end
