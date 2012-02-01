class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :portfolioname
      t.timestamps
    end
  end
end
