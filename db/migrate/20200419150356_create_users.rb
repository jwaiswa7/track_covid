class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :imei
      t.string :nin
      t.boolean :infected, null: false, default: false
      t.string :status

      t.timestamps
    end
  end
end
