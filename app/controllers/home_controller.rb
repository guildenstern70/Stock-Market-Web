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
              # Delete all previous players
              logger.debug('Deleting all players...')
              deleteplayers
              logger.debug('... done') 
              redirect_to :action => 'commandresult', :resp => 'All players deleted'
          when 'deletegames'
              # Delete all games
              logger.debug('Deleting all games...')
              deletegames
              logger.debug('... done') 
              redirect_to :action => 'commandresult', :resp => 'All games deleted'
          when 'deleteinvitations'
              # Delete all invitations
              logger.debug('Deleting all invitations...')
              deleteinvitations
              logger.debug('... done') 
              redirect_to :action => 'commandresult', :resp => 'All invitations deleted'
        end 
    end
    
    def commandresult
        @responsemsg = params[:resp]
        if !@responsemsg.nil?
          logger.debug('RESPONSE = ' << @responsemsg)
        end 
    end
    

end
