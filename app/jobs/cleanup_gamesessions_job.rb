class CleanupGamesessionsJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    @game_sessions = GameSession.where(end_time: 1.hour.ago)
    @game_sessions.update_attribute(active: false)
  end
end
