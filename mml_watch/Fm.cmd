@rem Fm.cmd 
@echo off
cd /d %~dp0

echo "Powershell"を起動します
echo.

cd .\script
rem // -Sta シングルスレッド指定、PS2.0以前必須 //
powershell.exe -ExecutionPolicy RemoteSigned -Sta -File .\common.ps1 "fm_editor"
 
