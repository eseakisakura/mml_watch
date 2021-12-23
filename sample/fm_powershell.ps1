<# Powershellで組むFM音源プログラム #>

# FM波形への指定 ====== 

# ------ ここは変更可能です

[int[]]$IMG= @(640,400) # グラフのサイズ

# サイン波
[int[]]$TLB= @(63,0) # op1,op2 / 振幅高さ
[float[]]$MLB= @(1,1) # op1,op2 / 逓倍数
[int]$FBB= 0 # op1のみ / 帰還量

# ベース
[int[]]$TLG= @(10,0) # 振幅高さ
[float[]]$MLG= @(0.5,3) # 逓倍数
[int]$FBG= 2 # 帰還量

# ギター
[int[]]$TLR= @(19,0) # 振幅高さ
[float[]]$MLR= @(2,3) # 逓倍数
[int]$FBR= 6 # 帰還量

# エレクトリック・ピアノ
[int[]]$TLP= @(40,0) # 振幅高さ
[float[]]$MLP= @(12,2) # 逓倍数
[int]$FBP= 3 # 帰還量

# ------- ここまで

 
# 組み込み部 ====== 

Add-Type -AssemblyName System.Windows.Forms > $null
Add-Type -AssemblyName System.Drawing > $null

cd (Split-Path -Parent $MyInvocation.MyCommand.Path)
[Environment]::CurrentDirectory= pwd # working_dir set


[string]$buff_size= @(($IMG[0]+ 1),($IMG[1]+ 1)) -join "," # string出力
[string]$frm_size= @(($IMG[0]+ 20),($IMG[1]+ 80)) -join ","
 
# 色指定、色オブジェクト 

$purple= [System.Drawing.Color]::FromName("blueviolet")
$magenta= [System.Drawing.Color]::FromName("orchid")
$red= [System.Drawing.Color]::FromName("red")
$pink= [System.Drawing.Color]::FromName("deeppink")
$green= [System.Drawing.Color]::FromName("green")
$lime= [System.Drawing.Color]::FromName("greenyellow")
$blue= [System.Drawing.Color]::FromName("blue")
$aqua= [System.Drawing.Color]::FromName("turquoise")

$white= [System.Drawing.Color]::FromName("White")
$black= [System.Drawing.Color]::FromName("Black") # 背景色

$WHpen= New-Object System.Drawing.Pen($white, 1)
$LPpen= New-Object System.Drawing.Pen($magenta, 1)
$Ppen= New-Object System.Drawing.Pen($purple, 1)
$LRpen= New-Object System.Drawing.Pen($pink, 1)
$Rpen= New-Object System.Drawing.Pen($red, 1)
$LGpen= New-Object System.Drawing.Pen($lime, 1)
$Gpen= New-Object System.Drawing.Pen($green, 1)
$LBpen= New-Object System.Drawing.Pen($aqua, 1)
$Bpen= New-Object System.Drawing.Pen($blue, 1)

 
# グラフィックス領域の確保 

$image= New-Object System.Drawing.Bitmap($IMG) # 書き込む場所
$graphics= [System.Drawing.Graphics]::FromImage($image)

$Pictbox= New-Object System.Windows.Forms.PictureBox # 描画領域
$Pictbox.ClientSize= $image.Size
$Pictbox.Image= $image
$Pictbox.Location= "4,35"

$contxtb= [System.Drawing.BufferedGraphicsManager]::Current # ダブルバッファ
$contxtb.MaximumBuffer= $buff_size

$buff= $contxtb.Allocate($graphics, $Pictbox.ClientRectangle)
 
#フォームとイベントトリガー 

$frm= New-Object System.Windows.Forms.Form
$frm.Size= $frm_size
$frm.Text= "FM波形出力"
$frm.FormBorderStyle= "FixedSingle"
$frm.StartPosition= "WindowsDefaultLocation"
$frm.MaximizeBox= $false
$frm.MinimizeBox= $false

$frm.TopLevel= $True

$mnu= New-Object System.Windows.Forms.MenuStrip
$menu_s= New-Object System.Windows.Forms.ToolStripMenuItem
$menu_s.Text= "Sin波"
$menu_s.Add_Click({ Grf "1" })

$menu_n= New-Object System.Windows.Forms.ToolStripMenuItem
$menu_n.Text= "ベース"
$menu_n.Add_Click({ Grf "2" })

