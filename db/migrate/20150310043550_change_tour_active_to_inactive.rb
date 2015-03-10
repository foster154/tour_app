class ChangeTourActiveToInactive < ActiveRecord::Migration
  def change
  	remove_column :tours, :active, :boolean, default: true, null: false
  	add_column :tours, :inactive, :boolean, default: false, null: false
  end
end
