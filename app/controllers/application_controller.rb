class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def createsession(playername)
      session[:playername] = playername
  end

end
