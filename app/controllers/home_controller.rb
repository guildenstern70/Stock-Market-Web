class HomeController < ApplicationController
 
  def index
    @playername = params[:nrplayers]
   
    if !@playername.nil?
      if @playername.length > 0
        logger.debug('Inserting new player: ' << @playername)
      end
    end
    
  end
  
  def startgame
    @playername = params[:playername]
  end
  
end
