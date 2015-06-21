class GameMode < ActiveRecord::Base
  has_many :game_sessions
  validates_associated :game_sessions

  belongs_to :game

  validates :title, :total_players, presence: true
end
