class GameSession < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :game
  belongs_to :game_mode

  validates :game_id, :game_mode_id, :game_date, :start_time, :notes, presence: true
end
