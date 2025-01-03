# frozen_string_literal: true
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#index'

  resources :players
  resources :fights, except: %i[update delete]
  resources :items, only: %i[index]
  resources :weapons, only: %i[show]
  resources :shields, only: %i[show]
end
