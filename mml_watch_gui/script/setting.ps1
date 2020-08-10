<# setting.ps1 #> 

Write-Host ('"���ݒ�"���N�����܂�')
 
$setting_xml= @' 
<table>
	<!-- listbox / name�͕ϓ��l -->
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
	<ply name= "FMP7.exe" param= "..\fmp7\FMP7.exe"/>
	<br />
	<dmc name= "" param= ""/>
	<dmc name= "" param= ""/>
	<dmc name= "" param= ""/>
	<dmc name= "" param= ""/>
	<br />
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

  for([int]$i=3; $i -ge 0; $i--){


	if($x.mml[$i].name -ne ''){

		$script:mml[$x.mml[$i].name]= $x.mml[$i].param
	}

	if($x.mck[$i].name -ne ''){

		$script:mck[$x.mck[$i].name]= $x.mck[$i].param
		##$script:cmp[$x.mck[$i].name]= $x.mck[$i].param
	}
	if($x.nsd[$i].name -ne ''){

		$script:nsd[$x.nsd[$i].name]= $x.nsd[$i].param
		##$script:cmp[$x.nsd[$i].name]= $x.nsd[$i].param
	}
	if($x.pmd[$i].name -ne ''){

		$script:pmd[$x.pmd[$i].name]= $x.pmd[$i].param
		##$script:cmp[$x.pmd[$i].name]= $x.pmd[$i].param
	}

	if($x.ply[$i].name -ne ''){

		$script:ply[$x.ply[$i].name]= $x.ply[$i].param
	}
	if($x.dmc[$i].name -ne ''){

		$script:dmc[$x.dmc[$i].name]= $x.dmc[$i].param
	}
	if($x.edt[$i].name -ne ''){

		$script:edt[$x.edt[$i].name]= $x.edt[$i].param
	}
	if($x.dos[$i].name -ne ''){

		$script:dos[$x.dos[$i].name]= $x.dos[$i].param
	}
  } #
 } #func
 
function Write_xml($x){ 

  # $x= $script:xml_set.table


  [array]$mck_keys= $mck.Keys
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


  if($mk -gt 4){ Write-Host ('ERROR: mck hash >> '+ $mk) }
  if($nd -gt 4){ Write-Host ('ERROR: nsd hash >> '+ $nd) }
  if($pd -gt 4){ Write-Host ('ERROR: pmd hash >> '+ $pd) }

  if($ml -gt 4){ Write-Host ('ERROR: mml hash >> '+ $ml) }
  if($py -gt 4){ Write-Host ('ERROR: ply hash >> '+ $py) }
  if($dc -gt 4){ Write-Host ('ERROR: dmc hash >> '+ $dc) }
  if($et -gt 4){ Write-Host ('ERROR: edt hash >> '+ $et) }
  if($ds -gt 4){ Write-Host ('ERROR: dos hash >> '+ $ds) }


  for([int]$i=3; $i -ge 0; $i--){


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

	if($i -lt $py){

		$x.ply[$i].name=  [string]$ply_keys[$i]
		$x.ply[$i].param= [string]$ply[$ply_keys[$i]]
	}else{
		$x.ply[$i].name=  ""
		$x.ply[$i].param= ""
	}
	if($i -lt $dc){

		$x.dmc[$i].name=  [string]$dmc_keys[$i]
		$x.dmc[$i].param= [string]$dmc[$dmc_keys[$i]]
	}else{
		$x.dmc[$i].name=  ""
		$x.dmc[$i].param= ""
	}
	if($i -lt $et){

		$x.edt[$i].name=  [string]$edt_keys[$i]
		$x.edt[$i].param= [string]$edt[$edt_keys[$i]]
	}else{
		$x.edt[$i].name=  ""
		$x.edt[$i].param= ""
	}
	if($i -lt $ds){

		$x.dos[$i].name=  [string]$dos_keys[$i]
		$x.dos[$i].param= [string]$dos[$dos_keys[$i]]
	}else{
		$x.dos[$i].name=  ""
		$x.dos[$i].param= ""
	}
  } #
 } #func
 
