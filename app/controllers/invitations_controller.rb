class InvitationsController < ApplicationController
  include InvitationsHelper
  
  def index
    logger.debug("invitations/index")
    @invitations = Invitation.where('player_id = ?', getcurrentplayer()) # Players invited by myself
    respond_to do |format|
        format.html
        format.xml { render :xml => @invitations }
        format.js { render :json => @invitations }
    end
  end
  
  def waiting
    logger.debug("invitations/waiting")  
    @inviter = nil
    if any_request_for_me?
      logger.debug 'There is an invitation for me!'
      @inviter = get_inviter()
      logger.debug 'Invited by '+@inviter
    else
      logger.debug 'OOOPPSSS! There is NO request for me!'
    end
    respond_to do |format|
        format.html { logger.debug 'Request format is HTML' }
        format.json { render :text => @inviter }
    end
  end
  
  def create
    logger.debug("invitations/create")
    invitedpls = Player.find(params[:playersids])
    if (invitedpls.nil?)
      logger.debug("No players invited. Redirecting to list.")
      redirect_to :controller => 'player', :action => 'list'
    else
      deleteolderinvitations()
      invitedpls.map do |invited| 
        logger.debug( getplayername() +" has invited " + invited.name) 
        createinvitation(invited.id)
      end
      # Go to INVITATIONS/INDEX
      redirect_to :action => 'index'
    end
  end
  
  
end
