class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t| 
      t.string :name   # Player's name
      t.integer :game  # Game's session
      t.timestamps
    end
  end
end
