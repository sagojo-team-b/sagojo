Rails.application.routes.draw do
  root 'articles#index'
  get 'home',          to: 'header#home'
  get 'home/job',      to: 'header#job'
  get 'home/triplab',  to: 'header#triplab'
  get 'home/newcomer', to: 'header#newcomer'
  get 'home/company',  to: 'header#company'
  get 'home/FAQ',      to: 'header#faq'
end
