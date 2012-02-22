module PlayerHelper
  
  DEFAULT_INITIAL_MONEY = 50000
  
  def createplayer(playername)
      @player = Player.new(:name => playername, :money => DEFAULT_INITIAL_MONEY)
          if (@player.save)
            logger.debug("Ok. Player saved. Redirecting to Player-controller-list")
            createsession(@player)
            redirect_to :action => 'list'
          else
            logger.error("KO. Cannot insert player")
            redirect_to :controller => 'home', :action => 'index'
          end   
  end
  
  def get_players_other_than_me()
      pls = Player.find(:all)
      pls.delete_if { |player| player.id == getplayerid() }
      return pls
  end
  
end
