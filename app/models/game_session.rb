class GameSession < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :games
  has_and_belongs_to_many :game_modes
end
