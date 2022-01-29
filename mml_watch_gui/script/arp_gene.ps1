<# arp_gene.ps1 #> 

Write-Host ('"分散コードエディタ"を起動します')
 
$xml_arpeg= @' 
<table>
	<opt>
		<tray value="True"/>
		<oct value="o4"/>
		<osc value="NSDlib"/>
		<bit value="Checked"/>
	</opt>
	<val>
		<!-- 拡張性の加味 -->
		<mck value=""/>
		<nsd value=""/>
		<pmd value=""/>
		<cmp value=""/>
		<ply value=""/>
		<dos value=""/>
		<edt value=""/>
	</val>
</table>
'@
 
$cd= @{} 

	# c  f  b- e- g  c	6E
	# g  c  f   b- d  g	5A
	# d  g  c  f  a  d		4D
	# e  a  d  g  b  e	0F

$cd["Maj"]= @{}
$cd["Maj"]["c5A"]= 0,3,2, 0,1,0 # [0]Flet
$cd["Maj"]["g6E"]= 3,2,0, 0,0,3

$cd["Maj"]["6E"]= 0,2,2, 1,0,0 # [0-11]Flet
$cd["Maj"]["5A"]= 0,0,2, 2,2,0
$cd["Maj"]["4D"]= "x",0,0, 2,3,2

$cd["Maj7"]= @{} # M7,m7 no tame
$cd["Maj7"]["c5A"]= 0,3,2, 0,0,0
$cd["Maj7"]["f4D"]= "x","x",3, 2,1,0
$cd["Maj7"]["g6E"]= 3,2,0, 0,0,2

$cd["Maj7"]["6E"]= 0,2,1, 1,0,0
$cd["Maj7"]["5A"]= 0,0,2, 1,2,0
$cd["Maj7"]["4D"]= "x",0,0, 2,2,2

$cd["Maj79"]= @{}
$cd["Maj79"]["6E"]= 0,"x",1, 1,0,2
$cd["Maj79"]["5A"]= "x",0,-1, 1,0,0
$cd["Maj79"]["4D"]= "x","x",0, -1,2,0

$cd["M7#11"]= @{}
$cd["M7#11"]["c5A"]= 0,3,2, 0,0,2
$cd["M7#11"]["6E"]= 0,"x",1, 1,-1,"x"
$cd["M7#11"]["5A"]= "x",0,1, 1,2,"x"
$cd["M7#11"]["4D"]= "x","x",0, -1,-3,-3

$cd["M713"]= @{}
$cd["M713"]["6E"]= 0,"x",1, 1,2,"x"
$cd["M713"]["5A"]= "x",0,"x", 1,2,2
$cd["M713"]["4D"]= "x","x",0, -1,0,-3

$cd["M913"]= @{}
$cd["M913"]["6E"]= 0,"x",1, -1,-3,-3
$cd["M913"]["5A"]= "x",0,-3, -1,-3,-3
$cd["M913"]["4D"]= "x","x",0, 4,2,0



$cd["min"]= @{}
$cd["min"]["d-5A"]= 0,4,2, 1,2,0
$cd["min"]["e6E"]= 0,2,2, 0,0,0 # = close

$cd["min"]["6E"]= 0,2,2, 0,0,0
$cd["min"]["5A"]= 0,0,2, 2,1,0
$cd["min"]["4D"]= "x",0,0, 2,3,1

$cd["min7"]= @{}
$cd["min7"]["d-5A"]= 0,4,2, 4,2,0
$cd["min7"]["e6E"]= 0,2,2, 0,3,0

$cd["min7"]["6E"]= 0,2,0, 0,0,0
$cd["min7"]["5A"]= 0,0,2, 0,1,0
$cd["min7"]["4D"]= "x",0,0, 2,1,1

$cd["min79"]= @{}
$cd["min79"]["g-6E"]= 2,0,2, 1,2,0

$cd["min79"]["6E"]= 0,2,0, 0,0,2
$cd["min79"]["5A"]= "x",0,-2, 0,0,0
$cd["min79"]["4D"]= "x","x",0, -2,1,0

$cd["m711"]= @{}
$cd["m711"]["g-6E"]= 2,0,2, 2,0,0
$cd["m711"]["6E"]= 0,0,0, 0,0,0
$cd["m711"]["5A"]= "x",0,-2, 0,-2,-2
$cd["m711"]["4D"]= "x","x",0, 0,1,1

$cd["m911"]= @{}
$cd["m911"]["6E"]= 0,0,0, -1,0,"x"
$cd["m911"]["5A"]= 0,0,0, 0,0,0
$cd["m911"]["4D"]= "x",0,0, 0,1,0



$cd["7th"]= @{}
$cd["7th"]["c5A"]= 0,3,2, 3,1,0
$cd["7th"]["e6E"]= 0,2,0, 1,3,0
$cd["7th"]["g6E"]= 3,2,0, 0,0,1
$cd["7th"]["b5A"]= "x",2,1, 2,0,2

$cd["7th"]["6E"]= 0,2,0, 1,0,0
$cd["7th"]["5A"]= 0,0,2, 0,2,0
$cd["7th"]["4D"]= "x",0,0, 2,1,2


$cd["7b9"]= @{}
$cd["7b9"]["6E"]= 0,2,0, 1,0,1
$cd["7b9"]["5A"]= "x",0,-1, 0,-1,"x"
$cd["7b9"]["4D"]= "x","x",0, -1,1,-1


$cd["79"]= @{}
$cd["79"]["f6E"]= 1,0,1, 0,1,"x"

$cd["79"]["6E"]= 0,2,0, 1,0,2
$cd["79"]["5A"]= "x",0,-1, 0,0,0
$cd["79"]["4D"]= "x","x",0, -1,1,0


$cd["7#9"]= @{}
$cd["7#9"]["e6E"]= 0,2,"x", 1,3,3

$cd["7#9"]["6E"]= 0,-1,0, 0,0,"x"
$cd["7#9"]["5A"]= "x",0,-1, 0,1,"x"
$cd["7#9"]["4D"]= "x","x",0, -1,1,1


$cd["7#11"]= @{}
$cd["7#11"]["6E"]= 0,"x",0, 1,-1,"x"
$cd["7#11"]["5A"]="x",0,"x", 0,2,-1
$cd["7#11"]["4D"]= "x",0,0, 1,1,2


$cd["7b13"]= @{}
$cd["7b13"]["6E"]= 0,"x",0, 1,1,"x"
$cd["7b13"]["5A"]= 0,0,2, 0,2,1
$cd["7b13"]["4D"]= "x","x",0, 3,1,2


$cd["713"]= @{}
$cd["713"]["6E"]= 0,2,0, 1,2,0
$cd["713"]["5A"]= 0,0,2, 0,2,2
$cd["713"]["4D"]= "x","x",0, 4,1,2


$cd["b9#11"]= @{}
$cd["b9#11"]["6E"]= 0,1,0, -2,"x","x"
$cd["b9#11"]["5A"]= "x",0,1, 0,-1,-1
$cd["b9#11"]["4D"]= "x","x",0, 1,1,-1


$cd["Maj7b5"]= @{}	# e a d g b e
$cd["Maj7b5"]["6E"]= 0,"x",1, 1,-1,"x"	# eg+b-d+
$cd["Maj7b5"]["5A"]= "x",0,1, 1,2,"x"	# ac+e-g+
$cd["Maj7b5"]["4D"]= "x","x",0, 1,2,2	# df+a-c+


$cd["min7b5"]= @{}
$cd["min7b5"]["b-5A"]= "x",1,2, 1,2,0
$cd["min7b5"]["b5A"]= "x",2,0, 2,3,1

$cd["min7b5"]["6E"]= 0,"x",0, 0,-1,"x"
$cd["min7b5"]["5A"]= "x",0,1, 0,1,"x"
$cd["min7b5"]["4D"]= "x","x",0, 1,1,1


$cd["m7b511"]= @{}
$cd["m7b511"]["6E"]= 0,0,0, "x",-1,"x"
$cd["m7b511"]["5A"]= "x",0,0, 0,"x",-1
$cd["m7b511"]["4D"]= "x","x",0, 1,1,3


$cd["7b5"]= @{}
$cd["7b5"]["6E"]= 0,"x",0, 1,-1,"x"
$cd["7b5"]["5A"]= "x",0,1, 0,2,"x"
$cd["7b5"]["4D"]= "x","x",0, 1,1,2


$cd["Maj7#5"]= @{}
$cd["Maj7#5"]["e6E"]= 0,"x",1, 1,1,0

$cd["Maj7#5"]["6E"]= 0,"x",1, 1,1,"x"
$cd["Maj7#5"]["5A"]= "x",0,-1, -2,-3,-3
$cd["Maj7#5"]["4D"]= "x","x",0, -1,-1,-3


$cd["min7#5"]= @{}
$cd["min7#5"]["6E"]= 0,3,0, 0,1,0
$cd["min7#5"]["5A"]= "x",0,"x", 0,1,1
$cd["min7#5"]["4D"]= "x","x",0, 3,1,1


$cd["mM7"]= @{}
$cd["mM7"]["6E"]= 0,2,1, 0,0,0
$cd["mM7"]["5A"]= 0,0,2, 1,1,0
$cd["mM7"]["4D"]= "x","x",0, 2,2,1


$cd["mM7b5"]= @{}
$cd["mM7b5"]["f4D"]= "x","x",3, 1,0,0
$cd["mM7b5"]["b5A"]= "x",2,0, 3,0,1

$cd["mM7b5"]["6E"]= 0,1,1, 0,"x","x"
$cd["mM7b5"]["5A"]= "x",0,1, 1,1,"x"
$cd["mM7b5"]["4D"]= "x","x",0, 1,2,1


$cd["mM7#5"]= @{}
$cd["mM7#5"]["c5A"]= "x",3,1, 1,0,"x"
$cd["mM7#5"]["e6E"]= 0,3,1, 0,1,0

$cd["mM7#5"]["6E"]= 0,"x",1, 0,1,"x"
$cd["mM7#5"]["5A"]= "x",0,-2, -2,-3,"x"
$cd["mM7#5"]["4D"]= "x","x",0, -2,-1,-3


$cd["mM79"]= @{}
$cd["mM79"]["6E"]= 0,2,1, 0,0,2
$cd["mM79"]["5A"]= "x",0,-2, 1,0,"x"
$cd["mM79"]["4D"]= "x","x",0, -2,2,0


$cd["6th"]= @{}
$cd["6th"]["c5A"]= 0,3,2, 2,1,0
$cd["6th"]["e6E"]= 0,2,2, 1,2,0
$cd["6th"]["f4D"]= "x","x",3, 2,3,1
$cd["6th"]["g6E"]= 3,2,2, 0,0,0

$cd["6th"]["6E"]= 0,"x",-1, 1,0,"x"
$cd["6th"]["5A"]= "x",0,2, -1,2,"x"
$cd["6th"]["4D"]= "x",0,0, 2,0,2


$cd["69"]= @{}
$cd["69"]["6E"]= 0,-1,-1, -1,0,0
$cd["69"]["5A"]= "x",0,-1, -1,0,0
$cd["69"]["4D"]= "x","x",0, -1,0,0


$cd["m6"]= @{}
$cd["m6"]["c5A"]= "x",3,1, 2,1,0
$cd["m6"]["f6E"]= 1,"x",0, 1,1,1
$cd["m6"]["a5A"]= "x",0,2, 2,1,2
$cd["m6"]["b5A"]= "x",2,0, 1,0,2

$cd["m6"]["6E"]= 0,2,2, 0,2,0
$cd["m6"]["5A"]= "x",0,2, "x",1,2
$cd["m6"]["4D"]= "x",0,0, 2,0,1


$cd["m69"]= @{}
$cd["m69"]["g-6E"]= 2,0,1, 1,2,"x"

$cd["m69"]["6E"]= 0,"x",-1, 0,0,2
$cd["m69"]["5A"]= "x",0,-2, -1,0,"x"
$cd["m69"]["4D"]= "x","x",0, -2,0,0



$cd["add9"]= @{}
$cd["add9"]["c5A"]= 0,3,2, 0,3,0
$cd["add9"]["e6E"]= 0,2,2, 1,0,2 # = close
$cd["add9"]["g6E"]= 3,2,0, 0,0,5

$cd["add9"]["6E"]= 0,2,2, 1,0,2
$cd["add9"]["5A"]= "x",0,-1, "x",0,0
$cd["add9"]["4D"]= "x","x",0, -1,-2,0

$cd["add911"]= @{}
$cd["add911"]["6E"]= 0,2,4, 2,0,0
$cd["add911"]["5A"]= 0,0,2, 4,3,0
$cd["add911"]["4D"]= "x",0,0, 2,5,3

$cd["madd9"]= @{}
$cd["madd9"]["6E"]= 0,2,2, 0,0,2
$cd["madd9"]["5A"]= "x",0,2, 4,1,0
$cd["madd9"]["4D"]= "x","x",0, -2,-2,0

$cd["madd911"]= @{}
$cd["madd911"]["6E"]= 0,0,4, 0,0,0
$cd["madd911"]["5A"]= "x",0,0, 4,1,0
$cd["madd911"]["4D"]= "x","x",0, -2,-4,0


$cd["sus2"]= @{}
$cd["sus2"]["c5A"]= "x",3,0, 0,3,3
$cd["sus2"]["g6E"]= 3,0,0, 2,3,3
$cd["sus2"]["6E"]= 0,"x",2, -1,0,"x"
$cd["sus2"]["5A"]= 0,0,2, 2,0,0
$cd["sus2"]["4D"]= "x",0,0, 2,3,0


$cd["6sus2"]= @{}
$cd["6sus2"]["6E"]= 0,"x",-1, -1,0,"x"	# 'ef+bc+' / exc+ f+bx | ead gbe
$cd["6sus2"]["5A"]= 0,0,4, 2,0,0	# 'abef+' / eaf+ abe
$cd["6sus2"]["4D"]= "x",0,0, 2,0,0	# 'deab' / xad abe


$cd["sus4"]= @{}
$cd["sus4"]["c5A"]= "x",3,3, 0,1,1
$cd["sus4"]["g6E"]= 3,3,0, 0,1,3

$cd["sus4"]["6E"]= 0,2,2, 2,0,0
$cd["sus4"]["5A"]= 0,0,2, 2,3,0
$cd["sus4"]["4D"]= "x",0,0, 2,3,3


