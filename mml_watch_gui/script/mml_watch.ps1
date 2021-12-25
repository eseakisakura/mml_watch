<# mml_watch.ps1 #> 

Write-Host ('"mml watch"を起動します'+ "`r`n")
 
$xml_watch= @' 
<table>
	<!-- タグ value -->
	<val>
		<mmlfile value= ""/>
		<mck value=""/>
		<nsd value=""/>
		<pmd value=""/>
		<compiler value= ""/>
		<player value= ""/>
		<dmcdir value= ""/>
		<editor value= ""/>
		<dos value= ""/>
	</val>
	<opt>
		<option value= "10000 00000, 01200 11000, 01000 00000"/>
		<radio_bin value= "nsd"/>
		<chk_dos value= "Checked"/>
		<chk_stop value= "UnChecked"/>
		<chk_thru value= "UnChecked"/>
		<chk_auto value= "True"/>
		<edt_open value= "False"/>
		<chk_tray value= "True"/>
		<chk_topmost value= "False"/>
	</opt>
</table>
'@
 
# nsf_trans 
	
function Mck_trans([string]$file){ 


	if($opt["chk_stop"] -eq 'Checked'){

		Player_open 1 $val["player"] > $null
	}

	Write-Host ''

	[string[]]$eor= "",""
	[string[]]$output= "",""

	# mml,bin,dmc

	[string[]]$rr= $file,$val["compiler"],$val["dmcdir"],$comlin[0]
	$output= Mkmck $rr

	sleep -m 33

	$csl_box.Text= $scroll_text+ "`r`n"+ $output[1]+ "`r`n"

	$script:scroll_text= $output[1]


	if($output[0] -ne ""){

		$err_box.Text= $output[0]+ "`r`n"
	}else{

		# $LASTEXITCODE [0-3]
		$eor[0]= ('exitcode: '+ $LASTEXITCODE)

		Write-Host $eor[0]
		$err_box.Text= $eor[0]+ "`r`n"


		[string[]]$arr= Split_path $file
		[string]$dpn= Join-Path $arr[1] $arr[2]

		if($LASTEXITCODE -ne 0){

			$eor[1]= ('ERROR: '+ $arr[0]+ '>> '+ $arr[2]+ '.nsf')
			Write-Host $eor[1]
			Write-Host ''

			$err_box.Text+= $eor[1]+ "`r`n"

		}else{

			Player_open 2 $val["player"] ('"'+ $dpn+ '.nsf"') > $null
		}
	}
 } #func
 
function Nsd_trans([string]$file){ 


	if($opt["chk_stop"] -eq 'Checked'){

		Player_open 1 $val["player"] > $null
	}

	Write-Host '' # 改行

	[string[]]$eor= "",""
	[string[]]$output= "",""

	# mml,bin,dmc
	# 配列確保で通る
	[string[]]$rr= $file,$val["compiler"],$val["dmcdir"],$comlin[1]
	$output= Mknsd $rr

	sleep -m 33 # 異常時用ウェイト

	$csl_box.Text= $scroll_text+ "`r`n"+ $output[1]+ "`r`n"

	$script:scroll_text= $output[1]


	if($output[0] -ne ""){ # not err

		$err_box.Text= $output[0]+ "`r`n"
	}else{

		# $LASTEXITCODE [0-3]
		$eor[0]= ('exitcode: '+ $LASTEXITCODE)

		Write-Host $eor[0]
		$err_box.Text= $eor[0]+ "`r`n"


		[string[]]$arr= Split_path $file
		[string]$dpn= Join-Path $arr[1] $arr[2]

		if($LASTEXITCODE -ne 0){

			$eor[1]= ('ERROR: '+ $arr[0]+ '>> '+ $arr[2]+ '.nsf')
			Write-Host $eor[1]
			Write-Host ''

			$err_box.Text+= $eor[1]+ "`r`n"

		}else{
			# '"' 空白パス対応
			Player_open 2 $val["player"] ('"'+ $dpn+ '.nsf"') > $null
		}
	}
 } #func
 
function Pmd_trans([string]$file){ 


	if($opt["chk_stop"] -eq 'Checked'){

		Player_open 1 $val["player"] > $null
	}

	Write-Host ''

	[string[]]$eor= "",""
	[string[]]$output= "",""

	# mml,bin,dmc

	[string[]]$rr= $file,$val["compiler"],$val["dmcdir"],$comlin[2],$val["dos"],$opt["chk_dos"]
	$output= Mkpmd $rr

	sleep -m 33

	$csl_box.Text= $scroll_text+ "`r`n"+ $output[1]+ "`r`n"

	$script:scroll_text= $output[1]


	if($output[0] -ne ""){

		$err_box.Text= $output[0]+ "`r`n"
	}else{

		# $LASTEXITCODE [0-3]
		$eor[0]= ('exitcode: '+ $LASTEXITCODE)

		Write-Host $eor[0]
		$err_box.Text= $eor[0]+ "`r`n"


		[string[]]$arr= Split_path $file
		[string]$dpn= Join-Path $arr[1] $arr[2]

		if($LASTEXITCODE -ne 0){

			$eor[1]= ('ERROR: '+ $arr[0]+ '>> '+ $arr[2]+ '.m')
			Write-Host $eor[1]
			Write-Host ''

			$err_box.Text+= $eor[1]+ "`r`n"

		}else{

			Player_open 2 $val["player"] ('"'+ $dpn+ '.m"') > $null
		}
	}
 } #func
 
