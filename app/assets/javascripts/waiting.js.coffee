//= require prototype

pe = null

invitations_args =
  method: 'get'
  requestHeaders: { 'X-CSRF-Token': '<%= form_authenticity_token %>' }
  onSuccess: (transport) ->
    inviter = transport.responseText
    if inviter.length > 1
      $('invitation').show()
      $('waiting').hide()
      $('proposal').update(inviter + ' invites you to join a game:')
      pe.stop()
      return
  onFailure: ->
    $('invitation').show() 
    $('proposal').update('Error retrieving invitation')
    return

invitations = ->
  new Ajax.Request '/player/lookforinvitations', invitations_args
  
main_loop = ->
  pe = new PeriodicalExecuter( invitations, 3 )

Event.observe(window, 'load', main_loop)
