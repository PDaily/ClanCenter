class Game < ActiveRecord::Base
  has_many :game_modes, dependent: :destroy
  validates_associated :game_modes

  has_many :game_sessions, through: :game_modes
  accepts_nested_attributes_for :game_modes, :game_sessions

  validates :title, :description, presence: true

  has_attached_file :game_icon, styles: { game_card: '650x350', medium: '325x175>', thumb: '130x70>' }, default_url: '/images/:style/missing_game_icon.png'
  validates_attachment_content_type :game_icon, content_type: ['image/jpg', 'image/jpeg', 'image/gif', 'image/png']
end
