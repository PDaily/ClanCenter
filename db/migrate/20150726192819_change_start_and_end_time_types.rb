class ChangeStartAndEndTimeTypes < ActiveRecord::Migration
  def self.up
    change_column :game_sessions, :start_time, :time
    change_column :game_sessions, :end_time, :time
  end
  def self.down
    change_column :game_sessions, :start_time, :datetime
    change_column :game_sessions, :end_time, :datetime
  end
end
