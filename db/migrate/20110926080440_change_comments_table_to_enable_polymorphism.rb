class ChangeCommentsTableToEnablePolymorphism < ActiveRecord::Migration
  def change
		drop_table :comments

		create_table :comments do |t|
    	t.text :content
			t.string :by
      t.references :commentary, :polymorphic => true
      t.timestamps
    end
  end
end
