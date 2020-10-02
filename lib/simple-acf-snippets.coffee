AcfSnippetsView = require './simple-acf-snippets-view'
{CompositeDisposable} = require 'atom'

module.exports = AcfSnippets =
  acfSnippetsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @acfSnippetsView = new AcfSnippetsView(state.acfSnippetsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @acfSnippetsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'simple-acf-snippets:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @acfSnippetsView.destroy()

  serialize: ->
    acfSnippetsViewState: @acfSnippetsView.serialize()

  toggle: ->
    console.log 'AcfSnippets was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
