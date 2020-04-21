class CreateHotSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :hot_spots, id: :uuid do |t|
      t.string :name
      t.string :longitude
      t.string :latitude
      t.string :street 
      t.string :city 
      t.string :state 
      t.string :country
      t.integer :hits
      t.integer :infected

      t.timestamps
    end
  end
end
