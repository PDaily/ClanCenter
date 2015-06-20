class GameMode < ActiveRecord::Base
  has_many :game_sessions
  belongs_to :game
end