$cd["7sus4"]= @{}
$cd["7sus4"]["6E"]= 0,2,0, 2,0,0
$cd["7sus4"]["5A"]= 0,0,2, 0,3,0
$cd["7sus4"]["4D"]= "x",0,0, 2,1,3


$cd["9sus4"]= @{}
$cd["9sus4"]["6E"]= 0,0,0, -1,-2,-2
$cd["9sus4"]["5A"]= 0,0,0, 0,0,0
$cd["9sus4"]["4D"]= "x",0,0, 0,1,0


$cd["13sus4"]= @{}
$cd["13sus4"]["6E"]= 0,2,0, 2,2,0
$cd["13sus4"]["5A"]= 0,0,2, 0,3,2
$cd["13sus4"]["4D"]= "x","x",0, 4,1,3


$cd["aug"]= @{}
$cd["aug"]["d4D"]= "x","x",0, 3,3,2
$cd["aug"]["a-4D"]= "x","x",2, 1,1,0
$cd["aug"]["a4D"]= "x","x",3, 2,2,1
$cd["aug"]["b-4D"]= "x","x",4, 3,3,2

$cd["aug"]["6E"]= 0,"x",2, 1,1,0
$cd["aug"]["5A"]= "x",0,-1, -2,-2,"x"
$cd["aug"]["4D"]= "x","x",0, -1,-1,-2


$cd["aug7"]= @{}
$cd["aug7"]["6E"]= 0,"x",0, 1,1,0
$cd["aug7"]["5A"]= "x",0,3, 0,2,1
$cd["aug7"]["4D"]= "x","x",0, 3,1,2


$cd["dim"]= @{}
$cd["dim"]["6E"]= 0,"x",2, 0,-1,"x"
$cd["dim"]["5A"]= "x",0,1, 2,1,"x"
$cd["dim"]["4D"]= "x","x",0, 1,3,1


$cd["dim7"]= @{}
$cd["dim7"]["e5A"]= "x",1,2, 0,2,"x"

$cd["dim7"]["6E"]= 0,"x",-1, 0,-1,"x"
$cd["dim7"]["5A"]= "x",0,1, -1,1,"x"
$cd["dim7"]["4D"]= "x","x",0, 1,0,1
 
$rot= @{} 

$rot["6E"]=	"6323 1232",
		"6313 1313",
		"6312 4312",
		"6321 4321",

		"6321 ^232",

		"6313 4313",
		"6325 3241",
		"6324 1232",
		"1232 1232",

		"632 123 432 123",
		"632 123 132 132"

$rot["5A"]=	"5323 1232",
		"5313 1313",
		"5312 4312",
		"5321 4321",

		"5321 ^232",

		"5313 4313",
		"5325 3241",
		"5324 1232",
		"1232 1232",

		"532 123 432 123",
		"532 123 132 132"

$rot["4D"]=	"4323 1232",
		"4313 1313",
		"4312 4312",
		"4321 4321",

		"4321 ^232",

		"4313 4313",
		"4324 3241",
		"4324 1232",
		"1232 1232",

		"432 123 432 123",
		"432 123 132 132"
 
# gui 
	 
function Trayarp_hide([string]$t){ 

	switch($t){
	'true'{

		$tray_arp.Visible= $True
		$menu_aty.Text= "v Task tray"
		break;
	}'false'{

		$tray_arp.Visible= $False
		$menu_aty.Text= "Task tray"
	}
	} #sw

	return $t
 } #func
 
function Contxtarp_state([string]$t,[int[]]$ss){ 

  switch($t){

  '最小化'{

    $contxt_trayarp.Items.Clear()
    [void]$contxt_trayarp.Items.Add("元に戻す")
    [void]$contxt_trayarp.Items.Add("環境設定")
    [void]$contxt_trayarp.Items.Add("終了")

    $ss[0]= 1 # 小、元

    if($frm_arp.WindowState -eq 'Normal'){
	$ss[1]= 1; $frm_arp.WindowState= "Minimized"
    }

    return $ss
    break;

  }'元に戻す'{

    $contxt_trayarp.Items.Clear()
    [void]$contxt_trayarp.Items.Add("最小化")
    [void]$contxt_trayarp.Items.Add("環境設定")
    [void]$contxt_trayarp.Items.Add("終了")

    if($ss[1] -eq 1){ $frm_arp.WindowState= "Normal" }

    $ss= 0, 0

    return $ss
    break;

  }'環境設定'{
    $arp_menu_set.PerformClick()
    break;

  }'終了'{
    $arp_menu_n.PerformClick()
  }
  } #sw

  return $ss

 } #func
 
function Oscarp_sw([string]$t){ 


	$arp_menu_oct1.Text= "o1"
	$arp_menu_oct2.Text= "o2"
	$arp_menu_oct3.Text= "o3"
	$arp_menu_oct4.Text= "o4"
	$arp_menu_oct5.Text= "o5"
	$arp_menu_oct6.Text= "o6"
	$arp_menu_oct7.Text= "o7"
	$arp_menu_oct8.Text= "o8"

	switch($t){

	'o1'{	$arp_menu_oct1.Text= "[v] o1";	break;
	}'o2'{	$arp_menu_oct2.Text= "[v] o2";	break;
	}'o3'{	$arp_menu_oct3.Text= "[v] o3";	break;
	}'o4'{	$arp_menu_oct4.Text= "[v] o4";	break;
	}'o5'{	$arp_menu_oct5.Text= "[v] o5";	break;
	}'o6'{	$arp_menu_oct6.Text= "[v] o6";	break;
	}'o7'{	$arp_menu_oct7.Text= "[v] o7";	break;
	}'o8'{	$arp_menu_oct8.Text= "[v] o8"
	}
	} #sw

	return $t
} #func
 
function Arpmenu_build([string]$sw){ 

  [string]$d= "[v] "

  [string[]]$n= Split_path $val[$sw]

  switch($sw){
  'compiler'{

	[array]$w= $comp.Keys

	$arp_menu_cmp0.Visible= $False
	$arp_menu_cmp1.Visible= $False
	$arp_menu_cmp2.Visible= $False
	$arp_menu_cmp3.Visible= $False
	$arp_menu_cmp4.Visible= $False
	$arp_menu_cmp5.Visible= $False

	if($w.Length -ge 1){ # if nomi de add kousei

		$arp_menu_cmp0.Visible= $True

		if($n[0] -eq $w[0]){ $arp_menu_cmp0.Text= $d+ $w[0]
		}else{ $arp_menu_cmp0.Text= $w[0]
		}

		if($w.Length -ge 2){

		$arp_menu_cmp1.Visible= $True

		if($n[0] -eq $w[1]){ $arp_menu_cmp1.Text= $d+ $w[1]
		}else{ $arp_menu_cmp1.Text= $w[1]
		}

			if($w.Length -ge 3){

		$arp_menu_cmp2.Visible= $True

		if($n[0] -eq $w[2]){ $arp_menu_cmp2.Text= $d+ $w[2]
		}else{ $arp_menu_cmp2.Text= $w[2]
		}

				if($w.Length -ge 4){

		$arp_menu_cmp3.Visible= $True

		if($n[0] -eq $w[3]){ $arp_menu_cmp3.Text= $d+ $w[3]
		}else{ $arp_menu_cmp3.Text= $w[3]
		}

					if($w.Length -ge 5){

		$arp_menu_cmp4.Visible= $True

		if($n[0] -eq $w[4]){ $arp_menu_cmp4.Text= $d+ $w[4]
		}else{ $arp_menu_cmp4.Text= $w[4]
		}

						if($w.Length -ge 6){

		$arp_menu_cmp5.Visible= $True

		if($n[0] -eq $w[5]){ $arp_menu_cmp5.Text= $d+ $w[5]
		}else{ $arp_menu_cmp5.Text= $w[5]
		}
						}
					}
				}
			}
		}
	}
	break;

  }'player'{
	[array]$w= $play.Keys

	$arp_menu_ply0.Visible= $False
	$arp_menu_ply1.Visible= $False
	$arp_menu_ply2.Visible= $False
	$arp_menu_ply3.Visible= $False

	if($w.Length -ge 1){

		$arp_menu_ply0.Visible= $True

		if($n[0] -eq $w[0]){ $arp_menu_ply0.Text= $d+ $w[0]
		}else{ $arp_menu_ply0.Text= $w[0]
		}

		if($w.Length -ge 2){

		$arp_menu_ply1.Visible= $True

		if($n[0] -eq $w[1]){ $arp_menu_ply1.Text= $d+ $w[1]
		}else{ $arp_menu_ply1.Text= $w[1]
		}

			if($w.Length -ge 3){

		$arp_menu_ply2.Visible= $True

		if($n[0] -eq $w[2]){ $arp_menu_ply2.Text= $d+ $w[2]
		}else{ $arp_menu_ply2.Text= $w[2]
		}

				if($w.Length -ge 4){

		$arp_menu_ply3.Visible= $True

		if($n[0] -eq $w[3]){ $arp_menu_ply3.Text= $d+ $w[3]
		}else{ $arp_menu_ply3.Text= $w[3]
		}
				}
			}
		}
	}
	break;

  }'dos'{
	[array]$w= $dosv.Keys

	$arp_menu_dos0.Visible= $False
	$arp_menu_dos1.Visible= $False
	$arp_menu_dos2.Visible= $False
	$arp_menu_dos3.Visible= $False

	if($w.Length -ge 1){

		$arp_menu_dos0.Visible= $True

		if($n[0] -eq $w[0]){ $arp_menu_dos0.Text= $d+ $w[0]
		}else{ $arp_menu_dos0.Text= $w[0]
		}

		if($w.Length -ge 2){

		$arp_menu_dos1.Visible= $True

		if($n[0] -eq $w[1]){ $arp_menu_dos1.Text= $d+ $w[1]
		}else{ $arp_menu_dos1.Text= $w[1]
		}

			if($w.Length -ge 3){

		$arp_menu_dos2.Visible= $True

		if($n[0] -eq $w[2]){ $arp_menu_dos2.Text= $d+ $w[2]
		}else{ $arp_menu_dos2.Text= $w[2]
		}

				if($w.Length -ge 4){

		$arp_menu_dos3.Visible= $True

		if($n[0] -eq $w[3]){ $arp_menu_dos3.Text= $d+ $w[3]
		}else{ $arp_menu_dos3.Text= $w[3]
		}
				}
			}
		}
	}
	break;

  }'editor'{
	[array]$w= $edit.Keys

	$arp_menu_edt0.Visible= $False
	$arp_menu_edt1.Visible= $False
	$arp_menu_edt2.Visible= $False
	$arp_menu_edt3.Visible= $False

	if($w.Length -ge 1){

		$arp_menu_edt0.Visible= $True

		if($n[0] -eq $w[0]){ $arp_menu_edt0.Text= $d+ $w[0]
		}else{ $arp_menu_edt0.Text= $w[0]
		}

		if($w.Length -ge 2){

		$arp_menu_edt1.Visible= $True

		if($n[0] -eq $w[1]){ $arp_menu_edt1.Text= $d+ $w[1]
		}else{ $arp_menu_edt1.Text= $w[1]
		}

			if($w.Length -ge 3){

		$arp_menu_edt2.Visible= $True

		if($n[0] -eq $w[2]){ $arp_menu_edt2.Text= $d+ $w[2]
		}else{ $arp_menu_edt2.Text= $w[2]
		}

				if($w.Length -ge 4){

		$arp_menu_edt3.Visible= $True

		if($n[0] -eq $w[3]){ $arp_menu_edt3.Text= $d+ $w[3]
		}else{ $arp_menu_edt3.Text= $w[3]
		}
				}
			}
		}
	}
  }
  } #sw
 } #func
 
function Arpstus_build(){ 

	[string[]]$t= Split_path $val["compiler"]
	[string[]]$s= Split_path $val["player"]

	$arp_label.Text= "  cmp: "+ $t[0]+ " | ply: "+ $s[0]+ " | oct: "+ $opt["oct"] +" | Track Header: "+ $comb_prefix.SelectedItem
 } #func
 
function Arpchange_value([string]$sw, [string]$name){ 


  if($name -match '[v]' -eq $False){

	switch($sw){
	'compiler'{	$script:val[$sw]= $comp[$name]	;break;
	}'player'{	$script:val[$sw]= $play[$name];	break;
	}'dos'{	$script:val[$sw]= $dosv[$name];	break;
	}'editor'{	$script:val[$sw]= $edit[$name]
	}
	} #sw
  }
 } #func
 
function Mml_select([string]$sw){ 

	switch($sw){
	'none'{

		$arp_menu_fix.Enabled= $False

		$box_trk.Text= ""
		$comb_trk.SelectedIndex= 0
		break;

	}'ppmck'{

		$arp_menu_fix.Enabled= $True

		$box_trk.Text= "A  B  a  b"
		$comb_trk.SelectedIndex= 0

		$comb_oct.SelectedItem= "< >"
		$comb_tai.SelectedItem= "^"
		$nmud_trk.Value= "4"

		$script:val["compiler"]= $val["mck"]
		break;

	}'NSDlib'{

		$arp_menu_fix.Enabled= $True

		$box_trk.Text= "1  2  15  16"
		$comb_trk.SelectedIndex= 2

		$comb_oct.SelectedItem= '" `'
		$comb_tai.SelectedItem= "^"
		$nmud_trk.Value= "4"

		$script:val["compiler"]= $val["nsd"]
		break;

	}'PMD'{

		$arp_menu_fix.Enabled= $True

		$box_trk.Text= "G  H  I"
		$comb_trk.SelectedIndex= 0

		$comb_oct.SelectedItem= "< >"
		$comb_tai.SelectedItem= "&"
		$nmud_trk.Value= "3"

		$script:val["compiler"]= $val["pmd"]
		break;

	}'Fmp7'{

		$arp_menu_fix.Enabled= $False

		$box_trk.Text= "A0  A1  A2  A3"
		$comb_trk.SelectedIndex= 1

		$comb_oct.SelectedItem= "< >"
		$comb_tai.SelectedItem= "&"
		$nmud_trk.Value= "4"
		break;

	}'sakura mml'{

		$arp_menu_fix.Enabled= $False

		$box_trk.Text= "(1)  (2)  (3)  (4)"
		$comb_trk.SelectedIndex= 2

		$comb_oct.SelectedItem= '" `'
		$comb_tai.SelectedItem= "^"
		$nmud_trk.Value= "4"

	}
	} #sw
 } #func
 	 
