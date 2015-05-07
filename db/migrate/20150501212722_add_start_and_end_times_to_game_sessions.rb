class AddStartAndEndTimesToGameSessions < ActiveRecord::Migration
  def change
    add_column :game_sessions, :start_time, :datetime
    add_column :game_sessions, :end_time, :datetime
  end
end
