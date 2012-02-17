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
  
end
