class HomeController < ApplicationController
 
  def index
    @nrplayers = params[:nrplayers]
   
    if @nrplayers.nil?
      @players = 0
    else
      @players = Integer(@nrplayers)
    end
  end
  
  
end
