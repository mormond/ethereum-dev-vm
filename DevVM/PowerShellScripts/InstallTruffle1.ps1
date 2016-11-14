# PowerShell Logging Script
# SharePointJack.com
# Tip, if viewing on my blog, click the full screen icon in the toolbar above

# "Global" variables:
# the filename is scoped here
# this creates a log file with a date and time stamp
$logfile = ".\logfile1_$(get-date -format `"yyyyMMdd_hhmmsstt`").txt"

function log($inString)
{
    $dateString = get-date -format "yyyyMMdd_hhmmss tt"
    $string = $inString + " : " + $dateString
    write-host $string
    $string | out-file -Filepath $logfile -append
}

# N.B.: must be run as Administrator
# Also need to make sure the execution policy allows running scripts that aren't code-signed
# Set-ExecutionPolicy Unrestricted -Scope CurrentUser

# Download & install Node.JS

#Set-Location $env:TEMP
#write-host $env:TEMP

$nodeVersion = "v6.7.0"
$nodeInstaller = "node-v6.7.0-x64.msi"

log "Downloading Node"
Invoke-WebRequest -UseBasicParsing -Uri "https://nodejs.org/dist/$nodeVersion/$nodeInstaller" -OutFile $nodeInstaller -Verbose
log ".Done downloading Node"

log "Installing Node"
Start-Process -FilePath ".\$nodeInstaller" -ArgumentList "/quiet" | Wait-Process
log ".Done installing Node"

# We will also need git

$gitInstaller = "Git-2.10.1-64-bit.exe"

log "Downloading Git"
Invoke-WebRequest -UseBasicParsing -Uri "https://github.com/git-for-windows/git/releases/download/v2.10.1.windows.1/$gitInstaller" -OutFile $gitInstaller
log ".Done downloading Git"

log "Installing Git"
Start-Process -FilePath ".\$gitInstaller" -ArgumentList "/silent" | Wait-Process
log ".Done installing Git"
