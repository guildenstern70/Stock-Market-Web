class HomeController < ApplicationController
    include HomeHelper
    
    def index
        # Delete all previous players
        logger.debug('Deleting all players...')
        deleteall
        logger.debug('... done')
    end

end
