class CreatePortfolios < ActiveRecord::Migration
  
  def change
    
    create_table :portfolios do |t|
      t.string :portfolioname
      t.references :player
      t.references :title
    end
    
  end
end
