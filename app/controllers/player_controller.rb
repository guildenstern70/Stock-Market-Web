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
    
    def waiting
        logger.debug("Player-controller-waiting")
    end
    
    def lookforinvitations  
        @inviter = nil
        logger.debug '======= INVITE REQUEST ========'
        if any_request_for_me?
          logger.debug 'The request was for me!'
          @inviter = get_inviter()
          logger.debug 'Invited by '+@inviter
        else
          logger.debug 'OOOPPSSS! The request was NOT for me!'
        end
        render :text => @inviter
    end
    
    def message
        nr = rand(10000..99999)
        render :text => nr.to_s
    end
    
    def create
        logger.debug("Player-controller-create")
        newplayer = params[:playername]
        if newplayer.nil? or newplayer.length == 0
          redirect_to :controller => 'home', :action => 'index'
        else
          @error = createplayer(newplayer)
        end     
    end
    
    def show
        @player = Player.find(params[:id])
        @session_player_id = session[:playerid]
    end
    
    def delete
        logger.debug("Player-controller-delete")
        @player = Player.find(params[:id])
        @player.destroy
    end
    
    
end
