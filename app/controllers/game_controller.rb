class GameController < ApplicationController
  include GameHelper
  
  def create   
    @gameplayers = params[:playersids]
    if (@gameplayers.nil?)
      logger.debug("No players in this game. Redirecting to list.")
      redirect_to :controller => 'player', :action => 'list'
    else
      logger.debug("Ok, I'm creating a new game...")
      @game = Game.new()
      @game.save
      logger.debug("Creato game #{@game.id}.")
      
      # Add current session player to game
      addplayertogame(getplayerid)
      
      @gameplayers.each { |playerid|
         addplayertogame(playerid)
      }
    end
  end
  
  def show
    gameid = params[:id]
    @game = Game.find(gameid)
    @players = get_players_of_the_game(gameid)
  end
  
end