$menu_k= New-Object System.Windows.Forms.ToolStripMenuItem
$menu_k.Text= "ギター"
$menu_k.Add_Click({ Grf "3" })

$menu_h= New-Object System.Windows.Forms.ToolStripMenuItem
$menu_h.Text= "エレクトリック・ピアノ"
$menu_h.Add_Click({ Grf "4" })

$menu_a= New-Object System.Windows.Forms.ToolStripMenuItem
$menu_a.Text= "全て"
$menu_a.Add_Click({ Grf "0" })

$mnu.Items.AddRange(@($menu_s,$menu_n,$menu_k,$menu_h,$menu_a))
$frm.Controls.AddRange(@($mnu,$Pictbox))
 
# FM波形出力エンジン 

Function Sinwave([int[]]$ttlev,[float[]]$mlpul,[int]$fedb,$pen,$lpen){


　[double]$pi= [Math]::PI # 180度のラジアン値
　[int]$adj_value= 20

　[int]$xmax= $IMG[0]        # x軸の最終値
　[int]$yheight= $IMG[1]/ 2  # 振幅


　[float[]]$rdus= @(0,0) # op.1とop.2

　$rdus[0]= [Math]::Pow(10, (-0.75* $ttlev[0]/ 20))* $adj_value
　$rdus[1]= [Math]::Pow(10, (-0.75* $ttlev[1]/ 20))* $adj_value


　[float[]]$feb= @(0, 0.0625, 0.125, 0.25, 0.5, 1,2,4)
　# 変調度 0,(1/16),(1/8),(1/4), (1/2),1,2,4

　[float]$feedback= $feb[$fedb]* $pi/ $adj_value # あらかじめ等倍化

　[float[]]$xs= @(0,0)
　[float[]]$ys= @(0,0)

　[float[]]$ye= @(0,0,0) # y座標値
　[float[]]$rad= @(0,0)


  For([int]$i= 0; $i -lt $xmax; $i++){ # カウンタ
　
　　　$rad[0]= $i* $pi* 2* $mlpul[0]/ $xmax # 全位相角をx座標の最大値で割っておく
　　　$rad[1]= $i* $pi* 2* $mlpul[1]/ $xmax


　　　$ye[0]= $rdus[0]* [Math]::Sin($rad[0]+ $ye[2]) # Op1 乗算ユニット

　　　$ye[2]= $feedback* ($ye[0] + $ye[2]) # 0から始まり、次のサイクルから代入

　　　$ye[1]= $rdus[1]* [Math]::Sin($rad[1]+ $ye[0]) # Op2


　　　$ye[0]= $yheight- $ye[0]* $yheight/ $adj_value # ここで$adj_valueを割って等倍化
　　　$ye[1]= $yheight- $ye[1]* $yheight/ $adj_value

　　　$buff.Graphics.DrawLine( $pen,$xs[0],$ys[0], $i,$ye[0]) # バッファ書き込み
　　　$buff.Graphics.DrawLine($lpen,$xs[1],$ys[1], $i,$ye[1])

　　　$xs[0]= $i
　　　$ys[0]= $ye[0]
　　　$xs[1]= $i
　　　$ys[1]= $ye[1]

　　} #

　} #func
 
# FM波形出力の呼出し 

Function Grf([string]$sw){

　　$buff.Graphics.Clear($black)
　　$buff.Graphics.DrawLine($WHPen,0,$IMG[1]/2, $IMG[0],$IMG[1]/2)

　　switch($sw){
　　"1"{  Sinwave $TLB $MLB $FBB $BPen $LBPen; break;
　　}"2"{ Sinwave $TLG $MLG $FBG $GPen $LGPen; break;
　　}"3"{ Sinwave $TLR $MLR $FBR $RPen $LRPen; break;
　　}"4"{ Sinwave $TLP $MLP $FBP $PPen $LPPen; break;
　　}default{
　　　　Sinwave $TLB $MLB $FBB $BPen $LBPen
　　　　Sinwave $TLG $MLG $FBG $GPen $LGPen
　　　　Sinwave $TLR $MLR $FBR $RPen $LRPen
　　　　Sinwave $TLP $MLP $FBP $PPen $LPPen
　　}
　　} #sw

　　$buff.Render($graphics) # レンダリング
　　$Pictbox.Refresh()

　} #func
 
# メインルーチン ====== 

Grf "1"
$frm.ShowDialog() > $null

$graphics.Dispose()
$buff.Dispose()
 
