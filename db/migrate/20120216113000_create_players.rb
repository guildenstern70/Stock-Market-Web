class CreatePlayers < ActiveRecord::Migration
  
  def change
    create_table :players do |t| 
      t.string :name   # Player's name
      t.integer :money # Player's current amount of money
      t.references :game # Game's session [One GAME has many PLAYERS]
    end
  end
  
end
