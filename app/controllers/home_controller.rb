# Home Root Controller
class HomeController < ApplicationController
	load_resource :game_session
  def index
		authorize! :edit, GameSession
    @game_sessions = GameSession.includes(:users, :game, :game_mode)
  end

  def sort_by_game
    @game_sessions = GameSession.where('game_id = ?', params[:game_id])
    respond_to do |format|
      format.js
    end
  end

  def sort_by_game_mode
    @game_sessions = GameSession.where('game_mode_id = ?', params[:game_mode_id])
    respond_to do |format|
      format.js
    end
  end
end
