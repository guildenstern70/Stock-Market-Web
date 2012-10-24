class HomeController < ApplicationController
    include HomeHelper
              
    def index
        @error = params[:error]
    end
    
    def startgame
        logger.debug("Starting a new game with 2 players")
        logger.debug("1) Creating players")
        # Create players
        deleteplayerbyname('Alessio')
        deleteplayerbyname('Elena')
        logger.debug(createplayer('Alessio'))
        logger.debug(createplayer('Elena'))
        # Create game
        logger.debug("2) Creating game")
        @game = Game.new()
        @game.save
        logger.debug("Game #{@game.id} created.")    
        pl1 = getplayerbyname("Alessio")
        addplayertogame(pl1, @game)
        pl2 = getplayerbyname("Elena")
        addplayertogame(pl2, @game)
        redirect_to :controller => "game", :action => "show", :id => @game.id
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
