class CreateRoleInAnEpisodes < ActiveRecord::Migration
  def change
    create_table :role_in_an_episodes do |t|
      t.integer :actor_id
      t.integer :episode_id

      t.timestamps
    end
  end
end