function Hash_read(){ 


	Pmd_option $opts["option"] > $null # return fuuji


	$stop_box.CheckState= $opts["chk_stop"]
	$dos_box.CheckState= $opts["chk_dos"]


	$listbox_mml.Items.Clear() # reset 2�d�Ǎ��΍�
	$listbox_mck.Items.Clear()
	$listbox_nsd.Items.Clear()
	$listbox_pmd.Items.Clear()
	$listbox_ply.Items.Clear()
	$listbox_dmc.Items.Clear()
	$listbox_edt.Items.Clear()
	$listbox_dos.Items.Clear()

	[void]$listbox_mml.Items.AddRange(@($mml.Keys)) # .Add�� �ߒl���郁�\�b�h����
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
		$radio_mck.Checked= "True"
		$listbox_mck.Show()

		foreach($key in $mck.Keys){

			if($mck[$key] -eq $vals["compiler"]){ $listbox_mck.SelectedItem= $key }
		} #

		break;
	}'nsd'{
		$radio_nsd.Checked= "True"
		$listbox_nsd.Show()

		foreach($key in $nsd.Keys){

			if($nsd[$key] -eq $vals["compiler"]){ $listbox_nsd.SelectedItem= $key }
		} #

		break;
	}'pmd'{
		$radio_pmd.Checked= "True"
		$listbox_pmd.Show()

		foreach($key in $pmd.Keys){

			if($pmd[$key] -eq $vals["compiler"]){ $listbox_pmd.SelectedItem= $key }
		} #
	}
	} #sw


	foreach($key in $mml.Keys){ # ����΃n�C���C�g�\��

		if($mml[$key] -eq $vals["mmlfile"]){ $listbox_mml.SelectedItem= $key }
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


  $script:opts["chk_stop"]= [string]$stop_box.CheckState
  $script:opts["chk_dos"]= [string]$dos_box.CheckState


  if([string]$radio_mck.Checked -eq 'True'){

	$script:opts["radio_bin"]= "mck"

	switch($mck.Count){
	0{	  $script:vals["compiler"]= ""; break;
	}1{	  $script:vals["compiler"]= $mck.Values; break;
	}default{ $script:vals["compiler"]= $mck[[string]$listbox_mck.SelectedItem] # [string]�L���X�g�K�v
	}
	} #sw

  }elseif([string]$radio_nsd.Checked -eq 'True'){

	$script:opts["radio_bin"]= "nsd"

	switch($nsd.Count){
	0{	  $script:vals["compiler"]= ""; break;
	}1{	  $script:vals["compiler"]= $nsd.Values; break;
	}default{ $script:vals["compiler"]= $nsd[[string]$listbox_nsd.SelectedItem]
	}
	} #sw

  }elseif([string]$radio_pmd.Checked -eq 'True'){

	$script:opts["radio_bin"]= "pmd"

	switch($pmd.Count){
	0{	  $script:vals["compiler"]= ""; break;
	}1{	  $script:vals["compiler"]= $pmd.Values; break;
	}default{ $script:vals["compiler"]= $pmd[[string]$listbox_pmd.SelectedItem]
	}
	} #sw
  }

	switch($mml.Count){
	0{	  $script:vals["mmlfile"]= ""; break;
	}1{	  $script:vals["mmlfile"]= $mml.Values;	break;
	}default{ $script:vals["mmlfile"]= $mml[[string]$listbox_mml.SelectedItem]
	}
	} #sw

	switch($ply.Count){
	0{	  $script:vals["player"]= ""; break;
	}1{	  $script:vals["player"]= $ply.Values; break;
	}default{ $script:vals["player"]= $ply[[string]$listbox_ply.SelectedItem]
	}
	} #sw

	switch($dmc.Count){
	0{	  $script:vals["dmcdir"]= ""; break;
	}1{	  $script:vals["dmcdir"]= $dmc.Values; break;
	}default{ $script:vals["dmcdir"]= $dmc[[string]$listbox_dmc.SelectedItem]
	}
	} #sw

	switch($edt.Count){
	0{	  $script:vals["editor"]= ""; break;
	}1{	  $script:vals["editor"]= $edt.Values; break;
	}default{ $script:vals["editor"]= $edt[[string]$listbox_edt.SelectedItem]
	}
	} #sw

	switch($dos.Count){
	0{	  $script:vals["dos"]= ""; break;
	}1{	  $script:vals["dos"]= $dos.Values; break;
	}default{ $script:vals["dos"]= $dos[[string]$listbox_dos.SelectedItem]
	}
	} #sw
 } #func
 
