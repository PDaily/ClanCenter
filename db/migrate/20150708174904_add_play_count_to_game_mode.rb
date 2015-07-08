class AddPlayCountToGameMode < ActiveRecord::Migration
  def change
    add_column :game_modes, :play_count, :integer, default: 0
  end
end
