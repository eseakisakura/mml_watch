<# setting.ps1 #> 

Write-Host ('"環境設定"を起動します')
 
$setting_xml= @' 
<table>
	<!-- listbox / nameは変動値 -->
	<mml name= "" param= ""/>
	<mml name= "" param= ""/>
	<mml name= "" param= ""/>
	<mml name= "" param= ""/>
	<br />
	<mck name= "ppmckc.exe" param= "..\ppmck\bin\ppmckc.exe"/>
	<mck name= "" param= ""/>
	<mck name= "" param= ""/>
	<mck name= "" param= ""/>
	<br />
	<nsd name= "nsc.exe" param= "..\nsdlib\bin\nsc.exe"/>
	<nsd name= "" param= ""/>
	<nsd name= "" param= ""/>
	<nsd name= "" param= ""/>
	<br />
	<pmd name= "MC.EXE" param= "..\pmd\MC.EXE"/>
	<pmd name= "" param= ""/>
	<pmd name= "" param= ""/>
	<pmd name= "" param= ""/>
	<br />
	<ply name= "nsfplay.exe" param= "..\nsfplay\nsfplay.exe"/>
	<ply name= "winamp.exe" param= "..\winamp\winamp.exe"/>
	<ply name= "FMPMD.exe" param= "..\fmpmd\FMPMD.exe"/>
	<ply name= "MDPlayer.exe" param= "..\mdplayer\MDPlayer.exe"/>
	<ply name= "" param= ""/>
	<ply name= "" param= ""/>
	<ply name= "" param= ""/>
	<ply name= "" param= ""/>
	<br />
	<dmc name= "" param= ""/>
	<dmc name= "" param= ""/>
	<dmc name= "" param= ""/>
	<dmc name= "" param= ""/>
	<br />
	<edt name= "sted.exe" param= "..\sted\sted.exe"/>
	<edt name= "" param= ""/>
	<edt name= "" param= ""/>
	<edt name= "" param= ""/>
	<edt name= "" param= ""/>
	<edt name= "" param= ""/>
	<edt name= "" param= ""/>
	<edt name= "" param= ""/>
	<br />
	<dos name= "msdos.exe" param= "..\msdos\msdos.exe"/>
	<dos name= "" param= ""/>
	<dos name= "" param= ""/>
	<dos name= "" param= ""/>
</table>
'@
 
# hash 
	 
function Xml_read($x){ 

  # $x= $script:xml_set.table

  for([int]$i=7; $i -ge 0; $i--){


	if($x.ply[$i].name -ne ''){

		$script:ply[$x.ply[$i].name]= $x.ply[$i].param
	}
	if($x.edt[$i].name -ne ''){

		$script:edt[$x.edt[$i].name]= $x.edt[$i].param
	}

	if($i -le 3){

		if($x.mml[$i].name -ne ''){

			$script:mml[$x.mml[$i].name]= $x.mml[$i].param
		}

		if($x.mck[$i].name -ne ''){

			$script:mck[$x.mck[$i].name]= $x.mck[$i].param
		}
		if($x.nsd[$i].name -ne ''){

			$script:nsd[$x.nsd[$i].name]= $x.nsd[$i].param
		}
		if($x.pmd[$i].name -ne ''){

			$script:pmd[$x.pmd[$i].name]= $x.pmd[$i].param
		}

		if($x.dmc[$i].name -ne ''){

			$script:dmc[$x.dmc[$i].name]= $x.dmc[$i].param
		}
		if($x.dos[$i].name -ne ''){

			$script:dos[$x.dos[$i].name]= $x.dos[$i].param
		}
	}
  } #
 } #func
 
function Write_xml($x){ 

  # $x= $script:xml_set.table


  [array]$mck_keys= $mck.Keys # Keys.Count -> 配列
  [array]$nsd_keys= $nsd.Keys
  [array]$pmd_keys= $pmd.Keys

  [array]$mml_keys= $mml.Keys
  [array]$ply_keys= $ply.Keys
  [array]$dmc_keys= $dmc.Keys
  [array]$edt_keys= $edt.Keys
  [array]$dos_keys= $dos.Keys


  [int]$mk= $mck_keys.Length
  [int]$nd= $nsd_keys.Length
  [int]$pd= $pmd_keys.Length

  [int]$ml= $mml_keys.Length
  [int]$py= $ply_keys.Length
  [int]$dc= $dmc_keys.Length
  [int]$et= $edt_keys.Length
  [int]$ds= $dos_keys.Length


  if($py -gt 8){ Write-Host ('ERROR: ply hash >> '+ $py) }
  if($et -gt 8){ Write-Host ('ERROR: edt hash >> '+ $et) }

  if($mk -gt 4){ Write-Host ('ERROR: mck hash >> '+ $mk) }
  if($nd -gt 4){ Write-Host ('ERROR: nsd hash >> '+ $nd) }
  if($pd -gt 4){ Write-Host ('ERROR: pmd hash >> '+ $pd) }

  if($ml -gt 4){ Write-Host ('ERROR: mml hash >> '+ $ml) }
  if($dc -gt 4){ Write-Host ('ERROR: dmc hash >> '+ $dc) }
  if($ds -gt 4){ Write-Host ('ERROR: dos hash >> '+ $ds) }


  for([int]$i=7; $i -ge 0; $i--){


	if($i -lt $py){

		$x.ply[$i].name=  [string]$ply_keys[$i]
		$x.ply[$i].param= [string]$ply[$ply_keys[$i]]
	}else{
		$x.ply[$i].name=  ""
		$x.ply[$i].param= ""
	}
	if($i -lt $et){

		$x.edt[$i].name=  [string]$edt_keys[$i]
		$x.edt[$i].param= [string]$edt[$edt_keys[$i]]
	}else{
		$x.edt[$i].name=  ""
		$x.edt[$i].param= ""
	}

	if($i -le 3){

		if($i -lt $ml){ # - lt [0-3]

			$x.mml[$i].name=  [string]$mml_keys[$i]
			$x.mml[$i].param= [string]$mml[$mml_keys[$i]]
		}else{
			$x.mml[$i].name=  ""
			$x.mml[$i].param= ""
		}

		if($i -lt $mk){

			$x.mck[$i].name=  [string]$mck_keys[$i]
			$x.mck[$i].param= [string]$mck[$mck_keys[$i]]
		}else{
			$x.mck[$i].name=  ""
			$x.mck[$i].param= ""
		}
		if($i -lt $nd){

			$x.nsd[$i].name=  [string]$nsd_keys[$i]
			$x.nsd[$i].param= [string]$nsd[$nsd_keys[$i]]
		}else{
			$x.nsd[$i].name=  ""
			$x.nsd[$i].param= ""
		}
		if($i -lt $pd){

			$x.pmd[$i].name=  [string]$pmd_keys[$i]
			$x.pmd[$i].param= [string]$pmd[$pmd_keys[$i]]
		}else{
			$x.pmd[$i].name=  ""
			$x.pmd[$i].param= ""
		}

		if($i -lt $dc){

			$x.dmc[$i].name=  [string]$dmc_keys[$i]
			$x.dmc[$i].param= [string]$dmc[$dmc_keys[$i]]
		}else{
			$x.dmc[$i].name=  ""
			$x.dmc[$i].param= ""
		}
		if($i -lt $ds){

			$x.dos[$i].name=  [string]$dos_keys[$i]
			$x.dos[$i].param= [string]$dos[$dos_keys[$i]]
		}else{
			$x.dos[$i].name=  ""
			$x.dos[$i].param= ""
		}
	}
  } #
 } #func
 
function Pamamter_reset([string]$sw){ 

  switch($sw){
  'mck'{
	[string]$t= "10000 00000"
			#i m1 w

	[string]$s= $t.Replace(" ","")

	[string[]]$m= $s.ToCharArray()

	$env_chk_mck.CheckState= $m[0]
	$lang_chk_mck.CheckState= $m[1]
	$warn_chk_mck.CheckState= $m[2]
	break;
  }'nsd'{
	[string]$t= "01200 11000"
		#a n v1 x od+ oo- os- e s

	[string]$s= $t.Replace(" ","")

	[string[]]$n= $s.ToCharArray()

	[int[]]$v= 0,0,1

	$asm_chk_nsd.CheckState= $n[0]
	$nsf_chk_nsd.CheckState= $n[1]
	$comb_ver_nsd.SelectedIndex= $v[$n[2]]
	$nsfe_chk_nsd.CheckState= $n[3]

	$bank_chk_nsd.CheckState= $n[4]
	$env_chk_nsd.CheckState= $n[5]
	$sqr_chk_nsd.CheckState= $n[6]
	$err_chk_nsd.CheckState= $n[7]
	$find_chk_nsd.CheckState= $n[8]
	break;
  }'pmd'{
	[string]$t= "01000 00000"
			#NLMT V C

	[string]$s= $t.Replace(" ","")

	[string[]]$p= $s.ToCharArray()

	switch($p[0]){
	'0'{	$radio_opn.Checked= "True"; break;
	}'1'{	$radio_opl.Checked= "True"; break;
	}'2'{	$radio_opm.Checked= "True"; break;
	}'3'{	$radio_towns.Checked= "True"
	}
	} #sw

	$add_chk_pmd.CheckState= $p[1]
	$part_chk_pmd.CheckState= $p[2]
  }
  } #sw

} #func
 
