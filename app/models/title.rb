class Title < ActiveRecord::Base
    has_many :portfolios
    has_many :players, :through => :portfolios
    
    # Title Model
    
end
