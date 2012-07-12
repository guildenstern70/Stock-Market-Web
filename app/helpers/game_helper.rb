module GameHelper
  
    def addplayertogame(playerid)     
      player = Player.find(playerid)
      player.game = @game
      player.save
      session[:gameid] = @game.id
      logger.debug("Aggiunto giocatore #{playerid} al game #{@game.id}")
    end
    
    def get_players_of_the_game(gameid)
      return Player.where('game_id = ?', gameid)
    end
  
end
