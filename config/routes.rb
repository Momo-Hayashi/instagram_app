Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts do
    collection do
      post :confirm
    end
  end
  root 'posts#index'
end
