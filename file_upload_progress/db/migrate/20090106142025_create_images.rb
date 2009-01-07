class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.column :photo_file_name, :string
      t.column :photo_content_type, :string
      t.column :photo_file_size, :string
      t.column :photo_updated_at, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
