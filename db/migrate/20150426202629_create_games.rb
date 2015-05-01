class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :description
      t.belongs_to :game_session, index: true


      t.timestamps null: false
    end

  end
end
