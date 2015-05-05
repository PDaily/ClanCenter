class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Might be best to move to has_many :through eventually
  has_and_belongs_to_many :game_sessions
  # Will clear any game sessions of the user.id being destroyed
  before_destroy { game_sessions.clear }
end
