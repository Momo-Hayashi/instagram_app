Rails.application.routes.draw do
  get 'sessions/new'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :posts do
    collection do
      post :confirm
    end
  end
  root 'posts#index'
end
