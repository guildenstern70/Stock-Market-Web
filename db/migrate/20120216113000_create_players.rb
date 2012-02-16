class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t| 
      t.string :name   # Player's name
      t.integer :money # Player's current amount of money
      t.references :game # Game's session
      
      t.timestamps
    end
  end
  
end
