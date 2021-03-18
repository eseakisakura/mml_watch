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
  # pathないと通らない仕様ため

  $out[0]= [System.IO.Path]::GetFileName($f)
  $out[1]= [System.IO.Path]::GetDirectoryName($f)
  $out[2]= [System.IO.Path]::GetFileNameWithoutExtension($f)
  $out[3]= [System.IO.Path]::GetExtension($f)

  return $out

 } #func
 
function Editor_open([string]$str,[string]$chk){ 


  [int]$exe_err= Chk_path $str
  [int]$file_err= Chk_path $chk

  [string[]]$eor= "","",""

  if($exe_err -eq 0 -and $file_err -eq 0){

	& $str ('"'+ $chk+ '"')

  }else{


	switch($exe_err){

	2{	$eor[0]= ('>"エディタ"選択されてません: '+ $str)
		break;
	}1{	$eor[0]= ('>"エディタ"パス先がありません: '+ $str)
		# break;
	#}0{
	}
	} #sw

	switch($file_err){

	2{	$eor[1]= ('>"ファイル"選択されてません: '+ $chk)
		break;
	}1{
		$eor[1]= ('>"ファイル"パス先がありません: '+ $chk)
		# break;
	#}0{
	}
	} #sw


	if($eor[0] -ne "" -and $eor[1] -ne ""){

		$eor[2]= $eor[0]+ "`r`n"+ $eor[1]

		Write-Host $eor[2]
		Write-Host ''

	}elseif($eor[0] -ne ""){

		$eor[2]=  $eor[0]

		Write-Host $eor[2]
		Write-Host ''

	}elseif($eor[1] -ne ""){

		$eor[2]=  $eor[1]

		Write-Host $eor[2]
		Write-Host ''
	}
  }
  return $eor[2]

} #func
 
function Folder_open([int]$sw,[string]$path){ 


	[string]$eor= ""

	switch(Chk_path $path){

	0{	# folder,file open

		switch($sw){
		1{
			[string[]]$arr= Split_path $path # folder path split
			$path= $arr[1]
			break;

		}0{
		}
		} #sw

		Invoke-Item "$path"

		break;
	}2{

		switch($sw){
		1{	$eor=  ('> ファイル 選択されてません: '+ $path)
			break;
		}0{	$eor= ('> フォルダ 選択されてません: '+ $path)
		}
		} #sw

		Write-Host $eor
		Write-Host ''

		break;
	}1{

		switch($sw){
		1{	$eor= ('> ファイルパス先がありません: '+ $path)
			break;
		}0{	$eor= ('> フォルダパス先がありません: '+ $path)
		}
		} #sw

		Write-Host $eor
		Write-Host ''
	}
	} #sw

	return $eor
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


[string[]]$out= "","","" # errlevel,ppmckc,nesasm

  if((Chk_path $mml) -ne 0){

	$out[0]= ('Mkmck>>"'+ $mml+ '": mmlがパス上にありません')
	Write-Host ("`r`n"+ $out[0])


  }elseif ($arr[0] -notmatch '^.*ppmckc.*\.exe'){	# compiler path chk

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

	pushd $arr[1]

    try{
	if((Test-Path .\effect.h) -eq $true){ del .\effect.h }
	# 前のファイル消す

	# esc["`""] で空白パス対応 -> ['"']
	# & $exe_ppmckc -i ('"'+ $dpn+ '.mml"') | Write-Host
	$out[1]= & $exe_ppmckc $cmdline ("`""+ $dpn+ ".mml`"") | Out-String
	Write-Host $out[1]

	sleep -m 120

	if($LASTEXITCODE -eq 0){

		if((Test-Path $exe_nesasm) -eq $false){

			$out[0]= ( 'Mkmck>>"'+ $exe_nesasm+ '": nesasm.exeが見つかりません')
			Write-Host ("`r`n"+ $out[0])

		}else{
			if((Test-Path .\ppmck.nes) -eq $true){ del .\ppmck.nes }
			# 前のファイル消す

			# & $exe_nesasm -s -raw .\ppmck.asm | Write-Host # Command
			$out[2]= & $exe_nesasm -s -raw .\ppmck.asm | Out-String
			Write-Host $out[2]
			sleep -m 120

			if((Test-Path .\ppmck.nes) -eq $true){
			#if($LASTEXITCODE -eq 0){ # nesasmはCODE吐かない
			#try{
				# moveできないと謎のerr出力ためtry catchだといまいち
				move -force .\ppmck.nes ($dpn+ '.nsf')
				#再生時ファイルロックあらばエラーとなる注意

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
	popd # mml_watchへ
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

	$out[0]= ('Mknsd>>"'+ $mml+ '": mmlがパス上にありません')
	Write-Host ("`r`n"+ $out[0])


  }elseif($arr[0] -notmatch '^.*nsc.*\.exe'){	# compiler chk

	$out[0]= ('Mknsd>>"'+ $arr[0]+ '": nsc.exeではありません')
	Write-Host ("`r`n"+ $out[0])


  }elseif((Chk_path $bin) -ne 0){	# compiler path chk

	$out[0]= ('Mknsd>>"'+ $bin+ '": nsc.exeがパス上にありません')
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
	$out[1]= & $exe_nsc $cmdline ('"'+ $dpn+ '.mml"') | Out-String

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


  }elseif($arr[0] -notmatch '^.*MC.*\.EXE'){	# compiler chk

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

		if((Test-Path '.\tmp.mml') -eq $true){ del '.\tmp.mml' }
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
 
# ------ main 

 try{

	[string[]]$args_str= $Args


	switch($args_str[0]){
	'mml_watch'{	.\mml_watch.ps1;	break;
	}'fm_editor'{	.\fm_editor.ps1;	break;
	}'arp_gene'{	.\arp_gene.ps1
	}
	} #sw

 }catch{
	echo $_.exception
	Write-Host '"ERROR: Safety Stopper >> .\common.ps1 - main"'

 }finally{
 }
 
