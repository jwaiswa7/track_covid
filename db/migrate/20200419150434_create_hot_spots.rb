class CreateHotSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :hot_spots, id: :uuid do |t|
      t.string :name
      t.string :long
      t.string :lat
      t.integer :hits
      t.integer :infected

      t.timestamps
    end
  end
end
