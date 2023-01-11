Readme.txt ------
========================================================================
	・MML Watch GUI
	・FM Synthesis Chip - Tone Editor
	・Guitar Arpeggio - MML Generator

	説明書
	https://eseakisakura.github.io/mml_watch_gui

	ver5.0β2版
	Copyright(C)04coreworks
========================================================================

　・chiptuneコンパイラ"ppmck","NSDlib","P.M.D"へ対応するフロントエンドです。

　・レジストリは使わず、iniの代りに、xml環境ファイルを書き出します。

　・各パーツの座標は、[.NET6]へ最適化済みです。


　・win10(22H2)+ PS7 or PS5において、起動確認

　　※ mml_watch_pwsh.exeなどのバイナリ起動の場合、
　　.NET Framework4.0以上が必要です。

------------------------------------------------------------------------

　Powershell5 系統(.NET Framework4.0)で使用する場合は、
  "_pwsh"の付いていない起動ファイルを使用して下さい。

　Powershell7.1系統[.NET5]の場合は、
　mml_watchで使用している、"filesystemwatcher"の実装に難があるため、
　mmlファイルを上書きした瞬間、落ちる問題があります。

　Powershell7.2[.NET6]以上での、運用であれば問題はありません。
　


　==== Powershell7.3対応 _pwsh版について ====


　※ pwsh.exeにパスを通すことで起動できます。

　Powershell[.NET6] - download
　https://github.com/PowerShell/PowerShell/releases



　※ "pwsh.exe"へのPathの追加

　# 一時パス
　　$Env:Path+= ";pwsh.exeへのフォルダパス"

　# 永続的なパス
　(win10 22H2の場合)

　　[設定] - システム - 詳細情報 - システムの詳細設定

　　[システムのプロパティ] - 環境変数 - Path

　　Path環境変数に"pwsh.exeへのフォルダパス"を追加する。


　==== ==== ==== ====

　注意

    ・MMLファイル文字コードは、"shiftJIS"のみ対応します。(mmlコンパイラの仕様ため)

　　"UTF8bom無し"でもコンパイル自体は問題ありませんが、
　　日本語出力は文字化けします。


　・起動できなくなったら

　　scriptフォルダにある、～.xml環境ファイルを削除して下さい。
　　(初期設定と同じになります。)


　・ゾーン識別子の解除

　普通はリリースでのzip downloadであれば問題はありません。

　解除が必要あらば、Powershellコンソール(端末)を開いて、
　以下のコマンドを打ちます。
　
  Unblock-File -Path ".\実行ファイル名"

------------------------------------------------------------------------

　　免責事項 /使用条件 /著作権など

　・Apacheライセンス2.0を適用して下さい

　・当スクリプト群を使用して何らかの問題が起こっても、責任を要求しないこと
　・再配布する際は、当ドキュメントファイルを維持して下さい

　バグ等ございましたらこちらまで。-> @huangbaihonglan
　コメント等はこちらへお願いします。-> #mml_watch_GUI


　= 黄白紅藍玄 =
　https://twitter.com/huangbaihonglan

　Copyright(C) 04coreworks
　https://github.com/eseakisakura
