class CreateGameModesAndGames < ActiveRecord::Migration
  def change
    create_table :game_modes_games, id: false do |t|
      t.belongs_to :game_mode, index: true
      t.belongs_to :game, index: true
    end
  end
end
