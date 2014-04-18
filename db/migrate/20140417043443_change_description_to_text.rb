class ChangeDescriptionToText < ActiveRecord::Migration
  def up
  	change_column :tours, :description, :text, :limit => nil
  end

  def down
  	change_column :tours, :description, :string
  end
end
