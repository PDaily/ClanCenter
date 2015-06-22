class AddDeviseGuestsToUsers < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      ## Database authenticatable
      t.boolean :guest, default: false
    end
  end

  def self.down

  end
end
