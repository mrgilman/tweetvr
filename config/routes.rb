Tweetvr::Application.routes.draw do
  root to: 'sessions#new'
  get 'auth/twitter/callback', to: 'sessions#create'
end
