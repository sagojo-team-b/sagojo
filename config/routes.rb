Rails.application.routes.draw do

# devise用
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'users/registrations/show', to: 'users/registrations#show'
  end

# メール登録確認用
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

# 利用規約用
  get 'users/privacy_policy', to: 'users#privacy_policy'
  get 'users/terms_of_service', to: 'users#terms_of_service'

# 旅仕事記事用
  get 'work/recommend', to: 'articles#work_recommend'

# index
  root 'articles#index'
end