function Thru_trans([string]$file){ 

	$err_box.Text= ""

	$script:scroll_text= "compiler thru"+ "`r`n"+ "mml -> player direct"+ "`r`n"

	$csl_box.Text= $scroll_text


	[string[]]$arr= Split_path $file
	[string]$dpn= Join-Path $arr[1] $arr[2]

	Player_open 2 $val["player"] ('"'+ $dpn+ '.mml"') > $null
 } #func
 
function Play_nsf([string]$file){ 

	$watch.Start()

	if($opt["chk_thru"] -eq 'Checked'){

		[string]$sw= "thru"
	}else{
		[string]$sw= $opt["radio_bin"]
	}

	switch($sw){
	'mck'{	 Mck_trans $file; break;
	}'nsd'{	 Nsd_trans $file; break;
	}'pmd'{	 Pmd_trans $file; break;
	}'thru'{ Thru_trans $file
	}
	} #sw

	$watch.Stop()

	$ts= $watch.Elapsed #プロパティ参照

	$watch.Reset()

	[string]$ss= "[Elapsed] :{0:0}.{1:000}sec." -f $ts.Seconds,$ts.Milliseconds # -f フォーマット演算子

	Write-Host ''
	Write-Host $ss

	$csl_box.Text+= $ss # +"`r`n" fuyou
	$csl_box.SelectionStart= $csl_box.Text.Length
	$csl_box.ScrollToCaret()

 } #func
 
function Watches_nsf([string]$eor){ 

	Write-Host ''
	Write-Host $eor

	$err_box.Text+= $eor # " last de `r`n"不要

	$err_box.SelectionStart= $err_box.Text.Length
	$err_box.ScrollToCaret()
 } #func
  
# chk_path 
	
function Status_build(){ 

	[int[]]$err= 0,0,0,0

	$err[0]= Chk_path $val["mmlfile"]
	$err[1]= Chk_path $val["compiler"]
	$err[2]= Chk_path $val["player"]
	$err[3]= Chk_path $val["dmcdir"]

	return $err
 } #func
 
function Console_out([string[]]$ph){ 


	[array]$f= "","","",""
	[string[]]$f[0]= "","","",""
	[string[]]$f[1]= "","","",""
	[string[]]$f[2]= "","","",""
	[string[]]$f[3]= "","","",""

	$f[0]= Split_path $val["mmlfile"]
	$f[1]= Split_path $val["compiler"]
	$f[2]= Split_path $val["player"]
	$f[3]= Split_path $val["dmcdir"]


	[string[]]$rot= "","","",""

	[int[]]$err= Status_build

	switch($err[0]){
	2{	$rot[0]= '> mmlファイル 選択されてません';		break;
	}1{	$rot[0]= '> mmlファイル パス先がありません';		break;
	}0{	$rot[0]= '< mmlファイル'
	}
	} #sw
	switch($err[1]){
	2{	$rot[1]= '> binaryファイル 選択されてません';		break;
	}1{	$rot[1]= '> binaryファイル パス先がありません';		break;
	}0{	$rot[1]= '< binaryファイル'
	}
	} #sw
	switch($err[2]){
	2{	$rot[2]= '> Playerファイル 選択されてません';		break;
	}1{	$rot[2]= '> Playerファイル パス先がありません';		break;
	}0{	$rot[2]= '< Playerファイル'
	}
	} #sw
	switch($err[3]){
	2{	$rot[3]= '> Includeフォルダ 選択されてません';		break;
	}1{	$rot[3]= '> Includeフォルダ パス先がありません';	break;
	}0{	$rot[3]= '< Includeフォルダ'
	}
	} #sw

	Write-Host '' # 改行
	Write-Host $ph[0]
	Write-Host ($ph[1]+ $ph[2])
	Write-Host ''
	Write-Host ($rot[0]+ "`r`n"+ $val["mmlfile"]) # full path
	Write-Host ($rot[1]+ "`r`n"+ $val["compiler"])
	Write-Host ($rot[2]+ "`r`n"+ $val["player"])
	Write-Host ($rot[3]+ "`r`n"+ $val["dmcdir"])
	Write-Host ''


	$csl_box.Lines= $ph[0],
			($ph[1]+ $ph[2]),
			$rot[0],(" : "+ $f[0][0]), # file name
			$rot[1],(" : "+ $f[1][0]),
			$rot[2],(" : "+ $f[2][0]),
			$rot[3],(" : "+ $f[3][0]),"" # 改行分


	$stus_label.Text= "  "+ "ply: "+ $f[2][0]+ $ph[2]

	$script:scroll_text= $csl_box.Text

 } #func
 
function Status_cheker(){ 

	[string]$m= "" # 定義のみだと返値(echo)が出る、空値入れとく
	[string]$k= ""
	[string]$c= ""
	[string]$g= ""
	[string]$d= ""


	if($opt["chk_thru"] -eq 'Checked'){

		[string]$sw= "thru"
	}else{
		[string]$sw= $opt["radio_bin"]
	}

	switch($sw){

		'mck'{	$m= '"ppmck"' # esc["`""] -> ['"']
			$k= $comlin[0]
			break;

		}'nsd'{	$m= '"NSDlib"'
			$k= $comlin[1]
			break;

		}'pmd'{	$m= '"P.M.D"'
			$k= $comlin[2]
			break;

		}'thru'{ $m= '"direct"'
			 $k= ""
		}
	} #sw

	if($opt["chk_dos"] -eq 'Checked'){

		$g= " /x64対応"
	}

	if($opt["chk_stop"] -eq 'Checked'){

		$c= " /stopコマンド付"
	}


	[string[]]$ss= (' ['+ $m+ '] '+ $k),$g,$c

	Console_out $ss

} #func
 
