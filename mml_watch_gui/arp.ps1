# arp.ps1 ------ 
# ショートカットリンク
# powershell.exe -ExecutionPolicy RemoteSigned -Sta -File .\arp.ps1

# ------ main

$ErrorActionPreference= "Stop"

cd (Split-Path -Parent $PSCommandPath)
[Environment]::CurrentDirectory= pwd # working_dir set

 try{

	.\script\common.ps1 arp_gene

 }catch{
	echo $_.exception
	Write-Host '"ERROR: Safety Stopper >> .\arp.ps1 - main"'

 }finally{
 }
 
