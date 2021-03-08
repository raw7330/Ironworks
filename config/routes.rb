Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to:"homes#top"

  resources :users, only: [:show, :edit, :update]
  get 'quit' => 'users#quit'
  patch 'out' => 'users#out'
  resources :items, only: [:index, :show, :edit, :update, :destroy, :new, :create] do
  resources :comments, only: [:create, :destroy]
  resources :bookmarks, only: [:index, :create, :destroy]
  end

  namespace :admins do
  resources :users, only: [:index, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  end
end
