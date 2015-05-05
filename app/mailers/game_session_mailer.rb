class GameSessionMailer < ApplicationMailer
  default from: "gamebot@dc837.io"
  
  def new_game_session_email(game_session, user)
    @game_session = game_session
    @all_users = User.all
    @user = user.user_name
    
    @all_users.each do |u|
      mail(to: u.email, subject: "New Session: #{@game_session.game.title.titleize}-#{@game_session.game_mode.title.titleize} | #{@game_session.start_time}")
    end
  end
end
