selfName = 'nord-atom-ui-vertical-tabs'

setDirection = (isLeft) ->
  panes = document.querySelectorAll('atom-pane')
  for pane, i in panes
    pane.style.flexDirection = if isLeft then 'row' else 'row-reverse'

atom.config.onDidChange(selfName + '.isLeftTab', (isLeft) ->
  setDirection(isLeft['newValue']);
)

module.exports = NordAtomUiVerticalTabs =

  config:
    isLeftTab:
      title: 'Left tabs'
      description: 'Show tabs in "left side" of editor'
      type: 'boolean'
      default: true

  activate: (state) ->
    isLeft = atom.config.get(this.selfName + '.isLeftTab')
    setDirection(isLeft)

  deactivate: ->
    panes = document.querySelectorAll('atom-pane')
    for pane, i in panes
      pane.style.flexDirection = 'column'
