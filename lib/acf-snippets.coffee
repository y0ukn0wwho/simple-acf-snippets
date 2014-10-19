AcfSnippetsView = require './acf-snippets-view'

module.exports =
  acfSnippetsView: null

  activate: (state) ->
    @acfSnippetsView = new AcfSnippetsView(state.acfSnippetsViewState)

  deactivate: ->
    @acfSnippetsView.destroy()

  serialize: ->
    acfSnippetsViewState: @acfSnippetsView.serialize()
