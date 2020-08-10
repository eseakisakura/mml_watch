<# mml_watch.ps1 #> 

Write-Host ("`"mml watch`"を起動します")

#          filecashe   R/W
# xml > xml.string > hash > gui.value
#         cancel gi              change gi

# obj kakuho no hensuu niha $script: shinai
# func no insuu ha read nomi,
# func deno write de migikaku suruniha naibu de sengenn

#			xml.string
#			reset
#			v
# xml.file	show->	xml.mem		->hash		->List
# $val[""]				[key,value]	[key]
#					foreach etc.
#
#		<- ok			<-close
#		X- cancel
 
$xml_watch= @' 
<table>
	<!-- status / nameは固定値 -->
	<val name= "mmlfile" param= ""/>
	<val name= "compiler" param= ""/>
	<val name= "player" param= ""/>
	<val name= "dmcdir" param= ""/>
	<val name= "editor" param= ""/>
	<val name= "dos" param= ""/>
	<br/>
	<opt name= "option" param= "opn"/>
	<opt name= "radio_bin" param= "nsd"/>
	<opt name= "chk_dos" param= "Unchecked"/>
	<opt name= "chk_stop" param= "Checked"/>
	<opt name= "chk_topmost" param= "False"/>
	<opt name= "chk_auto" param= "True"/>
	<br />
</table>
'@
 
# nsf_trans 
	 
function Player_stop(){ 


	if($opt["chk_stop"] -eq 'Checked'){

		& $val["player"] /stop
	}
} #func
 
function Mck_trans([string]$file){ 


	Player_stop

	Write-Host ''

	[string[]]$eor= "",""
	[string[]]$output= "",""

	# mml,bin,dmc
	$output= .\mkmck.ps1 $file $val["compiler"] $val["dmcdir"]

	sleep -m 60

	$csl_box.Text= $scroll_text+ $output[1]+ "`r`n"+ $output[2]

	$csl_box.SelectionStart= $csl_box.Text.Length
	$csl_box.ScrollToCaret()

	$script:scroll_text= $output[1]+ "`r`n"+ $output[2]+ "`r`n`r`n"


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

			& $val["player"] ('"'+ $dpn+ '.nsf"')
		}
	}
 } #func
 	
function Nsd_trans([string]$file){ 


	Player_stop # nsfplay2.4 errダイアログ出力

	Write-Host '' # 改行

	[string[]]$eor= "",""
	[string[]]$output= "",""

	# mml,bin,dmc
	$output= .\mknsd.ps1 $file $val["compiler"] $val["dmcdir"]

	sleep -m 60 # 異常時用ウェイト

	$csl_box.Text= $scroll_text+ $output[1]

	$csl_box.SelectionStart= $csl_box.Text.Length
	$csl_box.ScrollToCaret()

	$script:scroll_text= $output[1]+ "`r`n`r`n"


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
			& $val["player"] ('"'+ $dpn+ '.nsf"')
		}
	}
 } #func
 
function Pmd_trans([string]$file){ 


	# Player_stop # fmpmd /s -> ダイアログで止まる

	Write-Host ''

	[string[]]$eor= "",""
	[string[]]$output= "",""

	# mml,bin,dmc
	$output= .\mkpmd.ps1 $file $val["compiler"] $val["dmcdir"] $val["dos"] $opt["option"] $opt["chk_dos"]

	sleep -m 60

	$csl_box.Text= $scroll_text+ $output[1]

	$csl_box.SelectionStart= $csl_box.Text.Length
	$csl_box.ScrollToCaret()

	$script:scroll_text= $output[1]+ "`r`n`r`n"


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

			& $val["player"] ('"'+ $dpn+ '.m"')
		}
	}
 } #func
 
function Play_nsf([string]$file){ 

	Write-Host ''

	switch(Chk_path $file){

	2{	Write-Host ('ERROR: Null >> '+ $file);		break;
	}1{	Write-Host ('ERROR: Test-Path >> '+ $file);	break;
	}0{
		switch($opt["radio_bin"]){
		'mck'{
			Mck_trans $file;	break;
		}'nsd'{
			Nsd_trans $file;	break;
		}'pmd'{
			Pmd_trans $file
		}
		} #sw
	}
	} #sw
 } #func
 
function Watches_nsf([string]$eor){ 

	Write-Host ''
	Write-Host $eor

	$err_box.Text+= $eor # " last de `r`n"不要

	$err_box.SelectionStart= $err_box.Text.Length
	$err_box.ScrollToCaret()
 } #func
  
# chk_path 
	 
function Console_out([string[]]$ph){ 


	[int[]]$err= 0,0,0,0

	$err[0]= Chk_path $ph[0]
	$err[1]= Chk_path $ph[1]
	$err[2]= Chk_path $ph[2]
	$err[3]= Chk_path $ph[3]


	[array]$f= "","","",""
	[string[]]$f[0]= "","","",""
	[string[]]$f[1]= "","","",""
	[string[]]$f[2]= "","","",""
	[string[]]$f[3]= "","","",""


	[string[]]$rot= "","","",""

	switch($err[0]){
	2{	$rot[0]= '> mmlファイル 選択されてません';		break;
	}1{	$rot[0]= '> mmlファイル パス先がありません';		break;
	}0{	$rot[0]= '< mmlファイル'
		$f[0]= Split_path $ph[0]
	}
	} #sw
	switch($err[1]){
	2{	$rot[1]= '> binファイル 選択されてません';		break;
	}1{	$rot[1]= '> binファイル パス先がありません';		break;
	}0{	$rot[1]= '< binファイル'
		$f[1]= Split_path $ph[1]
	}
	} #sw
	switch($err[2]){
	2{	$rot[2]= '> Playerファイル 選択されてません';		break;
	}1{	$rot[2]= '> Playerファイル パス先がありません';		break;
	}0{	$rot[2]= '< Playerファイル'
		$f[2]= Split_path $ph[2]
	}
	} #sw
	switch($err[3]){
	2{	$rot[3]= '> Includeフォルダ 選択されてません';		break;
	}1{	$rot[3]= '> Includeフォルダ パス先がありません';	break;
	}0{	$rot[3]= '< Includeフォルダ'
		$f[3]= Split_path $ph[3]
	}
	} #sw

	Write-Host '' # 改行
	Write-Host $ph[4]
	Write-Host $ph[5]
	Write-Host ''
	Write-Host ($rot[0]+ "`r`n"+ $ph[0]) # full path
	Write-Host ($rot[1]+ "`r`n"+ $ph[1])
	Write-Host ($rot[2]+ "`r`n"+ $ph[2])
	Write-Host ($rot[3]+ "`r`n"+ $ph[3])
	Write-Host ''


	$csl_box.Lines= $ph[4],
			$ph[5],
			"",
			$rot[0],(" : "+ $f[0][0]), # file name
			$rot[1],(" : "+ $f[1][0]),
			$rot[2],(" : "+ $f[2][0]),
			$rot[3],(" : "+ $f[3][0])


	$script:scroll_text= $csl_box.Text

	return $err
} #func
 
function Status_cheker(){ 


	[string]$m= "" # 定義のみだと返値(echo)が出る、空値入れとく
	[string]$k= ""
	[string]$c= ""
	[string]$g= ""
	[array]$arr= 0,0,0,0


	switch($opt["radio_bin"]){

		'mck'{	$m= '"ppmck"' # esc["`""] -> ['"']
			break;

		}'nsd'{	$m= '"NSDlib"'
			break;

		}'pmd'{	$m= '"P.M.D"'
			$k= $opt["option"]
		}
	} #sw

	if($opt["chk_dos"] -eq 'Checked'){

		$g= " /x64対応"
	}

	if($opt["chk_stop"] -eq 'Checked'){

		$c= " /stopコマンド付き"
	}


	[string[]]$ss= ('[ '+ $m+ $k+'モード ]'),($g+ $c)


	[array]$yy=	$val["mmlfile"],$val["compiler"],$val["player"],$val["dmcdir"],
			$ss[0],$ss[1]

	$arr= Console_out $yy


	return $arr

} #func
 
