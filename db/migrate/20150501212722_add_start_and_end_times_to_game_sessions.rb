class AddStartAndEndTimesToGameSessions < ActiveRecord::Migration
  def change
    add_column :game_sessions, :start_time, :time
    add_column :game_sessions, :end_time, :time
  end
end
