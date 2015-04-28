class CreateGameSessions < ActiveRecord::Migration
  def change
    create_table :game_sessions do |t|
      t.string :creator
      t.string :game
      t.string :game_mode
      t.references :game, index: true
      t.references :game_mode, index: true

      t.timestamps null: false
    end
    add_foreign_key :game_sessions, :games
  end
end
