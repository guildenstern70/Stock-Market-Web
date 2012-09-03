module PlayerHelper
  
  DEFAULT_INITIAL_MONEY = 50000
  
  def inviteplayer(playerid)
      player = getcurrentplayer()
      player.guests.create( :invited => playerid, :accepted => false )
  end
  
  def createplayer(playername)
      @player = Player.new(:name => playername, :money => DEFAULT_INITIAL_MONEY)
      error = nil
      begin
        if (@player.save)
          logger.debug("Ok. Player saved. Redirecting to Player-controller-list")
          createsession(@player)
          redirect_to :action => 'list'
          playercreated = false
        else
          logger.error("KO. Unknown error.")
          error = "General error: cannot create player."
          redirect_to :controller => 'home', :action => 'index'
        end
      rescue ActiveRecord::RecordNotUnique
          logger.error("KO. Cannot insert player: duplicate name?")
          error = "Name exists. Please choose another name and retry."
          redirect_to :controller => 'home', :action => 'index'
      end 
      return error  
  end
  
  def any_request_for_me?  
      request = false
      myplayerid = getplayerid()
      request = Guest.where('invited = ?', myplayerid).first
      if (not request.nil?)
        request = true
      end
      return request
  end
  
  def get_inviter()
      myplayerid = getplayerid()
      request = Guest.where('invited = ?', myplayerid).first
      requestor = request.player
      return requestor.name
  end
  
  def get_players_other_than_me()
      pls = Player.find(:all)
      pls.delete_if { |player| player.id == getplayerid() }
      return pls
  end
  
end
