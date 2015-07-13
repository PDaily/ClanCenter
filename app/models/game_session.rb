class GameSession < ActiveRecord::Base
  belongs_to :creator, class: User, foreign_key: "creator_id"
  has_and_belongs_to_many :users, counter_cache: true
  belongs_to :game
  belongs_to :game_mode

  include Filterable
  
  paginates_per 8

  default_scope { where(active: true) }
  
  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^start_time_/
      GameSession.order(start_time: direction.to_sym )
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  
  scope :game_id, lambda { |game_ids| where(game_id: [*game_ids]) }
  
  scope :inactive, -> { where(active: false) }

  validates :creator_id, :game_id, :game_mode_id, :game_date, :start_time, :end_time, :notes, presence: true
end
