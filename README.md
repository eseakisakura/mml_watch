<h1>mml watch GUI</h1>

mmlチップチューンコンパイラppmck,nsdLib,P.M.D,のユーティリティ集です。<br/>
GUIも含め総Powershellで組まれてます。<br/>
<br/>
(各バイナリexeは、シェルを呼び出すためのc#によるラッパーで、</div>
中身の殆どはアイコンリソースです。)<br/>
<br/>
それぞれがスタンドアロン(単体)で起動します。<br/>
<br/>
<table><tr><td>・Mml Watch GUI</td><td>-- チップチューンのためのフロントエンド</td>
</tr><tr><td>・FM Synthesis Chip - Tone Editor</td><td>-- 2op.4op.対応FM音源チップエディタ</td>
</tr><tr><td>・Guitar Arpeggio - MML Generator</td><td>-- ギターアルペジオジェネレータ</td>
</tr></table>

<h5>対応OS: windowsXP以上<br/>
<br/>
mml_watch.exeなどのバイナリ起動の場合、.NET Framework4.0以上が必要となります。<br/>
<br/>
Watch.cmdなどのバッチファイルによる起動であれば、<br/>
.NET Framework3.5以上(CLR:共通言語ランタイム2.0)、<br/>
PowerShell2.0(WMF:WindowsManagementFramework2.0)以上なら動くと思います。</h5>

<br/>
<h4>□ Mml Watch GUI</h4>

mmlチップチューンコンパイラをGUI化した、フロントエンドです。<br/>
ppmck,nsdLib,P.M.Dに対応しています。<br/>
<br/>
<img alt="Mml Watch GUI" style="border-width:0" src="./image/MML_wth.png" /><br/>
<br/>
<br/>
<h4>■ Setting Panel</h4>

上記、フロントエンドの各file,exeなどを登録する環境設定です。<br/>
ここで必要なファイルを、リストボックスへD&Dで登録します。<br/>
(以下、Tone EditorとMML Generatorも、このパネルを呼び出すことができます。)<br/>
<br/>
<img alt="Setting" style="border-width:0" src="./image/SETTING_w.png" /><br/>
<br/>
<br/>
<h4>□ FM Synthesis Chip - Tone Editor</h4>

2op,4op対応のFM音源音色エディタです。<br/>
左上はエンベロープなど繊細なもの、右下は倍音など音色の決定要素を集めています。<br/>
試聴機能による音色の確認、音色の保存、各FM音源のmml(fmp7,mxdrv)から、<br/>
インポート、エクスポートができます。<br/>
<br/>
<img alt="FM Synthesis Chip - Tone Editor" style="border-width:0" src="./image/FM_edt.png" /><br/>
<br/>
<br/>
<h4>■ FM Editor Operator window</h4>

上記、FM音源音色エディタのサブウィンドウです。<br/>
音色エディタのスライダーに連動し、合成波形が変わります。<br/>
ウィンドウ内をクリックすることでも、エディットするオペレータ切替えができます。<br/>
<br/>
<img alt="FM Editor Operator window" style="border-width:0" src="./image/FM_opw.png" /><br/>
<br/>
<br/>
<h4>□ Guitar Arpeggio - MML Generator</h4>

ギターアルペジオMMLジェネレータです。<br/>
各トラックにMMLを自動的に振り分け、串抜きMMLを自動生成します。<br/>
<br/>
<img alt="Guitar Arpeggio - MML Generator" style="border-width:0" src="./image/GUITAR_arp.png" /><br/>
<br/>
<br/>