function Wait_setpath([int[]]$r){ 


	[int]$stus= $r[0]+ $r[1]+ $r[2] # $r[3] cancel -> 000,200
	[int]$err= 1

	Write-Host ''

	switch($stus){
	0{
		[string[]]$f= Split_path $val["mmlfile"]

		switch($f[3]){
		'.mml'{
			$eor= ('.mmlの監視をセット<< '+ $f[0])
			$err= 0; break;

		}'.nsf'{
			$eor= ('.nsfの監視は不可です>> '+ $f[0])
			break;

		}'.m'{
			$eor= ('.mの監視は不可です>> '+ $f[0])
			break;

		}default{

			$eor= ('監視対象は、mmlファイルのみ>> '+ $f[0])
		}
		} #sw
		break;

	}default{ # 起動できない回避

		$eor= ('監視環境が不足 ERR Level>> '+ $stus)
	}
	} #sw


	Write-Host $eor
	$err_box.Text= $eor+ "`r`n"

	$frm.Text= "mml watch"


	switch($err){
	0{
		$wait.Path= $f[1]	# RaisingEvents= $True時、必要
		$wait.Filter= $f[0]

		return $True
		break;
	}1{
		# $wait.Path= $null  # Pathエラーになる
		$wait.Filter= $null

		return $False
	}
	} #sw


} #func
  