function Pamamter_read([string]$t){ 


	[string]$s= $t.Replace(" ","")

	[array]$rr= $s -split ","

	[string[]]$m= $rr[0].ToCharArray()
	[string[]]$n= $rr[1].ToCharArray()
	[string[]]$p= $rr[2].ToCharArray()


	$env_chk_mck.CheckState= $m[0]
	$lang_chk_mck.CheckState= $m[1]
	$warn_chk_mck.CheckState= $m[2]

	[int[]]$v= 0,0,1

	$asm_chk_nsd.CheckState= $n[0]
	$nsf_chk_nsd.CheckState= $n[1]
	$comb_ver_nsd.SelectedIndex= $v[$n[2]]
	$nsfe_chk_nsd.CheckState= $n[3]

	$bank_chk_nsd.CheckState= $n[4]
	$env_chk_nsd.CheckState= $n[5]
	$sqr_chk_nsd.CheckState= $n[6]
	$err_chk_nsd.CheckState= $n[7]
	$find_chk_nsd.CheckState= $n[8]


	switch($p[0]){
	'0'{	$radio_opn.Checked= "True"; break;
	}'1'{	$radio_opl.Checked= "True"; break;
	}'2'{	$radio_opm.Checked= "True"; break;
	}'3'{	$radio_towns.Checked= "True"
	}
	} #sw

	$add_chk_pmd.CheckState= $p[1]
	$part_chk_pmd.CheckState= $p[2]

} #func
 
function Pamamter_write(){ 

	[array]$a= "","",""
	[int[]]$a[0]= 0,0,0,0,0, 0,0,0,0,0
	[int[]]$a[1]= 0,0,0,0,0, 0,0,0,0,0
	[int[]]$a[2]= 0,0,0,0,0, 0,0,0,0,0


	$a[0][0]= $env_chk_mck.CheckState
	$a[0][1]= $lang_chk_mck.CheckState
	$a[0][2]= $warn_chk_mck.CheckState


	[int[]]$v= 1,2

	$a[1][0]= $asm_chk_nsd.CheckState
	$a[1][1]= $nsf_chk_nsd.CheckState
	$a[1][2]= $v[$comb_ver_nsd.SelectedIndex]
	$a[1][3]= $nsfe_chk_nsd.CheckState

	$a[1][4]= $bank_chk_nsd.CheckState
	$a[1][5]= $env_chk_nsd.CheckState
	$a[1][6]= $sqr_chk_nsd.CheckState
	$a[1][7]= $err_chk_nsd.CheckState
	$a[1][8]= $find_chk_nsd.CheckState


	if($radio_opn.Checked -eq "True"){ $a[2][0]= 0
	}elseif($radio_opl.Checked -eq "True"){ $a[2][0]= 1
	}elseif($radio_opm.Checked -eq "True"){ $a[2][0]= 2
	}elseif($radio_towns.Checked -eq "True"){ $a[2][0]= 3
	}

	$a[2][1]= $add_chk_pmd.CheckState
	$a[2][2]= $part_chk_pmd.CheckState


	[string[]]$ss= "","",""

	$ss[0]= $a[0] -join ""
	$ss[1]= $a[1] -join ""
	$ss[2]= $a[2] -join ""

	[int]$a= 0 # [ref] tame

	$ss[0]= $ss[0].Insert(5," ")
	$ss[1]= $ss[1].Insert(5," ")
	$ss[2]= $ss[2].Insert(5," ")

	[string]$tt= $ss -join ", "


	#output checker
	[string]$g= ""
	$g= [System.Text.RegularExpressions.Regex]::Matches($tt,"[^0-9,\s]")

	if($g -ne ""){ Write-Host "Pamamter_write: option number check ERR" }

	return $tt
} #func
 
function Hash_read(){ 


	Pamamter_read $opts["option"]

	$stop_chk.CheckState= $opts["chk_stop"]
	$dos_chk.CheckState= $opts["chk_dos"]


	$listbox_mml.Items.Clear() # reset 2重読込対策
	$listbox_mck.Items.Clear()
	$listbox_nsd.Items.Clear()
	$listbox_pmd.Items.Clear()
	$listbox_ply.Items.Clear()
	$listbox_dmc.Items.Clear()
	$listbox_edt.Items.Clear()
	$listbox_dos.Items.Clear()

	[void]$listbox_mml.Items.AddRange(@($mml.Keys)) # .Addが 戻値あるメソッドため
	[void]$listbox_mck.Items.AddRange(@($mck.Keys))
	[void]$listbox_nsd.Items.AddRange(@($nsd.Keys))
	[void]$listbox_pmd.Items.AddRange(@($pmd.Keys))
	[void]$listbox_ply.Items.AddRange(@($ply.Keys))
	[void]$listbox_dmc.Items.AddRange(@($dmc.Keys))
	[void]$listbox_edt.Items.AddRange(@($edt.Keys))
	[void]$listbox_dos.Items.AddRange(@($dos.Keys))


	$listbox_mck.Hide()
	$listbox_nsd.Hide()
	$listbox_pmd.Hide()


	[string]$key= ""

	switch($opts["radio_bin"]){

	'mck'{
		$pram_tab.SelectedIndex= 0
		$radio_mck.Checked= "True"
		$listbox_mck.Show()
		break;
	}'nsd'{
		$pram_tab.SelectedIndex= 1
		$radio_nsd.Checked= "True"
		$listbox_nsd.Show()
		break;
	}'pmd'{
		$pram_tab.SelectedIndex= 3
		$radio_pmd.Checked= "True"
		$listbox_pmd.Show()
	}
	} #sw


	foreach($key in $mml.Keys){ # あればハイライト表示
		if($mml[$key] -eq $vals["mmlfile"]){ $listbox_mml.SelectedItem= $key }
	} #

	foreach($key in $mck.Keys){
		if($mck[$key] -eq $vals["mck"]){ $listbox_mck.SelectedItem= $key }
	} #
	foreach($key in $nsd.Keys){
		if($nsd[$key] -eq $vals["nsd"]){ $listbox_nsd.SelectedItem= $key }
	} #
	foreach($key in $pmd.Keys){
		if($pmd[$key] -eq $vals["pmd"]){ $listbox_pmd.SelectedItem= $key }
	} #

	foreach($key in $ply.Keys){
		if($ply[$key] -eq $vals["player"]){ $listbox_ply.SelectedItem= $key }
	} #
	foreach($key in $dmc.Keys){
		if($dmc[$key] -eq $vals["dmcdir"]){ $listbox_dmc.SelectedItem= $key }
	} #
	foreach($key in $edt.Keys){
		if($edt[$key] -eq $vals["editor"]){ $listbox_edt.SelectedItem= $key }
	} #
	foreach($key in $dos.Keys){
		if($dos[$key] -eq $vals["dos"]){ $listbox_dos.SelectedItem= $key }
	} #
} #func
 
