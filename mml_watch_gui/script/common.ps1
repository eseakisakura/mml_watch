<# common.ps1 #> 
 
$ErrorActionPreference= "Stop" 

cd (Split-Path -Parent $MyInvocation.MyCommand.Path)
[Environment]::CurrentDirectory= pwd # working_dir set
 
# ---- WriterSetting ---- 

  $write_UTF= New-Object System.Text.UTF8Encoding($False) # UTF8 nonbom
  $write_JIS= [System.Text.Encoding]::GetEncoding(932) # shiftJIS


  # Xml���O���WriterSetting�N���X
  $write_xml= New-Object System.Xml.XmlWriterSettings

  # �N���X�̃v���p�e�B
  $write_xml.Indent= $True
  $write_xml.IndentChars= ("`t") # \t
  $write_xml.Encoding= [Text.Encoding]::UTF8

  # $write_xml.Encoding= [Text.Encoding]::default # shiftJIS�ƂȂ�
  # default -> .net4 shift_jis / .net5 utf8lessbom
 
function Mml_writer([string]$lis,[string]$out,[int]$sw){ 

  try{
	switch($sw){
	1{
		[System.IO.File]::WriteAllLines($out, $lis, $write_JIS)
		break;
	}2{
		[System.IO.File]::WriteAllLines($out, $lis, $write_UTF)
		break;
	}default{

		$lis | Out-File -Encoding oem -FilePath $out # shiftJIS
	}
	} #sw

  }finally{
	# $xml_sav.Close()
  }
 } #func
 
function File_writer($x, [string]$xml_file){ 

  try{
	# $x= $script:xml
	# write-host $x.OuterXml # �`�F�b�N��

	# static Xml.XmlWriter �ÓI�����o�̂���
	$xml_sav= [Xml.XmlWriter]::Create($xml_file, $write_xml)

	$x.Save($xml_sav)

  }finally{
	$xml_sav.Close()
  }
 } #func



 
Function Chk_path([string]$file){ 

	if($file -eq ''){

		return 2
		# Test-Path path bind err fuuji

	}elseif((Test-Path $file) -eq $False){

		return 1

	}else{
		return 0
	}
 } #func
 
Function Split_path([string]$f){ 

  [string[]]$out= "","","",""

  if($f -eq ""){ $f= "unknown" }
  # path�Ȃ��ƒʂ�Ȃ��d�l����

  $out[0]= [System.IO.Path]::GetFileName($f)
  $out[1]= [System.IO.Path]::GetDirectoryName($f)
  $out[2]= [System.IO.Path]::GetFileNameWithoutExtension($f)
  $out[3]= [System.IO.Path]::GetExtension($f)

  return $out

 } #func
 
function Eor_open([string]$path_chk,[string]$name){ 

	[string]$tt= ""

	switch(Chk_path $path_chk){
	2{
		[string[]]$ff= "","","",""
		$ff= Split_path $path_chk # unkhown�o��


		$tt=  ('"'+ $name+ '"�I������Ă܂���: '+ $ff[0])
		Write-Host (">"+ $tt)

		break;
	}1{
		$tt= ('"'+ $name+ '�p�X�悪����܂���: '+ $path_chk)
		Write-Host (">"+ $tt)

		break;
	#}0{
	}
	} #sw

	return $tt
 } #func
 
function Editor_open([string]$edt_path,[string]$file_path){ 


	[string[]]$ss= "","",""

	$ss[0]= Eor_open $edt_path "Editor"
	$ss[1]= Eor_open $file_path "File"


	if($ss[0] -ne "" -and $ss[1] -ne ""){

		$ss[2]= $ss[0]+ "`r`n"+ $ss[1]

	}elseif($ss[0] -ne ""){

		$ss[2]=  $ss[0]

	}elseif($ss[1] -ne ""){

		$ss[2]=  $ss[1]
	}else{

		& $edt_path ('"'+ $file_path+ '"')
	}

	return $ss[2]
} #func
 	
