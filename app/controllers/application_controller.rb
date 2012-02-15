class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def createsession(playername)
      session[:playername] = playername
  end
  
  def getplayername()
      return session[:playername]
  end

end
