class RemoveTitleDescriptionAddLabelToPhotos < ActiveRecord::Migration
  def change
  	remove_column :photos, :title, :string
  	remove_column :photos, :description, :string
  	add_column :photos, :label, :text, :limit => 250
  end

end
