class AddVideoToTours < ActiveRecord::Migration
  def change
  	add_column :tours, :video, :text
  end
end
