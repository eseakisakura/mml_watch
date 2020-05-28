echo $Env:Path 
$Env:Path+= ";C:\WINDOWS\Microsoft.NET\Framework\v4.0.30319\"
echo $Env:Path

cd (Split-Path -Parent $MyInvocation.MyCommand.Path)
[Environment]::CurrentDirectory= pwd # working_dir set

csc -target:winexe -win32icon:MW_icon.ico .\mml_watch.cs
#csc -target:winexe -win32icon:FE_icon.ico .\fm_editor.cs
#csc -target:winexe -win32icon:AG_icon.ico .\arp_gene.cs

# ----
#csc -target:library -out:common.dll -win32icon:ST_icon.ico -optimize+ .\dll\*.cs
#csc -reference:common.dll -target:winexe -win32icon:MW_icon.ico -optimize+ .\mml_watch.cs
#csc -reference:common.dll -target:winexe -win32icon:FE_icon.ico -optimize+ .\fm_editor.cs
#csc -reference:common.dll -target:winexe -win32icon:AG_icon.ico -optimize+ .\arp_gene.cs
# ----
 
