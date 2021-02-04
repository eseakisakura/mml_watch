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
※テスト環境 - ver4.5<br/>
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
<br/>
シェルを呼び出すためのc#によるラッパーで、<br/>
中身の殆どはアイコンリソースです。(開発環境を使用せず直接、<br/>
.NETのコンパイラを通したため、トータルウィルスで僅かに引っかります。<br/>
[XP上にて主に開発しているため、開発環境が入れられません、]<br/>
ご心配あらば、srcにあるcsファイルを開いてみて下さい。)<br/>
</h5>

<h4>
必要となるソフトウェアのリンク <br/>
・<a href="https://eseakisakura.github.io/"> Mml Watch GUI - download</a><br/>
<h4>

<h4><img src="./image/MW_icon.png" /> Mml Watch GUI</h4>

<table><tr><td>
<img src="./image/MML_wth.png" /><br/>
</td><td>
<div>
mmlによるchiptuneコンパイラをGUI化したフロントエンドです。<br/>
ファイル更新チェッカとして機能、自動再生までサポートします。
ppmck、nsdLib、PMDに対応しています。<br/>
</div></td></tr></table>

<h4>■□ Setting Panel</h4>

<table><tr><td>
<img src="./image/SETTING_w.png" /><br/>
</td><td>
<div>
必要なソフトウェアを登録する環境設定です。
リストボックスへDrug&Dropすることでパスを登録します。<br/>
(以下のTone Editor、MML Generatorも、
このパス環境を使います。)<br/>
</div></td></tr></table>

<h4><img src="./image/FE_icon.png" /> FM Synthesis Chip - Tone Editor</h4>

<table><tr><td>
<img src="./image/FM_edt.png" /><br/>
</td><td>
<div>
2op(vrc7,opl),4op(opn,opm)対応のFM音源音色エディタです。<br/>
<br/>
音色の試聴、プリセット呼び出し、音色の一時保存や、<br/>
2op.(ppmck,nsdLibのレジスタ音色含む)、<br/>
4op.(PMD,fmp7,mxdrv各音色形式)の、<br/>
インポート、エクスポートができます。<br/>
</div></td></tr></table>

<h4>■□ FM Editor Operator window</h4>

<table><tr><td>
<img src="./image/FM_2op.png" /><br/>
<img src="./image/FM_4op.png" /><br/>
</td><td>
<div>
上記、FM音源音色エディタのサブウィンドウです。<br/>
<br/>
音色エディタのスライダーに連動し、合成波形表示が変わります。
(ウィンドウ内をクリックすることで、
エディットするオペレータ切替えができます。)<br/>
</div></td></tr></table>

<h4><img src="./image/AG_icon.png" />Guitar Arpeggio - MML Generator</h4>

<table><tr><td>
<img src="./image/GUITAR_arp.png" /><br/>
</td><td>
<div>
ギターアルペジオMMLジェネレータです。<br/>
マルチトラックにMMLを自動的に振り分け、
串抜きMMLを自動生成します。<br/>
<br/>
chordアサインのち、アルペジオナンバーを打つことで、
各コンパイラに対応したmmlを生成します。<br/>
</div></td></tr></table>
