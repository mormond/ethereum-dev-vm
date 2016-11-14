# PowerShell Logging Script
# SharePointJack.com
# Tip, if viewing on my blog, click the full screen icon in the toolbar above

# "Global" variables:
# the filename is scoped here
# this creates a log file with a date and time stamp
$logfile = ".\logfile2_$(get-date -format `"yyyyMMdd_hhmmsstt`").txt"

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

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

log "Path: $env:Path"

# Install Windows Build Tools
# https://github.com/felixrieseberg/windows-build-tools
# This will take a LONG time but takes care of all node-gyp pre-requisites

log "Installing windows-build-tools"

npm install --global windows-build-tools

# Update to very latest version of npm

log "Updating npm"

npm install --global npm@latest

# Install OpenSSL libraries -- required by secp256k1
# We need the older 1.0.2 version that includes libeay32.lib

log "Installing OpenSSL"

$openSSLInstaller = "Win64OpenSSL-1_0_2j.exe"
Invoke-WebRequest -UseBasicParsing -Uri "https://slproweb.com/download/$openSSLInstaller" -OutFile $openSSLInstaller
Start-Process -FilePath ".\$openSSLInstaller" -ArgumentList "/verysilent" | Wait-Process

#Start-Process $openSSLInstaller /verysilent -Wait

# Now we can finally install Truffle

log "Installing Truffle"

npm install --global truffle

# Install Ethereum testrpc

log "Installing testrpc"

npm install --global ethereumjs-testrpc

# Install VS Code

log "Installing VSCode"


$codeInstaller = "VSCodeSetup-stable.exe"
Invoke-WebRequest -UseBasicParsing -Uri "https://vscode-update.azurewebsites.net/latest/win32/stable" -OutFile $codeInstaller
Start-Process -FilePath ".\$codeInstaller" -ArgumentList "/verysilent", "/suppressmsgboxes", "/mergetasks=!runcode" | Wait-Process
#Start-Process $codeInstaller "/verysilent /suppressmsgboxes /mergetasks=!runcode"

# The End

log "All done!"