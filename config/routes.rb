Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :admit do 
    root "restaurants#index"
  end
  root "restaurants#index"
end
