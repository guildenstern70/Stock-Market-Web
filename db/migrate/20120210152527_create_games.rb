class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :game  # Game's session (0 if user is not in a session game)
      t.timestamps
    end
  end
end
