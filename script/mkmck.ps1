<# mkmck.ps1 #> 

[string[]]$r= $Args	# mml,bin,dmc

[string[]]$arr= Split_path $r[1]
[string[]]$ary= Split_path $arr[1] # 親の親


[string[]]$out= "","",""

  if((Chk_path $r[0]) -ne 0){

	$out[0]= ('"mkmck.ps1">>'+ $r[0]+ ': mmlがパス上にありません')
	Write-Host ("`r`n"+ $out[0])


  }elseif($arr[0] -ne 'ppmckc.exe'){	# compiler path chk

	$out[0]= ('"mkmck.ps1">>'+ $arr[0]+ ': ppmckc.exeではありません')
	Write-Host ("`r`n"+ $out[0])


  }elseif((Chk_path ($ary[1]+ '\bin')) -ne 0){	# pushdのエラー回避 $exe_ppmckc ga tame

	$out[0]= ('"mkmck.ps1">>'+ ($ary[1]+ '\bin')+ ': binフォルダが見つからない')
	Write-Host ("`r`n"+ $out[0])


  }else{
	[string]$exe_ppmckc= '.\bin\ppmckc.exe'
	[string]$exe_nesasm= '.\bin\nesasm.exe'

	[string]$Env:DMC_INCLUDE= $r[2]	# パス対応素でよし
	[string]$Env:PPMCK_BASEDIR= '.\'
	[string]$Env:NES_INCLUDE= '.\nes_include'

	[string[]]$brr= Split_path $r[0]
	[string]$dpn= Join-Path $brr[1] $brr[2]

	pushd $ary[1]

	if((Test-Path $exe_ppmckc) -eq $false){

		$out[0]= ( '"mkmck.ps1">>'+ $exe_ppmckc+ ': ppmckc.exeが見つかりません')
		Write-Host ("`r`n"+ $out[0])


	}else{
		if((Test-Path .\effect.h) -eq $true){ del .\effect.h }

		# esc[`"] 空白パス対応
		# & $exe_ppmckc -i ("`""+ $dpn+ ".mml`"") | Write-Host
		$out[1]= & $exe_ppmckc -i ("`""+ $dpn+ ".mml`"") | Out-String
		Write-Host $out[1]

		sleep -m 120

		if($LASTEXITCODE -eq 0){

			if((Test-Path $exe_nesasm) -eq $false){

				$out[0]= ( '"mkmck.ps1">>'+ $exe_nesasm+ ': nesasm.exeが見つかりません')
				Write-Host ("`r`n"+ $out[0])


			}else{
				if((Test-Path .\ppmck.nes) -eq $true){ del .\ppmck.nes }

				# & $exe_nesasm -s -raw .\ppmck.asm | Write-Host # Command
				$out[2]= & $exe_nesasm -s -raw .\ppmck.asm | Out-String
				Write-Host $out[2]
				sleep -m 120

				if($LASTEXITCODE -eq 0){

					move -force .\ppmck.nes ($dpn+ '.nsf')

					del .\effect.h
					del .\define.inc
					del ($dpn+ '.h')
				}
			}
		}
	}

	popd # mml_watchへ
  }

echo $out
# exit $LASTEXITCODE
