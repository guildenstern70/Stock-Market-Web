module HomeHelper
    
    # Deletes all players from the Players table
    def deleteall
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