function Play_setpath(){ 


	[int[]]$r= Status_build
	[int]$stus= $r[0]+ $r[1]+ $r[2] # $r[3] cancel

	if($stus -ne 0){

		[string]$eor= ('監視環境が不足 ERR Level>> '+ $stus)

		$err_box.Text= $eor+ "`r`n"
		Write-Host $eor
	}

	return $stus
 } #func
 
function Wait_setpath(){ 

	$frm.Text= "mml watch"


	[int]$stus= Play_setpath

	[int]$err= 0
	[string]$eor= ""


	if($stus -eq 0){

		[string[]]$f= Split_path $val["mmlfile"]

		switch($f[3]){
		'.mml'{
			$err= 1
			$eor= ('.mmlの監視セット<< '+ $f[0])
			break;

		}'.nsf'{
			$eor= ('.nsfの監視は不可です>> '+ $f[0])
			break;

		}'.nsfe'{
			$eor= ('.nsfeの監視は不可です>> '+ $f[0])
			break;

		}'.m'{
			$eor= ('.mの監視は不可です>> '+ $f[0])
			break;

		}'.m2'{
			$eor= ('.m2の監視は不可です>> '+ $f[0])
			break;

		}default{
			$err= 1
			$eor= ($f[3]+ 'の監視セット<< '+ $f[0])
		}
		} #sw

		Write-Host $eor
		$err_box.Text= $eor+ "`r`n"
	}

	switch($err){
	1{
		$script:wait.Path= $f[1] # RaisingEvents= $True時、必要
		$script:wait.Filter= $f[0]
		break;
	}0{
		$script:wait.Path= ".\temp" # 存在するパス <- Pathエラーため
		$script:wait.Filter= $null
	}
	} #sw

	return $err
} #func
  
# toggle 
	
function Toggle_label(){ 


	[string]$d= ""

	switch($opt["radio_bin"]){

	'mck'{	$d= "MCK / ";	break;
	}'nsd'{	$d= "NSD / ";	break;
	}'pmd'{	$d= "PMD / "
	}
	} #sw

	switch($wait.EnableRaisingEvents){

	$True{		$d+= "WATCHES"
			$tray.Text= $d
			$wait_lbl.Text= $d
			$wait_lbl.BackColor= "orange"
			$wait_lbl.ForeColor= "white"
			break;

	}$False{	$d+= "PAUSE"
			$tray.Text= $d
			$wait_lbl.Text= $d
			$wait_lbl.BackColor= "deepskyblue"
			$wait_lbl.ForeColor= "black"
	}
	} #sw
 } #func
 
function Toggle_sw([int]$num,[string]$c){ 

 if($num -eq 1){ # w_console out cancel

	switch($c){

	'true'{
		if($wait.EnableRaisingEvents -ne $True){  $num= 0 }
		break;
	}'false'{
		if($wait.EnableRaisingEvents -ne $False){ $num= 0 }
	}
	} #sw
 }

 if($num -eq 0){ # <- $num= 0

	switch($c){

	'true'{
		$frm.Text= ("["+ $wait.Filter+ "] - mml watch")
		$wait_btn.Image= [System.Drawing.Image]::FromFile(".\img\stop.png")

		$wait.EnableRaisingEvents= $True # 開始
		break;
	}'false'{
		$frm.Text= "Pause - mml watch"
		$wait_btn.Image= [System.Drawing.Image]::FromFile(".\img\play.png")

		$wait.EnableRaisingEvents= $False
	}
	} #sw

	Write-Host ('RaisingEvents: '+ $wait.EnableRaisingEvents)
 }

 } #func
 
function Watch_Setting(){ 

	[bool]$bool_sw= $tray.Visible
	$tray.Visible= $False # tray側のコントロール不可にする
	$frm.AllowDrop= $False


	Toggle_sw 1 "false"	# ファイル更新キャンセラー


	[array]$args_set= "",""
	$args_set= .\setting.ps1 $val $opt "all"


	$script:val= $args_set[0]
	$script:opt= $args_set[1]

	$script:comlin= Comline $opt["option"]

	Status_cheker
	$script:chk_mml= Wait_setpath

	# Watches_nsf $wait.Filter # Wait_setpath

	if($chk_mml -eq $True){ # $wait_btn canceller

		Toggle_sw 1 "true"
	}

	Toggle_label

	if((Test-Path '.\setting.xml') -eq $True){

		$script:set_xml= [xml](cat '.\setting.xml')

		$script:edit=@{};

		Helpxml_read $script:set_xml.table # hash化
	}

	$frm.AllowDrop= $True
	$tray.Visible= $bool_sw
 } #func
 
