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

# Refresh the Path to pick up both node and git
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

# We need to instruct npm to install modules in a "real" global location instead of the user's %APPDATA% directory.
# Otherwise everything will be wiped out by sysprep.
mkdir C:\npm
Set-Content -Path $ENV:ProgramFiles\nodejs\node_modules\npm\npmrc -Value prefix=C:\npm
$env:Path += ";C:\npm"

# Install Windows Build Tools
# https://github.com/felixrieseberg/windows-build-tools
# This will take a LONG time but takes care of all node-gyp pre-requisites

log "Installing windows-build-tools"
$npmOut = $(npm install --global windows-build-tools)
log $npmOut
#$npmOut = &'C:\Program Files\nodejs\npm.cmd' install --global windows-build-tools 2>&1
log "Windows Build Tools"
log ".Done installing windows-build-tools"

# Update to very latest version of npm

log "Updating npm"
$npmOut = $(npm install --global npm@latest)
log $npmOut
log "npm Update"
log ".Done updating npm"

# Install OpenSSL libraries -- required by secp256k1
# We need the older 1.0.2 version that includes libeay32.lib

$openSSLInstaller = "Win64OpenSSL-1_0_2k.exe"

log "Downloading OpenSSL"
Invoke-WebRequest -UseBasicParsing -Uri "https://slproweb.com/download/$openSSLInstaller" -OutFile $openSSLInstaller
log ".Done downloading OpenSSL"

log "Installing OpenSSL"
Start-Process -FilePath ".\$openSSLInstaller" -ArgumentList "/verysilent" | Wait-Process
log ".Done installing OpenSSL"

# Now we can finally install Truffle

log "Installing Truffle"
$npmOut = $(npm install --global truffle)
log $npmOut
log "Truffle"
log ".Done installing Truffle"

# Install Ethereum testrpc

log "Installing testrpc"
$npmOut = $(npm install --global ethereumjs-testrpc)
log $npmOut
log "test-rpc"
log ".Done installing testrpc"

# Install VS Code

$codeInstaller = "VSCodeSetup-stable.exe"

log "Downloading VSCode"
Invoke-WebRequest -UseBasicParsing -Uri "https://vscode-update.azurewebsites.net/latest/win32/stable" -OutFile $codeInstaller
log ".Done downloading VSCode"

log "Installing VSCode"
Start-Process -FilePath ".\$codeInstaller" -ArgumentList "/verysilent", "/suppressmsgboxes", "/mergetasks=!runcode" | Wait-Process
log ".Done installing VSCode"

#
# Update all users path for npm, VSCode etc
#

$p = [Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine) + ";C:\npm"
[Environment]::SetEnvironmentVariable("Path", $p, [System.EnvironmentVariableTarget]::Machine)

# The End

log "All done!"