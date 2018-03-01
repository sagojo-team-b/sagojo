Rails.application.routes.draw do
  root 'articles#index'
  get 'home'          => 'header#home'
  get 'home/job'      => 'header#job'
  get 'home/triplab'  => 'header#triplab'
  get 'home/newcomer' => 'header#newcomer'
  get 'home/company'  => 'header#company'
  get 'home/FAQ'      => 'header#faq'
end
