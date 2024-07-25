# watch.ps1 ------ 
# ショートカットリンク
# powershell.exe -ExecutionPolicy RemoteSigned -Sta -File .\watch.ps1

# ------ main

$ErrorActionPreference= "Stop"

cd (Split-Path -Parent $PSCommandPath)
[Environment]::CurrentDirectory= pwd # working_dir set

 try{
	[string[]]$args_str= $Args
	.\script\common.ps1 mml_watch $args_str[0]

 }catch{
	echo $_.exception
	Write-Host '"ERROR: Safety Stopper >> .\watch.ps1 - main"'

 }finally{
 }
 
