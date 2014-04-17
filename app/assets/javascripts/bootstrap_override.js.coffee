jQuery ->
  bootstrap_override = new BootstrapOverride

class BootstrapOverride
  constructor: ->
    @init()

  init: ->
    @listen()

  listen: ->
    $(document).on 'click', 'a.close[data-dismiss=alert]', (e) =>
      e.preventDefault()
      console.info($(e.currentTarget).closest('.alert'))
      $(e.currentTarget).closest('.alert').remove()

