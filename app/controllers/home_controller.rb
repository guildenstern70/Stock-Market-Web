class HomeController < ApplicationController
    include HomeHelper
              
    def index
    end
    
    def logout
        # Delete myself
        player = getcurrentplayer()
        player.destroy if !player.nil?
        # Destroy session
        reset_session
        redirect_to :action => 'index'
    end
    
    def deleteplayer(playerid)
      player = Player.find(playerid)
      player.delete
    end
    
    def admin
        command = params[:command]
        logger.debug('COMMAND = ' << command) if (command)
               
        case command
          when 'deleteplayers' 
            deleteplayers
            redirect_to :action => 'commandresult', :resp => 'All players deleted'
          when 'deletegames' 
            deletegames
            redirect_to :action => 'commandresult', :resp => 'All games deleted'  
          when 'deleteinvitations'
            deleteinvitations
            redirect_to :action => 'commandresult', :resp => 'All invitations deleted'     
          when 'deleteall'
            deleteplayers
            deletegames
            deleteinvitations
            redirect_to :action => 'commandresult', :resp => 'All tables empty'     
        end 
    end
    
    def commandresult
        @responsemsg = params[:resp]
        if !@responsemsg.nil?
          logger.debug('RESPONSE = ' << @responsemsg)
        end 
    end
    

end
