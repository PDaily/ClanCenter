class CleanupGameSessionsWorker
  include Sidekiq::Worker

  def perform(game_session_id)
    @game_session = GameSession.find(game_session_id)
    @game_session.update_attribute(:active, false)
  end
end
