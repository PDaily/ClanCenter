class AddGameDateToGameSessions < ActiveRecord::Migration
  def change
    add_column :game_sessions, :game_date, :date
  end
end
