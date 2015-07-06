class GameMode < ActiveRecord::Base
  has_many :game_sessions
  validates_associated :game_sessions

  belongs_to :game

  validates :title, presence: true, uniqueness: true
  validates :total_players, presence: true
  validates :game_id, presence: true, numericality: true
end