# Hash Xml 
	
function Setxml_read($x){ # hash読み込み 

  # $x= $script:set_xml.table

  for([int]$i=3; $i -ge 0; $i--){

	if($x.mck[$i].name -ne ''){

		$script:comp[$x.mck[$i].name]= $x.mck[$i].param
	}
	if($x.nsd[$i].name -ne ''){

		$script:comp[$x.nsd[$i].name]= $x.nsd[$i].param
	}
	if($x.pmd[$i].name -ne ''){

		$script:comp[$x.pmd[$i].name]= $x.pmd[$i].param
	}

	if($x.ply[$i].name -ne ''){

		$script:play[$x.ply[$i].name]= $x.ply[$i].param
	}
	if($x.edt[$i].name -ne ''){

		$script:edit[$x.edt[$i].name]= $x.edt[$i].param
	}
	if($x.dos[$i].name -ne ''){

		$script:dosv[$x.dos[$i].name]= $x.dos[$i].param
	}
  } #
 } #func
 
function Arpxml_read($x,$y){ # ワーク読み込み 

	# $x= $script:arp_xml.table.val
	# $y= $script:arp_xml.table.opt


	$comb_prefix.SelectedItem= $y.osc.value

	$script:key["tray"]= Trayarp_hide $y.tray.value


	$script:opt["oct"]= Oscarp_sw $y.oct.value
	$script:opt["chk_dos"]= $y.bit.value

	$script:val["mck"]= $x.mck.value
	$script:val["nsd"]= $x.nsd.value
	$script:val["pmd"]= $x.pmd.value

	$script:val["compiler"]= $x.cmp.value
	$script:val["player"]= $x.ply.value
	$script:val["dos"]= $x.dos.value
	$script:val["editor"]= $x.edt.value

 } #func
 
function Arpwrite_xml($x,$y){ 

	# $x= $script:arp_xml.table.val
	# $y= $script:arp_xml.table.opt

	$y.tray.value= [string]$key["tray"]

	$y.osc.value= [string]$comb_prefix.SelectedItem
	$y.bit.value= [string]$opt["chk_dos"]

	$x.mck.value= [string]$val["mck"]
	$x.nsd.value= [string]$val["nsd"]
	$x.pmd.value= [string]$val["pmd"]
	$x.cmp.value= [string]$val["compiler"] # $xmlは[string]キャスト必要

	$x.ply.value= [string]$val["player"]
	$x.dos.value= [string]$val["dos"]
	$x.edt.value= [string]$val["editor"]

 } #func
  
# Chord select 
	
function Gen_num([string]$kk,[string]$gg){ 

	$r= @{}

	$r["C"] =  8, 3,10
	$r["Db"]=  9, 4,11
	$r["D"] = 10, 5, 0
	$r["Eb"]= 11, 6, 1
	$r["E"] =  0, 7, 2
	$r["F"] =  1, 8, 3
	$r["Gb"]=  2, 9, 4
	$r["G"] =  3,10, 5
	$r["Ab"]=  4,11, 6
	$r["A"] =  5, 0, 7
	$r["Bb"]=  6, 1, 8
	$r["B"] =  7, 2, 9

	[array]$uu= $r[$kk]

	switch($gg){ # switch dato '6E' ni.  constructor deno int fuuji.

	'6E'{ [int]$i= 0;	break;
	}'5A'{ [int]$i= 1;	break;
	}'4D'{ [int]$i= 2
	}
	} #sw

	return $uu[$i]
} #func
 
function Flet_num([int]$flet, [array]$chd){ 


	[array]$tt= "x","x","x", "x","x","x"
	[int]$s= 0

	[int]$j= 0
	while($j -lt 6){

		if($chd[$j] -ne 'x'){

			$tt[$j]= $chd[$j] + $flet

			if($tt[$j] -lt 0){ $s= 1 } # マイナス値チェック
		}
		$j++;
	} #

	if($s -ne 0){

		[int]$j= 0
		while($j -lt 6){
			if($chd[$j] -ne 'x'){

				$tt[$j]+= 12 # 12フレット下へ
			}
			$j++;
		} #
	}

	return $tt
} #func
 
function Fret_build([array]$chd_select,$cd){ 

  [string]$k= $chd_select[0] # $keys
  [string]$d= $chd_select[1] # $chords
  [string]$s= $chd_select[2] # $root strings
  [string]$p= $chd_select[3] # $open chord


  switch -CaseSensitive ($d){ # [-c] M7,m7,genmitsu ni. hash deha tabunn dekinai
  'M7'{	$d= "Maj7";	break;
  }'m7'{	$d= "min7";	break;
  }'M79'{	$d= "Maj79";	break;
  }'m79'{	$d= "min79";	break;
  }'M7#5'{	$d= "Maj7#5";	break;
  }'m7#5'{	$d= "min7#5";	break;
  }'M7b5'{	$d= "Maj7b5";	break;
  }'m7b5'{	$d= "min7b5";	break;

  }'711'{	$d= "7sus4";	break;
  }'913'{	$d= "69";		break;
  }'#9b13'{	$d= "min7#5";	break;
  }'7#5'{	$d= "aug7"
  }
  } #sw


  if($p -eq 'Checked'){ # $open chord

	switch($d){
	'Maj'{
		if($s -eq '5A'-and $k -eq 'C'){ $s= "c5A" }
		if($s -eq '6E'-and $k -eq 'G'){ $s= "g6E" }
		break; # break ha elseif to onagi
	}'Maj7'{
		if($s -eq '5A'-and $k -eq 'C'){ $s= "c5A" }
		if($s -eq '4D'-and $k -eq 'F'){ $s= "f4D" }
		if($s -eq '6E'-and $k -eq 'G'){ $s= "g6E" }
		break;
	}'M7#11'{
		if($s -eq '5A'-and $k -eq 'C'){ $s= "c5A" }
		break;
	}'min'{
		if($s -eq '5A'-and $k -eq 'Db'){ $s= "d-5A" }
		if($s -eq '6E'-and $k -eq 'E'){ $s= "e6E" }
		break;
	}'min7'{
		if($s -eq '5A'-and $k -eq 'Db'){ $s= "d-5A" }
		if($s -eq '6E'-and $k -eq 'E'){ $s= "e6E" }
		break;
	}'min79'{
		if($s -eq '6E'-and $k -eq 'Gb'){ $s= "g-6E" }
		break;
	}'m711'{
		if($s -eq '6E'-and $k -eq 'Gb'){ $s= "g-6E" }
		break;
	}'add9'{
		if($s -eq '5A'-and $k -eq 'C'){ $s= "c5A" }
		if($s -eq '6E'-and $k -eq 'E'){ $s= "e6E" }
		if($s -eq '6E'-and $k -eq 'G'){ $s= "g6E" }
		break;
	}'sus2'{
		if($s -eq '5A'-and $k -eq 'C'){ $s= "c5A" }
		if($s -eq '6E'-and $k -eq 'G'){ $s= "g6E" }
		break;
	}'sus4'{
		if($s -eq '5A'-and $k -eq 'C'){ $s= "c5A" }
		if($s -eq '6E'-and $k -eq 'G'){ $s= "g6E" }
		break;
	}'7th'{
		if($s -eq '5A'-and $k -eq 'C'){ $s= "c5A" }
		if($s -eq '6E'-and $k -eq 'E'){ $s= "e6E" }
		if($s -eq '6E'-and $k -eq 'G'){ $s= "g6E" }
		if($s -eq '5A'-and $k -eq 'B'){ $s= "b5A" }
		break;
	}'79'{
		if($s -eq '6E'-and $k -eq 'F'){ $s= "f6E" }
		break;
	}'7#9'{
		if($s -eq '6E'-and $k -eq 'E'){ $s= "e6E" }
		break;
	}'6th'{
		if($s -eq '5A'-and $k -eq 'C'){ $s= "c5A" }
		if($s -eq '6E'-and $k -eq 'E'){ $s= "e6E" }
		if($s -eq '4D'-and $k -eq 'F'){ $s= "f4D" }
		if($s -eq '6E'-and $k -eq 'G'){ $s= "g6E" }
		break;
	}'m6'{
		if($s -eq '5A'-and $k -eq 'C'){ $s= "c5A" }
		if($s -eq '6E'-and $k -eq 'F'){ $s= "f6E" }
		if($s -eq '5A'-and $k -eq 'A'){ $s= "a5A" }
		if($s -eq '5A'-and $k -eq 'B'){ $s= "b5A" }
		break;
	}'m69'{
		if($s -eq '6E'-and $k -eq 'Gb'){ $s= "g-6E" }
		break;
	}'mM7b5'{
		if($s -eq '4D'-and $k -eq 'F'){ $s= "f4D" }
		if($s -eq '5A'-and $k -eq 'B'){ $s= "b5A" }
		break;
	}'mM7#5'{
		if($s -eq '5A'-and $k -eq 'C'){ $s= "c5A" }
		if($s -eq '6E'-and $k -eq 'E'){ $s= "e6E" }
		break;
	}'aug'{
		if($s -eq '4D'-and $k -eq 'D'){ $s= "d4D" }
		if($s -eq '4D'-and $k -eq 'Ab'){ $s= "a-4D" }
		if($s -eq '4D'-and $k -eq 'A'){ $s= "a4D" }
		if($s -eq '4D'-and $k -eq 'Bb'){ $s= "b-4D" }
		break;
	}'Maj7#5'{
		if($s -eq '6E'-and $k -eq 'E'){ $s= "e6E" }
		break;
	}'dim7'{
		if($s -eq '5A'-and $k -eq 'E'){ $s= "e5A" }
		break;
	}'m7b5'{
		if($s -eq '5A'-and $k -eq 'Bb'){ $s= "b-5A" }
		if($s -eq '5A'-and $k -eq 'B'){ $s= "b5A" }
	}
	} #sw
  }


  if($s -eq '6E' -or $s -eq '5A' -or $s -eq '4D'){

	$Pictbox.Image= [System.Drawing.Image]::FromFile(".\img\blue.png")

	[int]$flet= Gen_num $k $s
	[array]$arr= Flet_num $flet $cd[$d][$s]

  }else{
	$Pictbox.Image= [System.Drawing.Image]::FromFile(".\img\orange.png")

	[array]$arr= $cd[$d][$s] # $open chord
  }

  $box_flet.Text= $arr -join '  '

  return $arr
 } #func
 
function Chd_build([array]$b,[array]$flet){ 


  [array]$rr= @("","","", "","","")  # jag

$rr[5]=	'`e', '`f',('`'+ $b[4]),'`g',('`'+ $b[0]),'`a',('`'+ $b[1]),'`b','``c',('``'+ $b[2]),'``d',('``'+ $b[3]),
	'``e', '``f',('``'+ $b[4]),'``g'

$rr[4]=	'b', '`c',('`'+ $b[2]),'`d',('`'+ $b[3]),'`e', '`f',('`'+ $b[4]),'`g',('`'+ $b[0]),'`a',('`'+ $b[1]),
	'`b', '``c',('``'+ $b[2]),'``d'

$rr[3]=	'g',$b[0],'a',$b[1],'b', '`c',('`'+ $b[2]),'`d',('`'+ $b[3]),'`e','`f',('`'+ $b[4]),
	'`g',('`'+ $b[0]),'`a',('`'+ $b[1])

$rr[2]=	'd',$b[3],'e', 'f',$b[4],'g',$b[0],'a',$b[1],'b','`c',('`'+ $b[2]),
	'`d',('`'+ $b[3]),'`e', '`f'

$rr[1]=	'"a',('"'+ $b[1]),'"b', 'c',$b[2],'d',$b[3],'e','f',$b[4],'g',$b[0],
	'a',$b[1],'b', '`c'

$rr[0]=	'"e', '"f',('"'+ $b[4]),'"g',('"'+ $b[0]),'"a',('"'+ $b[1]),'"b', 'c',$b[2],'d',$b[3],
	'e', 'f',$b[4],'g'



	[array]$qq= "x","x","x", "x","x","x"

	for([int]$i= 0; $i -lt 6; $i++){


		switch($flet[$i]){

		''{	break;	# 2B_ _ ""
		#}' '{	break;	# 2B_ _"_" # fuyoh
		}'x'{	break;

		}default{
			# [int]$num= $flet[$i] -as [int]  # chikarazuku cast
			[int]$num= [int]::Parse($flet[$i])

			if($num -le 15){ # hairetsu 15 fret made

				$qq[$i]= $rr[$i][$num]  # num -> abc
			}else{
				Write-Host 'err >> フレット数がオーバー'
			}
		}
		} #sw
	} #

	if($comb_oct.SelectedItem -eq "< >"){

		$box_chd.Text= Oct_hogen ($qq -join '')
	}else{
		$box_chd.Text= $qq -join ''
	}

	return $qq
 } #func
 
function Importer_chd([string]$mm){ 

	[array]$rr= $mm.ToCharArray()
	$rr+= "$"

	[string]$dd= ""
	[string]$ss= ""

	[array]$out= @()
	[int]$sw= 0
	[int]$i= 0

  foreach($dd in $rr){

	  if($sw -eq 5){ # a4
		switch($dd){
		'+'{ $ss+= $dd; break
		}'-'{ $ss+= $dd; break
		}'#'{ $ss+= $dd; break
		}default{
			$i+= $j
			$ss= (Oct_number $i '"' '`')+ $ss
			$i= 0

			$out+= $ss
			$ss= ""
			$sw= 0
		}
		} #sw
	}
	if($sw -eq 0){
		if($dd -eq '$'){ break; }

		switch($dd){
		'<'{ $j--; break
		}'>'{ $j++; break
		}'"'{ $i--; break
		}'`'{ $i++; break
		}'a'{ $ss+= $dd; $sw= 5; break
		}'b'{ $ss+= $dd; $sw= 5; break
		}'c'{ $ss+= $dd; $sw= 5; break
		}'d'{ $ss+= $dd; $sw= 5; break
		}'e'{ $ss+= $dd; $sw= 5; break
		}'f'{ $ss+= $dd; $sw= 5; break
		}'g'{ $ss+= $dd; $sw= 5; break
		}"x"{ $ss+= $dd; $sw= 5; break
		}default{ # ' ' etc.
		}
		} #sw
	}
  } #

	if($sw -ne 0){ Write-Host ("Importer_chd ERR >> "+ $sw) }

	if($out.Length -gt 6){

		$out= $out[0..5]
	}
	if($out.Length -lt 6){

		[int]$len= 6- $out.Length
		for([int]$i= 0; $i -lt $len; $i++){
			$out+= "x"
		} #
	}

	if($comb_oct.SelectedItem -eq "< >"){
		$box_chd.Text= Oct_hogen ($out -join '')
	}else{
		$box_chd.Text= $out -join ''
	}

	return $out
 } #func
 
