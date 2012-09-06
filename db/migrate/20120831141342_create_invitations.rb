class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :invited   # Player being invitated
      t.references :player # Player who sent invitation
      t.boolean :accepted  # Invitation accepted or not
      t.timestamps
    end
    add_index :invitations, :player_id
  end
end
