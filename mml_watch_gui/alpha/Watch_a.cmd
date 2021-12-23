@rem Drop.cmd 
@echo off
cd /d %~dp0

@rem echo "Powershell"を起動します
@rem echo.

cd .\script

rem $Env:Path+= ";C:\programs\script\pwsh7_2"

rem // -Sta シングルスレッド指定、PS2.0以前必須 //
pwsh.exe -ExecutionPolicy RemoteSigned -Sta -File .\common.ps1 "mml_watch"
 
