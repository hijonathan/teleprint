Backbone = require 'backbone'
Backbone.$ = $
Router = require './router.coffee'

# Start the router
new Router()

# All navigation that is relative should be passed through the navigate
# method, to be processed by the router.  If the link has a data-bypass
# attribute, bypass the delegation completely.
$(document).on "click", "a:not([data-bypass])", (evt) ->
  
  # Get the anchor href and protcol
  href = $(this).attr("href")
  protocol = @protocol + "//"
  
  # Ensure the protocol is not part of URL, meaning its relative.
  if href and href.slice(0, protocol.length) isnt protocol and href.indexOf("javascript:") isnt 0
    
    # Stop the default event to ensure the link will not cause a page
    # refresh.
    evt.preventDefault()
    
    # `Backbone.history.navigate` is sufficient for all Routers and will
    # trigger the correct events.  The Router's internal `navigate` method
    # calls this anyways.
    Backbone.history.navigate href, true

Backbone.history.start(pushState: yes)
