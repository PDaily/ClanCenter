class ChangeStartAndEndTimeTypes < ActiveRecord::Migration
  def change
    change_column :game_sessions, :start_time, :time
    change_column :game_sessions, :end_time, :time
  end
end
