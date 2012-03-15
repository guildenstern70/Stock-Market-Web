//= require prototype

function check_messages() {
	new Ajax.PeriodicalUpdater('messages', 
      '/player/message', 
      { frequency: 4, 
        method: 'get' });
}

function get_invite_request(processor) {
	
	new Ajax.Request('/player/invite',
	{
		method:'get',
        requestHeaders: 
        {
            'X-CSRF-Token': '<%= form_authenticity_token %>',
        },
        onSuccess: function(transport)
        {
        	var inviter = transport.responseText;
        	if (inviter.length > 1)
        	{
        		$('invitation').show(); 
        		$('proposal').update(inviter + 'invites you to join a game:');
        		processor.stop();
        	}
        },
        onFailure: function()
        {
        	$('invitation').show(); 
        	$('proposal').update('Error retrieving invitation');
        }
    });
    
}

function load_players() {
    new Ajax.Request('/player/list.json',
    {
        method:'get',
        requestHeaders: 
        {
            'X-CSRF-Token': '<%= form_authenticity_token %>',
        },
        onSuccess: function(transport)
        {
            var json = transport.responseText.evalJSON();
            var select = $('playersids');
            if (json.length > 0)
            {
                $('playersinline').update('Players waiting for a game:');
                select.options.length = 0; // clear out existing items
                for(var i=0; i < json.length; i++) {
                        var d = json[i];
                        select.options.add(new Option(d.name, d.id))
                }
            }
        },
        onFailure: function()
        { 
            select.options.length = 0; // clear out existing items
            select.options.add(new Option('-- Error on fetching players --', 0))
        }
      });
}

window.onload=function() {
	//check_messages();
	//new PeriodicalExecuter(load_players, 3);
	new PeriodicalExecuter( function(pe) { get_invite_request(pe) }, 4);
}
    

