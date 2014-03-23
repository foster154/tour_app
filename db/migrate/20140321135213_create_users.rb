class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string 	:name
    	t.string 	:email, unique: true, limit: 50
    	t.boolean 	:active, default: true
    	t.boolean 	:paying, default: false
    	t.boolean 	:admin, default: false
    	t.string 	:phone, limit: 25
    	t.string 	:company, limit: 50
    	t.string 	:user_url, limit: 100
    	t.string 	:password_digest
    	t.string 	:remember_token

    	t.timestamps
    end

    add_index 	:users, :email
    add_index 	:users, :remember_token
  end
end