function Keydown_chd_arp([string]$t){ 

  switch($t){
  'F12'{
		$lisn_btn.PerformClick()
		break
  }'F11'{
		$stop_btn.PerformClick()
		break
  }'F5'{
		$import_chd_btn.PerformClick()
  }
  } #sw
 } #func
  
# MML arpeggio 
	
function Trk_split([string]$mm){ 

	[array]$rr= $mm.ToCharArray()
	[string]$dd= ""

	[string[]]$qq= @() # karachi
	[string]$tt= ""
	[int]$i= 0

	foreach($dd in $rr){

		if($i -ge 2){ # >= space 2 kode

			$qq+= $tt
			$tt= $dd
			$i= 0
		}else{
			if($dd -eq ' '){

				$i++;
			}else{
				$tt+= $dd
			}
		}
	} #

	$qq+= $tt # atoshimatsu


	[int]$trk= $nmud_trk.Value
	[string[]]$uu= ""; $uu*= $trk

	[string]$pre= $comb_trk.SelectedItem

	for([int]$j= 0; $j -lt $trk; $j++){

		if($j -lt $qq.Length){

			$uu[$j]= $pre+ $qq[$j]+ ' '
		}else{
			$uu[$j]= $pre+ ' ' # tr number ga nai
		}
	} #

	return $uu # $script:track_parm
 } #func
 
function Oct_number([int]$num, [string]$aa, [string]$bb){ 

	[string]$xx= ""
	[int]$i= 0

	if($num -lt 0){ $xx= $aa; $i= -$num }
	if($num -gt 0){ $xx= $bb; $i= $num }

	$xx*= $i

	return $xx
 } #func
 
function Oct_hogen([string]$out){ 

	[array]$rr= $out.ToCharArray()
	[string]$dd= ""

	[int]$i= 0
	[int]$j= 0
	[int]$sw= 0
	[int]$kk= 0

	foreach($dd in $rr){

		switch($dd){
		'"'{ $i--; break
		}'`'{ $i++; break
		}'a'{ $sw= 1; break
		}'b'{ $sw= 1; break
		}'c'{ $sw= 1; break
		}'d'{ $sw= 1; break
		}'e'{ $sw= 1; break
		}'f'{ $sw= 1; break
		}'g'{ $sw= 1; break
		}
		} #sw

		if($sw){
			$j= -$j+ $i		# -2= 1 -1 # 2= -1 1

			if($j -ne 0){

				$out= $out.Insert($kk, (Oct_number $j "<" ">"))
				## $output+= (Oct_number $j "<" ">")

				if($j -lt 0){
					$kk+= -$j # "<<" -2 zure add
				}else{
					$kk+= $j # ">>" 2 zure add
				}
			}

			$j= $i # point store
			$i= 0
			$sw= 0
		}

		$kk++
	} #

	$j= -$j # koreo irenaito err

	$out= $out.Insert($kk, (Oct_number $j "<" ">")) # -$j deha err

	$out= $out.Replace('"', '') # remove
	$out= $out.Replace('`', '')

	return $out
 } #func
 
function Tai_hogen([string]$out){ 

	[array]$rr= $out.ToCharArray()
	[string]$dd= ""

	[string]$store= ""
	[int]$sw= 0
	[int]$kk= 0

	foreach($dd in $rr){

		switch($dd){
		'a'{ $sw= 1; break
		}'b'{ $sw= 1; break
		}'c'{ $sw= 1; break
		}'d'{ $sw= 1; break
		}'e'{ $sw= 1; break
		}'f'{ $sw= 1; break
		}'g'{ $sw= 1; break
		}'#'{ $sw= 2; break
		}'+'{ $sw= 2; break
		}'-'{ $sw= 2; break
		}'^'{ $sw= 3; break
		}
		} #sw

		switch($sw){
		1{
			$store= $dd
			$sw= 0
			break
		}2{
			$store+= $dd
			$sw= 0
			break
		}3{
			$out= $out.Insert($kk, ('&'+ $store))
			## $output+= ('&'+ $store)

			$kk+= 1+ $store.Length
			$sw= 0
		}
		} #sw

		$kk++
	} #

	$out= $out.Replace('^', '')

	return $out
 } #func
 
function Wait_hogen([string]$out){ 


	# $out= $out -replace '^', 'w' # <- bug
	$out= $out.Replace('^', 'w')

	return $out
 } #func
 
function Importer([string]$mm){ 

	[array]$rr= $mm.ToCharArray()
	$rr+= "$"

	[string]$dd= ""

	[string]$out= ""
	[int]$sw= 0
	[int]$i= 0
	[int]$j= 0

	foreach($dd in $rr){

		if($dd -eq '$'){ break; } # loop break

		switch($dd){
		'<'{ $j--; break
		}'>'{ $j++; break
		}'"'{ $i--; break
		}'`'{ $i++; break
		}'a'{ $sw= 1; break
		}'b'{ $sw= 1; break
		}'c'{ $sw= 1; break
		}'d'{ $sw= 1; break
		}'e'{ $sw= 1; break
		}'f'{ $sw= 1; break
		}'g'{ $sw= 1; break
		}default{ $out+= $dd
		}
		} #sw

		if($sw){
			$i+= $j
			$out+= (Oct_number $i '"' '`')
			$out+= $dd
			$i= 0
			$sw= 0
		}
	} #

	return $out
 } #func
 
function Xyz_sorter([string]$mm){ 

	[array]$rr= $mm.ToCharArray()
	[string]$dd= ""

	[string]$out= ""
	[array]$cc= @()
	[array]$ss= @() # space insert
	[int]$i= 0

	foreach($dd in $rr){
		switch($dd){
		"t"{	$cc+= $dd; break
		}"v"{	$cc+= $dd; break
		}"x"{	$cc+= $dd; break
		}' '{	$ss+= $i; break # 4,9,14
		}default{
			$cc= $cc | sort
			$out+= $cc -join ""
			$cc= @()

			$out+= $dd
		}
		} #sw

		$i++
	} #

	$cc= $cc | sort
	$out+= $cc -join ""

	for([int]$j= 0; $j -lt $ss.Length; $j++){
			$out= $out.Insert($ss[$j], " ") # 4,9,14
	} #

	return $out
 } #func
 
function Mml_gene([int]$trk, [int]$tai_count, [string]$mm){ 

	[array]$brr= $mm.ToCharArray()
	$brr+= "$" # last $num= 0 tame

	[string]$dd= ""

	[array]$taic= 0;		$taic*= $trk
	[array]$out= "";	$out*= $trk

	[int]$sw= 0

	[string]$set= ""
	[string]$tt= ""
	[string]$ss= ""

	[int]$i= 0
	[int]$num= 0 # "^" tame

foreach($dd in $brr){

  if($sw -eq 10){ # a+
	switch($dd){
	'+'{ $tt+= $dd; break
	}'-'{ $tt+= $dd; break
	}'#'{ $tt+= $dd; break
	}default{
		$sw= 5
	}
	} #sw
  }
  if($sw -eq 5){ # a+4
	switch($dd){
	'0'{ $ss+= $dd; break
	}'1'{ $ss+= $dd; break
	}'2'{ $ss+= $dd; break
	}'3'{ $ss+= $dd; break
	}'4'{ $ss+= $dd; break
	}'5'{ $ss+= $dd; break
	}'6'{ $ss+= $dd; break
	}'7'{ $ss+= $dd; break
	}'8'{ $ss+= $dd; break
	}'9'{ $ss+= $dd; break
	}default{
		switch($set){
		'a-g'{
			$num= $i% $trk

			for([int]$j= 0; $j -lt $trk; $j++){
				if($num -ne $j){

					if($taic[$j] -le 0){ # <=
						$out[$j]+= "x"+ $ss
					}else{
						$out[$j]+= "v"+ $ss
					}
					$taic[$j]--

				}else{
					$out[$j]+= $tt+ $ss
					$taic[$j]= $tai_count
				}
			} #
			$i++
			$tt= ""
			break
		}'^'{
			for([int]$j= 0; $j -lt $trk; $j++){
				if($num -ne $j){

					if($taic[$j] -le 0){ # <=
						$out[$j]+= "x"+ $ss
					}else{
						$out[$j]+= "v"+ $ss
					}
					$taic[$j]--

				}else{
						$out[$j]+= "t"+ $ss
				}
			} #
			break
		}'r'{
			for([int]$j= 0; $j -lt $trk; $j++){
				$out[$j]+= "x"+ $ss
				$taic[$j]= 0
			} #
		}
		} #sw

		$ss= ""
		$sw= 0
	}
	} #sw
  }
  if($sw -eq 0){
	if($dd -eq '$'){ break; } # loop break

	switch($dd){
	'^'{	$set= $dd; $sw= 5; break
	}'r'{	$set= $dd; $sw= 5; break

	}'"'{	$tt+= $dd;	break
	}'`'{	$tt+= $dd;	break

	}'a'{	$tt+= $dd; $set= "a-g"; $sw= 10; break
	}'b'{	$tt+= $dd; $set= "a-g"; $sw= 10; break
	}'c'{	$tt+= $dd; $set= "a-g"; $sw= 10; break
	}'d'{	$tt+= $dd; $set= "a-g"; $sw= 10; break
	}'e'{	$tt+= $dd; $set= "a-g"; $sw= 10; break
	}'f'{	$tt+= $dd; $set= "a-g"; $sw= 10; break
	}'g'{	$tt+= $dd; $set= "a-g"; $sw= 10; break
	}' '{
		for([int]$j= 0; $j -lt $trk; $j++){
			$out[$j]+= " "
		} #
		break
	}default{
		for([int]$j= 0; $j -lt $trk; $j++){
			$out[$j]+= $dd
		} #
	}
	} #sw
  }
 } #

	if($sw -ne 0){ Write-Host ("Mml_gene err >> "+ $sw) }

	return $out
 } #func
 
function Mml_replace([string]$ss){ 

	[int]$trk= $nmud_trk.Value
	[int]$tai_count= $nmud_tai.Value


	[array]$rr= ""; $rr*= $trk
	$rr= Mml_gene $trk $tai_count $ss

	for([int]$i= 0; $i -lt $trk; $i++){


		$rr[$i]= Xyz_sorter $rr[$i]

		$rr[$i]= $rr[$i].Replace("t", '^')
		$rr[$i]= $rr[$i].Replace("v", '^')
		$rr[$i]= $rr[$i].Replace("x", 'r')

		if($comb_oct.SelectedItem -eq "< >"){
			$rr[$i]= Oct_hogen $rr[$i]
		}

		if($comb_tai.SelectedItem -eq "&"){
			$rr[$i]= Tai_hogen $rr[$i]

		}elseif($comb_tai.SelectedItem -eq "w"){
			$rr[$i]= Wait_hogen $rr[$i]
		}

		if($comb_prefix.SelectedItem -ne 'none'){
			$rr[$i]= $track_parm[$i]+ $rr[$i]
		}
	} #

	return ($rr -join "`r`n")
 } #func
 
function Mml_Thru([string]$ss){ 

	if($comb_oct.SelectedItem -eq "< >"){
		$ss= Oct_hogen $ss
	}

	if($comb_tai.SelectedItem -eq "&"){
		$ss= Tai_hogen $ss

	}elseif($comb_tai.SelectedItem -eq "w"){
		$ss= Wait_hogen $ss
	}

	return $ss
 } #func
 
function Apeg_mml([string]$mm){ # <- $box_mml.Text 

	[string[]]$ss= $mm -split "`r`n"

	[int]$gth= $ss.Length

	[array]$srr= ""; $srr*= $gth
	[array]$mrr= ""; $mrr*= $gth

	for([int]$i= 0; $i -lt $gth; $i++){ # gyoh tann i

		if($ss[$i].Length -ne 0){ # kuh gyoh


			$ss[$i]= Importer $ss[$i]

			$srr[$i]= Mml_Thru $ss[$i]
			$mrr[$i]= Mml_replace $ss[$i]
		}
	} #

	$box_mml.Text= $srr -join "`r`n"
	$box_mtr.Text= $mrr -join "`r`n"
 } #func
 
function Number_gene([int]$trk, [int]$tai_count, [string]$mm){ 

#	5^4^3^5^
#	5tvvvxxx
#	xx4tvvvx
#	xxxx3tvv
#	xxxxxx5t

	[array]$brr= $mm.ToCharArray()
	$brr+= "$"

	[string]$dd= ""

	[array]$taic= 0;		$taic*= $trk
	[array]$out= "";	$out*= $trk

	[int]$i= 0
	[int]$num= 0 # "^" tame

	foreach($dd in $brr){

		if($dd -eq '$'){ break; }

		switch($dd){
		'^'{
			for([int]$j= 0; $j -lt $trk; $j++){
				if($num -ne $j){

					if($taic[$j] -le 0){ # <=
						$out[$j]+= "x"
					}else{
						$out[$j]+= "v"
					}
					$taic[$j]--

				}else{
						$out[$j]+= "t"
				}
			} #
			break
		}'r'{
			for([int]$j= 0; $j -lt $trk; $j++){
				$out[$j]+= "x"
				$taic[$j]= 0
			} #
			break
		}' '{
			for([int]$j= 0; $j -lt $trk; $j++){
				$out[$j]+= " "
			} #
			break
		}default{
			$num= $i% $trk

			for([int]$j= 0; $j -lt $trk; $j++){
				if($num -ne $j){

					if($taic[$j] -le 0){ # <=
						$out[$j]+= "x"
					}else{
						$out[$j]+= "v"
					}
					$taic[$j]--

				}else{
					$out[$j]+= $dd
					$taic[$j]= $tai_count
				}
			} #
			$i++
		}
		} #sw

	} #
	#write-host ""
	#write-host $out[0]
	#write-host $out[1]
	#write-host $out[2]
	#write-host $out[3]

	return $out
 } #func
 
