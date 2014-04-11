class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :tour_id
      t.string :photo
      t.string :title
      t.string :description

      t.timestamps
    end

    add_index :photos, :tour_id
  end
end
