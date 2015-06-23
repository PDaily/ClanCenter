class Ability
  include CanCan::Ability

  def initialize(user) 
		user ||= User.new # guest user if not signed in.

		if user.admin? 
      can :manage, :all
		elsif user.mod?
			can :manage, [ GameSession, Game, GameMode ]
			can :read, :all
		end
      can :read, [ GameSession, Game, User ]
			# manage owned gamesessions 
			can :manage, GameSession, :creator_id => user.id
			# join gamesessions
			can :join_game, GameSession
			# manage own profile
			can [:edit, :update, :destroy], User, :id => user.id 
  end 
end
