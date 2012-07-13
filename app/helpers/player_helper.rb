module PlayerHelper
  
  DEFAULT_INITIAL_MONEY = 50000
  
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
      nr = rand(0..100)
      request = false
      if (nr < 20)
        request = true
      end
      return request
  end
  
  def get_inviter()
      pl = Player.random
      return pl.name
  end
  
  def get_players_other_than_me()
      pls = Player.find(:all)
      pls.delete_if { |player| player.id == getplayerid() }
      return pls
  end
  
end
