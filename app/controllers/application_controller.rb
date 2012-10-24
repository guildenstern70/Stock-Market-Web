class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  
  def createsession(player)
      if session[:lastseen]
        reset_session if session[:lastseen] < 120.minutes.ago
      end
      session[:playername] = player.name
      session[:playerid] = player.id
      session[:lastseen] = Time.now
  end
  
  def getplayerid()
      return session[:playerid]
  end
  
  def getplayername()
      return session[:playername]
  end
  
  def getplayerbyname(playername)
      begin
        plr = Player.where("name = ?", playername).first
        logger.debug("Found player " + plr.name)
      rescue
        plr = nil
      end
      return plr    
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
