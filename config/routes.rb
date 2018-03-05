Rails.application.routes.draw do
  root 'articles#index'
  # 仮ルーティング作成
  resource :articles, only: [:index, :show]
end