function Write_hash(){ 

	$script:opts["option"]= Pamamter_write

	$script:opts["chk_stop"]= [string]$stop_chk.CheckState
	$script:opts["chk_dos"]= [string]$dos_chk.CheckState


	## if([string]$radio_mck.Checked -eq 'True'){	# 戻りのradio_bin不要

		## $script:opts["radio_bin"]= "mck"
		## $script:vals["compiler"]= $vals["mck"]

	## }elseif([string]$radio_nsd.Checked -eq 'True'){

		## $script:opts["radio_bin"]= "nsd"
		## $script:vals["compiler"]= $vals["nsd"]

	## }elseif([string]$radio_pmd.Checked -eq 'True'){

		## $script:opts["radio_bin"]= "pmd"
		## $script:vals["compiler"]= $vals["pmd"]
	## }


	switch($mck.Count){
	0{	$script:vals["mck"]= ""; break;
	}1{	$script:vals["mck"]= $mck.Values; break;
	}default{	$script:vals["mck"]= $mck[[string]$listbox_mck.SelectedItem] # [string]キャスト必要
	}
	} #sw

	switch($nsd.Count){
	0{	$script:vals["nsd"]= ""; break;
	}1{	$script:vals["nsd"]= $nsd.Values; break;
	}default{	$script:vals["nsd"]= $nsd[[string]$listbox_nsd.SelectedItem]
	}
	} #sw

	switch($pmd.Count){
	0{	$script:vals["pmd"]= ""; break;
	}1{	$script:vals["pmd"]= $pmd.Values; break;
	}default{	$script:vals["pmd"]= $pmd[[string]$listbox_pmd.SelectedItem]
	}
	} #sw

	switch($mml.Count){
	0{	$script:vals["mmlfile"]= ""; break;
	}1{	$script:vals["mmlfile"]= $mml.Values;	break;
	}default{	$script:vals["mmlfile"]= $mml[[string]$listbox_mml.SelectedItem]
	}
	} #sw

	switch($ply.Count){
	0{	$script:vals["player"]= ""; break;
	}1{	$script:vals["player"]= $ply.Values; break;
	}default{	$script:vals["player"]= $ply[[string]$listbox_ply.SelectedItem]
	}
	} #sw

	switch($dmc.Count){
	0{	$script:vals["dmcdir"]= ""; break;
	}1{	$script:vals["dmcdir"]= $dmc.Values; break;
	}default{	$script:vals["dmcdir"]= $dmc[[string]$listbox_dmc.SelectedItem]
	}
	} #sw

	switch($edt.Count){
	0{	$script:vals["editor"]= ""; break;
	}1{	$script:vals["editor"]= $edt.Values; break;
	}default{	$script:vals["editor"]= $edt[[string]$listbox_edt.SelectedItem]
	}
	} #sw

	switch($dos.Count){
	0{	$script:vals["dos"]= ""; break;
	}1{	$script:vals["dos"]= $dos.Values; break;
	}default{	$script:vals["dos"]= $dos[[string]$listbox_dos.SelectedItem]
	}
	} #sw
 } #func
 
function Hash_read_cut(){ 

	$sub_menu_opt.Enabled= $False # Command Line Option
	$stop_chk.CheckState= "Unchecked"
	$stop_chk.Enabled= $False

	$dos_chk.CheckState= $opts["chk_dos"]

	$listbox_mck.Items.Clear() # reset 2重読込対策
	$listbox_nsd.Items.Clear()
	$listbox_pmd.Items.Clear()
	$listbox_ply.Items.Clear()
	$listbox_edt.Items.Clear()
	$listbox_dos.Items.Clear()

	[void]$listbox_mck.Items.AddRange(@($mck.Keys)) # .Addが 戻値あるメソッドため
	[void]$listbox_nsd.Items.AddRange(@($nsd.Keys))
	[void]$listbox_pmd.Items.AddRange(@($pmd.Keys))
	[void]$listbox_ply.Items.AddRange(@($ply.Keys))
	[void]$listbox_edt.Items.AddRange(@($edt.Keys))
	[void]$listbox_dos.Items.AddRange(@($dos.Keys))


	$listbox_mck.Hide()
	$listbox_nsd.Hide()
	$listbox_pmd.Hide()

	switch($opts["radio_bin"]){
	'mck'{
		$radio_mck.Checked= "True"
		$listbox_mck.Show()
		break;
	}'nsd'{
		$radio_nsd.Checked= "True"
		$listbox_nsd.Show()
		break;
	}'pmd'{
		$radio_pmd.Checked= "True"
		$listbox_pmd.Show()
	}
	} #sw


	[string]$key= ""
	foreach($key in $mck.Keys){

		if($mck[$key] -eq $vals["mck"]){ $listbox_mck.SelectedItem= $key }
	} #
	foreach($key in $nsd.Keys){

		if($nsd[$key] -eq $vals["nsd"]){ $listbox_nsd.SelectedItem= $key }
	} #
	foreach($key in $pmd.Keys){

		if($pmd[$key] -eq $vals["pmd"]){ $listbox_pmd.SelectedItem= $key }
	} #

	foreach($key in $ply.Keys){

		if($ply[$key] -eq $vals["player"]){ $listbox_ply.SelectedItem= $key }
	} #
	foreach($key in $edt.Keys){

		if($edt[$key] -eq $vals["editor"]){ $listbox_edt.SelectedItem= $key }
	} #
	foreach($key in $dos.Keys){

		if($dos[$key] -eq $vals["dos"]){ $listbox_dos.SelectedItem= $key }
	} #
 } #func
 
function Write_hash_cut(){ 


	$script:opts["chk_dos"]= [string]$dos_chk.CheckState

	## if([string]$radio_mck.Checked -eq 'True'){	# 戻りのradio_bin不要

		## $script:opts["radio_bin"]= "mck"
		## $script:vals["compiler"]= $vals["mck"]

	## }elseif([string]$radio_nsd.Checked -eq 'True'){

		## $script:opts["radio_bin"]= "nsd"
		## $script:vals["compiler"]= $vals["nsd"]

	## }elseif([string]$radio_pmd.Checked -eq 'True'){

		## $script:opts["radio_bin"]= "pmd"
		## $script:vals["compiler"]= $vals["pmd"]
	## }


	switch($mck.Count){
	0{	$script:vals["mck"]= ""; break;
	}1{	$script:vals["mck"]= $mck.Values; break;
	}default{	$script:vals["mck"]= $mck[[string]$listbox_mck.SelectedItem] # [string]キャスト必要
	}
	} #sw

	switch($nsd.Count){
	0{	$script:vals["nsd"]= ""; break;
	}1{	$script:vals["nsd"]= $nsd.Values; break;
	}default{	$script:vals["nsd"]= $nsd[[string]$listbox_nsd.SelectedItem]
	}
	} #sw

	switch($pmd.Count){
	0{	$script:vals["pmd"]= ""; break;
	}1{	$script:vals["pmd"]= $pmd.Values; break;
	}default{	$script:vals["pmd"]= $pmd[[string]$listbox_pmd.SelectedItem]
	}
	} #sw

	switch($ply.Count){
	0{	$script:vals["player"]= ""; break;
	}1{	$script:vals["player"]= $ply.Values; break;
	}default{	$script:vals["player"]= $ply[[string]$listbox_ply.SelectedItem]
	}
	} #sw

	switch($edt.Count){
	0{	$script:vals["editor"]= ""; break;
	}1{	$script:vals["editor"]= $edt.Values; break;
	}default{	$script:vals["editor"]= $edt[[string]$listbox_edt.SelectedItem]
	}
	} #sw

	switch($dos.Count){
	0{	$script:vals["dos"]= ""; break;
	}1{	$script:vals["dos"]= $dos.Values; break;
	}default{	$script:vals["dos"]= $dos[[string]$listbox_dos.SelectedItem]
	}
	} #sw
 } #func
  
function Attend(){ 

	[string]$ret= [Windows.Forms.MessageBox]::Show(

		"環境設定をリセットします", "確認", "OKCancel","Information","Button2"
	)

	return $ret
 } #func
 
