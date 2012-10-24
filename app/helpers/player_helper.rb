module PlayerHelper
 
  def get_players_other_than_me()
      pls = Player.find(:all)
      pls.delete_if { |player| player.id == getplayerid() }
      return pls
  end
  
end