# gui 
	 
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
 
function Auto_start([string]$t){ 

	switch($t){
	'true'{
		$pic_box.Image= [System.Drawing.Image]::FromFile(".\img\orange.png")
		$menu_r.Text= "v 自動リスタート"
		break;
	}'false'{
		$pic_box.Image= [System.Drawing.Image]::FromFile(".\img\blue.png")
		$menu_r.Text= "自動リスタート"
	}
	} #sw

	return $t
 } #func
 
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

 if($num -eq 0){ # << $num= 0

	switch($c){

	'true'{
		$frm.Text= ("["+ $wait.Filter+ "] - mml watch")
		$wait_btn.Image= [System.Drawing.Image]::FromFile(".\img\stop.png")

		$wait.EnableRaisingEvents= $True # 開始
		Write-Host ('RaisingEvents: '+ $wait.EnableRaisingEvents)
		break;
	}'false'{
		$frm.Text= "Pause - mml watch"
		$wait_btn.Image= [System.Drawing.Image]::FromFile(".\img\play.png")

		$wait.EnableRaisingEvents= $False
		Write-Host ('RaisingEvents: '+ $wait.EnableRaisingEvents)
	}
	} #sw
 }

 Toggle_label # RaisingEvents check

 } #func
 
function Watch_Setting(){ 

	$frm.AllowDrop= $False

	Toggle_sw 1 "false"	# ファイル更新キャンセラー


	[array]$args_set= "",""
	$args_set= .\setting.ps1 $val $opt "all"


	$script:val= $args_set[0]
	$script:opt= $args_set[1]

	$script:chk_stus= Status_cheker
	$script:chk_mml= Wait_setpath $chk_stus


	if($chk_mml -eq $True){ # $wait_btn canceller

		Toggle_sw 1 "true"
	}

	# Watches_nsf $wait.Filter # Wait_setpath

	$frm.AllowDrop= $True

 } #func
 
function Watch_Start(){ 

	if($chk_mml -eq $True){

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

	}0{
		$script:val["mmlfile"]= $args_path[0]
	}
	} #sw

	Write-Host '' # 改行

	$script:chk_stus= Status_cheker

	$script:chk_mml= Wait_setpath $chk_stus


	if($chk_mml -eq $True){

		Toggle_sw 1 "true"
	}

	# Watches_nsf $wait.Filter # Wait_setpath
 } #func
  
# hash 
	 
function Wthxml_read($x){ 

  # $x= $script:wth_xml.table

  for([int]$i=5; $i -ge 0; $i--){


	if($x.val[$i].name -ne ''){

		$script:val[$x.val[$i].name]= $x.val[$i].param
	}

	if($x.opt[$i].name -ne ''){

		$script:opt[$x.opt[$i].name]= $x.opt[$i].param
	}
  } #
 } #func
 
