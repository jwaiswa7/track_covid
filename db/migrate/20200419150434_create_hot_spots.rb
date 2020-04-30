class CreateHotSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :hot_spots, id: :uuid do |t|
      t.string :name
      t.float :longitude
      t.float :latitude
      t.string :street 
      t.string :city 
      t.string :state 
      t.string :country
      t.integer :hits
      t.integer :infected
      t.boolean :transport, default: false
      t.string :identification

      t.timestamps
    end
  end
end
