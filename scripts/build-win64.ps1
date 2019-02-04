$projectRoot = Split-Path $PSScriptRoot -Parent
$tempFolder = Join-Path -Path $projectRoot -ChildPath "temp"

$electronDistURL = "https://github.com/electron/electron/releases/download/v4.0.4/electron-v4.0.4-win32-x64.zip"
$electronBinaryArchive = Join-Path -Path $tempFolder -ChildPath "electron-v4.0.4-win32-x64.zip"

$appDistFolder = Join-Path -Path $tempFolder -ChildPath "build"
$appResourcesFolder = Join-Path -Path $appDistFolder -ChildPath "resources\app"
$appBundle = Join-Path -Path $tempFolder -ChildPath "bundle"

$package = Join-Path -Path $projectRoot -ChildPath "package.json"
$appStartScript = Join-Path -Path $projectRoot -ChildPath "src\start-electron.js"

if (!(Test-Path($tempFolder))) {
  mkdir $tempFolder
}

if (Test-Path($appDistFolder)) {
  Remove-Item -Path $appDistFolder -Recurse
}

mkdir $appDistFolder

if (!(Test-Path($electronBinaryArchive))) {
  Invoke-WebRequest -Uri $electronDistURL -OutFile $electronBinaryArchive
}

Expand-Archive -Path $electronBinaryArchive -DestinationPath $appDistFolder

Copy-Item -Path $appBundle -Destination $appResourcesFolder -Recurse
Copy-Item -Path $package -Destination $appResourcesFolder
Copy-Item -Path $appStartScript -Destination $appResourcesFolder
