$electronDistURL = "https://github.com/electron/electron/releases/download/v4.0.4/electron-v4.0.4-win32-x64.zip"
$electronBinaryArchive = Join-Path -Path $PSScriptRoot -ChildPath "electron-v4.0.4-win32-x64.zip"
$appDistFolder = Join-Path -Path $PSScriptRoot -ChildPath "dist"
$appResourcesFolder = Join-Path -Path $PSScriptRoot -ChildPath "dist\resources\app"
$appBundle = Join-Path -Path $PSScriptRoot -Resolve "..\dist"
$package = Join-Path -Path $PSScriptRoot -Resolve "..\package.json"
$appStartScript = Join-Path -Path $PSScriptRoot -Resolve "..\src\start-electron.js"

mkdir $appDistFolder

Invoke-WebRequest -Uri $electronDistURL -OutFile $electronBinaryArchive
Expand-Archive -Path $electronBinaryArchive -DestinationPath $appDistFolder

Copy-Item -Path $appBundle -Destination $appResourcesFolder -Recurse
Copy-Item -Path $package -Destination $appResourcesFolder
Copy-Item -Path $appStartScript -Destination $appResourcesFolder
