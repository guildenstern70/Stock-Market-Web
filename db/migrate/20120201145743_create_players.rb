class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t| 
      t.string :name   # Player's name
      t.integer :game  # Game's session (0 if user is not in a session game)
      t.timestamps
    end
  end
end
