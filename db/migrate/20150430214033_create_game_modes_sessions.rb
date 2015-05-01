class CreateGameModesSessions < ActiveRecord::Migration
  def change
    create_table :game_modes_sessions, id: false do |t|
      t.belongs_to :game_session, index: true
      t.belongs_to :game_mode, index: true    
    end
  end
end
