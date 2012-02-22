class PlayerController < ApplicationController
    include PlayerHelper
    
    def list
        logger.debug("Player-controller-list")
        
        @players = get_players_other_than_me()
        
        respond_to do |format|
              format.html
              format.xml { render :xml => @players }
              format.json { render :json => @players }
        end 
                
        command = params[:commit]
        
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
    
    def show
        @player = Player.find(params[:id])
    end
    
    def delete
        logger.debug("Player-controller-delete")
        @player = Player.find(params[:id])
        @player.destroy
    end
    
    
end
