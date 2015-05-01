class CreateGameSessionsAndGames < ActiveRecord::Migration
  def change
    create_table :game_sessions_games, id: false do |t|
      t.belongs_to :game_session, index: true
      t.belongs_to :game, index: true
    end
  end
end
