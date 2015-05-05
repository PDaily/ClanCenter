class CreateGameModes < ActiveRecord::Migration
  def change
    create_table :game_modes do |t|
      t.string :title
      t.integer :total_players
      t.belongs_to :game, index: true

      t.timestamps null: false
    end
  end
end
