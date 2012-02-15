class GameController < ApplicationController
  
  def create
    @gameplayers = params[:playersids]
    @gameid = Random.rand(10000)
    @game = Game.new(:game => @gameid)
    @game.save
    logger.debug("Creato game #{@gameid}.")
    
    @gameplayers.each { |playerid|
    
      player = Player.find(playerid)
      @game.players.create(:name => player.name)
      logger.debug("Aggiunto giocatore #{playerid} al game #{@gameid}")
        
    }
    
  end
  
end
