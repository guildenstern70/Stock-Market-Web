module GameHelper
    
    def get_players_of_the_game(gameid)
      return Player.where('game_id = ?', gameid)
    end
  
end
