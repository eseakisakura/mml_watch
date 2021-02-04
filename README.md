<h1>mml watch GUI</h1>

ChiptuneのMMLコンパイラへGUI環境を提供するフロントエンドです。<br/>
"ppmck", "nsdLib", "P.M.D"へ対応します。<br/>
<br/>
GUI部も含め、総Powershellで組まれています。<br/>
<br/>
<br/>
それぞれがスタンドアロン(単体)で起動します。<br/>
<br/>
<table><tr><td>・Mml Watch GUI</td><td>mmlチップチューンのfront end</td>
</tr><tr><td>・FM Synthesis Chip - Tone Editor</td><td>2op.4op.対応FM音源音色エディタ</td>
</tr><tr><td>・Guitar Arpeggio - MML Generator</td><td>ギターアルペジオジェネレータ</td>
</tr></table>

<h4>対応OS: windowsXP以上</h4>

<h5>
( 近日、ver4.5を用意する予定です、、)<br/>
<br/>
※テスト環境<br/>
winXP+ Powershell2(.NET Framework3.5)<br/>
win10+ Powershell5(.NET Framework4.8)<br/>
win10+ Powershell7(.NET5)<br/>
<br/>
Watch.cmdなどのバッチファイルによる起動であれば、<br/>
.NET Framework3.5以上、<br/>
PowerShell2以上なら動くと思います。<br/>
<br/>
mml_watch.exeなどのバイナリ起動の場合、.NET Framework4.0以上が必要となります。<br/>
<br/>
※各起動バイナリexeについて<br/>
シェルを呼び出すためのc#によるラッパーで、中身の殆どはアイコンリソースです。<br/>
(開発環境を使用せず、直接.NETのコンパイラを通したため、トータルウィルスで僅かに引っかります。<br/>
[XP上にて主に開発しているため、開発環境が入れられません、]　ご心配あらば、srcにあるcsファイルを開いてみて下さい。)
</h5>

<h4>必要となるソフトウェアのリンク <br/>
・<a href="https://eseakisakura.github.io/"> Mml Watch GUI - download</a><br/>
<br/>

<h4><img alt="MW_icon" style="border-width:0; float:left" src="./image/MW_icon.png" /> Mml Watch GUI</h4>

<table><tr><td style="width: 240px;">
<img alt="Mml Watch GUI" style="border-width: 0; max-width: 240px;" src="./image/MML_wth.png" /><br/>
</td><td style="width: 320px;">
<div style="color: #51516c; border: 1px dotted #51516c; border-radius: 8px; padding: 20px 20px 20px 20px;">
mmlによるchiptuneコンパイラをGUI化したフロントエンドです。<br/>
<br/>
ファイル更新チェッカとして機能、自動再生までサポートします。
ppmck、nsdLib、PMDに対応しています。<br/>
</div></td></tr></table>

<h4>■□ Setting Panel</h4>

<table><tr><td style="width: 240px;">
<img alt="Setting" style="border-width: 0; max-width: 240px;" src="./image/SETTING_w.png" /><br/>
</td><td style="width: 320px;">
<div style="color: #51516c; border: 1px dotted #51516c; border-radius: 8px; padding: 20px 20px 20px 20px;">
必要なソフトウェアを登録する環境設定です。
リストボックスへDrug&Dropすることでパスを登録します。<br/>
(以下のTone Editor、MML Generatorも、
このパス環境を使います。)<br/>
</div></td></tr></table>

<h4><img alt="FE_icon" style="border-width:0" src="./image/FE_icon.png" /> FM Synthesis Chip - Tone Editor</h4>

<table><tr><td style="width: 240px;">
<img alt="FM Synthesis Chip - Tone Editor" style="border-width: 0; max-width: 240px;" src="./image/FM_edt.png" /><br/>
</td><td style="width: 320px;">
<div style="color: #51516c; border: 1px dotted #51516c; border-radius: 8px; padding: 20px 20px 20px 20px;">
2op(vrc7,opl),4op(opn,opm)対応のFM音源音色エディタです。<br/>
<br/>
音色の試聴、プリセット呼び出し、音色の一時保存や、<br/>
<br/>
2op.(ppmck,nsdLibのレジスタ音色含む)、
4op.(PMD,fmp7,mxdrv各音色形式)の、
インポート、エクスポートができます。<br/>
</div></td></tr></table>

<h4>■□ FM Editor Operator window</h4>

<table><tr><td style="width: 240px;">
<img alt="FM Editor 2 Operator" style="border-width: 0; max-width: 240px;" src="./image/FM_2op.png" /><br/>
<img alt="FM Editor 4 Operator" style="border-width: 0; max-width: 240px;" src="./image/FM_4op.png" /><br/>
</td><td style="width: 320px;">
<div style="color: #51516c; border: 1px dotted #51516c; border-radius: 8px; padding: 20px 20px 20px 20px;">
上記、FM音源音色エディタのサブウィンドウです。<br/>
<br/>
音色エディタのスライダーに連動し、合成波形表示が変わります。
(ウィンドウ内をクリックすることで、
エディットするオペレータ切替えができます。)<br/>
</div></td></tr></table>

<h4><img alt="AG_icon" style="border-width:0" src="./image/AG_icon.png" />Guitar Arpeggio - MML Generator</h4>

<table><tr><td style="width: 240px;">
<img alt="Guitar Arpeggio - MML Generator" style="border-width: 0; width: 50%;" src="./image/GUITAR_arp.png" /><br/>
</td><td style="width: 320px;">
<div style="color: #51516c; border: 1px dotted #51516c; border-radius: 8px; padding: 20px 20px 20px 20px;">
ギターアルペジオMMLジェネレータです。<br/>
マルチトラックにMMLを自動的に振り分け、串抜きMMLを自動生成します。<br/>
</div></td></tr></table>
