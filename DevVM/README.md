# VM configured for Ethereum smart contract development 

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https://raw.githubusercontent.com/dxuk/EthereumBlockchainDemo/master/DevVM/azuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https://raw.githubusercontent.com/dxuk/EthereumBlockchainDemo/master/DevVM/azuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template allows you to deploy a simple Windows VM configured with Node.js, Git, Truffle, testrpc and VS Code

You can select from a few different options for the Windows version, using the latest patched version.

This will deploy a D2 v2 size VM in the resource group location and return the fully qualified domain name of the VM.

## Post install steps

* After the VM is deployed and running.
* Remote desktop to the VM and open PowerShell.
* Navigate to C:\Packages\Plugins\Microsoft.Compute.CustomScriptExtension\1.8\Downloads\0
* Set the execution policy to allow running local unsigned script (Set-ExecutionPolicy RemoteSigned)
* Run the InstallTruffle2.ps1 script

This will finalise installation of the required components
