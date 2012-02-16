class CreateTitles < ActiveRecord::Migration
  
  def change
    
    create_table :titles do |t|
      t.string :title
      t.string :sector
      t.float :current
      t.float :previous
      t.timestamps
    end
    
  end
  
  # Default titles populated in seeds.rb
  # Populate db with rake db:seed
  
  
end
