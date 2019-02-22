const { app, BrowserWindow } = require('electron');

let primaryWindow;

function createWindow () {
  primaryWindow = new BrowserWindow({ width: 300, height: 450 });

  primaryWindow.setMenu(null);
  primaryWindow.loadFile('./index.html');

  primaryWindow.on(
    'closed',
      () => {
      primaryWindow = null;
    }
  );
}

app.on('ready', createWindow);
