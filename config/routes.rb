Rails.application.routes.draw do
  root 'notes#index'
  devise_for :users
  resources :note, only:[:index, :show, :new]
  resources :mypage, only:[:favorite, :pv] do
    get 'favorite'
    get 'pv'
  end
end
