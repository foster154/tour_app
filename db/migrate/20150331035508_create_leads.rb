class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
    	t.integer   :user_id
        t.integer 	:tour_id
    	t.string	:name
    	t.string	:phone
    	t.string	:email
    	t.string	:showing_time
    	t.text		:comment
        t.timestamps
    end

    add_index :leads, :user_id

  end
end
