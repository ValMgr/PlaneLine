Rails.application.routes.draw do
  root to: 'vols#index?page=1'
  resources :reservations
  devise_for :users
  resources :vols
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
