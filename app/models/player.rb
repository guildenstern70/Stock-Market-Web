class Player < ActiveRecord::Base
  belongs_to :game
  has_many :portfolios
  has_many :titles, :through => :portfolios
  
  def self.random
      if (c = count) != 0
        find(:first, :offset =>rand(c))
      end
  end
  
end
