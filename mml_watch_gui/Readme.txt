Readme.txt ------
========================================================================
			・MML Watch GUI
			・FM Synthesis Chip - Tone Editor
			・Guitar Arpeggio - MML Generator

			　Copyright(C)04coreworks
========================================================================


　　MMLchiptuneコンパイラのフロントエンドです。
、"ppmck","NSDlib","P.M.D"へ対応します。

　環境に依存せず、運用できるようになっています。
　(レジストリは使わず、xml環境ファイルとして書き出しています)


　・MMLファイルの文字コードは、"shiftJIS"のみ対応します。(mmlコンパイラの仕様)
　　("UTF8bom無し"でもコンパイル自体は問題ないようです。[日本語は文字化けします])

　・どうしても起動できない場合、scriptフォルダにある、
　　～.xml環境ファイルを削除して下さい。
　　初期設定と同じになります。


　Powershell 7.0(.NET5)以上では、mml_watchで使用する、
　"filesystemwatcher"の実装に問題があるため、alphaテスト版として下さい。

　(テストする場合、alphaフォルダにある起動ファイルを、
　mml_watch.exeのあるフォルダへ移動し起動して下さい。
　この際、pwsh.exeへのPathが必要です。)

　# 一時パスを通す場合
　$Env:Path+= ";pwsh.exeへのフォルダ"

　# 永続的にパスを通す場合 - win8,10
　コントロールパネル - システムの詳細設定 - 環境変数をクリック、
　PATH環境変数に"pwsh.exeへのフォルダ"を追加する


　クロスプラットフォーム対応について ------

　起動チェックはしておりません、、
　linuxのサンプルのみですが、
　起動スクリプト"Watch.sh"を参考に組んでみて下さい。


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
