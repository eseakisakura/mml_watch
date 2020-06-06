<# common.ps1 #> 
 
$ErrorActionPreference= "Stop" 

cd (Split-Path -Parent $MyInvocation.MyCommand.Path)
[Environment]::CurrentDirectory= pwd # working_dir set
 
# ---- XmlWriterSetting ---- 

  # Xml名前空間WriterSettingクラス
  $write_xml= New-Object System.Xml.XmlWriterSettings

  # クラスのプロパティ
  $write_xml.Indent= $True
  $write_xml.IndentChars= ("`t") # \t
  $write_xml.Encoding= [Text.Encoding]::UTF8 # default= UTF8で出力 / shift_jis ha err
 
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

  $out[0]= [IO.Path]::GetFileName($f)
  $out[1]= [IO.Path]::GetDirectoryName($f)
  $out[2]= [IO.Path]::GetFileNameWithoutExtension($f)
  $out[3]= [IO.Path]::GetExtension($f)

  return $out

 } #func
 
function Editor_open([string]$str,[string]$chk){ 


  [int]$exe_err= Chk_path $str
  [int]$file_err= Chk_path $chk

  [string[]]$eor= "","",""

  if($exe_err -eq 0 -and $file_err -eq 0){

	& $str $chk

  }else{


	switch($exe_err){

	2{	$eor[0]= ('> エディタ 選択されてません'+ $str)
		break;
	}1{	$eor[0]= ('> エディタ パス先がありません'+ $str)
		# break;
	#}0{
	}
	} #sw

	switch($file_err){

	2{	$eor[1]= ('> mmlファイル 選択されてません'+ $chk)
		break;
	}1{
		$eor[1]= ('> mmlファイル パス先がありません'+ $chk)
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

		Invoke-Item $path

		break;
	}2{

		switch($sw){
		1{	$eor=  ('> ファイル 選択されてません'+ $path)
			break;
		}0{	$eor= ('> フォルダ 選択されてません'+ $path)
		}
		} #sw

		Write-Host $eor
		Write-Host ''

		break;
	}1{

		switch($sw){
		1{	$eor= ('> ファイルパス先がありません'+ $path)
			break;
		}0{	$eor= ('> フォルダパス先がありません'+ $path)
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
 
