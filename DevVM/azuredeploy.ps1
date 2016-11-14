Write-Host "Creating a new Ethereum dev VM"
Write-Host
Write-Host "Creating new resource group for the VM"
$rgname = New-AzureRmResourceGroup

Write-Host "Please enter values for the deployment"
New-AzureRmResourceGroupDeployment -ResourceGroupName $rgname.ResourceGroupName -TemplateFile './azuredeploy.json'

Write-Host "Remote desktop to the VM and open PowerShell."
Write-Host "Navigate to C:\Packages\Plugins\Microsoft.Compute.CustomScriptExtension\1.8\Downloads\0"
Write-Host "Set the execution policy to allow running local unsigned script (Set-ExecutionPolicy RemoteSigned)."
Write-Host "Run the InstallTruffle2.ps1 script."
Write-Host "This will install all the required components."
