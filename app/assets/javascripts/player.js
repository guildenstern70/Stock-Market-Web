//= require prototype

function load_players()
{
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
            alert('Something went wrong...') 
        }
      });
}
    

