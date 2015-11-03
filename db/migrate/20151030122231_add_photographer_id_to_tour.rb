class AddPhotographerIdToTour < ActiveRecord::Migration
  def change
  	add_column :tours, :show_photographer_info, :boolean
  	add_column :tours, :photographer_id, :integer
  end
end
