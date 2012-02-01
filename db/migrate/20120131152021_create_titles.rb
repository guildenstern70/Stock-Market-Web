class CreateTitles < ActiveRecord::Migration
  
  def change
    
    create_table :titles do |t|
      t.string :title
      t.float :current
      t.float :previous
      t.timestamps
    end
    
  end
  
  
end
