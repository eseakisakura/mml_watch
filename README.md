<h1>mml watch GUI</h1>

ChiptuneのMMLコンパイラ"ppmck","nsdLib","P.M.D",へGUI環境を提供する補助ツールです。
GUI部も含め、総Powershellで組まれてます。<br/>
<br/>
<h5>各起動バイナリexeは、シェルを呼び出すためのc#によるラッパーで、中身の殆どはアイコンリソースです。
(開発環境を使用しないで、直接.NETのコンパイラを通したためか、トータルウィルスの一部で引っかかります。<br/>
[XP上にて開発しているため、開発環境が入れられません、、]ご心配であるならば、srcのcsファイルを開いてみて下さい。)</h5>
<br/>
それぞれがスタンドアロン(単体)で起動します。<br/>
<br/>
<table><tr><td>・Mml Watch GUI</td><td>-- チップチューンのためのフロントエンド</td>
</tr><tr><td>・FM Synthesis Chip - Tone Editor</td><td>-- 2op.4op.対応FM音源音色エディタ</td>
</tr><tr><td>・Guitar Arpeggio - MML Generator</td><td>-- ギターアルペジオジェネレータ</td>
</tr></table>

<h4>対応OS: windowsXP以上</h4>

<h5>mml_watch.exeなどのバイナリ起動の場合、.NET Framework4.0以上が必要となります。<br/>
<br/>
Watch.cmdなどのバッチファイルによる起動であれば、<br/>
.NET Framework3.5以上(CLR:共通言語ランタイム2.0)、<br/>
PowerShell2.0(WMF:WindowsManagementFramework2.0)以上なら動くと思います。</h5>

<br/>
<h4><img alt="MW_icon" style="border-width:0" src="./image/MW_icon.png" /> Mml Watch GUI</h4>

mmlチップチューンコンパイラをGUI化したフロントエンドです。<br/>
エディタ呼出しやファイル更新チェッカとして機能、自動再生までサポートします。<br/>
ppmck,nsdLib,P.M.Dに対応しています。<br/>
<br/>
<img alt="Mml Watch GUI" style="border-width:0" src="./image/MML_wth.png" /><br/>
<br/>
<br/>
<h4>■ Setting Panel</h4>

上記、フロントエンドの各file,exeなどを登録する環境設定です。<br/>
ここで必要なファイルを、リストボックスへDrug&Dropで登録します。<br/>
(以下記載のTone EditorとMML Generatorも、このパネルを呼び出すことができます。)<br/>
<br/>
<img alt="Setting" style="border-width:0" src="./image/SETTING_w.png" /><br/>
<br/>
<br/>
<h4><img alt="FE_icon" style="border-width:0" src="./image/FE_icon.png" /> FM Synthesis Chip - Tone Editor</h4>

2op(vrc7など),4op(oplなど)対応のFM音源音色エディタです。<br/>
(左上はエンベロープなど繊細なもの、右下は倍音など音色の決定要素を集めています。)<br/>
試聴機能による音色の確認、音色の保存や、<br/>
2op.のppmck,nsdLibのレジスタ音色のインポートとエクスポート、<br/>
4op.であるfmp7,mxdrvの音色形式のインポート、エクスポートもできます。<br/>
<br/>
<img alt="FM Synthesis Chip - Tone Editor" style="border-width:0" src="./image/FM_edt.png" /><br/>
<br/>
<br/>
<h4>■ FM Editor Operator window</h4>

上記、FM音源音色エディタのサブウィンドウです。<br/>
音色エディタのスライダーに連動し、合成波形が変わります。<br/>
(ウィンドウ内をクリックすることでも、エディットするオペレータ切替えができます。)<br/>
<br/>
<img alt="FM Editor 2 Operator" style="border-width:0" src="./image/FM_2op.png" /><br/>
<img alt="FM Editor 4 Operator" style="border-width:0" src="./image/FM_4op.png" /><br/>
<br/>
<br/>
<h4><img alt="AG_icon" style="border-width:0" src="./image/AG_icon.png" />Guitar Arpeggio - MML Generator</h4>

ギターアルペジオMMLジェネレータです。<br/>
マルチトラックにMMLを自動的に振り分け、串抜きMMLを自動生成します。<br/>
<br/>
<img alt="Guitar Arpeggio - MML Generator" style="border-width:0" src="./image/GUITAR_arp.png" /><br/>
<br/>
<br/>
