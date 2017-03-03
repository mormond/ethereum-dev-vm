# VM configured for Ethereum smart contract development 

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmormond%2FEthereumDevVm%2Fmaster%2FDevVM%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fmormond%2FEthereumDevVm%2Fmaster%2FDevVM%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template allows you to deploy a Windows VM configured with Node.js, Git, Truffle, testrpc and VS Code

You can select from a few different options for the Windows version, using the latest patched version.

This will deploy a D2 v2 size VM in the resource group location and return the fully qualified domain name of the VM.

## Post install steps
* After the VM is deployed and running.
* Remote desktop to the VM and open PowerShell.
* Navigate to C:\Packages\Plugins\Microsoft.Compute.CustomScriptExtension\1.8\Downloads\0
* Set the execution policy to allow running local unsigned script (Set-ExecutionPolicy -Scope CurrentUser RemoteSigned)
* Run the InstallTruffle2.ps1 script

This will finalise installation of the required components

## Note
* As part of the deployment, a custom script extension will copy two PowerShell scripts from an Azure blob storage location to the VM
* The first script will be invoked automatically, the other script is invoked as part of the "Post install steps" above
* Copies of the scripts themselves can be found in the "PowerShellScripts" folder
* You can check the location of the scripts that will be copied in azuredeploy.json in the CustomScriptExtension element
* If you would prefer for the scripts not to be copied to the VM
 * Edit azuredeploy.json and remove the CustomScriptExtension element
 * Once deployment is complete, copy the scripts to the VM manually and execute them in order