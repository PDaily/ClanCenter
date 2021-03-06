class GameSessionMailer < ApplicationMailer
  default from: "gamebot@#{ENV["EMAIL_DOMAIN"]}"

  def new_game_session_email(game_session, user)
    @game_session = game_session
    @game_session_title = game_session.game.title.titleize
    @game_mode_title = game_session.game_mode.title.titleize
    @game_session_notes = game_session.notes
    @all_users = User.all
    @creator = @game_session.creator.user_name

    @all_users.each do |u|
      @start_time = @game_session.start_time.in_time_zone(u.time_zone.to_s).strftime('%l:%M%P')
      @end_time = @game_session.end_time.in_time_zone(u.time_zone.to_s).strftime('%l:%M%P')
      mail(to: u.email, subject: "New Session: #{@game_session_title}-#{@game_mode_title} | #{@start_time}")
    end
  end
  
  def join_game_session_email(game_session, user)
    @game_session = game_session
    @game_session_title = game_session.game.title.titleize
    @game_mode_title = game_session.game_mode.title.titleize
    @game_session_notes = game_session.notes
    @all_users = User.all
    @creator = @game_session.creator.user_name
    @user = user.user_name
    
    @game_session.users.each do |u|
      @start_time = @game_session.start_time.in_time_zone(u.time_zone.to_s).strftime('%l:%M%P')
      @end_time = @game_session.end_time.in_time_zone(u.time_zone.to_s).strftime('%l:%M%P')
      mail(to: u.email, subject: "New Session: #{@game_session_title}-#{@game_mode_title} | #{@start_time}")
    end
  end
end
