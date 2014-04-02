class AddAttachmentUserImageToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :user_image
    end
  end

  def self.down
    drop_attached_file :users, :user_image
  end
end
