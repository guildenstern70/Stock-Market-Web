class PlayerController < ApplicationController
    
    def list
        logger.debug("Player-controller-list")
        @players = Player.find(:all)
    end
    
    def create
        logger.debug("Player-controller-create")
        newplayer = params[:playername]
        if newplayer.nil? or newplayer.length == 0
          redirect_to :controller => 'home', :action => 'index'
        else
          @player = Player.new(:name => newplayer)
          if (@player.save)
            logger.debug("Ok. Player saved. Redirecting to Player-controller-list")
            createsession(newplayer)
            redirect_to :action => 'list'
          else
            logger.error("KO. Cannot insert player")
            redirect_to :controller => 'home', :action => 'index'
          end   
        end     
    end
    
    def delete
        logger.debug("Player-controller-delete")
        @player = Player.find(params[:id])
        @player.destroy
    end
    
    
end
