Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show]
      resources :ingredients, only: [:index, :create, :show]
      resources :pantries, only: [:index, :create, :show, :update, :destroy]
      resources :recipes, only: [:index, :create, :show]
      resources :cookbooks, only: [:index, :create, :show, :update, :destroy]
      post '/login', to: 'auth#create', as: 'login'
    end
  end
end