function Watch_Start(){ 

	[int]$stus= Play_setpath

  if($stus -eq 0){

	switch($wait.EnableRaisingEvents){ # トグル
	$False{

		if($opt["chk_auto"] -ne 'False'){

			Play_nsf $val["mmlfile"]
		}else{
			$err_box.Text= "" # .Clear() reload gi
		}

		Watches_nsf ('< Watches: '+ $wait.Filter)

		Toggle_sw 1 "true"

		break;
	}$True{

		$err_box.Text= "" # .Clear()

		Watches_nsf ('> Pause: '+ $wait.Filter)

		Toggle_sw 1 "false"
	}
	} #sw

	Toggle_label
  }
 } #func
 
function Watch_Drop(){ 

	Toggle_sw 1 "false"

	[string[]]$args_path= $_.Data.GetData("FileDrop")


	switch(Chk_path $args_path[0]){

	2{	Write-Host ('ERROR: Null >> FileDrop Form')
		break;

	}1{	Write-Host ('ERROR: Test-Path >> FileDrop Form')
		break;

	}0{	$script:val["mmlfile"]= $args_path[0]
	}
	} #sw

	Write-Host '' # 改行

	Status_cheker
	$script:chk_mml= Wait_setpath

	if($chk_mml -eq $True){

		Toggle_sw 1 "true"
	}

	# Watches_nsf $wait.Filter # Wait_setpath

	Toggle_label
 } #func
  
# gui 
	
function Contxt_chg([string]$sw,[int]$chg){ 

	switch($sw){

	'最小化'{

		$contxt_tray.Items.Clear()
		[void]$contxt_tray.Items.Add("元に戻す")
		[void]$contxt_tray.Items.Add("環境設定")
		[void]$contxt_tray.Items.Add("終了")

		##$tray.PerformClick()
		if($chg -eq 1){ $frm.WindowState= "Minimized" }
		break;

	}'元に戻す'{
		$contxt_tray.Items.Clear()
		[void]$contxt_tray.Items.Add("最小化")
		[void]$contxt_tray.Items.Add("環境設定")
		[void]$contxt_tray.Items.Add("終了")

		##$tray.PerformClick()
		if($chg -eq 1){ $frm.WindowState= "Normal" }
		break;

	}'環境設定'{
		$menu_a.PerformClick()
		break;

	}'終了'{
		$menu_n.PerformClick()
	}
	} #sw
} #func
 
function Top_most([string]$t){ 

	switch($t){
	'true'{

		$frm.TopMost= $True # 最前面化
		$menu_t.Text= "v 最前面表示"
		break;
	}'false'{

		$frm.TopMost= $False
		$menu_t.Text= "最前面表示"
	}
	} #sw

	return $t
 } #func

 
function Tray_hide([string]$t){ 

	switch($t){
	'true'{

		$tray.Visible= $True
		$menu_ty.Text= "v タスクトレイ"
		break;
	}'false'{

		$tray.Visible= $False
		$menu_ty.Text= "タスクトレイ"
	}
	} #sw

	return $t
 } #func

 
function Edit_open([string]$t){ 

	switch($t){
	'true'{
		$menu_eo.Text= "v 起動時、エディタオープン"
		break;
	}'false'{
		$menu_eo.Text= "起動時、エディタオープン"
	}
	} #sw

	return $t
 } #func
 
function Auto_start([string]$t){ 

	switch($t){
	'true'{
		$pic_box.Image= [System.Drawing.Image]::FromFile(".\img\orange.png")
		$menu_r.Text= "v 監視開始時、リスタート"
		break;
	}'false'{
		$pic_box.Image= [System.Drawing.Image]::FromFile(".\img\blue.png")
		$menu_r.Text= "監視開始時、リスタート"
	}
	} #sw

	return $t
 } #func
  
# hash 
	
function Helpxml_read($x){ 

  # $x= $script:set_xml.table

  for([int]$i=3; $i -ge 0; $i--){

	if($x.edt[$i].name -ne ''){

		$script:edit[$x.edt[$i].name]= $x.edt[$i].param
	}
  } #
 } #func
 
function Wthxml_read($x,$y){ 

	# $x= $script:wth_xml.table.val
	# $y= $script:wth_xml.table.opt

	$script:val["mmlfile"]= $x.mmlfile.value
	$script:val["mck"]= $x.mck.value
	$script:val["nsd"]= $x.nsd.value
	$script:val["pmd"]= $x.pmd.value
	$script:val["compiler"]= $x.compiler.value
	$script:val["player"]= $x.player.value
	$script:val["dmcdir"]= $x.dmcdir.value
	$script:val["editor"]= $x.editor.value
	$script:val["dos"]= $x.dos.value


	$script:opt["option"]= $y.option.value
	$script:opt["radio_bin"]= $y.radio_bin.value
	$script:opt["chk_dos"]= $y.chk_dos.value
	$script:opt["chk_stop"]= $y.chk_stop.value
	$script:opt["chk_thru"]= $y.chk_thru.value

	# メニュー切換
	$script:opt["chk_topmost"]= Top_most $y.chk_topmost.value
	$script:opt["chk_auto"]= Auto_start $y.chk_auto.value
	$script:opt["chk_tray"]= Tray_hide $y.chk_tray.value

	$script:opt["edt_open"]= Edit_open $y.edt_open.value
	# -> next $frm.Add_Shown
 } #func
 
