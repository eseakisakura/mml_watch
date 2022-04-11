@rem Arp.cmd 
@echo off
cd /d %~dp0

echo "Powershell"を起動します
echo.

cd .\script

rem $Env:Path+= ";pwsh.exeへのフォルダ"

rem // -Sta シングルスレッド指定、PS2.0以前必須 //
pwsh.exe -ExecutionPolicy RemoteSigned -Sta -File .\common.ps1 "arp_gene"
