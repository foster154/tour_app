class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.integer :user_id
      t.string :name
      t.string :company
      t.string :phone
      t.string :email
      t.string :website
      t.attachment :agent_image

      t.timestamps
    end

    add_index :agents, :user_id
  end
end
