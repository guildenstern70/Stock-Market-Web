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
  
  def getplayer(playername)
      return Player.where(:name => playername)
  end
  
  def getcurrentplayer()
      return getplayer(getplayername())
  end

end