function Drag_drop([string]$sw,[array]$drp){ 

 [string]$s= ""
 foreach($s in $drp){

	switch(Chk_path $s){

	2{	Write-Host ('ERROR: Null > '+ $sw)
		break;

	}1{	Write-Host ('ERROR: Chk_path > '+ $sw)
		break;

	}0{	[string[]]$f= Split_path $s

		[string]$key= ""
		[int]$chk= 0

		switch($sw){

		'mml'{
			[string[]]$arr= $mml.Keys
			#($key in $mml.Keys)だと、mml.Values書き換えるとループが止まるため

			foreach($key in $arr){

				if($key -eq $f[0]){ # あらば差替え

					if($mml[$key] -ne $s){ # たがえばhash値差替え

				 		$script:mml[$key]= $s # Values
					}

					$listbox_mml.SelectedItem= $key
					$chk= 1
				}
			} #

			if($chk -eq 0){ # なければハッシュ追加

				if(($mml.Count+1) -le 4){

				 	$script:mml[$f[0]]= $s
					[void]$listbox_mml.Items.Add($f[0]) # ファイル追加

					$listbox_mml.SelectedItem= $f[0]
				}else{

					Write-Host 'mml Slot CountOver'
				}
			}

			break;

		}'mck'{
			[string[]]$arr= $mck.Keys

			foreach($key in $arr){

				if($key -eq $f[0]){

					if($mck[$key] -ne $s){

				 		$script:mck[$key]= $s
					}

					$listbox_mck.SelectedItem= $key
					$chk= 1
				}
			} #

			if($chk -eq 0){

				if(($mck.Count+1) -le 4){

				 	$script:mck[$f[0]]= $s
					[void]$listbox_mck.Items.Add($f[0])

					$listbox_mck.SelectedItem= $f[0]
				}else{

					Write-Host 'mck Slot CountOver'
				}
			}

			break;

		}'nsd'{
			[string[]]$arr= $nsd.Keys

			foreach($key in $arr){

				if($key -eq $f[0]){

					if($nsd[$key] -ne $s){

				 		$script:nsd[$key]= $s
					}

					$listbox_nsd.SelectedItem= $key
					$chk= 1
				}
			} #

			if($chk -eq 0){

				if(($nsd.Count+1) -le 4){

				 	$script:nsd[$f[0]]= $s
					[void]$listbox_nsd.Items.Add($f[0])

					$listbox_nsd.SelectedItem= $f[0]
				}else{

					Write-Host 'nsd Slot CountOver'
				}
			}

			break;

		}'pmd'{
			[string[]]$arr= $pmd.Keys

			foreach($key in $arr){

				if($key -eq $f[0]){

					if($pmd[$key] -ne $s){

				 		$script:pmd[$key]= $s
					}

					$listbox_pmd.SelectedItem= $key
					$chk= 1
				}
			} #

			if($chk -eq 0){

				if(($pmd.Count+1) -le 4){

				 	$script:pmd[$f[0]]= $s
					[void]$listbox_pmd.Items.Add($f[0])

					$listbox_pmd.SelectedItem= $f[0]
				}else{

					Write-Host 'pmd Slot CountOver'
				}
			}

			break;

		}'ply'{
			[string[]]$arr= $ply.Keys

			foreach($key in $arr){

				if($key -eq $f[0]){

					if($ply[$key] -ne $s){

				 		$script:ply[$key]= $s
					}

					$listbox_ply.SelectedItem= $key
					$chk= 1
				}
			} #

			if($chk -eq 0){

				if(($ply.Count+1) -le 8){

				 	$script:ply[$f[0]]= $s
					[void]$listbox_ply.Items.Add($f[0])

					$listbox_ply.SelectedItem= $f[0]
				}else{

					Write-Host 'ply Slot CountOver'
				}
			}

			break;

		}'dmc'{
			[string[]]$arr= $dmc.Keys

			foreach($key in $arr){

				if($key -eq $f[0]){

					if($dmc[$key] -ne $s){

				 		$script:dmc[$key]= $s
					}

					$listbox_dmc.SelectedItem= $key
					$chk= 1
				}
			} #

			if($chk -eq 0){

				if(($dmc.Count+1) -le 4){

				 	$script:dmc[$f[0]]= $s
					[void]$listbox_dmc.Items.Add($f[0])

					$listbox_dmc.SelectedItem= $f[0]
				}else{

					Write-Host 'dmc Slot CountOver'
				}
			}

			break;

		}'edt'{
			[string[]]$arr= $edt.Keys

			foreach($key in $arr){

				if($key -eq $f[0]){

					if($edt[$key] -ne $s){

				 		$script:edt[$key]= $s
					}

					$listbox_edt.SelectedItem= $key
					$chk= 1
				}
			} #

			if($chk -eq 0){

				if(($edt.Count+1) -le 8){

				 	$script:edt[$f[0]]= $s
					[void]$listbox_edt.Items.Add($f[0])

					$listbox_edt.SelectedItem= $f[0]
				}else{

					Write-Host 'edt Slot CountOver'
				}
			}

			break;

		}'dos'{
			[string[]]$arr= $dos.Keys

			foreach($key in $arr){

				if($key -eq $f[0]){

					if($dos[$key] -ne $s){

				 		$script:dos[$key]= $s
					}

					$listbox_dos.SelectedItem= $key
					$chk= 1
				}
			} #

			if($chk -eq 0){

				if(($dos.Count+1) -le 4){

				 	$script:dos[$f[0]]= $s
					[void]$listbox_dos.Items.Add($f[0])

					$listbox_dos.SelectedItem= $f[0]
				}else{

					Write-Host 'dos Slot CountOver'
				}
			}
		}
		} #sw
	}
	} #sw
 } #

} #func
 
<# 
	 
function Box_radio([string]$ss){ 

	[string]$tt=　"nsd" # radio's list初期値入れる

	if($ss -ne ""){

		if($ss -eq $vals["nsd"]){		$tt= "nsd"
		}elseif($ss -eq $vals["mck"]){	$tt= "mck"
		}elseif($ss -eq $vals["pmd"]){	$tt= "pmd"
		}
	}
	return $tt
 } #func
 
#> 
  
Add-Type -AssemblyName System.Windows.Forms > $null 

$ErrorActionPreference= "Stop"

cd (Split-Path -Parent $MyInvocation.MyCommand.Path)
[Environment]::CurrentDirectory= pwd # working_dir set
 
# Sub pram forms ----- 
	
$pram_frm= New-Object System.Windows.Forms.Form 
$pram_frm.Text= "Option"
$pram_frm.Size= "268,362"
$pram_frm.Location= "500,0"

$pram_frm.FormBorderStyle= "FixedSingle"
$pram_frm.StartPosition= "WindowsDefaultLocation"
$pram_frm.Icon= Icon_read "..\src\ST_icon.ico"
# $pram_frm.MinimizeBox= $False
$pram_frm.MaximizeBox= $False

$pram_frm.TopLevel= $True
$pram_frm.Owner= $sub_f

$pram_frm.Add_FormClosing({
 try{

	$sub_menu_opt.Text= "Command Option"

	if($_.CloseReason -eq 'UserClosing'){ # x ボタンの場合
 	}

	$_.Cancel= $True # Hide -> 再度 Showのため
	# EventArgs -> $_.(c# dato e.)

	$this.Hide() #.Visible= $false

 }catch{
	echo $_.exception
 }
})
 
$pram_tab= New-Object System.Windows.Forms.TabControl 
$pram_tab.Size= "245,255"
$pram_tab.Location= "5,25"
#$pram_tab.SelectedIndex= 0

$tab_mck= New-Object System.Windows.Forms.TabPage
$tab_mck.Text= "mck"

$tab_nsd= New-Object System.Windows.Forms.TabPage
$tab_nsd.Text= "nsd1"

$tab_nsd2= New-Object System.Windows.Forms.TabPage
$tab_nsd2.Text= "nsd2"

$tab_pmd= New-Object System.Windows.Forms.TabPage
$tab_pmd.Text= "pmd"
 
$grp_mck= New-Object System.Windows.Forms.GroupBox 
$grp_mck.Text= "Command Line Option"
$grp_mck.Size= "225,140"
$grp_mck.Location= "5,5"
$grp_mck.FlatStyle= "Flat"

$grp_nsd= New-Object System.Windows.Forms.GroupBox
$grp_nsd.Text= "Command Line Option"
$grp_nsd.Size= "225,140"
$grp_nsd.Location= "5,5"
$grp_nsd.FlatStyle= "Flat"

$grp_nsd2= New-Object System.Windows.Forms.GroupBox
$grp_nsd2.Text= "Command Line Option"
$grp_nsd2.Size= "225,140"
$grp_nsd2.Location= "5,5"
$grp_nsd2.FlatStyle= "Flat"

$grp_radio_pmd= New-Object System.Windows.Forms.GroupBox
$grp_radio_pmd.Text= "opn,opl,opm,towns"
$grp_radio_pmd.Size= "225,100"
$grp_radio_pmd.Location= "5,5"

$grp_pmd= New-Object System.Windows.Forms.GroupBox
$grp_pmd.Text= "Command Line Option"
$grp_pmd.Size= "225,100"
$grp_pmd.Location= "5,110"
$grp_pmd.FlatStyle= "Flat"
 
$radio_opn= New-Object System.Windows.Forms.RadioButton 
$radio_opn.Text= "OPN" # /N
$radio_opn.Size= "65,20"
$radio_opn.Location= "20,25"

$radio_opl= New-Object System.Windows.Forms.RadioButton
$radio_opl.Text= "OPL" # /L
$radio_opl.Size= "65,20"
$radio_opl.Location= "20,55"

$radio_opm= New-Object System.Windows.Forms.RadioButton
$radio_opm.Text= "OPM" # /M
$radio_opm.Size= "65,20"
$radio_opm.Location= "115,25"

$radio_towns= New-Object System.Windows.Forms.RadioButton
$radio_towns.Text= "TOWNS" # /T
$radio_towns.Size= "65,20"
$radio_towns.Location= "115,55"
 
$add_chk_pmd= New-Object System.Windows.Forms.CheckBox 
$add_chk_pmd.Text= "/V : mへFM音色データ添付"
$add_chk_pmd.Size= "210,20"
$add_chk_pmd.Location= "10,20"

$part_chk_pmd= New-Object System.Windows.Forms.CheckBox
$part_chk_pmd.Text= "/C : パート毎の長さを表示"
$part_chk_pmd.Size= "210,20"
$part_chk_pmd.Location= "10,40"
 
