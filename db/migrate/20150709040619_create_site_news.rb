class CreateSiteNews < ActiveRecord::Migration
  def change
    create_table :site_news do |t|
      t.string :title
      t.text :body
      t.references :user

      t.timestamps null: false
    end
  end
end
