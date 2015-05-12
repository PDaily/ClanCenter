class AddAttachmentGameIconToGames < ActiveRecord::Migration
  def self.up
    change_table :games do |t|
      t.attachment :game_icon
    end
  end

  def self.down
    remove_attachment :games, :game_icon
  end
end
