class CreateGameSessions < ActiveRecord::Migration
  def change
    create_table :game_sessions do |t|
      t.string :creator
      t.string :game
      t.string :game_mode

      t.timestamps null: false
    end
  end
end