$bank_chk_nsd= New-Object System.Windows.Forms.CheckBox 
$bank_chk_nsd.Text= "-od : バンク最適化[def.chkoff]"
$bank_chk_nsd.Size= "210,20"
$bank_chk_nsd.Location= "10,20"

$env_chk_nsd= New-Object System.Windows.Forms.CheckBox
$env_chk_nsd.Text= "-oo : 未使用Sub,Envの削除"
$env_chk_nsd.Size= "210,20"
$env_chk_nsd.Location= "10,40"

$sqr_chk_nsd= New-Object System.Windows.Forms.CheckBox
$sqr_chk_nsd.Text= "-os : SqrDataの最適化"
$sqr_chk_nsd.Size= "210,20"
$sqr_chk_nsd.Location= "10,60"

$err_chk_nsd= New-Object System.Windows.Forms.CheckBox
$err_chk_nsd.Text= "-e : err/warningをエラー出力へ"
$err_chk_nsd.Size= "210,20"
$err_chk_nsd.Location= "10,80"

$find_chk_nsd= New-Object System.Windows.Forms.CheckBox
$find_chk_nsd.Text= "-s : 検索パスの検索結果を出力"
$find_chk_nsd.Size= "210,20"
$find_chk_nsd.Location= "10,100"
 
$asm_chk_nsd= New-Object System.Windows.Forms.CheckBox 
$asm_chk_nsd.Text= "-a : アセンブリへ変換"
$asm_chk_nsd.Size= "210,20"
$asm_chk_nsd.Location= "10,20"

$nsf_chk_nsd= New-Object System.Windows.Forms.CheckBox
$nsf_chk_nsd.Text= "-n : NSFへ変換"
$nsf_chk_nsd.Size= "210,20"
$nsf_chk_nsd.Location= "10,40"

$label_ver_nsd= New-Object System.Windows.Forms.Label
$label_ver_nsd.Text= "-v : NSF version"
$label_ver_nsd.Size= "140,20"
$label_ver_nsd.Location= "65,65"
$label_ver_nsd.TextAlign= "BottomLeft"

$comb_ver_nsd= New-Object System.Windows.Forms.Combobox
$comb_ver_nsd.Size= "50,20"
$comb_ver_nsd.Location= "10,65"
$comb_ver_nsd.FlatStyle= "Popup"
[void]$comb_ver_nsd.Items.AddRange(@('1','2'))
$comb_ver_nsd.DropDownStyle= "DropDownList"
$comb_ver_nsd.SelectedIndex= 1

$nsfe_chk_nsd= New-Object System.Windows.Forms.CheckBox
$nsfe_chk_nsd.Text= "-x : NSFeへ変換"
$nsfe_chk_nsd.Size= "210,20"
$nsfe_chk_nsd.Location= "10,90"
 
$env_chk_mck= New-Object System.Windows.Forms.CheckBox 
$env_chk_mck.Text= '-i : "effect.h"にSqrDataを追加'
$env_chk_mck.Size= "210,20"
$env_chk_mck.Location= "10,20"

$lang_chk_mck= New-Object System.Windows.Forms.CheckBox
$lang_chk_mck.Text= "-m : English Language"
$lang_chk_mck.Size= "210,20"
$lang_chk_mck.Location= "10,40"

$warn_chk_mck= New-Object System.Windows.Forms.CheckBox
$warn_chk_mck.Text= "-w : Warningを表示しない"
$warn_chk_mck.Size= "210,20"
$warn_chk_mck.Location= "10,60"
 
$pram_mnu= New-Object System.Windows.Forms.MenuStrip 
	
$parm_menu_f= New-Object System.Windows.Forms.ToolStripMenuItem 
$parm_menu_f.Text= "File"

$parm_menu_mck= New-Object System.Windows.Forms.ToolStripMenuItem
$parm_menu_mck.Text= "MCK option reset"

$parm_menu_mck.Add_Click({
 try{
	Pamamter_reset "mck"
 }catch{
	echo $_.exception
 }
})

$parm_menu_nsd= New-Object System.Windows.Forms.ToolStripMenuItem
$parm_menu_nsd.Text= "NSD option reset"

$parm_menu_nsd.Add_Click({
 try{
	Pamamter_reset "nsd"
 }catch{
	echo $_.exception
 }
})

$parm_menu_pmd= New-Object System.Windows.Forms.ToolStripMenuItem
$parm_menu_pmd.Text= "PMD option reset"

$parm_menu_pmd.Add_Click({
 try{
	Pamamter_reset "pmd"
 }catch{
	echo $_.exception
 }
})

$parm_menu_nn=New-Object System.Windows.Forms.ToolStripSeparator
$parm_menu_fin= New-Object System.Windows.Forms.ToolStripMenuItem
$parm_menu_fin.Text= "Close"

$parm_menu_fin.Add_Click({ # close

	$pram_frm.Close() #.Add_FormClosingへ
})
  
$grp_radio_pmd.Controls.AddRange(@($radio_opn,$radio_opl,$radio_opm,$radio_towns)) 
$grp_pmd.Controls.AddRange(@($add_chk_pmd,$part_chk_pmd))
$tab_pmd.Controls.AddRange(@($grp_radio_pmd,$grp_pmd))

$grp_nsd2.Controls.AddRange(@($bank_chk_nsd,$env_chk_nsd,$sqr_chk_nsd,$err_chk_nsd,$find_chk_nsd))
$tab_nsd2.Controls.AddRange(@($grp_nsd2))

$grp_nsd.Controls.AddRange(@($asm_chk_nsd,$nsf_chk_nsd,$comb_ver_nsd,$label_ver_nsd,$nsfe_chk_nsd))
$tab_nsd.Controls.AddRange(@($grp_nsd))

$grp_mck.Controls.AddRange(@($env_chk_mck,$lang_chk_mck,$warn_chk_mck))
$tab_mck.Controls.AddRange(@($grp_mck))

$pram_tab.Controls.AddRange(@($tab_mck,$tab_nsd,$tab_nsd2,$tab_pmd))

$parm_menu_f.DropDownItems.AddRange(@($parm_menu_mck,$parm_menu_nsd,$parm_menu_pmd,$parm_menu_nn,$parm_menu_fin))
$pram_mnu.Items.AddRange(@($parm_menu_f))

$pram_frm.Controls.AddRange(@($pram_mnu,$pram_tab))
  
# sub Form 
	 
$baloon= New-Object System.Windows.Forms.Tooltip 
$baloon.ShowAlways= $False
# $baloon.ToolTipIcon= "Info"
$baloon.ToolTipTitle= 'Path: '
$baloon.AutomaticDelay= 667
 
# tab_mml 
	
$tab_mml= New-Object System.Windows.Forms.TabPage 
$tab_mml.Text= "mml"

 
$label_mml= New-Object System.Windows.Forms.Label 
$label_mml.Text= "MMLファイル"
$label_mml.Size= "190,20"
$label_mml.Location= "10,5"
 
$contxt_mml= New-Object System.Windows.Forms.ContextMenuStrip 

[void]$contxt_mml.Items.Add("Cancel") # text no baai $Object de areba addrange
[void]$contxt_mml.Items.Add("Editor")
[void]$contxt_mml.Items.Add("Folder")
[void]$contxt_mml.Items.Add("Remove")

$contxt_mml.Add_ItemClicked({

	switch([string]$_.ClickedItem){ # キャスト必要

	'Cancel'{
		$listbox_mml.SelectedItem= $null
		break;

	}'Remove'{
		$script:mml.Remove([string]$listbox_mml.SelectedItem)
		$listbox_mml.Items.Remove([string]$listbox_mml.SelectedItem)
		break;

	}'Folder'{
		if($listbox_mml.SelectedItem -ne $null){

			Folder_open 1 $mml[[string]$listbox_mml.SelectedItem] > $null
		}
		break;

	}'Editor'{
		if($listbox_mml.SelectedItem -ne $null){

			Editor_open $edt[[string]$listbox_edt.SelectedItem] $mml[[string]$listbox_mml.SelectedItem] > $null
		}
	}
	} #sw

	$this.Close()
})
 
$listbox_mml= New-Object System.Windows.Forms.ListBox 
$listbox_mml.Size= "220,90"
$listbox_mml.Location= "5,25"

$listbox_mml.ContextMenuStrip= $contxt_mml
$listbox_mml.AllowDrop= $True

$listbox_mml.Add_MouseUp({

	if([string]$_.Button -eq 'Left'){

		$baloon.SetToolTip($listbox_mml,$mml[[string]$listbox_mml.SelectedItem])
	}
})

$listbox_mml.Add_MouseDoubleClick({

	Editor_open $edt[[string]$listbox_edt.SelectedItem] $mml[[string]$listbox_mml.SelectedItem] > $null
})

