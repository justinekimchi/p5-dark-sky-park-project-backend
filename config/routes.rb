Rails.application.routes.draw do
  resources :visitors, only: [:index, :show, :create, :update, :destroy]  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :comments, only: [:index, :show, :create]
  resources :bucketlist_locations, only: [:index, :create, :update, :destroy]
  get '/about', to: 'static#about', as: 'about'
  resources :dark_sky_parks, only: [:index,:show] do
    resources :likes, only: [:index, :create, :destroy]  
end
end