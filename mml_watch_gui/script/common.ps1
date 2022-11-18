<# common.ps1 #> 
 
$ErrorActionPreference= "Stop" 

cd (Split-Path -Parent $MyInvocation.MyCommand.Path)
[Environment]::CurrentDirectory= pwd # working_dir set
 
# ---- WriterSetting ---- 

  $write_UTF= New-Object System.Text.UTF8Encoding($False) # UTF8 nonbom
  $write_JIS= [System.Text.Encoding]::GetEncoding(932) # shiftJIS


  # Xml名前空間WriterSettingクラス
  $write_xml= New-Object System.Xml.XmlWriterSettings

  # クラスのプロパティ
  $write_xml.Indent= $True
  $write_xml.IndentChars= ("`t") # \t
  $write_xml.Encoding= [Text.Encoding]::UTF8

  # $write_xml.Encoding= [Text.Encoding]::default # shiftJISとなる
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
	# write-host $x.OuterXml # チェック時

	# static Xml.XmlWriter 静的メンバのため
	$xml_sav= [Xml.XmlWriter]::Create($xml_file, $write_xml)

	$x.Save($xml_sav)

  }finally{
	$xml_sav.Close()
  }
 } #func



 
Function Chk_path([string]$file){ 

	if($file -eq ""){

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
  # pathないと通らない仕様ため

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
		$ff= Split_path $path_chk # unkhown出力


		$tt=  ('"'+ $ff[0]+  '": '+ $name+ '選択されてません')
		Write-Host (">"+ $tt)

		break;
	}1{
		$tt= ('"'+ $name+ 'パス先がありません: '+ $path_chk)
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
	#静的メソッド借用
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
 #[string[]]$ary= Split_path $arr[1] # 親の親 -> 不要


 [string[]]$out= "","","" # errlevel, ppmckc, nesasm

  if((Chk_path $mml) -ne 0){

	$out[0]= ('Mkmck>>"'+ $mml+ '": mmlがパス上にありません')
	Write-Host ("`r`n"+ $out[0])


  }elseif ($arr[0] -notmatch "ppmckc.*\.exe"){	# compiler path chk

	$out[0]= ('Mkmck>>"'+ $arr[0]+ '": ppmckc.exeではありません')
	Write-Host ("`r`n"+ $out[0])


  }elseif((Chk_path $bin) -ne 0){	# compiler path chk

	$out[0]= ('Mkmck>>"'+ $bin+ '": ppmckc.exeがパス上にありません')
	Write-Host ("`r`n"+ $out[0])

  }else{

	[string]$exe_ppmckc= '.\'+ $arr[0]
	[string]$exe_nesasm= '.\nesasm.exe'

	[string]$Env:DMC_INCLUDE= $dmc	# パス対応素でよし
	[string]$Env:PPMCK_BASEDIR= '..\'
	[string]$Env:NES_INCLUDE= '..\nes_include'

	[string[]]$brr= Split_path $mml
	[string]$dpn= Join-Path $brr[1] $brr[2]

	pushd $arr[1] # binのカレント

    try{

	if((Chk_path .\effect.h) -eq 0){ del .\effect.h }
	# 前のファイル消す

	# & $exe_ppmckc -i ('"'+ $dpn+ '.mml"') | Write-Host
	# esc["`""] で空白パス対応 -> ['"']

	$out[1]= & $exe_ppmckc $cmdline ($dpn+ '.mml') | Out-String
	# ->$dpn.h
	Write-Host $out[1]

	sleep -m 33

	if($LASTEXITCODE -eq 0){

		if((Chk_path $exe_nesasm) -ne 0){

			$out[0]= ( 'Mkmck>>"'+ $exe_nesasm+ '": nesasm.exeが見つかりません')
			Write-Host ("`r`n"+ $out[0])

		}else{

			if((Chk_path .\ppmck.nes) -eq 0){ del .\ppmck.nes }
			# 前のファイル消す

			# & $exe_nesasm -s -raw .\ppmck.asm | Write-Host # Command

			$out[2]= & $exe_nesasm -s -raw .\ppmck.asm | Out-String
			# ->ppmck.nes, effect.h, define.inc

			Write-Host $out[2]
			sleep -m 33

			#if($LASTEXITCODE -eq 0){ # nesasmはCODE吐かない
			#try{　# moveできないと、謎のerr出力ためtry catchだといまいち


			if((Chk_path .\ppmck.nes) -ne 0){

				$out[0]= ( 'Mkmck>>"ppmck.nes -> '+ ($brr[2]+ '.nsf')+'" OverWrite ERR' )


				[int]$count_chk= [System.Text.Encoding]::GetEncoding("shift_jis").GetByteCount($dpn+ '.h')

				if($count_chk -gt 106){

					$out[0]+= ("`r`n"+ 'Mkmck>>"'+ $count_chk+ 'byte" : パスが106byteを超えています')
				}

				Write-Host ("`r`n"+ $out[0])

			}else{
				move -force -literalpath .\ppmck.nes -destination ($dpn+ '.nsf')
				#再生時ファイルロックあらばエラーとなる注意

				del .\effect.h
				del .\define.inc
				del ($dpn+ '.h')

			#}catch{
			#	echo $_.exception
			}
		}
	}

    }catch{
	echo $_.exception

	$out[0]= ( 'Mkmck>>"'+ ($brr[2]+ '.mml')+ ' -> '+ ($brr[2]+ '.nsf')+'" Compile ERR' )
	Write-Host ("`r`n"+ $out[0])
    }
	popd # mml_watchへ
  }

 $out[1]+= "`r`n"+ $out[2]
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

	$out[0]= ('Mknsd>>"'+ $mml+ '": mmlがパス上にありません')
	Write-Host ("`r`n"+ $out[0])


  }elseif($arr[0] -notmatch "nsc[0-9]*\.exe"){	# compiler chk

	$out[0]= ('Mknsd>>"'+ $arr[0]+ '": nscxx.exeではありません')
	Write-Host ("`r`n"+ $out[0])


  }elseif((Chk_path $bin) -ne 0){	# compiler path chk

	$out[0]= ('Mknsd>>"'+ $bin+ '": nscxx.exeがパス上にありません')
	Write-Host ("`r`n"+ $out[0])


  }else{
	[string]$exe_nsc= '.\'+ $arr[0]
	[string]$Env:DMC_INCLUDE= $dmc	# パス対応素でよし

	[string[]]$brr= Split_path $mml
	[string]$dpn= Join-Path $brr[1] $brr[2]

	pushd $arr[1]

    try{
	# [System.IO.Directory]::SetCurrentDirectory((pwd))	# nsc 端末カレント認識あらばセット
	# write-host "[System.IO.Directory]::GetCurrentDirectory()"	# cd chk


	# & $exe_nsc -n ('"'+ $r[0]+ '.mml"') | write-host	# Command時、[&]必要
	$out[1]= & $exe_nsc $cmdline ($dpn+ '.mml') | Out-String # 改行付き出力

	Write-Host $out[1]

	sleep -m 33	# 異常時用ウェイト

	# [System.IO.Directory]::SetCurrentDirectory([Environment]::CurrentDirectory)
	# mml_watchへ

    }catch{
	echo $_.exception
	$out[0]= ( 'Mknsd>>"'+ ($brr[2]+ '.mml')+ ' -> '+ ($brr[2]+ '.nsf')+'" Compile ERR' )
	Write-Host ("`r`n"+ $out[0])
    }
	popd	# mml_watchへ
  }

 return $out
 # exit $LASTEXITCODE

 } #func
 
