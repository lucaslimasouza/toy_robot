# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'robots#index'
  resources :robots, only: [:index]
end
