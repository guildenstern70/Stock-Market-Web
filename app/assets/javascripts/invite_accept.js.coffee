//= require prototype

pe = null

invitaccept_args =
  method: 'get'
  requestHeaders: { 'X-CSRF-Token': '<%= form_authenticity_token %>' }
  onSuccess: (transport) ->
    response = transport.responseText.evalJSON()
    acceptedInvitations = response.invitations
    iamcreator = response.iamcreator
    game = response.game
    readytogo = true
    if acceptedInvitations.length > 0
      for obj in acceptedInvitations
        $("accepted#{ obj.id }").checked = obj.accepted
        readytogo = false if (!obj.accepted) 
      if readytogo
        if iamcreator
          $('message').update("Creating new game... ")
          document.forms["invitations"].submit()
        else
          if game?
            $('message').update("Joining game " + game.id)
            document.location.href = "/game/#{game.id}"
    return
  onFailure: ->
    $('message').update('Error retrieving accepted invitations')
    return

invitations = ->
  new Ajax.Request window.location.href, invitaccept_args
  
main_loop = ->
  pe = new PeriodicalExecuter( invitations, 3 )

Event.observe(window, 'load', main_loop)