function Number_replace([string]$ss){ 


	[int]$trk= $nmud_trk.Value
	[int]$tai_count= $nmud_tai.Value
	[array]$qq= $mml_setting


	[array]$rr= ""; $rr*= $trk
	$rr= Number_gene $trk $tai_count $ss


	for([int]$i= 0; $i -lt $trk; $i++){


		$rr[$i]= Xyz_sorter $rr[$i]

		$rr[$i]= $rr[$i].Replace('6', $qq[0])
		$rr[$i]= $rr[$i].Replace('5', $qq[1])
		$rr[$i]= $rr[$i].Replace('4', $qq[2])
		$rr[$i]= $rr[$i].Replace('3', $qq[3])
		$rr[$i]= $rr[$i].Replace('2', $qq[4])
		$rr[$i]= $rr[$i].Replace('1', $qq[5])
		$rr[$i]= $rr[$i].Replace("t", '^')
		$rr[$i]= $rr[$i].Replace("v", '^')
		$rr[$i]= $rr[$i].Replace("x", 'r')

		if($comb_oct.SelectedItem -eq "< >"){
			$rr[$i]= Oct_hogen $rr[$i]
		}

		if($comb_tai.SelectedItem -eq "&"){
			$rr[$i]= Tai_hogen $rr[$i]

		}elseif($comb_tai.SelectedItem -eq "w"){
			$rr[$i]= Wait_hogen $rr[$i]
		}

		if($comb_prefix.SelectedItem -ne 'none'){
			$rr[$i]= $track_parm[$i]+ $rr[$i]
		}
	} #

	return ($rr -join "`r`n")
 } #func
 
function Number_thru([string]$ss){ 

	[array]$qq= $mml_setting

	$ss= $ss.Replace('6', $qq[0])
	$ss= $ss.Replace('5', $qq[1])
	$ss= $ss.Replace('4', $qq[2])
	$ss= $ss.Replace('3', $qq[3])
	$ss= $ss.Replace('2', $qq[4])
	$ss= $ss.Replace('1', $qq[5])


	if($comb_oct.SelectedItem -eq "< >"){
		$ss= Oct_hogen $ss
	}

	if($comb_tai.SelectedItem -eq "&"){
		$ss= Tai_hogen $ss

	}elseif($comb_tai.SelectedItem -eq "w"){
		$ss= Wait_hogen $ss
	}

	return $ss
 } #func
 
function Apeg([string]$mm){ # <- $box_apeg.Text 

	[string[]]$ss= $mm -split "`r`n"

	[int]$gth= $ss.Length

	[array]$srr= ""; $srr*= $gth
	[array]$mrr= ""; $mrr*= $gth

	for([int]$i= 0; $i -lt $gth; $i++){ # gyoh tann i

		if($ss[$i].Length -ne 0){ # kuh gyoh

			$srr[$i]= Number_thru $ss[$i]
			$mrr[$i]= Number_replace $ss[$i]
		}
	} #

	$box_mml.Text= $srr -join "`r`n"
	$box_mtr.Text= $mrr -join "`r`n"
 } #func
  
# Exp 
	
function Prefixarp_mml([string]$oct, [string]$ss){ 

	[string]$hh= ""

	switch($comb_prefix.SelectedItem){

	'ppmck'{	$hh= $header["arp_header_mck"]; break;
	}'NSDlib'{	$hh= $header["arp_header_nsd"]; break;
	}'PMD'{	$hh= $header["arp_header_pmd"]
	}
	} #sw

	[string]$tr= [System.Text.RegularExpressions.Regex]::Matches($hh,"(?<=%%).*?(?=%%)")


	[string]$line= ""

	[int]$j= 0
	while($j -lt $track_parm.Length){

		$line+= $track_parm[$j]+ $oct+ $tr+ "`r`n"
		$j++;
	} #

	## [string]$lis= $hh -replace "%tr_param%",$line -replace "%mml_param%",$ss
	$hh= $hh.Replace("%tr_param%",$line)
	$hh= $hh.Replace("%mml_param%",$ss)

	return $hh
} #func
 
function Lisnarp_nsf([int]$sw, [string]$lis){ 

 switch($sw){

 1{
	Player_open 1 $val["player"] > $null
	break;
 }0{
	Write-Host $val["compiler"]
	Write-Host $val["player"]
	Write-Host ""
	Write-Host $lis
	Write-Host ""

	Mml_writer $lis ".\temp\temp.mml" 0
	# $lis | Out-File -Encoding oem -FilePath ".\temp\temp.mml" # shiftJIS

	$file= [System.IO.Path]::GetFullPath(".\temp\temp.mml") # full path


	[string[]]$arr= Split_path $file
	[string]$dpn= Join-Path $arr[1] $arr[2]

	[string[]]$output= "",""

	switch($comb_prefix.SelectedItem){

	'ppmck'{
		[string[]]$rr= $file,$val["compiler"],$arr[1],"-i"
		$output= Mkmck $rr
		[string]$ext= ".nsf"
		break;

	}'NSDlib'{
		[string[]]$rr= $file,$val["compiler"],$arr[1],"-n"
		$output= Mknsd $rr
		[string]$ext= ".nsf"
		break;

	}'PMD'{
		[string[]]$rr= $file,$val["compiler"],$arr[1],"/N /V",$val["dos"],$opt["chk_dos"]
		$output= Mkpmd $rr
		[string]$ext= ".m"

	}
	} #sw

	sleep -m 33	# 異常時用ウェイト

	if($output[0] -ne ""){

		[string]$retn= [Windows.Forms.MessageBox]::Show(
		("compiler setting error : "+ $output[0]), "確認", "OK","Information","Button1"
		)
	}else{

		if($LASTEXITCODE -ne 0){

			Write-Host ("`r`n"+ 'exitcode: '+ $LASTEXITCODE)
			Write-Host ("`r`n"+ 'ERROR: '+ $arr[0]+ ' >> '+ $arr[2]+ $ext)

			[string]$retn= [Windows.Forms.MessageBox]::Show(
			("コンパイルに失敗 : "+ $arr[0]+ " >> "+ $arr[2]+ $ext), "確認", "OK","Information","Button1"
			)

		}else{

			# '"' 空白パス対応

			[string]$tt= Player_open 2 $val["player"] ('"'+ $dpn+ $ext+ '"')

			if($tt -ne ""){

				[string]$retn= [Windows.Forms.MessageBox]::Show(
				("player setting error : "+ $tt), "確認", "OK","Information","Button1"
				)
			}
		}
	}
 }
 } #sw

 } #func
 
function Keydown_arp([string]$t){ 

  switch($t){
  'F12'{
		$lisn_btn.PerformClick()
		break
  }'F11'{
		$stop_btn.PerformClick()
		break
  }'F5'{
		$import_btn.PerformClick()
  }
  } #sw
 } #func
 
function Unredo_arp([int]$n){ 	

  switch($n){
  2{
	$script:undo[0][0]= $null
	$script:undo[1][0]= $null

	break;
  }1{
	switch($undo[2][0]){ # undo
	'0'{
		$script:undo[1][0]= $box_apeg.Text	# omote buffer
		$script:undo[1][1]= $box_apeg.SelectionStart

		$script:undo[2][0]= "1"			# toggle
		$box_apeg.Text= $undo[0][0]		# undo read
		$box_apeg.SelectionStart= $undo[0][1]
		break;

	}'1'{ #redo
		$script:undo[0][0]= $box_apeg.Text	# ura buffer
		$script:undo[0][1]= $box_apeg.SelectionStart

		$script:undo[2][0]= "0"
		$box_apeg.Text= $undo[1][0]		# redo read
		$box_apeg.SelectionStart= $undo[1][1]
	}
	} #sw

	break;

  }0{ # do .Add_Enterでdo (menu->objでは再enterとはならない)

	# undo buffer dochiraka ni
	$script:undo[$undo[2][0]][0]= $box_apeg.Text
	$script:undo[$undo[2][0]][1]= $box_apeg.SelectionStart
  }
  } #sw

  if(($undo[0][0] -ne $null) -or ($undo[1][0] -ne $null)){

	$arp_menu_ud.Enabled= $True
  }else{
	$arp_menu_ud.Enabled= $False
  }

 } #func
 
function Arpadv_edit([string]$t){ 

  switch($t){
  'mck'{
	[string]$ss= Editor_open $val["editor"] ".\header\arp_header_mck"; break;
  }'nsd'{
	[string]$ss= Editor_open $val["editor"] ".\header\arp_header_nsd"; break;
  }'pmd'{
	[string]$ss= Editor_open $val["editor"] ".\header\arp_header_pmd"
  }
  } #sw

  if($ss -ne ''){

	[string]$retn= [Windows.Forms.MessageBox]::Show(

	$ss, "確認", "OK","Information","Button1"
	)
  }

 } #func
  
Add-Type -AssemblyName System.Windows.Forms > $null 
Add-Type -AssemblyName System.Drawing > $null

$ErrorActionPreference= "Stop"

$Fon= New-Object System.Drawing.Font("MS Gothic",11) # Microsoft Sans Serif

cd (Split-Path -Parent $MyInvocation.MyCommand.Path)
[Environment]::CurrentDirectory= pwd # working_dir set
 
$chd_grp= New-Object System.Windows.Forms.GroupBox 
$chd_grp.Text= "Chord select"
$chd_grp.Size= "250,100"
$chd_grp.Location= "10,30"
$chd_grp.FlatStyle= "Flat"
	
$label_key= New-Object System.Windows.Forms.Label 
$label_key.Text= "Keys"
$label_key.Size= "70,20"
$label_key.Location= "15,20"
 
$comb_key= New-Object System.Windows.Forms.Combobox 
$comb_key.Size= "65,20"
$comb_key.Location= "15,40"
$comb_key.FlatStyle= "Popup"

[void]$comb_key.Items.AddRange(@("A","Bb","B","C","Db","D","Eb","E","F","Gb","G","Ab"))
$comb_key.DropDownStyle= "DropDownList"
$comb_key.SelectedIndex= 3

$comb_key.Add_SelectedValueChanged({
 try{
	$script:chord_select[0]= $this.SelectedItem

	$script:flet_setting= Fret_build $chord_select $cd
	$script:mml_setting= Chd_build $blk $flet_setting
	Apeg $box_apeg.Text

 }catch{
	echo $_.exception
 }
})
 
$label_kata= New-Object System.Windows.Forms.Label 
$label_kata.Text= "Chords"
$label_kata.Size= "70,20"
$label_kata.Location= "90,20"
 
$comb_chd= New-Object System.Windows.Forms.Combobox 
$comb_chd.Size= "65,20"
$comb_chd.Location= "90,40"
$comb_chd.FlatStyle= "Popup"

[void]$comb_chd.Items.AddRange(@("Maj","M7","min","m7","7sus4","7th","dim7","m7b5"))
[void]$comb_chd.Items.AddRange(@("M79","M7#11","M713","M913"))
[void]$comb_chd.Items.AddRange(@("m79","m711","m911"))
[void]$comb_chd.Items.AddRange(@("7b9","79","7#9","711","7#11","7b13","713","b9#11","913","#9b13"))
[void]$comb_chd.Items.AddRange(@("sus2","6sus2","sus4","9sus4","13sus4"))
[void]$comb_chd.Items.AddRange(@("add9","add911","madd9","madd911"))
[void]$comb_chd.Items.AddRange(@("6th","69","m6","m69"))
[void]$comb_chd.Items.AddRange(@("dim","M7b5","m7b511","7b5"))
[void]$comb_chd.Items.AddRange(@("aug","aug7","M7#5","m7#5","7#5"))
[void]$comb_chd.Items.AddRange(@("mM7","mM7b5","mM7#5","mM79"))

$comb_chd.DropDownStyle= "DropDownList"
$comb_chd.SelectedIndex= 0

$comb_chd.Add_SelectedValueChanged({

 try{
	$script:chord_select[1]= $this.SelectedItem

	$script:flet_setting= Fret_build $chord_select $cd
	$script:mml_setting= Chd_build $blk $flet_setting
	Apeg $box_apeg.Text

 }catch{
	echo $_.exception
 }
})
 
$label_genn= New-Object System.Windows.Forms.Label 
$label_genn.Text= "Root Strings"
$label_genn.Size= "70,20"
$label_genn.Location= "165,20"
 
$comb_genn= New-Object System.Windows.Forms.Combobox 
$comb_genn.Size= "65,20"
$comb_genn.Location= "165,40"
$comb_genn.FlatStyle= "Popup"

[void]$comb_genn.Items.AddRange(@("6E","5A","4D"))
$comb_genn.DropDownStyle= "DropDownList"
$comb_genn.SelectedIndex= 1

$comb_genn.Add_SelectedValueChanged({

 try{
	$script:chord_select[2]= $this.SelectedItem

	$script:flet_setting= Fret_build $chord_select $cd
	$script:mml_setting= Chd_build $blk $flet_setting
	Apeg $box_apeg.Text

	$comb_apeg.Items.Clear()
	[void]$comb_apeg.Items.AddRange($rot[$this.SelectedItem])

 }catch{
	echo $_.exception
 }
})
 
$check_open= New-Object System.Windows.Forms.CheckBox 
$check_open.Text= "Open Chord"
$check_open.Size= "90,20"
$check_open.Location= "155,70"
$check_open.CheckState= "Checked"
$check_open.FlatStyle= "Popup"

$check_open.Add_CheckStateChanged({

 try{
	$script:chord_select[3]= $this.CheckState

	$script:flet_setting= Fret_build $chord_select $cd
	$script:mml_setting= Chd_build $blk $flet_setting
	Apeg $box_apeg.Text

 }catch{
	echo $_.exception
 }
})
 
$Pictbox = New-Object System.Windows.Forms.PictureBox 
$Pictbox.ClientSize= "11,11"
$Pictbox.Location= "139,74"

$Pictbox.Image= [System.Drawing.Image]::FromFile(".\img\orange.png")
# $Pictbox.Image= [System.Drawing.Image]::FromFile(".\img\blue.png")
  
$flet_grp= New-Object System.Windows.Forms.GroupBox 
$flet_grp.Text= "Flet setting"
$flet_grp.Size= "270,100"
$flet_grp.Location= "270,30"
$flet_grp.FlatStyle= "Flat"
	
