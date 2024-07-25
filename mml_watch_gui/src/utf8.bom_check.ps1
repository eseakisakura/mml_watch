function Utf8_Encoder([string]$tt){

	[Byte[]]$te = cat  $tt -Encoding Byte -TotalCount 3 # 3byteのみ読む

	[string]$buf = ""
	if ($te.Length -ge 3 ) { # => 3byte chk - [0..2]ため

		[byte]$e= ""
		foreach($e in $te[0..2]){
			$buf += $e.ToString("x2")
		} #
	}


	if ($buf -eq "efbbbf") {
		#Write-Host ("utf8 bom スルー ------")
		#Write-Host ("バイナリ: "+ $te)
		#Write-Host ("文字コード utf8: "+ $buf)
		#Write-Host ("ファイル: "+ $tt)
		#Write-Host ("------------")
		#Write-Host ""
	}else{
		Write-Host ("utf8 bom へ変換必要 ======")
		Write-Host ("バイナリ: "+ $te)
		Write-Host ("文字コード not utf8: "+ $buf)
		Write-Host ("ファイル: "+ $tt)

		# stedフォーマットは使用不可 -> tabとか削除する
		#[string]$ss= (cat $tt | Out-String) # 改行込み
		#$ss | Out-File -Encoding UTF8 -FilePath $tt

		Write-Host ("============")
		Write-Host ""
	}
 } #func

function Path_read([string]$tt,[string]$xx){
	#[string[]]$rr= dir -Path $tt -Recurse -Include $xx # 階層込み
	[string[]]$rr= dir -Path $tt $xx  | %{ $_.fullname } # フルパス

	[string]$a= ""
	foreach($a in $rr){
		Utf8_Encoder $a
	} #
 } #func

Path_read "..\" "*.txt"
Path_read "..\" "*.ps1"
# Path_read "..\" "*.cmd"

Path_read "..\script" "*.ps1"
Path_read "..\script\preset" "*.*"
Path_read "..\script\header" "*.*"
Path_read "..\script\new" "*.mml"
Path_read "..\script\temp" "*.txt"

Path_read "..\src" "*.cs"
Path_read "..\src" "*.ps1"

Path_read "..\doc" "*.txt"

Path_read "..\sample\mck" "*.mml"
Path_read "..\sample\nsdlib" "*.mml"
Path_read "..\sample\pmd" "*.mml"

<#
#>

Read-Host "Fin"
