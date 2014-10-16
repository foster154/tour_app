class AddOptionsToTours < ActiveRecord::Migration
  def change
  	add_column :tours, :autoplay_music, :boolean, default: true, null: false
  	add_column :tours, :music_selection, :integer
  	add_column :tours, :theme, :integer, default: "1", null: false
  end
end
