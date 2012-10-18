class GameController < ApplicationController
  include GameHelper
  
  def create  
    logger.debug("game/create") 
    @gameplayers = params[:playersids]
    if (@gameplayers.nil?)
      logger.debug("No players in this game. Redirecting to list.")
      redirect_to :controller => 'player', :action => 'list'
    else
      logger.debug("Ok, I'm creating a new game...")
      @game = Game.new()
      @game.save
      logger.debug("Game #{@game.id} created.")
      @gameplayers.each { |playerid|
         addplayertogame(playerid)
      }
      redirect_to :action => "show", :id => @game.id
    end
  end
  
  def show
    logger.debug("game/show")
    gameid = params[:id]
    @game = Game.find(gameid)
    @players = get_players_of_the_game(gameid)
  end
  
end
