class Player < ActiveRecord::Base
  belongs_to :game
  has_many :portfolios
  has_many :titles, :through => :portfolios
end