function Hash_read_cut(){ 


	$sub_menu_o.Enabled= $False # Pmd_option


	$stop_box.CheckState= "Unchecked"
	$stop_box.Enabled= $False

	$dos_box.CheckState= $opts["chk_dos"]


	$listbox_mck.Items.Clear() # reset 2�d�Ǎ��΍�
	$listbox_nsd.Items.Clear()
	$listbox_pmd.Items.Clear()
	$listbox_ply.Items.Clear()
	$listbox_edt.Items.Clear()
	$listbox_dos.Items.Clear()

	[void]$listbox_mck.Items.AddRange(@($mck.Keys)) # .Add�� �ߒl���郁�\�b�h����
	[void]$listbox_nsd.Items.AddRange(@($nsd.Keys))
	[void]$listbox_pmd.Items.AddRange(@($pmd.Keys))
	[void]$listbox_ply.Items.AddRange(@($ply.Keys))
	[void]$listbox_edt.Items.AddRange(@($edt.Keys))
	[void]$listbox_dos.Items.AddRange(@($dos.Keys))


	$listbox_mck.Hide()
	$listbox_nsd.Hide()
	$listbox_pmd.Hide()


	[string]$key= ""

	switch($opts["radio_bin"]){

	'mck'{
		$radio_mck.Checked= "True"
		$listbox_mck.Show()

		foreach($key in $mck.Keys){

			if($mck[$key] -eq $vals["compiler"]){ $listbox_mck.SelectedItem= $key }
		} #

		break;
	}'nsd'{
		$radio_nsd.Checked= "True"
		$listbox_nsd.Show()

		foreach($key in $nsd.Keys){

			if($nsd[$key] -eq $vals["compiler"]){ $listbox_nsd.SelectedItem= $key }
		} #

		break;
	}'pmd'{
		$radio_pmd.Checked= "True"
		$listbox_pmd.Show()

		foreach($key in $pmd.Keys){

			if($pmd[$key] -eq $vals["compiler"]){ $listbox_pmd.SelectedItem= $key }
		} #
	}
	} #sw


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


	$script:opts["chk_dos"]= [string]$dos_box.CheckState


  if([string]$radio_mck.Checked -eq 'True'){

	$script:opts["radio_bin"]= "mck"

	switch($mck.Count){
	0{	  $script:vals["compiler"]= ""; break;
	}1{	  $script:vals["compiler"]= $mck.Values; break;
	}default{ $script:vals["compiler"]= $mck[[string]$listbox_mck.SelectedItem] # [string]�L���X�g�K�v
	}
	} #sw

  }elseif([string]$radio_nsd.Checked -eq 'True'){

	$script:opts["radio_bin"]= "nsd"

	switch($nsd.Count){
	0{	  $script:vals["compiler"]= ""; break;
	}1{	  $script:vals["compiler"]= $nsd.Values; break;
	}default{ $script:vals["compiler"]= $nsd[[string]$listbox_nsd.SelectedItem]
	}
	} #sw

  }elseif([string]$radio_pmd.Checked -eq 'True'){

	$script:opts["radio_bin"]= "pmd"

	switch($pmd.Count){
	0{	  $script:vals["compiler"]= ""; break;
	}1{	  $script:vals["compiler"]= $pmd.Values; break;
	}default{ $script:vals["compiler"]= $pmd[[string]$listbox_pmd.SelectedItem]
	}
	} #sw
  }

	switch($ply.Count){
	0{	  $script:vals["player"]= ""; break;
	}1{	  $script:vals["player"]= $ply.Values; break;
	}default{ $script:vals["player"]= $ply[[string]$listbox_ply.SelectedItem]
	}
	} #sw
	switch($edt.Count){
	0{	  $script:vals["editor"]= ""; break;
	}1{	  $script:vals["editor"]= $edt.Values; break;
	}default{ $script:vals["editor"]= $edt[[string]$listbox_edt.SelectedItem]
	}
	} #sw

	switch($dos.Count){
	0{	  $script:vals["dos"]= ""; break;
	}1{	  $script:vals["dos"]= $dos.Values; break;
	}default{ $script:vals["dos"]= $dos[[string]$listbox_dos.SelectedItem]
	}
	} #sw
 } #func
  
