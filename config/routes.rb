Rails.application.routes.draw do
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: "user_sessions#destroy"
  post 'guest_login', to: 'user_sessions#guest_login'

  root 'tops#index'

  resources :drummers, only: [:index, :show] do
    collection do
      get :search
    end
  end
  resources :users, only: [:new, :create, :show, :edit, :update] do
    member do
      get :activate
    end
  end
  resources :contacts, only: [:new, :create]
  resources :password_resets, only: [:new, :create, :edit, :update]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
