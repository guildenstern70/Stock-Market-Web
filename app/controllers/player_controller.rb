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
        if @error.starts_with?('Error')
          redirect_to :controller => 'home', :action => 'index', :error => @error
        else
          redirect_to :action => 'list'
        end
    end
    
    def show
        logger.debug("player/show")
        @player = Player.find(params[:id])
        @gameid = @player.game_id
        logger.debug("Showing player #{@player.name}")
        logger.debug("Player is into game #{@gameid}") if not @gameid.nil?
        @session_player_id = session[:playerid]
    end
    
    def delete
        logger.debug("player/delete")
        @player = Player.find(params[:id])
        @player.destroy
    end
    
    
end