$label_flet= New-Object System.Windows.Forms.Label 
$label_flet.Text= "Flet Number"
$label_flet.Size= "70,20"
$label_flet.Location= "160,20"
$label_flet.TextAlign= "BottomLeft"

# TopLeft,TopCenter,TopRight,
# MiddleLeft,MiddleCenter,MiddleRight,
# BottomLeft,BottomCenter,BottomRight
 
$label_chd= New-Object System.Windows.Forms.Label 
$label_chd.Text= "MML Chord"
$label_chd.Size= "70,20"
$label_chd.Location= "160,45"
$label_chd.TextAlign= "BottomLeft"
 
$box_flet= New-Object System.Windows.Forms.TextBox 
$box_flet.Size= "135,20"
$box_flet.Location= "20,20"
$box_flet.BorderStyle= "FixedSingle"
# $box_flet.ReadOnly= "True"
# $box_flet.Text= "0  3  2  0  1  0"

$box_flet.Add_TextChanged({ # textbox key input gi
 try{
	$script:flet_setting= $this.Text -split "  "

	$script:mml_setting= Chd_build $blk $flet_setting
	Apeg $box_apeg.Text

 }catch{
	echo $_.exception
 }
})

$box_flet.Add_KeyDown({
 try{
	Keydown_chd_arp $_.KeyCode

 }catch{
    echo $_.exception
 }
})
 
$box_chd= New-Object System.Windows.Forms.TextBox 
$box_chd.Size= "135,20"
$box_chd.Location= "20,45"
$box_chd.BorderStyle= "FixedSingle"
# $box_chd.ReadOnly= "True"
$box_chd.ForeColor= "Gray"
$box_chd.BackColor= "White"
#$box_chd.Text= '"eceg`c`e'

# $box_chd.Add_TextChanged({
#  try{
#  }catch{
#	echo $_.exception
#  }
# })

$box_chd.Add_KeyDown({
 try{
	Keydown_chd_arp $_.KeyCode

 }catch{
    echo $_.exception
 }
})
 
$import_chd_btn= New-Object System.Windows.Forms.Button 
$import_chd_btn.Location= "235,45"
$import_chd_btn.Size= "20,20"
$import_chd_btn.FlatStyle= "Popup"
$import_chd_btn.Image= [System.Drawing.Image]::FromFile(".\img\convert.png")
# $import_chd_btn.Text= ">>"

$import_chd_btn.Add_Click({
 try{
	$script:mml_setting= Importer_chd $box_chd.Text
	Apeg $box_apeg.Text

	Write-Host "<< mml chordをインポートしました"
 }catch{
	echo $_.exception
 }
})
 
$comb_db= New-Object System.Windows.Forms.Combobox 
$comb_db.Size= "45,20"
$comb_db.Location= "10,70"
$comb_db.FlatStyle= "Popup"

[void]$comb_db.Items.AddRange(@('c#','c+','d-'))
$comb_db.DropDownStyle= "DropDownList"
$comb_db.SelectedIndex= 2

$comb_db.Add_SelectedValueChanged({

 try{
	$script:blk[2]= $this.SelectedItem

	$script:mml_setting= Chd_build $blk $flet_setting
	Apeg $box_apeg.Text

 }catch{
	echo $_.exception
 }
})
 
$comb_eb= New-Object System.Windows.Forms.Combobox 
$comb_eb.Size= "45,20"
$comb_eb.Location= "60,70"
$comb_eb.FlatStyle= "Popup"

[void]$comb_eb.Items.AddRange(@('d#','d+','e-'))
$comb_eb.DropDownStyle= "DropDownList"
$comb_eb.SelectedIndex= 2

$comb_eb.Add_SelectedValueChanged({

 try{
	$script:blk[3]= $this.SelectedItem

	$script:mml_setting= Chd_build $blk $flet_setting
	Apeg $box_apeg.Text

 }catch{
	echo $_.exception
 }
})
 
$comb_gb= New-Object System.Windows.Forms.Combobox 
$comb_gb.Size= "45,20"
$comb_gb.Location= "110,70"
$comb_gb.FlatStyle= "Popup"

[void]$comb_gb.Items.AddRange(@('f#','f+','g-'))
$comb_gb.DropDownStyle= "DropDownList"
$comb_gb.SelectedIndex= 2

$comb_gb.Add_SelectedValueChanged({

 try{
	$script:blk[4]= $this.SelectedItem

	$script:mml_setting= Chd_build $blk $flet_setting
	Apeg $box_apeg.Text

 }catch{
	echo $_.exception
 }
})
 
$comb_ab= New-Object System.Windows.Forms.Combobox 
$comb_ab.Size= "45,20"
$comb_ab.Location= "160,70"
$comb_ab.FlatStyle= "Popup"

[void]$comb_ab.Items.AddRange(@('g#','g+','a-'))
$comb_ab.DropDownStyle= "DropDownList"
$comb_ab.SelectedIndex= 2

$comb_ab.Add_SelectedValueChanged({

 try{
	$script:blk[0]= $this.SelectedItem

	$script:mml_setting= Chd_build $blk $flet_setting
	Apeg $box_apeg.Text

 }catch{
	echo $_.exception
 }
})
 
$comb_bb= New-Object System.Windows.Forms.Combobox 
$comb_bb.Size= "45,20"
$comb_bb.Location= "210,70"
$comb_bb.FlatStyle= "Popup"

[void]$comb_bb.Items.AddRange(@('a#','a+','b-'))
$comb_bb.DropDownStyle= "DropDownList"
$comb_bb.SelectedIndex= 2

$comb_bb.Add_SelectedValueChanged({

 try{
	$script:blk[1]= $this.SelectedItem

	$script:mml_setting= Chd_build $blk $flet_setting
	Apeg $box_apeg.Text

 }catch{
	echo $_.exception
 }
})
  
$mml_grp= New-Object System.Windows.Forms.GroupBox 
$mml_grp.Text= "MML arpeggio"
$mml_grp.Size= "530,415"
$mml_grp.Location= "10,130"
$mml_grp.FlatStyle= "Flat"
	
$label_apeg= New-Object System.Windows.Forms.Label 
$label_apeg.Text= "Arpeggio"
$label_apeg.Size= "75,20"
$label_apeg.Location= "10,20"
$label_apeg.TextAlign= "TopRight"
 
$comb_apeg= New-Object System.Windows.Forms.Combobox 
$comb_apeg.Size= "120,20"
$comb_apeg.location= "90,20"
$comb_apeg.FlatStyle= "Popup"

#[void]$comb_apeg.Items.AddRange(@())
$comb_apeg.DropDownStyle= "DropDownList"
# $comb_apeg.SelectedIndex= 0

$comb_apeg.Add_SelectedValueChanged({

	Unredo_arp 0

	switch($box_apeg.SelectionStart){ # caret [num]

	$box_apeg.GetFirstCharIndexOfCurrentLine(){ # 0-11,12-, gyohtoh chk [0,12]

		break;
	}default{
		$box_apeg.SelectedText= "  "
	}
	} #sw

	$box_apeg.SelectedText= $this.SelectedItem # .SelectedText [add]


})
 
$lisn_btn= New-Object System.Windows.Forms.Button 
$lisn_btn.Location= "215,20"
$lisn_btn.Size= "20,20"
$lisn_btn.FlatStyle= "Popup"
$lisn_btn.Image= [System.Drawing.Image]::FromFile(".\img\play.png")
# $lisn_btn.Text= ">"

$lisn_btn.Add_Click({ # 試聴

 try{
	$script:lis= Prefixarp_mml $opt["oct"] $box_mtr.Text
	Lisnarp_nsf 0 $lis

 }catch{
	echo $_.exception
 }
})
 
$stop_btn= New-Object System.Windows.Forms.Button 
$stop_btn.Location= "240,20"
$stop_btn.Size= "20,20"
$stop_btn.FlatStyle= "Popup"
$stop_btn.Image= [System.Drawing.Image]::FromFile(".\img\stop.png")
# $stop_btn.Text= "□"

$stop_btn.Add_Click({ # ストップ


 try{
	Lisnarp_nsf 1

 }catch{
	echo $_.exception
 }
})
 
$label_exp= New-Object System.Windows.Forms.Label 
$label_exp.Text= "[6-1] [ ^ ] [ r ]"
$label_exp.Size= "105,20"
$label_exp.Location= "265,20"
$label_exp.ForeColor= "Gray"
$label_exp.TextAlign= "BottomLeft"
 
# ------ 
 
$label_prefix= New-Object System.Windows.Forms.Label 
$label_prefix.Text= "Track header"
$label_prefix.Size= "75,20"
$label_prefix.Location= "10,120"
$label_prefix.TextAlign= "TopRight"

 
$comb_prefix= New-Object System.Windows.Forms.Combobox 
$comb_prefix.Size= "120,20"
$comb_prefix.Location= "90,120"
$comb_prefix.FlatStyle= "Popup"

[void]$comb_prefix.Items.AddRange(@('none','ppmck','NSDlib','PMD','Fmp7','sakura mml'))
$comb_prefix.DropDownStyle= "DropDownList"
$comb_prefix.SelectedIndex= 2

$comb_prefix.Add_SelectedValueChanged({
 try{
	Mml_select $this.SelectedItem
	# ValueChanged
	# $script:track_parm= Trk_split $box_trk.Text
	# Apeg $box_apeg.Text

	Arpmenu_build "compiler"
	Arpstus_build
 }catch{
	echo $_.exception
 }
})
 
$comb_trk= New-Object System.Windows.Forms.Combobox 
$comb_trk.Size= "50,20"
$comb_trk.Location= "20,145"
$comb_trk.FlatStyle= "Popup"

[void]$comb_trk.Items.AddRange(@('',"'",'TR'))
$comb_trk.DropDownStyle= "DropDownList"
$comb_trk.SelectedIndex= 2

$comb_trk.Add_SelectedValueChanged({
 try{
	$script:track_parm= Trk_split $box_trk.Text
	Apeg $box_apeg.Text
 }catch{
	echo $_.exception
 }
})
 
$box_trk= New-Object System.Windows.Forms.TextBox 
$box_trk.Size= "135,20"
$box_trk.Location= "75,145"
$box_trk.BorderStyle= "FixedSingle"
$box_trk.Text= "1  2  15  16"

$box_trk.Add_TextChanged({
 try{
	$script:track_parm= Trk_split $box_trk.Text
	Apeg $box_apeg.Text
 }catch{
	echo $_.exception
 }
})
 
# ------ 
 
$label_oct= New-Object System.Windows.Forms.Label 
$label_oct.Text= "Octave Shift"
$label_oct.Size= "75,20"
$label_oct.Location= "220,120"
$label_oct.TextAlign= "TopRight"

 
$comb_oct= New-Object System.Windows.Forms.Combobox 
$comb_oct.Size= "45,20"
$comb_oct.Location= "300,120"
$comb_oct.FlatStyle= "Popup"

[void]$comb_oct.Items.AddRange(@('< >','" `'))
$comb_oct.DropDownStyle= "DropDownList"
$comb_oct.SelectedIndex= 1

$comb_oct.Add_SelectedValueChanged({
 try{
	if($this.SelectedItem -eq "< >"){

		$box_chd.Text= Oct_hogen ($mml_setting -join '')
	}else{
		$box_chd.Text= $mml_setting -join ''
	}

	Apeg $box_apeg.Text

 }catch{
	echo $_.exception
 }
})
 
$label_taimark= New-Object System.Windows.Forms.Label 
$label_taimark.Text= "Tai Mark"
$label_taimark.Size= "55,20"
$label_taimark.Location= "240,145"
$label_taimark.TextAlign= "TopRight"
 
$comb_tai= New-Object System.Windows.Forms.Combobox 
$comb_tai.Size= "45,20"
$comb_tai.Location= "300,145"
$comb_tai.FlatStyle= "Popup"

[void]$comb_tai.Items.AddRange(@('&','w','^'))
$comb_tai.DropDownStyle= "DropDownList"
$comb_tai.SelectedIndex= 2

$comb_tai.Add_SelectedValueChanged({
 try{
	Apeg $box_apeg.Text
 }catch{
	echo $_.exception
 }
})
 
# ------ 
 
$label_mtr= New-Object System.Windows.Forms.Label 
$label_mtr.Text= "MultiTrack"
$label_mtr.Size= "60,20"
$label_mtr.Location= "355,120"
$label_mtr.TextAlign= "TopRight"
 
$nmud_trk= New-Object System.Windows.Forms.NumericUpDown 
$nmud_trk.Size= "70,20"
$nmud_trk.location= "420,120"
$nmud_trk.TextAlign= "Right"
$nmud_trk.UpDownAlign= "Right"
$nmud_trk.Value= "4"
$nmud_trk.Minimum= "2"
$nmud_trk.Maximum= "16"
$nmud_trk.BorderStyle= "FixedSingle"

$nmud_trk.Add_ValueChanged({
 try{
	$nmud_tai.Maximum= $nmud_trk.Value- 1 # $this ka
	$script:track_parm= Trk_split $box_trk.Text
	Apeg $box_apeg.Text
 }catch{
	echo $_.exception
 }
})
 
$label_tainum= New-Object System.Windows.Forms.Label 
$label_tainum.Text= "Tai Count"
$label_tainum.Size= "60,20"
$label_tainum.Location= "355,145"
$label_tainum.TextAlign= "TopRight"
 
$nmud_tai= New-Object System.Windows.Forms.NumericUpDown 
$nmud_tai.Size= "70,20"
$nmud_tai.location= "420,145"
$nmud_tai.TextAlign= "Right"
$nmud_tai.UpDownAlign= "Right"
$nmud_tai.Value= "1"
#$nmud_tai.Minimum= "0"
#$nmud_tai.Maximum= "3"
$nmud_tai.BorderStyle= "FixedSingle"

$nmud_tai.Add_ValueChanged({
 try{
	$nmud_tai.Maximum= $nmud_trk.Value- 1 # $this ka
	Apeg $box_apeg.Text
 }catch{
	echo $_.exception
 }
})
 
$import_btn= New-Object System.Windows.Forms.Button 
$import_btn.Location= "20,170"
$import_btn.Size= "20,20"
$import_btn.FlatStyle= "Popup"
$import_btn.Image= [System.Drawing.Image]::FromFile(".\img\convert.png")
# $import_btn.Text= ">>"

$import_btn.Add_Click({

 try{
	Apeg_mml $box_mml.Text

	Write-Host "<< mmlをインポートしました"
 }catch{
	echo $_.exception
 }
})
 
