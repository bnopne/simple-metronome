$electronDistURL = "https://github.com/electron/electron/releases/download/v4.0.4/electron-v4.0.4-win32-x64.zip"
$electronArchive = ".\electron.zip"
$appDistFolder = ".\dist"
$appResourcesFolder = ".\dist\resources\app"
$bundleContents = "..\dist"
$package = "..\package.json"
$appStartScript = "..\src\start-electron.js"

mkdir $appDistFolder

Invoke-WebRequest -Uri $electronDistURL -OutFile $electronArchive
Expand-Archive -Path $electronArchive -DestinationPath $appDistFolder

Copy-Item -Path $bundleContents -Destination $appResourcesFolder -Recurse
Copy-Item -Path $package -Destination $appResourcesFolder
Copy-Item -Path $appStartScript -Destination $appResourcesFolder
