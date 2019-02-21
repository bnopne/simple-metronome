const { app, BrowserWindow } = require('electron');

let win;

function createWindow () {
  win = new BrowserWindow({ width: 300, height: 450 });
  win.setMenu(null);

  win.loadURL('http://localhost:8080');

  win.on('closed', () => {
    win = null
  });
}

app.on('ready', createWindow);
