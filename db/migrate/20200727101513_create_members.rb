class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members, id: :uuid do |t|

      t.timestamps
    end
  end
end
