NordAtomUiVerticalTabsView = require './nord-atom-ui-vertical-tabs-view'
{CompositeDisposable} = require 'atom'

module.exports = NordAtomUiVerticalTabs =
  nordAtomUiVerticalTabsView: null
  subscriptions: null

  activate: (state) ->
    @nordAtomUiVerticalTabsView = new NordAtomUiVerticalTabsView(state.nordAtomUiVerticalTabsViewState)

  deactivate: ->
    @nordAtomUiVerticalTabsView.destroy()

  serialize: ->
    nordAtomUiVerticalTabsViewState: @nordAtomUiVerticalTabsView.serialize()
