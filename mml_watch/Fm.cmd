@rem Fm.cmd 
@echo off
cd /d %~dp0

echo "Powershell"���N�����܂�
echo.

cd .\script
rem // -Sta �V���O���X���b�h�w��APS2.0�ȑO�K�{ //
powershell.exe -ExecutionPolicy RemoteSigned -Sta -File .\common.ps1 "fm_editor"
 
