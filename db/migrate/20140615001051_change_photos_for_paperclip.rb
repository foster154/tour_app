class ChangePhotosForPaperclip < ActiveRecord::Migration
  def change
  	remove_column 	:photos, :photo, 				:string

  	add_column		:photos, :direct_upload_url, 	:string
  	add_column		:photos, :upload_file_name, 	:string
  	add_column		:photos, :upload_content_type, 	:string
  	add_column		:photos, :upload_file_size, 	:integer
  	add_column		:photos, :upload_updated_at, 	:datetime
	add_column		:photos, :processed, 			:boolean
  end
end
