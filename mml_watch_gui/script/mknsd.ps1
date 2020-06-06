<# mknsd.ps1 #> 

[string[]]$r= $Args	# mml,bin,dmc

[string[]]$arr= Split_path $r[1]

[string[]]$out= "",""

  if((Chk_path $r[0]) -ne 0){

	$out[0]= ('"mknsd.ps1">>'+ $r[0]+ ': mmlがパス上にありません')
	Write-Host ("`r`n"+ $out[0])


  }elseif($arr[0] -ne 'nsc.exe'){	# compiler chk

	$out[0]= ('"mknsd.ps1">>'+ $arr[0]+ ': nsc.exeではありません')
	Write-Host ("`r`n"+ $out[0])


  }elseif((Chk_path $r[1]) -ne 0){	# compiler path chk

	$out[0]= ('"mknsd.ps1">>'+ $r[1]+ ': nsc.exeがパス上にありません')
	Write-Host ("`r`n"+ $out[0])


  }else{
	[string]$exe_nsc= '.\'+ $arr[0]
	[string]$Env:DMC_INCLUDE= $r[2]	# パス対応素でよし

	[string[]]$brr= Split_path $r[0]
	[string]$dpn= Join-Path $brr[1] $brr[2]

	pushd $arr[1]

	# [IO.Directory]::SetCurrentDirectory((pwd))		# nsc 端末カレント認識あらばセット	# write-host "[IO.Directory]::GetCurrentDirectory()"	# cd chk

	# & $exe_nsc -n -e ('"'+ $r[0]+ '.mml"') | write-host	# Command時、[&]必要
	$out[1]= & $exe_nsc -n ('"'+ $dpn+ '.mml"') | Out-String
	# -e 標準エラー出力へ出力

	Write-Host $out[1]

	sleep -m 120	# 異常時用ウェイト

	# [IO.Directory]::SetCurrentDirectory([Environment]::CurrentDirectory)
	# mml_watchへ

	popd	# mml_watchへ
  }

echo $out
# exit $LASTEXITCODE
