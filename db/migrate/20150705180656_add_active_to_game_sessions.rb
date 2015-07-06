class AddActiveToGameSessions < ActiveRecord::Migration
  def change
    add_column :game_sessions, :active, :boolean
  end
end
