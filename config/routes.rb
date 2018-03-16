Rails.application.routes.draw do

# devise用
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'users/registrations/show', to: 'users/registrations#show'
    get 'usres/registrations/change_password', to: 'users/registrations#change_password'
  end

# メール登録確認用
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

# 利用規約用
  get 'users/privacy_policy', to: 'users#privacy_policy'
  get 'users/terms_of_service', to: 'users#terms_of_service'

# like機能用
  post '/likes/:article_id', to: 'likes#like', as: 'like'
  delete '/likes/:article_id', to: 'likes#unlike', as: 'unlike'
  resources :user do
    resource :like, only: [:show]
  end

# index
  root 'articles#index'

  get 'home',                    to: 'header#home'
  get 'home/job',                to: 'header#job'
  get 'home/latest',             to: 'header#latest'
  get 'home/popular',            to: 'header#popular'
  get 'home/wanted',             to: 'header#wanted'
  get 'home/finished',           to: 'header#finished'
  get 'home/job/:id',            to: 'header#show', as: 'home_job_detail'
  get 'home/triplab',            to: 'header#triplab'
  get 'home/newcomer',           to: 'header#newcomer'
  get 'home/company',            to: 'header#company'
  get 'home/FAQ',                to: 'header#faq'
  get 'home/job/category/:id',   to: 'header#category', as: 'home_job_category'
end