$label_mml_exp= New-Object System.Windows.Forms.Label 
$label_mml_exp.Text= '["`<>] [a-g] [#+-] [0-9] [ ^ ] [ r ]'
$label_mml_exp.Size= "180,20"
$label_mml_exp.Location= "45,170"
$label_mml_exp.ForeColor= "Gray"
$label_mml_exp.TextAlign= "BottomLeft"
 
# ------ 
 
$box_apeg= New-Object System.Windows.Forms.TextBox 
$box_apeg.Size= "510,65"
$box_apeg.Location= "10,45"
$box_apeg.WordWrap= "False"
$box_apeg.Multiline= "True"
$box_apeg.ScrollBars= "Both"
$box_apeg.BorderStyle= "FixedSingle"
$box_apeg.font= $Fon
#$box_apeg.Text= "5313  1313"

$box_apeg.Add_Enter({ # konrann surutame reset

	Unredo_arp 0
})

$box_apeg.Add_TextChanged({
 try{
	Apeg $box_apeg.Text
 }catch{
	echo $_.exception
 }
})

$box_apeg.Add_KeyDown({ # 試聴
 try{
	Keydown_arp $_.KeyCode

 }catch{
    echo $_.exception
 }
})
 
$box_mml= New-Object System.Windows.Forms.TextBox 
$box_mml.Size= "510,65"
$box_mml.Location= "10,195"
$box_mml.WordWrap= "False"
$box_mml.Multiline= "True"
$box_mml.ScrollBars= "Both"
$box_mml.BorderStyle= "FixedSingle"
# $box_mml.ReadOnly= "True"
$box_mml.ForeColor= "Gray"
$box_mml.BackColor= "White"
$box_mml.font= $Fon
# $box_mml.Text= 'cg`eg  `eg`eg'

$box_mml.Add_KeyDown({ # 試聴
 try{
	Keydown_arp $_.KeyCode

 }catch{
    echo $_.exception
 }
})
 
$box_mtr= New-Object System.Windows.Forms.TextBox 
$box_mtr.Size= "510,140"
$box_mtr.Location= "10,265"
$box_mtr.WordWrap= "False"
$box_mtr.Multiline= "True"
$box_mtr.ScrollBars= "Both"
$box_mtr.BorderStyle= "FixedSingle"
# $box_mtr.ReadOnly= "True"
# $box_mtr.ForeColor= "Gray"
$box_mtr.BackColor= "White"
$box_mtr.font= $Fon

$box_mtr.Add_KeyDown({ # 試聴
 try{
	Keydown_arp $_.KeyCode

 }catch{
    echo $_.exception
 }
})
  
$arp_stus= New-Object System.Windows.Forms.StatusStrip 
$arp_stus.SizingGrip= $false

$arp_label= New-Object System.Windows.Forms.ToolStripStatusLabel
# $arp_label.Text= "  Test ------"
# $arp_label.Font= $Fon
 
$contxt_trayarp= New-Object System.Windows.Forms.ContextMenuStrip 
# $contxt objを読み込んだ後$NotifyIcon objが安全

[void]$contxt_trayarp.Items.Add("最小化")
[void]$contxt_trayarp.Items.Add("環境設定")
[void]$contxt_trayarp.Items.Add("終了")

$contxt_trayarp.Add_ItemClicked({
  try{
	# $_.ClickedItem # キャスト不要

	$script:frm_state= Contxtarp_state $_.ClickedItem $frm_state

	$this.Close()

 }catch{
	echo $_.exception
 }
})
 
$tray_arp= New-Object System.Windows.Forms.NotifyIcon 
$tray_arp.Icon= Icon_read "..\arp_gene.exe"
$tray_arp.Visible= $True
$tray_arp.Text= "Arp gene"
$tray_arp.ContextMenuStrip= $contxt_trayarp

$tray_arp.Add_MouseDown({
 try{

  switch([string]$_.Button){ # キャスト

  'Left'{

	switch($frm_state[0]){
	0{
		$script:frm_state= Contxtarp_state "最小化" $frm_state
		break;
	}1{
		$script:frm_state= Contxtarp_state "元に戻す" $frm_state
	}
	} #sw

#	break;
#  }'Right'{ # 不要 モーダル発生 -> $tray_arp.ContextMenuStrip
#	$contxt_trayarp.Show([Windows.Forms.Cursor]::Position)
  }
  } #sw

 }catch{
	echo $_.exception
 }
})
 
$frm_arp= New-Object System.Windows.Forms.Form 
$frm_arp.Text= "Guitar Arpeggio MML Generator" #Transfer
$frm_arp.Size= "562,602"
$frm_arp.StartPosition= "WindowsDefaultLocation"
$frm_arp.FormBorderStyle= "FixedSingle"
$frm_arp.Icon= Icon_read "..\arp_gene.exe"
# $frm_arp.ShowIcon= $False
$frm_arp.MinimizeBox= $True
$frm_arp.MaximizeBox= $False

# $frm_arp.Topmost= $True
$frm_arp.TopLevel= $True


# $frm_arp.Add_Load({ # load before form open
#	$this.WindowState= "Normal" # "Minimized"
# })

$frm_arp.Add_Shown({

	$comb_apeg.Select()	# forcus
})

$frm_arp.Add_SizeChanged({

	switch($frm_arp.WindowState){
	'Minimized'{
		$contxt_trayarp.Items.Clear()
		[void]$contxt_trayarp.Items.Add("元に戻す")
		[void]$contxt_trayarp.Items.Add("終了")
		break;

	}'Normal'{
		$contxt_trayarp.Items.Clear()
		[void]$contxt_trayarp.Items.Add("最小化")
		[void]$contxt_trayarp.Items.Add("終了")
	}
	} #sw
})

$frm_arp.Add_SizeChanged({
 try{
	switch($frm_arp.WindowState){
	'Minimized'{
		$script:frm_state[1]= 1
		$script:frm_state= Contxtarp_state "最小化" $frm_state

		break;
	}'Normal'{
		$script:frm_state[1]= 0
		$script:frm_state= Contxtarp_state "元に戻す" $frm_state
	}
	} #sw

 }catch{
	echo $_.exception
 }
})

$frm_arp.Add_FormClosing({

 try{
	Arpwrite_xml $script:arp_xml.table.val $script:arp_xml.table.opt

	File_writer $script:arp_xml '.\arp_gene.xml'

 }catch{
	echo $_.exception
 }
})
 
$arp_mnu= New-Object System.Windows.Forms.MenuStrip 
	
$arp_menu_f= New-Object System.Windows.Forms.ToolStripMenuItem 
$arp_menu_f.Text= "File"

$arp_menu_kt= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_kt.Text= "Preferences"

$menu_aty= New-Object System.Windows.Forms.ToolStripMenuItem
# $menu_aty.Text= "v Task tray"

$menu_aty.Add_Click({
  try{
	switch($key["tray"]){ # トグル

	'True'{		$script:key["tray"]= Trayarp_hide "False";	break;
	}'False'{	$script:key["tray"]= Trayarp_hide "True"
	}
	} #sw

 }catch{
	echo $_.exception
  }
})

$arp_menu_sn=New-Object System.Windows.Forms.ToolStripSeparator
$arp_menu_n= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_n.Text= "Close"

$arp_menu_n.Add_Click({

	$frm_arp.Close()
})
 
$arp_menu_o= New-Object System.Windows.Forms.ToolStripMenuItem 
$arp_menu_o.Text= "Option"

$arp_menu_ud= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_ud.Text= "Undo"
$arp_menu_ud.Enabled= $False

$arp_menu_ud.Add_Click({
 try{
	switch($box_apeg.Focused){
	'False'{
		Unredo_arp 1; break;
	}'True'{
		$box_apeg.Undo()
	}
	} #sw

 }catch{
	echo $_.exception
 }
})

$arp_menu_comn=New-Object System.Windows.Forms.ToolStripSeparator
$arp_menu_comp= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_comp.Text= "Compiler"

$arp_menu_play= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_play.Text= "Player"

$arp_menu_dosv= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_dosv.Text= "Dos"

$arp_menu_edit= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_edit.Text= "Edit"

$arp_menu_setn=New-Object System.Windows.Forms.ToolStripSeparator
$arp_menu_set= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_set.Text= "Setting"

$arp_menu_set.Add_Click({
 try{
	[bool]$bool_sw= $tray_arp.Visible
	$tray_arp.Visible= $False

	[array]$args_set= "",""
	$args_set= .\setting.ps1 $val $opt "cut"


	$script:val= $args_set[0]
	$script:opt= $args_set[1]

	if((Chk_path '.\setting.xml') -eq 0){

		$script:set_xml= [xml](cat '.\setting.xml')

		$script:comp=@{}; $script:play=@{}; $script:dosv=@{}; $script:edit=@{};

		Setxml_read $script:set_xml.table # hash化 script: ga hitsuyo
	}else{
		Write-Host ("`r`n"+ '"setting.xml" 読み込みエラー')
	}

	Mml_select $comb_prefix.SelectedItem

	Arpmenu_build "compiler"
	Arpmenu_build "player"
	Arpmenu_build "dos"
	Arpmenu_build "editor"
	Arpstus_build

	$tray_arp.Visible= $bool_sw

 }catch{
	echo $_.exception
 }
})

$arp_menu_cmp0= New-Object System.Windows.Forms.ToolStripMenuItem
#$arp_menu_cmp0.Text= "0.exe"
$arp_menu_cmp0.Visible= $False # .Hide() 不可

$arp_menu_cmp0.Add_Click({
 try{
	Arpchange_value "compiler" $this.Text
	Arpmenu_build "compiler"
	Arpstus_build
 }catch{
	echo $_.exception
 }
})

$arp_menu_cmp1= New-Object System.Windows.Forms.ToolStripMenuItem
#$arp_menu_cmp1.Text= "1.exe"
$arp_menu_cmp1.Visible= $False

$arp_menu_cmp1.Add_Click({
 try{
	Arpchange_value "compiler" $this.Text
	Arpmenu_build "compiler"
	Arpstus_build
 }catch{
	echo $_.exception
 }
})

$arp_menu_cmp2= New-Object System.Windows.Forms.ToolStripMenuItem
#$arp_menu_cmp2.Text= "2.exe"
$arp_menu_cmp2.Visible= $False

$arp_menu_cmp2.Add_Click({
 try{
	Arpchange_value "compiler" $this.Text
	Arpmenu_build "compiler"
	Arpstus_build
 }catch{
	echo $_.exception
 }
})

$arp_menu_cmp3= New-Object System.Windows.Forms.ToolStripMenuItem
#$arp_menu_cmp3.Text= "3.exe"
$arp_menu_cmp3.Visible= $False

$arp_menu_cmp3.Add_Click({
 try{
	Arpchange_value "compiler" $this.Text
	Arpmenu_build "compiler"
	Arpstus_build
 }catch{
	echo $_.exception
 }
})

$arp_menu_cmp4= New-Object System.Windows.Forms.ToolStripMenuItem
#$arp_menu_cmp4.Text= "4.exe"
$arp_menu_cmp4.Visible= $False

$arp_menu_cmp4.Add_Click({
 try{
	Arpchange_value "compiler" $this.Text
	Arpmenu_build "compiler"
	Arpstus_build
 }catch{
	echo $_.exception
 }
})

$arp_menu_cmp5= New-Object System.Windows.Forms.ToolStripMenuItem
#$arp_menu_cmp5.Text= "5.exe"
$arp_menu_cmp5.Visible= $False

$arp_menu_cmp5.Add_Click({
 try{
	Arpchange_value "compiler" $this.Text
	Arpmenu_build "compiler"
	Arpstus_build
 }catch{
	echo $_.exception
 }
})

$arp_menu_ply0= New-Object System.Windows.Forms.ToolStripMenuItem
#$arp_menu_ply0.Text= "0.exe"
$arp_menu_ply0.Visible= $False

$arp_menu_ply0.Add_Click({
 try{
	Arpchange_value "player" $this.Text
	Arpmenu_build "player"
	Arpstus_build
 }catch{
	echo $_.exception
 }
})

$arp_menu_ply1= New-Object System.Windows.Forms.ToolStripMenuItem
#$arp_menu_ply1.Text= "1.exe"
$arp_menu_ply1.Visible= $False

$arp_menu_ply1.Add_Click({
 try{
	Arpchange_value "player" $this.Text
	Arpmenu_build "player"
	Arpstus_build
 }catch{
	echo $_.exception
 }
})

$arp_menu_ply2= New-Object System.Windows.Forms.ToolStripMenuItem
#$arp_menu_ply2.Text= "2.exe"
$arp_menu_ply2.Visible= $False

$arp_menu_ply2.Add_Click({
 try{
	Arpchange_value "player" $this.Text
	Arpmenu_build "player"
	Arpstus_build
 }catch{
	echo $_.exception
 }
})

$arp_menu_ply3= New-Object System.Windows.Forms.ToolStripMenuItem
#$arp_menu_ply3.Text= "3.exe"
$arp_menu_ply3.Visible= $False

$arp_menu_ply3.Add_Click({
 try{
	Arpchange_value "player" $this.Text
	Arpmenu_build "player"
	Arpstus_build
 }catch{
	echo $_.exception
 }
})

$arp_menu_dos0= New-Object System.Windows.Forms.ToolStripMenuItem
#$arp_menu_dos0.Text= "0.exe"
$arp_menu_dos0.Visible= $False

$arp_menu_dos0.Add_Click({
 try{
	Arpchange_value "dos" $this.Text
	Arpmenu_build "dos"
	Arpstus_build
 }catch{
	echo $_.exception
 }
})

$arp_menu_dos1= New-Object System.Windows.Forms.ToolStripMenuItem
#$arp_menu_dos1.Text= "1.exe"
$arp_menu_dos1.Visible= $False

$arp_menu_dos1.Add_Click({
 try{
	Arpchange_value "dos" $this.Text
	Arpmenu_build "dos"
	Arpstus_build
 }catch{
	echo $_.exception
 }
})

$arp_menu_dos2= New-Object System.Windows.Forms.ToolStripMenuItem
#$arp_menu_dos2.Text= "2.exe"
$arp_menu_dos2.Visible= $False

$arp_menu_dos2.Add_Click({
 try{
	Arpchange_value "dos" $this.Text
	Arpmenu_build "dos"
	Arpstus_build
 }catch{
	echo $_.exception
 }
})

