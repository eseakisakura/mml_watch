<# mkpmd.ps1 #> 

[string[]]$r= $Args	# mml,bin,dmc,dos,option,x64

[string[]]$arr= Split_path $r[1]
[string[]]$err= Split_path $r[3]


[string[]]$out= "",""

  if((Chk_path $r[0]) -ne 0){

	$out[0]= ('"mkpmd.ps1">>'+ $r[0]+ ': mmlがパス上にありません')
	Write-Host ("`r`n"+ $out[0])


  }elseif($arr[0] -ne 'mc.exe'){	# compiler chk

	$out[0]= '"mkpmd.ps1">>'+ $arr[0]+ ': mc.exeではありません'
	Write-Host ("`r`n"+ $out[0])


  }elseif((Chk_path $r[1]) -ne 0){	# compiler path chk # pushdのエラー回避

	$out[0]= ('"mkpmd.ps1">>'+ $r[1]+ ': mc.exeがパス上にありません')
	Write-Host ("`r`n"+ $out[0])


  }elseif($err[0] -ne "msdos.exe" -and $r[5] -eq "Checked"){	# dos chk

	$out[0]= ('"mkpmd.ps1">>'+ $err[0]+ ': msdos.exeではありません')
	Write-Host ("`r`n"+ $out[0])


  }elseif((Chk_path $r[3]) -ne 0 -and $r[5] -eq "Checked"){	# dos path chk

		$out[0]= ('"mkpmd.ps1">>'+ $r[3]+ ': msdos.exeがパス上にありません')
		Write-Host ("`r`n"+ $out[0])


  }else{
	[string]$exe_mc= '.\'+ $arr[0]
	[string]$exe_dos= $r[3]

	switch($r[4]){
	'opn'{	[string]$opt= '/n';	break;
	}'opl'{	[string]$opt= '/l';	break;
	}'opm'{	[string]$opt= '/m';	break;
	}'towns'{	[string]$opt= '/t'
	}
	} #sw


	[string]$Env:PMD= $r[2]	# パス対応素でよし

	[string[]]$brr= Split_path $r[0]
	[string]$dpn= Join-Path $brr[1] $brr[2]

	pushd $arr[1]

	copy -force -literalpath ($dpn+ '.mml') -destination '.\tmp.mml'
	# 同じフォルダでないとコンパイルできないため


	if($r[5] -eq "Checked"){

		# & $exe_dos $exe_mc /v $opt 'tmp.mml' | Write-Host
		$out[1]= & $exe_dos $exe_mc /v $opt 'tmp.mml' | Out-String
		# Command時、[&]必要
	}else{
		# & $exe_mc /v $opt 'tmp.mml' | Write-Host
		$out[1]= & $exe_mc /v $opt 'tmp.mml' | Out-String
		# ".\tmp.mml" deha error
	}

	Write-Host $out[1]
	sleep -m 120


	if($LASTEXITCODE -eq 0){

		move -force -literalpath '.\tmp.m' -destination ($dpn+ '.m')
		# 元来のmmlの場所に移動

		if((Test-Path '.\tmp.mml') -eq $true){ del '.\tmp.mml' }
	}

	popd	# mml_watchへ

  }

echo $out
# exit $LASTEXITCODE
