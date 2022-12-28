Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  resources :lists, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :likes, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :index]
  resources :relationships, only: [:create, :destroy]
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  resources :contacts, only: [:new, :create]




end
