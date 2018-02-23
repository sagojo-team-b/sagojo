Rails.application.routes.draw do
  devise_for :users

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :users, only: [:edit, :update]
  get 'users/identify', to: 'users#identify'
  get 'users/complete', to: 'users#complete'

  root 'articles#index'
end