$listbox_mml.Add_DragEnter({

	$_.Effect= "All"
})

$listbox_mml.Add_DragDrop({

	$script:args_path= $_.Data.GetData("FileDrop")

	Drag_drop "mml" $args_path
})
 
$label_dmc= New-Object System.Windows.Forms.Label 
$label_dmc.Text= "環境変数DMC/PMDフォルダ"
$label_dmc.Size= "190,20"
$label_dmc.Location= "10,115"
 
$contxt_dmc= New-Object System.Windows.Forms.ContextMenuStrip 

[void]$contxt_dmc.Items.Add("Cancel")

[void]$contxt_dmc.Items.Add("Folder")
[void]$contxt_dmc.Items.Add("Remove")
[void]$contxt_dmc.Items.Add("All Clear")

$contxt_dmc.Add_ItemClicked({

	switch([string]$_.ClickedItem){ # キャスト必要

	'Cancel'{
		$listbox_dmc.SelectedItem= $null
		break;

	}'All Clear'{
		$listbox_dmc.Items.Clear()
		$script:dmc= @{}
		break;

	}'Remove'{
		$script:dmc.Remove([string]$listbox_dmc.SelectedItem)
		$listbox_dmc.Items.Remove([string]$listbox_dmc.SelectedItem)
		break;

	}'Folder'{
		if($listbox_dmc.SelectedItem -ne $null){

			Folder_open 1 $dmc[[string]$listbox_dmc.SelectedItem] > $null
		}
	}
	} #sw

	$this.Close()
})
 
$listbox_dmc= New-Object System.Windows.Forms.ListBox 
$listbox_dmc.Size= "220,90"
$listbox_dmc.Location= "5,135"

$listbox_dmc.ContextMenuStrip= $contxt_dmc
$listbox_dmc.AllowDrop= $True

$listbox_dmc.Add_MouseUp({

	if([string]$_.Button -eq 'Left'){

		$baloon.SetToolTip($listbox_dmc,$dmc[[string]$listbox_dmc.SelectedItem])
	}
})

$listbox_dmc.Add_MouseDoubleClick({

	Folder_open 1 $dmc[[string]$listbox_dmc.SelectedItem] > $null
})

$listbox_dmc.Add_DragEnter({

	$_.Effect= "All"
})

$listbox_dmc.Add_DragDrop({

	$script:args_path= $_.Data.GetData("FileDrop")

	Drag_drop "dmc" $args_path
})
  
# tab_bin 
	 
$tab_bin= New-Object System.Windows.Forms.TabPage 
$tab_bin.Text= "binary"
 
$radio_grp= New-Object System.Windows.Forms.GroupBox 
$radio_grp.Text= "mck,NSD,PMD"
$radio_grp.Size= "140,120"
$radio_grp.Location= "10,5"
 
<# $label_bin= New-Object System.Windows.Forms.Label 
$label_bin.Text= "compilerファイル"
$label_bin.Size= "190,15"
$label_bin.Location= "10,95"
#>
 
# mck ------ 
	
$radio_mck= New-Object System.Windows.Forms.RadioButton 
$radio_mck.Text= "ppmck"
$radio_mck.Size= "100,20"
$radio_mck.Location= "20,25"

$radio_mck.Add_CheckedChanged({

	$pram_tab.SelectedIndex= 0
	$listbox_nsd.Hide()
	$listbox_pmd.Hide()
	$listbox_mck.Show()
})
 
$contxt_mck= New-Object System.Windows.Forms.ContextMenuStrip 

[void]$contxt_mck.Items.Add("Cancel")
[void]$contxt_mck.Items.Add("Folder")
[void]$contxt_mck.Items.Add("Remove")

$contxt_mck.Add_ItemClicked({

	switch([string]$_.ClickedItem){ # キャスト必要

	'Cancel'{
		$listbox_mck.SelectedItem= $null
		break;

	}'Remove'{
		$script:mck.Remove([string]$listbox_mck.SelectedItem)
		$listbox_mck.Items.Remove([string]$listbox_mck.SelectedItem)
		break;

	}'Folder'{
		if($listbox_mck.SelectedItem -ne $null){

			Folder_open 1 $mck[[string]$listbox_mck.SelectedItem] > $null
		}
	}
	} #sw

	$this.Close()
})
 
$listbox_mck= New-Object System.Windows.Forms.ListBox 
$listbox_mck.Size= "220,90"
$listbox_mck.Location= "5,135"

$listbox_mck.ContextMenuStrip= $contxt_mck
$listbox_mck.AllowDrop= $True

$listbox_mck.Add_MouseUp({

	if([string]$_.Button -eq 'Left'){

		$baloon.SetToolTip($listbox_mck,$mck[[string]$listbox_mck.SelectedItem])
	}
})

$listbox_mck.Add_MouseDoubleClick({

	Folder_open 1 $mck[[string]$listbox_mck.SelectedItem] > $null
})

$listbox_mck.Add_DragEnter({

	$_.Effect= "All"
})

$listbox_mck.Add_DragDrop({

	$script:args_path= $_.Data.GetData("FileDrop")

	Drag_drop "mck" $args_path
})
  
# nsd ------ 
	
$radio_nsd= New-Object System.Windows.Forms.RadioButton 
$radio_nsd.Text= "NSDlib"
$radio_nsd.Size= "100,20"
$radio_nsd.Location= "20,55" # $from radio_grp Location

$radio_nsd.Add_CheckedChanged({

	$pram_tab.SelectedIndex= 1
	$listbox_mck.Hide()
	$listbox_pmd.Hide()
	$listbox_nsd.Show()
})
 
$contxt_nsd= New-Object System.Windows.Forms.ContextMenuStrip 

[void]$contxt_nsd.Items.Add("Cancel")
[void]$contxt_nsd.Items.Add("Folder")
[void]$contxt_nsd.Items.Add("Remove")

$contxt_nsd.Add_ItemClicked({

	switch([string]$_.ClickedItem){ # キャスト必要

	'Cancel'{
		$listbox_nsd.SelectedItem= $null
		break;

	}'Remove'{
		$script:nsd.Remove([string]$listbox_nsd.SelectedItem)
		$listbox_nsd.Items.Remove([string]$listbox_nsd.SelectedItem)
		break;

	}'Folder'{
		if($listbox_nsd.SelectedItem -ne $null){

			Folder_open 1 $nsd[[string]$listbox_nsd.SelectedItem] > $null
		}
	}
	} #sw

	$this.Close()
})
 
$listbox_nsd= New-Object System.Windows.Forms.ListBox 
$listbox_nsd.Size= "220,90"
$listbox_nsd.Location= "5,135"

$listbox_nsd.ContextMenuStrip= $contxt_nsd
$listbox_nsd.AllowDrop= $True

$listbox_nsd.Add_MouseUp({

	if([string]$_.Button -eq 'Left'){

		$baloon.SetToolTip($listbox_nsd,$nsd[[string]$listbox_nsd.SelectedItem])
	}
})

$listbox_nsd.Add_MouseDoubleClick({

	Folder_open 1 $nsd[[string]$listbox_nsd.SelectedItem] > $null
})

#$listbox_nsd.Add_MouseDown({ # -> $listbox_nsd.ContextMenuStrip

#	if([string]$_.Button -eq 'Right'){
		# [Windows.Forms.Control]::MousePosition | write-host #でも同じ
#		$contxt_nsd.Show([Windows.Forms.Cursor]::Position) # [.X, .Y]
#	}
#})

$listbox_nsd.Add_DragEnter({

	$_.Effect= "All"
})

$listbox_nsd.Add_DragDrop({

	$script:args_path= $_.Data.GetData("FileDrop")

	Drag_drop "nsd" $args_path
})
  
# pmd ------ 
	
$radio_pmd= New-Object System.Windows.Forms.RadioButton 
$radio_pmd.Text= "P.M.D"
$radio_pmd.Size= "100,20"
$radio_pmd.Location= "20,85"

$radio_pmd.Add_CheckedChanged({

	$pram_tab.SelectedIndex= 3
	$listbox_mck.Hide()
	$listbox_nsd.Hide()
	$listbox_pmd.Show()
})
 
$contxt_pmd= New-Object System.Windows.Forms.ContextMenuStrip 

[void]$contxt_pmd.Items.Add("Cancel")
[void]$contxt_pmd.Items.Add("Folder")
[void]$contxt_pmd.Items.Add("Remove")

$contxt_pmd.Add_ItemClicked({

	switch([string]$_.ClickedItem){ # キャスト必要

	'Cancel'{
		$listbox_pmd.SelectedItem= $null
		break;

	}'Remove'{
		$script:pmd.Remove([string]$listbox_pmd.SelectedItem)
		$listbox_pmd.Items.Remove([string]$listbox_pmd.SelectedItem)
		break;

	}'Folder'{
		if($listbox_pmd.SelectedItem -ne $null){

			Folder_open 1 $pmd[[string]$listbox_pmd.SelectedItem] > $null
		}
	}
	} #sw

	$this.Close()
})
 