function Wthwrite_xml($x,$y){ 

	# $x= $script:wth_xml.table.val
	# $y= $script:wth_xml.table.opt

	$x.mmlfile.value= [string]$val["mmlfile"] # $xmlは[string]キャスト必要
	$x.mck.value= [string]$val["mck"]
	$x.nsd.value= [string]$val["nsd"]
	$x.pmd.value= [string]$val["pmd"]
	$x.compiler.value= [string]$val["compiler"]
	$x.player.value= [string]$val["player"]
	$x.dmcdir.value= [string]$val["dmcdir"]
	$x.editor.value= [string]$val["editor"]
	$x.dos.value= [string]$val["dos"]

	$y.option.value= [string]$opt["option"]
	$y.radio_bin.value= [string]$opt["radio_bin"]
	$y.chk_dos.value= [string]$opt["chk_dos"]
	$y.chk_stop.value= [string]$opt["chk_stop"]
	$y.chk_thru.value= [string]$opt["chk_thru"]

	$y.chk_topmost.value= [string]$opt["chk_topmost"]
	$y.chk_auto.value= [string]$opt["chk_auto"]
	$y.chk_tray.value= [string]$opt["chk_tray"]
	$y.edt_open.value= [string]$opt["edt_open"]
 } #func
 
function Param_join([array]$rr){ 

	[string]$s= ""

	for([int]$i=0; $i -lt $rr.Length; $i++){

		if($rr[$i] -ne ""){

			if($s -ne ""){ $s+= " " }

			$s+= $rr[$i]
		}
	} #

	return $s
} #func
 
function Comline([string]$t){ 

	$s= $t -replace " ",""

	[array]$rr= $s -split ","

	[string[]]$m= $rr[0].ToCharArray()
	[string[]]$n= $rr[1].ToCharArray()
	[string[]]$p= $rr[2].ToCharArray()

	[array]$a= @("","","") # mck,nsd,pmd
	[string[]]$a[0]= "","",""
	[string[]]$a[1]= "","","","", "","","","", ""
	[string[]]$a[2]= "","","" #必要な分だけ

	if($m[0] -eq '1'){ $a[0][0]= "-i" }
	if($m[1] -eq '1'){ $a[0][1]= "-m1" }
	if($m[2] -eq '1'){ $a[0][2]= "-w" }

	if($n[0] -eq '1'){ $a[1][0]= "-a" } #def.時は読まない
	if($n[1] -eq '1'){ $a[1][1]= "-n" }
	if($n[2] -ne '2'){ $a[1][2]= ("-v"+ $n[2]) }
	if($n[3] -eq '1'){ $a[1][3]= "-x" }
	if($n[4] -eq '1'){ $a[1][4]= "-od+" }
	if($n[5] -eq '0'){ $a[1][5]= "-oo-" }
	if($n[6] -eq '0'){ $a[1][6]= "-os-" }
	if($n[7] -eq '1'){ $a[1][7]= "-e" }
	if($n[8] -eq '1'){ $a[1][8]= "-s" }

	switch($p[0]){
	'0'{	$a[2][0]= "/N"; break;
	}'1'{	$a[2][0]= "/L"; break;
	}'2'{	$a[2][0]= "/M"; break;
	}'3'{	$a[2][0]= "/T"
	}
	} #sw
	if($p[1] -eq '1'){ $a[2][1]= "/V" }
	if($p[2] -eq '1'){ $a[2][2]= "/C" }


	[string[]]$ss= "","",""

	$ss[0]= Param_join $a[0]
	$ss[1]= Param_join $a[1]
	$ss[2]= Param_join $a[2]

	# $ss[2]= $a[2] -join " " # 無駄なspaceため

	return $ss
} #func
  
Add-Type -AssemblyName System.Windows.Forms > $null 

$ErrorActionPreference= "Stop"

cd (Split-Path -Parent $MyInvocation.MyCommand.Path)
[Environment]::CurrentDirectory= pwd # working_dir set
 
# Form 
	 
$err_box= New-Object System.Windows.Forms.TextBox 
$err_box.Size= "220,55"
$err_box.Location= "10,55"
$err_box.WordWrap= "False"
$err_box.Multiline= "True"
$err_box.ScrollBars= "Both"
$err_box.BorderStyle= "FixedSingle"
$err_box.ReadOnly= "True"
$err_box.ForeColor= "Mediumblue"
$err_box.BackColor= "White"

 
$csl_box= New-Object System.Windows.Forms.TextBox 
$csl_box.Size= "220,130"
$csl_box.Location= "10,115"
$csl_box.WordWrap= "False"
$csl_box.Multiline= "True"
$csl_box.ScrollBars= "Both"
$csl_box.BorderStyle= "FixedSingle"
$csl_box.ReadOnly= "True"
$csl_box.ForeColor= "#2b2b2b"
$csl_box.BackColor= "White"

 
$pic_box= New-Object System.Windows.Forms.PictureBox 
$pic_box.ClientSize= "11,11"
$pic_box.Location= "11,33"
# $pic_box.Image= [System.Drawing.Image]::FromFile(".\img\blue.png")
# $pic_box.Image= [System.Drawing.Image]::FromFile(".\img\orange.png")

$pic_box.Add_Click({
  try{
    if([string]$_.Button -eq 'Left'){

	$menu_r.PerformClick()
    }
  }catch{
	echo $_.exception
  }
})
 
