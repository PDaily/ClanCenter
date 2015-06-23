class AddCreatorIdToGameSession < ActiveRecord::Migration
  def change
    add_column :game_sessions, :creator_id, :integer
  end
end
