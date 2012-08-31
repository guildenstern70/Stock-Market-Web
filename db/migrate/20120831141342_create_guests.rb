class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.integer :invited
      t.references :player

      t.timestamps
    end
    add_index :guests, :player_id
  end
end
