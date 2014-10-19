{WorkspaceView} = require 'atom'
AcfSnippets = require '../lib/acf-snippets'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "AcfSnippets", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('acf-snippets')

  describe "when the acf-snippets:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.acf-snippets')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'acf-snippets:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.acf-snippets')).toExist()
        atom.workspaceView.trigger 'acf-snippets:toggle'
        expect(atom.workspaceView.find('.acf-snippets')).not.toExist()
