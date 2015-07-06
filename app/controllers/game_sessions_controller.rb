# Game Sessions Controller
class GameSessionsController < ApplicationController
  before_action :set_game_session, only: [:show, :edit, :update, :destroy, :join_game, :leave_game]
  before_action :authenticate_user!, only: [:edit, :new, :create, :join_game, :update, :destroy]
	load_and_authorize_resource
	
	# GET /game_sessions
	# GET /game_sessions.json
	def index
		@game_sessions = GameSession.includes(:users, :game, :game_mode)
 	end

  # GET /game_sessions/1
  # GET /game_sessions/1.json
  def show
    @total_players = @game_session.users.count
    @max_players = @game_session.game_mode.total_players
  end

  # GET /game_sessions/new
  def new
    @games = Game.all
    @game_session = GameSession.new
    @game_modes = GameMode.where('game_id = ?', Game.first.id)
    @user = current_user
    @current_time = Time.now.in_time_zone(current_user.time_zone)
  end

  # GET /game_sessions/1/edit
  def edit
    @games = Game.all
    @game_modes = @game_session.game.game_modes
    @current_game = @game_session.game.id
    @current_game_mode = @game_session.game_mode.id
    @current_time = Time.now.in_time_zone(current_user.time_zone)
  end

  # POST /game_sessions
  # POST /game_sessions.json
  def create
    @game_session = GameSession.new(game_session_params)
    @game_session.active = true
    @game_session.creator = current_user

    respond_to do |format|
      if @game_session.save
        format.html { redirect_to @game_session, notice: 'Game session was successfully created.' }
        format.json { render :show, status: :created, location: @game_session }
        @game_session.users << current_user
        
        CleanupGamesessionsJob.perform_later
        GameSessionMailer.new_game_session_email(@game_session, current_user).deliver_now
      else
        format.html { render :new }
        format.json { render json: @game_session.errors, status: :unprocessable_entity }
      end
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
      format.html { redirect_to root_url, notice: 'Game session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_games
    @game_modes = GameMode.where('game_id = ?', params[:game_id])
    respond_to do |format|
      format.js
    end
  end
  
  def end_game
    @game_session.update_attribute(:active, false)
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Game session has successfully ended.' }
    end
  end

  def join_game
    @game_session.users << current_user
    GameSessionMailer.join_game_session_email(@game_session, current_user).deliver_now
    respond_to do |format|
      format.html { redirect_to @game_session, notice: 'Successfully joined game session!' }
    end
  end

  def leave_game
    @game_session.users.delete(current_user) unless current_user == @game_session.creator
      respond_to do |format|
        format.html { redirect_to root_url, notice: 'Successfully quit game session!' }
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
