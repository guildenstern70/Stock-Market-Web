class HomeController < ApplicationController
    
    def index
        # Delete all previous players
        logger.debug('Deleting all players...')
        _deleteall
        logger.debug('... done')
    end

    def _deleteall
        logger.debug("Player-controller-deleteall")
        @players = Player.find(:all)
        if (@players.length > 0)
            @players.each { |player|
              logger.debug("Deleting player " << player.name)
              player.destroy
            }
        end

    end

end
