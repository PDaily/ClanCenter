class AddUsersCountToGameSessions < ActiveRecord::Migration
  def self.up
    add_column :game_sessions, :users_count, :integer, :default => 0
  
    GameSession.reset_column_information
    GameSession.all.each do |p|
      GameSession.update_counters p.id, :users_count => p.users.length
    end
  end

  def self.down
    remove_column :game_sessions, :users_count
  end
end
