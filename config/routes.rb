Rails.application.routes.draw do
  root to: 'questions#index'

  resources :questions
  resource :session, only: %i[new create destroy]
  resources :users, param: :nickname, except: %i[index]
  resources :quest_tags, param: :name, only: %i[show index]
end
