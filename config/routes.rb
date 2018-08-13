# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users do
    get :login, on: :collection
  end

  resources :workout_executions, only: [:index, :new, :create]

  root to: "users#login"
  get "/signin"                   => "sessions#new", as: :signin
  get "/signout"                  => "sessions#destroy", as: :signout
  get "/auth/:provider/callback"  => "sessions#create" # github provider
  post "/auth/:provider/callback" => "sessions#create" # developer provider
  get "/auth/failure"             => "sessions#failure"
end
