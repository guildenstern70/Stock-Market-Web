class PlayerController < ApplicationController
    include PlayerHelper
    
    def list
        logger.debug("player/list")
        @players = get_players_other_than_me()
        respond_to do |format|
              format.html
              format.xml { render :xml => @players }
              format.json { render :json => @players }
        end 
        command = params[:commit]
    end
    
    def waiting
        logger.debug("player/waiting")
    end
    
    def setinvitations
        logger.debug("player/setinvitations")
        invitedpls = Player.find(params[:playersids])
        if (invitedpls.nil?)
          logger.debug("No players invited. Redirecting to list.")
          redirect_to :controller => 'player', :action => 'list'
        else
          invitedpls.map do |player| 
            logger.debug( getplayername() +" has invited " + player.name) 
            inviteplayer(player.id)
          end
          @guests = Guest.where('player_id = ?', getcurrentplayer()) # Players invited by myself
        end
    end
    
    def lookforinvitations
        logger.debug("player/lookforinvitations")  
        @inviter = nil
        if any_request_for_me?
          logger.debug 'There is an invitation for me!'
          @inviter = get_inviter()
          logger.debug 'Invited by '+@inviter
        else
          logger.debug 'OOOPPSSS! There is NO request for me!'
        end
        render :text => @inviter
    end
    
    def message
        nr = rand(10000..99999)
        render :text => nr.to_s
    end
    
    def create
        logger.debug("player/create")
        newplayer = params[:playername]
        if newplayer.nil? or newplayer.length == 0
          redirect_to :controller => 'home', :action => 'index'
        else
          @error = createplayer(newplayer)
        end     
    end
    
    def show
        logger.debug("player/create")
        @player = Player.find(params[:id])
        @session_player_id = session[:playerid]
    end
    
    def delete
        logger.debug("player/delete")
        @player = Player.find(params[:id])
        @player.destroy
    end
    
    
end
