class CreateGameSessionsAndUsers < ActiveRecord::Migration
  def change
    create_table :game_sessions_users do |t|
      t.belongs_to :game_session, index: true
      t.belongs_to :user, index: true
    end
  end
end
