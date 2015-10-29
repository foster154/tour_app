class ChangeAgentFieldsToMatchUser < ActiveRecord::Migration
  
	# this was done to have the Agents model match the Users model. 
	# This makes it easier to populate branded tours with EITHER the user's info, or a different agent's info.

  def change
  	# change "name" to "first_name" and "last_name" (on Agents table)
  	remove_column :agents, :name, :string
  	add_column :agents, :first_name, :string
  	add_column :agents, :last_name, :string

  	# change "agent_image" to "user_image" (on Agents table)
  	rename_column :agents, :agent_image_file_name, :user_image_file_name
  	rename_column :agents, :agent_image_content_type, :user_image_content_type
  	rename_column :agents, :agent_image_file_size, :user_image_file_size
  	rename_column :agents, :agent_image_updated_at, :user_image_updated_at

  	# change "user_url" to "website" (on Users table)
  	rename_column :users, :user_url, :website
  end
end