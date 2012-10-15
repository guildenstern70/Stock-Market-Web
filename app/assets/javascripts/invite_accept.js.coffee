//= require prototype

pe = null

invitaccept_args =
  method: 'get'
  requestHeaders: { 'X-CSRF-Token': '<%= form_authenticity_token %>' }
  onSuccess: (transport) ->
    acceptedInvitations = transport.responseText.evalJSON()
    if acceptedInvitations.length > 0
      msg = ">"
      for obj in acceptedInvitations
        $("accepted#{ obj.id }").checked = obj.accepted
      return
  onFailure: ->
    $('message').update('Error retrieving accepted invitations')
    return

invitations = ->
  new Ajax.Request '/player/invitations', invitaccept_args
  
main_loop = ->
  pe = new PeriodicalExecuter( invitations, 3 )

Event.observe(window, 'load', main_loop)
