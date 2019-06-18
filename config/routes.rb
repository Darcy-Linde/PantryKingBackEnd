Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show]
      resources :ingredients, only: [:index, :create]
      resources :pantries, only: [:index, :create, :update, :destroy]
      resources :recipes, only: [:index, :create]
      resources :cookbooks, only: [:index, :create, :destroy]
      resources :meals, only: [:index, :create]
      post '/login', to: 'auth#create', as: 'login'
    end
  end
end