$listbox_pmd= New-Object System.Windows.Forms.ListBox 
$listbox_pmd.Size= "220,90"
$listbox_pmd.Location= "5,135"

$listbox_pmd.ContextMenuStrip= $contxt_pmd
$listbox_pmd.AllowDrop= $True

$listbox_pmd.Add_MouseUp({

	if([string]$_.Button -eq 'Left'){

		$baloon.SetToolTip($listbox_pmd,$pmd[[string]$listbox_pmd.SelectedItem])
	}
})

$listbox_pmd.Add_MouseDoubleClick({

	Folder_open 1 $pmd[[string]$listbox_pmd.SelectedItem] > $null
})

$listbox_pmd.Add_DragEnter({

	$_.Effect= "All"
})

$listbox_pmd.Add_DragDrop({

	$script:args_path= $_.Data.GetData("FileDrop")

	Drag_drop "pmd" $args_path
})
   
# tab_ply 
	
$tab_ply= New-Object System.Windows.Forms.TabPage 
$tab_ply.Text= "player"
 
$label_ply= New-Object System.Windows.Forms.Label 
$label_ply.Text= "プレイヤーファイル"
$label_ply.Size= "190,15"
$label_ply.Location= "10,5"
 
$contxt_ply= New-Object System.Windows.Forms.ContextMenuStrip 

[void]$contxt_ply.Items.Add("Cancel")
[void]$contxt_ply.Items.Add("Open")
[void]$contxt_ply.Items.Add("Folder")
[void]$contxt_ply.Items.Add("Remove")
[void]$contxt_ply.Items.Add("All Clear")


$contxt_ply.Add_ItemClicked({

	switch([string]$_.ClickedItem){ # キャスト必要

	'Cancel'{
		$listbox_ply.SelectedItem= $null
		break;

	}'Remove'{
		$script:ply.Remove([string]$listbox_ply.SelectedItem)
		$listbox_ply.Items.Remove([string]$listbox_ply.SelectedItem)
		break;

	}'All Clear'{
		$listbox_ply.Items.Clear()
		$script:ply= @{}
		break;

	}'Folder'{
		if($listbox_ply.SelectedItem -ne $null){

			Folder_open 1 $ply[[string]$listbox_ply.SelectedItem] > $null
		}
		break;

	}'Open'{
		if($listbox_ply.SelectedItem -ne $null){

			Folder_open 0 $ply[[string]$listbox_ply.SelectedItem] > $null
		}
	}
	} #sw

	$this.Close()
})
 
$listbox_ply= New-Object System.Windows.Forms.ListBox 
$listbox_ply.Size= "220,170"
$listbox_ply.Location= "5,25"

$listbox_ply.ContextMenuStrip= $contxt_ply
$listbox_ply.AllowDrop= $True

$listbox_ply.Add_MouseUp({

	if([string]$_.Button -eq 'Left'){

		$baloon.SetToolTip($listbox_ply,$ply[[string]$listbox_ply.SelectedItem])
	}
})

$listbox_ply.Add_MouseDoubleClick({

	Folder_open 0 $ply[[string]$listbox_ply.SelectedItem] > $null
})

$listbox_ply.Add_DragEnter({

	$_.Effect= "All"
})

$listbox_ply.Add_DragDrop({

	$script:args_path= $_.Data.GetData("FileDrop")

	Drag_drop "ply" $args_path
})
 
$stop_chk= New-Object System.Windows.Forms.CheckBox 
$stop_chk.Text= "/stopコマンド(for winamp )"
$stop_chk.Size= "220,20"
$stop_chk.Location= "10,190"
 
<# 
 
$stop_label= New-Object System.Windows.Forms.Label 
$stop_label.Text= "※コンパイル前、stopコマンド出力"
$stop_label.Size= "220,20"
$stop_label.Location= "10,200"
 
$thru_chk= New-Object System.Windows.Forms.CheckBox 
$thru_chk.Text= "compiler内蔵プレイヤー"
$thru_chk.Size= "200,20"
$thru_chk.Location= "10,135"
 
$thru_label= New-Object System.Windows.Forms.Label 
$thru_label.Text= "※mml -> player direct"
$thru_label.Size= "190,15"
$thru_label.Location= "10,155"
 
#> 
  
# tab_edt 
	
$tab_edt= New-Object System.Windows.Forms.TabPage 
$tab_edt.Text= "editor"
 
$label_edt= New-Object System.Windows.Forms.Label 
$label_edt.Text= "エディタファイル"
$label_edt.Size= "190,20"
$label_edt.Location= "10,5"
 
$contxt_edt= New-Object System.Windows.Forms.ContextMenuStrip 

[void]$contxt_edt.Items.Add("Cancel")
[void]$contxt_edt.Items.Add("Open")
[void]$contxt_edt.Items.Add("Folder")
[void]$contxt_edt.Items.Add("Remove")
[void]$contxt_edt.Items.Add("All Clear")


$contxt_edt.Add_ItemClicked({

	switch([string]$_.ClickedItem){ # キャスト必要

	'Cancel'{
		$listbox_edt.SelectedItem= $null
		break;

	}'Remove'{
		$script:edt.Remove([string]$listbox_edt.SelectedItem)
		$listbox_edt.Items.Remove([string]$listbox_edt.SelectedItem)
		break;

	}'All Clear'{
		$listbox_edt.Items.Clear()
		$script:edt= @{}
		break;

	}'Folder'{
		if($listbox_edt.SelectedItem -ne $null){

			Folder_open 1 $edt[[string]$listbox_edt.SelectedItem] > $null
		}
		break;

	}'Open'{
		if($listbox_edt.SelectedItem -ne $null){

			Folder_open 0 $edt[[string]$listbox_edt.SelectedItem] > $null
		}
	}
	} #sw

	$this.Close()
})
 
$listbox_edt= New-Object System.Windows.Forms.ListBox 
$listbox_edt.Size= "220,170"
$listbox_edt.Location= "5,25"

$listbox_edt.ContextMenuStrip= $contxt_edt
$listbox_edt.AllowDrop= $True

$listbox_edt.Add_MouseUp({

	if([string]$_.Button -eq 'Left'){

		$baloon.SetToolTip($listbox_edt,$edt[[string]$listbox_edt.SelectedItem])
	}
})

$listbox_edt.Add_MouseDoubleClick({

	Folder_open 0 $edt[[string]$listbox_edt.SelectedItem] > $null
})

$listbox_edt.Add_DragEnter({

	$_.Effect= "All"
})

$listbox_edt.Add_DragDrop({

	$script:args_path= $_.Data.GetData("FileDrop")

	Drag_drop "edt" $args_path
})
 
$label_edt_read= New-Object System.Windows.Forms.Label 
$label_edt_read.Text= "※エディタ、mml リスト右クリック"
$label_edt_read.Size= "220,20"
$label_edt_read.Location= "10,190"
# $label_edt_read.ForeColor= "Gray"
# $label_edt_read.BackColor= "White"
  
# tab_dos 
	
$tab_dos= New-Object System.Windows.Forms.TabPage 
$tab_dos.Text= "dos"
 
$label_dos= New-Object System.Windows.Forms.Label 
$label_dos.Text= "ドスプロンプト"
$label_dos.Size= "190,20"
$label_dos.Location= "10,5"
 
$contxt_dos= New-Object System.Windows.Forms.ContextMenuStrip 

[void]$contxt_dos.Items.Add("Cancel")
[void]$contxt_dos.Items.Add("Open")
[void]$contxt_dos.Items.Add("Folder")
[void]$contxt_dos.Items.Add("Remove")

$contxt_dos.Add_ItemClicked({

	switch([string]$_.ClickedItem){ # キャスト必要

	'Cancel'{
		$listbox_dos.SelectedItem= $null
		break;

	}'Remove'{
		$script:dos.Remove([string]$listbox_dos.SelectedItem)
		$listbox_dos.Items.Remove([string]$listbox_dos.SelectedItem)
		break;

	}'Folder'{
		if($listbox_dos.SelectedItem -ne $null){

			Folder_open 1 $dos[[string]$listbox_dos.SelectedItem] > $null
		}
		break;

	}'Open'{
		if($listbox_dos.SelectedItem -ne $null){

			Folder_open 0 $dos[[string]$listbox_dos.SelectedItem] > $null
		}
	}
	} #sw

	$this.Close()
})
 
$listbox_dos= New-Object System.Windows.Forms.ListBox 
$listbox_dos.Size= "220,90"
$listbox_dos.Location= "5,25"

