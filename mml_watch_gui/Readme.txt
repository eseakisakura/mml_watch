Readme.txt ------
========================================================================
	・MML Watch GUI
	・FM Synthesis Chip - Tone Editor
	・Guitar Arpeggio - MML Generator

	説明書
	https://eseakisakura.github.io/mml_watch_gui

	ver4.5正式版
	Copyright(C)04coreworks
========================================================================

　・chiptuneコンパイラ"ppmck","NSDlib","P.M.D"へ対応するフロントエンドです。

　・レジストリは使わず、iniの代りに、xml環境ファイルを書き出します。


　・XP+ PS2, win10(21H2)+ PS5 において、起動確認済み

　　※ mml_watch.exeなどのバイナリ起動の場合、
　　.NET Framework4.0以上が必要です。

------------------------------------------------------------------------
　・MMLファイルの文字コードについて

　　"shiftJIS"のみ対応します。(mmlコンパイラの仕様ため)

　　"UTF8bom無し"でもコンパイル自体は問題ありませんが、
　　日本語出力は文字化けします。


　・どうしても起動できなくなったら

　　scriptフォルダにある、～.xml環境ファイルを削除して下さい。
　　(初期設定と同じになります。)


　//// ゾーン識別子の解除 ////

　Powershellコンソール(端末)を開いて、以下のコマンドを打ちます。

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
