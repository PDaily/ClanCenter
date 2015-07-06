class GameSession < ActiveRecord::Base
  belongs_to :creator, class: User, foreign_key: "creator_id"
  has_and_belongs_to_many :users
  belongs_to :game
  belongs_to :game_mode
  
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  validates :creator_id, :game_id, :game_mode_id, :game_date, :start_time, :end_time, :notes, presence: true
end