$listbox_dos.ContextMenuStrip= $contxt_dos
$listbox_dos.AllowDrop= $True

$listbox_dos.Add_MouseUp({

	if([string]$_.Button -eq 'Left'){

		$baloon.SetToolTip($listbox_dos,$dos[[string]$listbox_dos.SelectedItem])
	}
})

$listbox_dos.Add_MouseDoubleClick({

	Folder_open 0 $dos[[string]$listbox_dos.SelectedItem] > $null
})

$listbox_dos.Add_DragEnter({

	$_.Effect= "All"
})

$listbox_dos.Add_DragDrop({

	$script:args_path= $_.Data.GetData("FileDrop")

	Drag_drop "dos" $args_path
})
 
$dos_chk= New-Object System.Windows.Forms.CheckBox 
$dos_chk.Text= "x64対応"
$dos_chk.Size= "190,20"
$dos_chk.Location= "10,115"
 
$label_dos_read= New-Object System.Windows.Forms.Label 
$label_dos_read.Text= "※16bitPMD running 64bitOS"
$label_dos_read.Size= "220,20"
$label_dos_read.Location= "10,135"
  
$tab= New-Object System.Windows.Forms.TabControl 
$tab.Size= "245,255"
$tab.Location= "5,25"
 
$ok_btn= New-Object System.Windows.Forms.Button 
$ok_btn.Text= "OK"
$ok_btn.Size= "90,30"
$ok_btn.Location= "65,284"

$ok_btn.DialogResult= "OK"

$ok_btn.Add_Click({

	$sub_f.Close() #.Add_FormClosingへ
})
 
$cancel_btn= New-Object System.Windows.Forms.Button 
$cancel_btn.Text= "Cancel"
$cancel_btn.Size= "90,30"
$cancel_btn.Location= "160,284"

$cancel_btn.DialogResult= "Cancel"

$cancel_btn.Add_Click({

	$sub_f.Close() #.Add_FormClosingへ
})
 
$sub_f= New-Object System.Windows.Forms.Form 
$sub_f.Text= "環境設定"
$sub_f.Size= "268,362"
$sub_f.Location= "150,0"
$sub_f.FormBorderStyle= "FixedSingle"
$sub_f.StartPosition= "WindowsDefaultLocation"
$sub_f.Icon= Icon_read "..\src\ST_icon.ico"
#$sub_f.ShowIcon= $False
$sub_f.MaximizeBox= $False
$sub_f.MinimizeBox= $False

#$sub_f.TopMost= $True # 最前面へ
$sub_f.TopLevel= $True
# $sub_f.Owner= $frm

$sub_f.Add_Shown({

	$ok_btn.Select() # showdialog after forcus
})

$sub_f.Add_FormClosing({
  try{

	if($_.CloseReason -eq 'UserClosing'){ # x ボタンの場合
	}

	# $_.Cancel= $True # .ShowDialog()の場合、$sub_fがとじなくなる
	# write-host ("chk button---"+ $sub_f.DialogResult) # 選択button

 	switch($sub_f.DialogResult){
	# }'None'{		# 不要
	# }'Cancel'{	break;	# キャンセルでxml書き込みスルー

 	'OK'{
		switch($args_pram[0]){
  		'all'{
			Write_hash
			break;
		}'cut'{
			Write_hash_cut
		}
		} #sw

		Write_xml $script:xml_set.table

		File_writer $script:xml_set '.\setting.xml'
	}
	} #sw

  }catch{
	echo $_.exception
	Write-Host '"ERROR: Safety Stopper >> $sub_f.FormClosing()"'
  }
})
 
$sub_mnu= New-Object System.Windows.Forms.MenuStrip 
	 
$sub_menu_f= New-Object System.Windows.Forms.ToolStripMenuItem 
$sub_menu_f.Text= "File"

$sub_menu_a= New-Object System.Windows.Forms.ToolStripMenuItem
$sub_menu_a.Text= "環境リセット"

$sub_menu_a.Add_Click({	# 環境リセット
 try{

  switch(Attend){

  'OK'{
	$script:xml_set= [xml]$setting_xml

	$script:mml= @{}; $script:mck= @{}; $script:nsd= @{}; $script:pmd= @{};
	$script:ply= @{}; $script:dmc= @{}; $script:edt= @{}; $script:dos= @{};

	Xml_read $script:xml_set.table

	switch($args_pram[0]){

	'all'{	Hash_read;	break;
	}'cut'{	Hash_read_cut
	}
	} #sw

	Write-Host "環境をリセットしました"
  }
  #'Cancel'{}
  } #sw

 }catch{
	echo $_.exception
 }
})

$sub_menu_sn=New-Object System.Windows.Forms.ToolStripSeparator
$sub_menu_n= New-Object System.Windows.Forms.ToolStripMenuItem
$sub_menu_n.Text= "設定終了"

$sub_menu_n.Add_Click({	# 設定終了

	$sub_f.DialogResult= "OK"

	$sub_f.Close() #.Add_FormClosingへ
})
 
$sub_menu_o= New-Object System.Windows.Forms.ToolStripMenuItem 
$sub_menu_o.Text= "Option"


$sub_menu_opt= New-Object System.Windows.Forms.ToolStripMenuItem
# $sub_menu_opt.Text= "Command Option"

$sub_menu_opt.Add_Click({
 try{

  switch($pram_frm.Visible){
  'False'{

	$this.Text= "v Command Option"

	$pram_frm.Show()

	break;
  }'True'{

	$pram_frm.Close() # $pram_frm.Add_FormClosingへ
  }
  } #sw

 }catch{
	echo $_.exception
    	Write-Host '"ERROR: Safety Stopper >> $pram_frm.Show()"'
 }
})
  
$sub_menu_f.DropDownItems.AddRange(@($sub_menu_a,$sub_menu_sn,$sub_menu_n)) 
$sub_menu_o.DropDownItems.AddRange(@($sub_menu_opt))
$sub_mnu.Items.AddRange(@($sub_menu_f,$sub_menu_o))


$tab_mml.Controls.AddRange(@($label_mml,$listbox_mml,$label_dmc,$listbox_dmc))

$radio_grp.Controls.AddRange(@($radio_mck,$radio_nsd,$radio_pmd))
$tab_bin.Controls.AddRange(@($radio_grp,$listbox_mck,$listbox_nsd,$listbox_pmd))

$tab_ply.Controls.AddRange(@($label_ply,$listbox_ply,$stop_chk))
$tab_dos.Controls.AddRange(@($label_dos,$listbox_dos,$dos_chk,$label_dos_read))
$tab_edt.Controls.AddRange(@($label_edt,$listbox_edt,$label_edt_read))

# $tab.Controls.AddRange(@($tab_mml,$tab_bin,$tab_ply,$tab_edt,$tab_dos))

$sub_f.Controls.AddRange(@($sub_mnu,$tab,$ok_btn,$cancel_btn))
$sub_f.CancelButton= $cancel_btn	# [ESC]
$sub_f.AcceptButton= $ok_btn	# [Enter]
  
# ------ main 
 try{

  #引数
	$args_pram= $Args

	if($args_pram[0] -eq 'send'){

		$script:xml_set= [xml]$setting_xml
		File_writer $script:xml_set '.\setting.xml'
	}else{


		$vals= $args_pram[1]
		$opts= $args_pram[2]	# only memory

		# キャスト
		if((Chk_path '.\setting.xml') -eq 0){

			$xml_set= [xml](cat '.\setting.xml')
		}else{
			$xml_set= [xml]$setting_xml
		}

		# 連想配列化

		$mck= @{}; $nsd= @{}; $pmd= @{};
		$mml= @{}; $ply= @{}; $dmc= @{}; $edt= @{}; $dos= @{};


		Xml_read $script:xml_set.table


		switch($args_pram[0]){
		'all'{
			$sub_menu_opt.Text= "Command Option"

			$tab.Controls.AddRange(@($tab_mml,$tab_bin,$tab_ply,$tab_edt,$tab_dos))

			Hash_read	# List化
			break;
		}'cut'{
			$sub_menu_opt.Text= "Auto Option"

			$tab.Controls.AddRange(@($tab_bin,$tab_ply,$tab_edt,$tab_dos))

			Hash_read_cut # List化

		}
		} #sw

		$Sub_f.ShowDialog() > $null

		Write-Host ("`r`n"+"`"環境設定`"を終了します"+"`r`n")

		[array] $retn= $vals, $opts
		return $retn

		## echo $vals $opts # return dato Safety Stopper

	}

 }catch{
	echo $_.exception
	Write-Host '"ERROR: Safety Stopper >> setting - main"'

 }finally{
	$pram_frm.Dispose()
 }
 	
