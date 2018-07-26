# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users do
    get :login, on: :collection
  end

  resources :exercises, only: :index

  root to: "users#login"
  get "/signin"                  => "sessions#new", as: :signin
  get "/signout"                 => "sessions#destroy", as: :signout
  get "/auth/:provider/callback" => "sessions#create"
  get "/auth/failure"            => "sessions#failure"
end
