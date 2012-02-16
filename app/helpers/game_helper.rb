module GameHelper
  
    DEFAULT_INITIAL_MONEY = 50000
  
    def createplayer(playerid)
      
      player = Player.find(playerid)
      @game.players.create(:name => player.name, :money => DEFAULT_INITIAL_MONEY)
      logger.debug("Aggiunto giocatore #{playerid} al game #{@gameid}")
      
    end
  
end
