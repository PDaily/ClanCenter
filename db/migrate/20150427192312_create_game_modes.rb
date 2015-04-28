class CreateGameModes < ActiveRecord::Migration
  def change
    create_table :game_modes do |t|
      t.string :title
      t.integer :total_players
      t.references :game, index: true

      t.timestamps null: false
    end
    add_foreign_key :game_modes, :games
  end
end
