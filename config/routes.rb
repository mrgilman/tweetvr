Tweetvr::Application.routes.draw do
  root to: 'home#index'
  resources :sessions, only: [:new]
  get 'auth/twitter/callback', to: 'sessions#create'
end
