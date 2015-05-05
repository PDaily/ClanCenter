class CreateGameSessions < ActiveRecord::Migration
  def change
    create_table :game_sessions do |t|
      t.string :notes
      t.belongs_to :game, index: true
      t.belongs_to :game_mode, index: true

      t.timestamps null: false
    end

  end
end
