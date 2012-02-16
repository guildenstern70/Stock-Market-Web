module HomeHelper
    
    # Deletes all players from the Players table
    def deleteplayers
        logger.debug("Player-controller-deleteall")
        @players = Player.find(:all)
        if (@players.length > 0)
            @players.each { |player|
                logger.debug("Deleting player " << player.name)
                player.destroy
            }
        end
    end
    
    # Deletes all records from the Games table
    def deletegames
        @games = Game.find(:all)
        if (@games.length > 0)
            @games.each { |game|
                logger.debug("Deleting game " << game.id)
                game.destroy
            }
        end
    end

end
