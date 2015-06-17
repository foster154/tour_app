class AddSchedulerSettings < ActiveRecord::Migration
  def change
  	add_column :tours, :scheduler, :boolean, default: true
  	add_column :tours, :scheduler_auto_display, :boolean, default: true
  	add_column :users, :email_scheduler_leads, :boolean, default: true
  end
end