$wait_lbl= New-Object System.Windows.Forms.Label 
$wait_lbl.Size= "150,25"
#$wait_lbl.Location= "2,25"
$wait_lbl.Location= "61,26"
$wait_lbl.TextAlign= "MiddleCenter"
$wait_lbl.BorderStyle= "Fixed3D"
$wait_lbl.ForeColor= "black"
#$wait_lbl.BackColor= "dodgerblue"

$wait_lbl.Add_Click({
  try{
    if([string]$_.Button -eq 'Left'){

	$wait_btn.PerformClick()
    }
  }catch{
	echo $_.exception
  }
})
 
$wait_btn= New-Object System.Windows.Forms.Button 
$wait_btn.Size= "25,25"
#$wait_btn.Location= "158,26"
$wait_btn.Location= "31,26"
$wait_btn.FlatStyle= "Popup"
# $wait_btn.Image= [System.Drawing.Image]::FromFile(".\img\stop.png")
# $wait_btn.Image= [System.Drawing.Image]::FromFile(".\img\play.png")

$wait_btn.Add_Click({	# 監視ボタン
  try{
	Watch_Start

  }catch{
	echo $_.exception
  }
 })
 
$stus_bar= New-Object System.Windows.Forms.StatusStrip 
$stus_bar.SizingGrip= $false

$stus_label= New-Object System.Windows.Forms.ToolStripStatusLabel
# $stus_label.Text= "  Test ------"
# $stus_label.Font= $Fon
 
$contxt_tray= New-Object System.Windows.Forms.ContextMenuStrip 
# $contxt objを読み込んだ後$NotifyIcon objが安全

[void]$contxt_tray.Items.Add("最小化")
[void]$contxt_tray.Items.Add("環境設定")
[void]$contxt_tray.Items.Add("終了")

$contxt_tray.Add_ItemClicked({
  try{
	Contxt_chg $_.ClickedItem 1 # キャスト不要

	$this.Close()

 }catch{
	echo $_.exception
 }
})
 
$tray= New-Object System.Windows.Forms.NotifyIcon 
$tray.Icon= Icon_read "..\mml_watch.exe"
# $tray.Visible= $True
# $tray.Text= "watches"
$tray.ContextMenuStrip= $contxt_tray

$tray.Add_Click({ # .Add_MouseDown
  try{

    switch([string]$_.Button){ # キャスト
    'Left'{

	switch($frm.WindowState){
	'Minimized'{
		Contxt_chg "元に戻す" 1
		break;

	}'Normal'{
		Contxt_chg "最小化" 1
	}
	} #sw

#	break;
#   }'Right'{ # 不要 モーダル発生 -> $tray.ContextMenuStrip
#	$contxt_tray.Show([Windows.Forms.Cursor]::Position)
    }
    } #sw

 }catch{
	echo $_.exception
 }
})
 
$frm= New-Object System.Windows.Forms.Form 
#$frm.Text= "mml watch"
$frm.Size= "248,302"
$frm.FormBorderStyle= "FixedSingle"
$frm.StartPosition= "WindowsDefaultLocation"
$frm.Icon= Icon_read "..\mml_watch.exe"
#$frm.ShowIcon= $False
#$frm.MinimizeBox= $False
$frm.MaximizeBox= $False

$frm.TopLevel= $True
## $frm.TopMost= $True # 最前面表示のプロパティ

$frm.AllowDrop= $True

#$frm.Add_Load({
#	$frm.WindowState= "Minimized" # 最小化 "Normal"
#})
#$frm.Add_KeyDown({
#	Write-Host $_.KeyCode # check
#})

$frm.Add_Shown({

 try{
	$wait.SynchronizingObject= $this

	$wait_btn.Select() # forcus

	if($opt["edt_open"] -eq 'True'){

		[string]$retn= Editor_open $val["editor"] $val["mmlfile"]

		if($retn -ne ""){ $err_box.Text= $retn }
	}
 }catch{
	echo $_.exception
 }
})

$frm.Add_SizeChanged({
 try{
	switch($frm.WindowState){
	'Minimized'{
		Contxt_chg "最小化" 0
		break;

	}'Normal'{
		Contxt_chg "元に戻す" 0
	}
	} #sw

 }catch{
	echo $_.exception
 }
})

$frm.Add_FormClosing({ # イベント内だとerr把握しずらい ->関数化
 try{

	Wthwrite_xml $script:wth_xml.table.val $script:wth_xml.table.opt

	File_writer $script:wth_xml '.\mml_watch.xml'

 }catch{
	echo $_.exception
 }
})

$frm.Add_DragEnter({

	$_.Effect= "All"
})

$frm.Add_DragDrop({
  try{
	Watch_Drop

  }catch{
	echo $_.exception
  }
})
 
$mnu= New-Object System.Windows.Forms.MenuStrip 
	 
$menu_f= New-Object System.Windows.Forms.ToolStripMenuItem 
$menu_f.Text= "File"

$menu_e= New-Object System.Windows.Forms.ToolStripMenuItem
$menu_e.Text= "エディタ"

$menu_e.Add_Click({
 try{
	[string]$retn= Editor_open $val["editor"] $val["mmlfile"]

	if($retn -ne ""){ $err_box.Text= $retn }
 }catch{
	echo $_.exception
 }
})

$menu_d= New-Object System.Windows.Forms.ToolStripMenuItem
$menu_d.Text= "フォルダ"

$menu_d.Add_Click({
 try{
	[string]$retn= Folder_open 1 $val["mmlfile"]

	if($retn -ne ""){ $err_box.Text= $retn }
 }catch{
	echo $_.exception
 }
})

