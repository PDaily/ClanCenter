# Home Root Controller
class HomeController < ApplicationController
	load_resource :game_session
  def index
    authorize! :edit, GameSession
    @game_sessions = GameSession.active.includes(:creator, :users, :game, :game_mode).filter(params.slice(:game_id, :game_mode_id, :sorted_by)).page params[:page]
    session[:game_sessions] = @game_sessions.to_param
    @site_news = SiteNews.includes(:user).limit(5).order(created_at: :desc)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def all_games
    @game_sessions = GameSession.active.includes(:users, :game, :game_mode).page params[:page]
    session[:game_sessions] = @game_sessions.to_param
    respond_to do |format|
      format.js
    end
  end

  def sort
    @game_sessions = GameSession.active.includes(:creator, :users, :game, :game_mode).filter(params.slice(:game_id, :game_mode_id, :sorted_by)).page params[:page]
    session[:game_id] = params[:game_id]
    session[:game_mode_id] = params[:game_mode_id]
    respond_to do |format|
      format.js
    end
  end
end
