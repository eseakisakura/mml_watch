Readme.txt ------
=====================================================================

	・MML Watch GUI
	・FM Synthesis Chip - Tone Editor
	・Guitar Arpeggio - MML Generator

	説明書
	https://eseakisakura.github.io/mml_watch_gui

	ver5.3.2 暫定正式版
	Copyright(C)04coreworks

---------------------------------------------------------------------

　・MML chiptune コンパイラである、
　"ppmck","NSDlib","P.M.D"へ対応するフロントエンドです。

　・レジストリは使わず、iniの代りにxml環境ファイルを書き出します。

　・win10(22H2)+ PS7 or PS5において、起動確認。


　Powershell5 系統(.NET Framework4.0)の場合は、
  "powershell.exe" にてスクリプトを起動して下さい。

　Powershell7 系統[.NET5以上]の場合は、
  "pwsh.exe" にてスクリプトを起動して下さい。


---------------------------------------------------------------------

　　起動手順


　　各CMD(BAT)ファイルより起動、ないしは、
　　各ps1ファイルより、右クリック - PowerShellで実行 をしてください。


　　各ps1ショートカットによる起動の場合は、以下のように行います。


　　watch.ps1を右クリックして、ショートカットの作成を選択、
　　このショートカットのプロパティを開いて、

　　[リンク先]を以下のように書き換えて使用します。

	-- Powershell5 --
	powershell.exe -ExecutionPolicy RemoteSigned -Sta -File .\watch.ps1

	-- Powershell7 --	
	pwsh.exe -ExecutionPolicy RemoteSigned -Sta -File .\watch.ps1




　　ショートカットであれば、mmlファイルのドロップ起動に対応します。(warch.ps1のみ)
　　fm.ps1、arp.ps1のショートカットも、同様の手順です。



　　ショートカットのアイコン変更を行うのであれば、
　　mml_watch_gui\src へ所在があります。


=====================================================================

　Powershell7の対応について


　※ pwsh.exeにパスを通すことで起動できます。


　リリースから、最新版をダウンロードします。

　Powershell[.NET7] - download
　https://github.com/PowerShell/PowerShell/releases


　※ パス"pwsh.exe"の追加

　# コンソール起動での一時パスの場合
　　$Env:Path+= ";pwsh.exeへのフォルダパス"


　# 永続的なパスの場合
　(win10 22H2の場合)

　　[設定] - システム - 詳細情報 - システムの詳細設定

　　[システムのプロパティ] - 環境変数 - Path

　　Path環境変数に"pwsh.exeへのフォルダパス"を追加する。


---------------------------------------------------------------------

　使用上の注意


　・MMLファイルの文字コードは、"shiftJIS"のみ対応します。
　(mmlコンパイラの仕様ため)

　　"UTF8bom無し"でもコンパイル自体は問題ありませんが、
　　日本語出力は文字化けします。


　・起動できなくなったら

　　scriptフォルダにある、～.xml環境ファイルを削除して下さい。
　　(初期設定と同じになります。)


　・ゾーン識別子の解除


　解除が必要ならば、当該ファイルを右クリック、プロパティを開いて、
　全般タブのセキュリティから、許可するにチェックを入れて下さい。

　ないしは、Powershellコンソール(端末)を開いて、
　以下のコマンドを打ちます。
　
  Unblock-File -Path ".\実行ファイル名"



---------------------------------------------------------------------


　　免責事項 /使用条件 /著作権など

　・Apacheライセンス2.0を適用して下さい

　・当スクリプト群を使用して何らかの問題が起こっても、責任を要求しないこと
　・再配布する際は、当ドキュメントファイルを維持して下さい

　バグ等ございましたらこちらまで。-> @huangbaihonglan
　コメント等はこちらへお願いします。-> #mml_watch_GUI


　= 黄白紅藍玄 =
　https://twitter.com/huangbaihonglan

　Copyright(C) 04coreworks
　https://eseakisakura.wordpress.com/about/
