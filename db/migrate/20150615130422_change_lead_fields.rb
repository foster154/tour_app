class ChangeLeadFields < ActiveRecord::Migration
  def change
  	remove_column :leads, :phone, :string
  	remove_column :leads, :email, :string
  	remove_column :leads, :showing_time, :string
  	remove_column :leads, :comment, :text

  	add_column :leads, :contact_info, :string
  	add_column :leads, :schedule_showing, :boolean
  	add_column :leads, :get_more_info, :boolean
  	add_column :leads, :send_list, :boolean
  end
end
