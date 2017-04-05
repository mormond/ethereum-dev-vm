# An Azure VM configured for Ethereum smart contract development 

## To add a standalone VM
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmormond%2Fethereum-dev-vm%2Fmaster%2FDevVM%2Fazuredeploy.json" target="_blank">
<img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fmormond%2Fethereum-dev-vm%2Fmaster%2FDevVM%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

## To add the VM to an existing VNet
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmormond%2Fethereum-dev-vm%2Fmaster%2FDevVM%2Fazuredeploy_existingvnet.json" target="_blank">
<img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fmormond%2Fethereum-dev-vm%2Fmaster%2FDevVM%2Fazuredeploy_existingvnet.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

## Overview
This template allows you to deploy a Windows VM configured with Node.js, Git, Truffle, testrpc and VS Code

You can select from a few different options for the Windows version, using the latest patched version.

This will deploy a D2 v2 size VM in the resource group location and return the fully qualified domain name of the VM.



