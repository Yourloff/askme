Rails.application.routes.draw do
  root to: 'questions#index'

  resources :questions
  resource :session, only: [:new, :create, :destroy]
  resources :users, param: :nickname, except: [:index]

  get 'questions/hashtag/:name', to: 'questions#show_hashtags'
end
