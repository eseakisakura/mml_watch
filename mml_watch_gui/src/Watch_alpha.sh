#!/bin/bash
cd `dirname $0` # shのあるカレントへ移動

echo \"Powershell\"を起動します
echo

cd ./script

# PATH=$PATH:"pwshへのパス記述"
# export PATH

# // -Sta シングルスレッド指定、PS2.0以前必須 //
pwsh -ExecutionPolicy RemoteSigned -Sta -File .\common.ps1 "mml_watch"
