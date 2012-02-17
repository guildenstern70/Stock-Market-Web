module GameHelper
  
    def addplayertogame(playerid)
      
      player = Player.find(playerid)
      player.game = @game
      player.save
      logger.debug("Aggiunto giocatore #{playerid} al game #{@gameid}")
      
    end
  
end