$arp_menu_dos3= New-Object System.Windows.Forms.ToolStripMenuItem
#$arp_menu_dos3.Text= "3.exe"
$arp_menu_dos3.Visible= $False

$arp_menu_dos3.Add_Click({
 try{
	Arpchange_value "dos" $this.Text
	Arpmenu_build "dos"
	Arpstus_build
 }catch{
	echo $_.exception
 }
})

$arp_menu_edt0= New-Object System.Windows.Forms.ToolStripMenuItem
#$arp_menu_edt0.Text= "0.exe"
$arp_menu_edt0.Visible= $False

$arp_menu_edt0.Add_Click({
 try{
	Arpchange_value "editor" $this.Text
	Arpmenu_build "editor"
	Arpstus_build
 }catch{
	echo $_.exception
 }
})

$arp_menu_edt1= New-Object System.Windows.Forms.ToolStripMenuItem
#$arp_menu_edt1.Text= "1.exe"
$arp_menu_edt1.Visible= $False

$arp_menu_edt1.Add_Click({
 try{
	Arpchange_value "editor" $this.Text
	Arpmenu_build "editor"
	Arpstus_build
 }catch{
	echo $_.exception
 }
})

$arp_menu_edt2= New-Object System.Windows.Forms.ToolStripMenuItem
#$arp_menu_edt2.Text= "2.exe"
$arp_menu_edt2.Visible= $False

$arp_menu_edt2.Add_Click({
 try{
	Arpchange_value "editor" $this.Text
	Arpmenu_build "editor"
	Arpstus_build
 }catch{
	echo $_.exception
 }
})

$arp_menu_edt3= New-Object System.Windows.Forms.ToolStripMenuItem
#$arp_menu_edt3.Text= "3.exe"
$arp_menu_edt3.Visible= $False

$arp_menu_edt3.Add_Click({
 try{
	Arpchange_value "editor" $this.Text
	Arpmenu_build "editor"
	Arpstus_build
 }catch{
	echo $_.exception
 }
})
 
$arp_menu_m= New-Object System.Windows.Forms.ToolStripMenuItem 
$arp_menu_m.Text= "Octave"

$arp_menu_oct1= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_oct1.Text= "o1"
$arp_menu_oct1.Add_Click({
 try{
    if($opt["oct"] -ne 'o1'){

	$script:opt["oct"]= Oscarp_sw "o1"
	Arpstus_build
    }
 }catch{
	echo $_.exception
 }
})

$arp_menu_oct2= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_oct2.Text= "o2"
$arp_menu_oct2.Add_Click({
 try{
    if($opt["oct"] -ne 'o2'){

	$script:opt["oct"]= Oscarp_sw "o2"
	Arpstus_build
    }
 }catch{
	echo $_.exception
 }
})

$arp_menu_oct3= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_oct3.Text= "o3"
$arp_menu_oct3.Add_Click({
 try{
    if($opt["oct"] -ne 'o3'){

	$script:opt["oct"]= Oscarp_sw "o3"
	Arpstus_build
    }
 }catch{
	echo $_.exception
 }
})

$arp_menu_oct4= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_oct4.Text= "o4"
$arp_menu_oct4.Add_Click({
 try{
    if($opt["oct"] -ne 'o4'){

	$script:opt["oct"]= Oscarp_sw "o4"
	Arpstus_build
    }
 }catch{
	echo $_.exception
 }
})

$arp_menu_oct5= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_oct5.Text= "o5"
$arp_menu_oct5.Add_Click({
 try{
    if($opt["oct"] -ne 'o5'){

	$script:opt["oct"]= Oscarp_sw "o5"
	Arpstus_build
    }
 }catch{
	echo $_.exception
 }
})

$arp_menu_oct6= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_oct6.Text= "o6"
$arp_menu_oct6.Add_Click({
 try{
    if($opt["oct"] -ne 'o6'){

	$script:opt["oct"]= Oscarp_sw "o6"
	Arpstus_build
    }
 }catch{
	echo $_.exception
 }
})

$arp_menu_oct7= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_oct7.Text= "o7"
$arp_menu_oct7.Add_Click({
 try{
    if($opt["oct"] -ne 'o7'){

	$script:opt["oct"]= Oscarp_sw "o7"
	Arpstus_build
    }
 }catch{
	echo $_.exception
 }
})

$arp_menu_oct8= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_oct8.Text= "o8"
$arp_menu_oct8.Add_Click({
 try{
    if($opt["oct"] -ne 'o8'){

	$script:opt["oct"]= Oscarp_sw "o8"
	Arpstus_build
    }
 }catch{
	echo $_.exception
 }
})
 
$arp_menu_b= New-Object System.Windows.Forms.ToolStripMenuItem 
$arp_menu_b.Text= "TextBox"


$arp_menu_mlun=New-Object System.Windows.Forms.ToolStripSeparator
$arp_menu_mml= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_mml.Text= "MML"

$arp_menu_mml.Add_Click({
 try{

	[Windows.Forms.Clipboard]::SetText($box_mtr.Text,[Windows.Forms.TextDataFormat]::UnicodeText)

 }catch{
	echo $_.exception
 }
})

$arp_menu_fix= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_fix.Text= "header+ MML"

$arp_menu_fix.Add_Click({
 try{

	$script:lis= Prefixarp_mml $opt["oct"] $box_mtr.Text
	[Windows.Forms.Clipboard]::SetText($lis,[Windows.Forms.TextDataFormat]::UnicodeText)

 }catch{
	echo $_.exception
 }
})
 
$arp_menu_h= New-Object System.Windows.Forms.ToolStripMenuItem 
$arp_menu_h.Text= "Help"


$arp_menu_whelp= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_whelp.Text= "GtArpeggioGenerator Help"

$arp_menu_whelp.Add_Click({
 try{

  if((Chk_path $edit["sted.exe"]) -eq 0){

	[string]$retn= Editor_open $edit["sted.exe"] "..\doc\Gt_Arpeggio_Generator.txt"
  }else{
	[string]$retn= Editor_open $val["editor"] "..\doc\Gt_Arpeggio_Generator.txt"
  }

  if($retn -ne ''){

	$retn= [Windows.Forms.MessageBox]::Show(

	$retn, "確認", "OK","Information","Button1"
	)
  }

 }catch{
	echo $_.exception
 }
})

$arp_menu_spy= New-Object System.Windows.Forms.ToolStripSeparator
$arp_menu_py= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_py.Text= "Player open"

$arp_menu_py.Add_Click({
 try{
	[string]$retn= Player_open 0 $val["player"]

	if($retn -ne ""){

		$retn= [Windows.Forms.MessageBox]::Show(
		$retn, "確認", "OK","Information","Button1"
		)
	}
 }catch{
	echo $_.exception
 }
})

$arp_menu_srld= New-Object System.Windows.Forms.ToolStripSeparator
$arp_menu_rld= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_rld.Text= "Header reload"
$arp_menu_rld.Add_Click({
 try{
	$script:header["arp_header_mck"]= (cat '.\header\arp_header_mck' | Out-String)
	$script:header["arp_header_nsd"]= (cat '.\header\arp_header_nsd' | Out-String)
	$script:header["arp_header_pmd"]= (cat '.\header\arp_header_pmd' | Out-String)

	Write-Host '<< headerをリロードしました'

	$retn= [Windows.Forms.MessageBox]::Show(
	"headerをリロードしました", "確認", "OK","Information","Button1"
	)
 }catch{
	echo $_.exception
 }
})

$arp_menu_adv= New-Object System.Windows.Forms.ToolStripMenuItem
#$arp_menu_adv.ForeColor= "Gray"
$arp_menu_adv.Text= "Advanced"

$arp_menu_mckh= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_mckh.Text= "edit mck header"
$arp_menu_mckh.Add_Click({
 try{
	Arpadv_edit "mck"
 }catch{
	echo $_.exception
 }
})

$arp_menu_nsdh= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_nsdh.Text= "edit nsd header"
$arp_menu_nsdh.Add_Click({
 try{
	Arpadv_edit "nsd"
 }catch{
	echo $_.exception
 }
})

$arp_menu_pmdh= New-Object System.Windows.Forms.ToolStripMenuItem
$arp_menu_pmdh.Text= "edit pmd header"
$arp_menu_pmdh.Add_Click({
 try{
	Arpadv_edit "pmd"
 }catch{
	echo $_.exception
 }
})
  
$chd_grp.Controls.AddRange(@($label_key,$label_kata,$label_genn,$comb_key,$comb_chd,$comb_genn,$check_open,$Pictbox)) 
$flet_grp.Controls.AddRange(@($comb_ab,$comb_bb,$comb_db,$comb_eb,$comb_gb,$label_chd,$label_flet,$box_flet,$box_chd,$import_chd_btn))
$mml_grp.Controls.AddRange(@($label_prefix,$label_apeg,$label_exp,$label_mml_exp,$label_oct,$label_mtr,$label_tainum,$label_taimark))
$mml_grp.Controls.AddRange(@($comb_apeg,$comb_prefix,$comb_trk,$comb_oct,$comb_tai,$nmud_trk,$nmud_tai))
$mml_grp.Controls.AddRange(@($lisn_btn,$stop_btn,$import_btn,$box_trk,$box_apeg,$box_mml,$box_mtr))

$arp_menu_comp.DropDownItems.AddRange(@($arp_menu_cmp0,$arp_menu_cmp1,$arp_menu_cmp2,$arp_menu_cmp3,$arp_menu_cmp4,$arp_menu_cmp5))
$arp_menu_play.DropDownItems.AddRange(@($arp_menu_ply0,$arp_menu_ply1,$arp_menu_ply2,$arp_menu_ply3))
$arp_menu_dosv.DropDownItems.AddRange(@($arp_menu_dos0,$arp_menu_dos1,$arp_menu_dos2,$arp_menu_dos3))
$arp_menu_edit.DropDownItems.AddRange(@($arp_menu_edt0,$arp_menu_edt1,$arp_menu_edt2,$arp_menu_edt3))
$arp_menu_adv.DropDownItems.AddRange(@($arp_menu_mckh,$arp_menu_nsdh,$arp_menu_pmdh))

$arp_menu_kt.DropDownItems.AddRange(@($menu_aty))

$arp_menu_f.DropDownItems.AddRange(@($arp_menu_kt,$arp_menu_sn,$arp_menu_n))
$arp_menu_o.DropDownItems.AddRange(@($arp_menu_ud,$arp_menu_comn,$arp_menu_comp,$arp_menu_play,$arp_menu_dosv,$arp_menu_edit,$arp_menu_setn,$arp_menu_set))
$arp_menu_m.DropDownItems.AddRange(@($arp_menu_oct1,$arp_menu_oct2,$arp_menu_oct3,$arp_menu_oct4,$arp_menu_oct5,$arp_menu_oct6,$arp_menu_oct7,$arp_menu_oct8))
$arp_menu_b.DropDownItems.AddRange(@($Arp_menu_mml,$arp_menu_mlun,$Arp_menu_fix))
$arp_menu_h.DropDownItems.AddRange(@($arp_menu_py,$arp_menu_spy,$arp_menu_adv,$arp_menu_rld,$arp_menu_srld,$arp_menu_whelp))

$arp_mnu.Items.AddRange(@($arp_menu_f,$arp_menu_o,$arp_menu_m,$arp_menu_b,$arp_menu_h))

$arp_stus.Items.AddRange(@($arp_label))
$frm_arp.Controls.AddRange(@($arp_mnu,$chd_grp,$flet_grp,$mml_grp,$arp_stus))
 
# ------ main 

 try{

  # キャスト

  if((Chk_path '.\arp_gene.xml') -eq 0){

	$arp_xml= [xml](cat '.\arp_gene.xml')
  }else{
	$arp_xml= [xml]$xml_arpeg
  }

  # 連想配列化

  # menu tame only memory <- setting.xml
  $comp=@{}; $play=@{}; $dosv=@{}; $edit=@{};


  $val=@{}; $opt=@{}; $key=@{};
  $header=@{};

   # cat -> Out-String(改行あり)でstringへ
  $header["arp_header_mck"]= (cat '.\header\arp_header_mck' | Out-String)
  $header["arp_header_nsd"]= (cat '.\header\arp_header_nsd' | Out-String)
  $header["arp_header_pmd"]= (cat '.\header\arp_header_pmd' | Out-String)


  Arpxml_read $script:arp_xml.table.val $script:arp_xml.table.opt


  # readのみ - Menuのため
  if((Chk_path '.\setting.xml') -eq 0){

	$set_xml= [xml](cat '.\setting.xml')

	Setxml_read $script:set_xml.table # hash化
 }


#write-host "------"
#write-host $val["compiler"]
#write-host $val["player"]
#write-host "------"
#write-host $val.Values
#write-host $comp.Values
#write-host $play.Values
#write-host "------"


  Arpmenu_build "compiler"
  Arpmenu_build "player"
  Arpmenu_build "dos"
  Arpmenu_build "editor"
  Arpstus_build # $opt["oct"]


  [string]$lis= ""

  [array]$chord_select= $comb_key.SelectedItem,
		$comb_chd.SelectedItem,
		$comb_genn.SelectedItem,
		$check_open.CheckState

  [array]$flet_setting= Fret_build $chord_select $cd


  [array]$blk= $comb_ab.SelectedItem,
		$comb_bb.SelectedItem,
		$comb_db.SelectedItem,
		$comb_eb.SelectedItem,
		$comb_gb.SelectedItem

  [array]$mml_setting= Chd_build $blk $flet_setting

  [array]$track_parm= Trk_split $box_trk.Text


  [void]$comb_apeg.Items.AddRange($rot[$comb_genn.SelectedItem])


  # array obj高速化
  [array]$undo= "","",""
  [array]$undo[0]= $null,"0" # omote
  [array]$undo[1]= $null,"0" # ura
  [array]$undo[2]= "0"

  # Unredo_arp 2

  [int[]]$frm_state= 0, 0 # Multi window state


  $frm_arp.ShowDialog() > $null

  Write-Host ('"分散コードエディタ"を終了します'+ "`r`n")

 }catch{
	echo $_.exception
	Write-Host '"ERROR: Safety Stopper >> $frm_arp.ShowDialog()"'

 }finally{

	$tray_arp.Dispose()
 }
 
