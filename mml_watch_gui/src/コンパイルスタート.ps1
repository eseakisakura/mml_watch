# powershell.exe -ExecutionPolicy RemoteSigned -NoExit -Sta -File コンパイルスタート.ps1


echo $Env:Path 
$Env:Path+= ";C:\WINDOWS\Microsoft.NET\Framework\v4.0.30319\"
echo $Env:Path

cd (Split-Path -Parent $MyInvocation.MyCommand.Path)
[Environment]::CurrentDirectory= pwd # working_dir set

# コンソール
#csc .\new2_watch.cs
#csc .\new2_fm.cs
#csc .\new2_arp.cs

#csc -target:winexe -win32icon:MW_icon.ico .\new2_watch.cs
#csc -target:winexe -win32icon:FE_icon.ico .\new2_fm.cs
#csc -target:winexe -win32icon:AG_icon.ico .\new2_arp.cs


read-host "pause"

# ----不使用
#csc -target:library -out:common.dll -win32icon:ST_icon.ico -optimize+ .\dll\*.cs
#csc -reference:common.dll -target:winexe -win32icon:MW_icon.ico -optimize+ .\mml_watch.cs
#csc -reference:common.dll -target:winexe -win32icon:FE_icon.ico -optimize+ .\fm_editor.cs
#csc -reference:common.dll -target:winexe -win32icon:AG_icon.ico -optimize+ .\arp_gene.cs
# ----
 