$menu_spy= New-Object System.Windows.Forms.ToolStripSeparator
$menu_py= New-Object System.Windows.Forms.ToolStripMenuItem
$menu_py.Text= "プレイヤー"

$menu_py.Add_Click({
 try{
	[string]$retn= Player_open 0 $val["player"]

	if($retn -ne ""){ $err_box.Text= $retn }
 }catch{
	echo $_.exception
 }
})

$menu_sn= New-Object System.Windows.Forms.ToolStripSeparator
$menu_n=  New-Object System.Windows.Forms.ToolStripMenuItem
$menu_n.Text= "終了"

$menu_n.Add_Click({ # 終了

	$frm.Close()
})
 
$menu_o= New-Object System.Windows.Forms.ToolStripMenuItem 
$menu_o.Text= "Option"


$menu_a= New-Object System.Windows.Forms.ToolStripMenuItem
$menu_a.Text= "環境設定"

$menu_a.Add_Click({ # 環境設定
 try{
	Watch_Setting

 }catch{
	echo $_.exception
    	Write-Host '"ERROR: Safety Stopper >> call .\setting.ps1"'
 }
})

$menu_kar= New-Object System.Windows.Forms.ToolStripSeparator
$menu_ka=  New-Object System.Windows.Forms.ToolStripMenuItem
$menu_ka.Text= "各種設定"

$menu_ty=  New-Object System.Windows.Forms.ToolStripMenuItem
# $menu_ty.Text= "v タスクトレイ"

$menu_ty.Add_Click({
 try{
	switch($opt["chk_tray"]){ # トグル

	'True'{		$script:opt["chk_tray"]= Tray_hide "False";	break;
	}'False'{	$script:opt["chk_tray"]= Tray_hide "True"
	}
	} #sw
 }catch{
	echo $_.exception
 }
})

$menu_eor= New-Object System.Windows.Forms.ToolStripSeparator
$menu_eo=  New-Object System.Windows.Forms.ToolStripMenuItem
# $menu_eo.Text= "v 起動時、エディタオープン"

$menu_eo.Add_Click({
 try{
	switch($opt["edt_open"]){ # トグル

	'True'{		$script:opt["edt_open"]= Edit_open "False";	break;
	}'False'{	$script:opt["edt_open"]= Edit_open "True"
	}
	} #sw
 }catch{
	echo $_.exception
 }
})

$menu_sr= New-Object System.Windows.Forms.ToolStripSeparator
$menu_r=  New-Object System.Windows.Forms.ToolStripMenuItem
# $menu_r.Text= "v 監視開始時、リスタート"

$menu_r.Add_Click({
 try{
	switch($opt["chk_auto"]){ # トグル

	'True'{		$script:opt["chk_auto"]= Auto_start "False";	break;
	}'False'{	$script:opt["chk_auto"]= Auto_start "True"
	}
	} #sw
 }catch{
	echo $_.exception
 }
})

$menu_st= New-Object System.Windows.Forms.ToolStripSeparator
$menu_t=  New-Object System.Windows.Forms.ToolStripMenuItem
# $menu_t.Text= "v 最前面表示"

$menu_t.Add_Click({
 try{
	switch($opt["chk_topmost"]){ # トグル

	'True'{		$script:opt["chk_topmost"]= Top_most "False";	break;
	}'False'{	$script:opt["chk_topmost"]= Top_most "True"
	}
	} #sw
 }catch{
	echo $_.exception
 }
})
 
$menu_h= New-Object System.Windows.Forms.ToolStripMenuItem 
$menu_h.Text= "Help"


$menu_sw= New-Object System.Windows.Forms.ToolStripSeparator
$menu_whelp= New-Object System.Windows.Forms.ToolStripMenuItem
$menu_whelp.Text= "MmlWatch Help"

$menu_whelp.Add_Click({
 try{

  if((Chk_path $edit["sted.exe"]) -eq 0){

	[string]$retn= Editor_open $edit["sted.exe"] "..\doc\Mml_Watch.txt"
  }else{
	[string]$retn= Editor_open $val["editor"] "..\doc\Mml_Watch.txt"
  }

  if($retn -ne ""){ $err_box.Text= $retn }

 }catch{
	echo $_.exception
 }
})

$menu_phelp= New-Object System.Windows.Forms.ToolStripMenuItem
$menu_phelp.Text= "PMD Quick Help"

$menu_phelp.Add_Click({
 try{

  if((Chk_path $edit["sted.exe"]) -eq 0){

	[string]$retn= Editor_open $edit["sted.exe"] "..\doc\PMD_Quick_Help.txt"
  }else{
	[string]$retn= Editor_open $val["editor"] "..\doc\PMD_Quick_Help.txt"
  }

  if($retn -ne ""){ $err_box.Text= $retn }

 }catch{
	echo $_.exception
 }
})

$menu_nhelp= New-Object System.Windows.Forms.ToolStripMenuItem
$menu_nhelp.Text= "NSDlib Quick Help"

$menu_nhelp.Add_Click({
 try{

  if((Chk_path $edit["sted.exe"]) -eq 0){

	[string]$retn= Editor_open $edit["sted.exe"] "..\doc\Nsdlib_Quick_Help.txt"
  }else{
	[string]$retn= Editor_open $val["editor"] "..\doc\Nsdlib_Quick_Help.txt"
  }

  if($retn -ne ""){ $err_box.Text= $retn }

 }catch{
	echo $_.exception
 }
})

