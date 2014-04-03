Tweetvr::Application.routes.draw do
  root to: 'home#show'
  get 'dashboard', to: 'dashboards#show'
  get 'auth/twitter/callback', to: 'sessions#create'
end