function Wthwrite_xml($x){ 

  # $x= $script:wth_xml.table

  [array]$val_keys= $val.Keys
  [array]$opt_keys= $opt.Keys

  [int]$vl= $val_keys.Length
  [int]$ot= $opt_keys.Length

  if($vl -gt 6){ Write-Host ('ERROR: val hash >> '+ $vl) }
  if($ot -gt 6){ Write-Host ('ERROR: opt hash >> '+ $ot) }



  for([int]$i=5; $i -ge 0; $i--){

	if($i -lt $vl){

		$x.val[$i].name=  [string]$val_keys[$i] # $xmlは[string]キャスト必要
		$x.val[$i].param= [string]$val[$val_keys[$i]]
	}else{
		$x.val[$i].name=  "" # 空を打つ
		$x.val[$i].param= ""
	}

	if($i -lt $ot){

		$x.opt[$i].name=  [string]$opt_keys[$i]
		$x.opt[$i].param= [string]$opt[$opt_keys[$i]]
	}else{
		$x.opt[$i].name=  ""
		$x.opt[$i].param= ""
	}
  } #
 } #func
 
function Setxml_read($x){ 

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
#$err_box.ForeColor= "Gray"
$err_box.BackColor= "White"

 
$csl_box= New-Object System.Windows.Forms.TextBox 
$csl_box.Size= "220,145"
$csl_box.Location= "10,115"
$csl_box.WordWrap= "False"
$csl_box.Multiline= "True"
$csl_box.ScrollBars= "Both"
$csl_box.BorderStyle= "FixedSingle"
$csl_box.ReadOnly= "True"
#$csl_box.ForeColor= "Gray"
$csl_box.BackColor= "White"

 
$pic_box = New-Object System.Windows.Forms.PictureBox 
$pic_box.ClientSize= "11,11"
$pic_box.Location= "11,33"
# $pic_box.Image= [System.Drawing.Image]::FromFile(".\img\blue.png")
# $pic_box.Image= [System.Drawing.Image]::FromFile(".\img\orange.png")
 
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

	Watch_Start
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
 
$contxt_tray= New-Object System.Windows.Forms.ContextMenuStrip 
# $contxt objを読み込んだ後$NotifyIcon objが安全

[void]$contxt_tray.Items.Add("環境設定")
[void]$contxt_tray.Items.Add("終了")

$contxt_tray.Add_ItemClicked({

	switch([string]$_.ClickedItem){ # キャスト必要

	'環境設定'{
		Watch_Setting
		break;

	}'終了'{
		$frm.Close()
	}
	} #sw

	$this.Close()
})
 
$tray= New-Object System.Windows.Forms.NotifyIcon 
$tray.Icon= Icon_read "..\mml_watch.exe"
$tray.Visible= $True
#$tray.Text= "watches"
$tray.ContextMenuStrip= $contxt_tray

$tray.Add_MouseDown({

  switch([string]$_.Button){ # キャスト

  'Left'{
	switch($frm.WindowState){
	'Minimized'{
		$frm.WindowState= "Normal"
		break;

	}'Normal'{
		$frm.WindowState= "Minimized"

	}
	} #sw

#	break;
#  }'Right'{ # 不要 モーダル発生 -> $tray.ContextMenuStrip
#	$contxt_tray.Show([Windows.Forms.Cursor]::Position)
  }
  } #sw
 })
 
$frm= New-Object System.Windows.Forms.Form 
#$frm.Text= "mml watch"
$frm.Size= "244,302"
$frm.FormBorderStyle= "FixedSingle"
$frm.StartPosition= "WindowsDefaultLocation"
$frm.Icon= Icon_read "..\src\MW_icon.ico"
#$frm.ShowIcon= $False
#$frm.MinimizeBox= $False
$frm.MaximizeBox= $False

$frm.TopLevel= $True
# $frm.TopMost= $True # 最前面表示のプロパティ


#$frm.Add_Load({
#	$frm.WindowState= "Minimized" # 最小化 "Normal"
#})
#$frm.Add_KeyDown({
#	write-host $_.KeyCode # check
#})

$frm.Add_Shown({

	$wait_btn.Select()	# forcus
 })

$frm.Add_FormClosing({ # event nai dato err ha aku shizurai node kannsuuka
 try{

	Wthwrite_xml $script:wth_xml.table

	File_writer $script:wth_xml '.\mml_watch.xml'

 }catch{
	echo $_.exception
 }
})

$frm.Add_DragEnter({

	$_.Effect= "All"
 })

$frm.AllowDrop= $True

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

	[string]$retn= Editor_open $val["editor"] $val["mmlfile"]

	if($retn -ne ""){ $err_box.Text= $retn }
})

$menu_sd= New-Object System.Windows.Forms.ToolStripSeparator
$menu_d= New-Object System.Windows.Forms.ToolStripMenuItem
$menu_d.Text= "フォルダ"

