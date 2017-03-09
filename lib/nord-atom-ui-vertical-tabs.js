'use babel';

const selfName = 'nord-atom-ui-vertical-tabs';

setDirection = (isLeft) => {
  let panes = document.querySelectorAll('atom-pane');
  panes.forEach((pane) => {
    pane.style.flexDirection = isLeft ? 'row' : 'row-reverse';
  });
};

atom.config.onDidChange(selfName + '.isLeftTab', (isLeft) => {
  setDirection(isLeft['newValue']);
});

module.exports = NordAtomUiVerticalTabs = {
  config: {
    isLeftTab: {
      title: 'Left tabs',
      description: 'Show tabs in "left side" of editor',
      type: 'boolean',
      default: true
    }
  },

  activate: (state) => {
    let isLeft = atom.config.get(selfName + '.isLeftTab');
    setDirection(isLeft);
  },

  deactivate: () => {
    let panes = document.querySelectorAll('atom-pane');
    panes.forEach((pane) => {
      pane.style.flexDirection = 'column';
    });
  }
};
