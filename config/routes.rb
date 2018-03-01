Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'users/registrations/show' => 'users/registrations#show'
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root 'articles#index'
end
