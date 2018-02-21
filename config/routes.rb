Rails.application.routes.draw do
  root 'articles#index'
  get 'work/recommend' => 'articles#work_recommend'
end
