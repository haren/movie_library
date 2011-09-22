class CreateEpisodeItems < ActiveRecord::Migration
  def change
    create_table :episode_items do |t|
      t.integer :episode_id
      t.integer :cart_id
      t.integer :quantity

      t.timestamps
    end
  end
end