$menu_mhelp= New-Object System.Windows.Forms.ToolStripMenuItem
$menu_mhelp.Text= "ppmck Quick Help"

$menu_mhelp.Add_Click({
 try{

  if((Chk_path $edit["sted.exe"]) -eq 0){

	[string]$retn= Editor_open $edit["sted.exe"] "..\doc\ppmck_Quick_Help.txt"
  }else{
	[string]$retn= Editor_open $val["editor"] "..\doc\ppmck_Quick_Help.txt"
  }

  if($retn -ne ""){ $err_box.Text= $retn }

 }catch{
	echo $_.exception
 }
})
 	 
$menu_f.DropDownItems.AddRange(@($menu_e,$menu_d,$menu_spy,$menu_py,$menu_sn,$menu_n)) 
$menu_ka.DropDownItems.AddRange(@($menu_eo,$menu_eor,$menu_r,$menu_sr,$menu_ty))

$menu_o.DropDownItems.AddRange(@($menu_t,$menu_st,$menu_ka,$menu_kar,$menu_a))
$menu_h.DropDownItems.AddRange(@($menu_mhelp,$menu_nhelp,$menu_phelp,$menu_sw,$menu_whelp))
$mnu.Items.AddRange(@($menu_f,$menu_o,$menu_h))

$stus_bar.Items.AddRange(@($stus_label))
$frm.Controls.AddRange(@($mnu,$pic_box,$wait_lbl,$wait_btn,$err_box,$csl_box,$stus_bar))

$frm.AcceptButton= $wait_btn	# [Enter]
  
$watch= New-Object System.Diagnostics.StopWatch 
 
# FileSystemWatcher ------ 

$wait= New-Object System.IO.FileSystemWatcher


# $wait.InternalBufferSize= 8192 # [4096-8192-65535]
# $wait.IncludeSubdirectories= $False

$wait.NotifyFilter= [System.IO.NotifyFilters]::LastWrite

# $wait.Path= ".\temp" # 仮パス入 <- Pathエラーため
# $wait.Filter= $null
# $wait.EnableRaisingEvents= $False

$wait.Add_Changed({	# event func入れ子は一段が理想..

 try{

	$script:lated_time= (Get-Item $_.FullPath).LastWriteTime.ToString('yy/MM/dd HH:mm:ss')

	# [ $_ if ok. can't switch ]
	if($lated_time -ne $chk_time){ # 二重読込みの不備対策

		$script:chk_time= $lated_time


		# $_ | Write-Host  # [= FileSystemEventArgsクラス]

		Write-Host ('Updated: '+ $_.ChangeType)
		Write-Host ''

		Play_nsf $_.FullPath # $err_box.Text
		Watches_nsf ('< Watches: '+ $_.Name)

		sleep -m 167	# ウェイト
	}

 }catch{
	echo $_.exception
	Write-Host '"ERROR: Safety Stopper >> FileSystemWatcher"'
 }
})
 
# ------ main 

 try{

 [string[]]$args_str= $Args

 # キャスト

 if((Test-Path '.\mml_watch.xml') -eq $True){

	$wth_xml= [xml](cat '.\mml_watch.xml')
 }else{
	$wth_xml= [xml]$xml_watch
 }


 # 連想配列化

 $val= @{}; $opt= @{};
 $edit=@{};

 Wthxml_read $script:wth_xml.table.val $script:wth_xml.table.opt

 [string[]]$comlin= Comline $opt["option"]


	switch(Chk_path $args_str[0]){

	2{	Write-Host ('FileDrop >> Null')
		break;

	}1{	Write-Host ('FileDrop >> Test-Path Error')
		break;

	}0{	$script:val["mmlfile"]= $args_str[0]
	}
	} #sw


 # 状態チェック
 Status_cheker
 [bool]$chk_mml= Wait_setpath # $wait.Filter

 # $wait_btn canceller
 if($chk_mml -eq $True){

	Toggle_sw 0 "true"
 }else{
	Toggle_sw 0 "false"
 }

 Toggle_label

 # readのみ - Helpため
 if((Test-Path '.\setting.xml') -eq $True){

	$set_xml= [xml](cat '.\setting.xml')

	Helpxml_read $script:set_xml.table # hash化
 }


 [string]$chk_time= ""
 [string]$lated_time= ""

 [string]$scroll_text= "" # $csl_box 一つ前の履歴


 $frm.ShowDialog() > $null


 # | Out-Null -> > $null # cancel標準出力抑制

 Write-Host ("`r`n"+"`"mml watch`"を終了します"+"`r`n")

 }catch{
	echo $_.exception
	Write-Host '"ERROR: Safety Stopper >> $frm.ShowDialog()"'

 }finally{

	$wait.Dispose()
	$tray.Dispose() # 必要
 }
 
# ハッシュ名追加の場合 
# $xml_watch= @'
# function Wthxml_read($x,$y){
# function Wthwrite_xml($x,$y){
# $opt $script:opt
 
#			xml.string 
#			reset
#			v
# xml.file	show->	xml.mem		->hash		->List
# $val[""]				[key,value]	[key]
#					foreach etc.
#
#		<- ok			<-close
#		X- cancel
 
