NordAtomUiVerticalTabsView = require './nord-atom-ui-vertical-tabs-view'
{CompositeDisposable} = require 'atom'

module.exports = NordAtomUiVerticalTabs =
  nordAtomUiVerticalTabsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @nordAtomUiVerticalTabsView = new NordAtomUiVerticalTabsView(state.nordAtomUiVerticalTabsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @nordAtomUiVerticalTabsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'nord-atom-ui-vertical-tabs:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @nordAtomUiVerticalTabsView.destroy()

  serialize: ->
    nordAtomUiVerticalTabsViewState: @nordAtomUiVerticalTabsView.serialize()

  toggle: ->
    console.log 'NordAtomUiVerticalTabs was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
