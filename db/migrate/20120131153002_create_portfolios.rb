class CreatePortfolios < ActiveRecord::Migration
  
  def change
    
    create_table :portfolios do |t|
      t.references :player
      t.references :title
      t.integer :quantity
      t.integer :cost
    end
    
  end
end
