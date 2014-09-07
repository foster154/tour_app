class ChangeUserImagetoPaperclip < ActiveRecord::Migration
  def change
  	remove_column :users, :user_image, :string
  	add_attachment :users, :user_image
  end
end
