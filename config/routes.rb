Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :v1 do 
    resources :houses, only: [:index, :show, :create, :destroy]
    resources :reservations, only: [:index, :show, :create, :destroy]
  end
end
