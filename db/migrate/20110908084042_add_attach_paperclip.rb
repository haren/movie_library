class AddAttachPaperclip < ActiveRecord::Migration
  def up
		add_column :actors, :attach_file_name, :string
		add_column :actors, :attach_content_type, :string
		add_column :actors, :attach_file_size, :integer
		add_column :actors, :attach_updated_at, :datetime
  end

  def down
		remove_column :actors, :attach_file_name
		remove_column :actors, :attach_content_type
		remove_column :actors, :attach_file_size
		remove_column :actors, :attach_updated_at
  end
end
