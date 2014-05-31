class UsersRemoveOldSessionsFieldsAddFirstLastName < ActiveRecord::Migration
  def change
  	remove_column 	:users, :password_digest, 	:string
  	remove_column 	:users, :remember_token, 	:string
  	remove_column 	:users, :name, 				:string

  	add_column		:users, :first_name, 		:string
  	add_column		:users, :last_name, 		:string
  end
end
