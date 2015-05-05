class GameSession < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :game
  belongs_to :game_mode
end