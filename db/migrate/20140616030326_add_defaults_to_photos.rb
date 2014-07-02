class AddDefaultsToPhotos < ActiveRecord::Migration
  def up
    change_column :photos, :tour_id, :integer, null: false
    change_column :photos, :direct_upload_url, :string, null: false
    change_column :photos, :processed, :boolean, default: false, null: false
  end

  def down
  	change_column :photos, :tour_id, :integer
    change_column :photos, :direct_upload_url, :string
    change_column :photos, :processed, :boolean
  end
end
