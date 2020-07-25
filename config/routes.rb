Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  namespace :api,  constraints: { format: 'json' }  do
    namespace :v1 do
      resources :users, only: [:show, :create]
      resources :hot_spots
    end 
  end
end
