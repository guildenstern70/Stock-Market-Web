class PlayerController < ApplicationController
    include PlayerHelper
    
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
          createplayer(newplayer)
        end     
    end
    
    def delete
        logger.debug("Player-controller-delete")
        @player = Player.find(params[:id])
        @player.destroy
    end
    
    
end
