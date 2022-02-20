Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, defaults: { format: :json }, 
  path: 'users',
  path_names: 
  { sign_in: 'signin',
    sign_out: 'signout', 
    registration: 'signup' }

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :reservations, only: %i[index create destroy]
      resources :houses, only: %i[index show create destroy]
    end
  end
end
