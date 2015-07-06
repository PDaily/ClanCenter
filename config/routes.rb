Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'game_sessions/update_games', as: 'update_games'
  get 'home/all_games', to: 'home#all_games', as: 'all_games'
  get 'home/game', to: 'home#sort_by_game', as: 'sort_by_game'
  get 'home/game_mode', to: 'home#sort_by_game_mode', as: 'sort_by_game_mode'
  post 'game_sessions/:id/join_game', to: 'game_sessions#join_game', as: 'join_game'
  post 'game_sessions/:id/leave_game', to: 'game_sessions#leave_game', as: 'leave_game'
  post 'game_sessions/:id/end_game', to: 'game_sessions#end_game', as: 'end_game'
  
  resources :game_sessions
  
  get 'home/index'

  devise_for :users, :controllers => { :registrations => "user/registrations" }
  resources :games

  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with 'rake routes'.

  # You can have the root of your site routed with 'root'
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
