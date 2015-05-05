class GameSessionsController < ApplicationController
  before_action :set_game_session, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /game_sessions
  # GET /game_sessions.json
  def index
    @game_sessions = GameSession.includes(:users, :game, :game_mode)
  end

  # GET /game_sessions/1
  # GET /game_sessions/1.json
  def show
    set_game_session
    @total_players = @game_session.users.count
    @max_players = @game_session.game_mode.total_players
  end

  # GET /game_sessions/new
  def new
    @games = Game.all
    @game_session = GameSession.new
    @game_modes = GameMode.where("game_id = ?", Game.first.id)
    @user = current_user
  end

  # GET /game_sessions/1/edit
  def edit
    set_game_session
    @games = Game.all
    @game_modes = @game_session.game.game_modes
    @current_game = @game_session.game.id
  end

  # POST /game_sessions
  # POST /game_sessions.json
  def create
    @game_session = GameSession.new(game_session_params)

    respond_to do |format|
      if @game_session.save
        format.html { redirect_to @game_session, notice: 'Game session was successfully created.' }
        format.json { render :show, status: :created, location: @game_session }
      else
        format.html { render :new }
        format.json { render json: @game_session.errors, status: :unprocessable_entity }
      end
      @game_session.users << current_user
    end
  end

  # PATCH/PUT /game_sessions/1
  # PATCH/PUT /game_sessions/1.json
  def update
    respond_to do |format|
      if @game_session.update(game_session_params)
        format.html { redirect_to @game_session, notice: 'Game session was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_session }
      else
        format.html { render :edit }
        format.json { render json: @game_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_sessions/1
  # DELETE /game_sessions/1.json
  def destroy
    @game_session.destroy
    respond_to do |format|
      format.html { redirect_to game_sessions_url, notice: 'Game session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def update_games
    @game_modes = GameMode.where("game_id = ?", params[:game_id])
    respond_to do |format|
      format.js
    end
  end
  
  def join_game
    set_game_session
    @game_session.users << current_user
    respond_to do |format|
      format.html { redirect_to @game_session, notice: "Successfully joined game session!"}
    end
  end
  
  def leave_game
    set_game_session
    @game_session.users.delete(current_user)
    respond_to do |format|
      format.html { redirect_to game_sessions_url, notice: "Successfully quit game session!"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_session
      @game_session = GameSession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  def game_session_params
    params.require(:game_session).permit(:users, :notes, :game_date, :start_time, :end_time, :game_id, :game_mode_id)
    end
end
