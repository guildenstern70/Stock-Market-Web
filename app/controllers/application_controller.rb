class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def createsession(player)
      session[:playername] = player.name
      session[:playerid] = player.id
  end
  
  def getplayerid()
      return session[:playerid]
  end
  
  def getplayername()
      return session[:playername]
  end
  
  def getplayer(playerid)
      begin
        plr = Player.find(playerid)
      rescue
        plr = nil
      end
  end
  
  def getcurrentplayer()
      player_id = getplayerid()
      player = nil
      if !player_id.nil?
        player = getplayer(player_id)
      end
      return player
  end

end
