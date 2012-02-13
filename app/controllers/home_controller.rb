class HomeController < ApplicationController
    include HomeHelper
              
    def index
    end
    
    def logout
        reset_session
        redirect_to :action => 'index'
    end
    
    def admin
        command = params[:command]
        logger.debug('COMMAND = ' << command) if (command)
               
        case command
          when 'deleteall'
              # Delete all previous players
              logger.debug('Deleting all players...')
              deleteall
              logger.debug('... done') 
              redirect_to :action => 'commandresult', :resp => 'All players deleted'
        end 
    end
    
    def commandresult
        @responsemsg = params[:resp]
        if !@responsemsg.nil?
          logger.debug('RESPONSE = ' << @responsemsg)
        end 
    end
    

end
