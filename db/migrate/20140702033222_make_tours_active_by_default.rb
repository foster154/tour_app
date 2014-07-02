class MakeToursActiveByDefault < ActiveRecord::Migration
  def up
  	change_column :tours, :active, :boolean, default: true, null: false
  end

  def down
  	change_column :tours, :active, :boolean
  end
end
