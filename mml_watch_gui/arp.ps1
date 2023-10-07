# ------ main

$ErrorActionPreference= "Stop"

cd (Split-Path -Parent $MyInvocation.MyCommand.Path)
[Environment]::CurrentDirectory= pwd # working_dir set

 try{

	.\script\common.ps1 arp_gene

 }catch{
	echo $_.exception
	Write-Host '"ERROR: Safety Stopper >> .\arp.ps1 - main"'

 }finally{
 }
