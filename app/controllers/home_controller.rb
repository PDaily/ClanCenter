# Home Root Controller
class HomeController < ApplicationController
  def index
    @game_sessions = GameSession.includes(:users, :game, :game_mode)
  end
end
