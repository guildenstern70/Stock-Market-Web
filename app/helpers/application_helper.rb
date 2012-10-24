module ApplicationHelper
  
  DEFAULT_INITIAL_MONEY = 50000
    
  def createplayer(playername)
      logger.debug("Creating player " << playername)
      @player = Player.new(:name => playername, :money => DEFAULT_INITIAL_MONEY)
      error = "OK"
      begin
        if (@player.save)
          logger.debug("Ok. Player saved.")
          createsession(@player)
        else
          logger.error("KO. Unknown error.")
          error = "Error: cannot create player."
        end
      rescue ActiveRecord::RecordNotUnique
          logger.error("KO. Cannot insert player: duplicate name?")
          error = "Error: name exists. Please choose another name and retry."
      end 
      return error  
  end
  
  def addplayertogame(player, game)
      logger.debug("Adding player #{player.id} to game #{game.id}")  
      player.game = game
      player.save
      session[:gameid] = game.id
      logger.debug("Added player #{player.id} to game #{game.id}")  
  end
  
  def addplayeridtogame(playerid, game)     
      player = Player.find(playerid)
      addplayertogame(player, game)
  end
  
    
end
