# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

//= require prototype

pe = null

loadplayers_args =
  method:'get'
  requestHeaders: { 'X-CSRF-Token': '<%= form_authenticity_token %>' }
  onSuccess: (transport) ->
    json = transport.responseText.evalJSON()
    select = $('playersids')
    if json.length > 0
      $('playersinline').update('Lobby:')
      select.options.length = 0
      select.options.add new Option(d.name, d.id) for d in json
  onFailure: ->
    select.options.length = 0;
    select.options.add(new Option('-- Error on fetching players --', 0))
      
loadplayers = ->
  new Ajax.Request '/player/list.json', loadplayers_args
  
main_loop = ->
  pe = new PeriodicalExecuter( loadplayers, 3 )

Event.observe(window, 'load', main_loop)

  


