class AddTourCreditsAndUnlimitedToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :tour_credits, :integer, default: 1
  	add_column :users, :tours_unlimited, :boolean
  end
end
