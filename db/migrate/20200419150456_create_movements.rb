class CreateMovements < ActiveRecord::Migration[6.0]
  def change
    create_table :movements, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :hot_spot, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
