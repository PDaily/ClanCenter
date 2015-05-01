class Game < ActiveRecord::Base
  has_and_belongs_to_many :game_sessions
  has_and_belongs_to_many :game_modes
end