function Mkpmd([string[]]$arg){ # mkpmd.ps1 

 # $arg // mml,bin,dmc,cmdline,dos,x64

 [string]$mml= $arg[0]
 [string]$bin= $arg[1]
 [string]$dmc= $arg[2]
 [string[]]$cmdline= $arg[3] -split " " # string[]で来るため
 [string]$dos= $arg[4]
 [string]$x64= $arg[5]
 # write-host ("check:"+$cmdline)

 [string[]]$arr= Split_path $bin
 [string[]]$frr= Split_path $dos


 [string[]]$out= "",""

  if((Chk_path $mml) -ne 0){

	$out[0]= ('Mkpmd>>"'+ $mml+ '": mmlがパス上にありません')
	Write-Host ("`r`n"+ $out[0])


  }elseif($arr[0] -notmatch "MC.*\.EXE"){	# compiler chk

	$out[0]= ('Mkpmd>>"'+ $arr[0]+ '": MC.EXEではありません')
	Write-Host ("`r`n"+ $out[0])


  }elseif((Chk_path $bin) -ne 0){	# compiler path chk # pushdのエラー回避

	$out[0]= ('Mkpmd>>"'+ $bin+ '": MC.EXEがパス上にありません')
	Write-Host ("`r`n"+ $out[0])


  }elseif($frr[0] -notmatch '^.*msdos.*\.exe' -and $x64 -eq 'Checked'){	# dos chk

	$out[0]= ('Mkpmd>>"'+ $frr[0]+ '": msdos.exeではありません')
	Write-Host ("`r`n"+ $out[0])


  }elseif((Chk_path $dos) -ne 0 -and $x64 -eq 'Checked'){	# dos path chk

	$out[0]= ('Mkpmd>>"'+ $dos+ '": msdos.exeがパス上にありません')
	Write-Host ("`r`n"+ $out[0])


  }else{
	[string]$exe_mc= '.\'+ $arr[0]
	[string]$exe_dos= ""
	$exe_dos= $dos
	[string]$Env:PMD= $dmc	# パス対応素でよし

	[string[]]$brr= Split_path $mml
	[string]$dpn= Join-Path $brr[1] $brr[2]

	pushd $arr[1]

    try{
	copy -force -literalpath ($dpn+ '.mml') -destination '.\tmp.mml'
	# 同じフォルダでないとコンパイルできないため


	if($x64 -eq "Checked"){

		# & $exe_dos $exe_mc /v $opt 'tmp.mml' | Write-Host
		$out[1]= & $exe_dos $exe_mc $cmdline 'tmp.mml' | Out-String
		# Command時、[&]必要
	}else{
		# & $exe_mc /v $opt 'tmp.mml' | Write-Host
		$out[1]= & $exe_mc $cmdline 'tmp.mml' | Out-String
		# ".\tmp.mml" deha error
	}

	Write-Host $out[1]
	sleep -m 33


	if($LASTEXITCODE -eq 0){

		move -force -literalpath '.\tmp.m' -destination ($dpn+ '.m')
		# 元来のmmlの場所に移動

		if((Chk_path '.\tmp.mml') -eq 0){ del '.\tmp.mml' }
	}

    }catch{
	echo $_.exception
	$out[0]= ( 'Mkpmd>>"'+ ($brr[2]+ '.mml')+ ' -> '+ ($brr[2]+ '.m')+'" Compile ERR' )
	Write-Host ("`r`n"+ $out[0])
    }
	popd	# mml_watchへ
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

			# fmpmd /sダイアログで止まる
			# nsfplay2.4 -> errダイアログ出力

			switch($s[0]){
			'winamp.exe'{	& $plyer /stop; break;
			}'foobar2000.exe'{	& $plyer /stop
			}
			} # #sw

			break;
		}2{	& $plyer $path
		}
		} #sw
	}

	return $ss;
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
 
