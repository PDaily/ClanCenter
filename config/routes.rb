Rails.application.routes.draw do
  
  # Sideqik Web Monitoring Panel Route
  require 'sidekiq/web'
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  
  # Rails_admin Panel Route
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  # Game Sessions Routes
  resources :game_sessions
  get 'game_sessions/update_games', as: 'update_games'
  post 'game_sessions/:id/join_game', to: 'game_sessions#join_game', as: 'join_game'
  post 'game_sessions/:id/leave_game', to: 'game_sessions#leave_game', as: 'leave_game'
  post 'game_sessions/:id/end_game', to: 'game_sessions#end_game', as: 'end_game'
  
  
  # Home Routes
  get 'home/index'
  get 'home/all_games', to: 'home#all_games', as: 'all_games'
  get 'home/game', to: 'home#sort_by_game', as: 'sort_by_game'
  get 'home/game_mode', to: 'home#sort_by_game_mode', as: 'sort_by_game_mode'
  
  # Devise Routes
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  
  # Games Routes
  resources :games
  
  # Users Routes
  resources :users
  
  # Root Route
  root 'home#index'
end
