{View} = require 'atom'

module.exports =
class AcfSnippetsView extends View
  @content: ->
    @div class: 'acf-snippets overlay from-top', =>
      @div "The AcfSnippets package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "acf-snippets:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "AcfSnippetsView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
