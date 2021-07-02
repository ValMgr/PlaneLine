Rails.application.routes.draw do
  root to: 'vols#index'
  resources :reservations
  resources :vols
  devise_for :user
  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy', as: :signout
    get "/login" => "devise/sessions#new"
    get "/register" => "devise/registrations#new"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
