class GameController < ApplicationController
  include GameHelper
  
  def create
    @gameplayers = params[:playersids]
    @gameid = Random.rand(10000)
    @game = Game.new(:game => @gameid)
    @game.save
    logger.debug("Creato game #{@gameid}.")
    
    @gameplayers.each { |playerid|
       createplayer(playerid)
    }
    
  end
  
end
