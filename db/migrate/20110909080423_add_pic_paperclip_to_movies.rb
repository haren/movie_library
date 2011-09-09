class AddPicPaperclipToMovies < ActiveRecord::Migration
  def up
		add_column :movies, :pic_file_name, :string
		add_column :movies, :pic_content_type, :string
		add_column :movies, :pic_file_size, :integer
		add_column :movies, :pic_updated_at, :datetime
  end

  def down
		remove_column :movies, :pic_file_name
		remove_column :movies, :pic_content_type
		remove_column :movies, :pic_file_size
		remove_column :movies, :pic_updated_at
  end
end