function Folder_open([int]$sw,[string]$path){ 

	[string[]]$tt= "Folder","File"

	[string]$ss= Eor_open $path $tt[$sw]

	if($ss -eq ""){

		# 0:folder path, 1: file path

		switch($sw){
		1{
			[string[]]$arr= Split_path $path
			# folder path split

			$path= $arr[1]
			break;
		#}0{
		}
		} #sw

		Invoke-Item "$path"
	}

	return $ss
} #func
 
function Icon_read([string]$tt){ 	

  switch(Chk_path $tt){
  0{
	[System.Drawing.Icon]::ExtractAssociatedIcon($tt)
	#�ÓI���\�b�h�ؗp
  }
  } #sw
} #func
 
# mkxxx.ps1 ------ 
 
function Mkmck([string[]]$arg){ # mkmck.ps1 

# $arg // mml,bin,dmc,cmdline

[string]$mml= $arg[0]
[string]$bin= $arg[1]
[string]$dmc= $arg[2]
[string[]]$cmdline= $arg[3] -split " "
# write-host ("check1:"+$cmdline)

[string[]]$arr= Split_path $bin
#[string[]]$ary= Split_path $arr[1] # �e�̐e -> �s�v


[string[]]$out= "","","" # errlevel,ppmckc,nesasm

  if((Chk_path $mml) -ne 0){

	$out[0]= ('Mkmck>>"'+ $mml+ '": mml���p�X��ɂ���܂���')
	Write-Host ("`r`n"+ $out[0])


  }elseif ($arr[0] -notmatch '^.*ppmckc.*\.exe'){	# compiler path chk

	$out[0]= ('Mkmck>>"'+ $arr[0]+ '": ppmckc.exe�ł͂���܂���')
	Write-Host ("`r`n"+ $out[0])


  }elseif((Chk_path $bin) -ne 0){	# compiler path chk

	$out[0]= ('Mkmck>>"'+ $bin+ '": ppmckc.exe���p�X��ɂ���܂���')
	Write-Host ("`r`n"+ $out[0])


  }else{
	[string]$exe_ppmckc= '.\'+ $arr[0]
	[string]$exe_nesasm= '.\nesasm.exe'

	[string]$Env:DMC_INCLUDE= $dmc	# �p�X�Ή��f�ł悵
	[string]$Env:PPMCK_BASEDIR= '..\'
	[string]$Env:NES_INCLUDE= '..\nes_include'

	[string[]]$brr= Split_path $mml
	[string]$dpn= Join-Path $brr[1] $brr[2]

	pushd $arr[1]

    try{
	if((Test-Path .\effect.h) -eq $true){ del .\effect.h }
	# �O�̃t�@�C������

	# esc["`""] �ŋ󔒃p�X�Ή� -> ['"']
	# & $exe_ppmckc -i ('"'+ $dpn+ '.mml"') | Write-Host
	$out[1]= & $exe_ppmckc $cmdline ("`""+ $dpn+ ".mml`"") | Out-String
	Write-Host $out[1]

	sleep -m 120

	if($LASTEXITCODE -eq 0){

		if((Test-Path $exe_nesasm) -eq $false){

			$out[0]= ( 'Mkmck>>"'+ $exe_nesasm+ '": nesasm.exe��������܂���')
			Write-Host ("`r`n"+ $out[0])

		}else{
			if((Test-Path .\ppmck.nes) -eq $true){ del .\ppmck.nes }
			# �O�̃t�@�C������

			# & $exe_nesasm -s -raw .\ppmck.asm | Write-Host # Command
			$out[2]= & $exe_nesasm -s -raw .\ppmck.asm | Out-String
			Write-Host $out[2]
			sleep -m 120

			if((Test-Path .\ppmck.nes) -eq $true){
			#if($LASTEXITCODE -eq 0){ # nesasm��CODE�f���Ȃ�
			#try{
				# move�ł��Ȃ��Ɠ��err�o�͂���try catch���Ƃ��܂���
				move -force .\ppmck.nes ($dpn+ '.nsf')
				#�Đ����t�@�C�����b�N����΃G���[�ƂȂ钍��

				# del .\effect.h
				del .\define.inc
				del ($dpn+ '.h')
			#}catch{
			}else{
			#	echo $_.exception
				$out[0]= ( 'Mkmck>>"ppmck.nes -> '+ ($brr[2]+ '.nsf')+'" OverWrite ERR' )
				Write-Host ("`r`n"+ $out[0])
			}
		}
	}

    }catch{
	echo $_.exception
	$out[0]= ( 'Mkmck>>"'+ ($brr[2]+ '.mml')+ ' -> '+ ($brr[2]+ '.nsf')+'" Compile ERR' )
	Write-Host ("`r`n"+ $out[0])
    }
	popd # mml_watch��
  }

return $out
# exit $LASTEXITCODE

 } #func
 
function Mknsd([string[]]$arg){ # mknsd.ps1 

# $arg // mml,bin,dmc,cmdline

[string]$mml= $arg[0]
[string]$bin= $arg[1]
[string]$dmc= $arg[2]
[string[]]$cmdline= $arg[3] -split " "
# write-host ("check1:"+$cmdline)

[string[]]$arr= Split_path $bin

[string[]]$out= "",""

  if((Chk_path $mml) -ne 0){

	$out[0]= ('Mknsd>>"'+ $mml+ '": mml���p�X��ɂ���܂���')
	Write-Host ("`r`n"+ $out[0])


  }elseif($arr[0] -notmatch '^.*nsc.*\.exe'){	# compiler chk

	$out[0]= ('Mknsd>>"'+ $arr[0]+ '": nsc.exe�ł͂���܂���')
	Write-Host ("`r`n"+ $out[0])


  }elseif((Chk_path $bin) -ne 0){	# compiler path chk

	$out[0]= ('Mknsd>>"'+ $bin+ '": nsc.exe���p�X��ɂ���܂���')
	Write-Host ("`r`n"+ $out[0])


  }else{
	[string]$exe_nsc= '.\'+ $arr[0]
	[string]$Env:DMC_INCLUDE= $dmc	# �p�X�Ή��f�ł悵

	[string[]]$brr= Split_path $mml
	[string]$dpn= Join-Path $brr[1] $brr[2]

	pushd $arr[1]

    try{
	# [System.IO.Directory]::SetCurrentDirectory((pwd))	# nsc �[���J�����g�F������΃Z�b�g
	# write-host "[System.IO.Directory]::GetCurrentDirectory()"	# cd chk


	# & $exe_nsc -n ('"'+ $r[0]+ '.mml"') | write-host	# Command���A[&]�K�v
	$out[1]= & $exe_nsc $cmdline ('"'+ $dpn+ '.mml"') | Out-String

	Write-Host $out[1]

	sleep -m 33	# �ُ펞�p�E�F�C�g

	# [System.IO.Directory]::SetCurrentDirectory([Environment]::CurrentDirectory)
	# mml_watch��

    }catch{
	echo $_.exception
	$out[0]= ( 'Mknsd>>"'+ ($brr[2]+ '.mml')+ ' -> '+ ($brr[2]+ '.nsf')+'" Compile ERR' )
	Write-Host ("`r`n"+ $out[0])
    }
	popd	# mml_watch��
  }

return $out
# exit $LASTEXITCODE

 } #func
 
function Mkpmd([string[]]$arg){ # mkpmd.ps1 

# $arg // mml,bin,dmc,cmdline,dos,x64

[string]$mml= $arg[0]
[string]$bin= $arg[1]
[string]$dmc= $arg[2]
[string[]]$cmdline= $arg[3] -split " " # string[]�ŗ��邽��
[string]$dos= $arg[4]
[string]$x64= $arg[5]
# write-host ("check:"+$cmdline)

[string[]]$arr= Split_path $bin
[string[]]$frr= Split_path $dos


[string[]]$out= "",""

  if((Chk_path $mml) -ne 0){

	$out[0]= ('Mkpmd>>"'+ $mml+ '": mml���p�X��ɂ���܂���')
	Write-Host ("`r`n"+ $out[0])


  }elseif($arr[0] -notmatch '^.*MC.*\.EXE'){	# compiler chk

	$out[0]= ('Mkpmd>>"'+ $arr[0]+ '": MC.EXE�ł͂���܂���')
	Write-Host ("`r`n"+ $out[0])


  }elseif((Chk_path $bin) -ne 0){	# compiler path chk # pushd�̃G���[���

	$out[0]= ('Mkpmd>>"'+ $bin+ '": MC.EXE���p�X��ɂ���܂���')
	Write-Host ("`r`n"+ $out[0])


  }elseif($frr[0] -notmatch '^.*msdos.*\.exe' -and $x64 -eq 'Checked'){	# dos chk

	$out[0]= ('Mkpmd>>"'+ $frr[0]+ '": msdos.exe�ł͂���܂���')
	Write-Host ("`r`n"+ $out[0])


  }elseif((Chk_path $dos) -ne 0 -and $x64 -eq 'Checked'){	# dos path chk

	$out[0]= ('Mkpmd>>"'+ $dos+ '": msdos.exe���p�X��ɂ���܂���')
	Write-Host ("`r`n"+ $out[0])


  }else{
	[string]$exe_mc= '.\'+ $arr[0]
	[string]$exe_dos= ""
	$exe_dos= $dos
	[string]$Env:PMD= $dmc	# �p�X�Ή��f�ł悵

	[string[]]$brr= Split_path $mml
	[string]$dpn= Join-Path $brr[1] $brr[2]

	pushd $arr[1]

    try{
	copy -force -literalpath ($dpn+ '.mml') -destination '.\tmp.mml'
	# �����t�H���_�łȂ��ƃR���p�C���ł��Ȃ�����


	if($x64 -eq "Checked"){

		# & $exe_dos $exe_mc /v $opt 'tmp.mml' | Write-Host
		$out[1]= & $exe_dos $exe_mc $cmdline 'tmp.mml' | Out-String
		# Command���A[&]�K�v
	}else{
		# & $exe_mc /v $opt 'tmp.mml' | Write-Host
		$out[1]= & $exe_mc $cmdline 'tmp.mml' | Out-String
		# ".\tmp.mml" deha error
	}

	Write-Host $out[1]
	sleep -m 33


	if($LASTEXITCODE -eq 0){

		move -force -literalpath '.\tmp.m' -destination ($dpn+ '.m')
		# ������mml�̏ꏊ�Ɉړ�

		if((Test-Path '.\tmp.mml') -eq $true){ del '.\tmp.mml' }
	}

    }catch{
	echo $_.exception
	$out[0]= ( 'Mkpmd>>"'+ ($brr[2]+ '.mml')+ ' -> '+ ($brr[2]+ '.m')+'" Compile ERR' )
	Write-Host ("`r`n"+ $out[0])
    }
	popd	# mml_watch��
  }

return $out
# exit $LASTEXITCODE

 } #func
 
function Player_open([int]$num,[string]$plyer,[string]$path){ 

	[string]$ss= Eor_open $plyer "Player"

	if($ss -eq ""){

		switch($num){
		0{
			& $plyer
			break;
		}1{
			[string[]]$s= Split_path $plyer

			# fmpmd /s�_�C�A���O�Ŏ~�܂�
			# nsfplay2.4 -> err�_�C�A���O�o��

			switch($s[0]){
			'winamp.exe'{	& $plyer /stop; break;
			}'foobar.exe'{	& $plyer /stop
			}
			} #sw

			break;
		}2{	& $plyer $path
		}
		} #sw

	}else{
		switch($num){
		0{	return $ss;
		}
		} #sw
	}
} #func
 
# ------ main 

 try{

	[string[]]$args_str= $Args


	switch($args_str[0]){
	'mml_watch'{	.\mml_watch.ps1 $args_str[1]; break;
	}'fm_editor'{	.\fm_editor.ps1; break;
	}'arp_gene'{	.\arp_gene.ps1
	}
	} #sw

 }catch{
	echo $_.exception
	Write-Host '"ERROR: Safety Stopper >> .\common.ps1 - main"'

 }finally{
 }
 
