Rails.application.routes.draw do

  root to: "home#index"
  get 'home/about' => 'home#about'
  get 'users/follows/:id' => 'users#follow', as: 'follow'
  get 'users/followers/:id' => 'users#follower', as: 'follower'
  resources :home, only: [:index, :about]
  devise_for :users
  resources :users ,only: [:index, :show, :edit,:update, :follow, :follower]
  resources :relationships, only: [:create, :destroy]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
