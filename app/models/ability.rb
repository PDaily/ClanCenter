class Ability
  include CanCan::Ability

  def initialize(user) 
		user ||= User.new # guest user if not signed in.

		if user.admin? 
      can :manage, :all
      can :access, :rails_admin   # grant access to rails_admin
			can :dashboard
		elsif user.mod?
			can :manage, [ GameSession, Game, GameMode ]
			can :read, :all
			can :access, :rails_admin   # grant access to rails_admin
			can :dashboard
		end
      can :read, [ GameSession, Game, User ]
			can [:destroy, :edit], GameSession, :creator_id => user.id # manage owned gamesessions
			can :create, GameSession # create gamesession
			can [:update_games, :sort_by_game, :end_game], GameSession
			can :join_game, GameSession # join gamesessions
			can :leave_game, GameSession # leave gamesessions
			can [:edit, :update, :destroy], User, :id => user.id # manage own profile
  end 
end
