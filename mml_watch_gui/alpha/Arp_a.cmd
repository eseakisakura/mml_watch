@rem Arp.cmd 
@echo off
cd /d %~dp0

echo "Powershell"���N�����܂�
echo.

cd .\script

rem $Env:Path+= ";pwsh.exe�ւ̃t�H���_"

rem // -Sta �V���O���X���b�h�w��APS2.0�ȑO�K�{ //
pwsh.exe -ExecutionPolicy RemoteSigned -Sta -File .\common.ps1 "arp_gene"
