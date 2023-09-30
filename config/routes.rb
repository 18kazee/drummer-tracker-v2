# frozen_string_literal: true

Rails.application.routes.draw do
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  post 'guest_login', to: 'user_sessions#guest_login'

  get '/drummers/:id/modal', to: 'drummers#modal', as: 'modal'

  root 'tops#index'

  resources :drummers, only: %i[index show] do
    collection do
      get :search
    end
  end
  resources :users, only: %i[new create show edit update] do
    member do
      get :activate
    end
  end
  resources :contacts, only: %i[new create]
  resources :password_resets, only: %i[new create edit update]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
