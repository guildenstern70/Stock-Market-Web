module InvitationsHelper
  
    SQL_FIND_ALL_INVITEE = "SELECT * FROM INVITATIONS INNER JOIN players ON players.id = invitations.invited WHERE player_id = "
  
    #
    # Delete the old invitations made by current player
    #
    def deleteolderinvitations()
      player = getcurrentplayer()
      Invitation.where('player_id = ?', player.id).delete_all # Deletes old invitations by myself
    end
    
    #
    # Find all players (with names) invited by inviter_id
    #
    def findallinviteeby(inviter_id)
      if (inviter_id == nil)
        inviter_id = getcurrentplayer().id
      end
      return Invitation.find_by_sql(SQL_FIND_ALL_INVITEE + inviter_id.to_s)               
    end
    
    #
    # Add current player to invitations
    #
    def invitemyself()
      playerid = session[:playerid]
      player = getcurrentplayer()
      player.invitations.create( :invited => playerid, :accepted => true )
    end
    
    #
    # Create new invitations
    #
    def createinvitation(playerid)
      player = getcurrentplayer()
      player.invitations.create( :invited => playerid, :accepted => false )
    end
    
    #
    # Did someone invite me?
    #
    def any_request_for_me?  
      request = false
      myplayerid = getplayerid()
      myinvitation = Invitation.where('invited = ?', myplayerid).first
      if (not myinvitation.nil?)
        request = true
      end
      return request
    end
    
    #
    # Accept an invitation
    #
    def accept_invitation()
      myplayerid = getplayerid()
      request = Invitation.where('invited = ?', myplayerid).first
      request.accepted = true
      request.save
      return request.player # Returns the player who invited me
    end
     
    #
    # Get the name of the player who invited
    #
    def get_inviter()
      myplayerid = getplayerid()
      request = Invitation.where('invited = ?', myplayerid).first
      requestor = request.player
      return requestor.name
    end
    
end
