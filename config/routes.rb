Rails.application.routes.draw do
  root 'articles#index'
  
  # 仮ルーティング作成
  resource :articles, only: [:index, :show]
  get 'articles/privacy_policy', to: 'articles#privacy_policy'
  
  get 'work/recommend', to: 'articles#work_recommend'
end
