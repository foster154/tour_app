class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
    	t.boolean	:active
    	t.integer	:days_remaining
    	t.integer 	:user_id
    	t.string 	:address
    	t.string	:city
    	t.string	:state
    	t.string	:zip
    	t.string	:description
    	t.integer	:price
    	t.string	:beds
    	t.string	:baths
    	t.integer	:home_size
    	t.string	:lot_size
    	t.integer 	:year_built
      	
      	t.timestamps
    end

    add_index :tours, [:user_id, :created_at]
  end
end
