class PlayerController < ApplicationController
    
    def list
        logger.debug("Player-controller-list")
        @players = Player.find(:all)
    end
    
    def create
        logger.debug("Player-controller-create")
        @player = Player.new(:name => params[:playername], :game => 0)
        if (@player.save)
          logger.debug("Ok. Player saved. Redirecting to Player-controller-list")
          redirect_to :action => 'list'
        else
          logger.error("KO. Cannot insert player")
          redirect_to :controller => 'home', :action => 'index'
        end        
    end
    
    def delete
        logger.debug("Player-controller-delete")
        @player = Player.find(params[:id])
        @player.destroy
    end
    
    
end
