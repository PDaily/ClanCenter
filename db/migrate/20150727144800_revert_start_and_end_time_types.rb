class RevertStartAndEndTimeTypes < ActiveRecord::Migration
  def change
    remove_column :game_sessions, :start_time
    add_column :game_sessions, :start_time, :datetime
    remove_column :game_sessions, :end_time
    add_column :game_sessions, :end_time, :datetime
  end
end
