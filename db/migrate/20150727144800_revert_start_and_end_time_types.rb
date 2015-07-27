class RevertStartAndEndTimeTypes < ActiveRecord::Migration
  def change
    change_column :game_sessions, :start_time, :datetime
    change_column :game_sessions, :end_time, :datetime
  end
end
