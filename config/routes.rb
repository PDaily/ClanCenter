Rails.application.routes.draw do
  
  resources :site_news, path: 'news'

  # Sideqik Web Monitoring Panel Route
  require 'sidekiq/web'
  authenticate :user, lambda { |u| u.has_role?(:admin) } do
    mount Sidekiq::Web => '/sidekiq'
  end
  
  # Rails_admin Panel Route
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  # Game Sessions Routes
  get 'gamesessions/update_games', to: 'game_sessions#update_games', as: 'update_games'
  post 'gamesessions/:id/join_game', to: 'game_sessions#join_game', as: 'join_game'
  post 'gamesessions/:id/leave_game', to: 'game_sessions#leave_game', as: 'leave_game'
  post 'gamesessions/:id/end_game', to: 'game_sessions#end_game', as: 'end_game'
  
  resources :game_sessions, path: 'gamesessions'
  # Home Routes
  get 'home/index'
  get 'home/all_games', to: 'home#all_games', as: 'all_games'
  get 'home/sort', to: 'home#sort', as: 'sort'
  get 'home/search', to: 'home#search', as: 'search'
  
  # Devise Routes
  devise_for :users, controllers: { registrations: "user/registrations" }, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'signup'}
  
  # Games Routes
  resources :games
  
  # Users Routes
  resources :users
  
  # Mailboxer Messages
  resources :messages
  resources :conversations
  
  # Root Route
  root 'home#index'
end
