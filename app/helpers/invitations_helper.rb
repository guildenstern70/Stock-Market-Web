module InvitationsHelper
  
    def deleteolderinvitations()
      player = getcurrentplayer()
      Invitation.where('player_id = ?', player.id).delete_all # Deletes old invitations by myself
    end
    
    def createinvitation(playerid)
      player = getcurrentplayer()
      player.invitations.create( :invited => playerid, :accepted => false )
    end
    
    def any_request_for_me?  
      request = false
      myplayerid = getplayerid()
      request = Invitation.where('invited = ?', myplayerid).first
      if (not request.nil?)
        request = true
      end
      return request
    end
     
    def get_inviter()
      myplayerid = getplayerid()
      request = Invitation.where('invited = ?', myplayerid).first
      requestor = request.player
      return requestor.name
    end
    
end
