Rails.application.routes.draw do
  root "static_pages#home"

  devise_for :users, controllers: {omniauth_callbacks: "users/callbacks"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :places, only: :show

  namespace :admin do
    resources :business_types
  end
end
