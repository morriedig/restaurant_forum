Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update]
  resources :followships, only: [:create, :destroy]
  
  resources :restaurants, only: [:index, :show] do
    resources :comments , only: [:create, :destroy]
    collection do
      get :feeds
    end

    member do
      get :dashboard
      post :favorite
      post :like
    end
  end
  resources :categories, only: :show

  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end
  
  


  root "restaurants#index"
end
