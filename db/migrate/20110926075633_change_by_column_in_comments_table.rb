class ChangeByColumnInCommentsTable < ActiveRecord::Migration
  def up
		remove_column :comments, :by
		add_column :comments, :by, :string
  end

  def down
		remove_column :comments, :by
		add_column :comments, :by, :integer
  end
end
