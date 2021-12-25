　Readme.txt ------

　Powershellで組む、
　FM音源波形プログラムのサンプルスクリプトです。


　グラフ濃色は、Op.1(モジュレーション、変調波)
　薄色は、Op.2(キャリア、搬送波)となっています。



　構造化エディタに対応しています。

　・構造化エディタ sted / 松崎 暁 様
　　https://www.vector.co.jp/soft/win95/writing/se058548.html



　右クリックから"Powershellで実行"の場合は、
　権限をリモートサインへ変更して下さい。

　>Set-ExecutionPolicy RemoteSigned

　権限を変えたくない場合、コンソールから直接コマンドを打ちます。

　>powershell -executionPolicy RemoteSigned .\powershell_fm.ps1



　PS7以降の場合、直接、コマンドを実行して下さい。

　>pwsh .\powershell_fm.ps1

　必要あらば、一時パスを通して下さい。

　>$Env:Path+= ";pwsh.exeへのフォルダ"


　　免責事項 /使用条件 /著作権など

　・Apacheライセンス2.0を適用して下さい
　・当スクリプト群を使用して何らかの問題が起こっても、責任を要求しないこと
　・再配布する際は、当ドキュメントファイルを維持して下さい

　Copyright(C) 04coreworks
　https://eseakisakura.wordpress.com/about/
