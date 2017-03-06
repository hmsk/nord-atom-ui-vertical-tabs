NordAtomUiVerticalTabs = require '../lib/nord-atom-ui-vertical-tabs'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "NordAtomUiVerticalTabs", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('nord-atom-ui-vertical-tabs')

  describe "when the nord-atom-ui-vertical-tabs:toggle event is triggered", ->
    it "hides and shows the modal panel", ->
      # Before the activation event the view is not on the DOM, and no panel
      # has been created
      expect(workspaceElement.querySelector('.nord-atom-ui-vertical-tabs')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'nord-atom-ui-vertical-tabs:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(workspaceElement.querySelector('.nord-atom-ui-vertical-tabs')).toExist()

        nordAtomUiVerticalTabsElement = workspaceElement.querySelector('.nord-atom-ui-vertical-tabs')
        expect(nordAtomUiVerticalTabsElement).toExist()

        nordAtomUiVerticalTabsPanel = atom.workspace.panelForItem(nordAtomUiVerticalTabsElement)
        expect(nordAtomUiVerticalTabsPanel.isVisible()).toBe true
        atom.commands.dispatch workspaceElement, 'nord-atom-ui-vertical-tabs:toggle'
        expect(nordAtomUiVerticalTabsPanel.isVisible()).toBe false

    it "hides and shows the view", ->
      # This test shows you an integration test testing at the view level.

      # Attaching the workspaceElement to the DOM is required to allow the
      # `toBeVisible()` matchers to work. Anything testing visibility or focus
      # requires that the workspaceElement is on the DOM. Tests that attach the
      # workspaceElement to the DOM are generally slower than those off DOM.
      jasmine.attachToDOM(workspaceElement)

      expect(workspaceElement.querySelector('.nord-atom-ui-vertical-tabs')).not.toExist()

      # This is an activation event, triggering it causes the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'nord-atom-ui-vertical-tabs:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        # Now we can test for view visibility
        nordAtomUiVerticalTabsElement = workspaceElement.querySelector('.nord-atom-ui-vertical-tabs')
        expect(nordAtomUiVerticalTabsElement).toBeVisible()
        atom.commands.dispatch workspaceElement, 'nord-atom-ui-vertical-tabs:toggle'
        expect(nordAtomUiVerticalTabsElement).not.toBeVisible()
