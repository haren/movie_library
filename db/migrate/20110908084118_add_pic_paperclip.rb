class AddPicPaperclip < ActiveRecord::Migration
  def up
		add_column :actors, :pic_file_name, :string
		add_column :actors, :pic_content_type, :string
		add_column :actors, :pic_file_size, :integer
		add_column :actors, :pic_updated_at, :datetime
  end

  def down
		remove_column :actors, :pic_file_name
		remove_column :actors, :pic_content_type
		remove_column :actors, :pic_file_size
		remove_column :actors, :pic_updated_at
  end
end
