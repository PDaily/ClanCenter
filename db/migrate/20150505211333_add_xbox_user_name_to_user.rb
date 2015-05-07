class AddXboxUserNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :xbox_name, :string
  end
end
