@rem Drop.cmd 
@echo off
cd /d %~dp0

@rem echo "Powershell"���N�����܂�
@rem echo.

cd .\script

rem $Env:Path+= ";C:\programs\script\pwsh7_2"

rem // -Sta �V���O���X���b�h�w��APS2.0�ȑO�K�{ //
pwsh.exe -ExecutionPolicy RemoteSigned -Sta -File .\common.ps1 "mml_watch"
 
