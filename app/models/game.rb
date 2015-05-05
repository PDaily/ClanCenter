class Game < ActiveRecord::Base
  has_many :game_sessions, dependent: :destroy
  has_many :game_modes, through: :game_sessions
  accepts_nested_attributes_for :game_sessions, :game_modes
end