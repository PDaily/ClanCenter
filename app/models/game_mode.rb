class GameMode < ActiveRecord::Base
  has_and_belongs_to_many :games
  has_and_belongs_to_many :game_session
end
