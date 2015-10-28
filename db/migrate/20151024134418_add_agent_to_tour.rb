class AddAgentToTour < ActiveRecord::Migration
  def change
  	add_column :tours, :agent_id, :integer
  end
end
