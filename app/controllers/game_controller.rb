class GameController < ApplicationController
  include GameHelper
  
  def create
    
    @gameplayers = params[:playersids]
    
    if (@gameplayers.nil?)
      redirect_to :controller => 'player', :action => 'list'
    else
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
    @game = Game.find(params[:id])
  end
  
end
