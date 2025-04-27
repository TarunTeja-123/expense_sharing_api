# frozen_string_literal: true

Rails.application.routes.draw do
  resources :expenses, only: %i[index create]
  resources :users, only: %i[create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
