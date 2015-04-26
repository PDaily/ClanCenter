class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :game_title
      t.string :game_desc
      t.string :game_mode
      t.integer :total_players

      t.timestamps null: false
    end
  end
end
