Rails.application.routes.draw do
  devise_for :members
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :hot_spots, only: %[index]

  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resources :users, only: %i[show create]
      resources :hot_spots
    end
  end
end