function Attend(){ 

	[string]$ret= [Windows.Forms.MessageBox]::Show(

		"���ݒ�̃��Z�b�g", "�m�F", "OKCancel","Information","Button2"
	)

	return $ret
 } #func
 
function Pmd_option([string]$t){ 

	switch($t){

	'opl'{
		$sub_menu_opl.Text= "[v] OPL 2op"
		$sub_menu_opn.Text= "OPN 4op"
		$sub_menu_opm.Text= "OPM 4op"
		$sub_menu_towns.Text= "TOWNS 4op"
		break;
	}'opn'{
		$sub_menu_opl.Text= "OPL 2op"
		$sub_menu_opn.Text= "[v] OPN 4op"
		$sub_menu_opm.Text= "OPM 4op"
		$sub_menu_towns.Text= "TOWNS 4op"
		break;
	}'opm'{
		$sub_menu_opl.Text= "OPL 2op"
		$sub_menu_opn.Text= "OPN 4op"
		$sub_menu_opm.Text= "[v] OPM 4op"
		$sub_menu_towns.Text= "TOWNS 4op"
		break;
	}'towns'{
		$sub_menu_opl.Text= "OPL 2op"
		$sub_menu_opn.Text= "OPN 4op"
		$sub_menu_opm.Text= "OPM 4op"
		$sub_menu_towns.Text= "[v] TOWNS 4op"
	}
	} #sw

	return $t
} #func
 