$menu_d.Add_Click({

	[string]$retn= Folder_open 1 $val["mmlfile"]

	if($retn -ne ""){ $err_box.Text= $retn }
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

$menu_st= New-Object System.Windows.Forms.ToolStripSeparator
$menu_t=  New-Object System.Windows.Forms.ToolStripMenuItem
# $menu_t.Text= "v 最前面表示"

$menu_t.Add_Click({

	switch($opt["chk_topmost"]){ # トグル

	'True'{		$script:opt["chk_topmost"]= Top_most "False";	break;
	}'False'{	$script:opt["chk_topmost"]= Top_most "True"
	}
	} #sw
})

$menu_sr= New-Object System.Windows.Forms.ToolStripSeparator
$menu_r=  New-Object System.Windows.Forms.ToolStripMenuItem
# $menu_r.Text= "v 自動リスタート"

$menu_r.Add_Click({

	switch($opt["chk_auto"]){ # トグル

	'True'{		$script:opt["chk_auto"]= Auto_start "False";	break;
	}'False'{	$script:opt["chk_auto"]= Auto_start "True"
	}
	} #sw
})

  
$menu_f.DropDownItems.AddRange(@($menu_e,$menu_sd,$menu_d,$menu_sn,$menu_n)) 
$menu_o.DropDownItems.AddRange(@($menu_t,$menu_st,$menu_r,$menu_sr,$menu_a))
$mnu.Items.AddRange(@($menu_f,$menu_o))

$frm.Controls.AddRange(@($mnu,$pic_box,$wait_lbl,$wait_btn,$err_box,$csl_box))

$frm.AcceptButton= $wait_btn	# [Enter]
  
# FileSystemWatcher ------ 

$wait= New-Object System.IO.FileSystemWatcher
$wait.SynchronizingObject= $frm


# $wait.InternalBufferSize= 8192 # [4096-8192-65535]
# $wait.IncludeSubdirectories= $False


$wait.NotifyFilter= [IO.NotifyFilters]::LastWrite


$wait.Add_Changed({	# event func入れ子は一段が理想..

 try{
	$script:lated_time= (Get-Item $_.FullPath).LastWriteTime.ToString('yy/MM/dd HH:mm:ss')

	# [ $_ if ok. can't switch ]
	if($lated_time -ne $chk_time){ # 二重読込みの不備対策

		$script:chk_time= $lated_time


		# $_ | write-host  # [= FileSystemEventArgsクラス]

		Write-Host ('Updated: '+ $_.ChangeType)
		Write-Host ''

		Play_nsf $_.FullPath # $err_box.Text
		Watches_nsf ('< Watches: '+ $_.Name)

		# sleep -m 120	# ウェイト不要
	}

 }catch{
	echo $_.exception
    	Write-Host '"ERROR: Safety Stopper >> FileSystemWatcher"'
 }
})
 
# ------ main 

 try{

 # キャスト

 if((Test-Path '.\mml_watch.xml') -eq $True){

	$wth_xml= [xml](cat '.\mml_watch.xml')
 }else{
	$wth_xml= [xml]$xml_watch
 }


 # 連想配列化

 $val= @{}; $opt= @{};

 Wthxml_read $script:wth_xml.table



 # 状態チェック
 Top_most $opt["chk_topmost"] > $null # 最前面
 Auto_start $opt["chk_auto"] > $null # 自動スタート


 [array]$chk_stus= Status_cheker

 [string]$lated_time= ""
 [string]$chk_time= ""

 [bool]$chk_mml= Wait_setpath $chk_stus # $wait.Filter




 # $wait_btn canceller
 if($chk_mml -eq $True){

	Toggle_sw 0 "true"
 }else{
	Toggle_sw 0 "false"
 }

 [string]$scroll_text= "" # $csl_box


 $frm.ShowDialog() > $null

 # | Out-Null -> > $null # cancel標準出力抑制

 Write-Host ("`r`n"+"`"mml watch`"を終了します"+"`r`n")

 }catch{
	echo $_.exception
	Write-Host '"ERROR: Safety Stopper >> $frm.ShowDialog()"'

 }finally{
	$tray.Dispose() # 必要
	$wait.Dispose()
 }
 