function Drag_drop([string]$sw,[array]$drp){ 

 [string]$s= ""
 foreach($s in $drp){

	switch(Chk_path $s){

	2{	Write-Host ('ERROR: Null > '+ $sw)
		break;

	}1{	Write-Host ('ERROR: Test-Path > '+ $sw)
		break;

	}0{	[string[]]$f= Split_path $s

		[string]$key= ""
		[int]$chk= 0

		switch($sw){

		'mml'{
			[string[]]$arr= $mml.Keys
			#($key in $mml.Keys)���ƁAmml.Values����������ƃ��[�v���~�܂邽��

			foreach($key in $arr){

				if($key -eq $f[0]){ # ����΍��ւ�

					if($mml[$key] -ne $s){ # ��������hash�l���ւ�

				 		$script:mml[$key]= $s # Values
					}

					$listbox_mml.SelectedItem= $key
					$chk= 1
				}
			} #

			if($chk -eq 0){ # �Ȃ���΃n�b�V���ǉ�

				if(($mml.Count+1) -le 4){

				 	$script:mml[$f[0]]= $s
					[void]$listbox_mml.Items.Add($f[0]) # �t�@�C���ǉ�

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

				if(($ply.Count+1) -le 4){

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

				if(($edt.Count+1) -le 4){

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
 
function Box_radio([string]$val_path){ 

	[string[]]$arr= Split_path $val_path

	[string]$s= "nsd" # radio's list��������

	switch($arr[0]){
	'ppmckc.exe'{	$s= "mck"
	}'nsc.exe'{	$s= "nsd"
	}'mc.exe'{	$s= "pmd"
	}
	} #sw

	return $s
 } #func
 
Add-Type -AssemblyName System.Windows.Forms > $null 

$ErrorActionPreference= "Stop"

cd (Split-Path -Parent $MyInvocation.MyCommand.Path)
[Environment]::CurrentDirectory= pwd # working_dir set
 
# sub Form 
	 
$baloon= New-Object System.Windows.Forms.Tooltip 
$baloon.ShowAlways= $False
# $baloon.ToolTipIcon= "Info"
$baloon.ToolTipTitle= 'Path: '
$baloon.AutomaticDelay= 667
 
$tab= New-Object System.Windows.Forms.TabControl 
$tab.Size= "225,205"
$tab.Location= "5,25"
 
# tab_mml 
	
$tab_mml= New-Object System.Windows.Forms.TabPage 
$tab_mml.Text= "mml"

 
$label_mml= New-Object System.Windows.Forms.Label 
$label_mml.Text= "MML�t�@�C��"
$label_mml.Size= "190,15"
$label_mml.Location= "10,5"
 
$contxt_mml= New-Object System.Windows.Forms.ContextMenuStrip 

[void]$contxt_mml.Items.Add("Cancel")
[void]$contxt_mml.Items.Add("Editor")
[void]$contxt_mml.Items.Add("Folder")
[void]$contxt_mml.Items.Add("Remove")

$contxt_mml.Add_ItemClicked({

	switch([string]$_.ClickedItem){ # �L���X�g�K�v

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
$listbox_mml.Size= "200,60"
$listbox_mml.Location= "5,30"

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
$label_dmc.Text= "DMC,PMD/include�t�H���_"
$label_dmc.Size= "190,15"
$label_dmc.Location= "10,95"
 
$contxt_dmc= New-Object System.Windows.Forms.ContextMenuStrip 

[void]$contxt_dmc.Items.Add("Cancel")
[void]$contxt_dmc.Items.Add("Folder")
[void]$contxt_dmc.Items.Add("Remove")

$contxt_dmc.Add_ItemClicked({

	switch([string]$_.ClickedItem){ # �L���X�g�K�v

	'Cancel'{
		$listbox_dmc.SelectedItem= $null
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
$listbox_dmc.Size= "200,60"
$listbox_dmc.Location= "5,120"

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
$tab_bin.Text= "bin"
 
$radio_grp= New-Object System.Windows.Forms.GroupBox 
$radio_grp.Text= "mck,NSD,PMD"
$radio_grp.Size= "120,105"
$radio_grp.Location= "10,5"
 
<# $label_bin= New-Object System.Windows.Forms.Label 
$label_bin.Text= "�R���p�C���t�@�C��"
$label_bin.Size= "190,15"
$label_bin.Location= "10,95"
#>
 
# mck ------ 
	
$radio_mck= New-Object System.Windows.Forms.RadioButton 
$radio_mck.Text= "ppmck"
$radio_mck.Size= "65,20"
$radio_mck.Location= "20,20"

$radio_mck.Add_CheckedChanged({

	$listbox_nsd.Hide()
	$listbox_pmd.Hide()
	$listbox_mck.Show()
})
 
$contxt_mck= New-Object System.Windows.Forms.ContextMenuStrip 

[void]$contxt_mck.Items.Add("Cancel")
[void]$contxt_mck.Items.Add("Folder")
[void]$contxt_mck.Items.Add("Remove")

$contxt_mck.Add_ItemClicked({

	switch([string]$_.ClickedItem){ # �L���X�g�K�v

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
$listbox_mck.Size= "200,60"
$listbox_mck.Location= "5,120"

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
$radio_nsd.Size= "65,20"
$radio_nsd.Location= "20,45" # $from radio_grp Location

$radio_nsd.Add_CheckedChanged({

	$listbox_mck.Hide()
	$listbox_pmd.Hide()
	$listbox_nsd.Show()
})
 
$contxt_nsd= New-Object System.Windows.Forms.ContextMenuStrip 

[void]$contxt_nsd.Items.Add("Cancel")
[void]$contxt_nsd.Items.Add("Folder")
[void]$contxt_nsd.Items.Add("Remove")

$contxt_nsd.Add_ItemClicked({

	switch([string]$_.ClickedItem){ # �L���X�g�K�v

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
$listbox_nsd.Size= "200,60"
$listbox_nsd.Location= "5,120"

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
		# [Windows.Forms.Control]::MousePosition | write-host #�ł�����
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
$radio_pmd.Size= "65,20"
$radio_pmd.Location= "20,70"

$radio_pmd.Add_CheckedChanged({

	$listbox_mck.Hide()
	$listbox_nsd.Hide()
	$listbox_pmd.Show()
})
 
$contxt_pmd= New-Object System.Windows.Forms.ContextMenuStrip 

[void]$contxt_pmd.Items.Add("Cancel")
[void]$contxt_pmd.Items.Add("Folder")
[void]$contxt_pmd.Items.Add("Remove")

$contxt_pmd.Add_ItemClicked({

	switch([string]$_.ClickedItem){ # �L���X�g�K�v

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
$listbox_pmd.Size= "200,60"
$listbox_pmd.Location= "5,120"

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
$label_ply.Text= "�v���C���[�t�@�C��"
$label_ply.Size= "190,15"
$label_ply.Location= "10,5"
 
$contxt_ply= New-Object System.Windows.Forms.ContextMenuStrip 

[void]$contxt_ply.Items.Add("Cancel")
[void]$contxt_ply.Items.Add("Open")
[void]$contxt_ply.Items.Add("Folder")
[void]$contxt_ply.Items.Add("Remove")

$contxt_ply.Add_ItemClicked({

	switch([string]$_.ClickedItem){ # �L���X�g�K�v

	'Cancel'{
		$listbox_ply.SelectedItem= $null
		break;

	}'Remove'{
		$script:ply.Remove([string]$listbox_ply.SelectedItem)
		$listbox_ply.Items.Remove([string]$listbox_ply.SelectedItem)
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
$listbox_ply.Size= "200,60"
$listbox_ply.Location= "5,30"

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
 
$stop_box= New-Object System.Windows.Forms.CheckBox 
$stop_box.Text= "/stop�R�}���h(nsfplay2.3, winamp)"
$stop_box.Size= "200,20"
$stop_box.Location= "10,95"
 
$label_ply_read= New-Object System.Windows.Forms.Label 
$label_ply_read.Text= "���R���p�C���O�Astop�R�}���h�o��"
$label_ply_read.Size= "190,15"
$label_ply_read.Location= "10,155"
  
# tab_dos 
	
$tab_dos= New-Object System.Windows.Forms.TabPage 
$tab_dos.Text= "dos"
 
$label_dos= New-Object System.Windows.Forms.Label 
$label_dos.Text= "�h�X�v�����v�g"
$label_dos.Size= "190,15"
$label_dos.Location= "10,5"
 
$contxt_dos= New-Object System.Windows.Forms.ContextMenuStrip 

[void]$contxt_dos.Items.Add("Cancel")
[void]$contxt_dos.Items.Add("Open")
[void]$contxt_dos.Items.Add("Folder")
[void]$contxt_dos.Items.Add("Remove")

$contxt_dos.Add_ItemClicked({

	switch([string]$_.ClickedItem){ # �L���X�g�K�v

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
$listbox_dos.Size= "200,60"
$listbox_dos.Location= "5,30"

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
 
$dos_box= New-Object System.Windows.Forms.CheckBox 
$dos_box.Text= "x64�Ή�"
$dos_box.Size= "200,20"
$dos_box.Location= "10,95"
 
$label_dos_read= New-Object System.Windows.Forms.Label 
$label_dos_read.Text= "��16bitPMD running 64bitOS"
$label_dos_read.Size= "190,15"
$label_dos_read.Location= "10,155"
  
# tab_edt 
	
$tab_edt= New-Object System.Windows.Forms.TabPage 
$tab_edt.Text= "editor"
 
$label_edt= New-Object System.Windows.Forms.Label 
$label_edt.Text= "�G�f�B�^�o�^"
$label_edt.Size= "190,15"
$label_edt.Location= "10,5"
 
$contxt_edt= New-Object System.Windows.Forms.ContextMenuStrip 

[void]$contxt_edt.Items.Add("Cancel")
[void]$contxt_edt.Items.Add("Open")
[void]$contxt_edt.Items.Add("Folder")
[void]$contxt_edt.Items.Add("Remove")

$contxt_edt.Add_ItemClicked({

	switch([string]$_.ClickedItem){ # �L���X�g�K�v

	'Cancel'{
		$listbox_edt.SelectedItem= $null
		break;

	}'Remove'{
		$script:edt.Remove([string]$listbox_edt.SelectedItem)
		$listbox_edt.Items.Remove([string]$listbox_edt.SelectedItem)
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
$listbox_edt.Size= "200,60"
$listbox_edt.Location= "5,30"

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
$label_edt_read.Text= "���G�f�B�^�Amml ���X�g�E�N���b�N"
$label_edt_read.Size= "190,15"
$label_edt_read.Location= "10,155"
# $label_edt_read.ForeColor= "Gray"
# $label_edt_read.BackColor= "White"

  
$ok_btn= New-Object System.Windows.Forms.Button 
$ok_btn.Text= "OK"
$ok_btn.Size= "75,25"
$ok_btn.Location= "65,234"

$ok_btn.DialogResult= "OK"

$ok_btn.Add_Click({

	$sub_f.Close() #.Add_FormClosing��
})
 
$cancel_btn= New-Object System.Windows.Forms.Button 
$cancel_btn.Text= "Cancel"
$cancel_btn.Size= "75,25"
$cancel_btn.Location= "145,234"

$cancel_btn.DialogResult= "Cancel"

$cancel_btn.Add_Click({

	$sub_f.Close() #.Add_FormClosing��
})
 
$sub_f= New-Object System.Windows.Forms.Form 
$sub_f.Text= "���ݒ�"
$sub_f.Size= "244,302"
$sub_f.Location= "150,0"
$sub_f.FormBorderStyle= "FixedSingle"
$sub_f.StartPosition= "WindowsDefaultLocation"
$sub_f.Icon= Icon_read "..\src\ST_icon.ico"
#$sub_f.ShowIcon= $False
$sub_f.MaximizeBox= $False
$sub_f.MinimizeBox= $False

$sub_f.TopMost= $True # �őO�ʂ�
# $sub_f.Owner= $frm

$sub_f.Add_Shown({

	$ok_btn.Select() # showdialog after forcus
})

$sub_f.Add_FormClosing({
 try{

  # $_.Cancel= $True # .ShowDialog()�̏ꍇ�A$sub_f���Ƃ��Ȃ��Ȃ�
  # write-host ("chk button: "+ $sub_f.DialogResult) # �I��button

  switch($sub_f.DialogResult){
  # 'None'{}		# �s�v

  'Cancel'{ break;	# �L�����Z����xml�������݃X���[

  }'OK'{
	switch($args_pram[2]){
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
$sub_menu_a.Text= "�ݒ胊�Z�b�g"

$sub_menu_a.Add_Click({	# �����Z�b�g
 try{

  switch(Attend){

  'OK'{
	$script:xml_set= [xml]$setting_xml

	$script:mml= @{}; $script:mck= @{}; $script:nsd= @{}; $script:pmd= @{}; ##$cmp= @{};
	$script:ply= @{}; $script:dmc= @{}; $script:edt= @{}; $script:dos= @{};

	Xml_read $script:xml_set.table

	switch($args_pram[2]){

	'all'{	Hash_read;	break;
	}'cut'{	Hash_read_cut
	}
	} #sw

	Write-Host "�������Z�b�g���܂���"
  }
  #'Cancel'{}
  } #sw

 }catch{
	echo $_.exception
 }
})

$sub_menu_sn=New-Object System.Windows.Forms.ToolStripSeparator
$sub_menu_n= New-Object System.Windows.Forms.ToolStripMenuItem
$sub_menu_n.Text= "�ݒ�I��"

$sub_menu_n.Add_Click({	# �ݒ�I��

	$sub_f.DialogResult= "OK"

	$sub_f.Close() #.Add_FormClosing��
})


$sub_menu_o= New-Object System.Windows.Forms.ToolStripMenuItem
# $sub_menu_o.Text= "PMD Option"

$sub_menu_opn= New-Object System.Windows.Forms.ToolStripMenuItem
$sub_menu_opn.Text= "OPN 4op"
$sub_menu_opn.Add_Click({

	$script:opts["option"]= Pmd_option "opn"
})

$sub_menu_opm= New-Object System.Windows.Forms.ToolStripMenuItem
$sub_menu_opm.Text= "OPM 4op"
$sub_menu_opm.ForeColor= "Gray"
$sub_menu_opm.Add_Click({

	$script:opts["option"]= Pmd_option "opm"
})

$sub_menu_sa=New-Object System.Windows.Forms.ToolStripSeparator

$sub_menu_opl= New-Object System.Windows.Forms.ToolStripMenuItem
$sub_menu_opl.Text= "OPL 2op"
$sub_menu_opl.ForeColor= "Gray"
$sub_menu_opl.Add_Click({

	$script:opts["option"]= Pmd_option "opl"
})

$sub_menu_towns= New-Object System.Windows.Forms.ToolStripMenuItem
$sub_menu_towns.Text= "TOWNS 4op"
$sub_menu_towns.ForeColor= "Gray"
$sub_menu_towns.Add_Click({

	$script:opts["option"]= Pmd_option "towns"
})
 	
$sub_menu_f.DropDownItems.AddRange(@($sub_menu_a,$sub_menu_sn,$sub_menu_n)) 
$sub_menu_o.DropDownItems.AddRange(@($sub_menu_opn,$sub_menu_opm,$sub_menu_sa,$sub_menu_opl,$sub_menu_towns))
$sub_mnu.Items.AddRange(@($sub_menu_f,$sub_menu_o))


$tab_mml.Controls.AddRange(@($label_mml,$listbox_mml,$label_dmc,$listbox_dmc))

$radio_grp.Controls.AddRange(@($radio_mck,$radio_nsd,$radio_pmd))
$tab_bin.Controls.AddRange(@($radio_grp,$listbox_mck,$listbox_nsd,$listbox_pmd))

$tab_ply.Controls.AddRange(@($label_ply,$listbox_ply,$stop_box,$label_ply_read))
$tab_dos.Controls.AddRange(@($label_dos,$listbox_dos,$dos_box,$label_dos_read))
$tab_edt.Controls.AddRange(@($label_edt,$listbox_edt,$label_edt_read))

# $tab.Controls.AddRange(@($tab_mml,$tab_bin,$tab_ply,$tab_dos,$tab_edt))

$sub_f.Controls.AddRange(@($sub_mnu,$tab,$ok_btn,$cancel_btn))
$sub_f.CancelButton= $cancel_btn	# [ESC]
$sub_f.AcceptButton= $ok_btn		# [Enter]
  
# ------ main 

 try{

  $args_pram= $Args

  $vals= $args_pram[0]
  $opts= $args_pram[1] # only memory

  # �L���X�g
  if((Test-Path '.\setting.xml') -eq $True){

	$xml_set= [xml](cat '.\setting.xml')
  }else{
	$xml_set= [xml]$setting_xml
  }

  # �A�z�z��


  $mml= @{}; $mck= @{}; $nsd= @{}; $pmd= @{}; ##$cmp= @{};
  $ply= @{}; $dmc= @{}; $edt= @{}; $dos= @{};

  Xml_read $script:xml_set.table

  switch($args_pram[2]){
  'all'{
	$sub_menu_o.Text= "PMD Option"

	$tab.Controls.AddRange(@($tab_mml,$tab_bin,$tab_ply,$tab_dos,$tab_edt))

 	Drag_drop "mml" $vals["mmlfile"] # D&D�����߁Amml hash�֎����o�^

	Hash_read # List��
	break;
  }'cut'{
	$sub_menu_o.Text= "PMD Auto Option"

	$tab.Controls.AddRange(@($tab_bin,$tab_ply,$tab_dos,$tab_edt))

	$script:opts["radio_bin"]= Box_radio $vals["compiler"] # hash�ݒ�

	Hash_read_cut # List��
  }
  } #sw

  $Sub_f.ShowDialog() > $null

  echo $vals $opts # return dato Safety Stopper

  Write-Host ("`r`n"+"`"���ݒ�`"���I�����܂�"+"`r`n")


 }catch{
	echo $_.exception
	Write-Host '"ERROR: Safety Stopper >> setting - main"'

 }finally{
 }
 
