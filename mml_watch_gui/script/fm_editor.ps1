<# fm_editor.ps1 #> 

Write-Host ('"FM音色エディタ"を起動します')
 
$xml_editor= @' 
<table>
	<opt>
		<tray value="True"/>
		<autosave value="True"/>
		<oct value="o4"/>
		<zero value="False"/>
		<ten value="False"/>
		<type value="nsd"/>
		<style value="pmd"/>
		<open value="False"/>
		<br />
		<bai value="2"/>
		<adjust value="20"/>
		<wait value="2"/>
		<layout value="nomal"/>
		<mode value="light"/>
		<color value="natural"/>
		<clickplay value="True"/>
		<knob value="AR,AR,AR,AR"/>
		<chk_dos value="Checked"/>
		<radio_bin value="nsd" />
	</opt>
	<val>
		<!-- 拡張性の加味 -->
		<mck value=""/>
		<nsd value=""/>
		<pmd value=""/>
		<cmp value=""/>
		<ply value=""/>
		<dos value=""/>
		<edt value=""/>
	</val>
	<presetstore name="" param="">
	<!-- preset import canncel時のため -->
		<vrc number="">
			<M1 value="" />
			<CA value="" />
		</vrc>
		<opl number="">
			<M1 value="" />
			<CA value="" />
		</opl>
		<opn number="">
			<M3 value="" />
			<M2 value="" />
			<M1 value="" />
			<CA value="" />
		</opn>
		<opm number="">
			<M3 value="" />
			<M2 value="" />
			<M1 value="" />
			<CA value="" />
		</opm>
	</presetstore>
	<resetting name="" param="">
	<!-- Reset Parameter用、正常chkため -->
		<vrc number="">
			<M1 value="" />
			<CA value="" />
		</vrc>
		<opl number="">
			<M1 value="" />
			<CA value="" />
		</opl>
		<opn number="">
			<M3 value="" />
			<M2 value="" />
			<M1 value="" />
			<CA value="" />
		</opn>
		<opm number="">
			<M3 value="" />
			<M2 value="" />
			<M1 value="" />
			<CA value="" />
		</opm>
	</resetting>
	<autosave name="" param="">
		<vrc number="">
			<M1 value="" />
			<CA value="" />
		</vrc>
		<opl number="">
			<M1 value="" />
			<CA value="" />
		</opl>
		<opn number="">
			<M3 value="" />
			<M2 value="" />
			<M1 value="" />
			<CA value="" />
		</opn>
		<opm number="">
			<M3 value="" />
			<M2 value="" />
			<M1 value="" />
			<CA value="" />
		</opm>
	</autosave>
	<slot>
		<A name="" number="" param="">
			<M3 value="" />
			<M2 value="" />
			<M1 value="" />
			<CA value="" />
		</A>
		<B name="" number="" param="">
			<M3 value="" />
			<M2 value="" />
			<M1 value="" />
			<CA value="" />
		</B>
		<C name="" number="" param="">
			<M3 value="" />
			<M2 value="" />
			<M1 value="" />
			<CA value="" />
		</C>
		<D name="" number="" param="">
			<M3 value="" />
			<M2 value="" />
			<M1 value="" />
			<CA value="" />
		</D>
		<E name="" number="" param="">
			<M3 value="" />
			<M2 value="" />
			<M1 value="" />
			<CA value="" />
		</E>
		<F name="" number="" param="">
			<M3 value="" />
			<M2 value="" />
			<M1 value="" />
			<CA value="" />
		</F>
		<G name="" number="" param="">
			<M3 value="" />
			<M2 value="" />
			<M1 value="" />
			<CA value="" />
		</G>
		<H name="" number="" param="">
			<M3 value="" />
			<M2 value="" />
			<M1 value="" />
			<CA value="" />
		</H>
	</slot>
</table>
'@
 
# function ====== 
 
# color 
	 
Function Line_highlight([array]$rr){ 

	switch(Itm){ # Chip_position $script:xye2
	'2op'{
		$gpw.FillRectangle($rr[0],$xye2[0],$xye2[1],$xye2[2],$xye2[3])
		$gpw.FillRectangle($rr[0],$xye2[4],$xye2[5],$xye2[6],$xye2[7])
		# $buffw.Render($gpw);
		$Pictbw.Refresh()

		sleep -m 166

		$gpw.FillRectangle($rr[1],$xye2[0],$xye2[1],$xye2[2],$xye2[3])
		$gpw.FillRectangle($rr[1],$xye2[4],$xye2[5],$xye2[6],$xye2[7])
		# $buffw.Render($gpw);
		$Pictbw.Refresh()

		break;
	}'4op'{
		$gpb.FillRectangle($rr[0],$xye4[0],$xye4[1],$xye4[2],$xye4[3])
		$gpb.FillRectangle($rr[0],$xye4[4],$xye4[5],$xye4[6],$xye4[7])
		# $buffb.Render($gpb);
		$Pictbg.Refresh()

		sleep -m 166

		$gpb.FillRectangle($rr[1],$xye4[0],$xye4[1],$xye4[2],$xye4[3])
		$gpb.FillRectangle($rr[1],$xye4[4],$xye4[5],$xye4[6],$xye4[7])
		# $buffb.Render($gpb);
		$Pictbg.Refresh()
	}
	} #sw
 } # func
 
function Monotone_select([string]$out){ 

	switch($out){
 	'Alg_'{	# BG_set

		switch($key["mode"]){
		'dark'{
			[array]$qq= @($Whwpen,$Whbrush,$black,$Blsolid)
			break;
		}'light'{
			[array]$qq= @($Blwpen,$Blbrush,$white,$Whsolid)
		}
		} #sw

		return $qq
		break;

	}'lisn_btn'{

		switch($key["mode"]){
		'dark'{
			[array]$qq= @($Tbrush,$Blsolid)
			break;
		}'light'{
			[array]$qq= @($Tbrush,$Whsolid)
		}
		} #sw

		Line_highlight $qq
		break;

	}'conv_btn'{

		switch($key["mode"]){
		'dark'{
			[array]$qq= @($Pbrush,$Blsolid)
			break;
		}'light'{
			[array]$qq= @($Pbrush,$Whsolid)
		}
		} #sw

		Line_highlight $qq
		break;

	}'conv2_btn'{

		switch($key["mode"]){
		'dark'{
			[array]$qq= @($Kbrush,$Blsolid)
			break;
		}'light'{
			[array]$qq= @($Kbrush,$Whsolid)
		}
		} #sw

		Line_highlight $qq
	}
	} #sw
 } #func
 
function Color_select(){ 

	switch($key["mode"]){
	'dark'{	$brush= $Whbrush; break;
	}'light'{	$brush= $Blbrush
	}
	} #sw

	switch($key["color"]){
	'steel'{
		switch(Itm){
		'2op'{	[array]$color= @($darkblue, $darkred); break;
		}'4op'{	[array]$color= @($darkblue, $darkgreen, $darkorange, $darkred)
		}
		} #sw
		break;

	}'natural'{
		switch(Itm){
		'2op'{	[array]$color= @($naturalblue, $naturalred); break;
		}'4op'{	[array]$color= @($naturalblue,$naturalgreen, $naturalorange, $naturalred)
		}
		} #sw
		break;

	}'pastel'{
		switch(Itm){
		'2op'{	[array]$color= @($pastelblue, $pastelred); break;
		}'4op'{	[array]$color= @($pastelblue, $pastelgreen, $pastelorange, $pastelred)
		}
		} #sw
		break;

	}'vivid'{
		switch(Itm){
		'2op'{	[array]$color= @($vividblue, $vividred); break;
		}'4op'{	[array]$color= @($vividblue, $vividgreen, $vividorange, $vividred)
		}
		} #sw
	}
	} #sw

	[array]$rr= $color, $brush # 必要、echo 直だとダメ
	return $rr
 } #func
 
function Silver_convert($tt, [int] $sw){ 

	[int] $pp= $tt.A
	[int] $qq= ($tt.R+$tt.G+ $tt.B)/ 3/ 3 #

	switch($sw){
	0{	[int]$nn= [Math]::Floor( $qq* 2); break;	# dark
	}1{	[int]$nn= [Math]::Floor( $qq* 3); break;	# nomal
	}2{	[int]$nn= [Math]::Floor( $qq* 4)	# light
	}
	} #sw

	$mm= [System.Drawing.Color]::FromArgb($pp, $nn, $nn, $nn)
	$obj= New-Object System.Drawing.SolidBrush($mm)

	return $obj
 } #func
 
function Brush_Color(){ 

	[array] $color= $black, $white # $black246, $white248

	[int] $jj= 0
	switch($script:key["mode"]){
	'dark'{	$jj= 0	; break;
	}'light'{	$jj= 1
	}
	} #sw

	switch($key["color"]){
	'steel'{
		switch(Itm){
		'2op'{
			switch(Idx){
			0{	$brush= $darkBEllipse; $bgbrush= $darkBPie; $spot= $darkBPieL, $darkBPieD;	break;
			}1{	$brush= $darkREllipse; $bgbrush= $darkRPie; $spot=$darkRPieL, $darkRPieD
			}
			} #sw
			break;
		}'4op'{
			switch(Idx){
			0{	$brush= $darkBEllipse; $bgbrush= $darkBPie; $spot= $darkBPieL, $darkBPieD;	break;
			}1{	$brush= $darkGEllipse; $bgbrush= $darkGPie; $spot= $darkGPieL, $darkGPieD;	break;
			}2{	$brush= $darkOEllipse; $bgbrush= $darkOPie; $spot= $darkOPieL, $darkOPieD;	break;
			}3{	$brush= $darkREllipse; $bgbrush= $darkRPie; $spot= $darkRPieL, $darkRPieD
			}
			} #sw
		}
		} #sw
		break;

	}'natural'{
		switch(Itm){
		'2op'{
			switch(Idx){
			0{	$brush= $naturalBEllipse; $bgbrush= $naturalBPie; $spot= $naturalBPieL, $naturalBPieD;	break;
			}1{	$brush= $naturalREllipse; $bgbrush= $naturalRPie; $spot= $naturalRPieL, $naturalRPieD
			}
			} #sw
			break;
		}'4op'{
			switch(Idx){
			0{	$brush= $naturalBEllipse; $bgbrush= $naturalBPie; $spot= $naturalBPieL, $naturalBPieD;	break;
			}1{	$brush= $naturalGEllipse; $bgbrush= $naturalGPie; $spot= $naturalGPieL, $naturalGPieD;	break;
			}2{	$brush= $naturalOEllipse; $bgbrush= $naturalOPie; $spot= $naturalOPieL, $naturalOPieD;	break;
			}3{	$brush= $naturalREllipse; $bgbrush= $naturalRPie; $spot= $naturalRPieL, $naturalRPieD
			}
			} #sw
		}
		} #sw
		break;

	}'pastel'{
		switch(Itm){
		'2op'{
			switch(Idx){
			0{	$brush= $pastelBEllipse; $bgbrush= $pastelBPie; $spot= $pastelBPieL, $pastelBPieD;	break;
			}1{	$brush= $pastelREllipse; $bgbrush= $pastelRPie; $spot= $pastelRPieL, $pastelRPieD
			}
			} #sw
			break;
		}'4op'{
			switch(Idx){
			0{	$brush= $pastelBEllipse; $bgbrush= $pastelBPie; $spot= $pastelBPieL, $pastelBPieD;	break;
			}1{	$brush= $pastelGEllipse; $bgbrush= $pastelGPie; $spot= $pastelGPieL, $pastelGPieD;	break;
			}2{	$brush= $pastelOEllipse; $bgbrush= $pastelOPie; $spot= $pastelOPieL, $pastelOPieD;	break;
			}3{	$brush= $pastelREllipse; $bgbrush= $pastelRPie; $spot= $pastelRPieL, $pastelRPieD
			}
			} #sw
		}
		} #sw
		break;

	}'vivid'{
		switch(Itm){
		'2op'{
			switch(Idx){
			0{	$brush= $vividBEllipse; $bgbrush= $vividBPie; $spot= $vividBPieL, $vividBPieD;	break;
			}1{	$brush= $vividREllipse; $bgbrush= $vividRPie; $spot= $vividRPieL, $vividRPieD
			}
			} #sw
			break;
		}'4op'{
			switch(Idx){
			0{	$brush= $vividBEllipse; $bgbrush= $vividBPie; $spot= $vividBPieL, $vividBPieD;	break;
			}1{	$brush= $vividGEllipse; $bgbrush= $vividGPie; $spot= $vividGPieL, $vividGPieD;	break;
			}2{	$brush= $vividOEllipse; $bgbrush= $vividOPie; $spot= $vividOPieL, $vividOPieD;	break;
			}3{	$brush= $vividREllipse; $bgbrush= $vividRPie; $spot= $vividRPieL, $vividRPieD
			}
			} #sw
		}
		} #sw
	}
	} #sw

	[array]$rr= $color[$jj], $brush, $bgbrush, $spot[$jj]

	return $rr
} #func
  
# buffer 
	 
function Pixcel_Select([int] $max){ 

	$max= $max+ 1

	[array] $nn= "",""
	[int[]] $nn[0]= 2,4,8,  16, 32, 64,128 # max
	[int[]] $nn[1]= 24,16,12,  8,4, 2,1 # px
	[int] $d= 0

	for([int] $i= 0; $i -lt $nn[0].Length; $i++){

		if($nn[0][$i] -ge $max){
			$d= $nn[1][$i]
			break;
		}
	} #

	return $d
 } #func
 
function Mouse_druger([string] $sw, [string] $type, $ev){	# knob 

	switch($sw){
	'Up'{
		$script:mouser_capure= $False
		break;
	}'Move'{
		if($script:mouser_capure -eq $True){

			$x= NmudX $type
			[int] $dd= Pixcel_Select $x.Maximum

			$mscp= $frm_fm.PointToClient([Windows.Forms.Cursor]::Position)
			[int] $nn= [Math]::Floor( (- ([int] $mscp.Y)+ ([int] $script:topper_pos.Y)) / $dd) # pixcel

			$x.Value= [string] (Drug_chg $nn $script:starter_value $x.Maximum)
		}
		break;
	}'Wheel'{

		if($script:undo[2] -ne 'store'){

			Unredo 0
		}

		$x= NmudX $type
		$x.Value= [string] (Delta_chg ([int] $ev.Delta) $x.Value $x.Maximum)
		break;
	}'Down'{
		switch([string] $ev.Button){
		'Left'{
			if($script:undo[2] -ne 'store'){

				Unredo 0
			}

			## $script:key["knob"][$comb_fm.SelectedIndex]= $type # Hoverで、多分不要
			## Contxt_change $type

			if($sb_alg.Visible){
				All_chg
			}

			$script:topper_pos= $frm_fm.PointToClient([Windows.Forms.Cursor]::Position)

			$x= NmudX $type
			$script:starter_value=  [int] $x.Value
			$script:mouser_capure= $True
		}
		} #sw
		break;
	}'Hover'{

		$x= NmudX $type
		Buffer_Render $x.Value $x.Maximum $type $True

		$script:key["knob"][$comb_fm.SelectedIndex]= $type
		Contxt_change $type

		if($sb_alg.Visible){
			All_chg
		}
		break;
	}'Leave'{
		$x= NmudX $type
		Buffer_Render $x.Value $x.Maximum $type $False
	}
	} #sw
 } #func
 
function Buffer_Render([int] $val, [int] $max, [string] $sw, [bool] $layer){ 

	[array]$rr= Brush_Color
	$bgcolor= $rr[0]

	$ellipsebrush= $rr[1]

	if($layer -eq $True){
		$piebrush= $rr[3]
	}else{
		$piebrush= $rr[2]
	}

	$Horizonbuff.Graphics.Clear($bgcolor)
	$Horizonbuff.Graphics.FillPie($piebrush, ($IMG_buf[0]* 0.1),($IMG_buf[1]* 0.1), ($IMG_buf[0]* 0.8),($IMG_buf[1]* 0.8), (120), (300/ $max* $val) )
	# 120 300 rad cake # / $max -> / 0 dato zero jyosan err

	$Horizonbuff.Graphics.FillEllipse($ellipsebrush, ($IMG_buf[0]* 0.2),($IMG_buf[1]* 0.2), ($IMG_buf[0]* 0.6),($IMG_buf[1]* 0.6))
	$Horizonbuff.Render($Graphics_buf) # レンダリング

	switch($sw){
	'ALG'{	$x= $script:graphicsALG; $y= $script:PictboxALG; $z= $script:imageALG.Size; break;
	}'FB'{	$x= $script:graphicsFB; $y= $script:PictboxFB; $z= $script:imageFB.Size; break;
	}'AR'{	$x= $script:graphicsAR; $y= $script:PictboxAR; $z= $script:imageAR.Size; break;
	}'DR'{	$x= $script:graphicsDR; $y= $script:PictboxDR; $z= $script:imageDR.Size; break;
	}'SR'{	$x= $script:graphicsSR; $y= $script:PictboxSR; $z= $script:imageSR.Size; break;
	}'RR'{	$x= $script:graphicsRR; $y= $script:PictboxRR; $z= $script:imageRR.Size; break;
	}'SL'{	$x= $script:graphicsSL; $y= $script:PictboxSL; $z= $script:imageSL.Size; break;
	}'KSL'{	$x= $script:graphicsKSL; $y= $script:PictboxKSL; $z= $script:imageKSL.Size; break;
	}'KSR'{	$x= $script:graphicsKSR; $y= $script:PictboxKSR; $z= $script:imageKSR.Size; break;

	}'DT'{	$x= $script:graphicsDT; $y= $script:PictboxDT; $z= $script:imageDT.Size; break;
	}'EG'{	$x= $script:graphicsEG; $y= $script:PictboxEG; $z= $script:imageEG.Size; break;
	}'VIB'{	$x= $script:graphicsVIB; $y= $script:PictboxVIB; $z= $script:imageVIB.Size; break;
	}'AM'{	$x= $script:graphicsAM; $y= $script:PictboxAM; $z= $script:imageAM.Size; break;
	}'KS'{	$x= $script:graphicsKS; $y= $script:PictboxKS; $z= $script:imageKS.Size; break;
	}'DT1'{	$x= $script:graphicsDT1; $y= $script:PictboxDT1; $z= $script:imageDT1.Size; break;
	}'DT2'{	$x= $script:graphicsDT2; $y= $script:PictboxDT2; $z= $script:imageDT2.Size; break;
	}'AMS'{	$x= $script:graphicsAMS; $y= $script:PictboxAMS; $z= $script:imageAMS.Size; break;
	}'ML'{	$x= $script:graphicsML; $y= $script:PictboxML; $z= $script:imageML.Size; break;
	}'TL'{	$x= $script:graphicsTL; $y= $script:PictboxTL; $z= $script:imageTL.Size
	}
	} #sw


	$x.DrawImage($image_buf, 0, 0, $z.Width, $z.Height) # 縮小
	$x.DrawString($val, $Fona, $piebrush, ($z.Width* 0.28), ($z.Height* 0.36))
	$y.Refresh()
 } #func
 
function Color_Render(){ 

	switch($key["mode"]){
	'dark'{
		$fm_panel.BackColor= $black # $black246
		$cc= $naturalblack

		break;
	}'light'{
		$fm_panel.BackColor= $white # $white248
		$cc= $darkwhite
	}
	} #sw

	switch($comb_fm.SelectedItem){
	'vrc7 2op'{
		[array] $brr= $script:lbl_ar, $script:lbl_dr, $script:lbl_sr, $script:lbl_rr,  $script:lbl_ksl, $script:lbl_ksr,  $script:lbl_dt, $script:lbl_eg, $script:lbl_vib, $script:lbl_am,  $script:lbl_tl, $script:lbl_ml, $script:lbl_fb
		[string[]] $arr= "FB", "AR", "DR", "SR", "RR", "KSL", "KSR", "DT", "EG", "VIB", "AM", "ML", "TL";		break;
	}'opl 2op'{
		[array] $brr= $script:lbl_ar, $script:lbl_dr, $script:lbl_sr, $script:lbl_rr,  $script:lbl_ksl, $script:lbl_ksr,  $script:lbl_eg, $script:lbl_vib, $script:lbl_am,  $script:lbl_tl, $script:lbl_ml, $script:lbl_alg, $script:lbl_fb
		[string[]] $arr= "ALG", "FB", "AR", "DR", "SR", "RR", "KSL", "KSR", "EG", "VIB", "AM", "ML", "TL";	break;
	}'opn 4op'{
		[array] $brr= $script:lbl_ar, $script:lbl_dr, $script:lbl_sr, $script:lbl_rr, $script:lbl_sl,  $script:lbl_ks, $script:lbl_dt1, $script:lbl_ams,  $script:lbl_tl, $script:lbl_ml, $script:lbl_alg, $script:lbl_fb
		[string[]] $arr= "ALG", "FB", "AR", "DR", "SR", "RR", "SL", "KS", "DT1", "AMS", "ML", "TL";		break;
	}'opm 4op'{
		[array] $brr= $script:lbl_ar, $script:lbl_dr, $script:lbl_sr, $script:lbl_rr, $script:lbl_sl,  $script:lbl_ks, $script:lbl_dt1, $script:lbl_dt2, $script:lbl_ams,  $script:lbl_tl, $script:lbl_ml, $script:lbl_alg, $script:lbl_fb
		[string[]] $arr= "ALG", "FB", "AR", "DR", "SR", "RR", "SL", "KS", "DT1", "DT2", "AMS", "ML", "TL"
	}
	} #sw

	foreach($x in $brr){
		$x.BackColor= $cc
	} #

	[string] $ss= ""
	foreach($ss in $arr){
		$x= NmudX $ss
		Buffer_Render $x.Value $x.Maximum $ss $False
	} #
 } #func
 
function NmudX([string] $sw){ 

	switch($comb_fm.SelectedItem){
	'vrc7 2op'{
		switch($sw){
		'FB'{	$x= $script:vrc_nmud_fb;	break;

		}'AR'{	$x= $script:vrc_nmud_ar;	break;
		}'DR'{	$x= $script:vrc_nmud_dr;	break;
		}'SR'{	$x= $script:vrc_nmud_sr;	break;
		}'RR'{	$x= $script:vrc_nmud_rr;	break;

		}'KSL'{	$x= $script:vrc_nmud_ksl;	break;
		}'KSR'{	$x= $script:vrc_nmud_ksr;	break;

		}'DT'{	$x= $script:vrc_nmud_dt;	break;
		}'EG'{	$x= $script:vrc_nmud_eg;	break;
		}'VIB'{	$x= $script:vrc_nmud_vib;	break;
		}'AM'{	$x= $script:vrc_nmud_am;	break;

		}'ML'{	$x= $script:vrc_nmud_ml;	break;
		}'TL'{	$x= $script:vrc_nmud_tl
		}
		} #sw
		break;
	}'opl 2op'{
		switch($sw){
		'ALG'{	$x= $script:opl_nmud_alg;	break;
		}'FB'{	$x= $script:opl_nmud_fb;	break;

		}'AR'{	$x= $script:opl_nmud_ar;	break;
		}'DR'{	$x= $script:opl_nmud_dr;	break;
		}'RR'{	$x= $script:opl_nmud_rr;	break;
		}'SR'{	$x= $script:opl_nmud_sr;	break;

		}'KSL'{	$x= $script:opl_nmud_ksl;	break;
		}'KSR'{	$x= $script:opl_nmud_ksr;	break;

		}'EG'{	$x= $script:opl_nmud_eg;	break;
		}'VIB'{	$x= $script:opl_nmud_vib;	break;
		}'AM'{	$x= $script:opl_nmud_am;	break;

		}'ML'{	$x= $script:opl_nmud_ml;	break;
		}'TL'{	$x= $script:opl_nmud_tl
		}
		} #sw
		break;
	}'opn 4op'{
		switch($sw){
		'ALG'{	$x= $script:opn_nmud_alg;	break;
		}'FB'{	$x= $script:opn_nmud_fb;	break;

		}'AR'{	$x= $script:opn_nmud_ar;	break;
		}'DR'{	$x= $script:opn_nmud_dr;	break;
		}'SR'{	$x= $script:opn_nmud_sr;	break;
		}'RR'{	$x= $script:opn_nmud_rr;	break;
		}'SL'{	$x= $script:opn_nmud_sl;	break;

		}'KS'{	$x= $script:opn_nmud_ks;	break;
		}'DT1'{	$x= $script:opn_nmud_dt1;	break;
		}'AMS'{	$x= $script:opn_nmud_ams;	break;

		}'ML'{	$x= $script:opn_nmud_ml;	break;
		}'TL'{	$x= $script:opn_nmud_tl
		}
		} #sw
		break;
	}'opm 4op'{
		switch($sw){
		'ALG'{	$x= $script:opm_nmud_alg;	break;
		}'FB'{	$x= $script:opm_nmud_fb;	break;

		}'AR'{	$x= $script:opm_nmud_ar;	break;
		}'DR'{	$x= $script:opm_nmud_dr;	break;
		}'SR'{	$x= $script:opm_nmud_sr;	break;
		}'RR'{	$x= $script:opm_nmud_rr;	break;
		}'SL'{	$x= $script:opm_nmud_sl;	break;

		}'KS'{	$x= $script:opm_nmud_ks;	break;
		}'DT1'{	$x= $script:opm_nmud_dt1;	break;
		}'DT2'{	$x= $script:opm_nmud_dt2;	break;
		}'AMS'{	$x= $script:opm_nmud_ams;	break;

		}'ML'{	$x= $script:opm_nmud_ml;	break;
		}'TL'{	$x= $script:opm_nmud_tl
		}
		} #sw
	}
	} #sw

	return $x
 } #func
  
# contxt 
	 
function Opmap_change([int]$j){ 

	# .SelectedIndex= $j # event -> .Add_SelectedValueChanged

	switch($comb_fm.SelectedItem){
	'vrc7 2op'{	if($comb_vrc.SelectedIndex -ne $j ){ $comb_vrc.SelectedIndex= $j };	break; # mod select
	}'opl 2op'{	if($comb_opl.SelectedIndex -ne $j ){ $comb_opl.SelectedIndex= $j };	break;
	}'opn 4op'{	if($comb_opn.SelectedIndex -ne $j ){ $comb_opn.SelectedIndex= $j };	break;
	}'opm 4op'{	if($comb_opm.SelectedIndex -ne $j ){ $comb_opm.SelectedIndex= $j }
	}
	} #sw
 } #func
 
function Mouse_valuer([string] $sw, [string] $opnum, $ev){	# Op. 

	switch($sw){
	'Up'{
		$script:mouse_capure= $False
		break;
	}'Move'{
		if($script:mouse_capure -eq $True){

			$mscp= $sb_alg.PointToClient([Windows.Forms.Cursor]::Position)

			[int] $pp= [Math]::Floor( -([int] $mscp.X)+ ([int] $script:toppos.X) ) # pixcel
			[int] $qq= [Math]::Floor( -([int] $mscp.Y)+ ([int] $script:toppos.Y) )

			Trans_ADSR $pp $qq
		}
		break;
	}'Wheel'{

		if($script:undo[2] -ne 'store'){

			Unredo 0
		}

		$x= NmudX $key["knob"][$comb_fm.SelectedIndex]
		$x.Value= [string] (Delta_chg ([int] $ev.Delta) $x.Value $x.Maximum)
		break;
	}'Down'{
		Opmap_change $opnum

		switch([string] $ev.Button){
		'Right'{
			Contxt_select "boxpict"
			break;
		}'Left'{

			if($script:undo[2] -ne 'store'){

				Unredo 0
			}

			$script:toppos= $sb_alg.PointToClient([Windows.Forms.Cursor]::Position)

			$x= NmudX $key["knob"][$comb_fm.SelectedIndex]
			$script:start_value= [int] $x.Value

			$script:mouse_capure= $True
		}
		} #sw
		break;
	}'Hover'{
		Opmap_change $opnum
	}
	} #sw

 } #func
 
function Delta_chg([int] $delta, [int] $num, [int] $max){ 

	if($delta -lt 0){
		if($num -gt 0){
			$num--;
		}
	}else{
		if($num -lt $max){
			$num++;
		}
	}

	return $num
 } #func
 
function Drug_chg([int] $delta, [int] $num, [int] $max){ 

	[int] $nn=  $delta+ $num

	if($nn -lt 0){
		$nn=  0
	}
	if($nn -gt $max){
		$nn=  $max
	}

	return $nn
 } #func
 
function Trans_ADSR([int] $pp, [int] $qq){ 

	# switch($key["knob"][$comb_fm.SelectedIndex]){
	# 'AR'{	$delta= $pp;	break;
	# }'DR'{	$delta= $pp;	break;
	# }'SR'{	$delta= $pp;	break;
	# }'RR'{	$delta= $pp; 	break; # X
	# }default{	$delta= $qq # Y
	# }
	# } #sw

	$delta= $qq # Y

	$x= NmudX $key["knob"][$comb_fm.SelectedIndex]

	[int] $dd= Pixcel_Select $x.Maximum

	$delta= [Math]::Floor( $delta/ $dd)
	$x.Value= [string] (Drug_chg $delta $script:start_value $x.Maximum)
 } #func
 
function Wheel_ALG([int] $delta){ 

	[int] $num
	[int] $max
	switch($comb_fm.SelectedItem){
	'opl 2op'{		$num= $script:opl_nmud_alg.Value
			$max= $script:opl_nmud_alg.Maximum
			break;
	}'opn 4op'{	$num= $script:opn_nmud_alg.Value
			$max= $script:opn_nmud_alg.Maximum
			break;
	}'opm 4op'{	$num= $script:opm_nmud_alg.Value
			$max= $script:opm_nmud_alg.Maximum
	}
	} #sw

	if($delta -lt 0){
		if($num -gt 0){
			$num--;
		}
	}else{
		if($num -lt $max){
			$num++;
		}
	}

	switch($comb_fm.SelectedItem){
	'opl 2op'{		$script:opl_nmud_alg.Value= $num
			break;
	}'opn 4op'{	$script:opn_nmud_alg.Value= $num
			break;
	}'opm 4op'{	$script:opm_nmud_alg.Value= $num
	}
	} #sw
 } #func
 
<# 
	 
function Wheel_ALG([int] $delta){ 

	[int] $num= $key["oct"].Replace("o", "")
	[int] $max= 8

	if($delta -lt 0){
		if($num -gt 1){
			$num--;
		}
	}else{
		if($num -lt $max){
			$num++;
		}
	}

	$script:key["oct"]= Osc_sw ("o"+ $num)
	Stus_build

	Contxt_octave $script:key["oct"]
	Pict_chg
 } #func
 
#> 
  
# ------ 
 
function ShortX([string] $ss, [string] $tt){ 

	switch($tt){
	'short'{	[int] $jj= 1; [int] $kk= 0
	}'long'{	[int] $jj= 0; [int] $kk= 1
	}
	} #sw

	[array] $arr= "", ""

	switch(Itm){
	'2op'{
		$arr[0]= "ALG", "FB", "AR", "DR", "SR", "RR", "KSL", "KSR", "DT", "EG", "VIB", "AM", "ML", "TL"
		$arr[1]= "Algorithm", "Feedback", "Attack", "Decay", "Sustain", "Release", "KeyScaleLevel", "KeyScaleRate"
		$arr[1]+= "Distortion", "EnvGeneType", "Vibrato", "AmpMod", "Multiple", "TotalLevel"
		break;
	}'4op'{
		$arr[0]= "ALG", "FB", "AR", "DR", "SR", "RR", "SL", "KS", "DT1", "DT2", "AMS", "ML", "TL"
		$arr[1]= "Algorithm", "Feedback", "Attack", "Decay", "SustainRate", "Release", "SustainLevel"
		$arr[1]+= "KeyScaling", "DeTune1", "DeTune2", "AmpModSens", "Multiple", "TotalLevel"
	}
	} #sw

	[string] $x= ""
	for([int] $i= 0; $i -lt $arr[$jj].Length; $i++){

		if($arr[$jj][$i] -eq $ss){
			$x= $arr[$kk][$i]
			break;
		}
	} #

	return $x
 } #func
 
function Value_out(){ 

	[string[]] $ss= "","", "",""

	switch($comb_fm.SelectedItem){
	'vrc7 2op'{
		[array] $rr= $script:vrc_svn

		switch($key["knob"][0]){
		'FB'{
			$ss[0]= $rr[0][1]
			$ss[1]= ""
			break;
		}'AR'{
			$ss[0]= $rr[0][2]
			$ss[1]= $rr[1][2]
			break;
		}'DR'{
			$ss[0]= $rr[0][3]
			$ss[1]= $rr[1][3]
			break;
		}'RR'{
			$ss[0]= $rr[0][5]
			$ss[1]= $rr[1][5]
			break;
		}'SR'{
			$ss[0]= $rr[0][4]
			$ss[1]= $rr[1][4]
			break;
		}'KSL'{
			$ss[0]= $rr[0][6]
			$ss[1]= $rr[1][6]
			break;
		}'KSR'{
			$ss[0]= $rr[0][11]
			$ss[1]= $rr[1][11]
			break;
		}'DT'{
			$ss[0]= $rr[0][12]
			$ss[1]= $rr[1][12]
			break;
		}'EG'{
			$ss[0]= $rr[0][10]
			$ss[1]= $rr[1][10]
			break;
		}'VIB'{
			$ss[0]= $rr[0][9]
			$ss[1]= $rr[1][9]
			break;
		}'AM'{
			$ss[0]= $rr[0][8]
			$ss[1]= $rr[1][8]
			break;
		}'ML'{
			$ss[0]= $rr[0][7]
			$ss[1]= $rr[1][7]
			break;
		}'TL'{
			$ss[0]= $rr[0][0]
			$ss[1]= $rr[1][0]
		}
		} #sw
		break;
	}'opl 2op'{
		[array] $rr= $script:opl_two

		switch($key["knob"][1]){
		'FB'{
			$ss[0]= $rr[0][1]
			$ss[1]= ""
			break;
		}'AR'{
			$ss[0]= $rr[0][2]
			$ss[1]= $rr[1][2]
			break;
		}'DR'{
			$ss[0]= $rr[0][3]
			$ss[1]= $rr[1][3]
			break;
		}'RR'{
			$ss[0]= $rr[0][4]
			$ss[1]= $rr[1][4]
			break;
		}'SR'{
			$ss[0]= $rr[0][5]
			$ss[1]= $rr[1][5]
			break;
		}'KSL'{
			$ss[0]= $rr[0][7]
			$ss[1]= $rr[1][7]
			break;
		}'KSR'{
			$ss[0]= $rr[0][9]
			$ss[1]= $rr[1][9]
			break;
		}'EG'{
			$ss[0]= $rr[0][10]
			$ss[1]= $rr[1][10]
			break;
		}'VIB'{
			$ss[0]= $rr[0][11]
			$ss[1]= $rr[1][11]
			break;
		}'AM'{
			$ss[0]= $rr[0][12]
			$ss[1]= $rr[1][12]
			break;
		}'ML'{
			$ss[0]= $rr[0][8]
			$ss[1]= $rr[1][8]
			break;
		}'TL'{
			$ss[0]= $rr[0][6]
			$ss[1]= $rr[1][6]
			break;
		}
		} #sw
		break;
	}'opn 4op'{
		[array] $rr= $script:opn_fur

		switch($key["knob"][2]){
		'FB'{
			$ss[0]= $rr[0][1]
			$ss[1]= ""
			$ss[2]= ""
			$ss[3]= ""
			break;
		}'AR'{
			$ss[0]= $rr[0][2]
			$ss[1]= $rr[1][2]
			$ss[2]= $rr[2][2]
			$ss[3]= $rr[3][2]
			break;
		}'DR'{
			$ss[0]= $rr[0][3]
			$ss[1]= $rr[1][3]
			$ss[2]= $rr[2][3]
			$ss[3]= $rr[3][3]
			break;
		}'SR'{
			$ss[0]= $rr[0][4]
			$ss[1]= $rr[1][4]
			$ss[2]= $rr[2][4]
			$ss[3]= $rr[3][4]
			break;
		}'RR'{
			$ss[0]= $rr[0][5]
			$ss[1]= $rr[1][5]
			$ss[2]= $rr[2][5]
			$ss[3]= $rr[3][5]
			break;
		}'SL'{
			$ss[0]= $rr[0][6]
			$ss[1]= $rr[1][6]
			$ss[2]= $rr[2][6]
			$ss[3]= $rr[3][6]
			break;
		}'KS'{
			$ss[0]= $rr[0][8]
			$ss[1]= $rr[1][8]
			$ss[2]= $rr[2][8]
			$ss[3]= $rr[3][8]
			break;
		}'DT1'{
			$ss[0]= $rr[0][10]
			$ss[1]= $rr[1][10]
			$ss[2]= $rr[2][10]
			$ss[3]= $rr[3][10]
			break;
		}'AMS'{
			$ss[0]= $rr[0][11]
			$ss[1]= $rr[1][11]
			$ss[2]= $rr[2][11]
			$ss[3]= $rr[3][11]
			break;
		}'ML'{
			$ss[0]= $rr[0][9]
			$ss[1]= $rr[1][9]
			$ss[2]= $rr[2][9]
			$ss[3]= $rr[3][9]
			break;
		}'TL'{
			$ss[0]= $rr[0][7]
			$ss[1]= $rr[1][7]
			$ss[2]= $rr[2][7]
			$ss[3]= $rr[3][7]
		}
		} #sw
		break;
	}'opm 4op'{
		[array] $rr= $script:opm_fur

		switch($key["knob"][3]){
		'FB'{
			$ss[0]= $rr[0][1]
			$ss[1]= ""
			$ss[2]= ""
			$ss[3]= ""
			break;
		}'AR'{
			$ss[0]= $rr[0][2]
			$ss[1]= $rr[1][2]
			$ss[2]= $rr[2][2]
			$ss[3]= $rr[3][2]
			break;
		}'DR'{
			$ss[0]= $rr[0][3]
			$ss[1]= $rr[1][3]
			$ss[2]= $rr[2][3]
			$ss[3]= $rr[3][3]
			break;
		}'SR'{
			$ss[0]= $rr[0][4]
			$ss[1]= $rr[1][4]
			$ss[2]= $rr[2][4]
			$ss[3]= $rr[3][4]
			break;
		}'RR'{
			$ss[0]= $rr[0][5]
			$ss[1]= $rr[1][5]
			$ss[2]= $rr[2][5]
			$ss[3]= $rr[3][5]
			break;
		}'SL'{
			$ss[0]= $rr[0][6]
			$ss[1]= $rr[1][6]
			$ss[2]= $rr[2][6]
			$ss[3]= $rr[3][6]
			break;
		}'KS'{
			$ss[0]= $rr[0][8]
			$ss[1]= $rr[1][8]
			$ss[2]= $rr[2][8]
			$ss[3]= $rr[3][8]
			break;
		}'DT1'{
			$ss[0]= $rr[0][10]
			$ss[1]= $rr[1][10]
			$ss[2]= $rr[2][10]
			$ss[3]= $rr[3][10]
			break;
		}'DT2'{
			$ss[0]= $rr[0][11]
			$ss[1]= $rr[1][11]
			$ss[2]= $rr[2][11]
			$ss[3]= $rr[3][11]
			break;
		}'AMS'{
			$ss[0]= $rr[0][12]
			$ss[1]= $rr[1][12]
			$ss[2]= $rr[2][12]
			$ss[3]= $rr[3][12]
			break;
		}'ML'{
			$ss[0]= $rr[0][9]
			$ss[1]= $rr[1][9]
			$ss[2]= $rr[2][9]
			$ss[3]= $rr[3][9]
			break;
		}'TL'{
			$ss[0]= $rr[0][7]
			$ss[1]= $rr[1][7]
			$ss[2]= $rr[2][7]
			$ss[3]= $rr[3][7]
		}
		} #sw
	}
	} #sw

	return $ss
 } #func
 
function ADSR_in(){ 

	[string[]] $ss= "","","", "",""

	switch($comb_fm.SelectedItem){
	'vrc7 2op'{
		[array] $rr= $script:vrc_svn
		[int] $nn= $comb_vrc.SelectedIndex

		$ss[0]= $rr[$nn][2] # ar
		$ss[1]= $rr[$nn][3] # dr
		$ss[2]= $rr[$nn][5] # rr
		$ss[3]= $rr[$nn][4] # sl
		$ss[4]= $rr[$nn][10] # eg
		break;
	}'opl 2op'{
		[array] $rr= $script:opl_two
		[int] $nn= $comb_opl.SelectedIndex

		$ss[0]= $rr[$nn][2] # ar
		$ss[1]= $rr[$nn][3] # dr
		$ss[2]= $rr[$nn][4] # rr
		$ss[3]= $rr[$nn][5] # sl
		$ss[4]= $rr[$nn][10] # eg
		break;
	}'opn 4op'{
		[array] $rr= $script:opn_fur
		[int] $nn= $comb_opn.SelectedIndex

		$ss[0]= $rr[$nn][2] # ar
		$ss[1]= $rr[$nn][3] # dr
		$ss[2]= $rr[$nn][4] # sr
		$ss[3]= $rr[$nn][5] # rr
		$ss[4]= $rr[$nn][6] # sl
		break;
	}'opm 4op'{
		[array] $rr= $script:opm_fur
		[int] $nn= $comb_opm.SelectedIndex

		$ss[0]= $rr[$nn][2] # ar
		$ss[1]= $rr[$nn][3] # dr
		$ss[2]= $rr[$nn][4] # sr
		$ss[3]= $rr[$nn][5] # rr
		$ss[4]= $rr[$nn][6] # sl
	}
	} #sw

	return $ss
 } #func
 
function ADSR_out([string[]] $ss){ 

	switch($comb_fm.SelectedItem){
	'vrc7 2op'{
		$rr= $script:vrc_svn
		[int] $nn= $comb_vrc.SelectedIndex

		$rr[$nn][2]= $ss[0] # ar
		$rr[$nn][3]= $ss[1] # dr
		$rr[$nn][5]= $ss[2] # rr
		$rr[$nn][4]= $ss[3] # sl
		$rr[$nn][10]= $ss[4] # eg
		break;
	}'opl 2op'{
		$rr= $script:opl_two
		[int] $nn= $comb_opl.SelectedIndex

		$rr[$nn][2]= $ss[0] # ar
		$rr[$nn][3]= $ss[1] # dr
		$rr[$nn][4]= $ss[2] # rr
		$rr[$nn][5]= $ss[3] # sl
		$rr[$nn][10]= $ss[4] # eg
		break;
	}'opn 4op'{
		$rr= $script:opn_fur
		[int] $nn= $comb_opn.SelectedIndex

		$rr[$nn][2]= $ss[0] # ar
		$rr[$nn][3]= $ss[1] # dr
		$rr[$nn][4]= $ss[2] # sr
		$rr[$nn][5]= $ss[3] # rr
		$rr[$nn][6]= $ss[4] # sl
		break;
	}'opm 4op'{
		$rr= $script:opm_fur
		[int] $nn= $comb_opm.SelectedIndex

		$rr[$nn][2]= $ss[0] # ar
		$rr[$nn][3]= $ss[1] # dr
		$rr[$nn][4]= $ss[2] # sr
		$rr[$nn][5]= $ss[3] # rr
		$rr[$nn][6]= $ss[4] # sl
	}
	} #sw
 } #func
 
# ------ 
 
function Contxt_select([string]$s){ 

	switch($s){
	'boxpict'{
		switch($comb_fm.SelectedItem){
		'vrc7 2op'{	$contxt_7bw.Show([Windows.Forms.Cursor]::Position);	break;
		}'opl 2op'{	$contxt_Lbw.Show([Windows.Forms.Cursor]::Position);	break;
		}'opn 4op'{	$contxt_Nbg.Show([Windows.Forms.Cursor]::Position);	break;
		}'opm 4op'{	$contxt_Mbg.Show([Windows.Forms.Cursor]::Position)
		}
		} #sw
		break;

	}'oct'{
		$contxt_oct.Show([Windows.Forms.Cursor]::Position)
	}
	} #sw
 } #func
 
function Contxt_change([string] $ss){ 

	switch($comb_fm.SelectedItem){
	'vrc7 2op'{	Contxt_chg_vrc $ss;	break;
	}'opl 2op'{	Contxt_chg_opl $ss;	break;
	}'opn 4op'{	Contxt_chg_opn $ss;	break;
	}'opm 4op'{	Contxt_chg_opm $ss
	}
	} #sw
 } #func
 
function Contxt_chg_vrc([string] $ss){ 

	$contxt_7bw.Items.Clear()

	switch($ss){
	'AR'{
		[void]$contxt_7bw.Items.Add("Attack [v]")
		[void]$contxt_7bw.Items.Add("Decay")
		[void]$contxt_7bw.Items.Add("Sustain")
		[void]$contxt_7bw.Items.Add("Release")
		[void]$contxt_7bw.Items.Add("EnvGeneType")
		[void]$contxt_7bw.Items.Add("Multiple")
		[void]$contxt_7bw.Items.Add("TotalLevel")
		[void]$contxt_7bw.Items.Add("Distortion")
		[void]$contxt_7bw.Items.Add("Feedback")
		[void]$contxt_7bw.Items.Add($contxt_Sep_7bw)
		[void]$contxt_7bw.Items.Add("ADSR copy")
		[void]$contxt_7bw.Items.Add("ADSR paste")
		break;
	}'DR'{
		[void]$contxt_7bw.Items.Add("Attack")
		[void]$contxt_7bw.Items.Add("Decay [v]")
		[void]$contxt_7bw.Items.Add("Sustain")
		[void]$contxt_7bw.Items.Add("Release")
		[void]$contxt_7bw.Items.Add("EnvGeneType")
		[void]$contxt_7bw.Items.Add("Multiple")
		[void]$contxt_7bw.Items.Add("TotalLevel")
		[void]$contxt_7bw.Items.Add("Distortion")
		[void]$contxt_7bw.Items.Add("Feedback")
		[void]$contxt_7bw.Items.Add($contxt_Sep_7bw)
		[void]$contxt_7bw.Items.Add("ADSR copy")
		[void]$contxt_7bw.Items.Add("ADSR paste")
		break;
	}'RR'{
		[void]$contxt_7bw.Items.Add("Attack")
		[void]$contxt_7bw.Items.Add("Decay")
		[void]$contxt_7bw.Items.Add("Sustain")
		[void]$contxt_7bw.Items.Add("Release [v]")
		[void]$contxt_7bw.Items.Add("EnvGeneType")
		[void]$contxt_7bw.Items.Add("Multiple")
		[void]$contxt_7bw.Items.Add("TotalLevel")
		[void]$contxt_7bw.Items.Add("Distortion")
		[void]$contxt_7bw.Items.Add("Feedback")
		[void]$contxt_7bw.Items.Add($contxt_Sep_7bw)
		[void]$contxt_7bw.Items.Add("ADSR copy")
		[void]$contxt_7bw.Items.Add("ADSR paste")
		break;
	}'SR'{
		[void]$contxt_7bw.Items.Add("Attack")
		[void]$contxt_7bw.Items.Add("Decay")
		[void]$contxt_7bw.Items.Add("Sustain [v]")
		[void]$contxt_7bw.Items.Add("Release")
		[void]$contxt_7bw.Items.Add("EnvGeneType")
		[void]$contxt_7bw.Items.Add("Multiple")
		[void]$contxt_7bw.Items.Add("TotalLevel")
		[void]$contxt_7bw.Items.Add("Distortion")
		[void]$contxt_7bw.Items.Add("Feedback")
		[void]$contxt_7bw.Items.Add($contxt_Sep_7bw)
		[void]$contxt_7bw.Items.Add("ADSR copy")
		[void]$contxt_7bw.Items.Add("ADSR paste")
		break;
	}'EG'{
		[void]$contxt_7bw.Items.Add("Attack")
		[void]$contxt_7bw.Items.Add("Decay")
		[void]$contxt_7bw.Items.Add("Sustain")
		[void]$contxt_7bw.Items.Add("Release")
		[void]$contxt_7bw.Items.Add("EnvGeneType [v]")
		[void]$contxt_7bw.Items.Add("Multiple")
		[void]$contxt_7bw.Items.Add("TotalLevel")
		[void]$contxt_7bw.Items.Add("Distortion")
		[void]$contxt_7bw.Items.Add("Feedback")
		[void]$contxt_7bw.Items.Add($contxt_Sep_7bw)
		[void]$contxt_7bw.Items.Add("ADSR copy")
		[void]$contxt_7bw.Items.Add("ADSR paste")
		break;
	}'ML'{
		[void]$contxt_7bw.Items.Add("Attack")
		[void]$contxt_7bw.Items.Add("Decay")
		[void]$contxt_7bw.Items.Add("Sustain")
		[void]$contxt_7bw.Items.Add("Release")
		[void]$contxt_7bw.Items.Add("EnvGeneType")
		[void]$contxt_7bw.Items.Add("Multiple [v]")
		[void]$contxt_7bw.Items.Add("TotalLevel")
		[void]$contxt_7bw.Items.Add("Distortion")
		[void]$contxt_7bw.Items.Add("Feedback")
		[void]$contxt_7bw.Items.Add($contxt_Sep_7bw)
		[void]$contxt_7bw.Items.Add("ADSR copy")
		[void]$contxt_7bw.Items.Add("ADSR paste")
		break;
	}'TL'{
		[void]$contxt_7bw.Items.Add("Attack")
		[void]$contxt_7bw.Items.Add("Decay")
		[void]$contxt_7bw.Items.Add("Sustain")
		[void]$contxt_7bw.Items.Add("Release")
		[void]$contxt_7bw.Items.Add("EnvGeneType")
		[void]$contxt_7bw.Items.Add("Multiple")
		[void]$contxt_7bw.Items.Add("TotalLevel [v]")
		[void]$contxt_7bw.Items.Add("Distortion")
		[void]$contxt_7bw.Items.Add("Feedback")
		[void]$contxt_7bw.Items.Add($contxt_Sep_7bw)
		[void]$contxt_7bw.Items.Add("ADSR copy")
		[void]$contxt_7bw.Items.Add("ADSR paste")
		break;
	}'DT'{
		[void]$contxt_7bw.Items.Add("Attack")
		[void]$contxt_7bw.Items.Add("Decay")
		[void]$contxt_7bw.Items.Add("Sustain")
		[void]$contxt_7bw.Items.Add("Release")
		[void]$contxt_7bw.Items.Add("EnvGeneType")
		[void]$contxt_7bw.Items.Add("Multiple")
		[void]$contxt_7bw.Items.Add("TotalLevel")
		[void]$contxt_7bw.Items.Add("Distortion [v]")
		[void]$contxt_7bw.Items.Add("Feedback")
		[void]$contxt_7bw.Items.Add($contxt_Sep_7bw)
		[void]$contxt_7bw.Items.Add("ADSR copy")
		[void]$contxt_7bw.Items.Add("ADSR paste")
		break;
	}'FB'{
		[void]$contxt_7bw.Items.Add("Attack")
		[void]$contxt_7bw.Items.Add("Decay")
		[void]$contxt_7bw.Items.Add("Sustain")
		[void]$contxt_7bw.Items.Add("Release")
		[void]$contxt_7bw.Items.Add("EnvGeneType")
		[void]$contxt_7bw.Items.Add("Multiple")
		[void]$contxt_7bw.Items.Add("TotalLevel")
		[void]$contxt_7bw.Items.Add("Distortion")
		[void]$contxt_7bw.Items.Add("Feedback [v]")
		[void]$contxt_7bw.Items.Add($contxt_Sep_7bw)
		[void]$contxt_7bw.Items.Add("ADSR copy")
		[void]$contxt_7bw.Items.Add("ADSR paste")
		break;
	}default{
		[void]$contxt_7bw.Items.Add("Attack")
		[void]$contxt_7bw.Items.Add("Decay")
		[void]$contxt_7bw.Items.Add("Sustain")
		[void]$contxt_7bw.Items.Add("Release")
		[void]$contxt_7bw.Items.Add("EnvGeneType")
		[void]$contxt_7bw.Items.Add("Multiple")
		[void]$contxt_7bw.Items.Add("TotalLevel")
		[void]$contxt_7bw.Items.Add("Distortion")
		[void]$contxt_7bw.Items.Add("Feedback")
		[void]$contxt_7bw.Items.Add($contxt_Sep_7bw)
		[void]$contxt_7bw.Items.Add("ADSR copy")
		[void]$contxt_7bw.Items.Add("ADSR paste")
	}
	} #sw
 } #func
 
function Contxt_chg_opl([string] $ss){ 

	$contxt_Lbw.Items.Clear()

	switch($ss){
	'AR'{
		[void]$contxt_Lbw.Items.Add("Attack [v]")
		[void]$contxt_Lbw.Items.Add("Decay")
		[void]$contxt_Lbw.Items.Add("Sustain")
		[void]$contxt_Lbw.Items.Add("Release")
		[void]$contxt_Lbw.Items.Add("EnvGeneType")
		[void]$contxt_Lbw.Items.Add("Multiple")
		[void]$contxt_Lbw.Items.Add("TotalLevel")
		[void]$contxt_Lbw.Items.Add("Feedback")
		[void]$contxt_Lbw.Items.Add("Algorithm")
		[void]$contxt_Lbw.Items.Add($contxt_Sep_Lbw)
		[void]$contxt_Lbw.Items.Add("ADSR copy")
		[void]$contxt_Lbw.Items.Add("ADSR paste")
		break;
	}'DR'{
		[void]$contxt_Lbw.Items.Add("Attack")
		[void]$contxt_Lbw.Items.Add("Decay [v]")
		[void]$contxt_Lbw.Items.Add("Sustain")
		[void]$contxt_Lbw.Items.Add("Release")
		[void]$contxt_Lbw.Items.Add("EnvGeneType")
		[void]$contxt_Lbw.Items.Add("Multiple")
		[void]$contxt_Lbw.Items.Add("TotalLevel")
		[void]$contxt_Lbw.Items.Add("Feedback")
		[void]$contxt_Lbw.Items.Add("Algorithm")
		[void]$contxt_Lbw.Items.Add($contxt_Sep_Lbw)
		[void]$contxt_Lbw.Items.Add("ADSR copy")
		[void]$contxt_Lbw.Items.Add("ADSR paste")
		break;
	}'RR'{
		[void]$contxt_Lbw.Items.Add("Attack")
		[void]$contxt_Lbw.Items.Add("Decay")
		[void]$contxt_Lbw.Items.Add("Sustain")
		[void]$contxt_Lbw.Items.Add("Release [v]")
		[void]$contxt_Lbw.Items.Add("EnvGeneType")
		[void]$contxt_Lbw.Items.Add("Multiple")
		[void]$contxt_Lbw.Items.Add("TotalLevel")
		[void]$contxt_Lbw.Items.Add("Feedback")
		[void]$contxt_Lbw.Items.Add("Algorithm")
		[void]$contxt_Lbw.Items.Add($contxt_Sep_Lbw)
		[void]$contxt_Lbw.Items.Add("ADSR copy")
		[void]$contxt_Lbw.Items.Add("ADSR paste")
		break;
	}'SR'{
		[void]$contxt_Lbw.Items.Add("Attack")
		[void]$contxt_Lbw.Items.Add("Decay")
		[void]$contxt_Lbw.Items.Add("Sustain [v]")
		[void]$contxt_Lbw.Items.Add("Release")
		[void]$contxt_Lbw.Items.Add("EnvGeneType")
		[void]$contxt_Lbw.Items.Add("Multiple")
		[void]$contxt_Lbw.Items.Add("TotalLevel")
		[void]$contxt_Lbw.Items.Add("Feedback")
		[void]$contxt_Lbw.Items.Add("Algorithm")
		[void]$contxt_Lbw.Items.Add($contxt_Sep_Lbw)
		[void]$contxt_Lbw.Items.Add("ADSR copy")
		[void]$contxt_Lbw.Items.Add("ADSR paste")
		break;
	}'EG'{
		[void]$contxt_Lbw.Items.Add("Attack")
		[void]$contxt_Lbw.Items.Add("Decay")
		[void]$contxt_Lbw.Items.Add("Sustain")
		[void]$contxt_Lbw.Items.Add("Release")
		[void]$contxt_Lbw.Items.Add("EnvGeneType [v]")
		[void]$contxt_Lbw.Items.Add("Multiple")
		[void]$contxt_Lbw.Items.Add("TotalLevel")
		[void]$contxt_Lbw.Items.Add("Feedback")
		[void]$contxt_Lbw.Items.Add("Algorithm")
		[void]$contxt_Lbw.Items.Add($contxt_Sep_Lbw)
		[void]$contxt_Lbw.Items.Add("ADSR copy")
		[void]$contxt_Lbw.Items.Add("ADSR paste")
		break;
	}'ML'{
		[void]$contxt_Lbw.Items.Add("Attack")
		[void]$contxt_Lbw.Items.Add("Decay")
		[void]$contxt_Lbw.Items.Add("Sustain")
		[void]$contxt_Lbw.Items.Add("Release")
		[void]$contxt_Lbw.Items.Add("EnvGeneType")
		[void]$contxt_Lbw.Items.Add("Multiple [v]")
		[void]$contxt_Lbw.Items.Add("TotalLevel")
		[void]$contxt_Lbw.Items.Add("Feedback")
		[void]$contxt_Lbw.Items.Add("Algorithm")
		[void]$contxt_Lbw.Items.Add($contxt_Sep_Lbw)
		[void]$contxt_Lbw.Items.Add("ADSR copy")
		[void]$contxt_Lbw.Items.Add("ADSR paste")
		break;
	}'TL'{
		[void]$contxt_Lbw.Items.Add("Attack")
		[void]$contxt_Lbw.Items.Add("Decay")
		[void]$contxt_Lbw.Items.Add("Sustain")
		[void]$contxt_Lbw.Items.Add("Release")
		[void]$contxt_Lbw.Items.Add("EnvGeneType")
		[void]$contxt_Lbw.Items.Add("Multiple")
		[void]$contxt_Lbw.Items.Add("TotalLevel [v]")
		[void]$contxt_Lbw.Items.Add("Feedback")
		[void]$contxt_Lbw.Items.Add("Algorithm")
		[void]$contxt_Lbw.Items.Add($contxt_Sep_Lbw)
		[void]$contxt_Lbw.Items.Add("ADSR copy")
		[void]$contxt_Lbw.Items.Add("ADSR paste")
		break;
	}'FB'{
		[void]$contxt_Lbw.Items.Add("Attack")
		[void]$contxt_Lbw.Items.Add("Decay")
		[void]$contxt_Lbw.Items.Add("Sustain")
		[void]$contxt_Lbw.Items.Add("Release")
		[void]$contxt_Lbw.Items.Add("EnvGeneType")
		[void]$contxt_Lbw.Items.Add("Multiple")
		[void]$contxt_Lbw.Items.Add("TotalLevel")
		[void]$contxt_Lbw.Items.Add("Distortion")
		[void]$contxt_Lbw.Items.Add("Feedback [v]")
		[void]$contxt_Lbw.Items.Add("Algorithm")
		[void]$contxt_Lbw.Items.Add($contxt_Sep_Lbw)
		[void]$contxt_Lbw.Items.Add("ADSR copy")
		[void]$contxt_Lbw.Items.Add("ADSR paste")
		break;
	}'ALG'{
		[void]$contxt_Lbw.Items.Add("Attack")
		[void]$contxt_Lbw.Items.Add("Decay")
		[void]$contxt_Lbw.Items.Add("Sustain")
		[void]$contxt_Lbw.Items.Add("Release")
		[void]$contxt_Lbw.Items.Add("EnvGeneType")
		[void]$contxt_Lbw.Items.Add("Multiple")
		[void]$contxt_Lbw.Items.Add("TotalLevel")
		[void]$contxt_Lbw.Items.Add("Distortion")
		[void]$contxt_Lbw.Items.Add("Feedback")
		[void]$contxt_Lbw.Items.Add("Algorithm [v]")
		[void]$contxt_Lbw.Items.Add($contxt_Sep_Lbw)
		[void]$contxt_Lbw.Items.Add("ADSR copy")
		[void]$contxt_Lbw.Items.Add("ADSR paste")
		break;
	}default{
		[void]$contxt_Lbw.Items.Add("Attack")
		[void]$contxt_Lbw.Items.Add("Decay")
		[void]$contxt_Lbw.Items.Add("Sustain")
		[void]$contxt_Lbw.Items.Add("Release")
		[void]$contxt_Lbw.Items.Add("EnvGeneType")
		[void]$contxt_Lbw.Items.Add("Multiple")
		[void]$contxt_Lbw.Items.Add("TotalLevel")
		[void]$contxt_Lbw.Items.Add("Distortion")
		[void]$contxt_Lbw.Items.Add("Feedback")
		[void]$contxt_Lbw.Items.Add("Algorithm")
		[void]$contxt_Lbw.Items.Add($contxt_Sep_Lbw)
		[void]$contxt_Lbw.Items.Add("ADSR copy")
		[void]$contxt_Lbw.Items.Add("ADSR paste")
	}
	} #sw
 } #func
 
function Contxt_chg_opn([string] $ss){ 

	$contxt_Nbg.Items.Clear()

	switch($ss){
	'AR'{
		[void]$contxt_Nbg.Items.Add("Attack [v]")
		[void]$contxt_Nbg.Items.Add("Decay")
		[void]$contxt_Nbg.Items.Add("SustainRate")
		[void]$contxt_Nbg.Items.Add("Release")
		[void]$contxt_Nbg.Items.Add("SustainLevel")
		[void]$contxt_Nbg.Items.Add("Multiple")
		[void]$contxt_Nbg.Items.Add("TotalLevel")
		[void]$contxt_Nbg.Items.Add("Feedback")
		[void]$contxt_Nbg.Items.Add("Algorithm")
		[void]$contxt_Nbg.Items.Add($contxt_Sep_Nbg) # Separator
		[void]$contxt_Nbg.Items.Add("ADSR copy")
		[void]$contxt_Nbg.Items.Add("ADSR paste")
		break;
	}'DR'{
		[void]$contxt_Nbg.Items.Add("Attack")
		[void]$contxt_Nbg.Items.Add("Decay [v]")
		[void]$contxt_Nbg.Items.Add("SustainRate")
		[void]$contxt_Nbg.Items.Add("Release")
		[void]$contxt_Nbg.Items.Add("SustainLevel")
		[void]$contxt_Nbg.Items.Add("Multiple")
		[void]$contxt_Nbg.Items.Add("TotalLevel")
		[void]$contxt_Nbg.Items.Add("Feedback")
		[void]$contxt_Nbg.Items.Add("Algorithm")
		[void]$contxt_Nbg.Items.Add($contxt_Sep_Nbg)
		[void]$contxt_Nbg.Items.Add("ADSR copy")
		[void]$contxt_Nbg.Items.Add("ADSR paste")
		break;
	}'SR'{
		[void]$contxt_Nbg.Items.Add("Attack")
		[void]$contxt_Nbg.Items.Add("Decay")
		[void]$contxt_Nbg.Items.Add("SustainRate [v]")
		[void]$contxt_Nbg.Items.Add("Release")
		[void]$contxt_Nbg.Items.Add("SustainLevel")
		[void]$contxt_Nbg.Items.Add("Multiple")
		[void]$contxt_Nbg.Items.Add("TotalLevel")
		[void]$contxt_Nbg.Items.Add("Feedback")
		[void]$contxt_Nbg.Items.Add("Algorithm")
		[void]$contxt_Nbg.Items.Add($contxt_Sep_Nbg)
		[void]$contxt_Nbg.Items.Add("ADSR copy")
		[void]$contxt_Nbg.Items.Add("ADSR paste")
		break;
	}'RR'{
		[void]$contxt_Nbg.Items.Add("Attack")
		[void]$contxt_Nbg.Items.Add("Decay")
		[void]$contxt_Nbg.Items.Add("SustainRate")
		[void]$contxt_Nbg.Items.Add("Release [v]")
		[void]$contxt_Nbg.Items.Add("SustainLevel")
		[void]$contxt_Nbg.Items.Add("Multiple")
		[void]$contxt_Nbg.Items.Add("TotalLevel")
		[void]$contxt_Nbg.Items.Add("Feedback")
		[void]$contxt_Nbg.Items.Add("Algorithm")
		[void]$contxt_Nbg.Items.Add($contxt_Sep_Nbg)
		[void]$contxt_Nbg.Items.Add("ADSR copy")
		[void]$contxt_Nbg.Items.Add("ADSR paste")
		break;
	}'SL'{
		[void]$contxt_Nbg.Items.Add("Attack")
		[void]$contxt_Nbg.Items.Add("Decay")
		[void]$contxt_Nbg.Items.Add("SustainRate")
		[void]$contxt_Nbg.Items.Add("Release")
		[void]$contxt_Nbg.Items.Add("SustainLevel [v]")
		[void]$contxt_Nbg.Items.Add("Multiple")
		[void]$contxt_Nbg.Items.Add("TotalLevel")
		[void]$contxt_Nbg.Items.Add("Feedback")
		[void]$contxt_Nbg.Items.Add("Algorithm")
		[void]$contxt_Nbg.Items.Add($contxt_Sep_Nbg)
		[void]$contxt_Nbg.Items.Add("ADSR copy")
		[void]$contxt_Nbg.Items.Add("ADSR paste")
		break;
	}'ML'{
		[void]$contxt_Nbg.Items.Add("Attack")
		[void]$contxt_Nbg.Items.Add("Decay")
		[void]$contxt_Nbg.Items.Add("SustainRate")
		[void]$contxt_Nbg.Items.Add("Release")
		[void]$contxt_Nbg.Items.Add("SustainLevel")
		[void]$contxt_Nbg.Items.Add("Multiple [v]")
		[void]$contxt_Nbg.Items.Add("TotalLevel")
		[void]$contxt_Nbg.Items.Add("Feedback")
		[void]$contxt_Nbg.Items.Add("Algorithm")
		[void]$contxt_Nbg.Items.Add($contxt_Sep_Nbg)
		[void]$contxt_Nbg.Items.Add("ADSR copy")
		[void]$contxt_Nbg.Items.Add("ADSR paste")
		break;
	}'TL'{
		[void]$contxt_Nbg.Items.Add("Attack")
		[void]$contxt_Nbg.Items.Add("Decay")
		[void]$contxt_Nbg.Items.Add("SustainRate")
		[void]$contxt_Nbg.Items.Add("Release")
		[void]$contxt_Nbg.Items.Add("SustainLevel")
		[void]$contxt_Nbg.Items.Add("Multiple")
		[void]$contxt_Nbg.Items.Add("TotalLevel [v]")
		[void]$contxt_Nbg.Items.Add("Feedback")
		[void]$contxt_Nbg.Items.Add("Algorithm")
		[void]$contxt_Nbg.Items.Add($contxt_Sep_Nbg)
		[void]$contxt_Nbg.Items.Add("ADSR copy")
		[void]$contxt_Nbg.Items.Add("ADSR paste")
		break;
	}'FB'{
		[void]$contxt_Nbg.Items.Add("Attack")
		[void]$contxt_Nbg.Items.Add("Decay")
		[void]$contxt_Nbg.Items.Add("SustainRate")
		[void]$contxt_Nbg.Items.Add("Release")
		[void]$contxt_Nbg.Items.Add("SustainLevel")
		[void]$contxt_Nbg.Items.Add("Multiple")
		[void]$contxt_Nbg.Items.Add("TotalLevel")
		[void]$contxt_Nbg.Items.Add("Feedback [v]")
		[void]$contxt_Nbg.Items.Add("Algorithm")
		[void]$contxt_Nbg.Items.Add($contxt_Sep_Nbg)
		[void]$contxt_Nbg.Items.Add("ADSR copy")
		[void]$contxt_Nbg.Items.Add("ADSR paste")
		break;
	}'ALG'{
		[void]$contxt_Nbg.Items.Add("Attack")
		[void]$contxt_Nbg.Items.Add("Decay")
		[void]$contxt_Nbg.Items.Add("SustainRate")
		[void]$contxt_Nbg.Items.Add("Release")
		[void]$contxt_Nbg.Items.Add("SustainLevel")
		[void]$contxt_Nbg.Items.Add("Multiple")
		[void]$contxt_Nbg.Items.Add("TotalLevel")
		[void]$contxt_Nbg.Items.Add("Feedback")
		[void]$contxt_Nbg.Items.Add("Algorithm [v]")
		[void]$contxt_Nbg.Items.Add($contxt_Sep_Nbg)
		[void]$contxt_Nbg.Items.Add("ADSR copy")
		[void]$contxt_Nbg.Items.Add("ADSR paste")
		break;
	}default{
		[void]$contxt_Nbg.Items.Add("Attack")
		[void]$contxt_Nbg.Items.Add("Decay")
		[void]$contxt_Nbg.Items.Add("SustainRate")
		[void]$contxt_Nbg.Items.Add("Release")
		[void]$contxt_Nbg.Items.Add("SustainLevel")
		[void]$contxt_Nbg.Items.Add("Multiple")
		[void]$contxt_Nbg.Items.Add("TotalLevel")
		[void]$contxt_Nbg.Items.Add("Feedback")
		[void]$contxt_Nbg.Items.Add("Algorithm")
		[void]$contxt_Nbg.Items.Add($contxt_Sep_Nbg)
		[void]$contxt_Nbg.Items.Add("ADSR copy")
		[void]$contxt_Nbg.Items.Add("ADSR paste")
	}
	} #sw
 } #func
 
function Contxt_chg_opm([string] $ss){ 

	$contxt_Mbg.Items.Clear()

	switch($ss){
	'AR'{
		[void]$contxt_Mbg.Items.Add("Attack [v]")
		[void]$contxt_Mbg.Items.Add("Decay")
		[void]$contxt_Mbg.Items.Add("SustainRate")
		[void]$contxt_Mbg.Items.Add("Release")
		[void]$contxt_Mbg.Items.Add("SustainLevel")
		[void]$contxt_Mbg.Items.Add("Multiple")
		[void]$contxt_Mbg.Items.Add("TotalLevel")
		[void]$contxt_Mbg.Items.Add("Feedback")
		[void]$contxt_Mbg.Items.Add("Algorithm")
		[void]$contxt_Mbg.Items.Add($contxt_Sep_Mbg)
		[void]$contxt_Mbg.Items.Add("ADSR copy")
		[void]$contxt_Mbg.Items.Add("ADSR paste")
		break;
	}'DR'{
		[void]$contxt_Mbg.Items.Add("Attack")
		[void]$contxt_Mbg.Items.Add("Decay [v]")
		[void]$contxt_Mbg.Items.Add("SustainRate")
		[void]$contxt_Mbg.Items.Add("Release")
		[void]$contxt_Mbg.Items.Add("SustainLevel")
		[void]$contxt_Mbg.Items.Add("Multiple")
		[void]$contxt_Mbg.Items.Add("TotalLevel")
		[void]$contxt_Mbg.Items.Add("Feedback")
		[void]$contxt_Mbg.Items.Add("Algorithm")
		[void]$contxt_Mbg.Items.Add($contxt_Sep_Mbg)
		[void]$contxt_Mbg.Items.Add("ADSR copy")
		[void]$contxt_Mbg.Items.Add("ADSR paste")
		break;
	}'SR'{
		[void]$contxt_Mbg.Items.Add("Attack")
		[void]$contxt_Mbg.Items.Add("Decay")
		[void]$contxt_Mbg.Items.Add("SustainRate [v]")
		[void]$contxt_Mbg.Items.Add("Release")
		[void]$contxt_Mbg.Items.Add("SustainLevel")
		[void]$contxt_Mbg.Items.Add("Multiple")
		[void]$contxt_Mbg.Items.Add("TotalLevel")
		[void]$contxt_Mbg.Items.Add("Feedback")
		[void]$contxt_Mbg.Items.Add("Algorithm")
		[void]$contxt_Mbg.Items.Add($contxt_Sep_Mbg)
		[void]$contxt_Mbg.Items.Add("ADSR copy")
		[void]$contxt_Mbg.Items.Add("ADSR paste")
		break;
	}'RR'{
		[void]$contxt_Mbg.Items.Add("Attack")
		[void]$contxt_Mbg.Items.Add("Decay")
		[void]$contxt_Mbg.Items.Add("SustainRate")
		[void]$contxt_Mbg.Items.Add("Release [v]")
		[void]$contxt_Mbg.Items.Add("SustainLevel")
		[void]$contxt_Mbg.Items.Add("Multiple")
		[void]$contxt_Mbg.Items.Add("TotalLevel")
		[void]$contxt_Mbg.Items.Add("Feedback")
		[void]$contxt_Mbg.Items.Add("Algorithm")
		[void]$contxt_Mbg.Items.Add($contxt_Sep_Mbg)
		[void]$contxt_Mbg.Items.Add("ADSR copy")
		[void]$contxt_Mbg.Items.Add("ADSR paste")
		break;
	}'SL'{
		[void]$contxt_Mbg.Items.Add("Attack")
		[void]$contxt_Mbg.Items.Add("Decay")
		[void]$contxt_Mbg.Items.Add("SustainRate")
		[void]$contxt_Mbg.Items.Add("Release")
		[void]$contxt_Mbg.Items.Add("SustainLevel [v]")
		[void]$contxt_Mbg.Items.Add("Multiple")
		[void]$contxt_Mbg.Items.Add("TotalLevel")
		[void]$contxt_Mbg.Items.Add("Feedback")
		[void]$contxt_Mbg.Items.Add("Algorithm")
		[void]$contxt_Mbg.Items.Add($contxt_Sep_Mbg)
		[void]$contxt_Mbg.Items.Add("ADSR copy")
		[void]$contxt_Mbg.Items.Add("ADSR paste")
		break;
	}'ML'{
		[void]$contxt_Mbg.Items.Add("Attack")
		[void]$contxt_Mbg.Items.Add("Decay")
		[void]$contxt_Mbg.Items.Add("SustainRate")
		[void]$contxt_Mbg.Items.Add("Release")
		[void]$contxt_Mbg.Items.Add("SustainLevel")
		[void]$contxt_Mbg.Items.Add("Multiple [v]")
		[void]$contxt_Mbg.Items.Add("TotalLevel")
		[void]$contxt_Mbg.Items.Add("Feedback")
		[void]$contxt_Mbg.Items.Add("Algorithm")
		[void]$contxt_Mbg.Items.Add($contxt_Sep_Mbg)
		[void]$contxt_Mbg.Items.Add("ADSR copy")
		[void]$contxt_Mbg.Items.Add("ADSR paste")
		break;
	}'TL'{
		[void]$contxt_Mbg.Items.Add("Attack")
		[void]$contxt_Mbg.Items.Add("Decay")
		[void]$contxt_Mbg.Items.Add("SustainRate")
		[void]$contxt_Mbg.Items.Add("Release")
		[void]$contxt_Mbg.Items.Add("SustainLevel")
		[void]$contxt_Mbg.Items.Add("Multiple")
		[void]$contxt_Mbg.Items.Add("TotalLevel [v]")
		[void]$contxt_Mbg.Items.Add("Feedback")
		[void]$contxt_Mbg.Items.Add("Algorithm")
		[void]$contxt_Mbg.Items.Add($contxt_Sep_Mbg)
		[void]$contxt_Mbg.Items.Add("ADSR copy")
		[void]$contxt_Mbg.Items.Add("ADSR paste")
		break;
	}'FB'{
		[void]$contxt_Mbg.Items.Add("Attack")
		[void]$contxt_Mbg.Items.Add("Decay")
		[void]$contxt_Mbg.Items.Add("SustainRate")
		[void]$contxt_Mbg.Items.Add("Release")
		[void]$contxt_Mbg.Items.Add("SustainLevel")
		[void]$contxt_Mbg.Items.Add("Multiple")
		[void]$contxt_Mbg.Items.Add("TotalLevel")
		[void]$contxt_Mbg.Items.Add("Feedback [v]")
		[void]$contxt_Mbg.Items.Add("Algorithm")
		[void]$contxt_Mbg.Items.Add($contxt_Sep_Mbg)
		[void]$contxt_Mbg.Items.Add("ADSR copy")
		[void]$contxt_Mbg.Items.Add("ADSR paste")
		break;
	}'ALG'{
		[void]$contxt_Mbg.Items.Add("Attack")
		[void]$contxt_Mbg.Items.Add("Decay")
		[void]$contxt_Mbg.Items.Add("SustainRate")
		[void]$contxt_Mbg.Items.Add("Release")
		[void]$contxt_Mbg.Items.Add("SustainLevel")
		[void]$contxt_Mbg.Items.Add("Multiple")
		[void]$contxt_Mbg.Items.Add("TotalLevel")
		[void]$contxt_Mbg.Items.Add("Feedback")
		[void]$contxt_Mbg.Items.Add("Algorithm [v]")
		[void]$contxt_Mbg.Items.Add($contxt_Sep_Mbg)
		[void]$contxt_Mbg.Items.Add("ADSR copy")
		[void]$contxt_Mbg.Items.Add("ADSR paste")
		break;
	}default{
		[void]$contxt_Mbg.Items.Add("Attack")
		[void]$contxt_Mbg.Items.Add("Decay")
		[void]$contxt_Mbg.Items.Add("SustainRate")
		[void]$contxt_Mbg.Items.Add("Release")
		[void]$contxt_Mbg.Items.Add("SustainLevel")
		[void]$contxt_Mbg.Items.Add("Multiple")
		[void]$contxt_Mbg.Items.Add("TotalLevel")
		[void]$contxt_Mbg.Items.Add("Feedback")
		[void]$contxt_Mbg.Items.Add("Algorithm")
		[void]$contxt_Mbg.Items.Add($contxt_Sep_Mbg)
		[void]$contxt_Mbg.Items.Add("ADSR copy")
		[void]$contxt_Mbg.Items.Add("ADSR paste")
	}
	} #sw
 } #func
 
function Contxt_octave([string]$a){ 

	$contxt_oct.Items.Clear()

	switch($a){
	'o1'{
		[void]$contxt_oct.Items.Add("o1 [v]")
		[void]$contxt_oct.Items.Add("o2")
		[void]$contxt_oct.Items.Add("o3")
		[void]$contxt_oct.Items.Add("o4")
		[void]$contxt_oct.Items.Add("o5")
		[void]$contxt_oct.Items.Add("o6")
		[void]$contxt_oct.Items.Add("o7")
		[void]$contxt_oct.Items.Add("o8")
		break;
	}'o2'{
		[void]$contxt_oct.Items.Add("o1")
		[void]$contxt_oct.Items.Add("o2 [v]")
		[void]$contxt_oct.Items.Add("o3")
		[void]$contxt_oct.Items.Add("o4")
		[void]$contxt_oct.Items.Add("o5")
		[void]$contxt_oct.Items.Add("o6")
		[void]$contxt_oct.Items.Add("o7")
		[void]$contxt_oct.Items.Add("o8")
		break;
	}'o3'{
		[void]$contxt_oct.Items.Add("o1")
		[void]$contxt_oct.Items.Add("o2")
		[void]$contxt_oct.Items.Add("o3 [v]")
		[void]$contxt_oct.Items.Add("o4")
		[void]$contxt_oct.Items.Add("o5")
		[void]$contxt_oct.Items.Add("o6")
		[void]$contxt_oct.Items.Add("o7")
		[void]$contxt_oct.Items.Add("o8")
		break;
	}'o4'{
		[void]$contxt_oct.Items.Add("o1")
		[void]$contxt_oct.Items.Add("o2")
		[void]$contxt_oct.Items.Add("o3")
		[void]$contxt_oct.Items.Add("o4 [v]")
		[void]$contxt_oct.Items.Add("o5")
		[void]$contxt_oct.Items.Add("o6")
		[void]$contxt_oct.Items.Add("o7")
		[void]$contxt_oct.Items.Add("o8")
		break;
	}'o5'{
		[void]$contxt_oct.Items.Add("o1")
		[void]$contxt_oct.Items.Add("o2")
		[void]$contxt_oct.Items.Add("o3")
		[void]$contxt_oct.Items.Add("o4")
		[void]$contxt_oct.Items.Add("o5 [v]")
		[void]$contxt_oct.Items.Add("o6")
		[void]$contxt_oct.Items.Add("o7")
		[void]$contxt_oct.Items.Add("o8")
		break;
	}'o6'{
		[void]$contxt_oct.Items.Add("o1")
		[void]$contxt_oct.Items.Add("o2")
		[void]$contxt_oct.Items.Add("o3")
		[void]$contxt_oct.Items.Add("o4")
		[void]$contxt_oct.Items.Add("o5")
		[void]$contxt_oct.Items.Add("o6 [v]")
		[void]$contxt_oct.Items.Add("o7")
		[void]$contxt_oct.Items.Add("o8")
		break;
	}'o7'{
		[void]$contxt_oct.Items.Add("o1")
		[void]$contxt_oct.Items.Add("o2")
		[void]$contxt_oct.Items.Add("o3")
		[void]$contxt_oct.Items.Add("o4")
		[void]$contxt_oct.Items.Add("o5")
		[void]$contxt_oct.Items.Add("o6")
		[void]$contxt_oct.Items.Add("o7 [v]")
		[void]$contxt_oct.Items.Add("o8")
		break;
	}'o8'{
		[void]$contxt_oct.Items.Add("o1")
		[void]$contxt_oct.Items.Add("o2")
		[void]$contxt_oct.Items.Add("o3")
		[void]$contxt_oct.Items.Add("o4")
		[void]$contxt_oct.Items.Add("o5")
		[void]$contxt_oct.Items.Add("o6")
		[void]$contxt_oct.Items.Add("o7")
		[void]$contxt_oct.Items.Add("o8 [v]")
	}
	} #sw
 } #func
  
# poly 
	 
function Flow_ssg([int]$num, [array]$e, [int]$width, [int]$height){ 


	[array]$d= @("","","","", "","","","",  "","","")

	[int]$ar= $e[0]
	[int]$dr= $e[1]
	[int]$sl= $e[2]
	[int]$sr= $e[3]
	[int]$rl= $e[4]
	[int]$rr= $e[5]

	switch($key["eg_type"]){
	'8'{
		[int[]]$d[0]= 0, $height
		[int[]]$d[1]= 0, 0

		[int[]]$d[2]= ($width*2), $height
		[int[]]$d[3]= ($width*2), 0

		[int[]]$d[4]= ($width*4), $height
		[int[]]$d[5]= ($width*4), 0
		[int[]]$d[6]= ($width*4), ($height*2)
		[int[]]$d[7]= ($width*4), $height

		[int[]]$d[8]= ($width*2), ($height*2)
		[int[]]$d[9]= ($width*2), $height

		[int[]]$d[10]= 0, ($height*2)

		break;
	}'9'{
		[int[]]$d[0]= 0, $height
		[int[]]$d[1]= 0, 0

		[int[]]$d[2]= ($width*2), $height
		[int[]]$d[3]= ($width*2), $height

		[int[]]$d[4]= ($width*4), $height
		[int[]]$d[5]= ($width*4), $height
		[int[]]$d[6]= ($width*4), $height
		[int[]]$d[7]= ($width*4), $height

		[int[]]$d[8]= ($width*2), $height
		[int[]]$d[9]= ($width*2), $height

		[int[]]$d[10]= 0, ($height*2)

		break;
	}'10'{
		[int[]]$d[0]= 0, $height
		[int[]]$d[1]= 0, 0

		[int[]]$d[2]= ($width*1), $height
		[int[]]$d[3]= ($width*2), 0

		[int[]]$d[4]= ($width*3), $height

		[int[]]$d[5]= ($width*4), 0
		[int[]]$d[6]= ($width*4), ($height*2)

		[int[]]$d[7]= ($width*3), $height

		[int[]]$d[8]= ($width*2), ($height*2)
		[int[]]$d[9]= ($width*1), $height

		[int[]]$d[10]= 0, ($height*2)

		break;
	}'11'{
		[int[]]$d[0]= 0, $height
		[int[]]$d[1]= 0, 0

		[int[]]$d[2]= ($width*2), $height
		[int[]]$d[3]= ($width*2), 0

		[int[]]$d[4]= ($width*4), 0
		[int[]]$d[5]= ($width*4), 0
		[int[]]$d[6]= ($width*4), ($height*2)
		[int[]]$d[7]= ($width*4), ($height*2)

		[int[]]$d[8]= ($width*2), ($height*2)
		[int[]]$d[9]= ($width*2), $height

		[int[]]$d[10]= 0, ($height*2)

		break;
	}'12'{
		[int[]]$d[0]= 0, $height
		[int[]]$d[1]= ($width*2), 0

		[int[]]$d[2]= ($width*2), $height
		[int[]]$d[3]= ($width*4), 0

		[int[]]$d[4]= ($width*4), $height
		[int[]]$d[5]= ($width*4), 0
		[int[]]$d[6]= ($width*4), ($height*2)
		[int[]]$d[7]= ($width*4), $height

		[int[]]$d[8]= ($width*4), ($height*2)
		[int[]]$d[9]= ($width*2), $height

		[int[]]$d[10]= ($width*2), ($height*2)

		break;
	}'13'{
		[int[]]$d[0]= 0, $height
		[int[]]$d[1]= ($width*2), 0

		[int[]]$d[2]= ($width*2), 0
		[int[]]$d[3]= ($width*4), 0

		[int[]]$d[4]= ($width*4), 0
		[int[]]$d[5]= ($width*4), 0
		[int[]]$d[6]= ($width*4), ($height*2)
		[int[]]$d[7]= ($width*4), ($height*2)

		[int[]]$d[8]= ($width*4), ($height*2)
		[int[]]$d[9]= ($width*2), ($height*2)

		[int[]]$d[10]= ($width*2), ($height*2)

		break;
	}'14'{
		[int[]]$d[0]= 0, $height
		[int[]]$d[1]= ($width*1), 0

		[int[]]$d[2]= ($width*2), $height
		[int[]]$d[3]= ($width*3), 0

		[int[]]$d[4]= ($width*4), $height
		[int[]]$d[5]= ($width*4), 0
		[int[]]$d[6]= ($width*4), ($height*2)
		[int[]]$d[7]= ($width*4), $height

		[int[]]$d[8]= ($width*3), ($height*2)
		[int[]]$d[9]= ($width*2), $height

		[int[]]$d[10]= ($width*1), ($height*2)

		break;
	}'15'{
		[int[]]$d[0]= 0, $height
		[int[]]$d[1]= ($width*2), 0

		[int[]]$d[2]= ($width*2), $height
		[int[]]$d[3]= ($width*4), $height

		[int[]]$d[4]= ($width*4), $height
		[int[]]$d[5]= ($width*4), $height
		[int[]]$d[6]= ($width*4), $height
		[int[]]$d[7]= ($width*4), $height

		[int[]]$d[8]= ($width*4), $height
		[int[]]$d[9]= ($width*2), $height

		[int[]]$d[10]= ($width*2), ($height*2)
	}
	} #sw


	[int]$i= 0
	for($i=0; $i -lt 11; $i++){

		$script:pointsg[$num][$i].X= $d[$i][0]+ 1 # 1px zurashi
		$script:pointsg[$num][$i].Y= $d[$i][1]
	} #
 } #func
 
function Flow_point([int]$num, [array]$e, [int]$width, [int]$height){ 


	[array]$d= @("","","","", "","","","")

	[int]$ar= $e[0]
	[int]$dr= $e[1]
	[int]$sl= $e[2]
	[int]$sr= $e[3]
	[int]$rl= $e[4]
	[int]$rr= $e[5]


	[int[]]$d[0]= 0, $height

	[int[]]$d[1]= ($width- $ar), 0
	[int[]]$d[2]= ($width*2- ($ar+$dr)), ($height- $sl)
	[int[]]$d[3]= ($width*3- ($ar+$dr+$sr)), ($height- ($sl- $rl))

	[int[]]$d[4]= ($width*4- ($ar+$dr+$sr+$rr)), $height

	[int[]]$d[5]= ($width*3- ($ar+$dr+$sr)), ($height+ ($sl- $rl))
	[int[]]$d[6]= ($width*2- ($ar+$dr)), ($height+ $sl)
	[int[]]$d[7]= ($width- $ar), ($height*2)


	[int]$i= 0
	for($i=0; $i -lt 8; $i++){

		$script:pointed[$num][$i].X= $d[$i][0]+ 1 # 1px zurashi
		$script:pointed[$num][$i].Y= $d[$i][1]
	} #
 } #func
 
function Flow_poinw([int]$num, [array]$e, [int]$damp, [int]$width, [int]$height){ 


	[array]$d= @("","","","", "","","","")

	[int]$ar= $e[0]
	[int]$dr= $e[1]
	[int]$sl= $e[2]

	if($damp -eq 1){ [int]$hd= 0
	}else{		 [int]$hd= $e[3]
	}

	[int]$rr= $e[4]


	[int[]]$d[0]= 0, $height

	[int[]]$d[1]= ($width- $ar), 0
	[int[]]$d[2]= ($width*2- ($ar+$dr)), ($height- $sl)
	[int[]]$d[3]= ($width*3- ($ar+$dr+$hd)), ($height- $sl)

	[int[]]$d[4]= ($width*4- ($ar+$dr+$hd+$rr)), $height

	[int[]]$d[5]= ($width*3- ($ar+$dr+$hd)), ($height+ $sl)
	[int[]]$d[6]= ($width*2- ($ar+$dr)), ($height+ $sl)
	[int[]]$d[7]= ($width- $ar), ($height*2)


	[int]$i= 0
	for($i=0; $i -lt 8; $i++){

		$script:pointed[$num][$i].X= $d[$i][0]+ 1 # 1px zurashi
		$script:pointed[$num][$i].Y= $d[$i][1]
	} #
 } #func
 
# ------ 
 
function Poly_2op([array]$v, [int]$j){ # 2op ADSR render 

	[int[]]$img= 320, 200 # Op.box

	[array]$rr= Color_select

	[array]$color= $rr[0]
	$brush= $rr[1]

	[int]$width= ($img[0]+2)/ 4	# +2 sinとの帳尻
	[int]$height= ($img[1]+2)/ 2


	[array]$xy= @(0,0) # 2op

	[int[]]$xy[$j]= 0,0,0,0,0 # ar dr sl hold rr

	$xy[$j][0]= $width* $v[$j][0]/ 15	# ar
	$xy[$j][1]= $width* $v[$j][1]/ 15	# dr
	$xy[$j][2]= $height* (15- $v[$j][2])/ 15 # sl # 0max
	$xy[$j][3]= $width			# hold
	$xy[$j][4]= $width* $v[$j][3]/ 15	# rr

	[int]$damp= $v[$j][4]


  switch($j){

  0{
	Flow_poinw 0 $xy[0] $damp $width $height

	$buffz.Graphics.Clear($color[0])			#fill
	$buffz.Graphics.FillPolygon($brush, $pointed[0])	# 折れ線のfill
	$buffz.Graphics.DrawLine($XBpen, 0, $height, ($width*4), $height) # x軸を上書き

	break;
  }1{
	Flow_poinw 1 $xy[1] $damp $width $height

	$buffx.Graphics.Clear($color[1])
	$buffx.Graphics.FillPolygon($brush, $pointed[1])
	$buffx.Graphics.DrawLine($XRpen, 0, $height, ($width*4), $height)
  }
  } #sw

 } #func
 
function Poly_4op([array]$v, [int]$j){ # 4op ADSR render 

	[int[]]$img= 320, 200 # Op.box

	[array]$rr= Color_select

	[array]$color= $rr[0]
	$brush= $rr[1]

	[int]$width= ($img[0]+2)/ 4	# +2 sinとの帳尻
	[int]$height= ($img[1]+2)/ 2


	[array]$xy= @(0,0,0,0) # 4op

	[int[]]$xy[$j]= 0,0,0,0,0,0 # ar dr sl sr rl rr

	$xy[$j][0]= $width* $v[$j][0]/ 31	# ar
	$xy[$j][1]= $width* $v[$j][1]/ 31	# dr
	$xy[$j][2]= $height* (15- $v[$j][2])/ 15 # sl # 0max
	$xy[$j][3]= $width* $v[$j][3]/ 31	# sr
	$xy[$j][4]= $xy[$j][2]* $v[$j][3]/ 31	# rl
	$xy[$j][5]= $width* $v[$j][4]/ 15	# rr


	switch($j){
	0{
	 	$buffc.Graphics.Clear($color[0])	# fill

		if(MSop_checker 1 "mask"){

			if(MSop_checker 1 "ssg"){
				Flow_ssg 0 $xy[0] $width $height
				$pt= $pointsg[0]
			}else{
				Flow_point 0 $xy[0] $width $height
				$pt= $pointed[0]
			}
			$buffc.Graphics.FillPolygon($brush, $pt)	# 折れ線のfill
		}

		$buffc.Graphics.DrawLine($XBpen, 0, $height, $img[0], $height) # x軸を上書き
		break;
	}1{
		$buffe.Graphics.Clear($color[1])

		if(MSop_checker 2 "mask"){
			if(MSop_checker 2 "ssg"){
				Flow_ssg 1 $xy[1] $width $height
				$pt= $pointsg[1]
			}else{
				Flow_point 1 $xy[1] $width $height
				$pt= $pointed[1]
			}
			$buffe.Graphics.FillPolygon($brush, $pt)
		}

		$buffe.Graphics.DrawLine($XGpen, 0, $height, $img[0], $height)
		break;
	}2{
		$buffg.Graphics.Clear($color[2])

		if(MSop_checker 4 "mask"){
			if(MSop_checker 4 "ssg"){
				Flow_ssg 2 $xy[2] $width $height
				$pt= $pointsg[2]
			}else{
				Flow_point 2 $xy[2] $width $height
				$pt= $pointed[2]
			}
			$buffg.Graphics.FillPolygon($brush, $pt)
		}

		$buffg.Graphics.DrawLine($XOpen, 0, $height, $img[0], $height)
		break;
	}3{
		$buffi.Graphics.Clear($color[3])

		if(MSop_checker 8 "mask"){
			if(MSop_checker 8 "ssg"){
				Flow_ssg 3 $xy[3] $width $height
				$pt= $pointsg[3]
			}else{
				Flow_point 3 $xy[3] $width $height
				$pt= $pointed[3]
			}
			$buffi.Graphics.FillPolygon($brush, $pt)
		}

		$buffi.Graphics.DrawLine($XRpen, 0, $height, $img[0], $height)
	}
	} #sw
 } #func
 
function Poly_chw(){ 

	[int]$j= Idx # op.num

	switch($comb_fm.SelectedItem){

	'vrc7 2op'{
		[array]$arr= $vrc_svn

		[array]$env= @(0,0) # jag # ar,dr,sl,rr,eg
		$env[$j]= @($arr[$j][2],$arr[$j][3],$arr[$j][4],$arr[$j][5],$arr[$j][10])
		break;
	}'opl 2op'{
		[array]$arr= $opl_two

		[array]$env= @(0,0) # ar,dr,sl,rr,eg
		$env[$j]= @($arr[$j][2],$arr[$j][3],$arr[$j][5],$arr[$j][4],$arr[$j][10])
	}
	} #sw


	switch($j){
	0{
		$pict_panel.SuspendLayout()

		Poly_2op $env $j
		$buffz.Render($gpv) # ura buffer store

		$buffz.Render($gp_tmp);
		$gpz.DrawImage($image_tmp, $op_Rect) # size down


		$gpz.DrawLines($Mpen, $pointing[0]) # sin wave

		[string[]]$value= Value_out
		$gpz.DrawString($value[0], $Fona, $XBbrush, 120,5)

		$pict_panel.ResumeLayout()

		$Pictbox1a.Refresh()
		break;
	}1{
		$pict_panel.SuspendLayout()

		Poly_2op $env $j
		$buffx.Render($gpt) # ura buffer store

		$buffx.Render($gp_tmp);
		$gpx.DrawImage($image_tmp, $op_Rect) # size down


		$gpx.DrawLines($Cpen, $pointing[1]) # sin wave

		[string[]]$value= Value_out
		$gpx.DrawString($value[1], $Fona, $XRbrush, 120,5)

		$pict_panel.ResumeLayout()

		$Pictbox2a.Refresh()
	}
	} #sw


 } #func
 
function Poly_chg(){ 

	[int]$j= Idx

	switch($comb_fm.SelectedItem){
	'opn 4op'{	[array]$arr= $opn_fur; break;
	}'opm 4op'{	[array]$arr= $opm_fur
	}
	} #sw

	[array]$env= @(0,0,0,0) # jag op # ar,dr,sllev,sl,rr
	$env[$j]= @($arr[$j][2],$arr[$j][3],$arr[$j][6],$arr[$j][4],$arr[$j][5])


	switch($j){
	0{
		$pict_panel.SuspendLayout()

		Poly_4op $env $j
		$buffc.Render($gpk) # ura buffer

		$buffc.Render($gp_tmp);
		$gpc.DrawImage($image_tmp, $op_Rect)


		$gpc.DrawLines($Mpen, $pointing[0]) # sine wave

		[string[]]$value= Value_out
		$gpc.DrawString($value[0], $Fona, $XBbrush, 120,5)

		$pict_panel.ResumeLayout()

		$Pictbox1.Refresh()
		break;
	}1{
		$pict_panel.SuspendLayout()

		Poly_4op $env $j
		$buffe.Render($gpm)

		$buffe.Render($gp_tmp);
		$gpe.DrawImage($image_tmp, $op_Rect)


		$gpe.DrawLines($Ypen, $pointing[1])

		[string[]]$value= Value_out
		$gpe.DrawString($value[1], $Fona, $XGbrush, 120,5)

		$pict_panel.ResumeLayout()

		$Pictbox2.Refresh()
		break;
	}2{
		$pict_panel.SuspendLayout()

		Poly_4op $env $j
		$buffg.Render($gpo)

		$buffg.Render($gp_tmp);
		$gpg.DrawImage($image_tmp, $op_Rect)


		$gpg.DrawLines($Lpen, $pointing[2])

		[string[]]$value= Value_out
		$gpg.DrawString($value[2], $Fona, $XObrush, 120,5)

		$pict_panel.ResumeLayout()

		$Pictbox3.Refresh()
		break;
	}3{
		$pict_panel.SuspendLayout()

		Poly_4op $env $j
		$buffi.Render($gpq)

		$buffi.Render($gp_tmp);
		$gpi.DrawImage($image_tmp, $op_Rect)


		$gpi.DrawLines($Cpen, $pointing[3])

		[string[]]$value= Value_out
		$gpi.DrawString($value[3], $Fona, $XRbrush, 120,5)

		$pict_panel.ResumeLayout()

		$Pictbox4.Refresh()
	}
	} #sw
 } #func
  
# sine 
	
function Flowtting_point([int]$cnt, [int]$opt, [array]$xy){ 

	[int]$i= 0
	for($i=0; $i -lt $cnt; $i++){

		$script:pointing[$opt][$i].X= $xy[$i][0]+ 2 # 2px zurashi
		$script:pointing[$opt][$i].Y= $xy[$i][1]
	} #
 } #func
 
function Point_obj([int]$cnt){ 

	# 4op分,(2opも)
	[array]$pt= @("","","","")

	[array]$pt[0]= ""; $pt[0]*= $cnt
	[array]$pt[1]= ""; $pt[1]*= $cnt
	[array]$pt[2]= ""; $pt[2]*= $cnt
	[array]$pt[3]= ""; $pt[3]*= $cnt

  for([int]$num= 0; $num -lt $cnt; $num++){

	$pt[0][$num]= New-Object System.Drawing.Point # loop de obj nomi ka
	$pt[1][$num]= New-Object System.Drawing.Point
	$pt[2][$num]= New-Object System.Drawing.Point
	$pt[3][$num]= New-Object System.Drawing.Point
  } #

	return $pt
 } #func
 
function Sin_position([int]$cc){ 

	[array]$pos= "","","","" # 4op(2op)

	[array]$pos[0]= ""; $pos[0]*= $cc # [int[]]だとps5ダメ
	[array]$pos[1]= ""; $pos[1]*= $cc
	[array]$pos[2]= ""; $pos[2]*= $cc
	[array]$pos[3]= ""; $pos[3]*= $cc


	for([int]$aa=0; $aa -lt $cc; $aa++){

		[int[]]$pos[0][$aa]= 0,0 # x,y
		[int[]]$pos[1][$aa]= 0,0
		[int[]]$pos[2][$aa]= 0,0
		[int[]]$pos[3][$aa]= 0,0
	} #

	return $pos
 } #func
 
function Sin_mapping([int]$cnt,[double]$rad){ 

 [float[]]$mul= @( 0.5, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15) # 倍音

 [array]$s_map= 0
 $s_map*= $mul.length


 [int]$jj= 0

 while($jj -lt $mul.length){


	[double[]]$s_map[$jj]= 0
	$s_map[$jj]*= $cnt

	for([int]$ii= 0; $ii -lt $cnt; $ii++){

		#回転応じたラジアン値出力


		$s_map[$jj][$ii]+= $ii* $rad* 2* $mul[$jj]/ $cnt
		# x軸[1->80]px * 2PI rad * 倍音数 / 80px
	} #

	$jj++;
 } #

 return $s_map

 } #func
 
function Reso([int]$b){ 

	[int[]]$img= 320, 200 # Op.box

	[int]$script:count= $img[0]/ $b


	[array]$script:sin_pos= Sin_position $count # "0"の配列ブロック
	[array]$script:sin_map= Sin_mapping $count $radian

	# 参照型

	[array]$script:pointed= Point_obj 8 # polygon point obj
	[array]$script:pointsg= Point_obj 11 # polygon ssg-eg
	[array]$script:pointing= Point_obj $count # sine
 } #func
 
# ------ 
 
function Sin_2op([array]$rc,[int]$alg,[int]$fbj){ # 2op sin render 


	[int[]]$img= 320, 200 # Op.box

	[int]$adj_value= $key["adjust"] # <- (-0.75*$tl[0]/ [[20]])

	[int]$height= $img[1] / 2 # 中心線
	[float]$adjv= $height/ $adj_value # 度合い


	[float[]]$feb= @(0, 0.0625, 0.125, 0.25, 0.5, 1,2,4)
	# 変調度 0,(1/16),(1/8),(1/4), (1/2), 1,2,4
	[float]$feedback= $feb[$fbj]* $radian/ $adj_value # 移動平均ため


	[int[]]$dist= @($rc[0][2],$rc[1][2]) # 半整流


	[int[]]$tl= @($rc[0][0],$rc[1][0]) # tl [0-63]
	[int[]]$ml= @($rc[0][1],$rc[1][1]) # ml [int]::Parse(), -as [int] ___0 -> 0



	# -0.75dB* [0-63] として計算

	## [float]$atai= -0.75/ 20

	[float[]]$rdus= @(0,0)

	## $rdus[0]= [Math]::Pow(10, ($atai* $tl[0]))* 20
	# (-0.75*$tl[0]/ 20) -> -0.0375
	$rdus[0]= [Math]::Pow(10, (-0.0375* $tl[0]))* 20
	$rdus[1]= [Math]::Pow(10, (-0.0375* $tl[1]))* 20

	[int]$bai_value= $bai

	if($bai_value -ne 1){
		$rdus[0]= [Math]::Round($rdus[0],4,"ToEven") # MidpointRounding.ToEven / ginkohya marume
		$rdus[1]= [Math]::Round($rdus[1],4,"ToEven")
	}

	[float[]]$ye= @(0,0,0) # 2op

	[array]$xy= $sin_pos # "0"の変数ブロック
	[array]$sine= $sin_map # gbl -> localへメモリアクセス

	[int]$i= 0
	for($i=0; $i -lt $count; $i++){ # x軸

		# [Math]::Sin直接書き込み高速化ため

		# op.1 // $sin_map= x軸[0-79]px * 2PI [radian] * ML / 80px

		$ye[0]= $rdus[0]* [Math]::Sin($sine[$ml[0]][$i]+ $ye[2])
		$ye[2]= $feedback* ($ye[0]+ $ye[2]) # 2sampleの場合


		switch($alg){
		0{	# 直列
			if($dist[0] -eq 1){
				if($ye[0] -lt 0){
					$ye[0]= 0 # 半整流 vrc7 nomi
				}
			}

			$ye[1]= $rdus[1]* [Math]::Sin($sine[$ml[1]][$i]+ $ye[0]) # y座標値

			if($dist[1] -eq 1){
				if($ye[1] -lt 0){
					$ye[1]= 0
				}
			}
			break;

		}1{	# 並列 opl2 nomi

			$ye[1]= $rdus[1]* [Math]::Sin($sine[$ml[1]][$i])
		}
		} #sw

		$ye[0]= $height- $ye[0]* $adjv
		$ye[1]= $height- $ye[1]* $adjv

		$xy[0][$i]= ($i* $bai_value/ 2), ($ye[0]/ 2)
		$xy[1][$i]= ($i* $bai_value/ 2), ($ye[1]/ 2)
	} #

	Flowtting_point $count 0 $xy[0]
	Flowtting_point $count 1 $xy[1]

	$gpz.DrawLines($Mpen, $pointing[0])
	$gpx.DrawLines($Cpen, $pointing[1])
 } #func
 
function Sin_4op([array]$rc,[int]$alg,[int]$fbj){ # 4op sin render 


	[int[]]$img= 320, 200 # Op.box

	[int]$adj_value= $key["adjust"]

	[int]$height= $img[1]/ 2
	[float]$adjv= $height/ $adj_value


	[float[]]$feb= @(0, 0.0625, 0.125, 0.25, 0.5, 1,2,4) # 変調度
	[float]$feedback= $feb[$fbj]* $radian/ $adj_value


	[int[]]$tl= @($rc[0][0],$rc[1][0],$rc[2][0],$rc[3][0]) # tl [0-127]
	[int[]]$ml= @($rc[0][1],$rc[1][1],$rc[2][1],$rc[3][1]) # ml


	# -0.75dB* [0-127] として計算
	## [float]$atai= -0.75/ 20

	[float[]]$rdus= @(0,0,0,0)

	## $rdus[0]= [Math]::Pow(10, ($atai* $tl[0]))* 20
	# [Math]::Pow(10, (-0.0375* 0))= 1
	$rdus[0]= [Math]::Pow(10, (-0.0375* $tl[0]))* 20
	$rdus[1]= [Math]::Pow(10, (-0.0375* $tl[1]))* 20
	$rdus[2]= [Math]::Pow(10, (-0.0375* $tl[2]))* 20
	$rdus[3]= [Math]::Pow(10, (-0.0375* $tl[3]))* 20

	[int]$bai_value= $bai

	if($bai_value -ne 1){

		$rdus[0]= [Math]::Round($rdus[0],4,"ToEven") # MidpointRounding.ToEven / ginkohya marume
		$rdus[1]= [Math]::Round($rdus[1],4,"ToEven")
		$rdus[2]= [Math]::Round($rdus[2],4,"ToEven")
		$rdus[3]= [Math]::Round($rdus[3],4,"ToEven")
	}


	[float[]]$ye= @(0,0,0, 0,0,0) # 4op+ 2

	[array]$xy= $sin_pos
	[array]$sine= $sin_map

	[int]$i= 0
	for($i=0; $i -lt $count; $i++){ # x軸

		# op.1
		$ye[0]= $rdus[0]* [Math]::Sin($sine[$ml[0]][$i] +$ye[4])
		$ye[4]= $feedback* ($ye[0]+ $ye[4]) # 2sampleの場合

		switch($alg){
		0{	# 直列
			$ye[1]= $rdus[1]* [Math]::Sin($sine[$ml[1]][$i]+ $ye[0]) # y座標値
			$ye[2]= $rdus[2]* [Math]::Sin($sine[$ml[2]][$i]+ $ye[1])
			$ye[3]= $rdus[3]* [Math]::Sin($sine[$ml[3]][$i]+ $ye[2])
			break;
		}1{
			$ye[1]= $rdus[1]* [Math]::Sin($sine[$ml[1]][$i])

			$ye[5]= $ye[0]+ $ye[1] # 合値
			$ye[2]= $rdus[2]* [Math]::Sin($sine[$ml[2]][$i]+ $ye[5])

			$ye[3]= $rdus[3]* [Math]::Sin($sine[$ml[3]][$i]+ $ye[2])
			break;
		}2{
			$ye[1]= $rdus[1]* [Math]::Sin($sine[$ml[1]][$i])
			$ye[2]= $rdus[2]* [Math]::Sin($sine[$ml[2]][$i]+ $ye[1])

			$ye[5]= $ye[0]+ $ye[2]
			$ye[3]= $rdus[3]* [Math]::Sin($sine[$ml[3]][$i]+ $ye[5])
			break;
		}3{
			$ye[1]= $rdus[1]* [Math]::Sin($sine[$ml[1]][$i]+ $ye[0])

			$ye[2]= $rdus[2]* [Math]::Sin($sine[$ml[2]][$i])

			$ye[5]= $ye[1]+ $ye[2]
			$ye[3]= $rdus[3]* [Math]::Sin($sine[$ml[3]][$i]+ $ye[5])
			break;
		}4{
			$ye[1]= $rdus[1]* [Math]::Sin($sine[$ml[1]][$i]+ $ye[0])

			$ye[2]= $rdus[2]* [Math]::Sin($sine[$ml[2]][$i])
			$ye[3]= $rdus[3]* [Math]::Sin($sine[$ml[3]][$i]+ $ye[2])
			break;
		}5{
			$ye[1]= $rdus[1]* [Math]::Sin($sine[$ml[1]][$i]+ $ye[0])
			$ye[2]= $rdus[2]* [Math]::Sin($sine[$ml[2]][$i]+ $ye[0])
			$ye[3]= $rdus[3]* [Math]::Sin($sine[$ml[3]][$i]+ $ye[0])
			break;
		}6{
			$ye[1]= $rdus[1]* [Math]::Sin($sine[$ml[1]][$i]+ $ye[0])
			$ye[2]= $rdus[2]* [Math]::Sin($sine[$ml[2]][$i])
			$ye[3]= $rdus[3]* [Math]::Sin($sine[$ml[3]][$i])
			break;
		}7{	# 並列
			$ye[1]= $rdus[1]* [Math]::Sin($sine[$ml[1]][$i])
			$ye[2]= $rdus[2]* [Math]::Sin($sine[$ml[2]][$i])
			$ye[3]= $rdus[3]* [Math]::Sin($sine[$ml[3]][$i])

			# 全て合成出力
			# $ye[3]= $adj_value* [Math]::Sin($ye[0]+ $ye[1]+ $ye[2]+ $ye[3])
		}
		} #sw

		$ye[0]= $height- $ye[0]* $adjv
		$ye[1]= $height- $ye[1]* $adjv
		$ye[2]= $height- $ye[2]* $adjv
		$ye[3]= $height- $ye[3]* $adjv

		$xy[0][$i]= ($i* $bai_value/ 2),  ($ye[0]/ 2)
		$xy[1][$i]= ($i* $bai_value/ 2),  ($ye[1]/ 2)
		$xy[2][$i]= ($i* $bai_value/ 2),  ($ye[2]/ 2)
		$xy[3][$i]= ($i* $bai_value/ 2),  ($ye[3]/ 2)
	} #

	Flowtting_point $count 0 $xy[0]
	Flowtting_point $count 1 $xy[1]
	Flowtting_point $count 2 $xy[2]
	Flowtting_point $count 3 $xy[3]

	$gpc.DrawLines($Mpen, $pointing[0])
	$gpe.DrawLines($Ypen, $pointing[1])
	$gpg.DrawLines($Lpen, $pointing[2])
	$gpi.DrawLines($Cpen, $pointing[3])
 } #func
 
function Sin_chw(){ 

	switch($comb_fm.SelectedItem){
	'vrc7 2op'{
		[array]$arr= $vrc_svn

		[string]$n= 0 # alg:0
		[string]$f= $arr[0][1] # fb

		[array]$cyle= @(0,0) # tl,ml,dt
		[string[]] $cyle[0]= @($arr[0][0],$arr[0][7],$arr[0][12])
		[string[]] $cyle[1]= @(0,$arr[1][7],$arr[1][12]) # tl:0
		break;
	}'opl 2op'{
		[array]$arr= $opl_two

		[string]$n= $arr[0][0] # alg
		[string]$f= $arr[0][1] # fb

		[array]$cyle= @(0,0) # tl,ml,dt:0
		[string[]] $cyle[0]= @($arr[0][6],$arr[0][8],0)
		[string[]] $cyle[1]= @($arr[1][6],$arr[1][8],0)
	}
	} #sw


	$pict_panel.SuspendLayout()

	$buffz.Graphics.DrawImage($image5a, $buf_Rect)
	$buffx.Graphics.DrawImage($image6a, $buf_Rect)

	$buffz.Render($gp_tmp);
	$gpz.DrawImage($image_tmp, $op_Rect)

	$buffx.Render($gp_tmp);
	$gpx.DrawImage($image_tmp, $op_Rect)


	Sin_2op $cyle $n $f
	sleep -m $key["wait"]

	[string[]]$value= Value_out

	$gpz.DrawString($value[0], $Fona, $XBbrush, 120,5)
	$gpx.DrawString($value[1], $Fona, $XRbrush, 120,5)


	$pict_panel.ResumeLayout()

	$Pictbox1a.Refresh()
	$Pictbox2a.Refresh()


 } #func
 
function Sin_chg(){ 

	switch($comb_fm.SelectedItem){

	'opn 4op'{	[array]$arr= $opn_fur; break;
	}'opm 4op'{	[array]$arr= $opm_fur
	}
	} #sw

	[string]$n= $arr[0][0] # alg
	[string]$f= $arr[0][1] # fb

	[array]$cyle= @(0,0,0,0) # tl,ml
	[string[]] $cyle[0]= @($arr[0][7],$arr[0][9])
	[string[]] $cyle[1]= @($arr[1][7],$arr[1][9])
	[string[]] $cyle[2]= @($arr[2][7],$arr[2][9])
	[string[]] $cyle[3]= @($arr[3][7],$arr[3][9])


	$pict_panel.SuspendLayout()

	$buffc.Graphics.DrawImage($image5, $buf_Rect)
	$buffe.Graphics.DrawImage($image6, $buf_Rect)
	$buffg.Graphics.DrawImage($image7, $buf_Rect)
	$buffi.Graphics.DrawImage($image8, $buf_Rect)

	$buffc.Render($gp_tmp);
	$gpc.DrawImage($image_tmp, $op_Rect)

	$buffe.Render($gp_tmp);
	$gpe.DrawImage($image_tmp, $op_Rect)

	$buffg.Render($gp_tmp);
	$gpg.DrawImage($image_tmp, $op_Rect)

	$buffi.Render($gp_tmp);
	$gpi.DrawImage($image_tmp, $op_Rect)


	Sin_4op $cyle $n $f
	sleep -m $key["wait"]

	[string[]]$value= Value_out

	$gpc.DrawString($value[0], $Fona, $XBbrush, 120,5)
	$gpe.DrawString($value[1], $Fona, $XGbrush, 120,5)
	$gpg.DrawString($value[2], $Fona, $XObrush, 120,5)
	$gpi.DrawString($value[3], $Fona, $XRbrush, 120,5)

	$pict_panel.ResumeLayout()

	$Pictbox1.Refresh()
	$Pictbox2.Refresh()
	$Pictbox3.Refresh()
	$Pictbox4.Refresh()
 } #func
  
# bg alg 
	 
function Chip_view([int]$x,[int]$y){ 

	[array]$p= "",""
	[int[]]$p[0]= 0
	$p[0]*= 18

	[int[]]$p[1]= 0
	$p[1]*= 15

	# base position [8+7,9+9 - 15*18 Rectangle]

	[int]$j= 0
	for([int]$i= 0; $i -lt $p[0].Length; $i++){ # x

		$p[0][$i]= $x+ 7* $i+ $j

		if($i%2 -eq 0){
			$j++; # 8,7,8...
		}
	} #

	for([int]$i= 0; $i -lt $p[1].Length; $i++){ # y
		$p[1][$i]= $y+ 9* $i
	} #

	return $p
 } #func
 
function Chip_position([string]$k){ 

	switch($k){
	'nomal'{
		$script:xyp= Chip_view 325 21 # x,y
		$script:xyi= Chip_view 325 21
		$script:xytwo= 20,145
		$script:xyfour= 20,375
		# $script:xye2= 0,0,480,4
		# $script:xye4= 0,0,480,4
		break;
	}'reverse'{
		$script:xyp= Chip_view 20 360 # x,y
		$script:xyi= Chip_view 20 146
		$script:xyfour= 355,20
		$script:xytwo= 355,20
		# $script:xye2= 0,276,480,4
		# $script:xye4= 0,526,480,4
	}
	} #sw
 } #func
 
<# 
	 
function Alg_cablw([int]$alg){ 

 [int]$sw= Idx
 [array]$arr= @("Op.1","Op.2")

 [array]$mtx= @("","")
 $mtx[0]= @("Modulator","Carrier")
 $mtx[1]= @("Carrier","Carrier")

 [array]$ary= @("vrc7","opl","opn","opm") # .SelectedIndex


 [string]$tt= $ary[$comb_fm.SelectedIndex]+ "`r`n"+ "Alg:"+ ($alg -as [string])+ "`r`n"+ $arr[$sw]+ "`r`n"+ $mtx[$alg][$sw]+ "`r`n"+ (ShortX $key["knob"][$comb_fm.SelectedIndex] "long")


 [array]$rr= Monotone_select "Alg_"

 $pen= $rr[0]
 $brush= $rr[1]
 $board= $rr[2]
 $line= $rr[3]

 $buffw.Graphics.Clear($board)
 $buffw.Graphics.DrawString($tt,$Fona,$brush, $xytwo[0],$xytwo[1]) # $script:xytwo

 [array]$color_pen= @($XBpen,$XRpen)
 [array]$cable= @($Ppen,$Bpen,$Rpen)
 [array]$tex= @($Cbrush,$Mbrush)

  switch($alg){
  0{
	$Pictbox1a.Location= "100,20"
	$Pictbox2a.Location= "180,145"

	$buffw.Graphics.DrawBeziers($cable[0],$pointar[0])
	$buffw.Graphics.DrawBeziers($cable[1],$pointar[1])
	$buffw.Graphics.DrawBeziers($cable[2],$pointar[2])

	switch($sw){ # current select
	0{
	    	$buffw.Graphics.DrawRectangle($color_pen[0], 99,19,163,103) # highlight
	    	$buffw.Graphics.FillRectangle($brush, $xyi[0][9],$xyi[1][7], 15,18)
		break;
	}1{
	    	$buffw.Graphics.DrawRectangle($color_pen[1], 179,144,163,103)
	    	$buffw.Graphics.FillRectangle($brush, $xyi[0][13],$xyi[1][7], 15,18)
	}
	} #sw

	$buffw.Graphics.DrawRectangle($pen, $xyi[0][9],$xyi[1][7], 15,18) # op
	$buffw.Graphics.DrawRectangle($pen, $xyi[0][13],$xyi[1][7], 15,18)

	$buffw.Graphics.DrawString("M", $Fona, $tex[0], $xyi[0][9],$xyi[1][7]) # overwrite
	$buffw.Graphics.DrawString("C", $Fona, $tex[1], $xyi[0][13],$xyi[1][7])

	$buffw.Graphics.DrawLine($pen, $xyi[0][8],$xyi[1][8], $xyi[0][9],$xyi[1][8]) # fb
	$buffw.Graphics.DrawLine($pen, $xyi[0][8],$xyi[1][6], $xyi[0][8],$xyi[1][8])
	$buffw.Graphics.DrawLine($pen, $xyi[0][8],$xyi[1][6], $xyi[0][12],$xyi[1][6])
	$buffw.Graphics.DrawLine($pen, $xyi[0][12],$xyi[1][6], $xyi[0][12],$xyi[1][8])

	$buffw.Graphics.DrawLine($pen, $xyi[0][11],$xyi[1][8], $xyi[0][13],$xyi[1][8]) # 結線

	$buffw.Graphics.DrawLine($pen, $xyi[0][15],$xyi[1][8], $xyi[0][17],$xyi[1][8])

	break;
  }1{
	$Pictbox1a.Location= "180,20"
	$Pictbox2a.Location= "180,145"

	$buffw.Graphics.DrawBeziers($cable[0],$pointat[0])
	$buffw.Graphics.DrawBeziers($cable[1],$pointat[1])
	$buffw.Graphics.DrawBeziers($cable[2],$pointat[2])

	switch($sw){
	0{
		$buffw.Graphics.DrawRectangle($color_pen[0], 179,19,163,103)
		$buffw.Graphics.FillRectangle($brush, $xyi[0][11],$xyi[1][5], 15,18)
		break;
	}1{
		$buffw.Graphics.DrawRectangle($color_pen[1], 179,144,163,103)
		$buffw.Graphics.FillRectangle($brush, $xyi[0][11],$xyi[1][9], 15,18)
	}
	} #sw

	$buffw.Graphics.DrawRectangle($pen, $xyi[0][11],$xyi[1][5], 15,18)
	$buffw.Graphics.DrawRectangle($pen, $xyi[0][11],$xyi[1][9], 15,18)

	$buffw.Graphics.DrawString("C", $Fona, $tex[0], $xyi[0][11],$xyi[1][5])
	$buffw.Graphics.DrawString("C", $Fona, $tex[1], $xyi[0][11],$xyi[1][9])

	$buffw.Graphics.DrawLine($pen, $xyi[0][10],$xyi[1][6], $xyi[0][11],$xyi[1][6]) #fb
	$buffw.Graphics.DrawLine($pen, $xyi[0][10],$xyi[1][4], $xyi[0][10],$xyi[1][6])
	$buffw.Graphics.DrawLine($pen, $xyi[0][10],$xyi[1][4], $xyi[0][14],$xyi[1][4])
	$buffw.Graphics.DrawLine($pen, $xyi[0][14],$xyi[1][4], $xyi[0][14],$xyi[1][6])

	$buffw.Graphics.DrawLine($pen, $xyi[0][13],$xyi[1][6], $xyi[0][15],$xyi[1][6]) #xy軸
	$buffw.Graphics.DrawLine($pen, $xyi[0][13],$xyi[1][10], $xyi[0][15],$xyi[1][10])
	$buffw.Graphics.DrawLine($pen, $xyi[0][15],$xyi[1][6], $xyi[0][15],$xyi[1][10])
	$buffw.Graphics.DrawLine($pen, $xyi[0][15],$xyi[1][8], $xyi[0][17],$xyi[1][8])
  }
  } #sw
 } #func
 
function Alg_cable([int]$alg){ 

 [int]$sw= Idx
 [array]$arr= @("Op.1","Op.2","Op.3","Op.4")

 [array]$mtx= @("","","","", "","","","") # nazo err kikenn kosuu busoku dato
 $mtx[0]= @("Modulator","Modulator","Modulator","Carrier")
 $mtx[1]= @("Modulator","Modulator","Modulator","Carrier")
 $mtx[2]= @("Modulator","Modulator","Modulator","Carrier")
 $mtx[3]= @("Modulator","Modulator","Modulator","Carrier")

 $mtx[4]= @("Modulator","Carrier","Modulator","Carrier")
 $mtx[5]= @("Modulator","Carrier","Carrier","Carrier")
 $mtx[6]= @("Modulator","Carrier","Carrier","Carrier")
 $mtx[7]= @("Carrier","Carrier","Carrier","Carrier")

 [array]$ary= @("vrc7","opl","opn","opm")


 [string]$tt= $ary[$comb_fm.SelectedIndex]+ "`r`n"+ "Alg:"+($alg -as [string])+ "`r`n"+ $arr[$sw]+ "`r`n"+ $mtx[$alg][$sw]+ "`r`n"+  (ShortX $key["knob"][$comb_fm.SelectedIndex] "long")

 if(Mskseg_chk){ $tt+= (Mskseg_out 2) }


 [array]$rr= Monotone_select "Alg_"
 $pen= $rr[0]
 $brush= $rr[1]
 $board= $rr[2]
 $line= $rr[3]

 $buffb.Graphics.Clear($board)
 $buffb.Graphics.DrawString($tt,$Fona,$brush, $xyfour[0],$xyfour[1]) # $script:xyfour

 [array]$color_pen= @($XBpen,$XGpen,$XOpen,$XRpen)
 [array]$cable= @($Ppen,$Bpen,$Gpen,$Open,$Rpen)
 [array]$tex= @($Cbrush,$Lbrush,$Ybrush,$Mbrush)

 switch($alg){
 0{
 	$Pictbox1.Location= "20,20" # 5px up
	$Pictbox2.Location= "100,145"
	$Pictbox3.Location= "180,270"
	$Pictbox4.Location= "260,395"

	$buffb.Graphics.DrawBeziers($cable[1],$pointab[1])
	$buffb.Graphics.DrawBeziers($cable[0],$pointab[0]) # 5px down
	$buffb.Graphics.DrawBeziers($cable[2],$pointab[2])
	$buffb.Graphics.DrawBeziers($cable[3],$pointab[3])
	$buffb.Graphics.DrawBeziers($cable[4],$pointab[4])

	switch($sw){ # current select
	0{
		$buffb.Graphics.DrawRectangle($color_pen[0], 19,19,163,103) # highlight
		$buffb.Graphics.FillRectangle($brush, $xyp[0][1],$xyp[1][7], 15,18)
		break;
	}1{
		$buffb.Graphics.DrawRectangle($color_pen[1], 99,144,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][5],$xyp[1][7], 15,18)
		break;
	}2{
		$buffb.Graphics.DrawRectangle($color_pen[2],179,269,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][9],$xyp[1][7], 15,18)
		break;
	}3{
		$buffb.Graphics.DrawRectangle($color_pen[3],259,394,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][13],$xyp[1][7], 15,18)
	}
	} #sw

	# 枠 [$pen, x,y, width,height]
	$buffb.Graphics.DrawRectangle($pen, $xyp[0][1],$xyp[1][7], 15,18) # op
	$buffb.Graphics.DrawRectangle($pen, $xyp[0][5],$xyp[1][7], 15,18)
	$buffb.Graphics.DrawRectangle($pen, $xyp[0][9],$xyp[1][7], 15,18)
	$buffb.Graphics.DrawRectangle($pen, $xyp[0][13],$xyp[1][7], 15,18)

	$buffb.Graphics.DrawString("M", $Fona, $tex[0], $xyp[0][1],$xyp[1][7])
	$buffb.Graphics.DrawString("M", $Fona, $tex[1], $xyp[0][5],$xyp[1][7])
	$buffb.Graphics.DrawString("M", $Fona, $tex[2], $xyp[0][9],$xyp[1][7])
	$buffb.Graphics.DrawString("C", $Fona, $tex[3], $xyp[0][13],$xyp[1][7])

	$buffb.Graphics.DrawLine($pen, $xyp[0][0],$xyp[1][8], $xyp[0][1],$xyp[1][8]) # fb
	$buffb.Graphics.DrawLine($pen, $xyp[0][0],$xyp[1][6], $xyp[0][0],$xyp[1][8])
	$buffb.Graphics.DrawLine($pen, $xyp[0][0],$xyp[1][6], $xyp[0][4],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][4],$xyp[1][6], $xyp[0][4],$xyp[1][8])

	$buffb.Graphics.DrawLine($pen, $xyp[0][3],$xyp[1][8], $xyp[0][5],$xyp[1][8]) # 結線

	$buffb.Graphics.DrawLine($pen, $xyp[0][7],$xyp[1][8], $xyp[0][9],$xyp[1][8])
	$buffb.Graphics.DrawLine($pen, $xyp[0][11],$xyp[1][8], $xyp[0][13],$xyp[1][8])
	$buffb.Graphics.DrawLine($pen, $xyp[0][15],$xyp[1][8], $xyp[0][17],$xyp[1][8])

	break;
 }1{
	$Pictbox1.Location= "20,20"
	$Pictbox2.Location= "20,145"
	$Pictbox3.Location= "180,270"
	$Pictbox4.Location= "260,395"

	$buffb.Graphics.DrawBeziers($cable[2],$pointad[2])
	$buffb.Graphics.DrawBeziers($cable[1],$pointad[1])
	$buffb.Graphics.DrawBeziers($cable[0],$pointad[0])
	$buffb.Graphics.DrawBeziers($cable[3],$pointad[3])
	$buffb.Graphics.DrawBeziers($cable[4],$pointad[4])

	switch($sw){
	0{
		$buffb.Graphics.DrawRectangle($color_pen[0], 19,19,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][3],$xyp[1][5], 15,18)
		break;
	}1{
		$buffb.Graphics.DrawRectangle($color_pen[1], 19,144,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][3],$xyp[1][9], 15,18)
		break;
	}2{
		$buffb.Graphics.DrawRectangle($color_pen[2],179,269,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][9],$xyp[1][7], 15,18)
		break;
	}3{
		$buffb.Graphics.DrawRectangle($color_pen[3],259,394,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][13],$xyp[1][7], 15,18)
	}
	} #sw

	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][3],$xyp[1][5], 15,18)
	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][3],$xyp[1][9], 15,18)
	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][9],$xyp[1][7], 15,18)
	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][13],$xyp[1][7], 15,18)

	$buffb.Graphics.DrawString("M", $Fona, $tex[0], $xyp[0][3],$xyp[1][5])
	$buffb.Graphics.DrawString("M", $Fona, $tex[1], $xyp[0][3],$xyp[1][9])
	$buffb.Graphics.DrawString("M", $Fona, $tex[2], $xyp[0][9],$xyp[1][7])
	$buffb.Graphics.DrawString("C", $Fona, $tex[3], $xyp[0][13],$xyp[1][7])

	$buffb.Graphics.DrawLine($pen, $xyp[0][2],$xyp[1][6], $xyp[0][3],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][2],$xyp[1][4], $xyp[0][2],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][2],$xyp[1][4], $xyp[0][6],$xyp[1][4])
	$buffb.Graphics.DrawLine($pen, $xyp[0][6],$xyp[1][4], $xyp[0][6],$xyp[1][6])

	$buffb.Graphics.DrawLine($pen, $xyp[0][5],$xyp[1][6], $xyp[0][7],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][5],$xyp[1][10], $xyp[0][7],$xyp[1][10])
	$buffb.Graphics.DrawLine($pen, $xyp[0][7],$xyp[1][6], $xyp[0][7],$xyp[1][10])
	$buffb.Graphics.DrawLine($pen, $xyp[0][7],$xyp[1][8], $xyp[0][9],$xyp[1][8])
	$buffb.Graphics.DrawLine($pen, $xyp[0][11],$xyp[1][8], $xyp[0][13],$xyp[1][8])
	$buffb.Graphics.DrawLine($pen, $xyp[0][15],$xyp[1][8], $xyp[0][17],$xyp[1][8])

	break;
 }2{
	$Pictbox1.Location= "100,20"
	$Pictbox2.Location= "20,145"
	$Pictbox3.Location= "100,270"
	$Pictbox4.Location= "260,395"

	$buffb.Graphics.DrawBeziers($cable[3],$pointaf[3])
	$buffb.Graphics.DrawBeziers($cable[2],$pointaf[2])
	$buffb.Graphics.DrawBeziers($cable[1],$pointaf[1])
	$buffb.Graphics.DrawBeziers($cable[0],$pointaf[0])
	$buffb.Graphics.DrawBeziers($cable[4],$pointaf[4])

	switch($sw){
	0{
		$buffb.Graphics.DrawRectangle($color_pen[0], 99,19,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][7],$xyp[1][5], 15,18)
		break;
	}1{
		$buffb.Graphics.DrawRectangle($color_pen[1], 19,144,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][3],$xyp[1][9], 15,18)
		break;
	}2{
		$buffb.Graphics.DrawRectangle($color_pen[2], 99,269,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][7],$xyp[1][9], 15,18)
		break;
	}3{
		$buffb.Graphics.DrawRectangle($color_pen[3],259,394,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][13],$xyp[1][7], 15,18)
	}
	} #sw

	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][7],$xyp[1][5], 15,18)
	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][3],$xyp[1][9], 15,18)
	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][7],$xyp[1][9], 15,18)
	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][13],$xyp[1][7], 15,18)

	$buffb.Graphics.DrawString("M", $Fona, $tex[0], $xyp[0][7],$xyp[1][5])
	$buffb.Graphics.DrawString("M", $Fona, $tex[1], $xyp[0][3],$xyp[1][9])
	$buffb.Graphics.DrawString("M", $Fona, $tex[2], $xyp[0][7],$xyp[1][9])
	$buffb.Graphics.DrawString("C", $Fona, $tex[3], $xyp[0][13],$xyp[1][7])

	$buffb.Graphics.DrawLine($pen, $xyp[0][6],$xyp[1][6], $xyp[0][7],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][6],$xyp[1][4], $xyp[0][6],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][6],$xyp[1][4], $xyp[0][10],$xyp[1][4])
	$buffb.Graphics.DrawLine($pen, $xyp[0][10],$xyp[1][4], $xyp[0][10],$xyp[1][6])

	$buffb.Graphics.DrawLine($pen, $xyp[0][5],$xyp[1][10], $xyp[0][7],$xyp[1][10])
	$buffb.Graphics.DrawLine($pen, $xyp[0][9],$xyp[1][6], $xyp[0][11],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][9],$xyp[1][10], $xyp[0][11],$xyp[1][10])
	$buffb.Graphics.DrawLine($pen, $xyp[0][11],$xyp[1][6], $xyp[0][11],$xyp[1][10])
	$buffb.Graphics.DrawLine($pen, $xyp[0][11],$xyp[1][8], $xyp[0][13],$xyp[1][8])
	$buffb.Graphics.DrawLine($pen, $xyp[0][15],$xyp[1][8], $xyp[0][17],$xyp[1][8])

	break;
 }3{
	$Pictbox1.Location= "20,20"
	$Pictbox2.Location= "100,145"
	$Pictbox3.Location= "100,270"
	$Pictbox4.Location= "260,395"

	$buffb.Graphics.DrawBeziers($cable[1],$pointah[1])
	$buffb.Graphics.DrawBeziers($cable[0],$pointah[0])
	$buffb.Graphics.DrawBeziers($cable[3],$pointah[3])
	$buffb.Graphics.DrawBeziers($cable[2],$pointah[2])
	$buffb.Graphics.DrawBeziers($cable[4],$pointah[4])

	switch($sw){
	0{
		$buffb.Graphics.DrawRectangle($color_pen[0], 19,19,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][3],$xyp[1][5], 15,18)
		break;
	}1{
		$buffb.Graphics.DrawRectangle($color_pen[1], 99,144,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][7],$xyp[1][5], 15,18)
		break;
	}2{
		$buffb.Graphics.DrawRectangle($color_pen[2], 99,269,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][7],$xyp[1][9], 15,18)
		break;
		}3{
		$buffb.Graphics.DrawRectangle($color_pen[3],259,394,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][13],$xyp[1][7], 15,18)
	}
	} #sw

	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][3],$xyp[1][5], 15,18)
	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][7],$xyp[1][5], 15,18)
	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][7],$xyp[1][9], 15,18)
	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][13],$xyp[1][7], 15,18)

	$buffb.Graphics.DrawString("M", $Fona, $tex[0], $xyp[0][3],$xyp[1][5])
	$buffb.Graphics.DrawString("M", $Fona, $tex[1], $xyp[0][7],$xyp[1][5])
	$buffb.Graphics.DrawString("M", $Fona, $tex[2], $xyp[0][7],$xyp[1][9])
	$buffb.Graphics.DrawString("C", $Fona, $tex[3], $xyp[0][13],$xyp[1][7])

	$buffb.Graphics.DrawLine($pen, $xyp[0][2],$xyp[1][6], $xyp[0][3],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][2],$xyp[1][4], $xyp[0][2],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][2],$xyp[1][4], $xyp[0][6],$xyp[1][4])
	$buffb.Graphics.DrawLine($pen, $xyp[0][6],$xyp[1][4], $xyp[0][6],$xyp[1][6])

	$buffb.Graphics.DrawLine($pen, $xyp[0][5],$xyp[1][6], $xyp[0][7],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][9],$xyp[1][6], $xyp[0][11],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][9],$xyp[1][10], $xyp[0][11],$xyp[1][10])
	$buffb.Graphics.DrawLine($pen, $xyp[0][11],$xyp[1][6], $xyp[0][11],$xyp[1][10])
	$buffb.Graphics.DrawLine($pen, $xyp[0][11],$xyp[1][8], $xyp[0][13],$xyp[1][8])
	$buffb.Graphics.DrawLine($pen, $xyp[0][15],$xyp[1][8], $xyp[0][17],$xyp[1][8])

	break;
 }4{
	$Pictbox1.Location= "100,20"
	$Pictbox2.Location= "180,145"
	$Pictbox3.Location= "100,270"
	$Pictbox4.Location= "180,395"

	$buffb.Graphics.DrawBeziers($cable[3],$pointaj[2])
	$buffb.Graphics.DrawBeziers($cable[1],$pointaj[1])
	$buffb.Graphics.DrawBeziers($cable[0],$pointaj[0])
	$buffb.Graphics.DrawBeziers($cable[2],$pointaj[3])
	$buffb.Graphics.DrawBeziers($cable[4],$pointaj[4])

	switch($sw){
	0{
		$buffb.Graphics.DrawRectangle($color_pen[0], 99,19,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][7],$xyp[1][5], 15,18)
		break;
	}1{
		$buffb.Graphics.DrawRectangle($color_pen[1],179,144,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][5], 15,18)
		break;
	}2{
		$buffb.Graphics.DrawRectangle($color_pen[2], 99,269,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][7],$xyp[1][9], 15,18)
		break;
	}3{
		$buffb.Graphics.DrawRectangle($color_pen[3],179,394,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][9], 15,18)

	}
	} #sw

	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][7],$xyp[1][5], 15,18)
	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][11],$xyp[1][5], 15,18)
	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][7],$xyp[1][9], 15,18)
	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][11],$xyp[1][9], 15,18)

	$buffb.Graphics.DrawString("M", $Fona, $tex[0], $xyp[0][7],$xyp[1][5])
	$buffb.Graphics.DrawString("C", $Fona, $tex[1], $xyp[0][11],$xyp[1][5])
	$buffb.Graphics.DrawString("M", $Fona, $tex[2], $xyp[0][7],$xyp[1][9])
	$buffb.Graphics.DrawString("C", $Fona, $tex[3], $xyp[0][11],$xyp[1][9])

	$buffb.Graphics.DrawLine($pen, $xyp[0][6],$xyp[1][6], $xyp[0][7],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][6],$xyp[1][4], $xyp[0][6],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][6],$xyp[1][4], $xyp[0][10],$xyp[1][4])
	$buffb.Graphics.DrawLine($pen, $xyp[0][10],$xyp[1][4], $xyp[0][10],$xyp[1][6])

	$buffb.Graphics.DrawLine($pen, $xyp[0][9],$xyp[1][6], $xyp[0][11],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][9],$xyp[1][10], $xyp[0][11],$xyp[1][10])
	$buffb.Graphics.DrawLine($pen, $xyp[0][13],$xyp[1][6], $xyp[0][15],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][13],$xyp[1][10], $xyp[0][15],$xyp[1][10])
	$buffb.Graphics.DrawLine($pen, $xyp[0][15],$xyp[1][6], $xyp[0][15],$xyp[1][10])
	$buffb.Graphics.DrawLine($pen, $xyp[0][15],$xyp[1][8], $xyp[0][17],$xyp[1][8])

	break;
 }5{
	$Pictbox1.Location= "20,20"
	$Pictbox2.Location= "180,145"
	$Pictbox3.Location= "180,270"
	$Pictbox4.Location= "180,395"

	$buffb.Graphics.DrawBeziers($cable[1],$pointal[3]) # [3]>[2]>[1]
	$buffb.Graphics.DrawBeziers($cable[1],$pointal[2])
	$buffb.Graphics.DrawBeziers($cable[1],$pointal[1])
	$buffb.Graphics.DrawBeziers($cable[0],$pointal[0])
	$buffb.Graphics.DrawBeziers($cable[2],$pointal[4])
	$buffb.Graphics.DrawBeziers($cable[3],$pointal[5])
	$buffb.Graphics.DrawBeziers($cable[4],$pointal[6])

	switch($sw){
	0{
		$buffb.Graphics.DrawRectangle($color_pen[0], 19,19,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][5],$xyp[1][9], 15,18)
		break;
	}1{
		$buffb.Graphics.DrawRectangle($color_pen[1],179,144,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][5], 15,18)
		break;
	}2{
		$buffb.Graphics.DrawRectangle($color_pen[2],179,269,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][9], 15,18)
		break;
	}3{
		$buffb.Graphics.DrawRectangle($color_pen[3],179,394,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][13], 15,18)

	}
	} #sw

	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][5],$xyp[1][9], 15,18)
	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][11],$xyp[1][5], 15,18)
	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][11],$xyp[1][9], 15,18)
	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][11],$xyp[1][13], 15,18)

	$buffb.Graphics.DrawString("M", $Fona, $tex[0], $xyp[0][5],$xyp[1][9])
	$buffb.Graphics.DrawString("C", $Fona, $tex[1], $xyp[0][11],$xyp[1][5])
	$buffb.Graphics.DrawString("C", $Fona, $tex[2], $xyp[0][11],$xyp[1][9])
	$buffb.Graphics.DrawString("C", $Fona, $tex[3], $xyp[0][11],$xyp[1][13])

	$buffb.Graphics.DrawLine($pen, $xyp[0][4],$xyp[1][10], $xyp[0][5],$xyp[1][10])
	$buffb.Graphics.DrawLine($pen, $xyp[0][4],$xyp[1][8], $xyp[0][4],$xyp[1][10])
	$buffb.Graphics.DrawLine($pen, $xyp[0][4],$xyp[1][8], $xyp[0][8],$xyp[1][8])
	$buffb.Graphics.DrawLine($pen, $xyp[0][8],$xyp[1][8], $xyp[0][8],$xyp[1][10])

	$buffb.Graphics.DrawLine($pen, $xyp[0][7],$xyp[1][10], $xyp[0][9],$xyp[1][10])
	$buffb.Graphics.DrawLine($pen, $xyp[0][9],$xyp[1][6], $xyp[0][9],$xyp[1][14])
	$buffb.Graphics.DrawLine($pen, $xyp[0][9],$xyp[1][6], $xyp[0][11],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][9],$xyp[1][10], $xyp[0][11],$xyp[1][10])
	$buffb.Graphics.DrawLine($pen, $xyp[0][9],$xyp[1][14], $xyp[0][11],$xyp[1][14])
	$buffb.Graphics.DrawLine($pen, $xyp[0][13],$xyp[1][6], $xyp[0][15],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][13],$xyp[1][10], $xyp[0][15],$xyp[1][10])
	$buffb.Graphics.DrawLine($pen, $xyp[0][13],$xyp[1][14], $xyp[0][15],$xyp[1][14])
	$buffb.Graphics.DrawLine($pen, $xyp[0][15],$xyp[1][6], $xyp[0][15],$xyp[1][14])
	$buffb.Graphics.DrawLine($pen, $xyp[0][15],$xyp[1][10], $xyp[0][17],$xyp[1][10])

	break;
 }6{
	$Pictbox1.Location= "100,20"
	$Pictbox2.Location= "180,145"
	$Pictbox3.Location= "180,270"
	$Pictbox4.Location= "180,395"

	$buffb.Graphics.DrawBeziers($cable[1],$pointan[1])
	$buffb.Graphics.DrawBeziers($cable[0],$pointan[0])
	$buffb.Graphics.DrawBeziers($cable[2],$pointan[2])
	$buffb.Graphics.DrawBeziers($cable[3],$pointan[3])
	$buffb.Graphics.DrawBeziers($cable[4],$pointan[4])

	switch($sw){
	0{
		$buffb.Graphics.DrawRectangle($color_pen[0], 99,19,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][7],$xyp[1][5], 15,18)
		break;
	}1{
		$buffb.Graphics.DrawRectangle($color_pen[1],179,144,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][5], 15,18)
		break;
	}2{
		$buffb.Graphics.DrawRectangle($color_pen[2],179,269,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][9], 15,18)
		break;
	}3{
		$buffb.Graphics.DrawRectangle($color_pen[3],179,394,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][13], 15,18)
	}
	} #sw

	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][7],$xyp[1][5], 15,18)
	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][11],$xyp[1][5], 15,18)
	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][11],$xyp[1][9], 15,18)
	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][11],$xyp[1][13], 15,18)

	$buffb.Graphics.DrawString("M", $Fona, $tex[0], $xyp[0][7],$xyp[1][5])
	$buffb.Graphics.DrawString("C", $Fona, $tex[1], $xyp[0][11],$xyp[1][5])
	$buffb.Graphics.DrawString("C", $Fona, $tex[2], $xyp[0][11],$xyp[1][9])
	$buffb.Graphics.DrawString("C", $Fona, $tex[3], $xyp[0][11],$xyp[1][13])

	$buffb.Graphics.DrawLine($pen, $xyp[0][6],$xyp[1][6], $xyp[0][7],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][6],$xyp[1][4], $xyp[0][6],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][6],$xyp[1][4], $xyp[0][10],$xyp[1][4])
	$buffb.Graphics.DrawLine($pen, $xyp[0][10],$xyp[1][4], $xyp[0][10],$xyp[1][6])

	$buffb.Graphics.DrawLine($pen, $xyp[0][9],$xyp[1][6], $xyp[0][11],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][13],$xyp[1][6], $xyp[0][15],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][13],$xyp[1][10], $xyp[0][15],$xyp[1][10])
	$buffb.Graphics.DrawLine($pen, $xyp[0][13],$xyp[1][14], $xyp[0][15],$xyp[1][14])
	$buffb.Graphics.DrawLine($pen, $xyp[0][15],$xyp[1][6], $xyp[0][15],$xyp[1][14])
	$buffb.Graphics.DrawLine($pen, $xyp[0][15],$xyp[1][10], $xyp[0][17],$xyp[1][10])

	break;
 }7{
	$Pictbox1.Location= "180,20"
	$Pictbox2.Location= "180,145"
	$Pictbox3.Location= "180,270"
	$Pictbox4.Location= "180,395"

	$buffb.Graphics.DrawBeziers($cable[1],$pointap[1])
	$buffb.Graphics.DrawBeziers($cable[0],$pointap[0])
	$buffb.Graphics.DrawBeziers($cable[2],$pointap[2])
	$buffb.Graphics.DrawBeziers($cable[3],$pointap[3])
	$buffb.Graphics.DrawBeziers($cable[4],$pointap[4])

	switch($sw){
	0{
		$buffb.Graphics.DrawRectangle($color_pen[0],179,19,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][1], 15,18)
		break;
	}1{
		$buffb.Graphics.DrawRectangle($color_pen[1],179,144,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][5], 15,18)
		break;
	}2{
		$buffb.Graphics.DrawRectangle($color_pen[2],179,269,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][9], 15,18)
		break;
	}3{
		$buffb.Graphics.DrawRectangle($color_pen[3],179,394,163,103)
		$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][13], 15,18)
	}
	} #sw

	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][11],$xyp[1][1], 15,18)
	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][11],$xyp[1][5], 15,18)
	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][11],$xyp[1][9], 15,18)
	$buffb.Graphics.DrawRectangle($pen,   $xyp[0][11],$xyp[1][13], 15,18)

	$buffb.Graphics.DrawString("C", $Fona, $tex[0], $xyp[0][11],$xyp[1][1])
	$buffb.Graphics.DrawString("C", $Fona, $tex[1], $xyp[0][11],$xyp[1][5])
	$buffb.Graphics.DrawString("C", $Fona, $tex[2], $xyp[0][11],$xyp[1][9])
	$buffb.Graphics.DrawString("C", $Fona, $tex[3], $xyp[0][11],$xyp[1][13])

	$buffb.Graphics.DrawLine($pen, $xyp[0][10],$xyp[1][2], $xyp[0][11],$xyp[1][2])
	$buffb.Graphics.DrawLine($pen, $xyp[0][10],$xyp[1][0], $xyp[0][10],$xyp[1][2])
	$buffb.Graphics.DrawLine($pen, $xyp[0][10],$xyp[1][0], $xyp[0][14],$xyp[1][0])
	$buffb.Graphics.DrawLine($pen, $xyp[0][14],$xyp[1][0], $xyp[0][14],$xyp[1][2])

	$buffb.Graphics.DrawLine($pen, $xyp[0][13],$xyp[1][2], $xyp[0][15],$xyp[1][2])
	$buffb.Graphics.DrawLine($pen, $xyp[0][13],$xyp[1][6], $xyp[0][15],$xyp[1][6])
	$buffb.Graphics.DrawLine($pen, $xyp[0][13],$xyp[1][10], $xyp[0][15],$xyp[1][10])
	$buffb.Graphics.DrawLine($pen, $xyp[0][13],$xyp[1][14], $xyp[0][15],$xyp[1][14])
	$buffb.Graphics.DrawLine($pen, $xyp[0][15],$xyp[1][2], $xyp[0][15],$xyp[1][14])
	$buffb.Graphics.DrawLine($pen, $xyp[0][15],$xyp[1][8], $xyp[0][17],$xyp[1][8])
 }
 } #sw

 } #func
 
#> 
  
function Alg_cablw([int]$alg){ 

	[int]$sw= Idx
	[array]$arr= @("Op.1","Op.2")

	[array]$mtx= @("","")
	$mtx[0]= @("Modulator","Carrier")
	$mtx[1]= @("Carrier","Carrier")

	[array]$ary= @("vrc7","opl","opn","opm") # .SelectedIndex


	[string] $ss= $key["oct"]+ "`r`n"+ $ary[$comb_fm.SelectedIndex]+ "`r`n"+ "Alg:"+ ($alg -as [string])+ "`r`n"+ $mtx[$alg][$sw]
	[string] $tt= $arr[$sw]+ "`r`n"+ (ShortX $key["knob"][$comb_fm.SelectedIndex] "long")



	[array]$rr= Monotone_select "Alg_"

	$pen= $rr[0]
	$brush= $rr[1]
	$board= $rr[2]
	$line= $rr[3]

	[array]$color_pen= @($XBpen,$XRpen)
	[array]$cable= @($Ppen,$Bpen,$Rpen)
	[array]$tex= @($Cbrush,$Mbrush)

	$buffw.Graphics.Clear($board)

	switch($alg){
	0{
		$Pictbox1a.Location= "100,20"
		$Pictbox2a.Location= "180,145"

		switch($sw){ # current select
		0{
		    	$buffw.Graphics.DrawRectangle($color_pen[0], 99,19,163,103) # highlight
		    	$buffw.Graphics.FillRectangle($brush, $xyi[0][9],$xyi[1][7], 15,18)
			break;
		}1{
		    	$buffw.Graphics.DrawRectangle($color_pen[1], 179,144,163,103)
		    	$buffw.Graphics.FillRectangle($brush, $xyi[0][13],$xyi[1][7], 15,18)
		}
		} #sw

		$buffw.Render($gpw); # この後、アンチエイリアスため

		$gpw.DrawString($ss,$Fona,$brush, $xytwo[0], $xytwo[1]) # $script:xytwo
		$gpw.DrawString($tt,$Fona,$tex[$sw], $xytwo[0], ($xytwo[1]+ 64)) # $script:xytwo

		$gpw.DrawBeziers($cable[0],$pointar[0])
		$gpw.DrawBeziers($cable[1],$pointar[1])
		$gpw.DrawBeziers($cable[2],$pointar[2])

		$gpw.DrawRectangle($pen, $xyi[0][9],$xyi[1][7], 15,18) # op
		$gpw.DrawRectangle($pen, $xyi[0][13],$xyi[1][7], 15,18)

		$gpw.DrawString("M", $Fona, $tex[0], $xyi[0][9],$xyi[1][7]) # overwrite
		$gpw.DrawString("C", $Fona, $tex[1], $xyi[0][13],$xyi[1][7])

		$gpw.DrawLine($pen, $xyi[0][8],$xyi[1][8], $xyi[0][9],$xyi[1][8]) # fb
		$gpw.DrawLine($pen, $xyi[0][8],$xyi[1][6], $xyi[0][8],$xyi[1][8])
		$gpw.DrawLine($pen, $xyi[0][8],$xyi[1][6], $xyi[0][12],$xyi[1][6])
		$gpw.DrawLine($pen, $xyi[0][12],$xyi[1][6], $xyi[0][12],$xyi[1][8])

		$gpw.DrawLine($pen, $xyi[0][11],$xyi[1][8], $xyi[0][13],$xyi[1][8]) # 結線
		$gpw.DrawLine($pen, $xyi[0][15],$xyi[1][8], $xyi[0][17],$xyi[1][8])

		break;
	}1{
		$Pictbox1a.Location= "180,20"
		$Pictbox2a.Location= "180,145"

		switch($sw){
		0{
			$buffw.Graphics.DrawRectangle($color_pen[0], 179,19,163,103)
			$buffw.Graphics.FillRectangle($brush, $xyi[0][11],$xyi[1][5], 15,18)
			break;
		}1{
			$buffw.Graphics.DrawRectangle($color_pen[1], 179,144,163,103)
			$buffw.Graphics.FillRectangle($brush, $xyi[0][11],$xyi[1][9], 15,18)
		}
		} #sw

		$buffw.Render($gpw);

		$gpw.DrawString($ss,$Fona,$brush, $xytwo[0], $xytwo[1]) # $script:xytwo
		$gpw.DrawString($tt,$Fona,$tex[$sw], $xytwo[0], ($xytwo[1]+ 64)) # $script:xytwo

		$gpw.DrawBeziers($cable[0],$pointat[0])
		$gpw.DrawBeziers($cable[1],$pointat[1])
		$gpw.DrawBeziers($cable[2],$pointat[2])

		$gpw.DrawRectangle($pen, $xyi[0][11],$xyi[1][5], 15,18)
		$gpw.DrawRectangle($pen, $xyi[0][11],$xyi[1][9], 15,18)

		$gpw.DrawString("C", $Fona, $tex[0], $xyi[0][11],$xyi[1][5])
		$gpw.DrawString("C", $Fona, $tex[1], $xyi[0][11],$xyi[1][9])

		$gpw.DrawLine($pen, $xyi[0][10],$xyi[1][6], $xyi[0][11],$xyi[1][6]) #fb
		$gpw.DrawLine($pen, $xyi[0][10],$xyi[1][4], $xyi[0][10],$xyi[1][6])
		$gpw.DrawLine($pen, $xyi[0][10],$xyi[1][4], $xyi[0][14],$xyi[1][4])
		$gpw.DrawLine($pen, $xyi[0][14],$xyi[1][4], $xyi[0][14],$xyi[1][6])

		$gpw.DrawLine($pen, $xyi[0][13],$xyi[1][6], $xyi[0][15],$xyi[1][6]) #xy軸
		$gpw.DrawLine($pen, $xyi[0][13],$xyi[1][10], $xyi[0][15],$xyi[1][10])
		$gpw.DrawLine($pen, $xyi[0][15],$xyi[1][6], $xyi[0][15],$xyi[1][10])
		$gpw.DrawLine($pen, $xyi[0][15],$xyi[1][8], $xyi[0][17],$xyi[1][8])

	}
	} #sw

 } #func
 
function Alg_cable([int]$alg){ 

	[int]$sw= Idx
	[array]$arr= @("Op.1","Op.2","Op.3","Op.4")

	[array]$mtx= @("","","","", "","","","") # nazo err kikenn kosuu busoku dato
	$mtx[0]= @("Modulator","Modulator","Modulator","Carrier")
	$mtx[1]= @("Modulator","Modulator","Modulator","Carrier")
	$mtx[2]= @("Modulator","Modulator","Modulator","Carrier")
	$mtx[3]= @("Modulator","Modulator","Modulator","Carrier")

	$mtx[4]= @("Modulator","Carrier","Modulator","Carrier")
	$mtx[5]= @("Modulator","Carrier","Carrier","Carrier")
	$mtx[6]= @("Modulator","Carrier","Carrier","Carrier")
	$mtx[7]= @("Carrier","Carrier","Carrier","Carrier")

	[array]$ary= @("vrc7","opl","opn","opm")

	[string] $ss= $key["oct"]+ "`r`n"+ $ary[$comb_fm.SelectedIndex]+ "`r`n"+ "Alg:"+ ($alg -as [string])+ "`r`n"+ $mtx[$alg][$sw]
	[string] $tt= $arr[$sw]+ "`r`n"+ (ShortX $key["knob"][$comb_fm.SelectedIndex] "long")

	if(Mskseg_chk){ $tt+= (Mskseg_out 2) }


	[array]$rr= Monotone_select "Alg_"
	$pen= $rr[0]
	$brush= $rr[1]
	$board= $rr[2]
	$line= $rr[3]

	[array]$color_pen= @($XBpen,$XGpen,$XOpen,$XRpen)
	[array]$cable= @($Ppen,$Bpen,$Gpen,$Open,$Rpen)
	[array]$tex= @($Cbrush,$Lbrush,$Ybrush,$Mbrush)


	$buffb.Graphics.Clear($board)

	$buffb.Graphics.DrawString($ss,$Fona,$brush, $xyfour[0], $xyfour[1]) # $script:xyfour
	$buffb.Graphics.DrawString($tt,$Fona,$tex[$sw], $xyfour[0], ($xyfour[1]+ 64)) # $script:xyfour

	switch($alg){
	0{
 		$Pictbox1.Location= "20,20" # 5px up
		$Pictbox2.Location= "100,145"
		$Pictbox3.Location= "180,270"
		$Pictbox4.Location= "260,395"

		switch($sw){ # current select
		0{
			$buffb.Graphics.DrawRectangle($color_pen[0], 19,19,163,103) # highlight
			$buffb.Graphics.FillRectangle($brush, $xyp[0][1],$xyp[1][7], 15,18)
			break;
		}1{
			$buffb.Graphics.DrawRectangle($color_pen[1], 99,144,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][5],$xyp[1][7], 15,18)
			break;
		}2{
			$buffb.Graphics.DrawRectangle($color_pen[2],179,269,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][9],$xyp[1][7], 15,18)
			break;
		}3{
			$buffb.Graphics.DrawRectangle($color_pen[3],259,394,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][13],$xyp[1][7], 15,18)
		}
		} #sw

		$buffb.Render($gpb); # この後、アンチエイリアスため

		$gpb.DrawBeziers($cable[1],$pointab[1])
		$gpb.DrawBeziers($cable[0],$pointab[0]) # 5px down
		$gpb.DrawBeziers($cable[2],$pointab[2])
		$gpb.DrawBeziers($cable[3],$pointab[3])
		$gpb.DrawBeziers($cable[4],$pointab[4])

		# 枠 [$pen, x,y, width,height]
		$gpb.DrawRectangle($pen, $xyp[0][1],$xyp[1][7], 15,18) # op
		$gpb.DrawRectangle($pen, $xyp[0][5],$xyp[1][7], 15,18)
		$gpb.DrawRectangle($pen, $xyp[0][9],$xyp[1][7], 15,18)
		$gpb.DrawRectangle($pen, $xyp[0][13],$xyp[1][7], 15,18)

		$gpb.DrawString("M", $Fona, $tex[0], $xyp[0][1],$xyp[1][7])
		$gpb.DrawString("M", $Fona, $tex[1], $xyp[0][5],$xyp[1][7])
		$gpb.DrawString("M", $Fona, $tex[2], $xyp[0][9],$xyp[1][7])
		$gpb.DrawString("C", $Fona, $tex[3], $xyp[0][13],$xyp[1][7])

		$gpb.DrawLine($pen, $xyp[0][0],$xyp[1][8], $xyp[0][1],$xyp[1][8]) # fb
		$gpb.DrawLine($pen, $xyp[0][0],$xyp[1][6], $xyp[0][0],$xyp[1][8])
		$gpb.DrawLine($pen, $xyp[0][0],$xyp[1][6], $xyp[0][4],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][4],$xyp[1][6], $xyp[0][4],$xyp[1][8])

		$gpb.DrawLine($pen, $xyp[0][3],$xyp[1][8], $xyp[0][5],$xyp[1][8]) # 結線

		$gpb.DrawLine($pen, $xyp[0][7],$xyp[1][8], $xyp[0][9],$xyp[1][8])
		$gpb.DrawLine($pen, $xyp[0][11],$xyp[1][8], $xyp[0][13],$xyp[1][8])
		$gpb.DrawLine($pen, $xyp[0][15],$xyp[1][8], $xyp[0][17],$xyp[1][8])

		break;
	}1{
		$Pictbox1.Location= "20,20"
		$Pictbox2.Location= "20,145"
		$Pictbox3.Location= "180,270"
		$Pictbox4.Location= "260,395"

		switch($sw){
		0{
			$buffb.Graphics.DrawRectangle($color_pen[0], 19,19,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][3],$xyp[1][5], 15,18)
			break;
		}1{
			$buffb.Graphics.DrawRectangle($color_pen[1], 19,144,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][3],$xyp[1][9], 15,18)
			break;
		}2{
			$buffb.Graphics.DrawRectangle($color_pen[2],179,269,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][9],$xyp[1][7], 15,18)
			break;
		}3{
			$buffb.Graphics.DrawRectangle($color_pen[3],259,394,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][13],$xyp[1][7], 15,18)
		}
		} #sw

		$buffb.Render($gpb);

		$gpb.DrawBeziers($cable[2],$pointad[2])
		$gpb.DrawBeziers($cable[1],$pointad[1])
		$gpb.DrawBeziers($cable[0],$pointad[0])
		$gpb.DrawBeziers($cable[3],$pointad[3])
		$gpb.DrawBeziers($cable[4],$pointad[4])

		$gpb.DrawRectangle($pen,   $xyp[0][3],$xyp[1][5], 15,18)
		$gpb.DrawRectangle($pen,   $xyp[0][3],$xyp[1][9], 15,18)
		$gpb.DrawRectangle($pen,   $xyp[0][9],$xyp[1][7], 15,18)
		$gpb.DrawRectangle($pen,   $xyp[0][13],$xyp[1][7], 15,18)

		$gpb.DrawString("M", $Fona, $tex[0], $xyp[0][3],$xyp[1][5])
		$gpb.DrawString("M", $Fona, $tex[1], $xyp[0][3],$xyp[1][9])
		$gpb.DrawString("M", $Fona, $tex[2], $xyp[0][9],$xyp[1][7])
		$gpb.DrawString("C", $Fona, $tex[3], $xyp[0][13],$xyp[1][7])

		$gpb.DrawLine($pen, $xyp[0][2],$xyp[1][6], $xyp[0][3],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][2],$xyp[1][4], $xyp[0][2],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][2],$xyp[1][4], $xyp[0][6],$xyp[1][4])
		$gpb.DrawLine($pen, $xyp[0][6],$xyp[1][4], $xyp[0][6],$xyp[1][6])

		$gpb.DrawLine($pen, $xyp[0][5],$xyp[1][6], $xyp[0][7],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][5],$xyp[1][10], $xyp[0][7],$xyp[1][10])
		$gpb.DrawLine($pen, $xyp[0][7],$xyp[1][6], $xyp[0][7],$xyp[1][10])
		$gpb.DrawLine($pen, $xyp[0][7],$xyp[1][8], $xyp[0][9],$xyp[1][8])
		$gpb.DrawLine($pen, $xyp[0][11],$xyp[1][8], $xyp[0][13],$xyp[1][8])
		$gpb.DrawLine($pen, $xyp[0][15],$xyp[1][8], $xyp[0][17],$xyp[1][8])

		break;
	}2{
		$Pictbox1.Location= "100,20"
		$Pictbox2.Location= "20,145"
		$Pictbox3.Location= "100,270"
		$Pictbox4.Location= "260,395"

		switch($sw){
		0{
			$buffb.Graphics.DrawRectangle($color_pen[0], 99,19,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][7],$xyp[1][5], 15,18)
			break;
		}1{
			$buffb.Graphics.DrawRectangle($color_pen[1], 19,144,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][3],$xyp[1][9], 15,18)
			break;
		}2{
			$buffb.Graphics.DrawRectangle($color_pen[2], 99,269,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][7],$xyp[1][9], 15,18)
			break;
		}3{
			$buffb.Graphics.DrawRectangle($color_pen[3],259,394,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][13],$xyp[1][7], 15,18)
		}
		} #sw

		$buffb.Render($gpb);

		$gpb.DrawBeziers($cable[3],$pointaf[3])
		$gpb.DrawBeziers($cable[2],$pointaf[2])
		$gpb.DrawBeziers($cable[1],$pointaf[1])
		$gpb.DrawBeziers($cable[0],$pointaf[0])
		$gpb.DrawBeziers($cable[4],$pointaf[4])

		$gpb.DrawRectangle($pen,   $xyp[0][7],$xyp[1][5], 15,18)
		$gpb.DrawRectangle($pen,   $xyp[0][3],$xyp[1][9], 15,18)
		$gpb.DrawRectangle($pen,   $xyp[0][7],$xyp[1][9], 15,18)
		$gpb.DrawRectangle($pen,   $xyp[0][13],$xyp[1][7], 15,18)

		$gpb.DrawString("M", $Fona, $tex[0], $xyp[0][7],$xyp[1][5])
		$gpb.DrawString("M", $Fona, $tex[1], $xyp[0][3],$xyp[1][9])
		$gpb.DrawString("M", $Fona, $tex[2], $xyp[0][7],$xyp[1][9])
		$gpb.DrawString("C", $Fona, $tex[3], $xyp[0][13],$xyp[1][7])

		$gpb.DrawLine($pen, $xyp[0][6],$xyp[1][6], $xyp[0][7],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][6],$xyp[1][4], $xyp[0][6],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][6],$xyp[1][4], $xyp[0][10],$xyp[1][4])
		$gpb.DrawLine($pen, $xyp[0][10],$xyp[1][4], $xyp[0][10],$xyp[1][6])

		$gpb.DrawLine($pen, $xyp[0][5],$xyp[1][10], $xyp[0][7],$xyp[1][10])
		$gpb.DrawLine($pen, $xyp[0][9],$xyp[1][6], $xyp[0][11],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][9],$xyp[1][10], $xyp[0][11],$xyp[1][10])
		$gpb.DrawLine($pen, $xyp[0][11],$xyp[1][6], $xyp[0][11],$xyp[1][10])
		$gpb.DrawLine($pen, $xyp[0][11],$xyp[1][8], $xyp[0][13],$xyp[1][8])
		$gpb.DrawLine($pen, $xyp[0][15],$xyp[1][8], $xyp[0][17],$xyp[1][8])

		break;
	}3{
		$Pictbox1.Location= "20,20"
		$Pictbox2.Location= "100,145"
		$Pictbox3.Location= "100,270"
		$Pictbox4.Location= "260,395"

		switch($sw){
		0{
			$buffb.Graphics.DrawRectangle($color_pen[0], 19,19,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][3],$xyp[1][5], 15,18)
			break;
		}1{
			$buffb.Graphics.DrawRectangle($color_pen[1], 99,144,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][7],$xyp[1][5], 15,18)
			break;
		}2{
			$buffb.Graphics.DrawRectangle($color_pen[2], 99,269,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][7],$xyp[1][9], 15,18)
			break;
		}3{
			$buffb.Graphics.DrawRectangle($color_pen[3],259,394,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][13],$xyp[1][7], 15,18)
		}
		} #sw

		$buffb.Render($gpb);

		$gpb.DrawBeziers($cable[1],$pointah[1])
		$gpb.DrawBeziers($cable[0],$pointah[0])
		$gpb.DrawBeziers($cable[3],$pointah[3])
		$gpb.DrawBeziers($cable[2],$pointah[2])
		$gpb.DrawBeziers($cable[4],$pointah[4])

		$gpb.DrawRectangle($pen,   $xyp[0][3],$xyp[1][5], 15,18)
		$gpb.DrawRectangle($pen,   $xyp[0][7],$xyp[1][5], 15,18)
		$gpb.DrawRectangle($pen,   $xyp[0][7],$xyp[1][9], 15,18)
		$gpb.DrawRectangle($pen,   $xyp[0][13],$xyp[1][7], 15,18)

		$gpb.DrawString("M", $Fona, $tex[0], $xyp[0][3],$xyp[1][5])
		$gpb.DrawString("M", $Fona, $tex[1], $xyp[0][7],$xyp[1][5])
		$gpb.DrawString("M", $Fona, $tex[2], $xyp[0][7],$xyp[1][9])
		$gpb.DrawString("C", $Fona, $tex[3], $xyp[0][13],$xyp[1][7])

		$gpb.DrawLine($pen, $xyp[0][2],$xyp[1][6], $xyp[0][3],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][2],$xyp[1][4], $xyp[0][2],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][2],$xyp[1][4], $xyp[0][6],$xyp[1][4])
		$gpb.DrawLine($pen, $xyp[0][6],$xyp[1][4], $xyp[0][6],$xyp[1][6])

		$gpb.DrawLine($pen, $xyp[0][5],$xyp[1][6], $xyp[0][7],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][9],$xyp[1][6], $xyp[0][11],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][9],$xyp[1][10], $xyp[0][11],$xyp[1][10])
		$gpb.DrawLine($pen, $xyp[0][11],$xyp[1][6], $xyp[0][11],$xyp[1][10])
		$gpb.DrawLine($pen, $xyp[0][11],$xyp[1][8], $xyp[0][13],$xyp[1][8])
		$gpb.DrawLine($pen, $xyp[0][15],$xyp[1][8], $xyp[0][17],$xyp[1][8])

		break;
	}4{
		$Pictbox1.Location= "100,20"
		$Pictbox2.Location= "180,145"
		$Pictbox3.Location= "100,270"
		$Pictbox4.Location= "180,395"

		switch($sw){
		0{
			$buffb.Graphics.DrawRectangle($color_pen[0], 99,19,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][7],$xyp[1][5], 15,18)
			break;
		}1{
			$buffb.Graphics.DrawRectangle($color_pen[1],179,144,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][5], 15,18)
			break;
		}2{
			$buffb.Graphics.DrawRectangle($color_pen[2], 99,269,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][7],$xyp[1][9], 15,18)
			break;
		}3{
			$buffb.Graphics.DrawRectangle($color_pen[3],179,394,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][9], 15,18)
		}
		} #sw

		$buffb.Render($gpb);

		$gpb.DrawBeziers($cable[3],$pointaj[2])
		$gpb.DrawBeziers($cable[1],$pointaj[1])
		$gpb.DrawBeziers($cable[0],$pointaj[0])
		$gpb.DrawBeziers($cable[2],$pointaj[3])
		$gpb.DrawBeziers($cable[4],$pointaj[4])

		$gpb.DrawRectangle($pen,   $xyp[0][7],$xyp[1][5], 15,18)
		$gpb.DrawRectangle($pen,   $xyp[0][11],$xyp[1][5], 15,18)
		$gpb.DrawRectangle($pen,   $xyp[0][7],$xyp[1][9], 15,18)
		$gpb.DrawRectangle($pen,   $xyp[0][11],$xyp[1][9], 15,18)

		$gpb.DrawString("M", $Fona, $tex[0], $xyp[0][7],$xyp[1][5])
		$gpb.DrawString("C", $Fona, $tex[1], $xyp[0][11],$xyp[1][5])
		$gpb.DrawString("M", $Fona, $tex[2], $xyp[0][7],$xyp[1][9])
		$gpb.DrawString("C", $Fona, $tex[3], $xyp[0][11],$xyp[1][9])

		$gpb.DrawLine($pen, $xyp[0][6],$xyp[1][6], $xyp[0][7],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][6],$xyp[1][4], $xyp[0][6],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][6],$xyp[1][4], $xyp[0][10],$xyp[1][4])
		$gpb.DrawLine($pen, $xyp[0][10],$xyp[1][4], $xyp[0][10],$xyp[1][6])

		$gpb.DrawLine($pen, $xyp[0][9],$xyp[1][6], $xyp[0][11],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][9],$xyp[1][10], $xyp[0][11],$xyp[1][10])
		$gpb.DrawLine($pen, $xyp[0][13],$xyp[1][6], $xyp[0][15],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][13],$xyp[1][10], $xyp[0][15],$xyp[1][10])
		$gpb.DrawLine($pen, $xyp[0][15],$xyp[1][6], $xyp[0][15],$xyp[1][10])
		$gpb.DrawLine($pen, $xyp[0][15],$xyp[1][8], $xyp[0][17],$xyp[1][8])

		break;
	}5{
		$Pictbox1.Location= "20,20"
		$Pictbox2.Location= "180,145"
		$Pictbox3.Location= "180,270"
		$Pictbox4.Location= "180,395"

		switch($sw){
		0{
			$buffb.Graphics.DrawRectangle($color_pen[0], 19,19,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][5],$xyp[1][9], 15,18)
			break;
		}1{
			$buffb.Graphics.DrawRectangle($color_pen[1],179,144,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][5], 15,18)
			break;
		}2{
			$buffb.Graphics.DrawRectangle($color_pen[2],179,269,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][9], 15,18)
			break;
		}3{
			$buffb.Graphics.DrawRectangle($color_pen[3],179,394,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][13], 15,18)
		}
		} #sw

		$buffb.Render($gpb);

		$gpb.DrawBeziers($cable[1],$pointal[3]) # [3]>[2]>[1]
		$gpb.DrawBeziers($cable[1],$pointal[2])
		$gpb.DrawBeziers($cable[1],$pointal[1])
		$gpb.DrawBeziers($cable[0],$pointal[0])
		$gpb.DrawBeziers($cable[2],$pointal[4])
		$gpb.DrawBeziers($cable[3],$pointal[5])
		$gpb.DrawBeziers($cable[4],$pointal[6])

		$gpb.DrawRectangle($pen,   $xyp[0][5],$xyp[1][9], 15,18)
		$gpb.DrawRectangle($pen,   $xyp[0][11],$xyp[1][5], 15,18)
		$gpb.DrawRectangle($pen,   $xyp[0][11],$xyp[1][9], 15,18)
		$gpb.DrawRectangle($pen,   $xyp[0][11],$xyp[1][13], 15,18)

		$gpb.DrawString("M", $Fona, $tex[0], $xyp[0][5],$xyp[1][9])
		$gpb.DrawString("C", $Fona, $tex[1], $xyp[0][11],$xyp[1][5])
		$gpb.DrawString("C", $Fona, $tex[2], $xyp[0][11],$xyp[1][9])
		$gpb.DrawString("C", $Fona, $tex[3], $xyp[0][11],$xyp[1][13])

		$gpb.DrawLine($pen, $xyp[0][4],$xyp[1][10], $xyp[0][5],$xyp[1][10])
		$gpb.DrawLine($pen, $xyp[0][4],$xyp[1][8], $xyp[0][4],$xyp[1][10])
		$gpb.DrawLine($pen, $xyp[0][4],$xyp[1][8], $xyp[0][8],$xyp[1][8])
		$gpb.DrawLine($pen, $xyp[0][8],$xyp[1][8], $xyp[0][8],$xyp[1][10])

		$gpb.DrawLine($pen, $xyp[0][7],$xyp[1][10], $xyp[0][9],$xyp[1][10])
		$gpb.DrawLine($pen, $xyp[0][9],$xyp[1][6], $xyp[0][9],$xyp[1][14])
		$gpb.DrawLine($pen, $xyp[0][9],$xyp[1][6], $xyp[0][11],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][9],$xyp[1][10], $xyp[0][11],$xyp[1][10])
		$gpb.DrawLine($pen, $xyp[0][9],$xyp[1][14], $xyp[0][11],$xyp[1][14])
		$gpb.DrawLine($pen, $xyp[0][13],$xyp[1][6], $xyp[0][15],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][13],$xyp[1][10], $xyp[0][15],$xyp[1][10])
		$gpb.DrawLine($pen, $xyp[0][13],$xyp[1][14], $xyp[0][15],$xyp[1][14])
		$gpb.DrawLine($pen, $xyp[0][15],$xyp[1][6], $xyp[0][15],$xyp[1][14])
		$gpb.DrawLine($pen, $xyp[0][15],$xyp[1][10], $xyp[0][17],$xyp[1][10])

		break;
	 }6{
		$Pictbox1.Location= "100,20"
		$Pictbox2.Location= "180,145"
		$Pictbox3.Location= "180,270"
		$Pictbox4.Location= "180,395"

		switch($sw){
		0{
			$buffb.Graphics.DrawRectangle($color_pen[0], 99,19,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][7],$xyp[1][5], 15,18)
			break;
		}1{
			$buffb.Graphics.DrawRectangle($color_pen[1],179,144,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][5], 15,18)
			break;
		}2{
			$buffb.Graphics.DrawRectangle($color_pen[2],179,269,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][9], 15,18)
			break;
		}3{
			$buffb.Graphics.DrawRectangle($color_pen[3],179,394,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][13], 15,18)
		}
		} #sw

		$buffb.Render($gpb);

		$gpb.DrawBeziers($cable[1],$pointan[1])
		$gpb.DrawBeziers($cable[0],$pointan[0])
		$gpb.DrawBeziers($cable[2],$pointan[2])
		$gpb.DrawBeziers($cable[3],$pointan[3])
		$gpb.DrawBeziers($cable[4],$pointan[4])

		$gpb.DrawRectangle($pen,   $xyp[0][7],$xyp[1][5], 15,18)
		$gpb.DrawRectangle($pen,   $xyp[0][11],$xyp[1][5], 15,18)
		$gpb.DrawRectangle($pen,   $xyp[0][11],$xyp[1][9], 15,18)
		$gpb.DrawRectangle($pen,   $xyp[0][11],$xyp[1][13], 15,18)

		$gpb.DrawString("M", $Fona, $tex[0], $xyp[0][7],$xyp[1][5])
		$gpb.DrawString("C", $Fona, $tex[1], $xyp[0][11],$xyp[1][5])
		$gpb.DrawString("C", $Fona, $tex[2], $xyp[0][11],$xyp[1][9])
		$gpb.DrawString("C", $Fona, $tex[3], $xyp[0][11],$xyp[1][13])

		$gpb.DrawLine($pen, $xyp[0][6],$xyp[1][6], $xyp[0][7],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][6],$xyp[1][4], $xyp[0][6],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][6],$xyp[1][4], $xyp[0][10],$xyp[1][4])
		$gpb.DrawLine($pen, $xyp[0][10],$xyp[1][4], $xyp[0][10],$xyp[1][6])

		$gpb.DrawLine($pen, $xyp[0][9],$xyp[1][6], $xyp[0][11],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][13],$xyp[1][6], $xyp[0][15],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][13],$xyp[1][10], $xyp[0][15],$xyp[1][10])
		$gpb.DrawLine($pen, $xyp[0][13],$xyp[1][14], $xyp[0][15],$xyp[1][14])
		$gpb.DrawLine($pen, $xyp[0][15],$xyp[1][6], $xyp[0][15],$xyp[1][14])
		$gpb.DrawLine($pen, $xyp[0][15],$xyp[1][10], $xyp[0][17],$xyp[1][10])

		break;
	}7{
		$Pictbox1.Location= "180,20"
		$Pictbox2.Location= "180,145"
		$Pictbox3.Location= "180,270"
		$Pictbox4.Location= "180,395"

		switch($sw){
		0{
			$buffb.Graphics.DrawRectangle($color_pen[0],179,19,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][1], 15,18)
			break;
		}1{
			$buffb.Graphics.DrawRectangle($color_pen[1],179,144,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][5], 15,18)
			break;
		}2{
			$buffb.Graphics.DrawRectangle($color_pen[2],179,269,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][9], 15,18)
			break;
		}3{
			$buffb.Graphics.DrawRectangle($color_pen[3],179,394,163,103)
			$buffb.Graphics.FillRectangle($brush, $xyp[0][11],$xyp[1][13], 15,18)
		}
		} #sw

		$buffb.Render($gpb);

		$gpb.DrawBeziers($cable[1],$pointap[1])
		$gpb.DrawBeziers($cable[0],$pointap[0])
		$gpb.DrawBeziers($cable[2],$pointap[2])
		$gpb.DrawBeziers($cable[3],$pointap[3])
		$gpb.DrawBeziers($cable[4],$pointap[4])

		$gpb.DrawRectangle($pen,   $xyp[0][11],$xyp[1][1], 15,18)
		$gpb.DrawRectangle($pen,   $xyp[0][11],$xyp[1][5], 15,18)
		$gpb.DrawRectangle($pen,   $xyp[0][11],$xyp[1][9], 15,18)
		$gpb.DrawRectangle($pen,   $xyp[0][11],$xyp[1][13], 15,18)

		$gpb.DrawString("C", $Fona, $tex[0], $xyp[0][11],$xyp[1][1])
		$gpb.DrawString("C", $Fona, $tex[1], $xyp[0][11],$xyp[1][5])
		$gpb.DrawString("C", $Fona, $tex[2], $xyp[0][11],$xyp[1][9])
		$gpb.DrawString("C", $Fona, $tex[3], $xyp[0][11],$xyp[1][13])

		$gpb.DrawLine($pen, $xyp[0][10],$xyp[1][2], $xyp[0][11],$xyp[1][2])
		$gpb.DrawLine($pen, $xyp[0][10],$xyp[1][0], $xyp[0][10],$xyp[1][2])
		$gpb.DrawLine($pen, $xyp[0][10],$xyp[1][0], $xyp[0][14],$xyp[1][0])
		$gpb.DrawLine($pen, $xyp[0][14],$xyp[1][0], $xyp[0][14],$xyp[1][2])

		$gpb.DrawLine($pen, $xyp[0][13],$xyp[1][2], $xyp[0][15],$xyp[1][2])
		$gpb.DrawLine($pen, $xyp[0][13],$xyp[1][6], $xyp[0][15],$xyp[1][6])
		$gpb.DrawLine($pen, $xyp[0][13],$xyp[1][10], $xyp[0][15],$xyp[1][10])
		$gpb.DrawLine($pen, $xyp[0][13],$xyp[1][14], $xyp[0][15],$xyp[1][14])
		$gpb.DrawLine($pen, $xyp[0][15],$xyp[1][2], $xyp[0][15],$xyp[1][14])
		$gpb.DrawLine($pen, $xyp[0][15],$xyp[1][8], $xyp[0][17],$xyp[1][8])
	}
	} #sw
 } #func
 
function Pict_chg(){ 

	switch($comb_fm.SelectedItem){
	'vrc7 2op'{	[int]$n= 0;		break; # alg
	}'opl 2op'{	[int]$n= $opl_two[0][0];	break;
	}'opn 4op'{	[int]$n= $opn_fur[0][0];	break;
	}'opm 4op'{	[int]$n= $opm_fur[0][0]
	}
	} #sw

	 switch(Itm){
	'2op'{
		$pict_panel.SuspendLayout()
		Alg_cablw $n
		# $buffw.Render($gpw);

		$pict_panel.ResumeLayout()
		$Pictbw.Refresh()
		break;
	}'4op'{
		$pict_panel.SuspendLayout()
		Alg_cable $n
		# $buffb.Render($gpb);

		$pict_panel.ResumeLayout()
		$Pictbg.Refresh()
	}
	} #sw
 } #func
 
function All_chg(){	# $vrc_svn[][] ha "__1" no string 

	switch($comb_fm.SelectedItem){
	'vrc7 2op'{
		[array]$arr= $vrc_svn

		[int]$n= 0 # alg:0
		[int]$f= $arr[0][1] # fb

		[array]$env= @(0,0) # ar,dr,sl,rr,eg
		$env[0]= @($arr[0][2],$arr[0][3],$arr[0][4],$arr[0][5],$arr[0][10])
		$env[1]= @($arr[1][2],$arr[1][3],$arr[1][4],$arr[1][5],$arr[1][10])

		[array]$cyle= @(0,0) # tl,ml,dt
		$cyle[0]= @($arr[0][0],$arr[0][7],$arr[0][12])
		$cyle[1]= @($arr[1][0],$arr[1][7],$arr[1][12])

		break;
	}'opl 2op'{
		[array]$arr= $opl_two

		[int]$n= $arr[0][0] # alg
		[int]$f= $arr[0][1] # fb

		[array]$env= @(0,0) # ar,dr,sl,rr,eg
		$env[0]= @($arr[0][2],$arr[0][3],$arr[0][5],$arr[0][4],$arr[0][10])
		$env[1]= @($arr[1][2],$arr[1][3],$arr[1][5],$arr[1][4],$arr[1][10])

		[array]$cyle= @(0,0) # tl,ml,dt:0
		$cyle[0]= @($arr[0][6],$arr[0][8],0)
		$cyle[1]= @($arr[1][6],$arr[1][8],0)

		break;
	}'opn 4op'{
		[array]$arr= $opn_fur

		[int]$n= $arr[0][0] # alg
		[int]$f= $arr[0][1] # fb

		[array]$env= @(0,0,0,0) # ar,dr,sllev,sl,rr
		$env[0]= @($arr[0][2],$arr[0][3],$arr[0][6],$arr[0][4],$arr[0][5])
		$env[1]= @($arr[1][2],$arr[1][3],$arr[1][6],$arr[1][4],$arr[1][5])
		$env[2]= @($arr[2][2],$arr[2][3],$arr[2][6],$arr[2][4],$arr[2][5])
		$env[3]= @($arr[3][2],$arr[3][3],$arr[3][6],$arr[3][4],$arr[3][5])

		[array]$cyle= @(0,0,0,0) # tl,ml
		$cyle[0]= @($arr[0][7],$arr[0][9])
		$cyle[1]= @($arr[1][7],$arr[1][9])
		$cyle[2]= @($arr[2][7],$arr[2][9])
		$cyle[3]= @($arr[3][7],$arr[3][9])

		break;
	}'opm 4op'{
		[array]$arr= $opm_fur

		[int]$n= $arr[0][0] # alg
		[int]$f= $arr[0][1] # fb

		[array]$env= @(0,0,0,0) # ar,dr,sllev,sl,rr
		$env[0]= @($arr[0][2],$arr[0][3],$arr[0][6],$arr[0][4],$arr[0][5])
		$env[1]= @($arr[1][2],$arr[1][3],$arr[1][6],$arr[1][4],$arr[1][5])
		$env[2]= @($arr[2][2],$arr[2][3],$arr[2][6],$arr[2][4],$arr[2][5])
		$env[3]= @($arr[3][2],$arr[3][3],$arr[3][6],$arr[3][4],$arr[3][5])

		[array]$cyle= @(0,0,0,0) # tl,ml
		$cyle[0]= @($arr[0][7],$arr[0][9])
		$cyle[1]= @($arr[1][7],$arr[1][9])
		$cyle[2]= @($arr[2][7],$arr[2][9])
		$cyle[3]= @($arr[3][7],$arr[3][9])
	}
	} #sw


	 switch(Itm){
	'2op'{
		$pict_panel.SuspendLayout()

		Alg_cablw $n

		Poly_2op $env 0
		Poly_2op $env 1

		$buffz.Render($gpv) # ura buffer store
		$buffx.Render($gpt)

		# size down

		$buffz.Render($gp_tmp);
		$gpz.DrawImage($image_tmp, $op_Rect)

		$buffx.Render($gp_tmp);
		$gpx.DrawImage($image_tmp, $op_Rect)


		Sin_2op $cyle $n $f
		sleep -m $key["wait"]

		[string[]]$value= Value_out

		$gpz.DrawString($value[0], $Fona, $XBbrush, 120,5)
		$gpx.DrawString($value[1], $Fona, $XRbrush, 120,5)


		$Pictbg.Hide()
		$Pictbox1.Hide()
		$Pictbox2.Hide()
		$Pictbox3.Hide()
		$Pictbox4.Hide()

		$Pictbw.Show()		# 高速化 -> .Refreshの直前
		$Pictbox1a.Show()
		$Pictbox2a.Show()

		$pict_panel.ResumeLayout()

		$pict_panel.Size= "480,280"
		$sb_alg.Size= "502,371"

		$Pictbw.Refresh()	# poly to sine no ato kireini read
		$Pictbox1a.Refresh()
		$Pictbox2a.Refresh()

		break;
	}'4op'{
		$pict_panel.SuspendLayout()

		Alg_cable $n
		Poly_4op $env 0
		Poly_4op $env 1
		Poly_4op $env 2
		Poly_4op $env 3

		$buffc.Render($gpk) # ura buffer store
		$buffe.Render($gpm)
		$buffg.Render($gpo)
		$buffi.Render($gpq)

		# size down

		$buffc.Render($gp_tmp);
		$gpc.DrawImage($image_tmp, $op_Rect)

		$buffe.Render($gp_tmp);
		$gpe.DrawImage($image_tmp, $op_Rect)

		$buffg.Render($gp_tmp);
		$gpg.DrawImage($image_tmp, $op_Rect)

		$buffi.Render($gp_tmp);
		$gpi.DrawImage($image_tmp, $op_Rect)


		Sin_4op $cyle $n $f
		sleep -m $key["wait"]

		[string[]]$value= Value_out

		$gpc.DrawString($value[0], $Fona, $XBbrush, 120,5)
		$gpe.DrawString($value[1], $Fona, $XGbrush, 120,5)
		$gpg.DrawString($value[2], $Fona, $XObrush, 120,5)
		$gpi.DrawString($value[3], $Fona, $XRbrush, 120,5)

		$Pictbw.Hide()
		$Pictbox1a.Hide()
		$Pictbox2a.Hide()

		$Pictbg.Show()
		$Pictbox1.Show()
		$Pictbox2.Show()
		$Pictbox3.Show()
		$Pictbox4.Show()

		$pict_panel.ResumeLayout()

		$pict_panel.Size= "480,530"
		$sb_alg.Size= "502,621"

		$Pictbg.Refresh()
		$Pictbox1.Refresh()	# Invalidate() tsudo tsudo
		$Pictbox2.Refresh()
		$Pictbox3.Refresh()
		$Pictbox4.Refresh()
	}
	} #sw
 } #func
  
# sub window gui 
	 
function Stus_alg(){ # status bar 

	switch($bai){
	1{	[string] $t= "2/1"; break;
	}2{	[string] $t= "1/1"; break;
	}4{	[string] $t= "1/2"
	}
	} #sw

	$sb_label.Text= $t+ " | "+ "adjust: "+ $key["adjust"]+ " | "+ "wait: "+ $key["wait"]+ "ms"+ " | "+ "layout: "+ $key["layout"]+ " | "+ " color: "+ $key["mode"]+", "+ $key["color"]

 } #func
 
function Attend_alg([float] $j ){ 

	switch($j){
	1{	[string]$t= "2/1 精度にします"; break;
	}2{	[string]$t= "1/1 精度にします"; break;
	}4{	[string]$t= "1/2 精度にします"
	}
	} #sw

	[string]$retn= [Windows.Forms.MessageBox]::Show(

		$t, "確認", "OKCancel","Information","Button2"
	)

	switch($retn){
	'OK'{		return $j ;
	##}'Cancel'{
	}
	} #sw
 } #func
 
function Peralg_build([float] $n ){ 

	$sb_menu_w0.Text= " 2/1 精度"
	$sb_menu_w1.Text= " 1/1 精度"
	$sb_menu_w2.Text= " 1/2 精度"

	switch($n){
	1{	$sb_menu_w0.Text= "[v] 2/1 精度"
		Write-Host '<< 2/1 精度で表示します'
		break;
	}2{	$sb_menu_w1.Text= "[v] 1/1 精度"
		Write-Host '<< 1/1 精度で表示します'
		break;
	}4{	$sb_menu_w2.Text= "[v] 1/2 精度"
		Write-Host '<< 1/2 精度で表示します'
	}
	} #sw
 } #func
 
function Popalg_build([string] $t ){ # <- $key["open"] 

	switch($t){
	'True'{
		$fm_menu_sb.Text= "v FM OP window"

		Contxt_chg_vrc $key["knob"][0]
		Contxt_chg_opl $key["knob"][1]
		Contxt_chg_opn $key["knob"][2]
		Contxt_chg_opm $key["knob"][3]
		Contxt_octave $key["oct"]

		All_chg
		Stus_alg
		break;
	}'False'{
		$fm_menu_sb.Text= "FM OP window"
	}
	} #sw

	return $t
 } #func
 
function Layout_alg([string]$t){ 

	switch($t){
	'nomal'{
		$sb_menu_ff.Text= "[v] nomal"
		$sb_menu_rev.Text= "reverse"
		break;
	}'reverse'{
		$sb_menu_ff.Text= "nomal"
		$sb_menu_rev.Text= "[v] reverse"
	}
	} #sw

	return $t
 } #func
 
function Mode_alg([string] $t){ 

	$sb_menu_dark.Text= "Dark"
	$sb_menu_light.Text= "Light"

	switch($t){
	'dark'{	$sb_menu_dark.Text= "[v] Dark";	break;
	}'light'{	$sb_menu_light.Text= "[v] Light"
	}
	} #sw

	return $t
 } #func
 
function Color_alg([string]$t){ 

	$sb_menu_steel.Text= "Steel"
	$sb_menu_natural.Text= "Natural"
	$sb_menu_pastel.Text= "Pastel"
	$sb_menu_vivid.Text= "Vivid"

	switch($t){
	'steel'{	$sb_menu_steel.Text= "[v] Steel";	break;
	}'natural'{	$sb_menu_natural.Text= "[v] Natural";	break;
	}'pastel'{	$sb_menu_pastel.Text= "[v] Pastel";	break;
	}'vivid'{	$sb_menu_vivid.Text= "[v] Vivid"
	}
	} #sw

	return $t
 } #func
  
# ------ 
 
# load save 
	
function Autoload($x){ 

	if($comb_fm.SelectedItem -ne $x.name){

		# $comb_fm.Add_SelectedValueChanged
		$comb_fm.SelectedItem= $x.name
	}

	if($comb_vrc.SelectedIndex -ne ([int] $x.vrc.number)){
		$comb_vrc.SelectedIndex= [int] $x.vrc.number
	}
	if($comb_opl.SelectedIndex -ne ([int] $x.opl.number)){
		$comb_opl.SelectedIndex= [int] $x.opl.number
	}
	if($comb_opn.SelectedIndex -ne ([int] $x.opn.number)){
		$comb_opn.SelectedIndex= [int] $x.opn.number
	}
	if($comb_opm.SelectedIndex -ne ([int] $x.opm.number)){
		$comb_opm.SelectedIndex= [int] $x.opm.number
	}

	[array]$r= @("","")
	$r[0]= $x.vrc.M1.value -split ","
	$r[1]= $x.vrc.CA.value -split ","

	$script:vrc_svn= $r

	[array]$r= @("","")
	$r[0]= $x.opl.M1.value -split ","
	$r[1]= $x.opl.CA.value -split ","

	$script:opl_two= $r

	[array]$r= @("","","","")
	$r[0]= $x.opn.M3.value -split ","
	$r[1]= $x.opn.M2.value -split ","
	$r[2]= $x.opn.M1.value -split ","
	$r[3]= $x.opn.CA.value -split ","

	$script:opn_fur= $r

	[array]$r= @("","","","")
	$r[0]= $x.opm.M3.value -split ","
	$r[1]= $x.opm.M2.value -split ","
	$r[2]= $x.opm.M1.value -split ","
	$r[3]= $x.opm.CA.value -split ","

	$script:opm_fur= $r

 } # func
 
function Saveauto($x){ 

	$x.name= $comb_fm.SelectedItem
	$x.param= "AutoSave : "+ (Get-Date).ToString("yyyy/MM/dd HH:mm")

	$x.vrc.number= [string] $comb_vrc.SelectedIndex
	$x.opl.number=  [string] $comb_opl.SelectedIndex
	$x.opn.number=  [string] $comb_opn.SelectedIndex
	$x.opm.number=  [string] $comb_opm.SelectedIndex

	[array]$r= @()

	$r= $vrc_svn

	$x.vrc.M1.value=  [string]($r[0] -join ",")
	$x.vrc.CA.value=  [string]($r[1] -join ",")

	$r= $opl_two

	$x.opl.M1.value=  [string]($r[0] -join ",")
	$x.opl.CA.value=  [string]($r[1] -join ",")

	$r= $opn_fur

	$x.opn.M3.value=  [string]($r[0] -join ",")
	$x.opn.M2.value=  [string]($r[1] -join ",")
	$x.opn.M1.value=  [string]($r[2] -join ",")
	$x.opn.CA.value=  [string]($r[3] -join ",")

	$r= $opm_fur

	$x.opm.M3.value=  [string]($r[0] -join ",")
	$x.opm.M2.value=  [string]($r[1] -join ",")
	$x.opm.M1.value=  [string]($r[2] -join ",")
	$x.opm.CA.value=  [string]($r[3] -join ",")

 } #func
 
function Write_slot([string]$sw){ 


	switch($sw){
	'A'{		$x= $script:fm_xml.table.slot.A;	break;
	}'B'{		$x= $script:fm_xml.table.slot.B;	break;
	}'C'{		$x= $script:fm_xml.table.slot.C;	break;
	}'D'{		$x= $script:fm_xml.table.slot.D;	break;
	}'E'{		$x= $script:fm_xml.table.slot.E;	break;
	}'F'{		$x= $script:fm_xml.table.slot.F;	break;
	}'G'{		$x= $script:fm_xml.table.slot.G;	break;
	}'H'{		$x= $script:fm_xml.table.slot.H
	}
	} #sw

	$x.name= $comb_fm.SelectedItem
	$x.number= [string](Idx)
	$x.param= $sub_sav_box.Text+ " : "+ (Get-Date).ToString("yyyy/MM/dd HH:mm")


	switch($x.name){
	'vrc7 2op'{

		[array]$r= $vrc_svn

		$x.M3.value=  ""
		$x.M2.value=  ""
		$x.M1.value=  [string]($r[0] -join ",")
		$x.CA.value=  [string]($r[1] -join ",")
		break;
	}'opl 2op'{

		[array]$r= $opl_two

		$x.M3.value=  ""
		$x.M2.value=  ""
		$x.M1.value=  [string]($r[0] -join ",")
		$x.CA.value=  [string]($r[1] -join ",")
		break;
	}'opn 4op'{

		[array]$r= $opn_fur

		$x.M3.value=  [string]($r[0] -join ",")
		$x.M2.value=  [string]($r[1] -join ",")
		$x.M1.value=  [string]($r[2] -join ",")
		$x.CA.value=  [string]($r[3] -join ",")
		break;
	}'opm 4op'{

		[array]$r= $opm_fur

		$x.M3.value=  [string]($r[0] -join ",")
		$x.M2.value=  [string]($r[1] -join ",")
		$x.M1.value=  [string]($r[2] -join ",")
		$x.CA.value=  [string]($r[3] -join ",")
	}
	} #sw
 } #func
 
function Slot_build($x, [string]$s){ 

	switch($s){
	'A'{
		$fm_lad_a.Text= "slot A [ "+ $x.A.name+ " : "+$x.A.param + " ]"
		$fm_sav_a.Text= "slot A [ "+ $x.A.name+ " : "+$x.A.param + " ]"
		break;
	}'B'{
		$fm_lad_b.Text= "slot B [ "+ $x.B.name+ " : "+ $x.B.param+ " ]"
		$fm_sav_b.Text= "slot B [ "+ $x.B.name+ " : "+ $x.B.param+ " ]"
		break;
	}'C'{
		$fm_lad_c.Text= "slot C [ "+ $x.C.name+ " : "+ $x.C.param+ " ]"
		$fm_sav_c.Text= "slot C [ "+ $x.C.name+ " : "+ $x.C.param+ " ]"
		break;
	}'D'{
		$fm_lad_d.Text= "slot D [ "+ $x.D.name+ " : "+ $x.D.param+ " ]"
		$fm_sav_d.Text= "slot D [ "+ $x.D.name+ " : "+ $x.D.param+ " ]"
		break;
	}'E'{
		$fm_lad_e.Text= "slot E [ "+ $x.E.name+ " : "+ $x.E.param+ " ]"
		$fm_sav_e.Text= "slot E [ "+ $x.E.name+ " : "+ $x.E.param+ " ]"
		break;
	}'F'{
		$fm_lad_f.Text= "slot F [ "+ $x.F.name+ " : "+ $x.F.param+ " ]"
		$fm_sav_f.Text= "slot F [ "+ $x.F.name+ " : "+ $x.F.param+ " ]"
		break;
	}'G'{
		$fm_lad_g.Text= "slot G [ "+ $x.G.name+ " : "+ $x.G.param+ " ]"
		$fm_sav_g.Text= "slot G [ "+ $x.G.name+ " : "+ $x.G.param+ " ]"
		break;
	}'H'{
		$fm_lad_h.Text= "slot H [ "+ $x.H.name+ " : "+ $x.H.param+ " ]"
		$fm_sav_h.Text= "slot H [ "+ $x.H.name+ " : "+ $x.H.param+ " ]"
	}
	} #sw
 } #func
 
function Save_value([string]$sw){ 

	$sub_sav_grp.Text= ("slot "+ $sw)

	[string]$retn= $sub_sav.ShowDialog()

	switch($retn){
	'OK'{
		Write_slot $sw
		Slot_build $fm_xml.table.slot $sw
	# }'Cancel'{
	}
	} #sw
 } #func
 
function Slot_read($x){ 


	switch($x.name){
	'vrc7 2op'{
		[array]$r= @("","")
		$r[0]= $x.M1.value -split ","
		$r[1]= $x.CA.value -split ","

		$script:vrc_svn= $r

		break;
	}'opl 2op'{
		[array]$r= @("","")
		$r[0]= $x.M1.value -split ","
		$r[1]= $x.CA.value -split ","

		$script:opl_two= $r

		break;
	}'opn 4op'{
		[array]$r= @("","","","")
		$r[0]= $x.M3.value -split ","
		$r[1]= $x.M2.value -split ","
		$r[2]= $x.M1.value -split ","
		$r[3]= $x.CA.value -split ","

		$script:opn_fur= $r

		break;
	}'opm 4op'{
		[array]$r= @("","","","")
		$r[0]= $x.M3.value -split ","
		$r[1]= $x.M2.value -split ","
		$r[2]= $x.M1.value -split ","
		$r[3]= $x.CA.value -split ","

		$script:opm_fur= $r
	}
	} #sw

 } #func
 
function Load_value($x, [string]$sw){ 

	switch($sw){
	'A'{
		$comb_fm.SelectedItem= $x.A.name # $comb_fm change
		Opmap_change $x.A.number
		Slot_read $x.A
		break;
	}'B'{
		$comb_fm.SelectedItem= $x.B.name
		Opmap_change $x.B.number
		Slot_read $x.B
		break;
	}'C'{
		$comb_fm.SelectedItem= $x.C.name
		Opmap_change $x.C.number
		Slot_read $x.C
		break;
	}'D'{
		$comb_fm.SelectedItem= $x.D.name
		Opmap_change $x.D.number
		Slot_read $x.D
		break;
	}'E'{
		$comb_fm.SelectedItem= $x.E.name
		Opmap_change $x.E.number
		Slot_read $x.E
		break;
	}'F'{
		$comb_fm.SelectedItem= $x.F.name
		Opmap_change $x.F.number
		Slot_read $x.F
		break;
	}'G'{
		$comb_fm.SelectedItem= $x.G.name
		Opmap_change $x.G.number
		Slot_read $x.G
		break;
	}'H'{
		$comb_fm.SelectedItem= $x.H.name
		Opmap_change $x.H.number
		Slot_read $x.H
	}
	} #sw

	Unredo 2

	Panel_chg $comb_fm.SelectedItem
	Stus_build

	$comb_fm.Select() # sai enter event no tame

	if($sb_alg.Visible){
		All_chg
	}
 } #func
  
# hash 
	 
function Fmchange_value([string]$sw, [string]$name){ 

  # if($name -match '[v]' -eq $False){

	switch($sw){
	'mck'{		$script:val[$sw]= $mck[$name];	break;
	}'nsd'{		$script:val[$sw]= $nsd[$name];	break;
	}'pmd'{		$script:val[$sw]= $pmd[$name];	break;

	}'compiler'{	$script:val[$sw]= $val[$name];		break;
	}'player'{		$script:val[$sw]= $play[$name];	break;
	}'dos'{		$script:val[$sw]= $dos[$name];	break;
	}'editor'{		$script:val[$sw]= $edit[$name]
	}
	} #sw
  # }
 } #func
 
function Setxml_read($x){ 

	# $x= $script:set_xml.table

	for([int]$i=7; $i -ge 0; $i--){

		if($x.ply[$i].name -ne ''){
			$script:play[$x.ply[$i].name]= $x.ply[$i].param
		}
		if($x.edt[$i].name -ne ''){
			$script:edit[$x.edt[$i].name]= $x.edt[$i].param
		}

		if($i -le 3){
			if($x.mck[$i].name -ne ''){
				$script:mck[$x.mck[$i].name]= $x.mck[$i].param
			}

			if($x.nsd[$i].name -ne ''){
				$script:nsd[$x.nsd[$i].name]= $x.nsd[$i].param
			}

			if($x.pmd[$i].name -ne ''){
				$script:pmd[$x.pmd[$i].name]= $x.pmd[$i].param
			}

			if($x.dos[$i].name -ne ''){
				$script:dos[$x.dos[$i].name]= $x.dos[$i].param
			}
		}
 	} #
 } #func
 
function Fmxml_read($x,$y){ # hash設定 

	# $x= $script:fm_xml.table.val
	# $y= $script:fm_xml.table.opt

	$script:val["mck"]= $x.mck.value
	$script:val["nsd"]= $x.nsd.value
	$script:val["pmd"]= $x.pmd.value
	$script:val["compiler"]= $x.cmp.value
	$script:val["player"]= $x.ply.value
	$script:val["dos"]= $x.dos.value
	$script:val["editor"]= $x.edt.value

	$script:opt["chk_dos"]= $y.chk_dos.value
	$script:opt["radio_bin"]= $y.radio_bin.value

	$script:key["mask"]= "15"		# non save
	$script:key["ssg"]= "0"		#
	$script:key["eg_type"]= "Thru"	#

	$script:key["tray"]= Trayfm_hide $y.tray.value
	$script:key["autosave"]= Autosav_sw $y.autosave.value
	$script:key["oct"]= Osc_sw $y.oct.value
	$script:key["ten"]= Ten_sw $y.ten.value
	$script:key["zero"]= Zero_sw $y.zero.value
	$script:key["type"]= Type_sw $y.type.value
	$script:key["style"]= Style_sw $y.style.value

	$script:bai= $fm_xml.table.opt.bai.value # 精度
	$script:key["adjust"]= Adj_sw $y.adjust.value
	$script:key["wait"]= Wait_sw $y.wait.value
	$script:key["layout"]= Layout_alg $y.layout.value
	$script:key["mode"]= Mode_alg $y.mode.value
	$script:key["color"]= Color_alg $y.color.value

	$script:key["clickplay"]= ClickPlay_sw $y.clickplay.value
	$script:key["knob"]= [string[]] ($y.knob.value -split ",")
	$script:key["open"]= $y.open.value # -> $frm_fm.Add_Shown
 } #func
 
function Fmwrite_xml($x,$y){ 

	# $x= $script:fm_xml.table.val
	# $y= $script:fm_xml.table.opt

	$x.mck.value= [string]$val["mck"]
	$x.nsd.value= [string]$val["nsd"]
	$x.pmd.value= [string]$val["pmd"]
	$x.cmp.value= [string]$val["compiler"]
	$x.ply.value= [string]$val["player"]
	$x.dos.value= [string]$val["dos"]
	$x.edt.value= [string]$val["editor"]

	$y.chk_dos.value= [string]$opt["chk_dos"]
	$y.radio_bin.value= [string]$opt["radio_bin"]

	$y.tray.value= [string]$key["tray"]
	$y.autosave.value= [string]$key["autosave"] # $xmlは[string]キャスト必要

	$y.oct.value= [string]$key["oct"]
	$y.zero.value= [string]$key["zero"]
	$y.ten.value= [string]$key["ten"]
	$y.type.value= [string]$key["type"]
	$y.style.value= [string]$key["style"]

	$y.bai.value= [string]$bai
	$y.adjust.value= [string]$key["adjust"]
	$y.wait.value= [string]$key["wait"]
	$y.layout.value= [string]$key["layout"]
	$y.mode.value= [string]$key["mode"]
	$y.color.value= [string]$key["color"]

	$y.clickplay.value= [string] $key["clickplay"]
	$y.knob.value= [string] ($key["knob"] -join ",")
	$y.open.value= [string]$key["open"]

 } #func
  
# gui 
	 
function Menu_comp_build([string]$t){ 

	$fm_menu_cmck.Text= "MCK"
	$fm_menu_cnsd.Text= "NSD"
	$fm_menu_cpmd.Text= "PMD"

	switch($t){
	'none'{
		break;
	}'mck'{
		$fm_menu_cmck.Text= "[v] MCK"
		break;
	}'nsd'{
		$fm_menu_cnsd.Text= "[v] NSD"
		break;
	}'pmd'{
		$fm_menu_cpmd.Text= "[v] PMD"
	}
	} #sw

	return $t
 } #func
 
function Menu_build([string]$sw){ 

	[string]$d= "[v] "

	[string[]]$n= Split_path $val[$sw]

	switch($sw){
	'mck'{
		[array]$w= $mck.Keys

		$fm_menu_mck0.Visible= $False
		$fm_menu_mck1.Visible= $False
		$fm_menu_mck2.Visible= $False
		$fm_menu_mck3.Visible= $False

		if($w.Length -ge 1){

			$fm_menu_mck0.Visible= $True

			if($n[0] -eq $w[0]){
				$fm_menu_mck0.Text= $d+ $w[0]
			}else{
				$fm_menu_mck0.Text= $w[0]
			}

			if($w.Length -ge 2){

			$fm_menu_mck1.Visible= $True

			if($n[0] -eq $w[1]){
				$fm_menu_mck1.Text= $d+ $w[1]
			}else{
				$fm_menu_mck1.Text= $w[1]
			}

				if($w.Length -ge 3){

			$fm_menu_mck2.Visible= $True

			if($n[0] -eq $w[2]){
				$fm_menu_mck2.Text= $d+ $w[2]
			}else{
				$fm_menu_mck2.Text= $w[2]
			}

					if($w.Length -ge 4){

			$fm_menu_mck3.Visible= $True

			if($n[0] -eq $w[3]){
				$fm_menu_mck3.Text= $d+ $w[3]
			}else{
				$fm_menu_mck3.Text= $w[3]
			}
					}
				}
			}
		}
		break;

	}'nsd'{
		[array]$w= $nsd.Keys

		$fm_menu_nsd0.Visible= $False
		$fm_menu_nsd1.Visible= $False
		$fm_menu_nsd2.Visible= $False
		$fm_menu_nsd3.Visible= $False

		if($w.Length -ge 1){

			$fm_menu_nsd0.Visible= $True

			if($n[0] -eq $w[0]){
				$fm_menu_nsd0.Text= $d+ $w[0]
			}else{
				$fm_menu_nsd0.Text= $w[0]
			}

			if($w.Length -ge 2){

			$fm_menu_nsd1.Visible= $True

			if($n[0] -eq $w[1]){
				$fm_menu_nsd1.Text= $d+ $w[1]
			}else{
				$fm_menu_nsd1.Text= $w[1]
			}

				if($w.Length -ge 3){

			$fm_menu_nsd2.Visible= $True

			if($n[0] -eq $w[2]){
				$fm_menu_nsd2.Text= $d+ $w[2]
			}else{
				$fm_menu_nsd2.Text= $w[2]
			}

					if($w.Length -ge 4){

			$fm_menu_nsd3.Visible= $True

			if($n[0] -eq $w[3]){
				$fm_menu_nsd3.Text= $d+ $w[3]
			}else{
				$fm_menu_nsd3.Text= $w[3]
			}
					}
				}
			}
		}
		break;

	}'pmd'{
		[array]$w= $pmd.Keys

		$fm_menu_pmd0.Visible= $False
		$fm_menu_pmd1.Visible= $False
		$fm_menu_pmd2.Visible= $False
		$fm_menu_pmd3.Visible= $False

		if($w.Length -ge 1){

			$fm_menu_pmd0.Visible= $True

			if($n[0] -eq $w[0]){
				$fm_menu_pmd0.Text= $d+ $w[0]
			}else{
				$fm_menu_pmd0.Text= $w[0]
			}

			if($w.Length -ge 2){

			$fm_menu_pmd1.Visible= $True

			if($n[0] -eq $w[1]){
				$fm_menu_pmd1.Text= $d+ $w[1]
			}else{
				$fm_menu_pmd1.Text= $w[1]
			}

				if($w.Length -ge 3){

			$fm_menu_pmd2.Visible= $True

			if($n[0] -eq $w[2]){
				$fm_menu_pmd2.Text= $d+ $w[2]
			}else{
				$fm_menu_pmd2.Text= $w[2]
			}

					if($w.Length -ge 4){

			$fm_menu_pmd3.Visible= $True

			if($n[0] -eq $w[3]){
				$fm_menu_pmd3.Text= $d+ $w[3]
			}else{
				$fm_menu_pmd3.Text= $w[3]
			}
					}
				}
			}
		}
		break;

	}'player'{
		[array]$w= $play.Keys

		$fm_menu_ply0.Visible= $False
		$fm_menu_ply1.Visible= $False
		$fm_menu_ply2.Visible= $False
		$fm_menu_ply3.Visible= $False
		$fm_menu_ply4.Visible= $False
		$fm_menu_ply5.Visible= $False
		$fm_menu_ply6.Visible= $False
		$fm_menu_ply7.Visible= $False

		if($w.Length -ge 1){

			$fm_menu_ply0.Visible= $True

			if($n[0] -eq $w[0]){
				$fm_menu_ply0.Text= $d+ $w[0]
			}else{
				$fm_menu_ply0.Text= $w[0]
			}

			if($w.Length -ge 2){

			$fm_menu_ply1.Visible= $True

			if($n[0] -eq $w[1]){
				$fm_menu_ply1.Text= $d+ $w[1]
			}else{
				$fm_menu_ply1.Text= $w[1]
			}

				if($w.Length -ge 3){

			$fm_menu_ply2.Visible= $True

			if($n[0] -eq $w[2]){
				$fm_menu_ply2.Text= $d+ $w[2]
			}else{
				$fm_menu_ply2.Text= $w[2]
			}

					if($w.Length -ge 4){

			$fm_menu_ply3.Visible= $True

			if($n[0] -eq $w[3]){
				$fm_menu_ply3.Text= $d+ $w[3]
			}else{
				$fm_menu_ply3.Text= $w[3]
			}
						if($w.Length -ge 5){

			$fm_menu_ply4.Visible= $True

			if($n[0] -eq $w[4]){
				$fm_menu_ply4.Text= $d+ $w[4]
			}else{
				$fm_menu_ply4.Text= $w[4]
			}
							if($w.Length -ge 6){

			$fm_menu_ply5.Visible= $True

			if($n[0] -eq $w[5]){
				$fm_menu_ply5.Text= $d+ $w[5]
			}else{
				$fm_menu_ply5.Text= $w[5]
			}
								if($w.Length -ge 7){

			$fm_menu_ply6.Visible= $True

			if($n[0] -eq $w[6]){
				$fm_menu_ply6.Text= $d+ $w[6]
			}else{
				$fm_menu_ply6.Text= $w[6]
			}
									if($w.Length -ge 8){

			$fm_menu_ply7.Visible= $True

			if($n[0] -eq $w[7]){
				$fm_menu_ply7.Text= $d+ $w[7]
			}else{
				$fm_menu_ply7.Text= $w[7]
			}
									}
								}
							}
						}
					}
				}
			}
		}
		break;

	}'dos'{
		[array]$w= $dos.Keys

		$fm_menu_dos0.Visible= $False
		$fm_menu_dos1.Visible= $False
		$fm_menu_dos2.Visible= $False
		$fm_menu_dos3.Visible= $False

		if($w.Length -ge 1){

			$fm_menu_dos0.Visible= $True

			if($n[0] -eq $w[0]){
				$fm_menu_dos0.Text= $d+ $w[0]
			}else{
				$fm_menu_dos0.Text= $w[0]
			}

			if($w.Length -ge 2){

			$fm_menu_dos1.Visible= $True

			if($n[0] -eq $w[1]){
				$fm_menu_dos1.Text= $d+ $w[1]
			}else{
				$fm_menu_dos1.Text= $w[1]
			}

				if($w.Length -ge 3){

			$fm_menu_dos2.Visible= $True

			if($n[0] -eq $w[2]){
				$fm_menu_dos2.Text= $d+ $w[2]
			}else{
				$fm_menu_dos2.Text= $w[2]
			}

					if($w.Length -ge 4){

			$fm_menu_dos3.Visible= $True

			if($n[0] -eq $w[3]){
				$fm_menu_dos3.Text= $d+ $w[3]
			}else{
				$fm_menu_dos3.Text= $w[3]
			}
					}
				}
			}
		}
		break;

	}'editor'{
		[array]$w= $edit.Keys

		$fm_menu_edt0.Visible= $False
		$fm_menu_edt1.Visible= $False
		$fm_menu_edt2.Visible= $False
		$fm_menu_edt3.Visible= $False
		$fm_menu_edt4.Visible= $False
		$fm_menu_edt5.Visible= $False
		$fm_menu_edt6.Visible= $False
		$fm_menu_edt7.Visible= $False

		if($w.Length -ge 1){

			$fm_menu_edt0.Visible= $True

			if($n[0] -eq $w[0]){
				$fm_menu_edt0.Text= $d+ $w[0]
			}else{
				$fm_menu_edt0.Text= $w[0]
			}

			if($w.Length -ge 2){

			$fm_menu_edt1.Visible= $True

			if($n[0] -eq $w[1]){
				$fm_menu_edt1.Text= $d+ $w[1]
			}else{
				$fm_menu_edt1.Text= $w[1]
			}

				if($w.Length -ge 3){

			$fm_menu_edt2.Visible= $True

			if($n[0] -eq $w[2]){
				$fm_menu_edt2.Text= $d+ $w[2]
			}else{
				$fm_menu_edt2.Text= $w[2]
			}

					if($w.Length -ge 4){

			$fm_menu_edt3.Visible= $True

			if($n[0] -eq $w[3]){
				$fm_menu_edt3.Text= $d+ $w[3]
			}else{
				$fm_menu_edt3.Text= $w[3]
			}

						if($w.Length -ge 5){

			$fm_menu_edt4.Visible= $True

			if($n[0] -eq $w[4]){
				$fm_menu_edt4.Text= $d+ $w[4]
			}else{
				$fm_menu_edt4.Text= $w[4]
			}

							if($w.Length -ge 6){

			$fm_menu_edt5.Visible= $True

			if($n[0] -eq $w[5]){
				$fm_menu_edt5.Text= $d+ $w[5]
			}else{
				$fm_menu_edt5.Text= $w[5]
			}

								if($w.Length -ge 7){

			$fm_menu_edt6.Visible= $True

			if($n[0] -eq $w[6]){
				$fm_menu_edt6.Text= $d+ $w[6]
			}else{
				$fm_menu_edt6.Text= $w[6]
			}

									if($w.Length -ge 8){

			$fm_menu_edt7.Visible= $True

			if($n[0] -eq $w[7]){
				$fm_menu_edt7.Text= $d+ $w[7]
			}else{
				$fm_menu_edt7.Text= $w[7]
			}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	} #sw
 } #func
 
function Trayfm_hide([string]$t){ 

	switch($t){
	'true'{

		$tray_fm.Visible= $True
		$menu_fty.Text= "v Task tray"
		break;
	}'false'{

		$tray_fm.Visible= $False
		$menu_fty.Text= "Task tray"
	}
	} #sw

	return $t
 } #func
 
function Contxt_state([string]$t,[int[]]$ss){ 

	switch($t){
	'最小化'{
		$contxt_trayfm.Items.Clear()

		[void]$contxt_trayfm.Items.Add("元に戻す")
		[void]$contxt_trayfm.Items.Add("環境設定")
		[void]$contxt_trayfm.Items.Add("終了")

		$ss[0]= 1 # 小、元

		if($frm_fm.WindowState -eq 'Normal'){
			$ss[1]= 1; $frm_fm.WindowState= "Minimized"
		}
		if($sb_alg.WindowState -eq 'Normal'){
			$ss[2]= 1; $sb_alg.WindowState= "Minimized"
		}
		if($ff_frm.WindowState -eq 'Normal'){
			$ss[3]= 1; $ff_frm.WindowState= "Minimized"
		}
		if($sub_mask.WindowState -eq 'Normal'){
			$ss[4]= 1; $sub_mask.WindowState= "Minimized"
		}

		return $ss
		break;

	}'元に戻す'{
		$contxt_trayfm.Items.Clear()

		[void]$contxt_trayfm.Items.Add("最小化")
		[void]$contxt_trayfm.Items.Add("環境設定")
		[void]$contxt_trayfm.Items.Add("終了")

		if($ss[1] -eq 1){
				$frm_fm.WindowState= "Normal"
		}
		if($ss[2] -eq 1){
			$sb_alg.WindowState= "Normal"
		}
		if($ss[3] -eq 1){
			$ff_frm.WindowState= "Normal"
		}
		if($ss[4] -eq 1){
			$sub_mask.WindowState= "Normal"
		}

		$ss= 0, 0,0,0,0

		return $ss
		break;

	}'環境設定'{
		$fm_menu_set.PerformClick()
		break;
	}'終了'{
		$fm_menu_n.PerformClick()
	}
	} #sw
 } #func
 
# ------ 
 
function Autosav_sw([string]$sw){ 

	switch($sw){
	'True'{	$fm_menu_auto.Text= "v Autosave";	break;
	}'False'{	$fm_menu_auto.Text= "Autosave"
	}
	} #sw

	return $sw
 } #func
 
function ClickPlay_sw([string] $sw){ 

	switch($sw){
	'True'{	$ff_menu_tp.Text= "v Click To Play"; break;
	}'False'{	$ff_menu_tp.Text= "Click To Play"
	}
	} #sw

	return $sw
 } # func
 
function Wait_sw([int]$t){ 

	$sb_menu_a0.Text= "0ms"
	$sb_menu_a1.Text= "1ms"
	$sb_menu_a2.Text= "2ms"
	$sb_menu_a3.Text= "3ms"
	$sb_menu_a4.Text= "4ms"

	switch($t){
	0{	$sb_menu_a0.Text= "[v] 0ms";	break;
	}1{	$sb_menu_a1.Text= "[v] 1ms";	break;
	}2{	$sb_menu_a2.Text= "[v] 2ms";	break;
	}3{	$sb_menu_a3.Text= "[v] 3ms";	break;
	}4{	$sb_menu_a4.Text= "[v] 4ms"
	}
	} #sw

	return $t
 } #func
 
function Adj_sw([string]$t){ 

	$sb_menu_one.Text= $adjr[0]
	$sb_menu_two.Text= $adjr[1]
	$sb_menu_three.Text= $adjr[2]
	$sb_menu_four.Text= $adjr[3]
	$sb_menu_five.Text= $adjr[4]
	$sb_menu_six.Text= $adjr[5]
	$sb_menu_seven.Text= $adjr[6]

	[string]$s= ("[v] "+ $t)
	switch($t){
	$adjr[0]{	$sb_menu_one.Text= $s;		break;
	}$adjr[1]{	$sb_menu_two.Text= $s;		break;
	}$adjr[2]{	$sb_menu_three.Text= $s;		break;
	}$adjr[3]{	$sb_menu_four.Text= $s;		break;
	}$adjr[4]{	$sb_menu_five.Text= $s;		break;
	}$adjr[5]{	$sb_menu_six.Text= $s;		break;
	}$adjr[6]{	$sb_menu_seven.Text= $s
	}
	} #sw

	return $t
 } #func
 
function Osc_sw([string]$t){ 

	$fm_menu_oct1.Text= "o1"
	$fm_menu_oct2.Text= "o2"
	$fm_menu_oct3.Text= "o3"
	$fm_menu_oct4.Text= "o4"
	$fm_menu_oct5.Text= "o5"
	$fm_menu_oct6.Text= "o6"
	$fm_menu_oct7.Text= "o7"
	$fm_menu_oct8.Text= "o8"

	switch($t){
	'o1'{	$fm_menu_oct1.Text= "[v] o1";		break;
	}'o2'{	$fm_menu_oct2.Text= "[v] o2";	break;
	}'o3'{	$fm_menu_oct3.Text= "[v] o3";	break;
	}'o4'{	$fm_menu_oct4.Text= "[v] o4";	break;
	}'o5'{	$fm_menu_oct5.Text= "[v] o5";	break;
	}'o6'{	$fm_menu_oct6.Text= "[v] o6";	break;
	}'o7'{	$fm_menu_oct7.Text= "[v] o7";	break;
	}'o8'{	$fm_menu_oct8.Text= "[v] o8"
	}
	} #sw

	return $t
 } #func
 
function Mask_sw([string]$op, [string]$hh){ 


	[array]$arr= "","","","", "","","","", "","","","", "","","",""

	[int[]]$arr[15]= -1,-2,-4,-8 # add de toggle natte iru
	[int[]]$arr[14]=  1,-2,-4,-8
	[int[]]$arr[13]= -1, 2,-4,-8
	[int[]]$arr[12]=  1, 2,-4,-8

	[int[]]$arr[11]= -1,-2, 4,-8
	[int[]]$arr[10]=  1,-2, 4,-8
	[int[]]$arr[9]= -1, 2, 4,-8
	[int[]]$arr[8]=  1, 2, 4,-8

	[int[]]$arr[7]= -1,-2,-4, 8
	[int[]]$arr[6]=  1,-2,-4, 8
	[int[]]$arr[5]= -1, 2,-4, 8
	[int[]]$arr[4]=  1, 2,-4, 8

	[int[]]$arr[3]= -1,-2, 4, 8
	[int[]]$arr[2]=  1,-2, 4, 8
	[int[]]$arr[1]= -1, 2, 4, 8
	[int[]]$arr[0]=  1, 2, 4, 8


	[int]$j= $hh

	[string]$t= $j+ $arr[$hh][$op]

	return $t

 } #func
 
function MSop_checker([int]$i, [string]$ss){ # Mask,SSG 

	[int]$sw= 0
	switch($ss){
	'ssg'{
		switch($key["eg_type"]){
		'Thru'{
		}'0'{
		}default{	$sw= 1
		}
		} #sw
		break;

	}'mask'{
		$sw= 1
	}
	} #sw

	[int]$k= 0
	if($sw){ # $sw -eq 1

		[int]$j= $key[$ss]

		$k= [Math]::Floor($j/ $i)% 2 # 切り捨て 1,4,8,16 -> 1,2,3,4op
	}

	# $j / 1 % 2 -eq 1 = checked op1
	# $j / 2 % 2 -eq 1 = checked op2
	# $j / 4 % 2 -eq 1 = checked op3
	# $j / 8 % 2 -eq 1 = checked op4

	return $k # $k -eq 1
 } #func
  
# Panel 
	
function Enable_chk([string]$s){ 

	[int[]]$num= 0,0

	switch($comb_fm.SelectedItem){
	'opn 4op'{	$num[0]= 1; break;
	}'opm 4op'{	$num[0]= 1
	}
	} #sw

	switch($s){
	'fmp7'{	$num[1]= 1; break;
	}'mucom'{	$num[1]= 1; break;
	}'mxdrv'{	$num[1]= 1
	}
	} #sw

	if(($num[0]* $num[1]) -eq 0){

		return $True
	}else{
		return $False
	}
 } #func
 
function Type_sw([string]$t){ 

	$fm_menu_type_mckreg.Text= "MCK Reg"
	$fm_menu_type_nsdreg.Text= "NSD Reg"
	$fm_menu_type_nsd.Text= "NSD"

	switch($t){
	'mckreg'{	$fm_menu_type_mckreg.Text= "[v] MCK Reg";	break;
	}'nsdreg'{	$fm_menu_type_nsdreg.Text= "[v] NSD Reg";	break;
	}'nsd'{	$fm_menu_type_nsd.Text= "[v] NSD Op"
	}
	} #sw

	return $t
 } #func
 
function Style_sw([string]$t){ 

	$fm_menu_copy.Enabled= Enable_chk $t

	#初期化
	$opn_nmud_ams.BackColor= "white"
	$opm_nmud_ams.BackColor= "white"
	$opn_nmud_ams.ForeColor= "black"
	$opm_nmud_ams.ForeColor= "black"

	$fm_menu_style_pmd.Text= "PMD"
	$fm_menu_style_fmp7.Text= "FMP7"
	$fm_menu_style_mucom.Text= "MUCOM"
	$fm_menu_style_mxdrv.Text= "MXDRV"

	switch($t){
	'pmd'{
		$fm_menu_style_pmd.Text= "[v] PMD"
		break;
	}'fmp7'{
		$fm_menu_style_fmp7.Text= "[v] FMP7"
		break;
	}'mucom'{
		$opn_nmud_ams.BackColor= "beige"
		$opm_nmud_ams.BackColor= "beige"
		$opn_nmud_ams.ForeColor= "silver"
		$opm_nmud_ams.ForeColor= "silver"

		$fm_menu_style_mucom.Text= "[v] MUCOM"
		break;
	}'mxdrv'{
		$fm_menu_style_mxdrv.Text= "[v] MXDRV"
	}
	} #sw

	return $t
 } #func
 
function Zero_sw([string]$t){ 

	switch($t){
	'True'{
		$fm_menu_zero.Text= "v zero padding"
		break;
	}'False'{
		$fm_menu_zero.Text= "zero padding"
	}
	} #sw

	return $t
 } #func
 
function Ten_sw([string]$t){ 

	switch($t){
	'True'{
		$fm_menu_ten.Text= "v comma"
		break;
	}'False'{
		$fm_menu_ten.Text= "comma"
	}
	} #sw

	return $t
 } #func
 
function Idx(){ 

	[int]$i= 0
	switch($comb_fm.SelectedItem){

	'vrc7 2op'{ $i= $comb_vrc.SelectedIndex; break; # mod select
	}'opl 2op'{ $i= $comb_opl.SelectedIndex; break;
	}'opn 4op'{ $i= $comb_opn.SelectedIndex; break;
	}'opm 4op'{ $i= $comb_opm.SelectedIndex
	}
	} #sw

	return $i
 } #func
 
function Itm(){ 

	[string]$s= 0
	switch($comb_fm.SelectedItem){

	'vrc7 2op'{ $s= "2op"; break;
	}'opl 2op'{ $s= "2op"; break;
	}'opn 4op'{ $s= "4op"; break;
	}'opm 4op'{ $s= "4op"
	}
	} #sw

	return $s
 } #func
 
function Value_gui(){ 

	$script:event_change= $False

	$fm_panel.SuspendLayout()

	[int]$i= Idx # OP1-4index

	switch($comb_fm.SelectedItem){
	'vrc7 2op'{
		[array]$arr= $vrc_svn

		$vrc_nmud_tl.Value= $arr[$i][0]
		$vrc_nmud_fb.Value= $arr[0][1]
		$vrc_nmud_ar.Value= $arr[$i][2]
		$vrc_nmud_dr.Value= $arr[$i][3]
		$vrc_nmud_sr.Value= $arr[$i][4]
		$vrc_nmud_rr.Value= $arr[$i][5]
		$vrc_nmud_ksl.Value= $arr[$i][6]
		$vrc_nmud_ml.Value= $arr[$i][7]
		$vrc_nmud_am.Value= $arr[$i][8]
		$vrc_nmud_vib.Value= $arr[$i][9]
		$vrc_nmud_eg.Value= $arr[$i][10]
		$vrc_nmud_ksr.Value= $arr[$i][11]
		$vrc_nmud_dt.Value= $arr[$i][12]
		break;
	}'opl 2op'{
		[array]$arr= $opl_two

		$opl_nmud_alg.Value= $arr[0][0]
		$opl_nmud_fb.Value= $arr[0][1]
		$opl_nmud_ar.Value= $arr[$i][2]
		$opl_nmud_dr.Value= $arr[$i][3]
		$opl_nmud_rr.Value= $arr[$i][4]
		$opl_nmud_sr.Value= $arr[$i][5]
		$opl_nmud_tl.Value= $arr[$i][6]
		$opl_nmud_ksl.Value= $arr[$i][7]
		$opl_nmud_ml.Value= $arr[$i][8]
		$opl_nmud_ksr.Value= $arr[$i][9]
		$opl_nmud_eg.Value= $arr[$i][10]
		$opl_nmud_vib.Value= $arr[$i][11]
		$opl_nmud_am.Value= $arr[$i][12]
		break;
	}'opn 4op'{
		[array]$arr= $opn_fur

		$opn_nmud_alg.Value= $arr[0][0]
		$opn_nmud_fb.Value= $arr[0][1]
		$opn_nmud_ar.Value= $arr[$i][2]
		$opn_nmud_dr.Value= $arr[$i][3]
		$opn_nmud_sr.Value= $arr[$i][4]
		$opn_nmud_rr.Value= $arr[$i][5]
		$opn_nmud_sl.Value= $arr[$i][6]
		$opn_nmud_tl.Value= $arr[$i][7]
		$opn_nmud_ks.Value= $arr[$i][8]
		$opn_nmud_ml.Value= $arr[$i][9]
		$opn_nmud_dt1.Value= $arr[$i][10]
		$opn_nmud_ams.Value= $arr[$i][11]
		break;
	}'opm 4op'{
		[array]$arr= $opm_fur

		$opm_nmud_alg.Value= $arr[0][0]
		$opm_nmud_fb.Value= $arr[0][1]
		$opm_nmud_ar.Value= $arr[$i][2]
		$opm_nmud_dr.Value= $arr[$i][3]
		$opm_nmud_sr.Value= $arr[$i][4]
		$opm_nmud_rr.Value= $arr[$i][5]
		$opm_nmud_sl.Value= $arr[$i][6]
		$opm_nmud_tl.Value= $arr[$i][7]
		$opm_nmud_ks.Value= $arr[$i][8]
		$opm_nmud_ml.Value= $arr[$i][9]
		$opm_nmud_dt1.Value= $arr[$i][10]
		$opm_nmud_dt2.Value= $arr[$i][11]
		$opm_nmud_ams.Value= $arr[$i][12]
	}
	} # sw

	$fm_panel.ResumeLayout()

	$script:event_change= $True
 } # func
 
function Fm_osc(){ 

	$fm_panel.SuspendLayout()

	$comb_vrc.Hide()
	$comb_opl.Hide()
	$comb_opn.Hide()
	$comb_opm.Hide()

	$eg_grp.Controls.Clear() #
	$lev_grp.Controls.Clear() #
	$ring_grp.Controls.Clear()
	$op_grp.Controls.Clear()
	$alg_grp.Controls.Clear()


	switch($comb_fm.SelectedItem){
	'vrc7 2op'{
		$ring_grp.Controls.AddRange(@($PictboxDT, $lbl_dt))

		switch(Idx){
		'0'{
			$op_grp.Controls.AddRange(@($PictboxTL, $lbl_tl))
			break;
		}'1'{
		}
		} #sw
		$comb_vrc.Show()
		break;
	}'opl 2op'{
		$op_grp.Controls.AddRange(@($PictboxTL, $lbl_tl))
		$alg_grp.Controls.AddRange(@($PictboxALG, $lbl_alg))
		$comb_opl.Show()
		break;
	}'opn 4op'{
		$comb_opn.Show()
		break;
	}'opm 4op'{
		$ring_grp.Controls.AddRange(@($PictboxDT2, $lbl_dt2))
		$comb_opm.Show()
	}
	} #sw

	switch(Itm){
	'2op'{
		$eg_grp.Size= "255, 130"
		$lev_grp.Controls.AddRange(@($PictboxKSL, $lbl_ksl)) #
		$lev_grp.Controls.AddRange(@($PictboxKSR, $lbl_ksr)) #

		$ring_grp.Controls.AddRange(@($PictboxEG, $lbl_eg))
		$ring_grp.Controls.AddRange(@($PictboxVIB, $lbl_vib))
		$ring_grp.Controls.AddRange(@($PictboxAM, $lbl_am))

		$op_grp.Controls.AddRange(@($PictboxML, $lbl_ml))
		$alg_grp.Controls.AddRange(@($PictboxFB, $lbl_fb))
		$lev_grp.Show()
		break;
	}'4op'{
		$eg_grp.Size= "255, 240"
		$eg_grp.Controls.AddRange(@($PictboxSL, $lbl_sl))

		$ring_grp.Controls.AddRange(@($PictboxKS, $lbl_ks))
		$ring_grp.Controls.AddRange(@($PictboxDT1, $lbl_dt1))
		$ring_grp.Controls.AddRange(@($PictboxAMS, $lbl_ams))

		$op_grp.Controls.AddRange(@($PictboxML, $lbl_ml))
		$op_grp.Controls.AddRange(@($PictboxTL, $lbl_tl))

		$alg_grp.Controls.AddRange(@($PictboxALG, $lbl_alg))
		$alg_grp.Controls.AddRange(@($PictboxFB, $lbl_fb))
		$lev_grp.Hide()
	}
	} #sw


	$eg_grp.Controls.AddRange(@($PictboxAR, $lbl_ar)) #
	$eg_grp.Controls.AddRange(@($PictboxDR, $lbl_dr)) #
	$eg_grp.Controls.AddRange(@($PictboxSR, $lbl_sr)) #
	$eg_grp.Controls.AddRange(@($PictboxRR, $lbl_rr)) #


	$fm_panel.ResumeLayout()
 } #func
 
function Zeropad([string]$tt){ # zero padding 

	[string]$ss= "0"* (3- $tt.Length)+ $tt

	return $ss

 } #func
 
function Sz([string]$tt){ # space padding 

	[string]$ss= " "* (3- $tt.Length)+ $tt # (3- $tt.Length) mojisuu bun gensan

	return $ss

 } #func
 
function All_sz([array]$r,[int]$j){ 

	switch($r.Length){
	2{
		[array]$s=("","")
		[string[]]$s[0]= @()
		[string[]]$s[1]= @()

		for([int]$i=0; $i -lt $j; $i++ ){

			$s[0]+= Sz $r[0][$i] # [int] dato __0 to naranai
			$s[1]+= Sz $r[1][$i]
		} #
		break;
	}4{
		[array]$s=("","","","")
		[string[]]$s[0]= @()
		[string[]]$s[1]= @()
		[string[]]$s[2]= @()
		[string[]]$s[3]= @()

		for([int]$i=0; $i -lt $j; $i++ ){

			$s[0]+= Sz $r[0][$i]
			$s[1]+= Sz $r[1][$i]
			$s[2]+= Sz $r[2][$i]
			$s[3]+= Sz $r[3][$i]
		} #
	}
	} #sw

	return $s
 } #func
 
# ------ 
 
function Change_value([string]$sw, [string]$name){ 

  # if($name -match '[v]' -eq $False){ # .Contains() moka

	switch($sw){
	'mck'{		$script:val[$sw]= $mck[$name];	break;
	}'nsd'{		$script:val[$sw]= $nsd[$name];	break;
	}'pmd'{		$script:val[$sw]= $pmd[$name];	break;
	}'compiler'{	$script:val[$sw]= $val[$name];	break;

	}'player'{		$script:val[$sw]= $play[$name];	break;
	}'dos'{		$script:val[$sw]= $dos[$name];	break;
	}'editor'{		$script:val[$sw]= $edit[$name]
	}
	} #sw
  # }
 } #func
 
function Stus_build(){ 

	[string[]]$t= Split_path $val["compiler"]
	[string[]]$s= Split_path $val["player"]

	[string]$q= "  comp: "+ $t[0]+ " | play: "+ $s[0]+ " | oct: "+ $key["oct"]
	[string]$b= " | "+ $comb_fm.SelectedItem+ ": "

	switch($comb_fm.SelectedItem){
	'vrc7 2op'{	$b+= $key["type"];		break;
	}'opl 2op'{	$b+= "pmd";		break;
	}'opn 4op'{
			$q+= " | mask: "+ $key["mask"]
			$b+= $key["style"]
			break;
	}'opm 4op'{
			$q+= " | mask: "+ $key["mask"]
			$b+= $key["style"]
	}
	} #sw

	$fm_label.Text= $q+ $b
 } #func
 
function Panel_chg([string]$sw){ 

	switch($sw){
	'vrc7 2op'{
		switch($key["type"]){
		'mckreg'{	$script:val["compiler"]= $val["mck"]; break;
		}default{	$script:val["compiler"]= $val["nsd"]
		}
		} #sw
		break;

	}default{	$script:val["compiler"]= $val["pmd"]
	}
	} #sw

	Fm_osc	# カラーチェンジの瞬間見せないためひとつ前
	Box_mml_read
	Box_read	# mtx
	Value_gui	# bar

 } #func
  
# Lis 
	
function Adv_edit([string]$t){ 

	switch($t){
	'mck'{
		[string]$ss= Editor_open $val["editor"] ".\header\fm_header_mck"; break;
	}'nsd'{
		[string]$ss= Editor_open $val["editor"] ".\header\fm_header_nsd"; break;
	}'pmd'{
		[string]$ss= Editor_open $val["editor"] ".\header\fm_header_pmd"; break;
	}'mck_mml'{
		[string]$ss= Editor_open $val["editor"] ".\header\fm_mml_mck"; break;
	}'nsd_mml'{
		[string]$ss= Editor_open $val["editor"] ".\header\fm_mml_nsd"; break;
	}'pmd_mml'{
		[string]$ss= Editor_open $val["editor"] ".\header\fm_mml_pmd"
	}
	} #sw

	if($ss -ne ''){

		[string]$retn= [Windows.Forms.MessageBox]::Show(
		$ss, "確認", "OK","Information","Button1"
		)
 	}
 } #func
 
function Read_mck([int]$j,$xx,[array]$yy){ 

	[array]$label=@("","")

	for([int] $i= 0; $i -lt $j; $i++){

		[string]$mtx= $yy[$i] # yy[$i]+ "`r`n" fuka

		$label[0]= [System.Text.RegularExpressions.Regex]::Matches($mtx,"(?<=^@OP)[0-9]+(?=\s*=)")
		$label[1]= [System.Text.RegularExpressions.Regex]::Matches($mtx,"(?<=;).*(?=$)")
		# 最長一致

		[string]$ss= "@"+ $label[0] + " "+ $label[1]

		$xx[$ss]= $mtx+ "`r`n" # hash確保
	} #
 } #func
 
function Read_vrc7([int]$j,$xx,[array]$yy){ 

	[string[]]$label=@("","")

	for([int] $i= 0; $i -lt $j; $i++){

		[int]$num= 8* $i # @num[0-126]

		[array]$rr= $yy[$num],$yy[$num+1],$yy[$num+2],$yy[$num+3],$yy[$num+4],$yy[$num+5],$yy[$num+6]

		[string]$mtx= ($rr -join "`r`n")

		[string]$tt= $rr[0]

		$label[0]= [System.Text.RegularExpressions.Regex]::Matches($tt,"(?<=^VRC7\()[0-9]+(?=\))")
		$label[1]= [System.Text.RegularExpressions.Regex]::Matches($tt,"(?<=;).*(?=$)")
		# 最長一致

		[string]$ss= "@"+ $label[0] + " "+ $label[1]

		$xx[$ss]= $mtx+ "`r`n"
	} #
 } #func
 
function Read_ff([int]$j,$xx,[array]$yy){ 

	[string[]]$label=@("","")

	for([int] $i= 0; $i -lt $j; $i++){

		[int]$num= 8* $i # @num[0-126]

		[array]$rr= $yy[$num],$yy[$num+1],$yy[$num+2],$yy[$num+3],$yy[$num+4],$yy[$num+5],$yy[$num+6]

		[string]$mtx= ($rr -join "`r`n")

		[string]$tt= $rr[1]

		$label[0]= [System.Text.RegularExpressions.Regex]::Matches($tt,"(?<=^)@[0-9]+(?=\s)")
		$label[1]= [System.Text.RegularExpressions.Regex]::Matches($tt,"(?<==\t).*(?=$)")
		# 最長一致

		[string]$ss= $label[0] + " "+ $label[1]

		$xx[$ss]= $mtx+ "`r`n"
	} #
 } #func
 
function Preset_read(){ 

	[string[]]$ss= Split_path $pmd["MC.EXE"]

	[string[]]$pp= @("","","","","")


	$pp[0]= '.\preset\mck.preset'
	if((Chk_path $pp[0]) -ne 0){ $pp[0]= "" }

	$pp[1]= '.\preset\vrc7.preset'
	if((Chk_path $pp[1]) -ne 0){ $pp[1]= "" }


	# 2箇所チェック
	$pp[2]= '.\preset\PC88.MML'
	if((Chk_path $pp[2]) -ne 0){ $pp[2]= "" }

	if($pp[2] -eq ""){

		$pp[2]= $ss[1]+ '\PC88.MML'
		if((Chk_path $pp[2]) -ne 0){ $pp[2]= "" }
	}

	$pp[3]= '.\preset\X68ED.MML'
	if((Chk_path $pp[3]) -ne 0){ $pp[3]= "" }

	if($pp[3] -eq ""){

		$pp[3]= $ss[1]+ '\X68ED.MML'
		if((Chk_path $pp[3]) -ne 0){ $pp[3]= "" }
	}

	$pp[4]= '.\preset\EFFEC.MML'
	if((Chk_path $pp[4]) -ne 0){ $pp[4]= "" }

	if($pp[4] -eq ""){

		$pp[4]= $ss[1]+ '\EFFEC.MML'
		if((Chk_path $pp[4]) -ne 0){ $pp[4]= "" }
	}


	[string]$ret= ""
	[string]$output= ""


	if($pp[0] -ne ""){

		[string]$read= (cat $pp[0] | Out-String) # 改行付き

		[array]$ary= $read -split "`r`n"


		Read_mck 36 $script:hsmck $ary
		#write-host ("chk_mck: "+ $hsmck["@36 音の小さい"]) # Sawウェーブ


		[array]$key= $hsmck.Keys

		$key= $key | sort

		[void]$list_mck.Items.AddRange(@($key))
	}else{

		$ret= '"mck.preset"ファイルがない'
		Write-Host $ret

		$output+= $ret+ "`r`n"
	}


	if($pp[1] -ne ""){

		[string]$read= (cat $pp[1] | Out-String)

		[array]$ary= $read -split "`r`n"


		Read_vrc7 6 $script:hsvrc $ary
		#write-host ("chk_vrc: "+ $hsvrc["@005 2op Space Noise"])


		[array]$key= $hsvrc.Keys

		$key= $key | sort

		[void]$list_vrc.Items.AddRange(@($key))
	}else{

		$ret= '"vrc7.preset"ファイルがない'
		Write-Host $ret

		$output+= $ret+ "`r`n"
	}


	if($pp[2] -ne ""){

		[string]$read= (cat $pp[2] | Out-String)

		[array]$ary= $read -split "`r`n"


		Read_ff 127 $script:hs88 $ary
		#write-host $hs88["@126MusicBX"]


		[array]$key= $hs88.Keys

		$key= $key | sort

		[void]$list_88.Items.AddRange(@($key))
	}else{

		$ret= '"PC88.MML"ファイルがない'
		Write-Host $ret

		$output+= $ret+ "`r`n"
	}


	if($pp[3] -ne ""){

		[string]$read= (cat $pp[3] | Out-String)

		[array]$ary= $read -split "`r`n"


		Read_ff 68 $script:hsx68 $ary
		#write-host $hsx68["@067 Effect2"]


		[array]$key= $hsx68.Keys

		$key= $key | sort

		[void]$list_x68.Items.AddRange(@($key))
	}else{

		$ret= '"X68ED.MML"ファイルがない'
		Write-Host $ret

		$output+= $ret+ "`r`n"
	}


	if($pp[4] -ne ""){

		[string]$read= (cat $pp[4] | Out-String)

		[array]$ary= $read -split "`r`n"


		Read_ff 256 $script:hsefx $ary
		#write-host $hsefx["@255 Effect"]


		[array]$key= $hsefx.Keys

		$key= $key | sort

		[void]$list_efx.Items.AddRange(@($key))
	}else{

		$ret= '"EFFEC.MML"ファイルがない'
		Write-Host $ret

		$output+= $ret+ "`r`n"
	}

	return $output
 } #func
 
# ------ 
 
function Mck_listen([string]$ss){ 


	[string]$gg= [System.Text.RegularExpressions.Regex]::Replace($ss,"@OP[0-9]+","@OP0")
	#write-host $gg

	[string]$tt= $key["oct"]

	[string] $hh= $header["fm_header_mck"]
	[string] $mm= $box_mml["mck"]


	$hh= $hh.Replace("%oct_param%",$tt)
	$hh= $hh.Replace("%mml_param%", $mm)
	$hh= $hh.Replace("%fm_param%",$gg)

	Param_exp 1 $ss

	if($key["clickplay"] -eq 'True'){
		Lisnfm_nsf 0 $hh
	}
	if($sb_alg.Visible){
		if($key["clickplay"] -eq 'True'){
			Monotone_select "lisn_btn"
		}
		All_chg
	}
 } #func
 
function Vrc7_listen([string]$ss){ 


	[string]$gg= [System.Text.RegularExpressions.Regex]::Replace($ss,"VRC7\([0-9]+\)","VRC7(100)")
	#write-host $gg

	[string]$tt= $key["oct"]

	[string] $hh= $header["fm_header_nsd"]
	[string] $mm= $box_mml["nsd"]


	$hh= $hh.Replace("%oct_param%", $tt)
	$hh= $hh.Replace("%mml_param%", $mm)
	$hh= $hh.Replace("%fm_param%", $gg)

	Param_exp 1 $ss

	if($key["clickplay"] -eq 'True'){
		Lisnfm_nsf 0 $hh
	}
	if($sb_alg.Visible){
		if($key["clickplay"] -eq 'True'){
			Monotone_select "lisn_btn"
		}
		All_chg
	}
 } #func
 
function FF_listen([string]$ss){ 


	[string]$gg= [System.Text.RegularExpressions.Regex]::Replace($ss,"@[0-9]+","@001")
	#write-host $gg

	[string]$tt= $key["oct"]

	if(Mskseg_chk){ $tt+= (Mskseg_out 0) }


	[string] $hh= $header["fm_header_pmd"]
	[string] $mm= $box_mml["pmd"]

	$hh= $hh.Replace("%oct_param%", $tt)
	$hh= $hh.Replace("%mml_param%", $mm)
	$hh= $hh.Replace("%fm_param%", $gg)

	Param_exp 2 $ss # pmdで読み込む

	if($key["clickplay"] -eq 'True'){
		Lisnfm_nsf 0 $hh
	}
	if($sb_alg.Visible){
		if($key["clickplay"] -eq 'True'){
			Monotone_select "lisn_btn"
		}
		All_chg
	}
 } #func
 
# ------ 
 
function Prefixfm_mml([string]$gg){ # fm-matrix -> mml 


	[string]$tt= $key["oct"]

	[string]$hh= ""
	[string]$mm= ""

	switch($comb_fm.SelectedItem){

	'vrc7 2op'{
		switch($key["type"]){
		'mckreg'{
			$hh= $header["fm_header_mck"]
			$mm= $box_mml["mck"]
			break;
		}default{
			$hh= $header["fm_header_nsd"]
			$mm= $box_mml["nsd"]
		}
		} #sw

		break;
	}default{
		$hh= $header["fm_header_pmd"]
		$mm= $box_mml["pmd"]

		if(Mskseg_chk){ $tt+= (Mskseg_out 0) }
	}
	} #sw


	$hh= $hh.Replace("%oct_param%", $tt)
	$hh= $hh.Replace("%mml_param%", $mm)
	$hh= $hh.Replace("%fm_param%", $gg)

	return $hh
 } #func
 
function Lisnfm_nsf([int]$sw, [string]$t){ 

 switch($sw){	# ストップ
  0{
	Write-Host $val["compiler"]
	Write-Host $val["player"]
	Write-Host ""
	Write-Host $t
	Write-Host ""


	Mml_writer $t ".\temp\temp.mml" 0
	# $t | Out-File -Encoding oem -FilePath ".\temp\temp.mml" # shiftJIS ms-dos

	$file= [System.IO.Path]::GetFullPath(".\temp\temp.mml") # full path


	[string[]]$arr= Split_path $file
	[string]$dpn= Join-Path $arr[1] $arr[2]

	switch($comb_fm.SelectedItem){

	'vrc7 2op'{
		switch($key["type"]){
		'mckreg'{	[string[]]$ss= $file,$val["compiler"],$arr[1],"-i"
				$output= Mkmck $ss; break;
		}default{	[string[]]$ss= $file,$val["compiler"],$arr[1],"-n"
				$output= Mknsd $ss; break;
		}
		} #sw

		[string]$ext= ".nsf"
		break;

	}'opl 2op'{	[string[]]$ss= $file,$val["compiler"],$arr[1],"/L /V",$val["dos"],$opt["chk_dos"]
			$output= Mkpmd $ss
			[string]$ext= ".m"
			break;
	}'opn 4op'{	[string[]]$ss= $file,$val["compiler"],$arr[1],"/N /V",$val["dos"],$opt["chk_dos"]
			$output= Mkpmd $ss
			[string]$ext= ".m"
			break;
	}'opm 4op'{	[string[]]$ss= $file,$val["compiler"],$arr[1],"/M /V",$val["dos"],$opt["chk_dos"]
			$output= Mkpmd $ss
			[string]$ext= ".m"
	}
	} #sw

	sleep -m 33	# 異常時用ウェイト


	if($output[0] -ne ""){
		[string]$retn= [Windows.Forms.MessageBox]::Show(
		("compiler setting error : "+ $output[0]), "確認", "OK","Information","Button1"
		)
	}else{

		if($LASTEXITCODE -ne 0){

			Write-Host ("`r`n"+ 'exitcode: '+ $LASTEXITCODE)
			Write-Host ("`r`n"+ 'ERROR: '+ $arr[0]+ ' >> '+ $arr[2]+ $ext)

			[string]$retn= [Windows.Forms.MessageBox]::Show(

		("コンパイルに失敗 : "+ $arr[0]+ " >> "+ $arr[2]+ $ext), "確認", "OK","Information","Button1"
			)

		}else{
			# '"' 空白パス対応

			[string]$tt= Player_open 2 $val["player"] ($dpn+ $ext)

			if($tt -ne ""){

				[string]$retn= [Windows.Forms.MessageBox]::Show(
				("player setting error : "+ $tt), "確認", "OK","Information","Button1"
				)
			}
		}
	}
  }
  } #sw

} #func
 
function Box_listen([int]$j){ 

  switch($comb_fm.SelectedItem){
  'vrc7 2op'{

	  switch($key["type"]){
	  'mckreg'{	[string]$s= Reg_write;	break;
	  }'nsdreg'{	[string]$s= Reg_write;	break;
	  }default{	[string]$s= Fmx_light	# pmd comma less
	  }
	  } #sw

	  break;

  }default{		[string]$s= Fmx_light
  }
  } #sw

  [string]$lis= Prefixfm_mml $s

  if($j -eq 0){

	Lisnfm_nsf 0 $lis # 前段にした

	if($sb_alg.Visible){

		Monotone_select "lisn_btn"
	}

  }else{
	[Windows.Forms.Clipboard]::SetText($lis,[Windows.Forms.TextDataFormat]::UnicodeText)
  }
 } #func
 
function Key_down([string]$t){ 

  switch($t){
  'F12'{
		$lisn_btn.PerformClick()
		break
  }'F5'{		$conv_btn.PerformClick()
  }
  } #sw
 } #func
 
function Key_play([string]$t){ 

  switch($t){
  'F12'{
		$lisn_btn.PerformClick()
		break;
  }'Space'{
		$lisn_btn.PerformClick()
		break;
  }'Return'{
		$lisn_btn.PerformClick()
  }
  } #sw
 } #func
  
# Export 
	
function Unredo([int]$n){ 

	switch($n){ # 初期化
	2{
		$script:undo[0]= $null # 空値も入るため
		$script:undo[1]= $null
		break;

	}1{	# undo呼出し

		if($script:undo[2] -eq 'store'){
			$script:undo[2]= "undo"
		}

		switch($script:undo[2]){
		'undo'{
			$script:undo[1]= $fm_box.Text	# pre buffer write
			$fm_box.Text= $script:undo[0]	# undo read
			$script:undo[2]= "redo"
			break;
		}'redo'{
			$script:undo[0]= $fm_box.Text	# pre buffer write
			$fm_box.Text= $script:undo[1]	# redo read
			$script:undo[2]= "undo"
		}
		} #sw

		Param_exp 1 $fm_box.Text

		if($sb_alg.Visible){
			All_chg
		}
		break;

	}0{	# undo開始

		# .Add_Enterでdo (menuから各objでは再enterとはならない)

		$script:undo[2]= "store"
		$script:undo[0]= $fm_box.Text
	}
	} #sw


	if($undo[0] -ne $null){

		$fm_menu_ud.Enabled= $True
	}else{
		$fm_menu_ud.Enabled= $False
	}
 } #func
 
function Send_build([int]$sw){ 

	[array]$ary= @("OPL","VRC7","OPM","OPN") # OPL -> VRC7

	[string]$tt= $ary[$comb_fm.SelectedIndex]

	switch($sw){
	1{
		$fm_menu_send.Text= ("send "+ $tt)
		break;
	}0{
		[string]$retn= [Windows.Forms.MessageBox]::Show(
		($tt+ "へ値を送ります"), "確認", "OKCancel","Information","Button2"
		)

		switch($retn){
		'OK'{
			[array]$sr= @("","","","")
			$sr[0]= @()
			$sr[1]= @()
			$sr[2]= @()
			$sr[3]= @()

			switch($tt){
			'OPL'{
				$sr[0]+= Sz "0" # ALG
				$sr[0]+= $vrc_svn[0][1..3]
				$sr[0]+= $vrc_svn[0][5]
				$sr[0]+= $vrc_svn[0][4]
				$sr[0]+= $vrc_svn[0][0]
				$sr[0]+= $vrc_svn[0][6..7]
				$sr[0]+= $vrc_svn[0][11]
				$sr[0]+= $vrc_svn[0][10]
				$sr[0]+= $vrc_svn[0][9]
				$sr[0]+= $vrc_svn[0][8]

				$sr[1]+= Sz "0"
				$sr[1]+= Sz "0" # FB
				$sr[1]+= $vrc_svn[1][2..3]
				$sr[1]+= $vrc_svn[1][5]
				$sr[1]+= $vrc_svn[1][4]
				$sr[1]+= $vrc_svn[1][0]
				$sr[1]+= $vrc_svn[1][6..7]
				$sr[1]+= $vrc_svn[1][11]
				$sr[1]+= $vrc_svn[1][10]
				$sr[1]+= $vrc_svn[1][9]
				$sr[1]+= $vrc_svn[1][8]

				$script:opl_two[0]= $sr[0]
				$script:opl_two[1]= $sr[1]
				break;
			}'VRC7'{
				$sr[0]+= $opl_two[0][6]
				$sr[0]+= $opl_two[0][1..3]
				$sr[0]+= $opl_two[0][5]
				$sr[0]+= $opl_two[0][4]
				$sr[0]+= $opl_two[0][7]
				$sr[0]+= $opl_two[0][8]
				$sr[0]+= $opl_two[0][12]
				$sr[0]+= $opl_two[0][11]
				$sr[0]+= $opl_two[0][10]
				$sr[0]+= $opl_two[0][9]
				$sr[0]+= Sz "0" # DT

				$sr[1]+= Sz "0" # TL
				$sr[1]+= Sz "0" # FB
				$sr[1]+= $opl_two[1][2..3]
				$sr[1]+= $opl_two[1][5]
				$sr[1]+= $opl_two[1][4]
				$sr[1]+= $opl_two[1][7]
				$sr[1]+= $opl_two[1][8]
				$sr[1]+= $opl_two[1][12]
				$sr[1]+= $opl_two[1][11]
				$sr[1]+= $opl_two[1][10]
				$sr[1]+= $opl_two[1][9]
				$sr[1]+= Sz "0"

				$script:vrc_svn[0]= $sr[0]
				$script:vrc_svn[1]= $sr[1]
				break;
			}'OPM'{
				$sr[0]+= $opn_fur[0][0..10]
				$sr[0]+= Sz "0"
				$sr[0]+= $opn_fur[0][11]

				$sr[1]+= $opn_fur[1][0..10]
				$sr[1]+= Sz "0"
				$sr[1]+= $opn_fur[1][11]

				$sr[2]+= $opn_fur[2][0..10]
				$sr[2]+= Sz "0"
				$sr[2]+= $opn_fur[2][11]

				$sr[3]+= $opn_fur[3][0..10]
				$sr[3]+= Sz "0"
				$sr[3]+= $opn_fur[3][11]

				$script:opm_fur[0]= $sr[0]
				$script:opm_fur[1]= $sr[1]
				$script:opm_fur[2]= $sr[2]
				$script:opm_fur[3]= $sr[3]
				break;
			}'OPN'{
				$sr[0]+= $opm_fur[0][0..10]
				$sr[0]+= $opm_fur[0][12]

				$sr[1]+= $opm_fur[1][0..10]
				$sr[1]+= $opm_fur[1][12]

				$sr[2]+= $opm_fur[2][0..10]
				$sr[2]+= $opm_fur[2][12]

				$sr[3]+= $opm_fur[3][0..10]
				$sr[3]+= $opm_fur[3][12]

				$script:opn_fur[0]= $sr[0]
				$script:opn_fur[1]= $sr[1]
				$script:opn_fur[2]= $sr[2]
				$script:opn_fur[3]= $sr[3]
			}
			} #sw

			Write-Host ('<< 値を' +$tt + 'へ送りました')
		##}'Cancel'{
		}
		} #sw
	}
	} #sw
 } #func
 
# ------ 
 
function Vrc_flow([array]$s){ 

	for([int]$i= 0;$i -lt 13; $i++){

		if($s[0][$i] -lt 0){	$s[0][$i]= 0 } # <0 chk
		if($s[1][$i] -lt 0){	$s[1][$i]= 0 }
	} #

	if($s[0][0] -gt 63){	$s[0][0]= 63 }	#tl >63 chk
	if($s[0][1] -gt 7){	$s[0][1]= 7 }	#fb

	if($s[0][2] -gt 15){	$s[0][2]= 15 }	#ar
	if($s[1][2] -gt 15){	$s[1][2]= 15 }
	if($s[0][3] -gt 15){	$s[0][3]= 15 }	# dr
	if($s[1][3] -gt 15){	$s[1][3]= 15 }
	if($s[0][4] -gt 15){	$s[0][4]= 15 }	# sl
	if($s[1][4] -gt 15){	$s[1][4]= 15 }
	if($s[0][5] -gt 15){	$s[0][5]= 15 }	# rr
	if($s[1][5] -gt 15){	$s[1][5]= 15 }

	if($s[0][6] -gt 3){	$s[0][6]= 3 }	# ksl
	if($s[1][6] -gt 3){	$s[1][6]= 3 }
	if($s[0][7] -gt 15){	$s[0][7]= 15 }	# ml
	if($s[1][7] -gt 15){	$s[1][7]= 15 }

	if($s[0][8] -gt 1){	$s[0][8]= 1 }	# am
	if($s[1][8] -gt 1){	$s[1][8]= 1 }
	if($s[0][9] -gt 1){	$s[0][9]= 1 }	# vib
	if($s[1][9] -gt 1){	$s[1][9]= 1 }

	if($s[0][10] -gt 1){	$s[0][10]= 1 }	# eg
	if($s[1][10] -gt 1){	$s[1][10]= 1 }
	if($s[0][11] -gt 1){	$s[0][11]= 1 }	#ksr
	if($s[1][11] -gt 1){	$s[1][11]= 1 }
	if($s[0][12] -gt 1){	$s[0][12]= 1 }	#dt
	if($s[1][12] -gt 1){	$s[1][12]= 1 }

	return $s
 } #func
 
function Opl_flow([array]$s){ 

	for([int]$i= 0;$i -lt 13; $i++){

		if($s[0][$i] -lt 0){	$s[0][$i]= 0 }
		if($s[1][$i] -lt 0){	$s[1][$i]= 0 }
	} #

	if($s[0][0] -gt 1){	$s[0][0]= 1 }	#alg
	if($s[0][1] -gt 7){	$s[0][1]= 7 }	#fb

	if($s[0][2] -gt 15){	$s[0][2]= 15 }	#ar
	if($s[1][2] -gt 15){	$s[1][2]= 15 }
	if($s[0][3] -gt 15){	$s[0][3]= 15 }	# dr
	if($s[1][3] -gt 15){	$s[1][3]= 15 }
	if($s[0][4] -gt 15){	$s[0][4]= 15 }	# rr
	if($s[1][4] -gt 15){	$s[1][4]= 15 }
	if($s[0][5] -gt 15){	$s[0][5]= 15 }	# sl
	if($s[1][5] -gt 15){	$s[1][5]= 15 }

	if($s[0][6] -gt 63){	$s[0][6]= 63 }	#tl
	if($s[1][6] -gt 63){	$s[1][6]= 63 }
	if($s[0][7] -gt 3){	$s[0][7]= 3 }	# ksl
	if($s[1][7] -gt 3){	$s[1][7]= 3 }

	if($s[0][8] -gt 15){	$s[0][8]= 15 }	# ml
	if($s[1][8] -gt 15){	$s[1][8]= 15 }
	if($s[0][9] -gt 1){	$s[0][9]= 1 }	#ksr
	if($s[1][9] -gt 1){	$s[1][9]= 1 }

	if($s[0][10] -gt 1){	$s[0][10]= 1 }	# eg
	if($s[1][10] -gt 1){	$s[1][10]= 1 }
	if($s[0][11] -gt 1){	$s[0][11]= 1 }	# vib
	if($s[1][11] -gt 1){	$s[1][11]= 1 }
	if($s[0][12] -gt 1){	$s[0][12]= 1 }	# am
	if($s[1][12] -gt 1){	$s[1][12]= 1 }

	return $s
 } #func
 
function Opn_flow([array]$s){ 

	for([int]$i= 0;$i -lt 12; $i++){

		if($s[0][$i] -lt 0){	$s[0][$i]= 0 }
		if($s[1][$i] -lt 0){	$s[1][$i]= 0 }
		if($s[2][$i] -lt 0){	$s[2][$i]= 0 }
		if($s[3][$i] -lt 0){	$s[3][$i]= 0 }
	} #

	if($s[0][0] -gt 7){	$s[0][0]= 7 }	#alg
	if($s[0][1] -gt 7){	$s[0][1]= 7 }	#fb

	if($s[0][2] -gt 31){	$s[0][2]= 31 }	#ar
	if($s[1][2] -gt 31){	$s[1][2]= 31 }
	if($s[2][2] -gt 31){	$s[2][2]= 31 }
	if($s[3][2] -gt 31){	$s[3][2]= 31 }

	if($s[0][3] -gt 31){	$s[0][3]= 31 }	# dr
	if($s[1][3] -gt 31){	$s[1][3]= 31 }
	if($s[2][3] -gt 31){	$s[2][3]= 31 }
	if($s[3][3] -gt 31){	$s[3][3]= 31 }

	if($s[0][4] -gt 31){	$s[0][4]= 31 }	# sr
	if($s[1][4] -gt 31){	$s[1][4]= 31 }
	if($s[2][4] -gt 31){	$s[2][4]= 31 }
	if($s[3][4] -gt 31){	$s[3][4]= 31 }

	if($s[0][5] -gt 15){	$s[0][5]= 15 }	# rr
	if($s[1][5] -gt 15){	$s[1][5]= 15 }
	if($s[2][5] -gt 15){	$s[2][5]= 15 }
	if($s[3][5] -gt 15){	$s[3][5]= 15 }


	if($s[0][6] -gt 15){	$s[0][6]= 15 }	# sl
	if($s[1][6] -gt 15){	$s[1][6]= 15 }
	if($s[2][6] -gt 15){	$s[2][6]= 15 }
	if($s[3][6] -gt 15){	$s[3][6]= 15 }

	if($s[0][7] -gt 127){	$s[0][7]= 127 }	# tl
	if($s[1][7] -gt 127){	$s[1][7]= 127 }
	if($s[2][7] -gt 127){	$s[2][7]= 127 }
	if($s[3][7] -gt 127){	$s[3][7]= 127 }


	if($s[0][8] -gt 3){	$s[0][8]= 3 }	# ks
	if($s[1][8] -gt 3){	$s[1][8]= 3 }
	if($s[2][8] -gt 3){	$s[2][8]= 3 }
	if($s[3][8] -gt 3){	$s[3][8]= 3 }

	if($s[0][9] -gt 15){	$s[0][9]= 15 }	# ml
	if($s[1][9] -gt 15){	$s[1][9]= 15 }
	if($s[2][9] -gt 15){	$s[2][9]= 15 }
	if($s[3][9] -gt 15){	$s[3][9]= 15 }

	if($s[0][10] -gt 7){	$s[0][10]= 7 }	# dt
	if($s[1][10] -gt 7){	$s[1][10]= 7 }
	if($s[2][10] -gt 7){	$s[2][10]= 7 }
	if($s[3][10] -gt 7){	$s[3][10]= 7 }

	if($s[0][11] -gt 3){	$s[0][11]= 3 }	#ams
	if($s[1][11] -gt 3){	$s[1][11]= 3 }
	if($s[2][11] -gt 3){	$s[2][11]= 3 }
	if($s[3][11] -gt 3){	$s[3][11]= 3 }

	return $s
 } #func
 
function Opm_flow([array]$s){ 

	for([int]$i= 0;$i -lt 13; $i++){

		if($s[0][$i] -lt 0){	$s[0][$i]= 0 }
		if($s[1][$i] -lt 0){	$s[1][$i]= 0 }
		if($s[2][$i] -lt 0){	$s[2][$i]= 0 }
		if($s[3][$i] -lt 0){	$s[3][$i]= 0 }
	} #

	if($s[0][0] -gt 7){	$s[0][0]= 7 }	#alg
	if($s[0][1] -gt 7){	$s[0][1]= 7 }	#fb

	if($s[0][2] -gt 31){	$s[0][2]= 31 }	#ar
	if($s[1][2] -gt 31){	$s[1][2]= 31 }
	if($s[2][2] -gt 31){	$s[2][2]= 31 }
	if($s[3][2] -gt 31){	$s[3][2]= 31 }

	if($s[0][3] -gt 31){	$s[0][3]= 31 }	# dr
	if($s[1][3] -gt 31){	$s[1][3]= 31 }
	if($s[2][3] -gt 31){	$s[2][3]= 31 }
	if($s[3][3] -gt 31){	$s[3][3]= 31 }

	if($s[0][4] -gt 31){	$s[0][4]= 31 }	# sr
	if($s[1][4] -gt 31){	$s[1][4]= 31 }
	if($s[2][4] -gt 31){	$s[2][4]= 31 }
	if($s[3][4] -gt 31){	$s[3][4]= 31 }

	if($s[0][5] -gt 15){	$s[0][5]= 15 }	# rr
	if($s[1][5] -gt 15){	$s[1][5]= 15 }
	if($s[2][5] -gt 15){	$s[2][5]= 15 }
	if($s[3][5] -gt 15){	$s[3][5]= 15 }


	if($s[0][6] -gt 15){	$s[0][6]= 15 }	# sl
	if($s[1][6] -gt 15){	$s[1][6]= 15 }
	if($s[2][6] -gt 15){	$s[2][6]= 15 }
	if($s[3][6] -gt 15){	$s[3][6]= 15 }

	if($s[0][7] -gt 127){	$s[0][7]= 127 }	# tl
	if($s[1][7] -gt 127){	$s[1][7]= 127 }
	if($s[2][7] -gt 127){	$s[2][7]= 127 }
	if($s[3][7] -gt 127){	$s[3][7]= 127 }


	if($s[0][8] -gt 3){	$s[0][8]= 3 }	# ks
	if($s[1][8] -gt 3){	$s[1][8]= 3 }
	if($s[2][8] -gt 3){	$s[2][8]= 3 }
	if($s[3][8] -gt 3){	$s[3][8]= 3 }

	if($s[0][9] -gt 15){	$s[0][9]= 15 }	# ml
	if($s[1][9] -gt 15){	$s[1][9]= 15 }
	if($s[2][9] -gt 15){	$s[2][9]= 15 }
	if($s[3][9] -gt 15){	$s[3][9]= 15 }

	if($s[0][10] -gt 7){	$s[0][10]= 7 }	# dt1
	if($s[1][10] -gt 7){	$s[1][10]= 7 }
	if($s[2][10] -gt 7){	$s[2][10]= 7 }
	if($s[3][10] -gt 7){	$s[3][10]= 7 }

	if($s[0][11] -gt 3){	$s[0][11]= 3 }	# dt2
	if($s[1][11] -gt 3){	$s[1][11]= 3 }
	if($s[2][11] -gt 3){	$s[2][11]= 3 }
	if($s[3][11] -gt 3){	$s[3][11]= 3 }

	if($s[0][12] -gt 3){	$s[0][12]= 3 }	#ams
	if($s[1][12] -gt 3){	$s[1][12]= 3 }
	if($s[2][12] -gt 3){	$s[2][12]= 3 }
	if($s[3][12] -gt 3){	$s[3][12]= 3 }

	return $s
 } #func
 
# ------ 
 
function Reg_exp([string]$zz,[string]$key_type){ 

	[int]$n= 8;

	[string[]]$er= [System.Text.RegularExpressions.Regex]::Matches($zz,"(?<=\$)[0-9a-zA-Z]*?(?=\,|\s|\}|$)")
	# (\$が接頭辞)[0-9a-zA-Z]のみ文字列?最短一致(,\s}$が接尾辞)


	if($er.Length -ne $n){

		[string]$xx= "不明"

		if($er.Length -gt $n){

			$xx= "過多"

		}elseif($er.Length -lt $n){

			$xx= "不足"
		}

		[string]$err= $key_type+ " レジスタ音色: "+ $n+ " count数が"+ $xx+ ">> "+ $er.Length

		Write-Host ('ERROR: '+ $err)

		[string]$retn= [Windows.Forms.MessageBox]::Show(
		$err, "確認", "OK","Information","Button1"
		)

		return 1
	}else{
		[string]$ss= ""
		[int]$nn= 0
		[int]$i= 0
		[string[]]$bit= "","","","", "","","",""

		for($i= 0; $i -lt 8; $i++){

			$nn= [Convert]::ToInt32($er[$i], 16)	# 16->10
			$ss= [Convert]::ToString($nn, 2)	# 10->2
			$bit[$i]+= "0"* (8- $ss.Length)+ $ss	# 8bit zero padding
		} #

# write-host $bit[0]
# write-host $bit[1]
# write-host $bit[2]
# write-host $bit[3]

# write-host $bit[4]
# write-host $bit[5]
# write-host $bit[6]
# write-host $bit[7]

		[string]$tt= ""

		[array]$a= "",""
		[int[]]$a[0]= 0,0,0,0, 0,0,0,0, 0,0,0,0, 0
		[int[]]$a[1]= 0,0,0,0, 0,0,0,0, 0,0,0,0, 0

		$tt= $bit[0].Substring(0,1);	$a[0][8]= [Convert]::ToInt32($tt, 2) # 2->10
		$tt= $bit[0].Substring(1,1);	$a[0][9]= [Convert]::ToInt32($tt, 2)
		$tt= $bit[0].Substring(2,1);	$a[0][10]= [Convert]::ToInt32($tt, 2)
		$tt= $bit[0].Substring(3,1);	$a[0][11]= [Convert]::ToInt32($tt, 2)
		$tt= $bit[0].Substring(4,4);	$a[0][7]= [Convert]::ToInt32($tt, 2) # 4bit

		$tt= $bit[1].Substring(0,1);	$a[1][8]= [Convert]::ToInt32($tt, 2)
		$tt= $bit[1].Substring(1,1);	$a[1][9]= [Convert]::ToInt32($tt, 2)
		$tt= $bit[1].Substring(2,1);	$a[1][10]= [Convert]::ToInt32($tt, 2)
		$tt= $bit[1].Substring(3,1);	$a[1][11]= [Convert]::ToInt32($tt, 2)
		$tt= $bit[1].Substring(4,4);	$a[1][7]= [Convert]::ToInt32($tt, 2) # 4bit

		$tt= $bit[2].Substring(0,2);	$a[0][6]= [Convert]::ToInt32($tt, 2) # 2bit
		$tt= $bit[2].Substring(2,6);	$a[0][0]= [Convert]::ToInt32($tt, 2) # 6bit

		$tt= $bit[3].Substring(0,2);	$a[1][6]= [Convert]::ToInt32($tt, 2) # 2bit
		$tt= $bit[3].Substring(2,1);	$a[1][12]= [Convert]::ToInt32($tt, 2)
		# value: 0
		$tt= $bit[3].Substring(4,1);	$a[0][12]= [Convert]::ToInt32($tt, 2)
		$tt= $bit[3].Substring(5,3);	$a[0][1]= [Convert]::ToInt32($tt, 2) # 3bit

		$tt= $bit[4].Substring(0,4);	$a[0][2]= [Convert]::ToInt32($tt, 2) # 4bit
		$tt= $bit[4].Substring(4,4);	$a[0][3]= [Convert]::ToInt32($tt, 2) # 4bit

		$tt= $bit[5].Substring(0,4);	$a[1][2]= [Convert]::ToInt32($tt, 2) # 4bit
		$tt= $bit[5].Substring(4,4);	$a[1][3]= [Convert]::ToInt32($tt, 2) # 4bit

		$tt= $bit[6].Substring(0,4);	$a[0][4]= [Convert]::ToInt32($tt, 2) # 4bit
		$tt= $bit[6].Substring(4,4);	$a[0][5]= [Convert]::ToInt32($tt, 2) # 4bit

		$tt= $bit[7].Substring(0,4);	$a[1][4]= [Convert]::ToInt32($tt, 2) # 4bit
		$tt= $bit[7].Substring(4,4);	$a[1][5]= [Convert]::ToInt32($tt, 2) # 4bit


		[array]$brr= Vrc_flow $a # [int] de chk

		$script:vrc_svn= All_sz $brr 13

# write-host $vrc_svn[0]
# write-host $vrc_svn[1]

		return 0
	}
 } #func
 
function Fmx_exp([string]$zz,[string]$key_style){ # $key["style"] 

	[int]$n= 0
	[string]$ary= ""

	switch($comb_fm.SelectedItem){

	'vrc7 2op'{	$n= 24; $ary= "VRC7";	break; # マトリクス総数 2+11*2
	}'opl 2op'{	$n= 24; $ary= "OPL";	break;
	}'opn 4op'{
		$ary= "OPN"

		switch($key_style){
		'pmd'{	$n= 42;	break;
		}'fmp7'{	$n= 42;	break;
		}'mucom'{	$n= 38;	break;
		}'mxdrv'{	$n= 43
		}
		} #sw
		break;

	}'opm 4op'{
		$ary= "OPM"

		switch($key_style){
		'pmd'{	$n= 46;	break;
		}'fmp7'{	$n= 46;	break;
		}'mucom'{	$n= 42;	break;
		}'mxdrv'{	$n= 47
		}
		} #sw
	}
	} #sw


	[string]$vv= [System.Text.RegularExpressions.Regex]::Replace($zz,"\t"," ")
	# tab -> space タブが何個もあるとエラーため

	[string]$uu= [System.Text.RegularExpressions.Regex]::Replace($vv,"/\*.*?\*/","")


	switch($key_style){	# コメント行カット
	'pmd'{ # ;abc, =abc カット

		[string]$ss= [System.Text.RegularExpressions.Regex]::Replace($uu,"[=;].*(?=\n|$)","")
		break;

	}'fmp7'{ # FA 1 などのカット

		[string]$tt= [System.Text.RegularExpressions.Regex]::Replace($uu,"(?<='@)\s*F[a-zA-Z]+\s*[0-9]+\s*(?=\n|$)","")
		[string]$ss= [System.Text.RegularExpressions.Regex]::Matches($tt,"'@.*(?=\n|$)")
		break;

	}default{

		[string]$ss= [System.Text.RegularExpressions.Regex]::Replace($uu,"[/;].*(?=\n|$)","")
	}
	} #sw

	[string[]]$er= [System.Text.RegularExpressions.Regex]::Matches($ss,"(?<=^|;|:|,|\s)(?:-)?[0-9]+?(?=;|:|,|\s|\n|$)")
	# (\s,^)が接頭辞)(含まないが-の可能性)[0-9]文字列含む?最短一致(,;\s\n$が接尾辞)


	if($er.Length -ne $n){

		[string]$xx= "不明"

		if($er.Length -gt $n){

			$xx= "過多"

		}elseif($er.Length -lt $n){

			$xx= "不足"
		}

		[string]$err= $key_style+ " FM音色 "+ $ary+ ":"+ $n+ " count数が"+ $xx+ ">> "+ $er.Length

		Write-Host ('ERROR: '+ $err)

		[string]$retn= [Windows.Forms.MessageBox]::Show(
		$err, "確認", "OK","Information","Button1"
		)

		return 1
	}else{

		# [string[]]$ir= $er[($er.Length- $n)..($er.Length- 1)] # @numあらば先頭削除
		# 末尾からカウント - 最終フィルタ

		switch($comb_fm.SelectedItem){
		'vrc7 2op'{
			[array]$r= (0,0)
			[int[]]$r[0]= $er[0..12]
			[int[]]$r[1]= (0,0)+ $er[13..23] # (0,0,$er[..]) ha shino err!

			[array]$brr= Vrc_flow $r # [int] de chk

			$script:vrc_svn= All_sz $brr 13
			break;
		}'opl 2op'{
			[array]$r= (0,0)
			[int[]]$r[0]= $er[0..12]
			[int[]]$r[1]= (0,0)+ $er[13..23]

			[array]$brr= Opl_flow $r

			$script:opl_two= All_sz $brr 13
			break;
		}'opn 4op'{
			switch($key_style){
			'fmp7'{
				$er= $er[40..41]+ $er[0..39]
				break;
			}'mxdrv'{
				$er= $er[40..41]+ $er[0..39]
			}
			} #sw

			[array]$r= (0,0,0,0)

			switch($key_style){
			'mucom'{
				[int[]]$r[0]= $er[1..0]+ $er[2..10]+ 0
				[int[]]$r[1]= (0,0)+ $er[11..19]+ 0
				[int[]]$r[2]= (0,0)+ $er[20..28]+ 0
				[int[]]$r[3]= (0,0)+ $er[29..37]+ 0
			}default{
				[int[]]$r[0]= $er[0..11]
				[int[]]$r[1]= (0,0)+ $er[12..21]
				[int[]]$r[2]= (0,0)+ $er[22..31]
				[int[]]$r[3]= (0,0)+ $er[32..41]
			}
			} #sw

			[array]$brr= Opn_flow $r

			$script:opn_fur= All_sz $brr 12
			break;
		}'opm 4op'{
			switch($key_style){
			'fmp7'{
				$er= $er[44..45]+ $er[0..43]
				break;
			}'mxdrv'{
				$er= $er[44..45]+ $er[0..43]
			}
			} #sw

			[array]$r= (0,0,0,0)

			switch($key_style){
			'mucom'{
				[int[]]$r[0]= $er[1..0]+ $er[2..11]+ 0
				[int[]]$r[1]= (0,0)+ $er[12..21]+ 0
				[int[]]$r[2]= (0,0)+ $er[22..31]+ 0
				[int[]]$r[3]= (0,0)+ $er[32..41]+ 0
			}default{
				[int[]]$r[0]= $er[0..12]
				[int[]]$r[1]= (0,0)+ $er[13..23]
				[int[]]$r[2]= (0,0)+ $er[24..34]
				[int[]]$r[3]= (0,0)+ $er[35..45]
			}
			} #sw

			[array]$brr= Opm_flow $r

			$script:opm_fur= All_sz $brr 13
		}
		} #sw

		return 0
 	}
 } #func
 
function Param_exp([int]$jj,[string]$mtx){ 

  switch($comb_fm.SelectedItem){
  'vrc7 2op'{

	switch($key["type"]){
	'mckreg'{	[int]$nn= Reg_exp $mtx $key["type"];	break;
	}'nsdreg'{	[int]$nn= Reg_exp $mtx $key["type"];	break;
	}default{	[int]$nn= Fmx_exp $mtx $key["type"]
	}
	} #sw
	break;

  }'opl 2op'{

	[int]$nn= Fmx_exp $mtx "opl"
	break;

  }default{
	if($jj -eq 2){

		[string]$tt= "pmd"
	}else{
		[string]$tt= $key["style"]
	}

	[int]$nn= Fmx_exp $mtx $tt
  }
  } #sw

  switch($nn){
  '0'{
	if($jj -eq 0){ # Unredo 1 thru

		Write-Host ('<< FM音色を読み込みました')
	}

	Box_read # 整形
	Value_gui

	break;
  }'1'{
		Write-Host ('>> FM音色の読み込みに失敗しました')
  }
  } #sw
 } #func
 
# ------ 
 
function Mskseg_chk(){ 

	[int[]]$num= 0,0

	if($key["mask"] -ne '15'){

		$num[0]= 1
	}
	if($key["eg_type"] -ne 'Thru'){

		$num[1]= 1
	}

	if(($num[0]+ $num[1]) -eq 0){

		return $False
	}else{
		return $True
	}
 } #func
 
function Mskseg_out([int]$sw){ 

	[string]$ss= ""

	switch($sw){
	0{ # Listen
		[string]$tt= " "
		[string]$out= "pmd"
		break;
	}1{ # FM box
		[string]$tt= " "
		[string]$out= $key["style"]
		if($out -eq 'pmd'){ $ss+= " =" }
		break;
	}2{ # FM op window
		[string]$tt= "`r`n"
		[string]$out= ""
	}
	} #sw

	switch($out){
	'pmd'{
		[string]$mk= "s"
		[string]$eg= "SE"
		##[string]$tr= "SE15,0"
		break;
	}default{
		[string]$mk= "Mask:"
		[string]$eg= "SSG:"
		##[string]$tr= ""
	}
	} #sw

	if($key["mask"] -ne '15'){

		if($out -ne 'mxdrv'){

			$ss+= $tt
			$ss+= $mk+ $key["mask"]
		}
	}

	if($key["eg_type"] -ne 'Thru'){

		if($comb_fm.SelectedItem -eq  'opn 4op'){
			$ss+= $tt
			$ss+= $eg+ $key["ssg"]+ ","+ $key["eg_type"]
		}
	}else{
		if($sw -eq 0){ # Listenのみ

			$ss+= $tt
			##$ss+= $tr
		}
	}

	return $ss
 } #func
 
function Reg_write(){ # $key["type"] 

	[array]$r= $vrc_svn

# write-host $r[0]
# write-host $r[1]

	[string[]]$bit= "","","","", "","","",""
	[string]$tt= ""

	$bit[0]= [Convert]::ToString($r[0][8], 2)
	$bit[0]+= [Convert]::ToString($r[0][9], 2)
	$bit[0]+= [Convert]::ToString($r[0][10], 2)
	$bit[0]+= [Convert]::ToString($r[0][11], 2)
	$tt= [Convert]::ToString($r[0][7], 2);	$bit[0]+= "0"* (4- $tt.Length)+ $tt # 4bit zeroume

	$bit[1]= [Convert]::ToString($r[1][8], 2)
	$bit[1]+= [Convert]::ToString($r[1][9], 2)
	$bit[1]+= [Convert]::ToString($r[1][10], 2)
	$bit[1]+= [Convert]::ToString($r[1][11], 2)
	$tt= [Convert]::ToString($r[1][7], 2);	$bit[1]+= "0"* (4- $tt.Length)+ $tt # 4bit


	$tt= [Convert]::ToString($r[0][6], 2);	$bit[2]= "0"* (2- $tt.Length)+ $tt # 2bit
	$tt= [Convert]::ToString($r[0][0], 2);	$bit[2]+= "0"* (6- $tt.Length)+ $tt # 6bit

	$tt= [Convert]::ToString($r[1][6], 2);	$bit[3]= "0"* (2- $tt.Length)+ $tt # 2bit
	$bit[3]+= "0"
	$bit[3]+= [Convert]::ToString($r[1][12], 2)
	$bit[3]+= [Convert]::ToString($r[0][12], 2)
	$tt= [Convert]::ToString($r[0][1], 2);	$bit[3]+= "0"* (3- $tt.Length)+ $tt # 3bit


	$tt= [Convert]::ToString($r[0][2], 2);	$bit[4]= "0"* (4- $tt.Length)+ $tt # 4bit
	$tt= [Convert]::ToString($r[0][3], 2);	$bit[4]+= "0"* (4- $tt.Length)+ $tt # 4bit

	$tt= [Convert]::ToString($r[1][2], 2);	$bit[5]= "0"* (4- $tt.Length)+ $tt # 4bit
	$tt= [Convert]::ToString($r[1][3], 2);	$bit[5]+= "0"* (4- $tt.Length)+ $tt # 4bit


	$tt= [Convert]::ToString($r[0][4], 2);	$bit[6]= "0"* (4- $tt.Length)+ $tt # 4bit
	$tt= [Convert]::ToString($r[0][5], 2);	$bit[6]+= "0"* (4- $tt.Length)+ $tt # 4bit

	$tt= [Convert]::ToString($r[1][4], 2);	$bit[7]= "0"* (4- $tt.Length)+ $tt # 4bit
	$tt= [Convert]::ToString($r[1][5], 2);	$bit[7]+= "0"* (4- $tt.Length)+ $tt # 4bit

# write-host $bit[0]
# write-host $bit[1]
# write-host $bit[2]
# write-host $bit[3]

# write-host $bit[4]
# write-host $bit[5]
# write-host $bit[6]
# write-host $bit[7]

	switch($key["type"]){
	'mckreg'{	[string]$header= $box_header["vrc_mckreg"]
		[string]$te= ","
		break;
	}'nsdreg'{	[string]$header= $box_header["vrc_nsdreg"]
		[string]$te= " "
	}
	} #sw

	[string[]]$reg= "","","","", "","","",""
	[string]$val= ""
	[string]$ss= ""
	[int]$nn= 0
	[int]$i= 0

	for($i= 0; $i -lt 8; $i++){

		$nn= [Convert]::ToInt32($bit[$i], 2)
		$ss= [Convert]::ToString($nn, 16)
		$reg[$i]= "$"+ "0"* (2- $ss.Length)+ $ss # zeroume

		$val+= $reg[$i]

		if($i -gt 6){ break;
		}else{	$val+= $te
		}
	} #

	$header= $header.Replace("%op_param%", $val)

# write-host $header

	return $header
 } #func
 
function Fmx_light(){ 

	[array]$ir= "","", "","",""

	[string]$af= ""
	[string]$one= ""
	[string]$two= ""
	[string]$three= ""
	[string]$four= ""

	[string]$header= ""

	switch($comb_fm.SelectedItem){
	'vrc7 2op'{
		$ir[0]= $vrc_svn[0][0..1]
		$ir[1]= $vrc_svn[0][2..12]
		$ir[2]= $vrc_svn[1][2..12]

		$af= $ir[0] -join " "
		$one= $ir[1] -join " "
		$two= $ir[2] -join " "

		$header= $box_header["vrc"]
		$header= $header.Replace("%af_param%",$af)
		$header= $header.Replace("%op1_param%",$one)
		$header= $header.Replace("%op2_param%",$two)
		break;
	}'opl 2op'{

		$ir[0]= $opl_two[0][0..1]
		$ir[1]= $opl_two[0][2..12]
		$ir[2]= $opl_two[1][2..12]

		$af= $ir[0] -join " "
		$one= $ir[1] -join " "
		$two= $ir[2] -join " "

		$header= $box_header["opl"]
		$header= $header.Replace("%af_param%",$af)
		$header= $header.Replace("%op1_param%",$one)
		$header= $header.Replace("%op2_param%",$two)
		break;
	}'opn 4op'{

		$ir[0]= $opn_fur[0][0..1]
		$ir[1]= $opn_fur[0][2..11]
		$ir[2]= $opn_fur[1][2..11]
		$ir[3]= $opn_fur[2][2..11]
		$ir[4]= $opn_fur[3][2..11]

		$af= $ir[0] -join " "
		$one= $ir[1] -join " "
		$two= $ir[2] -join " "
		$three= $ir[3] -join " "
		$four= $ir[4] -join " "

		$header= $box_header["opn"]
		$header= $header.Replace("%mask_param%","")
		$header= $header.Replace("%af_param%",$af)
		$header= $header.Replace("%op1_param%",$one)
		$header= $header.Replace("%op2_param%",$two)
		$header= $header.Replace("%op3_param%",$three)
		$header= $header.Replace("%op4_param%",$four)
		break;
	}'opm 4op'{

		$ir[0]= $opm_fur[0][0..1]
		$ir[1]= $opm_fur[0][2..12]
		$ir[2]= $opm_fur[1][2..12]
		$ir[3]= $opm_fur[2][2..12]
		$ir[4]= $opm_fur[3][2..12]

		$af= $ir[0] -join " "
		$one= $ir[1] -join " "
		$two= $ir[2] -join " "
		$three= $ir[3] -join " "
		$four= $ir[4] -join " "

		$header= $box_header["opm"]
		$header= $header.Replace("%mask_param%","")
		$header= $header.Replace("%af_param%",$af)
		$header= $header.Replace("%op1_param%",$one)
		$header= $header.Replace("%op2_param%",$two)
		$header= $header.Replace("%op3_param%",$three)
		$header= $header.Replace("%op4_param%",$four)
	}
	} #sw

	return $header
 } #func
 
function Fmx_write(){ # $key["ten"],$key["zero"],$key["style"] 

	[array]$ir= "","", "","",""

	[string]$af= ""
	[string]$one= ""
	[string]$two= ""
	[string]$three= ""
	[string]$four= ""

	[string]$header= ""
	[string]$mask= ""
	[string]$te= ""

	switch($key["ten"]){
		'False'{ $te= " "; break;
		}'True'{ $te= ","
	}
	} #sw

	switch($comb_fm.SelectedItem){
	'vrc7 2op'{
		switch($key["zero"]){
		'False'{
			[array]$vrc= "","" # array from karachi build <- safe

			$vrc[0]= $vrc_svn[0]
			$vrc[1]= $vrc_svn[1]
			break;
		}'True'{
			[array]$vrc= $_vrc # array from pkg build <- safe

			[int]$i= 0
			for($i= 0; $i -lt 13; $i++){

		 		# $arr[0][$i]= $arr[0][$i].Replace("  "," 0") # local scoop dekinai

				$vrc[0][$i]= $vrc_svn[0][$i].Replace("  "," 0")
				$vrc[1][$i]= $vrc_svn[1][$i].Replace("  "," 0")
			} #
		}
		} #sw

		$ir[0]= $vrc[0][0..1]
		$ir[1]= $vrc[0][2..12]
		$ir[2]= $vrc[1][2..12]

		$af= $ir[0] -join $te
		$one= $ir[1] -join $te
		$two= $ir[2] -join $te

		$header= $box_header["vrc"]
		$header= $header.Replace("%af_param%",$af)
		$header= $header.Replace("%op1_param%",$one)
		$header= $header.Replace("%op2_param%",$two)
		break;
	}'opl 2op'{

		switch($key["zero"]){
		'False'{
			[array]$opl= "",""

			$opl[0]= $opl_two[0]
			$opl[1]= $opl_two[1]
			break;
		}'True'{
			[array]$opl= $_opl

			[int]$i= 0
			for($i= 0; $i -lt 13; $i++){

				$opl[0][$i]= $opl_two[0][$i].Replace("  "," 0")
				$opl[1][$i]= $opl_two[1][$i].Replace("  "," 0")
			} #
		}
		} #sw

		$ir[0]= $opl[0][0..1]
		$ir[1]= $opl[0][2..12]
		$ir[2]= $opl[1][2..12]

		$af= $ir[0] -join $te
		$one= $ir[1] -join $te
		$two= $ir[2] -join $te

		$header= $box_header["opl"]
		$header= $header.Replace("%af_param%",$af)
		$header= $header.Replace("%op1_param%",$one)
		$header= $header.Replace("%op2_param%",$two)

		break;
	}'opn 4op'{

		switch($key["zero"]){
		'False'{
			[array]$opn= "","","",""

			$opn[0]= $opn_fur[0]
			$opn[1]= $opn_fur[1]
			$opn[2]= $opn_fur[2]
			$opn[3]= $opn_fur[3]

			$mask= Sz $key["mask"]
			break;
		}'True'{
			[array]$opn= $_opn

			[int]$i= 0
			for($i= 0; $i -lt 12; $i++){

				$opn[0][$i]= $opn_fur[0][$i].Replace(" ","0")
				$opn[1][$i]= $opn_fur[1][$i].Replace(" ","0")
				$opn[2][$i]= $opn_fur[2][$i].Replace(" ","0")
				$opn[3][$i]= $opn_fur[3][$i].Replace(" ","0")
			} #
			$mask= Zeropad $key["mask"]
		}
		} #sw

		switch($key["style"]){
		'mucom'{
			$ir[0]= $opn[0][1..0]
			$ir[1]= $opn[0][2..10]
			$ir[2]= $opn[1][2..10]
			$ir[3]= $opn[2][2..10]
			$ir[4]= $opn[3][2..10]
			break;
		}'mxdrv'{
			$ir[0]= $opn[0][0..1]+ $mask
			$ir[1]= $opn[0][2..11]+ ""
			$ir[2]= $opn[1][2..11]+ ""
			$ir[3]= $opn[2][2..11]+ ""
			$ir[4]= $opn[3][2..11]+ "" # comma追加 ,0 -> ,0,("")
			break;
		}default{
			$ir[0]= $opn[0][0..1]
			$ir[1]= $opn[0][2..11]
			$ir[2]= $opn[1][2..11]
			$ir[3]= $opn[2][2..11]
			$ir[4]= $opn[3][2..11]
		}
		} #sw

		switch($key["style"]){
		'fmp7'{ $header= $box_header["opn_fmp7"]; break;
		}'mucom'{ $header= $box_header["opn_mucom"]; break;
		}'mxdrv'{ $header= $box_header["opn_mxdrv"]; break;
		}default{ $header= $box_header["opn"]
		}
		} #sw

		if(Mskseg_chk){

			$mask= " "+ (Mskseg_out 1)
		}else{
			$mask= ""
		}
		$header= $header.Replace("%mask_param%",$mask)


		$af= $ir[0] -join $te
		$one= $ir[1] -join $te
		$two= $ir[2] -join $te
		$three= $ir[3] -join $te
		$four= $ir[4] -join $te

		$header= $header.Replace("%af_param%",$af)
		$header= $header.Replace("%op1_param%",$one)
		$header= $header.Replace("%op2_param%",$two)
		$header= $header.Replace("%op3_param%",$three)
		$header= $header.Replace("%op4_param%",$four)

		break;
	}'opm 4op'{

		switch($key["zero"]){
		'False'{
			[array]$opm= "","","",""

			$opm[0]= $opm_fur[0]
			$opm[1]= $opm_fur[1]
			$opm[2]= $opm_fur[2]
			$opm[3]= $opm_fur[3]

			$mask= Sz $key["mask"]
			break;
		}'True'{
			[array]$opm= $_opm

			[int]$i= 0
			for($i= 0; $i -lt 13; $i++){

				$opm[0][$i]= $opm_fur[0][$i].Replace(" ","0")
				$opm[1][$i]= $opm_fur[1][$i].Replace(" ","0")
				$opm[2][$i]= $opm_fur[2][$i].Replace(" ","0")
				$opm[3][$i]= $opm_fur[3][$i].Replace(" ","0")
			} #
			$mask= Zeropad $key["mask"]
		}
		} #sw

		switch($key["style"]){
		'mucom'{
			$ir[0]= $opm[0][1..0]
			$ir[1]= $opm[0][2..11]
			$ir[2]= $opm[1][2..11]
			$ir[3]= $opm[2][2..11]
			$ir[4]= $opm[3][2..11]
			break;
		}'mxdrv'{
			$ir[0]= $opm[0][0..1]+ $mask
			$ir[1]= $opm[0][2..12]+ ""
			$ir[2]= $opm[1][2..12]+ ""
			$ir[3]= $opm[2][2..12]+ ""
			$ir[4]= $opm[3][2..12]+ "" # comma追加
			break;
		}default{
			$ir[0]= $opm[0][0..1]
			$ir[1]= $opm[0][2..12]
			$ir[2]= $opm[1][2..12]
			$ir[3]= $opm[2][2..12]
			$ir[4]= $opm[3][2..12]
		}
		} #sw

		switch($key["style"]){
		'fmp7'{ $header= $box_header["opm_fmp7"]; break;
		}'mucom'{ $header= $box_header["opm_mucom"]; break;
		}'mxdrv'{ $header= $box_header["opm_mxdrv"]; break;
		}default{ $header= $box_header["opm"]
		}
		} #sw

		if(Mskseg_chk){

			$mask= " "+ (Mskseg_out 1)
		}else{
			$mask= ""
		}
		$header= $header.Replace("%mask_param%",$mask)


		$af= $ir[0] -join $te
		$one= $ir[1] -join $te
		$two= $ir[2] -join $te
		$three= $ir[3] -join $te
		$four= $ir[4] -join $te

		$header= $header.Replace("%af_param%",$af)
	 	$header= $header.Replace("%op1_param%",$one)
	 	$header= $header.Replace("%op2_param%",$two)
	 	$header= $header.Replace("%op3_param%",$three)
	 	$header= $header.Replace("%op4_param%",$four)
	}
	} #sw

	return $header
 } #func
 
function Box_read(){ 

	$fm_box.SuspendLayout()

	switch($comb_fm.SelectedItem){
	'vrc7 2op'{
		switch($key["type"]){
		'mckreg'{	[string]$s= Reg_write;	break;
		}'nsdreg'{	[string]$s= Reg_write;	break;
		}default{	[string]$s= Fmx_write
		}
		} #sw
		break;

	}default{
		[string]$s= Fmx_write
	}
	} #sw

	$fm_box.Text= $s

	$fm_box.ResumeLayout()
 } #func
 
function Box_mml_read(){ 

	$fm_box_mml.SuspendLayout()

	switch($comb_fm.SelectedItem){
	'vrc7 2op'{
		switch($key["type"]){
		'mckreg'{	[string]$ss= $box_mml["mck"];	break;
		}default{	[string]$ss= $box_mml["nsd"]
		}
		} #sw

		break;
	}default{
		[string]$ss= $box_mml["pmd"]
	}
	} #sw

	$fm_box_mml.Text= $ss

	$fm_box_mml.ResumeLayout()
 } #func
  
# forms ====== 
 
Add-Type -AssemblyName System.Windows.Forms > $null 
Add-Type -AssemblyName System.Drawing > $null

$ErrorActionPreference= "Stop"

$FonLabel= New-Object System.Drawing.Font("Segoe UI", 10)
$Fon= New-Object System.Drawing.Font("MS Gothic",11) # Microsoft Sans Serif  MS Gothic
$Fona= New-Object System.Drawing.Font("Lucida Console", 12, [System.Drawing.FontStyle]::Bold) # Lucida Console  Garamond Georgia Verdana Impact

cd (Split-Path -Parent $MyInvocation.MyCommand.Path)
[Environment]::CurrentDirectory= pwd # working_dir set
 
# Sub forms 
	 
# $contxt_7bwを読み込んだ後$PictureBox objが安全 
	 
$contxt_Sep_7bw= New-Object System.Windows.Forms.ToolStripSeparator 
$contxt_Sep_Lbw= New-Object System.Windows.Forms.ToolStripSeparator
$contxt_Sep_Nbg= New-Object System.Windows.Forms.ToolStripSeparator
$contxt_Sep_Mbg= New-Object System.Windows.Forms.ToolStripSeparator
 
$contxt_7bw= New-Object System.Windows.Forms.ContextMenuStrip 

# [void]$contxt_7bw.Items.Add("Attack [v]")

$contxt_7bw.Add_ItemClicked({
 try{
	[string] $str= $_.ClickedItem # switch tame
	switch($str){
	'ADSR copy'{	$script:adsr= ADSR_in
			break;
	}'ADSR paste'{
		Unredo 0

		ADSR_out $script:adsr
		Box_read
		Value_gui
		All_chg
		break;
	}default{
		if($str.Contains("[v]") -eq $False){

			$script:key["knob"][0]= (ShortX $str "short")
			Contxt_chg_vrc (ShortX $str "short")
			All_chg # pictbox string tame
		}
	}
	} #sw

	$this.Close()
 }catch{
	echo $_.exception
 }
})
 
$contxt_Lbw= New-Object System.Windows.Forms.ContextMenuStrip 

# [void]$contxt_Lbw.Items.Add("Attack [v]")

$contxt_Lbw.Add_ItemClicked({
 try{
	[string] $str= $_.ClickedItem
	switch($str){
	'ADSR copy'{	$script:adsr= ADSR_in
			break;
	}'ADSR paste'{
		Unredo 0

		ADSR_out $script:adsr
		Box_read
		Value_gui
		All_chg
		break;
	}default{
		if($str.Contains("[v]") -eq $False){

			$script:key["knob"][1]= (ShortX $str "short")
			Contxt_chg_opl (ShortX $str "short")
			All_chg
		}
	}
	} #sw

	$this.Close()
 }catch{
	echo $_.exception
 }
})
 
$contxt_Nbg= New-Object System.Windows.Forms.ContextMenuStrip 

# [void]$contxt_Nbg.Items.Add("Attack [v]")

$contxt_Nbg.Add_ItemClicked({
 try{
	[string] $str= $_.ClickedItem
	switch($str){
	'ADSR copy'{	$script:adsr= ADSR_in
			break;
	}'ADSR paste'{
		Unredo 0

		ADSR_out $script:adsr
		Box_read
		Value_gui
		All_chg
		break;
	}default{
		if($str.Contains("[v]") -eq $False){

			$script:key["knob"][2]= (ShortX $str "short")
			Contxt_chg_opn (ShortX $str "short")
			All_chg
		}
	}
	} #sw

	$this.Close()
 }catch{
	echo $_.exception
 }
})
 
$contxt_Mbg= New-Object System.Windows.Forms.ContextMenuStrip 

# [void]$contxt_Mbg.Items.Add("Attack [v]")

$contxt_Mbg.Add_ItemClicked({
 try{
	[string] $str= $_.ClickedItem
	switch($str){
	'ADSR copy'{	$script:adsr= ADSR_in
			break;
	}'ADSR paste'{
		Unredo 0

		ADSR_out $script:adsr
		Box_read
		Value_gui
		All_chg
		break;
	}default{
		if($str.Contains("[v]") -eq $False){

			$script:key["knob"][3]= (ShortX $str "short")
			Contxt_chg_opm (ShortX $str "short")
			All_chg
		}
	}
	} #sw

	$this.Close()
 }catch{
	echo $_.exception
 }
})
 
$contxt_oct= New-Object System.Windows.Forms.ContextMenuStrip 

##[void]$contxt_oct.Items.Add("o1") # ->Contxt_octave

$contxt_oct.Add_ItemClicked({
 try{
	if( ([string] $_.ClickedItem).Contains("[v]")  -eq $False){

		$script:key["oct"]= Osc_sw ([string] $_.ClickedItem)
		Pict_chg
		Stus_build

		Contxt_octave $key["oct"]
	}
	$this.Close()
 }catch{
	echo $_.exception
 }
})
  
[bool] $script:mouse_capure= $False 
[int] $script:start_value= 0
$script:toppos= New-Object System.Drawing.Point
 
# Pictbg 




	 
[int[]]$op_IMG= @(162, 102) 
$op_Rect= New-Object System.Drawing.Rectangle(0, 0, $op_IMG[0], $op_IMG[1])
 
$bgimg= New-Object System.Drawing.Bitmap(480,530) # bg 4op 

$gpb= [System.Drawing.Graphics]::FromImage($bgimg) # 書き込み
$gpb.CompositingQuality= "HighQuality"
$gpb.SmoothingMode= "HighQuality"
$gpb.PixelOffsetMode= "HighQuality"

$Pictbg= New-Object System.Windows.Forms.PictureBox
$Pictbg.ClientSize=  $bgimg.Size
$Pictbg.Image= $bgimg
$Pictbg.Location= "0,0"

$Pictbg.Add_MouseWheel({
 try{
	Wheel_ALG $_.Delta
 }catch{
	echo $_.exception
 }
})

$Pictbg.Add_MouseDown({
 try{
	switch([string]$_.Button){
	'Right'{
		Contxt_select "oct"
		break;
	}'Left'{
		$lisn_btn.PerformClick() # メソッド
	}
	} #sw
 }catch{
	echo $_.exception
 }
})

$Pictbg.Add_DoubleClick({
 try{
	switch([string]$_.Button){
	'Left'{
		$lisn_btn.PerformClick() # メソッド
	}
	} #sw
 }catch{
	echo $_.exception
 }
})
 
$bgimw= New-Object System.Drawing.Bitmap(480,280) # bg 2op 

$gpw= [System.Drawing.Graphics]::FromImage($bgimw)
$gpw.CompositingQuality= "HighQuality"
$gpw.SmoothingMode= "HighQuality"
$gpw.PixelOffsetMode= "HighQuality"

$Pictbw= New-Object System.Windows.Forms.PictureBox
$Pictbw.ClientSize=  $bgimw.Size
$Pictbw.Image= $bgimw
$Pictbw.Location= "0,0"

$Pictbw.Add_MouseWheel({
 try{
	Wheel_ALG $_.Delta
 }catch{
	echo $_.exception
 }
})

$Pictbw.Add_MouseDown({
 try{
	switch([string]$_.Button){
	'Right'{
		Contxt_select "oct"
		break;
	}'Left'{
		$lisn_btn.PerformClick()
	}
	} #sw
 }catch{
	echo $_.exception
 }
})

$Pictbw.Add_DoubleClick({
 try{
	switch([string]$_.Button){
	'Left'{
		$lisn_btn.PerformClick()
	}
	} #sw
 }catch{
	echo $_.exception
 }
})
 
# 2op 
	
$image1a= New-Object System.Drawing.Bitmap($op_IMG) 

$gpz= [System.Drawing.Graphics]::FromImage($image1a)
$gpz.CompositingQuality= "HighQuality"
$gpz.SmoothingMode= "HighQuality"
$gpz.PixelOffsetMode= "HighQuality"

$Pictbox1a= New-Object System.Windows.Forms.PictureBox
$Pictbox1a.ClientSize= $image1a.Size
$Pictbox1a.Image= $image1a
#$Pictbox1a.Location= "0,0"
#$Pictbox1a.Enabled= $false

$Pictbox1a.Add_MouseWheel({
 try{
	Mouse_valuer "Wheel" 0 $_
 }catch{
	echo $_.exception
 }
})

$Pictbox1a.Add_MouseUp({
 try{
	Mouse_valuer "Up"
 }catch{
	echo $_.exception
 }
})

$Pictbox1a.Add_MouseMove({ # drag enter
 try{
	Mouse_valuer "Move"
 }catch{
	echo $_.exception
 }
})

$Pictbox1a.Add_MouseHover({
 try{
	Mouse_valuer "Hover" 0
 }catch{
	echo $_.exception
 }
})

$Pictbox1a.Add_MouseDown({
 try{
	Mouse_valuer "Down" 0 $_
 }catch{
	echo $_.exception
 }
})
 
$image2a= New-Object System.Drawing.Bitmap($op_IMG) 

$gpx= [System.Drawing.Graphics]::FromImage($image2a)
$gpx.CompositingQuality= "HighQuality"
$gpx.SmoothingMode= "HighQuality"
$gpx.PixelOffsetMode= "HighQuality"

$Pictbox2a= New-Object System.Windows.Forms.PictureBox
$Pictbox2a.ClientSize= $image2a.Size
$Pictbox2a.Image= $image2a
#$Pictbox2a.Location= "0,100"


$Pictbox2a.Add_MouseWheel({
 try{
	if($comb_fm.SelectedIndex -eq 0 -and $comb_vrc.SelectedIndex -eq 1 -and $key["knob"][0] -eq 'TL'){
	}else{
		Mouse_valuer "Wheel" 1 $_
	}
 }catch{
	echo $_.exception
 }
})

$Pictbox2a.Add_MouseUp({
 try{
	Mouse_valuer "Up"
 }catch{
	echo $_.exception
 }
})

$Pictbox2a.Add_MouseMove({ # drag enter
 try{
	if($comb_fm.SelectedIndex -eq 0 -and $comb_vrc.SelectedIndex -eq 1 -and $key["knob"][0] -eq 'TotalLevel'){
	}else{
		Mouse_valuer "Move"
	}
 }catch{
	echo $_.exception
 }
})

$Pictbox2a.Add_MouseHover({
 try{
	Mouse_valuer "Hover" 1
 }catch{
	echo $_.exception
 }
})

$Pictbox2a.Add_MouseDown({
 try{
	Mouse_valuer "Down" 1 $_
 }catch{
	echo $_.exception
 }
})
  
# 4op 
	
$image1= New-Object System.Drawing.Bitmap($op_IMG) # 書き込む場所 

$gpc= [System.Drawing.Graphics]::FromImage($image1)
$gpc.CompositingQuality= "HighQuality" # HighSpeed # 高速で低品質
$gpc.SmoothingMode= "HighQuality" # HighSpeed # アンチエイリアス処理しない
$gpc.PixelOffsetMode= "HighQuality"

$Pictbox1= New-Object System.Windows.Forms.PictureBox
$Pictbox1.ClientSize= $image1.Size
$Pictbox1.Image= $image1
#$Pictbox1.Location= "0,0"
#$Pictbox1.Enabled= $false

$Pictbox1.Add_MouseWheel({
 try{	# write-host ("ff: "+ $_.Delta) #MouseEventArgs.Delta +120 or -120
	Mouse_valuer "Wheel" 0 $_
 }catch{
	echo $_.exception
 }
})

$Pictbox1.Add_MouseUp({
 try{
	Mouse_valuer "Up"
 }catch{
	echo $_.exception
 }
})

$Pictbox1.Add_MouseMove({ # drag enter
 try{
	Mouse_valuer "Move"
 }catch{
	echo $_.exception
 }
})

$Pictbox1.Add_MouseHover({
 try{
	Mouse_valuer "Hover" 0
 }catch{
	echo $_.exception
 }
})

$Pictbox1.Add_MouseDown({
 try{
	Mouse_valuer "Down" 0 $_
 }catch{
	echo $_.exception
 }
})
 
$image2= New-Object System.Drawing.Bitmap($op_IMG) 

$gpe= [System.Drawing.Graphics]::FromImage($image2)
$gpe.CompositingQuality= "HighQuality"
$gpe.SmoothingMode= "HighQuality"
$gpe.PixelOffsetMode= "HighQuality"

$Pictbox2= New-Object System.Windows.Forms.PictureBox
$Pictbox2.ClientSize= $image2.Size
$Pictbox2.Image= $image2
#$Pictbox2.Location= "0,100"


$Pictbox2.Add_MouseWheel({
 try{
	Mouse_valuer "Wheel" 1 $_
 }catch{
	echo $_.exception
 }
})

$Pictbox2.Add_MouseUp({
 try{
	Mouse_valuer "Up"
 }catch{
	echo $_.exception
 }
})

$Pictbox2.Add_MouseMove({ # drag enter
 try{
	Mouse_valuer "Move"
 }catch{
	echo $_.exception
 }
})

$Pictbox2.Add_MouseHover({
 try{
	Mouse_valuer "Hover" 1
 }catch{
	echo $_.exception
 }
})

$Pictbox2.Add_MouseDown({
 try{
	Mouse_valuer "Down" 1 $_
 }catch{
	echo $_.exception
 }
})
 
$image3= New-Object System.Drawing.Bitmap($op_IMG) 

$gpg= [System.Drawing.Graphics]::FromImage($image3)
$gpg.CompositingQuality= "HighQuality"
$gpg.SmoothingMode= "HighQuality"
$gpg.PixelOffsetMode= "HighQuality"

$Pictbox3= New-Object System.Windows.Forms.PictureBox
$Pictbox3.ClientSize= $image3.Size
$Pictbox3.Image= $image3
#$Pictbox3.Location= "0,200"


$Pictbox3.Add_MouseWheel({
 try{
	Mouse_valuer "Wheel" 2 $_
 }catch{
	echo $_.exception
 }
})

$Pictbox3.Add_MouseUp({
 try{
	Mouse_valuer "Up"
 }catch{
	echo $_.exception
 }
})

$Pictbox3.Add_MouseMove({ # drag enter
 try{
	Mouse_valuer "Move"
 }catch{
	echo $_.exception
 }
})

$Pictbox3.Add_MouseHover({
 try{
	Mouse_valuer "Hover" 2
 }catch{
	echo $_.exception
 }
})

$Pictbox3.Add_MouseDown({
 try{
	Mouse_valuer "Down" 2 $_
 }catch{
	echo $_.exception
 }
})
 
$image4= New-Object System.Drawing.Bitmap($op_IMG) 

$gpi= [System.Drawing.Graphics]::FromImage($image4)
$gpi.CompositingQuality= "HighQuality"
$gpi.SmoothingMode= "HighQuality"
$gpi.PixelOffsetMode= "HighQuality"

$Pictbox4= New-Object System.Windows.Forms.PictureBox
$Pictbox4.ClientSize= $image4.Size
$Pictbox4.Image= $image4
#$Pictbox4.Location= "0,300"


$Pictbox4.Add_MouseWheel({
 try{
	Mouse_valuer "Wheel" 3 $_
 }catch{
	echo $_.exception
 }
})

$Pictbox4.Add_MouseUp({
 try{
	Mouse_valuer "Up"
 }catch{
	echo $_.exception
 }
})

$Pictbox4.Add_MouseMove({ # drag enter
 try{
	Mouse_valuer "Move"
 }catch{
	echo $_.exception
 }
})

$Pictbox4.Add_MouseHover({
 try{
	Mouse_valuer "Hover" 3
 }catch{
	echo $_.exception
 }
})

$Pictbox4.Add_MouseDown({
 try{
	Mouse_valuer "Down" 3 $_
 }catch{
	echo $_.exception
 }
})
   
# buffb 


	
[int[]]$buf_IMG= @(322, 202) 
$buf_Rect= New-Object System.Drawing.Rectangle(0, 0, $buf_IMG[0], $buf_IMG[1])
[int[]]$buf_Size= @(($buf_IMG[0]+ 2), ($buf_IMG[1]+ 2)) # バッファサイズ

$buf_image= New-Object System.Drawing.Bitmap($buf_IMG)

$buf_grp= [System.Drawing.Graphics]::FromImage($buf_image)
$buf_grp.CompositingQuality= "HighSpeed"
$buf_grp.SmoothingMode= "HighSpeed"
$buf_grp.PixelOffsetMode= "HighSpeed"
 
$image_tmp= New-Object System.Drawing.Bitmap($buf_IMG) # size down 

$gp_tmp= [System.Drawing.Graphics]::FromImage($image_tmp)
$gp_tmp.CompositingQuality= " HighSpeed"
$gp_tmp.SmoothingMode= " HighSpeed"
$gp_tmp.PixelOffsetMode= " HighSpeed"
 
$contxtw= [System.Drawing.BufferedGraphicsManager]::Current 
$contxtw.MaximumBuffer= "482,282"
$buffw= $contxtw.Allocate($gpw, $Pictbw.ClientRectangle)
 
$contxtb= [System.Drawing.BufferedGraphicsManager]::Current 
$contxtb.MaximumBuffer= "482,532"
$buffb= $contxtb.Allocate($gpb, $Pictbg.ClientRectangle)
 
# 2op 
	
$contxtz= [System.Drawing.BufferedGraphicsManager]::Current 
$contxtz.MaximumBuffer= $buf_Size -join ","
$buffz= $contxtz.Allocate($buf_grp, $buf_Rect)

#$buffz= [System.Drawing.BufferedGraphics]
#$contxtz= [System.Drawing.BufferedGraphicsContext]

# ura buffer ha Renderメソッド不使用のため、手動バッファは不要
# $gpk ha BufferedGraphics ha hitsuyou nai
 
$contxtx= [System.Drawing.BufferedGraphicsManager]::Current 
$contxtx.MaximumBuffer= $buf_Size -join ","
$buffx= $contxtx.Allocate($buf_grp, $buf_Rect)
  
# 2op ura buffer 
	
$image5a= New-Object System.Drawing.Bitmap($buf_IMG) 

$gpv= [System.Drawing.Graphics]::FromImage($image5a)
$gpv.CompositingQuality= "HighSpeed"
$gpv.SmoothingMode= "HighSpeed"
$gpv.PixelOffsetMode= "HighSpeed"
 
$image6a= New-Object System.Drawing.Bitmap($buf_IMG) 

$gpt= [System.Drawing.Graphics]::FromImage($image6a)
$gpt.CompositingQuality= "HighSpeed"
$gpt.SmoothingMode= "HighSpeed"
$gpt.PixelOffsetMode= "HighSpeed"
  
# 4op 
	
$contxtc= [System.Drawing.BufferedGraphicsManager]::Current 
$contxtc.MaximumBuffer= $buf_Size -join ","
$buffc= $contxtc.Allocate($buf_grp, $buf_Rect)
 
$contxte= [System.Drawing.BufferedGraphicsManager]::Current 
$contxte.MaximumBuffer= $buf_Size -join ","
$buffe= $contxte.Allocate($buf_grp, $buf_Rect)
 
$contxtg= [System.Drawing.BufferedGraphicsManager]::Current 
$contxtg.MaximumBuffer= $buf_Size -join ","
$buffg= $contxtg.Allocate($buf_grp, $buf_Rect)
 
$contxti= [System.Drawing.BufferedGraphicsManager]::Current 
$contxti.MaximumBuffer= $buf_Size -join ","
$buffi= $contxti.Allocate($buf_grp, $buf_Rect)
  
# 4op ura buffer 
	
$image5= New-Object System.Drawing.Bitmap($buf_IMG) 

$gpk= [System.Drawing.Graphics]::FromImage($image5)
$gpk.CompositingQuality= "HighSpeed"
$gpk.SmoothingMode= "HighSpeed"
$gpk.PixelOffsetMode= "HighSpeed"
 
$image6= New-Object System.Drawing.Bitmap($buf_IMG) 

$gpm= [System.Drawing.Graphics]::FromImage($image6)
$gpm.CompositingQuality= "HighSpeed"
$gpm.SmoothingMode= "HighSpeed"
$gpm.PixelOffsetMode= "HighSpeed"
 
$image7= New-Object System.Drawing.Bitmap($buf_IMG) 

$gpo= [System.Drawing.Graphics]::FromImage($image7)
$gpo.CompositingQuality= "HighSpeed"
$gpo.SmoothingMode= "HighSpeed"
$gpo.PixelOffsetMode= "HighSpeed"
 
$image8= New-Object System.Drawing.Bitmap($buf_IMG) 

$gpq= [System.Drawing.Graphics]::FromImage($image8)
$gpq.CompositingQuality= "HighSpeed"
$gpq.SmoothingMode= "HighSpeed"
$gpq.PixelOffsetMode= "HighSpeed"
   
# ------ 
 
$pict_panel= New-Object System.Windows.Forms.Panel 
$pict_panel.Location= "4,26"
$pict_panel.Size= "481,536"
#$pict_panel.ClientSize= $bgimg.Size
#$pict_panel.Text= ""
#$pict_panel.BackColor= "red"
 
$sb_stus= New-Object System.Windows.Forms.StatusStrip 
$sb_stus.SizingGrip= $false

$sb_label= New-Object System.Windows.Forms.ToolStripStatusLabel
# $sb_label.Text= "  Test ------"
# $sb_label.Font= $Fon
 
$sb_alg= New-Object System.Windows.Forms.Form 
$sb_alg.Text= "FM Operator window"
#$sb_alg.Size= "502,627"
$sb_alg.Location= "500,0"

$sb_alg.FormBorderStyle= "FixedSingle"
$sb_alg.StartPosition= "WindowsDefaultLocation"
$sb_alg.Icon= Icon_read "..\fm_editor.exe"
$sb_alg.MinimizeBox= $True
$sb_alg.MaximizeBox= $False


#$sb_alg.TopLevel= $True
$sb_alg.Owner= $frm_fm

$sb_alg.Add_KeyDown({
 try{
	Key_play $_.KeyCode

 }catch{
	echo $_.exception
 }
})

$sb_alg.Add_FormClosing({
 try{
	if($_.CloseReason -eq 'UserClosing'){ # x ボタンの場合のため

		# Stus_alg # -> Popalg_build

		$script:key["open"]= Popalg_build $False
	}

	$_.Cancel= $True # Hide -> 再度 Showのため
	# EventArgs -> $_.(c# dato e.)

	Write-Host ('<< Operator windowを閉じます'+ "`r`n")

	$this.Hide() #.Visible= $false

 }catch{
	echo $_.exception
 }
})
 
$sb_mnu= New-Object System.Windows.Forms.MenuStrip 
	
$sb_menu_f= New-Object System.Windows.Forms.ToolStripMenuItem 
$sb_menu_f.Text= "File"

$sb_menu_p= New-Object System.Windows.Forms.ToolStripMenuItem
$sb_menu_p.Text= "Property"

$sb_menu_w0= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_w0.Text= "1"
$sb_menu_w0.Add_Click({
 try{
	if($bai -ne 1){

		$script:bai= Attend_alg 1
		Peralg_build $bai
		Reso $bai

		switch(Itm){
		'2op'{ Sin_chw; break;
		}'4op'{ Sin_chg
		}
		} #sw

		Stus_alg
	}
 }catch{
	echo $_.exception
 }
})

$sb_menu_w1= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_w1.Text= "2"
$sb_menu_w1.Add_Click({
 try{
	if($bai -ne 2){

		$script:bai= Attend_alg 2
		Peralg_build $bai
		Reso $bai

		switch(Itm){
		'2op'{ Sin_chw; break;
		}'4op'{ Sin_chg
		}
		} #sw

		Stus_alg
	}
 }catch{
	echo $_.exception
 }
})

$sb_menu_w2= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_w2.Text= "4"
$sb_menu_w2.Add_Click({
 try{
	if($bai -ne 4){

		$script:bai= Attend_alg 4
		Peralg_build $bai
		Reso $bai

		switch(Itm){
		'2op'{ Sin_chw; break;
		}'4op'{ Sin_chg
		}
		} #sw

		Stus_alg
	}
 }catch{
	echo $_.exception
 }
})

$sb_menu_sn= New-Object System.Windows.Forms.ToolStripSeparator
$sb_menu_fin= New-Object System.Windows.Forms.ToolStripMenuItem
$sb_menu_fin.Text= "Close"

$sb_menu_fin.Add_Click({
 try{
	# $script:key["open"]= Popalg_build $False
	$sb_alg.Close() # $sb_alg.Add_FormClosingへ

 }catch{
	echo $_.exception
 }
})
 
$sb_menu_e= New-Object System.Windows.Forms.ToolStripMenuItem 
$sb_menu_e.Text= "Adjust"

$sb_menu_one= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_one.Text= $adjr[0]
$sb_menu_one.Add_Click({
 try{
	if($key["adjust"] -ne $adjr[0]){
		$script:key["adjust"]= Adj_sw $adjr[0]
		All_chg
		Stus_alg
	}
 }catch{
	echo $_.exception
 }
})

$sb_menu_two= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_two.Text= $adjr[1]
$sb_menu_two.Add_Click({
 try{
	if($key["adjust"] -ne $adjr[1]){
		$script:key["adjust"]= Adj_sw $adjr[1]
		All_chg
		Stus_alg
	}
 }catch{
	echo $_.exception
 }
})

$sb_menu_three= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_three.Text= $adjr[2]
$sb_menu_three.Add_Click({
 try{
	if($key["adjust"] -ne $adjr[2]){
		$script:key["adjust"]= Adj_sw $adjr[2]
		All_chg
		Stus_alg
	}
 }catch{
	echo $_.exception
 }
})

$sb_menu_four= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_four.Text= $adjr[3]
$sb_menu_four.Add_Click({
 try{
	if($key["adjust"] -ne $adjr[3]){
		$script:key["adjust"]= Adj_sw $adjr[3]
		All_chg
		Stus_alg
	}
 }catch{
	echo $_.exception
 }
})

$sb_menu_five= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_five.Text= $adjr[4]
$sb_menu_five.Add_Click({
 try{
	if($key["adjust"] -ne $adjr[4]){
		$script:key["adjust"]= Adj_sw $adjr[4]
		All_chg
		Stus_alg
	}
 }catch{
	echo $_.exception
 }
})

$sb_menu_six= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_six.Text= $adjr[5]
$sb_menu_six.Add_Click({
 try{
	if($key["adjust"] -ne $adjr[5]){
		$script:key["adjust"]= Adj_sw $adjr[5]
		All_chg
		Stus_alg
	}
 }catch{
	echo $_.exception
 }
})

$sb_menu_seven= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_seven.Text= $adjr[6]
$sb_menu_seven.Add_Click({
 try{
	if($key["adjust"] -ne $adjr[6]){
		$script:key["adjust"]= Adj_sw $adjr[6]
		All_chg
		Stus_alg
	}
 }catch{
	echo $_.exception
 }
})
 
$sb_menu_a= New-Object System.Windows.Forms.ToolStripMenuItem 
$sb_menu_a.Text= "Wait"

$sb_menu_a0= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_a0.Text= "0"
$sb_menu_a0.Add_Click({
 try{
	if($key["wait"] -ne 0){
		$script:key["wait"]= Wait_sw 0
		Stus_alg
	}
 }catch{
	echo $_.exception
 }
})

$sb_menu_a1= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_a1.Text= "1"
$sb_menu_a1.Add_Click({
 try{
	if($key["wait"] -ne 1){
		$script:key["wait"]= Wait_sw 1
		Stus_alg
	}
 }catch{
	echo $_.exception
 }
})

$sb_menu_a2= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_a2.Text= "2"
$sb_menu_a2.Add_Click({
 try{
	if($key["wait"] -ne 2){
		$script:key["wait"]= Wait_sw 2
		Stus_alg
	}
 }catch{
	echo $_.exception
 }
})

$sb_menu_a3= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_a3.Text= "3"
$sb_menu_a3.Add_Click({
 try{
	if($key["wait"] -ne 3){
		$script:key["wait"]= Wait_sw 3
		Stus_alg
	}
 }catch{
	echo $_.exception
 }
})

$sb_menu_a4= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_a4.Text= "4"
$sb_menu_a4.Add_Click({
 try{
	if($key["wait"] -ne 4){
		$script:key["wait"]= Wait_sw 4
		Stus_alg
	}
 }catch{
	echo $_.exception
 }
})
 
$sb_menu_y= New-Object System.Windows.Forms.ToolStripMenuItem 
$sb_menu_y.Text= "Layout"

$sb_menu_ff= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_ff.Text= "nomal"

$sb_menu_ff.Add_Click({
 try{
	if($key["layout"] -ne 'nomal'){

		$script:key["layout"]= Layout_alg "nomal"

		Chip_position $key["layout"]
		Pict_chg
		Stus_alg
	}
 }catch{
	echo $_.exception
 }
})

$sb_menu_rev= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_rev.Text= "reverse"

$sb_menu_rev.Add_Click({
 try{
	if($key["layout"] -ne 'reverse'){

		$script:key["layout"]= Layout_alg "reverse"

		Chip_position $key["layout"]
		Pict_chg
		Stus_alg
	}
 }catch{
	echo $_.exception
 }
})
 
$sb_menu_m= New-Object System.Windows.Forms.ToolStripMenuItem 
$sb_menu_m.Text= "Mode"

$sb_menu_dark= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_dark.Text= "dark"

$sb_menu_dark.Add_Click({
 try{
	if($key["mode"] -ne 'dark'){

		$script:key["mode"]= Mode_alg "dark"

		Color_Render
		All_chg # ura buffer no tame
		Stus_alg
	}

 }catch{
	echo $_.exception
 }
})

$sb_menu_light= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_light.Text= "light"

$sb_menu_light.Add_Click({
 try{
	if($key["mode"] -ne 'light'){

		$script:key["mode"]= Mode_alg "light"

		Color_Render
		All_chg
		Stus_alg
	}

 }catch{
	echo $_.exception
 }
})
 
$sb_menu_o= New-Object System.Windows.Forms.ToolStripMenuItem 
$sb_menu_o.Text= "Color"

$sb_menu_steel= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_steel.Text= "steel"

$sb_menu_steel.Add_Click({
 try{
	if($key["color"] -ne 'steel'){

		$script:key["color"]= Color_alg "steel"

		Color_Render
		All_chg
		Stus_alg
	}

 }catch{
	echo $_.exception
 }
})

$sb_menu_natural= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_natural.Text= "natural"

$sb_menu_natural.Add_Click({
 try{
	if($key["color"] -ne 'natural'){

		$script:key["color"]= Color_alg "natural"

		Color_Render
		All_chg # ura buffer no tame
		Stus_alg
	}

 }catch{
	echo $_.exception
 }
})

$sb_menu_pastel= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_pastel.Text= "pastel"

$sb_menu_pastel.Add_Click({
 try{
	if($key["color"] -ne 'pastel'){

		$script:key["color"]= Color_alg "pastel"

		Color_Render
		All_chg
		Stus_alg
	}

 }catch{
	echo $_.exception
 }
})

$sb_menu_vivid= New-Object System.Windows.Forms.ToolStripMenuItem
#$sb_menu_vivid.Text= "vivid"

$sb_menu_vivid.Add_Click({
 try{
	if($key["color"] -ne 'vivid'){

		$script:key["color"]= Color_alg "vivid"

		Color_Render
		All_chg
		Stus_alg
	}

 }catch{
	echo $_.exception
 }
})
  
$pict_panel.Controls.AddRange(@($Pictbox1a,$Pictbox2a,$Pictbox1,$Pictbox2,$Pictbox3,$Pictbox4, $Pictbw, $Pictbg)) 
# 後ろ側ほど下へレンダリングされる


$sb_menu_e.DropDownItems.AddRange(@($sb_menu_one,$sb_menu_two,$sb_menu_three,$sb_menu_four,$sb_menu_five,$sb_menu_six,$sb_menu_seven))
$sb_menu_a.DropDownItems.AddRange(@($sb_menu_a0,$sb_menu_a1,$sb_menu_a2,$sb_menu_a3,$sb_menu_a4))
$sb_menu_y.DropDownItems.AddRange(@($sb_menu_ff,$sb_menu_rev))
$sb_menu_o.DropDownItems.AddRange(@($sb_menu_steel, $sb_menu_natural, $sb_menu_pastel, $sb_menu_vivid))
$sb_menu_m.DropDownItems.AddRange(@($sb_menu_dark, $sb_menu_light))
$sb_menu_p.DropDownItems.AddRange(@($sb_menu_w0,$sb_menu_w1,$sb_menu_w2))
$sb_menu_f.DropDownItems.AddRange(@($sb_menu_p,$sb_menu_sn,$sb_menu_fin))

$sb_mnu.Items.AddRange(@($sb_menu_f, $sb_menu_e, $sb_menu_a, $sb_menu_y, $sb_menu_m, $sb_menu_o))

$sb_stus.Items.AddRange(@($sb_label))
$sb_alg.Controls.AddRange(@($sb_mnu,$pict_panel,$sb_stus))
  
# Preset forms 
	
$ff_baloon= New-Object System.Windows.Forms.Tooltip 
$ff_baloon.ShowAlways= $False
# $ff_baloon.ToolTipIcon= "Info"
$ff_baloon.ToolTipTitle= "Voice: "
$ff_baloon.AutomaticDelay= 667
 
$list_mck= New-Object System.Windows.Forms.ListBox 
$list_mck.Size= "220,190"
$list_mck.Location= "5,25"

$list_mck.Add_MouseDown({
 try{
	$fm_box.ForeColor= "dimgray"
	$fm_box.BackColor= "gainsboro"

	switch([string]$_.Button){
	'Left'{
		Mck_listen $hsmck[[string]$list_mck.SelectedItem]
		break;
	}'Right'{
		$ff_baloon.SetToolTip($list_mck,$hsmck[[string]$list_mck.SelectedItem])
	}
	} #sw
 }catch{
	echo $_.exception
 }
})
 
$list_vrc= New-Object System.Windows.Forms.ListBox 
$list_vrc.Size= "220,190"
$list_vrc.Location= "5,25"

$list_vrc.Add_MouseDown({
 try{
	$fm_box.ForeColor= "dimgray"
	$fm_box.BackColor= "gainsboro"

	switch([string]$_.Button){
	'Left'{
		Vrc7_listen $hsvrc[[string]$list_vrc.SelectedItem]
		break;
	}'Right'{
		$ff_baloon.SetToolTip($list_vrc,$hsvrc[[string]$list_vrc.SelectedItem])
	}
	} #sw
 }catch{
	echo $_.exception
 }
})
 
$list_88= New-Object System.Windows.Forms.ListBox 
$list_88.Size= "220,190"
$list_88.Location= "5,25"

$list_88.Add_MouseDown({
 try{
	$fm_box.ForeColor= "dimgray"
	$fm_box.BackColor= "gainsboro"

	switch([string]$_.Button){
	'Left'{
		FF_listen $hs88[[string]$list_88.SelectedItem]
		break;
	}'Right'{
		$ff_baloon.SetToolTip($list_88,$hs88[[string]$list_88.SelectedItem])
	}
	} #sw
 }catch{
	echo $_.exception
 }
})
 
$list_x68= New-Object System.Windows.Forms.ListBox 
$list_x68.Size= "220,190"
$list_x68.Location= "5,25"

$list_x68.Add_MouseDown({
 try{
	$fm_box.ForeColor= "dimgray"
	$fm_box.BackColor= "gainsboro"

	switch([string]$_.Button){
	'Left'{
		FF_listen $hsx68[[string]$list_x68.SelectedItem]
		break;
	}'Right'{
		$ff_baloon.SetToolTip($list_x68,$hsx68[[string]$list_x68.SelectedItem])
	}
	} #sw
 }catch{
	echo $_.exception
 }
})
 
$list_efx= New-Object System.Windows.Forms.ListBox 
$list_efx.Size= "220,190"
$list_efx.Location= "5,25"

$list_efx.Add_MouseDown({
 try{
	$fm_box.ForeColor= "dimgray"
	$fm_box.BackColor= "gainsboro"

	switch([string]$_.Button){
	'Left'{
		FF_listen $hsefx[[string]$list_efx.SelectedItem]
		break;
	}'Right'{
		$ff_baloon.SetToolTip($list_efx,$hsefx[[string]$list_efx.SelectedItem])
	}
	} #sw
 }catch{
	echo $_.exception
 }
})
 
# ------ 
 
$ff_tab= New-Object System.Windows.Forms.TabControl 
$ff_tab.Size= "245,255"
$ff_tab.Location= "5,25"
 
$tab_mck= New-Object System.Windows.Forms.TabPage 
$tab_mck.Text= "mck"

$tab_mck.Add_VisibleChanged({
 try{
 	#write-host ($tab_mck.Visible) # in時のみ、$True, out時のみ、$False

	if($tab_mck.Visible){
	 	$comb_fm.SelectedItem= "vrc7 2op"

		$script:key["type"]= Type_sw "mckreg"
		Change_value "compiler" "mck"

		Panel_chg $comb_fm.SelectedItem
		Menu_build "compiler"
		Stus_build

		Unredo 2
	}
 }catch{
	echo $_.exception
 }
})
 
$tab_vrc= New-Object System.Windows.Forms.TabPage 
$tab_vrc.Text= "nsd"

$tab_vrc.Add_VisibleChanged({
 try{
	if($tab_vrc.Visible){
		$comb_fm.SelectedItem= "vrc7 2op"

		$script:key["type"]= Type_sw "nsd"
		Change_value "compiler" "nsd"

		Panel_chg $comb_fm.SelectedItem
		Menu_build "compiler"
		Stus_build

		Unredo 2
	}
  }catch{
	echo $_.exception
 }
})
 
$tab_88= New-Object System.Windows.Forms.TabPage 
$tab_88.Text= "pc88"

$tab_88.Add_VisibleChanged({
 try{
	if($tab_88.Visible){
		$comb_fm.SelectedItem= "opn 4op"

		Panel_chg $comb_fm.SelectedItem
		Menu_build "compiler"
		Stus_build

		Unredo 2
	}
 }catch{
	echo $_.exception
 }
})
 
$tab_x68= New-Object System.Windows.Forms.TabPage 
$tab_x68.Text= "x68ed"

$tab_x68.Add_VisibleChanged({
 try{
	if($tab_x68.Visible){
 		$comb_fm.SelectedItem= "opn 4op"

		Panel_chg $comb_fm.SelectedItem
		Menu_build "compiler"
		Stus_build

		Unredo 2
	}
 }catch{
	echo $_.exception
 }
})
 
$tab_efx= New-Object System.Windows.Forms.TabPage 
$tab_efx.Text= "effec"

$tab_efx.Add_VisibleChanged({
 try{
	if($tab_efx.Visible){
		$comb_fm.SelectedItem= "opn 4op"

		Panel_chg $comb_fm.SelectedItem
		Menu_build "compiler"
		Stus_build

		Unredo 2
	}
 }catch{
	echo $_.exception
 }
})
 
$import_btn= New-Object System.Windows.Forms.Button 
$import_btn.Text= "Import"
$import_btn.Size= "90,30"
$import_btn.Location= "65,284"


$import_btn.Add_Click({
 try{
	switch($ff_tab.SelectedIndex){
	'0'{	[string]$retn= $hsmck[[string]$list_mck.SelectedItem]; break;
	}'1'{	[string]$retn= $hsvrc[[string]$list_vrc.SelectedItem]; break;
	}'2'{	[string]$retn= $hs88[[string]$list_88.SelectedItem];   break;
	}'3'{	[string]$retn= $hsx68[[string]$list_x68.SelectedItem]; break;
	}'4'{	[string]$retn= $hsefx[[string]$list_efx.SelectedItem]
	}
	} #sw

    if($retn -ne ''){

	$fm_box.ForeColor= "dimgray"
	$fm_box.BackColor= "white" # "gainsboro"

	Write-Host '<< presetをimportしました'

	$conv_btn.PerformClick()
	## $conv_btn.Add_Click <- storeを更新

	## Saveauto $script:fm_xml.table.presetstore
	## if($sb_alg.Visible){
	##	Monotone_select "conv_btn" # line書込
	## }

    }

 }catch{
	echo $_.exception
 }
})
 
$close_btn= New-Object System.Windows.Forms.Button 
$close_btn.Text= "Close"
$close_btn.Size= "90,30"
$close_btn.Location= "160,284"


$close_btn.Add_Click({
 try{
	$ff_frm.Close()
 }catch{
	echo $_.exception
 }
})
 
$ff_frm= New-Object System.Windows.Forms.Form 
$ff_frm.Text= "Preset波形"
$ff_frm.Size= "268,362"
$ff_frm.Location= "500,0"

$ff_frm.FormBorderStyle= "FixedSingle"
$ff_frm.StartPosition= "WindowsDefaultLocation"
$ff_frm.Icon= Icon_read "..\fm_editor.exe"
# $ff_frm.MinimizeBox= $False
$ff_frm.MaximizeBox= $False

# $ff_frm.TopLevel= $True
$ff_frm.Owner= $frm_fm

$ff_frm.Add_FormClosing({
 try{
	$comb_fm.Enabled= $True

	$fm_box.ForeColor= "dimgray"
	$fm_box.BackColor= "white" # "gainsboro"

	Autoload $fm_xml.table.presetstore

	Panel_chg $comb_fm.SelectedItem
	Stus_build

	if($sb_alg.Visible){
		All_chg
	}

	$fm_menu_pset.Text= "Preset"

	if($_.CloseReason -eq 'UserClosing'){ # x ボタンの場合
	}

	$_.Cancel= $True # Hide -> 再度 Showのため

	$this.Hide() #.Visible= $false

 }catch{
	echo $_.exception
 }
})
 
$ff_mnu= New-Object System.Windows.Forms.MenuStrip 
	 
$ff_menu_f= New-Object System.Windows.Forms.ToolStripMenuItem 
$ff_menu_f.Text= "File"

$ff_menu_tps= New-Object System.Windows.Forms.ToolStripSeparator
$ff_menu_tp= New-Object System.Windows.Forms.ToolStripMenuItem
# $ff_menu_tp.Text= "Click to play"
$ff_menu_tp.Add_Click({
	switch($key["clickplay"]){
	'False'{
		$script:key["clickplay"]= ClickPlay_sw $True
		break;
	}'True'{
		$script:key["clickplay"]= ClickPlay_sw $False
	}
	} #sw
 })

$ff_menu_pr= New-Object System.Windows.Forms.ToolStripMenuItem
$ff_menu_pr.Text= "Preset reload"
$ff_menu_pr.Add_Click({

	$list_mck.Items.Clear() # reset 2重読込対策
	$list_vrc.Items.Clear()
	$list_88.Items.Clear()
	$list_x68.Items.Clear()
	$list_efx.Items.Clear()

	[string]$rtn= Preset_read

	if($rtn -eq ""){
		[string]$out= '"Preset"ファイルをreloadしました'
		Write-Host $out

		$retn= [Windows.Forms.MessageBox]::Show(
		$out, "確認", "OK","Information","Button1"
		)

	}else{
		[string]$out= '"Preset"ファイルのreload失敗しました'
		Write-Host $out

		$out= $rtn+ $out

		$retn= [Windows.Forms.MessageBox]::Show(
		$out, "確認", "OK","Information","Button1"
		)
	}
 })

$ff_menu_ces= New-Object System.Windows.Forms.ToolStripSeparator
$ff_menu_ce= New-Object System.Windows.Forms.ToolStripMenuItem
$ff_menu_ce.Text= "Close"
$ff_menu_ce.Add_Click({

	$ff_frm.Close()
})
 
$ff_menu_b= New-Object System.Windows.Forms.ToolStripMenuItem 
$ff_menu_b.Text= "Clipboard"

$ff_menu_cb= New-Object System.Windows.Forms.ToolStripMenuItem
$ff_menu_cb.Text= "Voice Value Copy"

$ff_menu_cb.Add_Click({
 try{
	switch($ff_tab.SelectedIndex){
	'0'{	[string]$retn= $hsmck[[string]$list_mck.SelectedItem]; break;
	}'1'{	[string]$retn= $hsvrc[[string]$list_vrc.SelectedItem]; break;
	}'2'{	[string]$retn= $hs88[[string]$list_88.SelectedItem];   break;
	}'3'{	[string]$retn= $hsx68[[string]$list_x68.SelectedItem]; break;
	}'4'{	[string]$retn= $hsefx[[string]$list_efx.SelectedItem]
	}
	} #sw

    if($retn -ne ''){

	[Windows.Forms.Clipboard]::SetText($retn,[Windows.Forms.TextDataFormat]::UnicodeText)

	Write-Host '<< presetをclipboardへ送りました'

    }

 }catch{
	echo $_.exception
 }
})
  
$tab_mck.Controls.AddRange(@($list_mck)) 
$tab_vrc.Controls.AddRange(@($list_vrc))
$tab_88.Controls.AddRange(@($list_88))
$tab_x68.Controls.AddRange(@($list_x68))
$tab_efx.Controls.AddRange(@($list_efx))
$ff_tab.Controls.AddRange(@($tab_mck,$tab_vrc,$tab_88,$tab_x68,$tab_efx))

$ff_menu_f.DropDownItems.AddRange(@($ff_menu_pr, $ff_menu_tps, $ff_menu_tp, $ff_menu_ces, $ff_menu_ce))
$ff_menu_b.DropDownItems.AddRange(@($ff_menu_cb))
$ff_mnu.Items.AddRange(@($ff_menu_f,$ff_menu_b))
$ff_frm.Controls.AddRange(@($ff_mnu, $ff_tab, $play_chk, $import_btn, $close_btn))
  
# Mask forms 
	
$sub_mask= New-Object System.Windows.Forms.Form 
$sub_mask.Text= "Operator Mask"
$sub_mask.Size= "272,172"
$sub_mask.Location= "500,0"

$sub_mask.FormBorderStyle= "FixedSingle"
$sub_mask.StartPosition= "WindowsDefaultLocation"
$sub_mask.Icon= Icon_read "..\fm_editor.exe"
# $sub_mask.MinimizeBox= $False
$sub_mask.MaximizeBox= $False

# $sub_mask.TopLevel= $True
$sub_mask.Owner= $frm_fm

$sub_mask.Add_FormClosing({
 try{

	$fm_menu_mask.Text= "4op.mask"

	if($_.CloseReason -eq 'UserClosing'){ # x ボタンの場合
 	}

	$_.Cancel= $True # Hide -> 再度 Showのため

	$this.Hide() #.Visible= $false

 }catch{
	echo $_.exception
 }
})
 
$sub_mask_grp= New-Object System.Windows.Forms.GroupBox 
$sub_mask_grp.Text= "Mask"
$sub_mask_grp.Size= "95,125" # 215,95"
$sub_mask_grp.Location= "10,3"


	 
$sub_mask_chk0= New-Object System.Windows.Forms.CheckBox 
$sub_mask_chk0.Text= "Op.1"
$sub_mask_chk0.Size= "60,20"
$sub_mask_chk0.Location= "10,22"
$sub_mask_chk0.CheckState= "Checked"

$sub_mask_chk0.Add_Click({

	$script:key["mask"]= Mask_sw "0" $key["mask"]

	Stus_build
	Box_read

	if($sb_alg.Visible){
		All_chg
	}
})

$sub_mask_chk1= New-Object System.Windows.Forms.CheckBox
$sub_mask_chk1.Text= "Op.2"
$sub_mask_chk1.Size= "60,20"
$sub_mask_chk1.Location= "10,42"
$sub_mask_chk1.CheckState= "Checked"

$sub_mask_chk1.Add_Click({

	$script:key["mask"]= Mask_sw "1" $key["mask"]

	Stus_build
	Box_read

	if($sb_alg.Visible){
		All_chg
	}
})

$sub_mask_chk2= New-Object System.Windows.Forms.CheckBox
$sub_mask_chk2.Text= "Op.3"
$sub_mask_chk2.Size= "60,20"
$sub_mask_chk2.Location= "10,62"
$sub_mask_chk2.CheckState= "Checked"

$sub_mask_chk2.Add_Click({

	$script:key["mask"]= Mask_sw "2" $key["mask"]

	Stus_build
	Box_read

	if($sb_alg.Visible){
		All_chg
	}
})

$sub_mask_chk3= New-Object System.Windows.Forms.CheckBox
$sub_mask_chk3.Text= "Op.4"
$sub_mask_chk3.Size= "60,20"
$sub_mask_chk3.Location= "10,82"
$sub_mask_chk3.CheckState= "Checked"

$sub_mask_chk3.Add_Click({

	$script:key["mask"]= Mask_sw "3" $key["mask"]

	Stus_build
	Box_read

	if($sb_alg.Visible){
		All_chg
	}
})
  
$sub_ssg_grp= New-Object System.Windows.Forms.GroupBox 
$sub_ssg_grp.Text= "SSG-EG"
$sub_ssg_grp.Size= "135,125" # 215,95"
$sub_ssg_grp.Location= "110,3"
	 
$sub_ssg_comb= New-Object System.Windows.Forms.Combobox 
$sub_ssg_comb.Size= "64,20"
$sub_ssg_comb.Location= "65,24"
$sub_ssg_comb.FlatStyle= "Popup"

[void]$sub_ssg_comb.Items.AddRange(@('Thru','0','8','9','10','11','12','13','14','15'))
$sub_ssg_comb.DropDownStyle= "DropDownList"
$sub_ssg_comb.SelectedIndex= 0

$sub_ssg_comb.Add_SelectedValueChanged({
 try{
	$script:key["eg_type"]= $this.SelectedItem

	Box_read

	if($sb_alg.Visible){
		All_chg
	}
 }catch{
	echo $_.exception
 }
})
 
$sub_ssg_label2= New-Object System.Windows.Forms.Label 
$sub_ssg_label2.Location= "65,62"
$sub_ssg_label2.Size= "64,20"
$sub_ssg_label2.TextAlign= "BottomLeft"
$sub_ssg_label2.Text= "4.8s later"
 
$sub_ssg_label= New-Object System.Windows.Forms.Label 
$sub_ssg_label.Location= "65,82"
$sub_ssg_label.Size= "64,20"
$sub_ssg_label.TextAlign= "BottomLeft"
$sub_ssg_label.Text= "OPNonly"
 
$sub_ssg_chk0= New-Object System.Windows.Forms.CheckBox 
$sub_ssg_chk0.Text= "Op.1"
$sub_ssg_chk0.Size= "60,20"
$sub_ssg_chk0.Location= "10,22"
$sub_ssg_chk0.CheckState= "Unchecked"

$sub_ssg_chk0.Add_Click({
 try{
	$script:key["ssg"]= Mask_sw "0" $key["ssg"]

	Box_read

	if($sb_alg.Visible){
		All_chg
	}
 }catch{
	echo $_.exception
 }
})

$sub_ssg_chk1= New-Object System.Windows.Forms.CheckBox
$sub_ssg_chk1.Text= "Op.2"
$sub_ssg_chk1.Size= "60,20"
$sub_ssg_chk1.Location= "10,42"
$sub_ssg_chk1.CheckState= "Unchecked"

$sub_ssg_chk1.Add_Click({
 try{
	$script:key["ssg"]= Mask_sw "1" $key["ssg"]

	Box_read

	if($sb_alg.Visible){
		All_chg
	}
 }catch{
	echo $_.exception
 }
})

$sub_ssg_chk2= New-Object System.Windows.Forms.CheckBox
$sub_ssg_chk2.Text= "Op.3"
$sub_ssg_chk2.Size= "60,20"
$sub_ssg_chk2.Location= "10,62"
$sub_ssg_chk2.CheckState= "Unchecked"

$sub_ssg_chk2.Add_Click({
 try{
	$script:key["ssg"]= Mask_sw "2" $key["ssg"]

	Box_read

	if($sb_alg.Visible){
		All_chg
	}
 }catch{
	echo $_.exception
 }
})

$sub_ssg_chk3= New-Object System.Windows.Forms.CheckBox
$sub_ssg_chk3.Text= "Op.4"
$sub_ssg_chk3.Size= "60,20"
$sub_ssg_chk3.Location= "10,82"
$sub_ssg_chk3.CheckState= "Unchecked"

$sub_ssg_chk3.Add_Click({
 try{
	$script:key["ssg"]= Mask_sw "3" $key["ssg"]

	Box_read

	if($sb_alg.Visible){
		All_chg
	}
 }catch{
	echo $_.exception
 }
})
  
$sub_mask_grp.Controls.AddRange(@($sub_mask_chk0,$sub_mask_chk1,$sub_mask_chk2,$sub_mask_chk3)) 
$sub_ssg_grp.Controls.AddRange(@($sub_ssg_label2,$sub_ssg_label,$sub_ssg_comb,$sub_ssg_chk0,$sub_ssg_chk1,$sub_ssg_chk2,$sub_ssg_chk3))

$sub_mask.Controls.AddRange(@($sub_mask_grp,$sub_ssg_grp))
  
# Sav forms 
	
$sub_sav_grp= New-Object System.Windows.Forms.GroupBox 
# $sub_sav_grp.Text= "Save Name"
$sub_sav_grp.Size= "242,82"
$sub_sav_grp.Location= "10,5"
 
$sub_sav_label= New-Object System.Windows.Forms.Label 
$sub_sav_label.Location= "10,20"
$sub_sav_label.Size= "100,20"
$sub_sav_label.TextAlign= "BottomLeft"
$sub_sav_label.Text= "Save Name"
 
$sub_sav_box= New-Object System.Windows.Forms.TextBox 
$sub_sav_box.Location= "10,45"
$sub_sav_box.Size= "220,25"
$sub_sav_box.BorderStyle= "FixedSingle"
$sub_sav_box.Text= ""
$sub_sav_box.Multiline= "False"
$sub_sav_box.ImeMode= "Disable"
 
$sub_sav_ok_Btn= New-Object System.Windows.Forms.Button 
$sub_sav_ok_Btn.Location= "65,95"
$sub_sav_ok_Btn.Size= "90,30"
$sub_sav_ok_Btn.Text= "OK"
$sub_sav_ok_Btn.DialogResult= "OK"
# $sub_sav_ok_Btn.Flatstyle= "Popup"

$sub_sav_ok_Btn.Add_Click({

	$sub_sav.Close() # -> $retn
})
 
$sub_sav_cancel_Btn= New-Object System.Windows.Forms.Button 
$sub_sav_cancel_Btn.Location= "160,95"
$sub_sav_cancel_Btn.Size= "90,30"
$sub_sav_cancel_Btn.Text= "Cancel"
$sub_sav_cancel_Btn.DialogResult= "Cancel"
# $sub_sav_cancel_Btn.Flatstyle= "Popup"

$sub_sav_cancel_Btn.Add_Click({

	$sub_sav.Close() # -> $retn
})
 
$sub_sav= New-Object System.Windows.Forms.Form 
$sub_sav.Text= "Save"
$sub_sav.Size= "272,172"
$sub_sav.Location= "500,0"
$sub_sav.FormBorderStyle= "FixedSingle"
$sub_sav.StartPosition= "WindowsDefaultLocation"
$sub_sav.Icon= Icon_read "..\fm_editor.exe"
$sub_sav.MinimizeBox= $False
$sub_sav.MaximizeBox= $False

$sub_sav.TopLevel= $True
$sub_sav.Owner= $frm_fm

$sub_sav.Add_Shown({

	$sub_sav_box.Select() # forcus
})

#$sub_sav.Add_FormClosing({
#})
 
$sub_sav_grp.Controls.AddRange(@($sub_sav_label,$sub_sav_box)) 
$sub_sav.Controls.AddRange(@($sub_sav_grp,$sub_sav_ok_Btn,$sub_sav_cancel_Btn))

$sub_sav.CancelButton= $sub_sav_cancel_Btn	# [ESC]
$sub_sav.AcceptButton= $sub_sav_ok_Btn	# [Enter]
  
# Main forms 
	 
# BUFFER 
	
[int[]]$IMG_buf= @(480, 480) # バッファサイズ 
[int[]]$Size_buf= @(($IMG_buf[0]+ 2), ($IMG_buf[1]+ 2))
$Rect_buf= New-Object System.Drawing.Rectangle(0,0, $IMG_buf[0],$IMG_buf[1])

$image_buf= New-Object System.Drawing.Bitmap($IMG_buf) # 書き込む場所
$Graphics_buf= [System.Drawing.Graphics]::FromImage($image_buf)

# $Graphics_buf.CompositingQuality= "HighQuality"
# $Graphics_buf.SmoothingMode= "HighQuality"
# $Graphics_buf.PixelOffsetMode= "HighQuality"

# $Pictbox_buf= New-Object System.Windows.Forms.PictureBox # 描画領域
# $Pictbox_buf.ClientSize= $image_buf.Size
# $Pictbox_buf.Image= $image_buf
# $Pictbox_buf.Location= @(-10, 115) -join ","
# $Pictbox_buf.BackColor= $red

$Contxtbuf= [System.Drawing.BufferedGraphicsManager]::Current # ダブルバッファ
$Contxtbuf.MaximumBuffer= $Size_buf -join "," # string出力
$Horizonbuff= $Contxtbuf.Allocate($Graphics_buf, $Rect_buf)

# $Horizonbuff= $Contxtb.Allocate($Graphics_buf, $Pictbox_buf.ClientRectangle)
  
# Pictbox 
	 
[bool] $script:mouser_capure= $False 
[int] $script:starter_value= 0
$script:topper_pos= New-Object System.Drawing.Point
 
[int[]]$IMGviii= @(80, 80) 
[int[]]$IMGvi= @(60, 60)
# [int[]]$IMGxii= @(120, 120)
 
# ------ 
 
$imageAR= New-Object System.Drawing.Bitmap($IMGvi) 
$graphicsAR= [System.Drawing.Graphics]::FromImage($imageAR)# 書き込む場所

$PictboxAR= New-Object System.Windows.Forms.PictureBox # 描画領域
$PictboxAR.ClientSize= $imageAR.Size
$PictboxAR.Image= $imageAR
$PictboxAR.Location= @(10, 60) -join ","

$PictboxAR.Add_MouseUp({
 try{
	Mouse_druger "Up"
 }catch{
	echo $_.exception
 }
})
$PictboxAR.Add_MouseMove({
 try{
	Mouse_druger "Move" "AR"
 }catch{
	echo $_.exception
 }
})
$PictboxAR.Add_MouseDown({
 try{
	Mouse_druger "Down" "AR" $_
 }catch{
	echo $_.exception
 }
})
$PictboxAR.Add_MouseWheel({
 try{
	Mouse_druger "Wheel" "AR" $_
 }catch{
	echo $_.exception
 }
})
$PictboxAR.Add_MouseHover({
 try{
	Mouse_druger "Hover" "AR"
 }catch{
	echo $_.exception
 }
})
$PictboxAR.Add_MouseLeave({
 try{
	Mouse_druger "Leave" "AR"
 }catch{
	echo $_.exception
 }
})
 
$imageDR= New-Object System.Drawing.Bitmap($IMGvi) 
$graphicsDR= [System.Drawing.Graphics]::FromImage($imageDR)# 書き込む場所

$PictboxDR= New-Object System.Windows.Forms.PictureBox # 描画領域
$PictboxDR.ClientSize= $imageDR.Size
$PictboxDR.Image= $imageDR
$PictboxDR.Location= @(70, 60) -join ","

$PictboxDR.Add_MouseUp({
 try{
	Mouse_druger "Up"
 }catch{
	echo $_.exception
 }
})
$PictboxDR.Add_MouseMove({
 try{
	Mouse_druger "Move" "DR"
 }catch{
	echo $_.exception
 }
})
$PictboxDR.Add_MouseDown({
 try{
	Mouse_druger "Down" "DR" $_
 }catch{
	echo $_.exception
 }
})
$PictboxDR.Add_MouseWheel({
 try{
	Mouse_druger "Wheel" "DR" $_
 }catch{
	echo $_.exception
 }
})
$PictboxDR.Add_MouseHover({
 try{
	Mouse_druger "Hover" "DR"
 }catch{
	echo $_.exception
 }
})
$PictboxDR.Add_MouseLeave({
 try{
	Mouse_druger "Leave" "DR"
 }catch{
	echo $_.exception
 }
})
 
$imageSR= New-Object System.Drawing.Bitmap($IMGvi) 
$graphicsSR= [System.Drawing.Graphics]::FromImage($imageSR)# 書き込む場所

$PictboxSR= New-Object System.Windows.Forms.PictureBox # 描画領域
$PictboxSR.ClientSize= $imageSR.Size
$PictboxSR.Image= $imageSR
$PictboxSR.Location= @(130, 60) -join ","

$PictboxSR.Add_MouseUp({
 try{
	Mouse_druger "Up"
 }catch{
	echo $_.exception
 }
})
$PictboxSR.Add_MouseMove({
 try{
	Mouse_druger "Move" "SR"
 }catch{
	echo $_.exception
 }
})
$PictboxSR.Add_MouseDown({
 try{
	Mouse_druger "Down" "SR" $_
 }catch{
	echo $_.exception
 }
})
$PictboxSR.Add_MouseWheel({
 try{
	Mouse_druger "Wheel" "SR" $_
 }catch{
	echo $_.exception
 }
})
$PictboxSR.Add_MouseHover({
 try{
	Mouse_druger "Hover" "SR"
 }catch{
	echo $_.exception
 }
})
$PictboxSR.Add_MouseLeave({
 try{
	Mouse_druger "Leave" "SR"
 }catch{
	echo $_.exception
 }
})
 
$imageRR= New-Object System.Drawing.Bitmap($IMGvi) 
$graphicsRR= [System.Drawing.Graphics]::FromImage($imageRR)# 書き込む場所

$PictboxRR= New-Object System.Windows.Forms.PictureBox # 描画領域
$PictboxRR.ClientSize= $imageRR.Size
$PictboxRR.Image= $imageRR
$PictboxRR.Location= @(190, 60) -join ","

$PictboxRR.Add_MouseUp({
 try{
	Mouse_druger "Up"
 }catch{
	echo $_.exception
 }
})
$PictboxRR.Add_MouseMove({
 try{
	Mouse_druger "Move" "RR"
 }catch{
	echo $_.exception
 }
})
$PictboxRR.Add_MouseDown({
 try{
	Mouse_druger "Down" "RR" $_
 }catch{
	echo $_.exception
 }
})
$PictboxRR.Add_MouseWheel({
 try{
	Mouse_druger "Wheel" "RR" $_
 }catch{
	echo $_.exception
 }
})
$PictboxRR.Add_MouseHover({
 try{
	Mouse_druger "Hover" "RR"
 }catch{
	echo $_.exception
 }
})
$PictboxRR.Add_MouseLeave({
 try{
	Mouse_druger "Leave" "RR"
 }catch{
	echo $_.exception
 }
})
 
# ------ 
 
$imageSL= New-Object System.Drawing.Bitmap($IMGviii) 
$graphicsSL= [System.Drawing.Graphics]::FromImage($imageSL)# 書き込む場所

$PictboxSL= New-Object System.Windows.Forms.PictureBox # 描画領域
$PictboxSL.ClientSize= $imageSL.Size
$PictboxSL.Image= $imageSL
$PictboxSL.Location= @(90, 150) -join ","

$PictboxSL.Add_MouseUp({
 try{
	Mouse_druger "Up"
 }catch{
	echo $_.exception
 }
})
$PictboxSL.Add_MouseMove({
 try{
	Mouse_druger "Move" "SL"
 }catch{
	echo $_.exception
 }
})
$PictboxSL.Add_MouseDown({
 try{
	Mouse_druger "Down" "SL" $_
 }catch{
	echo $_.exception
 }
})
$PictboxSL.Add_MouseWheel({
 try{
	Mouse_druger "Wheel" "SL" $_
 }catch{
	echo $_.exception
 }
})
$PictboxSL.Add_MouseHover({
 try{
	Mouse_druger "Hover" "SL"
 }catch{
	echo $_.exception
 }
})
$PictboxSL.Add_MouseLeave({
 try{
	Mouse_druger "Leave" "SL"
 }catch{
	echo $_.exception
 }
})
 
# ------ 
 
$imageKSL= New-Object System.Drawing.Bitmap($IMGvi) 
$graphicsKSL= [System.Drawing.Graphics]::FromImage($imageKSL) # 書き込む場所

$PictboxKSL= New-Object System.Windows.Forms.PictureBox # 描画領域
$PictboxKSL.ClientSize= $imageKSL.Size
$PictboxKSL.Image= $imageKSL
$PictboxKSL.Location= @(40, 40) -join ","

$PictboxKSL.Add_MouseUp({
 try{
	Mouse_druger "Up"
 }catch{
	echo $_.exception
 }
})
$PictboxKSL.Add_MouseMove({
 try{
	Mouse_druger "Move" "KSL"
 }catch{
	echo $_.exception
 }
})
$PictboxKSL.Add_MouseDown({
 try{
	Mouse_druger "Down" "KSL" $_
 }catch{
	echo $_.exception
 }
})
$PictboxKSL.Add_MouseWheel({
 try{
	Mouse_druger "Wheel" "KSL" $_
 }catch{
	echo $_.exception
 }
})
$PictboxKSL.Add_MouseHover({
 try{
	Mouse_druger "Hover" "KSL"
 }catch{
	echo $_.exception
 }
})
$PictboxKSL.Add_MouseLeave({
 try{
	Mouse_druger "Leave" "KSL"
 }catch{
	echo $_.exception
 }
})
 
$imageKSR= New-Object System.Drawing.Bitmap($IMGvi) 
$graphicsKSR= [System.Drawing.Graphics]::FromImage($imageKSR) # 書き込む場所

$PictboxKSR= New-Object System.Windows.Forms.PictureBox # 描画領域
$PictboxKSR.ClientSize= $imageKSR.Size
$PictboxKSR.Image= $imageKSR
$PictboxKSR.Location= @(160, 40) -join ","

$PictboxKSR.Add_MouseUp({
 try{
	Mouse_druger "Up"
 }catch{
	echo $_.exception
 }
})
$PictboxKSR.Add_MouseMove({
 try{
	Mouse_druger "Move" "KSR"
 }catch{
	echo $_.exception
 }
})
$PictboxKSR.Add_MouseDown({
 try{
	Mouse_druger "Down" "KSR" $_
 }catch{
	echo $_.exception
 }
})
$PictboxKSR.Add_MouseWheel({
 try{
	Mouse_druger "Wheel" "KSR" $_
 }catch{
	echo $_.exception
 }
})
$PictboxKSR.Add_MouseHover({
 try{
	Mouse_druger "Hover" "KSR"
 }catch{
	echo $_.exception
 }
})
$PictboxKSR.Add_MouseLeave({
 try{
	Mouse_druger "Leave" "KSR"
 }catch{
	echo $_.exception
 }
})
 
# ------ 
 
$imageDT= New-Object System.Drawing.Bitmap($IMGvi) 
$graphicsDT= [System.Drawing.Graphics]::FromImage($imageDT)# 書き込む場所

$PictboxDT= New-Object System.Windows.Forms.PictureBox # 描画領域
$PictboxDT.ClientSize= $imageDT.Size
$PictboxDT.Image= $imageDT
$PictboxDT.Location= @(10, 60) -join ","

$PictboxDT.Add_MouseUp({
 try{
	Mouse_druger "Up"
 }catch{
	echo $_.exception
 }
})
$PictboxDT.Add_MouseMove({
 try{
	Mouse_druger "Move" "DT"
 }catch{
	echo $_.exception
 }
})
$PictboxDT.Add_MouseDown({
 try{
	Mouse_druger "Down" "DT" $_
 }catch{
	echo $_.exception
 }
})
$PictboxDT.Add_MouseWheel({
 try{
	Mouse_druger "Wheel" "DT" $_
 }catch{
	echo $_.exception
 }
})
$PictboxDT.Add_MouseHover({
 try{
	Mouse_druger "Hover" "DT"
 }catch{
	echo $_.exception
 }
})
$PictboxDT.Add_MouseLeave({
 try{
	Mouse_druger "Leave" "DT"
 }catch{
	echo $_.exception
 }
})
 
$imageEG= New-Object System.Drawing.Bitmap($IMGvi) 
$graphicsEG= [System.Drawing.Graphics]::FromImage($imageEG)# 書き込む場所

$PictboxEG= New-Object System.Windows.Forms.PictureBox # 描画領域
$PictboxEG.ClientSize= $imageEG.Size
$PictboxEG.Image= $imageEG
$PictboxEG.Location= @(70, 60) -join ","

$PictboxEG.Add_MouseUp({
 try{
	Mouse_druger "Up"
 }catch{
	echo $_.exception
 }
})
$PictboxEG.Add_MouseMove({
 try{
	Mouse_druger "Move" "EG"
 }catch{
	echo $_.exception
 }
})
$PictboxEG.Add_MouseDown({
 try{
	Mouse_druger "Down" "EG" $_
 }catch{
	echo $_.exception
 }
})
$PictboxEG.Add_MouseWheel({
 try{
	Mouse_druger "Wheel" "EG" $_
 }catch{
	echo $_.exception
 }
})
$PictboxEG.Add_MouseHover({
 try{
	Mouse_druger "Hover" "EG"
 }catch{
	echo $_.exception
 }
})
$PictboxEG.Add_MouseLeave({
 try{
	Mouse_druger "Leave" "EG"
 }catch{
	echo $_.exception
 }
})
 
$imageVIB= New-Object System.Drawing.Bitmap($IMGvi) 
$graphicsVIB= [System.Drawing.Graphics]::FromImage($imageVIB)# 書き込む場所

$PictboxVIB= New-Object System.Windows.Forms.PictureBox # 描画領域
$PictboxVIB.ClientSize= $imageVIB.Size
$PictboxVIB.Image= $imageVIB
$PictboxVIB.Location= @(130, 60) -join ","

$PictboxVIB.Add_MouseUp({
 try{
	Mouse_druger "Up"
 }catch{
	echo $_.exception
 }
})
$PictboxVIB.Add_MouseMove({
 try{
	Mouse_druger "Move" "VIB"
 }catch{
	echo $_.exception
 }
})
$PictboxVIB.Add_MouseDown({
 try{
	Mouse_druger "Down" "VIB" $_
 }catch{
	echo $_.exception
 }
})
$PictboxVIB.Add_MouseWheel({
 try{
	Mouse_druger "Wheel" "VIB" $_
 }catch{
	echo $_.exception
 }
})
$PictboxVIB.Add_MouseHover({
 try{
	Mouse_druger "Hover" "VIB"
 }catch{
	echo $_.exception
 }
})
$PictboxVIB.Add_MouseLeave({
 try{
	Mouse_druger "Leave" "VIB"
 }catch{
	echo $_.exception
 }
})
 
$imageAM= New-Object System.Drawing.Bitmap($IMGvi) 
$graphicsAM= [System.Drawing.Graphics]::FromImage($imageAM)# 書き込む場所

$PictboxAM= New-Object System.Windows.Forms.PictureBox # 描画領域
$PictboxAM.ClientSize= $imageAM.Size
$PictboxAM.Image= $imageAM
$PictboxAM.Location= @(190, 60) -join ","

$PictboxAM.Add_MouseUp({
 try{
	Mouse_druger "Up"
 }catch{
	echo $_.exception
 }
})
$PictboxAM.Add_MouseMove({
 try{
	Mouse_druger "Move" "AM"
 }catch{
	echo $_.exception
 }
})
$PictboxAM.Add_MouseDown({
 try{
	Mouse_druger "Down" "AM" $_
 }catch{
	echo $_.exception
 }
})
$PictboxAM.Add_MouseWheel({
 try{
	Mouse_druger "Wheel" "AM" $_
 }catch{
	echo $_.exception
 }
})
$PictboxAM.Add_MouseHover({
 try{
	Mouse_druger "Hover" "AM"
 }catch{
	echo $_.exception
 }
})
$PictboxAM.Add_MouseLeave({
 try{
	Mouse_druger "Leave" "AM"
 }catch{
	echo $_.exception
 }
})
 
# ------ 
 
$imageKS= New-Object System.Drawing.Bitmap($IMGvi) 
$graphicsKS= [System.Drawing.Graphics]::FromImage($imageKS)# 書き込む場所

$PictboxKS= New-Object System.Windows.Forms.PictureBox # 描画領域
$PictboxKS.ClientSize= $imageKS.Size
$PictboxKS.Image= $imageKS
$PictboxKS.Location= @(10, 60) -join ","

$PictboxKS.Add_MouseUp({
 try{
	Mouse_druger "Up"
 }catch{
	echo $_.exception
 }
})
$PictboxKS.Add_MouseMove({
 try{
	Mouse_druger "Move" "KS"
 }catch{
	echo $_.exception
 }
})
$PictboxKS.Add_MouseDown({
 try{
	Mouse_druger "Down" "KS" $_
 }catch{
	echo $_.exception
 }
})
$PictboxKS.Add_MouseWheel({
 try{
	Mouse_druger "Wheel" "KS" $_
 }catch{
	echo $_.exception
 }
})
$PictboxKS.Add_MouseHover({
 try{
	Mouse_druger "Hover" "KS"
 }catch{
	echo $_.exception
 }
})
$PictboxKS.Add_MouseLeave({
 try{
	Mouse_druger "Leave" "KS"
 }catch{
	echo $_.exception
 }
})
 
$imageDT1= New-Object System.Drawing.Bitmap($IMGvi) 
$graphicsDT1= [System.Drawing.Graphics]::FromImage($imageDT1)# 書き込む場所

$PictboxDT1= New-Object System.Windows.Forms.PictureBox # 描画領域
$PictboxDT1.ClientSize= $imageDT1.Size
$PictboxDT1.Image= $imageDT1
$PictboxDT1.Location= @(70, 60) -join ","

$PictboxDT1.Add_MouseUp({
 try{
	Mouse_druger "Up"
 }catch{
	echo $_.exception
 }
})
$PictboxDT1.Add_MouseMove({
 try{
	Mouse_druger "Move" "DT1"
 }catch{
	echo $_.exception
 }
})
$PictboxDT1.Add_MouseDown({
 try{
	Mouse_druger "Down" "DT1" $_
 }catch{
	echo $_.exception
 }
})
$PictboxDT1.Add_MouseWheel({
 try{
	Mouse_druger "Wheel" "DT1" $_
 }catch{
	echo $_.exception
 }
})
$PictboxDT1.Add_MouseHover({
 try{
	Mouse_druger "Hover" "DT1"
 }catch{
	echo $_.exception
 }
})
$PictboxDT1.Add_MouseLeave({
 try{
	Mouse_druger "Leave" "DT1"
 }catch{
	echo $_.exception
 }
})
 
$imageDT2= New-Object System.Drawing.Bitmap($IMGvi) 
$graphicsDT2= [System.Drawing.Graphics]::FromImage($imageDT2)# 書き込む場所

$PictboxDT2= New-Object System.Windows.Forms.PictureBox # 描画領域
$PictboxDT2.ClientSize= $imageDT2.Size
$PictboxDT2.Image= $imageDT2
$PictboxDT2.Location= @(130, 60) -join ","

$PictboxDT2.Add_MouseUp({
 try{
	Mouse_druger "Up"
 }catch{
	echo $_.exception
 }
})
$PictboxDT2.Add_MouseMove({
 try{
	Mouse_druger "Move" "DT2"
 }catch{
	echo $_.exception
 }
})
$PictboxDT2.Add_MouseDown({
 try{
	Mouse_druger "Down" "DT2" $_
 }catch{
	echo $_.exception
 }
})
$PictboxDT2.Add_MouseWheel({
 try{
	Mouse_druger "Wheel" "DT2" $_
 }catch{
	echo $_.exception
 }
})
$PictboxDT2.Add_MouseHover({
 try{
	Mouse_druger "Hover" "DT2"
 }catch{
	echo $_.exception
 }
})
$PictboxDT2.Add_MouseLeave({
 try{
	Mouse_druger "Leave" "DT2"
 }catch{
	echo $_.exception
 }
})
 
$imageAMS= New-Object System.Drawing.Bitmap($IMGvi) 
$graphicsAMS= [System.Drawing.Graphics]::FromImage($imageAMS)# 書き込む場所

$PictboxAMS= New-Object System.Windows.Forms.PictureBox # 描画領域
$PictboxAMS.ClientSize= $imageAMS.Size
$PictboxAMS.Image= $imageAMS
$PictboxAMS.Location= @(190, 60) -join ","

$PictboxAMS.Add_MouseUp({
 try{
	Mouse_druger "Up"
 }catch{
	echo $_.exception
 }
})
$PictboxAMS.Add_MouseMove({
 try{
	Mouse_druger "Move" "AMS"
 }catch{
	echo $_.exception
 }
})
$PictboxAMS.Add_MouseDown({
 try{
	Mouse_druger "Down" "AMS" $_
 }catch{
	echo $_.exception
 }
})
$PictboxAMS.Add_MouseWheel({
 try{
	Mouse_druger "Wheel" "AMS" $_
 }catch{
	echo $_.exception
 }
})
$PictboxAMS.Add_MouseHover({
 try{
	Mouse_druger "Hover" "AMS"
 }catch{
	echo $_.exception
 }
})
$PictboxAMS.Add_MouseLeave({
 try{
	Mouse_druger "Leave" "AMS"
 }catch{
	echo $_.exception
 }
})
 
# ------ 
 
$imageTL= New-Object System.Drawing.Bitmap($IMGviii) 
$graphicsTL= [System.Drawing.Graphics]::FromImage($imageTL)# 書き込む場所

$PictboxTL= New-Object System.Windows.Forms.PictureBox # 描画領域
$PictboxTL.ClientSize= $imageTL.Size
$PictboxTL.Image= $imageTL
$PictboxTL.Location= @(30, 40) -join ","

$PictboxTL.Add_MouseUp({
 try{
	Mouse_druger "Up"
 }catch{
	echo $_.exception
 }
})
$PictboxTL.Add_MouseMove({
 try{
	Mouse_druger "Move" "TL"
 }catch{
	echo $_.exception
 }
})
$PictboxTL.Add_MouseDown({
 try{
	Mouse_druger "Down" "TL" $_
 }catch{
	echo $_.exception
 }
})
$PictboxTL.Add_MouseWheel({
 try{
	Mouse_druger "Wheel" "TL" $_
 }catch{
	echo $_.exception
 }
})
$PictboxTL.Add_MouseHover({
 try{
	Mouse_druger "Hover" "TL"
 }catch{
	echo $_.exception
 }
})
$PictboxTL.Add_MouseLeave({
 try{
	Mouse_druger "Leave" "TL"
 }catch{
	echo $_.exception
 }
})
 
$imageML= New-Object System.Drawing.Bitmap($IMGviii) 
$graphicsML= [System.Drawing.Graphics]::FromImage($imageML)# 書き込む場所

$PictboxML= New-Object System.Windows.Forms.PictureBox # 描画領域
$PictboxML.ClientSize= $imageML.Size
$PictboxML.Image= $imageML
$PictboxML.Location= @(150, 40) -join ","

$PictboxML.Add_MouseUp({
 try{
	Mouse_druger "Up"
 }catch{
	echo $_.exception
 }
})
$PictboxML.Add_MouseMove({
 try{
	Mouse_druger "Move" "ML"
 }catch{
	echo $_.exception
 }
})
$PictboxML.Add_MouseDown({
 try{
	Mouse_druger "Down" "ML" $_
 }catch{
	echo $_.exception
 }
})
$PictboxML.Add_MouseWheel({
 try{
	Mouse_druger "Wheel" "ML" $_
 }catch{
	echo $_.exception
 }
})
$PictboxML.Add_MouseHover({
 try{
	Mouse_druger "Hover" "ML"
 }catch{
	echo $_.exception
 }
})
$PictboxML.Add_MouseLeave({
 try{
	Mouse_druger "Leave" "ML"
 }catch{
	echo $_.exception
 }
})
 
# ------ 
 
$imageALG= New-Object System.Drawing.Bitmap($IMGviii) 
$graphicsALG= [System.Drawing.Graphics]::FromImage($imageALG)# 書き込む場所

$PictboxALG= New-Object System.Windows.Forms.PictureBox # 描画領域
$PictboxALG.ClientSize= $imageALG.Size
$PictboxALG.Image= $imageALG
$PictboxALG.Location= @(30, 40) -join ","

$PictboxALG.Add_MouseUp({
 try{
	Mouse_druger "Up"
 }catch{
	echo $_.exception
 }
})
$PictboxALG.Add_MouseMove({
 try{
	Mouse_druger "Move" "ALG"
 }catch{
	echo $_.exception
 }
})
$PictboxALG.Add_MouseDown({
 try{
	Mouse_druger "Down" "ALG" $_
 }catch{
	echo $_.exception
 }
})
$PictboxALG.Add_MouseWheel({
 try{
	Mouse_druger "Wheel" "ALG" $_
 }catch{
	echo $_.exception
 }
})
$PictboxALG.Add_MouseHover({
 try{
	Mouse_druger "Hover" "ALG"
 }catch{
	echo $_.exception
 }
})
$PictboxALG.Add_MouseLeave({
 try{
	Mouse_druger "Leave" "ALG"
 }catch{
	echo $_.exception
 }
})
 
$imageFB= New-Object System.Drawing.Bitmap($IMGviii) 
$graphicsFB= [System.Drawing.Graphics]::FromImage($imageFB)# 書き込む場所

$PictboxFB= New-Object System.Windows.Forms.PictureBox # 描画領域
$PictboxFB.ClientSize= $imageFB.Size
$PictboxFB.Image= $imageFB
$PictboxFB.Location= @(150, 40) -join ","

$PictboxFB.Add_MouseUp({
 try{
	Mouse_druger "Up"
 }catch{
	echo $_.exception
 }
})
$PictboxFB.Add_MouseMove({
 try{
	Mouse_druger "Move" "FB"
 }catch{
	echo $_.exception
 }
})
$PictboxFB.Add_MouseDown({
 try{
	Mouse_druger "Down" "FB" $_
 }catch{
	echo $_.exception
 }
})
$PictboxFB.Add_MouseWheel({
 try{
	Mouse_druger "Wheel" "FB" $_
 }catch{
	echo $_.exception
 }
})
$PictboxFB.Add_MouseHover({
 try{
	Mouse_druger "Hover" "FB"
 }catch{
	echo $_.exception
 }
})
$PictboxFB.Add_MouseLeave({
 try{
	Mouse_druger "Leave" "FB"
 }catch{
	echo $_.exception
 }
})
  
# Group 
	
$eg_grp= New-Object System.Windows.Forms.GroupBox 
$eg_grp.Location= "10, 30"
$eg_grp.Size= "255, 130" # 4op "255, 210"
$eg_grp.Text= "Envelope Rate"
$eg_grp.FlatStyle= "Flat"
$eg_grp.ForeColor= "gray"
$eg_grp.Font= $FonLabel
	
# ------ AR - AttackRate 15-0 2op /  31-0 4op 
	
$lbl_ar= New-Object System.Windows.Forms.Label 
$lbl_ar.Location= "10,20"
$lbl_ar.Size= "60,40"
$lbl_ar.Text= "Attack"
$lbl_ar.TextAlign= "BottomCenter"

 
$vrc_nmud_ar= New-Object System.Windows.Forms.NumericUpDown 
$vrc_nmud_ar.location= "10,20"
$vrc_nmud_ar.Size= "55,20"
$vrc_nmud_ar.TextAlign= "Right"
$vrc_nmud_ar.UpDownAlign= "Right"
$vrc_nmud_ar.BorderStyle= "FixedSingle"
$vrc_nmud_ar.Minimum= "0"
$vrc_nmud_ar.Maximum= "15"

$vrc_nmud_ar.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "AR" $True
	$script:vrc_svn[(Idx)][2]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opl_nmud_ar= New-Object System.Windows.Forms.NumericUpDown 
$opl_nmud_ar.location= "10,20"
$opl_nmud_ar.Size= "55,20"
$opl_nmud_ar.TextAlign= "Right"
$opl_nmud_ar.UpDownAlign= "Right"
$opl_nmud_ar.BorderStyle= "FixedSingle"
$opl_nmud_ar.Minimum= "0"
$opl_nmud_ar.Maximum= "15"

$opl_nmud_ar.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "AR" $True
	$script:opl_two[(Idx)][2]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opn_nmud_ar= New-Object System.Windows.Forms.NumericUpDown 
$opn_nmud_ar.location= "10,20"
$opn_nmud_ar.Size= "55,20"
$opn_nmud_ar.TextAlign= "Right"
$opn_nmud_ar.UpDownAlign= "Right"
$opn_nmud_ar.BorderStyle= "FixedSingle"
$opn_nmud_ar.Minimum= "0"
$opn_nmud_ar.Maximum= "31"

$opn_nmud_ar.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "AR" $True
	$script:opn_fur[(Idx)][2]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opm_nmud_ar= New-Object System.Windows.Forms.NumericUpDown 
$opm_nmud_ar.location= "10,20"
$opm_nmud_ar.Size= "55,20"
$opm_nmud_ar.TextAlign= "Right"
$opm_nmud_ar.UpDownAlign= "Right"
$opm_nmud_ar.BorderStyle= "FixedSingle"
$opm_nmud_ar.Minimum= "0"
$opm_nmud_ar.Maximum= "31"

$opm_nmud_ar.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "AR" $True
	$script:opm_fur[(Idx)][2]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
  
# ------ DR - DecayRate 0-15 2op / 0-31 4op 
	
$lbl_dr= New-Object System.Windows.Forms.Label 
$lbl_dr.Location= "70,20"
$lbl_dr.Size= "60,40"
$lbl_dr.Text= "Decay"
$lbl_dr.TextAlign= "BottomCenter"

 
$vrc_nmud_dr= New-Object System.Windows.Forms.NumericUpDown 
$vrc_nmud_dr.location= "70,20"
$vrc_nmud_dr.Size= "55,20"
$vrc_nmud_dr.TextAlign= "Right"
$vrc_nmud_dr.UpDownAlign= "Right"
$vrc_nmud_dr.BorderStyle= "FixedSingle"
$vrc_nmud_dr.Minimum= "0"
$vrc_nmud_dr.Maximum= "15"

$vrc_nmud_dr.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "DR" $True
	$script:vrc_svn[(Idx)][3]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opl_nmud_dr= New-Object System.Windows.Forms.NumericUpDown 
$opl_nmud_dr.location= "70,20"
$opl_nmud_dr.Size= "55,20"
$opl_nmud_dr.TextAlign= "Right"
$opl_nmud_dr.UpDownAlign= "Right"
$opl_nmud_dr.BorderStyle= "FixedSingle"
$opl_nmud_dr.Minimum= "0"
$opl_nmud_dr.Maximum= "15"

$opl_nmud_dr.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "DR" $True
	$script:opl_two[(Idx)][3]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opn_nmud_dr= New-Object System.Windows.Forms.NumericUpDown 
$opn_nmud_dr.location= "70,20"
$opn_nmud_dr.Size= "55,20"
$opn_nmud_dr.TextAlign= "Right"
$opn_nmud_dr.UpDownAlign= "Right"
$opn_nmud_dr.BorderStyle= "FixedSingle"
$opn_nmud_dr.Minimum= "0"
$opn_nmud_dr.Maximum= "31"

$opn_nmud_dr.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "DR" $True
	$script:opn_fur[(Idx)][3]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opm_nmud_dr= New-Object System.Windows.Forms.NumericUpDown 
$opm_nmud_dr.location= "70,20"
$opm_nmud_dr.Size= "55,20"
$opm_nmud_dr.TextAlign= "Right"
$opm_nmud_dr.UpDownAlign= "Right"
$opm_nmud_dr.BorderStyle= "FixedSingle"
$opm_nmud_dr.Minimum= "0"
$opm_nmud_dr.Maximum= "31"

$opm_nmud_dr.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "DR" $True
	$script:opm_fur[(Idx)][3]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
  
# ------ SR - SustainRate 15-0 2op /  0-31 4op 
	
$lbl_sr= New-Object System.Windows.Forms.Label 
$lbl_sr.Location= "130,20"
$lbl_sr.Size= "60,40"
$lbl_sr.Text= "Sustain"
$lbl_sr.TextAlign= "BottomCenter"

 
$vrc_nmud_sr= New-Object System.Windows.Forms.NumericUpDown 
$vrc_nmud_sr.location= "190,20"
$vrc_nmud_sr.Size= "55,20"
$vrc_nmud_sr.TextAlign= "Right"
$vrc_nmud_sr.UpDownAlign= "Right"
$vrc_nmud_sr.BorderStyle= "FixedSingle"
$vrc_nmud_sr.Minimum= "0"
$vrc_nmud_sr.Maximum= "15"

$vrc_nmud_sr.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "SR" $True
	$script:vrc_svn[(Idx)][4]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opl_nmud_sr= New-Object System.Windows.Forms.NumericUpDown 
$opl_nmud_sr.location= "190,20"
$opl_nmud_sr.Size= "55,20"
$opl_nmud_sr.TextAlign= "Right"
$opl_nmud_sr.UpDownAlign= "Right"
$opl_nmud_sr.BorderStyle= "FixedSingle"
$opl_nmud_sr.Minimum= "0"
$opl_nmud_sr.Maximum= "15"

$opl_nmud_sr.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "SR" $True
	$script:opl_two[(Idx)][5]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opn_nmud_sr= New-Object System.Windows.Forms.NumericUpDown 
$opn_nmud_sr.location= "130,20"
$opn_nmud_sr.Size= "55,20"
$opn_nmud_sr.TextAlign= "Right"
$opn_nmud_sr.UpDownAlign= "Right"
$opn_nmud_sr.BorderStyle= "FixedSingle"
$opn_nmud_sr.Minimum= "0"
$opn_nmud_sr.Maximum= "31"

$opn_nmud_sr.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "SR" $True
	$script:opn_fur[(Idx)][4]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opm_nmud_sr= New-Object System.Windows.Forms.NumericUpDown 
$opm_nmud_sr.location= "130,20"
$opm_nmud_sr.Size= "55,20"
$opm_nmud_sr.TextAlign= "Right"
$opm_nmud_sr.UpDownAlign= "Right"
$opm_nmud_sr.BorderStyle= "FixedSingle"
$opm_nmud_sr.Minimum= "0"
$opm_nmud_sr.Maximum= "31"

$opm_nmud_sr.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "SR" $True
	$script:opm_fur[(Idx)][4]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
  
# ------ RR - ReleaseRate 0-15 
	
$lbl_rr= New-Object System.Windows.Forms.Label 
$lbl_rr.Location= "190,20"
$lbl_rr.Size= "60,40"
$lbl_rr.Text= "Release"
$lbl_rr.TextAlign= "BottomCenter"

 
$vrc_nmud_rr= New-Object System.Windows.Forms.NumericUpDown 
$vrc_nmud_rr.location= "130,20"
$vrc_nmud_rr.Size= "55,20"
$vrc_nmud_rr.TextAlign= "Right"
$vrc_nmud_rr.UpDownAlign= "Right"
$vrc_nmud_rr.BorderStyle= "FixedSingle"
$vrc_nmud_rr.Minimum= "0"
$vrc_nmud_rr.Maximum= "15"

$vrc_nmud_rr.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "RR" $True
	$script:vrc_svn[(Idx)][5]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opl_nmud_rr= New-Object System.Windows.Forms.NumericUpDown 
$opl_nmud_rr.location= "130,20"
$opl_nmud_rr.Size= "55,20"
$opl_nmud_rr.TextAlign= "Right"
$opl_nmud_rr.UpDownAlign= "Right"
$opl_nmud_rr.BorderStyle= "FixedSingle"
$opl_nmud_rr.Minimum= "0"
$opl_nmud_rr.Maximum= "15"

$opl_nmud_rr.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "RR" $True
	$script:opl_two[(Idx)][4]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opn_nmud_rr= New-Object System.Windows.Forms.NumericUpDown 
$opn_nmud_rr.location= "190,20"
$opn_nmud_rr.Size= "55,20"
$opn_nmud_rr.TextAlign= "Right"
$opn_nmud_rr.UpDownAlign= "Right"
$opn_nmud_rr.BorderStyle= "FixedSingle"
$opn_nmud_rr.Minimum= "0"
$opn_nmud_rr.Maximum= "15"

$opn_nmud_rr.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "RR" $True
	$script:opn_fur[(Idx)][5]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opm_nmud_rr= New-Object System.Windows.Forms.NumericUpDown 
$opm_nmud_rr.location= "190,20"
$opm_nmud_rr.Size= "55,20"
$opm_nmud_rr.TextAlign= "Right"
$opm_nmud_rr.UpDownAlign= "Right"
$opm_nmud_rr.BorderStyle= "FixedSingle"
$opm_nmud_rr.Minimum= "0"
$opm_nmud_rr.Maximum= "15"

$opm_nmud_rr.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "RR" $True
	$script:opm_fur[(Idx)][5]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
  
# ------ SL - SustainLevel 15-0 
	
$lbl_sl= New-Object System.Windows.Forms.Label 
$lbl_sl.Location= "70, 130"
$lbl_sl.Size= "120,20"
$lbl_sl.Text= "Sustain Level" # / 0max - 15min"
$lbl_sl.TextAlign= "BottomCenter"
# $lbl_sl.BackColor= "black"
 
$opn_nmud_sl= New-Object System.Windows.Forms.NumericUpDown 
$opn_nmud_sl.location= "190,15"
$opn_nmud_sl.Size= "55,20"
$opn_nmud_sl.TextAlign= "Right"
$opn_nmud_sl.UpDownAlign= "Right"
$opn_nmud_sl.BorderStyle= "FixedSingle"
$opn_nmud_sl.Minimum= "0"
$opn_nmud_sl.Maximum= "15"

$opn_nmud_sl.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "SL" $True
	$script:opn_fur[(Idx)][6]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opm_nmud_sl= New-Object System.Windows.Forms.NumericUpDown 
$opm_nmud_sl.location= "190,15"
$opm_nmud_sl.Size= "55,20"
$opm_nmud_sl.TextAlign= "Right"
$opm_nmud_sl.UpDownAlign= "Right"
$opm_nmud_sl.BorderStyle= "FixedSingle"
$opm_nmud_sl.Minimum= "0"
$opm_nmud_sl.Maximum= "15"

$opm_nmud_sl.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "SL" $True
	$script:opm_fur[(Idx)][6]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
   
$lev_grp= New-Object System.Windows.Forms.GroupBox 
$lev_grp.Location= "10, 160"
$lev_grp.Size= "255, 110"
$lev_grp.Text= "KeyScaling"
$lev_grp.FlatStyle= "Flat"
$lev_grp.ForeColor= "gray"
$lev_grp.Font= $FonLabel
# $lev_grp.Hide() # $lev_grp.Show()
	
# ------ KSL - KeyScaleLevel 0-3 
	
$lbl_ksl= New-Object System.Windows.Forms.Label 
$lbl_ksl.Location= "10, 20"
$lbl_ksl.Size= "120, 20"
$lbl_ksl.Text= "KSLevel"
$lbl_ksl.TextAlign= "BottomCenter"
# $lbl_ksl.BackColor= "black"
 
$vrc_nmud_ksl= New-Object System.Windows.Forms.NumericUpDown 
$vrc_nmud_ksl.location= "65,15"
$vrc_nmud_ksl.Size= "55,20"
$vrc_nmud_ksl.TextAlign= "Right"
$vrc_nmud_ksl.UpDownAlign= "Right"
$vrc_nmud_ksl.BorderStyle= "FixedSingle"
$vrc_nmud_ksl.Minimum= "0"
$vrc_nmud_ksl.Maximum= "3"
# $vrc_nmud_ksl.Value= $vrc_trkbar_ksl.Value

$vrc_nmud_ksl.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "KSL" $True
	$script:vrc_svn[(Idx)][6]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opl_nmud_ksl= New-Object System.Windows.Forms.NumericUpDown 
$opl_nmud_ksl.location= "65,15"
$opl_nmud_ksl.Size= "55,20"
$opl_nmud_ksl.TextAlign= "Right"
$opl_nmud_ksl.UpDownAlign= "Right"
$opl_nmud_ksl.BorderStyle= "FixedSingle"
$opl_nmud_ksl.Minimum= "0"
$opl_nmud_ksl.Maximum= "3"
# $opl_nmud_ksl.Value= $opl_trkbar_ksl.Value

$opl_nmud_ksl.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "KSL" $True
	$script:opl_two[(Idx)][7]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
  
# ------ KSR - KeyScaleRate 0-1 
	
$lbl_ksr= New-Object System.Windows.Forms.Label 
$lbl_ksr.Location= "130, 20"
$lbl_ksr.Size= "120, 20"
$lbl_ksr.Text= "KSRate"
$lbl_ksr.TextAlign= "BottomCenter"
 
$vrc_nmud_ksr= New-Object System.Windows.Forms.NumericUpDown 
$vrc_nmud_ksr.location= "190,15"
$vrc_nmud_ksr.Size= "55,20"
$vrc_nmud_ksr.TextAlign= "Right"
$vrc_nmud_ksr.UpDownAlign= "Right"
$vrc_nmud_ksr.BorderStyle= "FixedSingle"
$vrc_nmud_ksr.Minimum= "0"
$vrc_nmud_ksr.Maximum= "1"

$vrc_nmud_ksr.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "KSR" $True
	$script:vrc_svn[(Idx)][11]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opl_nmud_ksr= New-Object System.Windows.Forms.NumericUpDown 
$opl_nmud_ksr.location= "190,15"
$opl_nmud_ksr.Size= "55,20"
$opl_nmud_ksr.TextAlign= "Right"
$opl_nmud_ksr.UpDownAlign= "Right"
$opl_nmud_ksr.BorderStyle= "FixedSingle"
$opl_nmud_ksr.Minimum= "0"
$opl_nmud_ksr.Maximum= "1"

$opl_nmud_ksr.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "KSR" $True
	$script:opl_two[(Idx)][9]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
   
$ring_grp= New-Object System.Windows.Forms.GroupBox 
$ring_grp.Location= "270,30"
$ring_grp.Size= "255,130"
$ring_grp.Text= "Tune Control"
$ring_grp.FlatStyle= "Flat"
$ring_grp.ForeColor= "gray"
$ring_grp.Font= $FonLabel
	
# ------ DT - Distortion 0-1 vrc7 
	 
$lbl_dt= New-Object System.Windows.Forms.Label 
$lbl_dt.Location= "10,20"
$lbl_dt.Size= "60,40"
$lbl_dt.Text= "Distortion"
$lbl_dt.TextAlign= "BottomCenter"
# $lbl_dt.BackColor= "black"
 
$vrc_nmud_dt= New-Object System.Windows.Forms.NumericUpDown 
$vrc_nmud_dt.location= "190,20"
$vrc_nmud_dt.Size= "55,20"
$vrc_nmud_dt.TextAlign= "Right"
$vrc_nmud_dt.UpDownAlign= "Right"
$vrc_nmud_dt.BorderStyle= "FixedSingle"
$vrc_nmud_dt.Minimum= "0"
$vrc_nmud_dt.Maximum= "1"

$vrc_nmud_dt.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "DT" $True
	$script:vrc_svn[(Idx)][12]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Sin_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
  
# ------ EG - EnvelopeGeneratorType 0-1 / SR=0 off,on 
	 
$lbl_eg= New-Object System.Windows.Forms.Label 
$lbl_eg.Location= "70,20"
$lbl_eg.Size= "60,40"
$lbl_eg.Text= "EnvGeneType"
$lbl_eg.TextAlign= "BottomCenter"
 
$vrc_nmud_eg= New-Object System.Windows.Forms.NumericUpDown 
$vrc_nmud_eg.location= "130,20"
$vrc_nmud_eg.Size= "55,20"
$vrc_nmud_eg.TextAlign= "Right"
$vrc_nmud_eg.UpDownAlign= "Right"
$vrc_nmud_eg.BorderStyle= "FixedSingle"
$vrc_nmud_eg.Minimum= "0"
$vrc_nmud_eg.Maximum= "1"

$vrc_nmud_eg.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "EG" $True
	$script:vrc_svn[(Idx)][10]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opl_nmud_eg= New-Object System.Windows.Forms.NumericUpDown 
$opl_nmud_eg.location= "130,20"
$opl_nmud_eg.Size= "55,20"
$opl_nmud_eg.TextAlign= "Right"
$opl_nmud_eg.UpDownAlign= "Right"
$opl_nmud_eg.BorderStyle= "FixedSingle"
$opl_nmud_eg.Minimum= "0"
$opl_nmud_eg.Maximum= "1"

$opl_nmud_eg.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "EG" $True
	$script:opl_two[(Idx)][10]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
  
# ------ VIB - Vibrato 0-1 
	 
$lbl_vib= New-Object System.Windows.Forms.Label 
$lbl_vib.Location= "130,20"
$lbl_vib.Size= "60,40"
$lbl_vib.Text= "Vibrato"
$lbl_vib.TextAlign= "BottomCenter"
 
$vrc_nmud_vib= New-Object System.Windows.Forms.NumericUpDown 
$vrc_nmud_vib.location= "70,20"
$vrc_nmud_vib.Size= "55,20"
$vrc_nmud_vib.TextAlign= "Right"
$vrc_nmud_vib.UpDownAlign= "Right"
$vrc_nmud_vib.BorderStyle= "FixedSingle"
$vrc_nmud_vib.Minimum= "0"
$vrc_nmud_vib.Maximum= "1"

$vrc_nmud_vib.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "VIB" $True
	$script:vrc_svn[(Idx)][9]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opl_nmud_vib= New-Object System.Windows.Forms.NumericUpDown 
$opl_nmud_vib.location= "70,20"
$opl_nmud_vib.Size= "55,20"
$opl_nmud_vib.TextAlign= "Right"
$opl_nmud_vib.UpDownAlign= "Right"
$opl_nmud_vib.BorderStyle= "FixedSingle"
$opl_nmud_vib.Minimum= "0"
$opl_nmud_vib.Maximum= "1"

$opl_nmud_vib.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "VIB" $True
	$script:opl_two[(Idx)][11]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
  
# ------ AM - AmplitudeModulation Enable Switch 0-1 
	 
$lbl_am= New-Object System.Windows.Forms.Label 
$lbl_am.Location= "190,20"
$lbl_am.Size= "60,40"
$lbl_am.Text= "AM Switch"
$lbl_am.TextAlign= "BottomCenter"
 
$vrc_nmud_am= New-Object System.Windows.Forms.NumericUpDown 
$vrc_nmud_am.location= "10,20"
$vrc_nmud_am.Size= "55,20"
$vrc_nmud_am.TextAlign= "Right"
$vrc_nmud_am.UpDownAlign= "Right"
$vrc_nmud_am.BorderStyle= "FixedSingle"
$vrc_nmud_am.Minimum= "0"
$vrc_nmud_am.Maximum= "1"

$vrc_nmud_am.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "AM" $True
	$script:vrc_svn[(Idx)][8]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opl_nmud_am= New-Object System.Windows.Forms.NumericUpDown 
$opl_nmud_am.location= "10,20"
$opl_nmud_am.Size= "55,20"
$opl_nmud_am.TextAlign= "Right"
$opl_nmud_am.UpDownAlign= "Right"
$opl_nmud_am.BorderStyle= "FixedSingle"
$opl_nmud_am.Minimum= "0"
$opl_nmud_am.Maximum= "1"

$opl_nmud_am.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "AM" $True
	$script:opl_two[(Idx)][12]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  Poly_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
  
# ------ 
 
# ------ KS - KeyScaling 0-3 / env length 
	 
$lbl_ks= New-Object System.Windows.Forms.Label 
$lbl_ks.Location= "10,20"
$lbl_ks.Size= "60,35"
$lbl_ks.Text= "Key Scaling"
$lbl_ks.TextAlign= "BottomCenter"
 
$opn_nmud_ks= New-Object System.Windows.Forms.NumericUpDown 
$opn_nmud_ks.location= "10,20"
$opn_nmud_ks.Size= "55,20"
$opn_nmud_ks.TextAlign= "Right"
$opn_nmud_ks.UpDownAlign= "Right"
$opn_nmud_ks.BorderStyle= "FixedSingle"
$opn_nmud_ks.Minimum= "0"
$opn_nmud_ks.Maximum= "3"

$opn_nmud_ks.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "KS" $True
	$script:opn_fur[(Idx)][8]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
		Poly_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opm_nmud_ks= New-Object System.Windows.Forms.NumericUpDown 
$opm_nmud_ks.location= "10,20"
$opm_nmud_ks.Size= "55,20"
$opm_nmud_ks.TextAlign= "Right"
$opm_nmud_ks.UpDownAlign= "Right"
$opm_nmud_ks.BorderStyle= "FixedSingle"
$opm_nmud_ks.Minimum= "0"
$opm_nmud_ks.Maximum= "3"

$opm_nmud_ks.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "KS" $True
	$script:opm_fur[(Idx)][8]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
		Poly_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
  
# ------ DT1 - DeTune1 0-7 [0,1,2,3, 0,-1,-2,-3] 
	 
$lbl_dt1= New-Object System.Windows.Forms.Label 
$lbl_dt1.Location= "70,20"
$lbl_dt1.Size= "60,35"
$lbl_dt1.Text= "Detune1"
$lbl_dt1.TextAlign= "BottomCenter"
 
$opn_nmud_dt1= New-Object System.Windows.Forms.NumericUpDown 
$opn_nmud_dt1.location= "70,20"
$opn_nmud_dt1.Size= "55,20"
$opn_nmud_dt1.TextAlign= "Right"
$opn_nmud_dt1.UpDownAlign= "Right"
$opn_nmud_dt1.BorderStyle= "FixedSingle"
$opn_nmud_dt1.Minimum= "0"
$opn_nmud_dt1.Maximum= "7"

$opn_nmud_dt1.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "DT1" $True
	$script:opn_fur[(Idx)][10]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
		Poly_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opm_nmud_dt1= New-Object System.Windows.Forms.NumericUpDown 
$opm_nmud_dt1.location= "70,20"
$opm_nmud_dt1.Size= "55,20"
$opm_nmud_dt1.TextAlign= "Right"
$opm_nmud_dt1.UpDownAlign= "Right"
$opm_nmud_dt1.BorderStyle= "FixedSingle"
$opm_nmud_dt1.Minimum= "0"
$opm_nmud_dt1.Maximum= "7"

$opm_nmud_dt1.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "DT1" $True
	$script:opm_fur[(Idx)][10]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
		Poly_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
  
# ------ DT2 - DeTune2  0-3 opm 
	 
$lbl_dt2= New-Object System.Windows.Forms.Label 
$lbl_dt2.Location= "130,20"
$lbl_dt2.Size= "60,35"
$lbl_dt2.Text= "Detune2"
$lbl_dt2.TextAlign= "BottomCenter"
 
$opm_nmud_dt2= New-Object System.Windows.Forms.NumericUpDown 
$opm_nmud_dt2.location= "130,20"
$opm_nmud_dt2.Size= "55,20"
$opm_nmud_dt2.TextAlign= "Right"
$opm_nmud_dt2.UpDownAlign= "Right"
$opm_nmud_dt2.BorderStyle= "FixedSingle"
$opm_nmud_dt2.Minimum= "0"
$opm_nmud_dt2.Maximum= "3"

$opm_nmud_dt2.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "DT2" $True
	$script:opm_fur[(Idx)][11]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
		Poly_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
  
# ------ AMS - AmplitudeModulationSensitivity 0-3 
	 
$lbl_ams= New-Object System.Windows.Forms.Label 
$lbl_ams.Location= "190,20"
$lbl_ams.Size= "60,35"
$lbl_ams.Text= "AM Sens"
$lbl_ams.TextAlign= "BottomCenter"
 
$opn_nmud_ams= New-Object System.Windows.Forms.NumericUpDown 
$opn_nmud_ams.location= "190,20"
$opn_nmud_ams.Size= "55,20"
$opn_nmud_ams.TextAlign= "Right"
$opn_nmud_ams.UpDownAlign= "Right"
$opn_nmud_ams.BorderStyle= "FixedSingle"
$opn_nmud_ams.Minimum= "0"
$opn_nmud_ams.Maximum= "3"

$opn_nmud_ams.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "AMS" $True
	$script:opn_fur[(Idx)][11]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
		Poly_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opm_nmud_ams= New-Object System.Windows.Forms.NumericUpDown 
$opm_nmud_ams.location= "190,20"
$opm_nmud_ams.Size= "55,20"
$opm_nmud_ams.TextAlign= "Right"
$opm_nmud_ams.UpDownAlign= "Right"
$opm_nmud_ams.BorderStyle= "FixedSingle"
$opm_nmud_ams.Minimum= "0"
$opm_nmud_ams.Maximum= "3"

$opm_nmud_ams.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "AMS" $True
	$script:opm_fur[(Idx)][12]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
		Poly_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
   
$op_grp= New-Object System.Windows.Forms.GroupBox 
$op_grp.Location= "270,160"
$op_grp.Size= "255,140"
$op_grp.Text= "Frequency Modulation"
$op_grp.FlatStyle= "Flat"
$op_grp.ForeColor= "gray"
$op_grp.Font= $FonLabel
	
# ------ TL - TotalLevel 63-0 2op / 0max - 127min 4op 
	 
$lbl_tl= New-Object System.Windows.Forms.Label 
$lbl_tl.Location= "10,20"
$lbl_tl.Size= "120,20"
$lbl_tl.Text= "Total Level"
$lbl_tl.TextAlign= "BottomCenter"
# $lbl_tl.BackColor= "black"
 
$vrc_nmud_tl= New-Object System.Windows.Forms.NumericUpDown 
$vrc_nmud_tl.location= "190,90"
$vrc_nmud_tl.Size= "55,20"
$vrc_nmud_tl.TextAlign= "Right"
$vrc_nmud_tl.UpDownAlign= "Right"
$vrc_nmud_tl.BorderStyle= "FixedSingle"
$vrc_nmud_tl.Minimum= "0"
$vrc_nmud_tl.Maximum= "63"

$vrc_nmud_tl.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "TL" $True
	$script:vrc_svn[(Idx)][0]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
		Sin_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opl_nmud_tl= New-Object System.Windows.Forms.NumericUpDown 
$opl_nmud_tl.location= "190,90"
$opl_nmud_tl.Size= "55,20"
$opl_nmud_tl.TextAlign= "Right"
$opl_nmud_tl.UpDownAlign= "Right"
$opl_nmud_tl.BorderStyle= "FixedSingle"
$opl_nmud_tl.Minimum= "0"
$opl_nmud_tl.Maximum= "63"

$opl_nmud_tl.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "TL" $True
	$script:opl_two[(Idx)][6]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
		Sin_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opn_nmud_tl= New-Object System.Windows.Forms.NumericUpDown 
$opn_nmud_tl.location= "190,90"
$opn_nmud_tl.Size= "55,20"
$opn_nmud_tl.TextAlign= "Right"
$opn_nmud_tl.UpDownAlign= "Right"
$opn_nmud_tl.BorderStyle= "FixedSingle"
$opn_nmud_tl.Minimum= "0"
$opn_nmud_tl.Maximum= "127"

$opn_nmud_tl.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "TL" $True
	$script:opn_fur[(Idx)][7]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
		Sin_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opm_nmud_tl= New-Object System.Windows.Forms.NumericUpDown 
$opm_nmud_tl.location= "190,90"
$opm_nmud_tl.Size= "55,20"
$opm_nmud_tl.TextAlign= "Right"
$opm_nmud_tl.UpDownAlign= "Right"
$opm_nmud_tl.BorderStyle= "FixedSingle"
$opm_nmud_tl.Minimum= "0"
$opm_nmud_tl.Maximum= "127"

$opm_nmud_tl.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "TL" $True
	$script:opm_fur[(Idx)][7]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
		Sin_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
  
# ------ ML - Multiple 0-15 
	 
$lbl_ml= New-Object System.Windows.Forms.Label 
$lbl_ml.Location= "130, 20"
$lbl_ml.Size= "120, 20"
$lbl_ml.Text= "Multiple" #  - overtone
$lbl_ml.TextAlign= "BottomCenter"

 
$vrc_nmud_ml= New-Object System.Windows.Forms.NumericUpDown 
$vrc_nmud_ml.location= "190,15"
$vrc_nmud_ml.Size= "55,20"
$vrc_nmud_ml.TextAlign= "Right"
$vrc_nmud_ml.UpDownAlign= "Right"
$vrc_nmud_ml.BorderStyle= "FixedSingle"
$vrc_nmud_ml.Minimum= "0"
$vrc_nmud_ml.Maximum= "15"

$vrc_nmud_ml.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "ML" $True
	$script:vrc_svn[(Idx)][7]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
		Sin_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opl_nmud_ml= New-Object System.Windows.Forms.NumericUpDown 
$opl_nmud_ml.location= "190,15"
$opl_nmud_ml.Size= "55,20"
$opl_nmud_ml.TextAlign= "Right"
$opl_nmud_ml.UpDownAlign= "Right"
$opl_nmud_ml.BorderStyle= "FixedSingle"
$opl_nmud_ml.Minimum= "0"
$opl_nmud_ml.Maximum= "15"

$opl_nmud_ml.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "ML" $True
	$script:opl_two[(Idx)][8]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
		Sin_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opn_nmud_ml= New-Object System.Windows.Forms.NumericUpDown 
$opn_nmud_ml.location= "190,15"
$opn_nmud_ml.Size= "55,20"
$opn_nmud_ml.TextAlign= "Right"
$opn_nmud_ml.UpDownAlign= "Right"
$opn_nmud_ml.BorderStyle= "FixedSingle"
$opn_nmud_ml.Minimum= "0"
$opn_nmud_ml.Maximum= "15"

$opn_nmud_ml.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "ML" $True
	$script:opn_fur[(Idx)][9]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
		Sin_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opm_nmud_ml= New-Object System.Windows.Forms.NumericUpDown 
$opm_nmud_ml.location= "190,15"
$opm_nmud_ml.Size= "55,20"
$opm_nmud_ml.TextAlign= "Right"
$opm_nmud_ml.UpDownAlign= "Right"
$opm_nmud_ml.BorderStyle= "FixedSingle"
$opm_nmud_ml.Minimum= "0"
$opm_nmud_ml.Maximum= "15"

$opm_nmud_ml.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "ML" $True
	$script:opm_fur[(Idx)][9]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
		Sin_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
   
$alg_grp= New-Object System.Windows.Forms.GroupBox 
$alg_grp.Location= "10,270"
$alg_grp.Size= "255,135"
$alg_grp.Text= "Algorithm / Feedback"
$alg_grp.FlatStyle= "Flat"
$alg_grp.ForeColor= "gray"
$alg_grp.Font= $FonLabel
	
# ------ ALG - Algorithm 0-1 opl / 0-7 4op 
	
$lbl_alg= New-Object System.Windows.Forms.Label 
$lbl_alg.Location= "10,20"
$lbl_alg.Size= "120,20"
$lbl_alg.Text= "Algorithm"
$lbl_alg.TextAlign= "BottomCenter"
# $lbl_alg.BackColor= "black"
 
$opl_nmud_alg= New-Object System.Windows.Forms.NumericUpDown 
$opl_nmud_alg.location= "95,20"
$opl_nmud_alg.Size= "55,20"
$opl_nmud_alg.TextAlign= "Right"
$opl_nmud_alg.UpDownAlign= "Right"
$opl_nmud_alg.BorderStyle= "FixedSingle"
$opl_nmud_alg.Minimum= "0"
$opl_nmud_alg.Maximum= "1"

$opl_nmud_alg.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "ALG" $True
	$script:opl_two[0][0]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
		Sin_chw
		Pict_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opn_nmud_alg= New-Object System.Windows.Forms.NumericUpDown 
$opn_nmud_alg.location= "95,20"
$opn_nmud_alg.Size= "55,20"
$opn_nmud_alg.TextAlign= "Right"
$opn_nmud_alg.UpDownAlign= "Right"
$opn_nmud_alg.BorderStyle= "FixedSingle"
$opn_nmud_alg.Minimum= "0"
$opn_nmud_alg.Maximum= "7"

$opn_nmud_alg.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "ALG" $True
	$script:opn_fur[0][0]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	  	Sin_chg
	 	Pict_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opm_nmud_alg= New-Object System.Windows.Forms.NumericUpDown 
$opm_nmud_alg.location= "95,20"
$opm_nmud_alg.Size= "55,20"
$opm_nmud_alg.TextAlign= "Right"
$opm_nmud_alg.UpDownAlign= "Right"
$opm_nmud_alg.BorderStyle= "FixedSingle"
$opm_nmud_alg.Minimum= "0"
$opm_nmud_alg.Maximum= "7"

$opm_nmud_alg.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "ALG" $True
	$script:opm_fur[0][0]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
	 	Sin_chg
	 	Pict_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
  
# ------ FB - Feedback 0-7 
	 
$lbl_fb= New-Object System.Windows.Forms.Label 
$lbl_fb.Location= "130,20"
$lbl_fb.Size= "120,20"
$lbl_fb.Text= "Feedback"
$lbl_fb.TextAlign= "BottomCenter"

 
$vrc_nmud_fb= New-Object System.Windows.Forms.NumericUpDown 
$vrc_nmud_fb.location= "250,20"
$vrc_nmud_fb.Size= "55,20"
$vrc_nmud_fb.TextAlign= "Right"
$vrc_nmud_fb.UpDownAlign= "Right"
$vrc_nmud_fb.BorderStyle= "FixedSingle"
$vrc_nmud_fb.Minimum= "0"
$vrc_nmud_fb.Maximum= "7"

$vrc_nmud_fb.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "FB" $True
	$script:vrc_svn[0][1]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
		Sin_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opl_nmud_fb= New-Object System.Windows.Forms.NumericUpDown 
$opl_nmud_fb.location= "250,20"
$opl_nmud_fb.Size= "55,20"
$opl_nmud_fb.TextAlign= "Right"
$opl_nmud_fb.UpDownAlign= "Right"
$opl_nmud_fb.BorderStyle= "FixedSingle"
$opl_nmud_fb.Minimum= "0"
$opl_nmud_fb.Maximum= "7"

$opl_nmud_fb.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "FB" $True
	$script:opl_two[0][1]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
		Sin_chw
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opn_nmud_fb= New-Object System.Windows.Forms.NumericUpDown 
$opn_nmud_fb.location= "250,20"
$opn_nmud_fb.Size= "55,20"
$opn_nmud_fb.TextAlign= "Right"
$opn_nmud_fb.UpDownAlign= "Right"
$opn_nmud_fb.BorderStyle= "FixedSingle"
$opn_nmud_fb.Minimum= "0"
$opn_nmud_fb.Maximum= "7"

$opn_nmud_fb.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "FB" $True
	$script:opn_fur[0][1]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
		Sin_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
 
$opm_nmud_fb= New-Object System.Windows.Forms.NumericUpDown 
$opm_nmud_fb.location= "250,20"
$opm_nmud_fb.Size= "55,20"
$opm_nmud_fb.TextAlign= "Right"
$opm_nmud_fb.UpDownAlign= "Right"
$opm_nmud_fb.BorderStyle= "FixedSingle"
$opm_nmud_fb.Minimum= "0"
$opm_nmud_fb.Maximum= "7"

$opm_nmud_fb.Add_ValueChanged({
 try{
	Buffer_Render $this.Value $this.Maximum "FB" $True
	$script:opm_fur[0][1]= Sz $this.Value

  if($event_change){

	Box_read

	if($sb_alg.Visible){
		Sin_chg
	}
  }
 }catch{
	echo $_.exception
 }
})
   
$osc_grp= New-Object System.Windows.Forms.GroupBox 
$osc_grp.Text= "FM OSC"
$osc_grp.Size= "255, 105"
$osc_grp.Location= "270,300"
$osc_grp.ForeColor= "gray"
$osc_grp.Font= $FonLabel
	
$lisn_btn= New-Object System.Windows.Forms.Button 
$lisn_btn.Location= "20, 30"
$lisn_btn.Size= "25, 25"
$lisn_btn.FlatStyle= "Popup"
$lisn_btn.Image= [System.Drawing.Image]::FromFile(".\img\play.png")
# $lisn_btn.Text= ">"
$lisn_btn.BackColor= "white"

$lisn_btn.Add_Click({ # 試聴
 try{
	Box_listen 0

 }catch{
	echo $_.exception
 }
})
 
$conv_btn= New-Object System.Windows.Forms.Button 
$conv_btn.Location= "20, 65"
$conv_btn.Size= "25, 25"
$conv_btn.FlatStyle= "Popup"
$conv_btn.Image= [System.Drawing.Image]::FromFile(".\img\convert.png")
# $conv_btn.Text= ">>"
$conv_btn.BackColor= "white"

$conv_btn.Add_Click({ # text convert
 try{
	if($fm_box.Modified -eq $True){ #変更あらば

		Param_exp 0 $fm_box.Text

		## visible gi preset edit baai presetstore overwrite ##
		if($ff_frm.Visible -eq $True){

			Saveauto $script:fm_xml.table.presetstore
		}

		if($sb_alg.Visible){
			Monotone_select "conv_btn" # Colorline書込
			All_chg
		}

		$fm_box.Modified= $False
	}

	if($fm_box_mml.Modified -eq $True){ #変更あらば

		switch($comb_fm.SelectedItem){
		'vrc7 2op'{
			switch($key["type"]){
			'mckreg'{
				$script:box_mml["mck"]= $fm_box_mml.Text.TrimEnd("`r`n")
				Mml_writer $script:box_mml["mck"] '.\header\fm_header_mck' 0
			}default{
				$script:box_mml["nsd"]= $fm_box_mml.Text.TrimEnd("`r`n")
				Mml_writer $script:box_mml["nsd"] '.\header\fm_header_nsd' 0
			}
			} #sw
			break;

		}default{
			$script:box_mml["pmd"]= $fm_box_mml.Text.TrimEnd("`r`n") # 最終文字以降、全改行削除
			Mml_writer $script:box_mml["pmd"] '.\header\fm_mml_pmd' 0
		}
		} #sw

		Write-Host ('<< MMLを読み込みました')

		if($sb_alg.Visible){
			Monotone_select "conv2_btn" # Colorline書込
		}

		$fm_box_mml.Modified= $False # 開いたままため、自前でoff
	}
 }catch{
	echo $_.exception
 }
})
 
$comb_vrc= New-Object System.Windows.Forms.Combobox 
$comb_vrc.Size= "180, 30"
$comb_vrc.Location= "60, 30"
$comb_vrc.FlatStyle= "Popup"
# $comb_vrc.Font= $FonLabel

[void]$comb_vrc.Items.AddRange(@("Operator1", "Operator2"))
$comb_vrc.DropDownStyle= "DropDownList"
$comb_vrc.SelectedIndex= 0

$comb_vrc.Add_SelectedValueChanged({
 try{

	$this.Select() # forcus return

	Panel_chg $comb_fm.SelectedItem # Box_read ha tsuide
	Color_Render
	Stus_build

	if($sb_alg.Visible){
		Pict_chg	# op-alg img change
 	}

 }catch{
	echo $_.exception
 }
})
 
$comb_opl= New-Object System.Windows.Forms.Combobox 
$comb_opl.Size= "180, 30"
$comb_opl.Location= "60, 30"
$comb_opl.FlatStyle= "Popup"
# $comb_opl.Font= $FonLabel

[void]$comb_opl.Items.AddRange(@("Operator1", "Operator2"))
$comb_opl.DropDownStyle= "DropDownList"
$comb_opl.SelectedIndex= 0

$comb_opl.Add_SelectedValueChanged({
 try{

	$this.Select() # forcus return

	Panel_chg $comb_fm.SelectedItem
	Color_Render
	Stus_build

	if($sb_alg.Visible){
		Pict_chg
 	}

 }catch{
	echo $_.exception
 }
})
 
$comb_opn= New-Object System.Windows.Forms.Combobox 
$comb_opn.Size= "180, 30"
$comb_opn.Location= "60, 30"
$comb_opn.FlatStyle= "Popup"
# $comb_opn.Font= $FonLabel

[void]$comb_opn.Items.AddRange(@("Operator1", "Operator2", "Operator3", "Operator4"))
$comb_opn.DropDownStyle= "DropDownList"
$comb_opn.SelectedIndex= 0

$comb_opn.Add_SelectedValueChanged({
 try{

	$this.Select() # forcus return

	Panel_chg $comb_fm.SelectedItem
	Color_Render
	Stus_build

	if($sb_alg.Visible){
		Pict_chg
 	}

 }catch{
	echo $_.exception
 }
})
 
$comb_opm= New-Object System.Windows.Forms.Combobox 
$comb_opm.Size= "180, 30"
$comb_opm.Location= "60, 30"
$comb_opm.FlatStyle= "Popup"
# $comb_opm.Font= $FonLabel

[void]$comb_opm.Items.AddRange(@("Operator1", "Operator2", "Operator3", "Operator4"))
$comb_opm.DropDownStyle= "DropDownList"
$comb_opm.SelectedIndex= 0

$comb_opm.Add_SelectedValueChanged({
 try{

	$this.Select() # forcus return

	Panel_chg $comb_fm.SelectedItem
	Color_Render
	Stus_build

	if($sb_alg.Visible){
		Pict_chg
 	}

 }catch{
	echo $_.exception
 }
})
 
$comb_fm= New-Object System.Windows.Forms.Combobox 
$comb_fm.Size= "180, 30"
$comb_fm.Location= "60, 65"
$comb_fm.FlatStyle= "Popup"
# $comb_fm.Font= $FonLabel

[void]$comb_fm.Items.AddRange(@("vrc7 2op", "opl 2op", "opn 4op", "opm 4op"))
$comb_fm.DropDownStyle= "DropDownList"
# $comb_fm.SelectedItem= "vrc7 2op" # ダミー必要
$comb_fm.SelectedIndex= 0

$comb_fm.Add_SelectedValueChanged({ # Event
  try{
	$fm_menu_copy.Enabled= Enable_chk $key["style"]
	Unredo 2

	Panel_chg $comb_fm.SelectedItem	# compiler change
	Color_Render

	Menu_build "compiler"
	Send_build 1
	Stus_build

	if($sb_alg.Visible){
		All_chg
	}
  }catch{
	echo $_.exception
  }
 })
   
# forms 
	 
$fm_panel= New-Object System.Windows.Forms.Panel 
$fm_panel.Location= "0,0"
$fm_panel.Size= "530,415"
# $fm_panel.BackColor= "orange"
 
$fm_box_mml= New-Object System.Windows.Forms.TextBox 
$fm_box_mml.Size= "520,75"
$fm_box_mml.Location= "10,575"
$fm_box_mml.WordWrap= "False"
$fm_box_mml.Multiline= "True"
$fm_box_mml.AcceptsReturn= "True"
$fm_box_mml.AcceptsTab= "True"
$fm_box_mml.ScrollBars= "Both"
$fm_box_mml.BorderStyle= "FixedSingle"
# $fm_box_mml.ReadOnly= "True"
$fm_box_mml.ForeColor= "dimgray"
$fm_box_mml.BackColor= "white" # "gainsboro"
$fm_box_mml.font= $Fon

$fm_box_mml.Add_Enter({
 try{
	$this.ForeColor= "black"
	$this.BackColor= "white"
 }catch{
	echo $_.exception
 }
})

$fm_box_mml.Add_Leave({
	$this.ForeColor= "dimgray"
	$this.BackColor= "white" # "gainsboro"
})

$fm_box_mml.Add_KeyDown({ # インポート
 try{
	Key_down $_.KeyCode
 }catch{
	echo $_.exception
 }
})
 
$fm_box= New-Object System.Windows.Forms.TextBox 
$fm_box.Size= "520,145"
$fm_box.Location= "10,425"
$fm_box.WordWrap= "False"
$fm_box.Multiline= "True"
$fm_box.AcceptsReturn= "True"
$fm_box.AcceptsTab= "True"
$fm_box.ScrollBars= "Both"
$fm_box.BorderStyle= "FixedSingle"
# $fm_box.ReadOnly= "True"
$fm_box.ForeColor= "dimgray"
$fm_box.BackColor= "white" # "gainsboro"
$fm_box.font= $Fon

$fm_box.Add_Enter({ # kaki komi de undo reset
 try{
	Unredo 0

	$this.ForeColor= "black"
	$this.BackColor= "white"
 }catch{
	echo $_.exception
 }
})

$fm_box.Add_Leave({
	$this.ForeColor= "dimgray"
	$this.BackColor= "white" # "gainsboro"
})

$fm_box.Add_KeyDown({ # インポート
 try{
	Key_down $_.KeyCode

 }catch{
	echo $_.exception
 }
})
 
$fm_stus= New-Object System.Windows.Forms.StatusStrip 
$fm_stus.SizingGrip= $false

$fm_label= New-Object System.Windows.Forms.ToolStripStatusLabel
# $fm_label.Text= "  Test ------"
# $fm_label.Font= $Fon
 
$contxt_trayfm= New-Object System.Windows.Forms.ContextMenuStrip 
# $contxt objを読み込んだ後$NotifyIcon objが安全

[void]$contxt_trayfm.Items.Add("最小化")
[void]$contxt_trayfm.Items.Add("環境設定")
[void]$contxt_trayfm.Items.Add("終了")

$contxt_trayfm.Add_ItemClicked({
  try{
	# キャスト不要 [string]$_.ClickedItem
	$script:frm_state= Contxt_state $_.ClickedItem $frm_state

	$this.Close()

 }catch{
	echo $_.exception
 }
})
 
$tray_fm= New-Object System.Windows.Forms.NotifyIcon 
$tray_fm.Icon= Icon_read "..\fm_editor.exe"
# $tray_fm.Visible= $True
$tray_fm.Text= "FM editor"
$tray_fm.ContextMenuStrip= $contxt_trayfm

$tray_fm.Add_MouseDown({
 try{

  switch([string]$_.Button){ # キャスト
  'Left'{

	switch($frm_state[0]){
	0{
		$script:frm_state= Contxt_state "最小化" $frm_state
		break;
	}1{
		$script:frm_state= Contxt_state "元に戻す" $frm_state
	}
	} #sw


#	break;
#  }'Right'{ # 不要 モーダル発生 -> $tray_fm.ContextMenuStrip
#	$contxt_trayfm.Show([Windows.Forms.Cursor]::Position)
  }
  } #sw

 }catch{
	echo $_.exception
 }
})
 
$frm_fm= New-Object System.Windows.Forms.Form 
$frm_fm.Text= "FM Synthesis Chip - Tone Editor"
$frm_fm.Size= "547,717"
$frm_fm.FormBorderStyle= "FixedSingle"
$frm_fm.StartPosition= "WindowsDefaultLocation"
$frm_fm.Icon= Icon_read "..\fm_editor.exe"
# $frm_fm.ShowIcon= $False
$frm_fm.MinimizeBox= $True
$frm_fm.MaximizeBox= $False

$frm_fm.TopLevel= $True
# $frm_fm.Topmost= $True

$frm_fm.Add_Shown({ # .ShowDialog()呼出時のみ使用 - 挙動怪ため
 try{
	$lisn_btn.Select() # .ShowDialog() -> .Select()

	switch($key["open"]){
	'False'{

		Popalg_build $False > $null
		break;
	}'True'{

		Popalg_build $True > $null
		$sb_alg.Show()
	}
	} #sw

 }catch{
	echo $_.exception
 }
})

$frm_fm.Add_FormClosing({
 try{
	if($key["autosave"] -eq 'True'){
		Saveauto $script:fm_xml.table.autosave # 最終パラメータ保存
	}

	Fmwrite_xml $script:fm_xml.table.val $script:fm_xml.table.opt

	File_writer $script:fm_xml '.\fm_editor.xml'

 }catch{
	echo $_.exception
 }
})
 
$fm_mnu= New-Object System.Windows.Forms.MenuStrip 
	 
$fm_menu_f= New-Object System.Windows.Forms.ToolStripMenuItem 
$fm_menu_f.Text= "File"


















	
$fm_menu_pset= New-Object System.Windows.Forms.ToolStripSeparator 
$fm_menu_pset= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_pset.Text= "Preset"

$fm_menu_pset.Add_Click({
 try{

  switch($ff_frm.Visible){
  'False'{
	$comb_fm.Enabled= $False

	switch(Itm){ # $ff_tab先に変更のち -> .show()
	'2op'{
		switch($key["type"]){
		'mckreg'{	$ff_tab.SelectedIndex= "0"; break;
		}default{	$ff_tab.SelectedIndex= "1"
		}
		} #sw
		break;
	}'4op'{
		$ff_tab.SelectedIndex= "2"
	}
	} #sw

	Saveauto $script:fm_xml.table.presetstore
	# non preset load gino restore tame

	$fm_menu_pset.Text= "v Preset"
	$ff_frm.Show(); break;


  }'True'{

	$ff_frm.Close() # $ff_frm.Add_FormClosingへ
  }
  } #sw

 }catch{
	echo $_.exception
    	Write-Host '"ERROR: Safety Stopper >> $ff_frm.Show()"'
 }
})
 
$fm_menu_ladn= New-Object System.Windows.Forms.ToolStripSeparator 
$fm_menu_lad= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_lad.Text= "Load"
	
$fm_lad_a= New-Object System.Windows.Forms.ToolStripMenuItem 
# $fm_lad_a.Text= "slot A"

$fm_lad_a.Add_Click({
 try{
	Load_value $fm_xml.table.slot "A"
 }catch{
	echo $_.exception
 }
})
 
$fm_lad_b= New-Object System.Windows.Forms.ToolStripMenuItem 
# $fm_lad_b.Text= "slot B"

$fm_lad_b.Add_Click({
 try{
	Load_value $fm_xml.table.slot "B"
 }catch{
	echo $_.exception
 }
})
 
$fm_lad_c= New-Object System.Windows.Forms.ToolStripMenuItem 
# $fm_lad_c.Text= "slot C"

$fm_lad_c.Add_Click({
 try{
	Load_value $fm_xml.table.slot "C"
 }catch{
	echo $_.exception
 }
})
 
$fm_lad_d= New-Object System.Windows.Forms.ToolStripMenuItem 
# $fm_lad_d.Text= "slot D"

$fm_lad_d.Add_Click({
 try{
	Load_value $fm_xml.table.slot "D"
 }catch{
	echo $_.exception
 }
})
 
$fm_lad_e= New-Object System.Windows.Forms.ToolStripMenuItem 
# $fm_lad_e.Text= "slot E"

$fm_lad_e.Add_Click({
 try{
	Load_value $fm_xml.table.slot "E"
 }catch{
	echo $_.exception
 }
})
 
$fm_lad_f= New-Object System.Windows.Forms.ToolStripMenuItem 
# $fm_lad_f.Text= "slot F"

$fm_lad_f.Add_Click({
 try{
	Load_value $fm_xml.table.slot "F"
 }catch{
	echo $_.exception
 }
})
 
$fm_lad_g= New-Object System.Windows.Forms.ToolStripMenuItem 
# $fm_lad_g.Text= "slot G"

$fm_lad_g.Add_Click({
 try{
	Load_value $fm_xml.table.slot "G"
 }catch{
	echo $_.exception
 }
})
 
$fm_lad_h= New-Object System.Windows.Forms.ToolStripMenuItem 
# $fm_lad_h.Text= "slot H"

$fm_lad_h.Add_Click({
 try{
	Load_value $fm_xml.table.slot "H"
 }catch{
	echo $_.exception
 }
})
  
$fm_menu_sav= New-Object System.Windows.Forms.ToolStripMenuItem 
$fm_menu_sav.Text= "Save"








	
$fm_sav_a= New-Object System.Windows.Forms.ToolStripMenuItem 
# $fm_sav_a.Text= "slot A"

$fm_sav_a.Add_Click({
 try{
	Save_value "A"
 }catch{
	echo $_.exception
 }
})
 
$fm_sav_b= New-Object System.Windows.Forms.ToolStripMenuItem 
# $fm_sav_b.Text= "slot B"

$fm_sav_b.Add_Click({
 try{
	Save_value "B"
 }catch{
	echo $_.exception
 }
})
 
$fm_sav_c= New-Object System.Windows.Forms.ToolStripMenuItem 
# $fm_sav_c.Text= "slot C"

$fm_sav_c.Add_Click({
 try{
	Save_value "C"
 }catch{
	echo $_.exception
 }
})
 
$fm_sav_d= New-Object System.Windows.Forms.ToolStripMenuItem 
# $fm_sav_d.Text= "slot D"

$fm_sav_d.Add_Click({
 try{
	Save_value "D"
 }catch{
	echo $_.exception
 }
})
 
$fm_sav_e= New-Object System.Windows.Forms.ToolStripMenuItem 
# $fm_sav_e.Text= "slot E"

$fm_sav_e.Add_Click({
 try{
	Save_value "E"
 }catch{
	echo $_.exception
 }
})
 
$fm_sav_f= New-Object System.Windows.Forms.ToolStripMenuItem 
# $fm_sav_f.Text= "slot F"

$fm_sav_f.Add_Click({
 try{
	Save_value "F"
 }catch{
	echo $_.exception
 }
})
 
$fm_sav_g= New-Object System.Windows.Forms.ToolStripMenuItem 
# $fm_sav_g.Text= "slot G"

$fm_sav_g.Add_Click({
 try{
	Save_value "G"
 }catch{
	echo $_.exception
 }
})
 
$fm_sav_h= New-Object System.Windows.Forms.ToolStripMenuItem 
# $fm_sav_h.Text= "slot H"

$fm_sav_h.Add_Click({
 try{
	Save_value "H"
 }catch{
	echo $_.exception
 }
})
  
$fm_menu_ktn= New-Object System.Windows.Forms.ToolStripSeparator 
$fm_menu_kt= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_kt.Text= "Preferences"
	
$menu_fty= New-Object System.Windows.Forms.ToolStripMenuItem 
# $menu_fty.Text= "v Task tray"

$menu_fty.Add_Click({
  try{
	switch($key["tray"]){ # トグル

	'True'{	$script:key["tray"]= Trayfm_hide "False";	break;
	}'False'{	$script:key["tray"]= Trayfm_hide "True"
	}
	} #sw

 }catch{
	echo $_.exception
  }
})
 
$fm_menu_auton= New-Object System.Windows.Forms.ToolStripSeparator 
$fm_menu_auto= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_auto.Text= "Autosave"

$fm_menu_auto.Add_Click({
 try{
  switch($key["autosave"]){
  'False'{
	$script:key["autosave"]= Autosav_sw $True
	break;
  }'True'{

	$script:key["autosave"]= Autosav_sw $False
  }
  } #sw

 }catch{
	echo $_.exception
 }
})
 
$fm_menu_rcvern= New-Object System.Windows.Forms.ToolStripSeparator 
$fm_menu_rcver= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_rcver.Text= "Autosave Parameter"

$fm_menu_rcver.Add_Click({	# 数値リストア
 try{
	[string]$retn= [Windows.Forms.MessageBox]::Show(

	"数値をAutosaveへ戻します", "確認", "OKCancel","Information","Button2"
	)

	switch($retn){
	'OK'{
		Unredo 0

		Autoload $fm_xml.table.autosave

		Panel_chg $comb_fm.SelectedItem
		Stus_build

		if($sb_alg.Visible){
			All_chg
		}

		Write-Host '<< 数値をAutosaveへ戻しました'
	}
	#'Cancel'{}
	} #sw

 }catch{
	echo $_.exception
 }
})
 
$fm_menu_rstn= New-Object System.Windows.Forms.ToolStripSeparator 
$fm_menu_rst= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_rst.Text= "Reset Parameter"

$fm_menu_rst.Add_Click({	# 数値リセット
 try{
	[string]$retn= [Windows.Forms.MessageBox]::Show(

	"数値をリセットします", "確認", "OKCancel","Information","Button2"
	)

	switch($retn){
	'OK'{
		Unredo 0

		Autoload $fm_xml.table.resetting

		Panel_chg $comb_fm.SelectedItem
		Stus_build

		if($sb_alg.Visible){
			All_chg
		}

		Write-Host '<< 数値をリセットしました'
	}
	#'Cancel'{}
	} #sw

 }catch{
	echo $_.exception
 }
})
  
$fm_menu_sn= New-Object System.Windows.Forms.ToolStripSeparator 
$fm_menu_n= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_n.Text= "Close"

$fm_menu_n.Add_Click({

	$frm_fm.Close()
})
  
$fm_menu_o= New-Object System.Windows.Forms.ToolStripMenuItem 
$fm_menu_o.Text= "Option"

$fm_menu_ud= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_ud.Text= "Undo"
$fm_menu_ud.Enabled= $False

$fm_menu_ud.Add_Click({
 try{
	switch($fm_box.Focused){
	'False'{
		Unredo 1; break;
	}'True'{
		$fm_box.Undo()
	}
	} #sw
 }catch{
	echo $_.exception
 }
})

$fm_menu_comn= New-Object System.Windows.Forms.ToolStripSeparator
$fm_menu_comp= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_comp.Text= "Compiler"

$fm_menu_play= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_play.Text= "Player"

$fm_menu_dosv= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_dosv.Text= "Dos"

$fm_menu_edit= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_edit.Text= "Editor"

$fm_menu_setn= New-Object System.Windows.Forms.ToolStripSeparator
$fm_menu_set= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_set.Text= "Setting"

$fm_menu_set.Add_Click({
 try{
	[bool]$bool_sw= $tray_fm.Visible
	$tray_fm.Visible= $False

	[array]$args_set= "",""
	$args_set= .\setting.ps1 $val $opt "cut"


	$script:val= $args_set[0]
	$script:opt= $args_set[1]

	if((Chk_path '.\setting.xml') -eq 0){

		$script:set_xml= [xml](cat '.\setting.xml')

		$script:mck= @{}; $script:nsd= @{}; $script:pmd= @{};
		$script:play= @{}; $script:dos= @{}; $script:edit= @{};

		Setxml_read $script:set_xml.table # hash化 script: ga hitsuyo

	}else{
		Write-Host ("`r`n"+ '"setting.xml" 読み込みエラー')
	}

	$fm_menu_copy.Enabled= Enable_chk $key["style"]

	Panel_chg $comb_fm.SelectedItem	# compiler change

 	Menu_comp_build $opt["radio_bin"] > $null

	Menu_build "mck"
	Menu_build "nsd"
 	Menu_build "pmd"

	Menu_build "player"
	Menu_build "dos"
	Menu_build "editor"
	Stus_build

	Unredo 2

	if($sb_alg.Visible){
		All_chg
	}

	$tray_fm.Visible= $bool_sw

 }catch{
	echo $_.exception
 }
})


	 
<# 
 
$fm_menu_cmp0= New-Object System.Windows.Forms.ToolStripMenuItem 
# $fm_menu_cmp0.Text= "0.exe"
$fm_menu_cmp0.Visible= $False # .Hide() 不可

$fm_menu_cmp0.Add_Click({
 try{
	Change_value "compiler" $this.Text
	Menu_build "compiler"
	Stus_build
 }catch{
	echo $_.exception
 }
})

$fm_menu_cmp1= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_cmp1.Text= "1.exe"
$fm_menu_cmp1.Visible= $False

$fm_menu_cmp1.Add_Click({
 try{
	Change_value "compiler" $this.Text
	Menu_build "compiler"
	Stus_build
  }catch{
	echo $_.exception
 }
})

$fm_menu_cmp2= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_cmp2.Text= "2.exe"
$fm_menu_cmp2.Visible= $False

$fm_menu_cmp2.Add_Click({
 try{
	Change_value "compiler" $this.Text
	Menu_build "compiler"
	Stus_build
 }catch{
	echo $_.exception
 }
})

$fm_menu_cmp3= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_cmp3.Text= "3.exe"
$fm_menu_cmp3.Visible= $False

$fm_menu_cmp3.Add_Click({
 try{
	Change_value "compiler" $this.Text
	Menu_build "compiler"
	Stus_build
  }catch{
	echo $_.exception
 }
})

$fm_menu_cmp4= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_cmp4.Text= "4.exe"
$fm_menu_cmp4.Visible= $False

$fm_menu_cmp4.Add_Click({
 try{
	Change_value "compiler" $this.Text
	Menu_build "compiler"
	Stus_build
  }catch{
	echo $_.exception
 }
})

$fm_menu_cmp5= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_cmp5.Text= "5.exe"
$fm_menu_cmp5.Visible= $False

$fm_menu_cmp5.Add_Click({
 try{
	Change_value "compiler" $this.Text
	Menu_build "compiler"
	Stus_build
  }catch{
	echo $_.exception
 }
})
 
#> 

 
$fm_menu_comp=  New-Object System.Windows.Forms.ToolStripMenuItem 
$fm_menu_comp.Text= "compiler"

$fm_menu_cmck=  New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_cmck.Text= "MCK"

$fm_menu_cmck.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Fmchange_value "compiler" "mck"

	$script:opt["radio_bin"]= Menu_comp_build "mck"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_cnsd=  New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_cnsd.Text= "NSD"

$fm_menu_cnsd.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Fmchange_value "compiler" "nsd"

	$script:opt["radio_bin"]= Menu_comp_build "nsd"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_cpmd=  New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_cpmd.Text= "PMD"

$fm_menu_cpmd.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
 	Fmchange_value "compiler" "pmd"

	$script:opt["radio_bin"]= Menu_comp_build "pmd"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})
	
$fm_menu_mck0= New-Object System.Windows.Forms.ToolStripMenuItem 
#$fm_menu_mck0.Text= "0.exe"
$fm_menu_mck0.Visible= $False

$fm_menu_mck0.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){

	Fmchange_value "mck" $this.Text
	Fmchange_value "compiler" "mck"

	$script:opt["radio_bin"]= Menu_comp_build "mck"
	Menu_build "mck"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_mck1= New-Object System.Windows.Forms.ToolStripMenuItem
#$fm_menu_mck1.Text= "1.exe"
$fm_menu_mck1.Visible= $False

$fm_menu_mck1.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){

	Fmchange_value "mck" $this.Text
	Fmchange_value "compiler" "mck"

	$script:opt["radio_bin"]= Menu_comp_build "mck"
	Menu_build "mck"
	Stus_build
   }
  }catch{
	echo $_.exception
 }
})

$fm_menu_mck2= New-Object System.Windows.Forms.ToolStripMenuItem
#$fm_menu_mck2.Text= "2.exe"
$fm_menu_mck2.Visible= $False

$fm_menu_mck2.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){

	Fmchange_value "mck" $this.Text
	Fmchange_value "compiler" "mck"

	$script:opt["radio_bin"]= Menu_comp_build "mck"
	Menu_build "mck"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_mck3= New-Object System.Windows.Forms.ToolStripMenuItem
#$fm_menu_mck3.Text= "3.exe"
$fm_menu_mck3.Visible= $False

$fm_menu_mck3.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){

	Fmchange_value "mck" $this.Text
	Fmchange_value "compiler" "mck"

	$script:opt["radio_bin"]= Menu_comp_build "mck"
	Menu_build "mck"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})
 
$fm_menu_nsd0= New-Object System.Windows.Forms.ToolStripMenuItem 
#$fm_menu_nsd0.Text= "0.exe"
$fm_menu_nsd0.Visible= $False

$fm_menu_nsd0.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){

	Fmchange_value "nsd" $this.Text
	Fmchange_value "compiler" "nsd"

	$script:opt["radio_bin"]= Menu_comp_build "nsd"
	Menu_build "nsd"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_nsd1= New-Object System.Windows.Forms.ToolStripMenuItem
#$fm_menu_nsd1.Text= "1.exe"
$fm_menu_nsd1.Visible= $False

$fm_menu_nsd1.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){

	Fmchange_value "nsd" $this.Text
	Fmchange_value "compiler" "nsd"

	$script:opt["radio_bin"]= Menu_comp_build "nsd"
	Menu_build "nsd"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_nsd2= New-Object System.Windows.Forms.ToolStripMenuItem
#$fm_menu_nsd2.Text= "2.exe"
$fm_menu_nsd2.Visible= $False

$fm_menu_nsd2.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){

	Fmchange_value "nsd" $this.Text
	Fmchange_value "compiler" "nsd"

	$script:opt["radio_bin"]= Menu_comp_build "nsd"
	Menu_build "nsd"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_nsd3= New-Object System.Windows.Forms.ToolStripMenuItem
#$fm_menu_nsd3.Text= "3.exe"
$fm_menu_nsd3.Visible= $False

$fm_menu_nsd3.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){

	Fmchange_value "nsd" $this.Text
	Fmchange_value "compiler" "nsd"

	$script:opt["radio_bin"]= Menu_comp_build "nsd"
	Menu_build "nsd"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})
 
$fm_menu_pmd0= New-Object System.Windows.Forms.ToolStripMenuItem 
#$fm_menu_pmd0.Text= "0.exe"
$fm_menu_pmd0.Visible= $False

$fm_menu_pmd0.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){

	Fmchange_value "pmd" $this.Text
	Fmchange_value "compiler" "pmd"

	$script:opt["radio_bin"]= Menu_comp_build "pmd"
	Menu_build "pmd"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_pmd1= New-Object System.Windows.Forms.ToolStripMenuItem
#$fm_menu_pmd1.Text= "1.exe"
$fm_menu_pmd1.Visible= $False

$fm_menu_pmd1.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){

	Fmchange_value "pmd" $this.Text
	Fmchange_value "compiler" "pmd"

	$script:opt["radio_bin"]= Menu_comp_build "pmd"
	Menu_build "pmd"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_pmd2= New-Object System.Windows.Forms.ToolStripMenuItem
#$fm_menu_pmd2.Text= "2.exe"
$fm_menu_pmd2.Visible= $False

$fm_menu_pmd2.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){

	Fmchange_value "pmd" $this.Text
	Fmchange_value "compiler" "pmd"

	$script:opt["radio_bin"]= Menu_comp_build "pmd"
	Menu_build "pmd"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_pmd3= New-Object System.Windows.Forms.ToolStripMenuItem
#$fm_menu_pmd3.Text= "3.exe"
$fm_menu_pmd3.Visible= $False

$fm_menu_pmd3.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){

	Fmchange_value "pmd" $this.Text
	Fmchange_value "compiler" "pmd"

	$script:opt["radio_bin"]= Menu_comp_build "pmd"
	Menu_build "pmd"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})
  
$fm_menu_ply0= New-Object System.Windows.Forms.ToolStripMenuItem 
# $fm_menu_ply0.Text= "0.exe"
$fm_menu_ply0.Visible= $False

$fm_menu_ply0.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Change_value "player" $this.Text
	Menu_build "player"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_ply1= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_ply1.Text= "1.exe"
$fm_menu_ply1.Visible= $False

$fm_menu_ply1.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Change_value "player" $this.Text
	Menu_build "player"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_ply2= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_ply2.Text= "2.exe"
$fm_menu_ply2.Visible= $False

$fm_menu_ply2.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Change_value "player" $this.Text
	Menu_build "player"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_ply3= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_ply3.Text= "3.exe"
$fm_menu_ply3.Visible= $False

$fm_menu_ply3.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Change_value "player" $this.Text
	Menu_build "player"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_ply4= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_ply4.Text= "4.exe"
$fm_menu_ply4.Visible= $False

$fm_menu_ply4.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Change_value "player" $this.Text
	Menu_build "player"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_ply5= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_ply5.Text= "5.exe"
$fm_menu_ply5.Visible= $False

$fm_menu_ply5.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Change_value "player" $this.Text
	Menu_build "player"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_ply6= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_ply6.Text= "6.exe"
$fm_menu_ply6.Visible= $False

$fm_menu_ply6.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Change_value "player" $this.Text
	Menu_build "player"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_ply7= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_ply7.Text= "7.exe"
$fm_menu_ply7.Visible= $False

$fm_menu_ply7.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Change_value "player" $this.Text
	Menu_build "player"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})
 
$fm_menu_dos0= New-Object System.Windows.Forms.ToolStripMenuItem 
# $fm_menu_dos0.Text= "0.exe"
$fm_menu_dos0.Visible= $False

$fm_menu_dos0.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Change_value "dos" $this.Text
	Menu_build "dos"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_dos1= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_dos1.Text= "1.exe"
$fm_menu_dos1.Visible= $False

$fm_menu_dos1.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Change_value "dos" $this.Text
	Menu_build "dos"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_dos2= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_dos2.Text= "2.exe"
$fm_menu_dos2.Visible= $False

$fm_menu_dos2.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Change_value "dos" $this.Text
	Menu_build "dos"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_dos3= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_dos3.Text= "3.exe"
$fm_menu_dos3.Visible= $False

$fm_menu_dos3.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Change_value "dos" $this.Text
	Menu_build "dos"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})
 
$fm_menu_edt0= New-Object System.Windows.Forms.ToolStripMenuItem 
# $fm_menu_edt0.Text= "0.exe"
$fm_menu_edt0.Visible= $False

$fm_menu_edt0.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Change_value "editor" $this.Text
	Menu_build "editor"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_edt1= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_edt1.Text= "1.exe"
$fm_menu_edt1.Visible= $False

$fm_menu_edt1.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Change_value "editor" $this.Text
	Menu_build "editor"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_edt2= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_edt2.Text= "2.exe"
$fm_menu_edt2.Visible= $False

$fm_menu_edt2.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Change_value "editor" $this.Text
	Menu_build "editor"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_edt3= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_edt3.Text= "3.exe"
$fm_menu_edt3.Visible= $False

$fm_menu_edt3.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Change_value "editor" $this.Text
	Menu_build "editor"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_edt4= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_edt4.Text= "4.exe"
$fm_menu_edt4.Visible= $False

$fm_menu_edt4.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Change_value "editor" $this.Text
	Menu_build "editor"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_edt5= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_edt5.Text= "5.exe"
$fm_menu_edt5.Visible= $False

$fm_menu_edt5.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Change_value "editor" $this.Text
	Menu_build "editor"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_edt6= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_edt6.Text= "6.exe"
$fm_menu_edt6.Visible= $False

$fm_menu_edt6.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Change_value "editor" $this.Text
	Menu_build "editor"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})

$fm_menu_edt7= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_edt7.Text= "7.exe"
$fm_menu_edt7.Visible= $False

$fm_menu_edt7.Add_Click({
 try{
  if($this.Text.Contains("[v]") -eq $False){
	Change_value "editor" $this.Text
	Menu_build "editor"
	Stus_build
  }
 }catch{
	echo $_.exception
 }
})
  
$fm_menu_m= New-Object System.Windows.Forms.ToolStripMenuItem 
$fm_menu_m.Text= "Octave"

$fm_menu_mask= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_mask.Text= "4op.mask"

$fm_menu_mask.Add_Click({

 try{

  switch($sub_mask.Visible){
  'False'{
	$this.Text= "v 4op.mask"
	$sub_mask.Show()
	break;
  }'True'{
	$sub_mask.Close() # $sub_mask.Add_FormClosingへ
  }
  } #sw

 }catch{
	echo $_.exception
    	Write-Host '"ERROR: Safety Stopper >> $sub_mask.Show()"'
 }
})
	 
$fm_menu_so= New-Object System.Windows.Forms.ToolStripSeparator 
 
$fm_menu_oct1= New-Object System.Windows.Forms.ToolStripMenuItem 
#$fm_menu_oct1.Text= "o1"
$fm_menu_oct1.Add_Click({
 try{
	if($this.Text.Contains("[v]") -eq $False){

		$script:key["oct"]= Osc_sw "o1"
		Stus_build # <- $script:key["oct"] nochi

		if($sb_alg.Visible){
			Pict_chg
			Contxt_octave $key["oct"]
		}
	}
 }catch{
	echo $_.exception
 }
})
 
$fm_menu_oct2= New-Object System.Windows.Forms.ToolStripMenuItem 
#$fm_menu_oct2.Text= "o2"
$fm_menu_oct2.Add_Click({
 try{
	if($this.Text.Contains("[v]") -eq $False){

		$script:key["oct"]= Osc_sw "o2"
		Stus_build

		if($sb_alg.Visible){
			Pict_chg
			Contxt_octave $key["oct"]
		}
	}
 }catch{
	echo $_.exception
 }
})
 
$fm_menu_oct3= New-Object System.Windows.Forms.ToolStripMenuItem 
#$fm_menu_oct3.Text= "o3"
$fm_menu_oct3.Add_Click({
 try{
 	if($this.Text.Contains("[v]") -eq $False){

		$script:key["oct"]= Osc_sw "o3"
		Stus_build

		if($sb_alg.Visible){
			Pict_chg
			Contxt_octave $key["oct"]
		}
	}
 }catch{
	echo $_.exception
 }
})
 
$fm_menu_oct4= New-Object System.Windows.Forms.ToolStripMenuItem 
#$fm_menu_oct4.Text= "o4"
$fm_menu_oct4.Add_Click({
 try{
 	if($this.Text.Contains("[v]") -eq $False){

		$script:key["oct"]= Osc_sw "o4"
		Stus_build

		if($sb_alg.Visible){
			Pict_chg
			Contxt_octave $key["oct"]
		}
	}
 }catch{
	echo $_.exception
 }
})
 
$fm_menu_oct5= New-Object System.Windows.Forms.ToolStripMenuItem 
#$fm_menu_oct5.Text= "o5"
$fm_menu_oct5.Add_Click({
 try{
 	if($this.Text.Contains("[v]") -eq $False){

		$script:key["oct"]= Osc_sw "o5"
		Stus_build

		if($sb_alg.Visible){
			Pict_chg
			Contxt_octave $key["oct"]
		}
	}
 }catch{
	echo $_.exception
 }
})
 
$fm_menu_oct6= New-Object System.Windows.Forms.ToolStripMenuItem 
#$fm_menu_oct6.Text= "o6"
$fm_menu_oct6.Add_Click({
 try{
 	if($this.Text.Contains("[v]") -eq $False){

		$script:key["oct"]= Osc_sw "o6"
		Stus_build

		if($sb_alg.Visible){
			Pict_chg
			Contxt_octave $key["oct"]
		}
	}
 }catch{
	echo $_.exception
 }
})
 
$fm_menu_oct7= New-Object System.Windows.Forms.ToolStripMenuItem 
#$fm_menu_oct7.Text= "o7"
$fm_menu_oct7.Add_Click({
 try{
	if($this.Text.Contains("[v]") -eq $False){

		$script:key["oct"]= Osc_sw "o7"
		Stus_build

		if($sb_alg.Visible){
			Pict_chg
			Contxt_octave $key["oct"]
		}
	}
 }catch{
	echo $_.exception
 }
})
 
$fm_menu_oct8= New-Object System.Windows.Forms.ToolStripMenuItem 
#$fm_menu_oct8.Text= "o8"
$fm_menu_oct8.Add_Click({
 try{
	if($this.Text.Contains("[v]") -eq $False){

		$script:key["oct"]= Osc_sw "o8"	
		Stus_build

		if($sb_alg.Visible){
			Pict_chg
			Contxt_octave $key["oct"]
		}
	}
 }catch{
	echo $_.exception
 }
})
 	 
$fm_menu_b= New-Object System.Windows.Forms.ToolStripMenuItem 
$fm_menu_b.Text= "TextBox"

$fm_menu_put= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_put.Text= "Output"


$fm_menu_type= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_type.Text= "vrc7 Type"


$fm_menu_style= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_style.Text= "4op Style"


$fm_menu_sendn= New-Object System.Windows.Forms.ToolStripSeparator

$fm_menu_send= New-Object System.Windows.Forms.ToolStripMenuItem
# $fm_menu_send.Text= "send"

$fm_menu_send.Add_Click({
 try{
	Send_build 0
 }catch{
	echo $_.exception
 }
})

$fm_menu_mmlun= New-Object System.Windows.Forms.ToolStripSeparator

$fm_menu_mml= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_mml.Text= "Voice Value Clipboard"

$fm_menu_mml.Add_Click({
 try{
	[Windows.Forms.Clipboard]::SetText($fm_box.Text, [Windows.Forms.TextDataFormat]::UnicodeText)

	if($sb_alg.Visible){
		Monotone_select "conv_btn" # line書込
	}
 }catch{
	echo $_.exception
 }
})

$fm_menu_copy= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_copy.Text= "header+ Voice Clipboard"
$fm_menu_copy.ForeColor= "Black"

$fm_menu_copy.Add_Click({
 try{
	Box_listen 1 # Clipboard

	if($sb_alg.Visible){
		Monotone_select "conv_btn"
	}
 }catch{
	echo $_.exception
 }
})
	 
$fm_menu_zero= New-Object System.Windows.Forms.ToolStripMenuItem 
#$fm_menu_zero.Text= "zero padding"
$fm_menu_zero.Add_Click({
 try{
	switch($key["zero"]){
	'False'{	$script:key["zero"]= Zero_sw $True; break;
	}'True'{	$script:key["zero"]= Zero_sw $False
	}
	} #sw

	Box_read

 }catch{
	echo $_.exception
 }
})

$fm_menu_ten= New-Object System.Windows.Forms.ToolStripMenuItem
#$fm_menu_ten.Text= "comma"
$fm_menu_ten.Add_Click({
 try{
	switch($key["ten"]){
	'False'{	$script:key["ten"]= Ten_sw $True; break;
	}'True'{	$script:key["ten"]= Ten_sw $False
	}
	} #sw

	Box_read

 }catch{
	echo $_.exception
 }
})
 
$fm_menu_type_nsd= New-Object System.Windows.Forms.ToolStripMenuItem 
#$fm_menu_type_nsd.Text= "NSD"
$fm_menu_type_nsd.Add_Click({
 try{
	$script:key["type"]= Type_sw "nsd"
	$script:key["ten"]= Ten_sw $False
	Change_value "compiler" "nsd"

	if($comb_fm.SelectedItem -eq 'vrc7 2op'){

		Panel_chg $comb_fm.SelectedItem
		Menu_build "compiler"
		Stus_build

		Unredo 2
	}
 }catch{
	echo $_.exception
 }
})

$fm_menu_type_mckreg= New-Object System.Windows.Forms.ToolStripMenuItem
#$fm_menu_type_mckreg.Text= "MCK Reg"
$fm_menu_type_mckreg.Add_Click({
 try{
	$script:key["type"]= Type_sw "mckreg"
	Change_value "compiler" "mck"

	if($comb_fm.SelectedItem -eq 'vrc7 2op'){

		Panel_chg $comb_fm.SelectedItem
		Menu_build "compiler"
		Stus_build

		Unredo 2
	}
 }catch{
	echo $_.exception
 }
})

$fm_menu_type_nsdreg= New-Object System.Windows.Forms.ToolStripMenuItem
#$fm_menu_type_nsdreg.Text= "NSD Reg"
$fm_menu_type_nsdreg.Add_Click({
 try{
	$script:key["type"]= Type_sw "nsdreg"
	Change_value "compiler" "nsd"

	if($comb_fm.SelectedItem -eq 'vrc7 2op'){

		Panel_chg $comb_fm.SelectedItem
		Menu_build "compiler"
		Stus_build

		Unredo 2
	}
 }catch{
	echo $_.exception
 }
})
 
$fm_menu_style_pmd= New-Object System.Windows.Forms.ToolStripMenuItem 
#$fm_menu_style_pmd.Text= "PMD"
$fm_menu_style_pmd.Add_Click({
  try{
	$script:key["style"]= Style_sw "pmd"
	$script:key["ten"]= Ten_sw $False

	if($comb_fm.SelectedItem -ne 'vrc7 2op'){

		Panel_chg $comb_fm.SelectedItem
		Menu_build "compiler"
		Stus_build

		Unredo 2
	}
  }catch{
	echo $_.exception
  }
})

$fm_menu_style_mucom= New-Object System.Windows.Forms.ToolStripMenuItem
#$fm_menu_style_mucom.Text= "MUCOM"
$fm_menu_style_mucom.Add_Click({
 try{
	$script:key["style"]= Style_sw "mucom"
	$script:key["ten"]= Ten_sw $True

	if($comb_fm.SelectedItem -ne 'vrc7 2op'){

		Panel_chg $comb_fm.SelectedItem
		Menu_build "compiler"
		Stus_build

		Unredo 2
	}
  }catch{
	echo $_.exception
  }
})

$fm_menu_style_fmp7= New-Object System.Windows.Forms.ToolStripMenuItem
#$fm_menu_style_fmp7.Text= "FMP7"
$fm_menu_style_fmp7.Add_Click({
 try{
	$script:key["style"]= Style_sw "fmp7"
	$script:key["ten"]= Ten_sw $True

	if($comb_fm.SelectedItem -ne 'vrc7 2op'){

		Panel_chg $comb_fm.SelectedItem
		Menu_build "compiler"
		Stus_build

		Unredo 2
	}
  }catch{
	echo $_.exception
  }
})

$fm_menu_style_mxdrv= New-Object System.Windows.Forms.ToolStripMenuItem
#$fm_menu_style_mxdrv.Text= "MXDRV"
$fm_menu_style_mxdrv.Add_Click({
  try{
	$script:key["style"]= Style_sw "mxdrv"
	$script:key["ten"]= Ten_sw $True

	if($comb_fm.SelectedItem -ne 'vrc7 2op'){

		Panel_chg $comb_fm.SelectedItem
		Menu_build "compiler"
		Stus_build

		Unredo 2
	}
  }catch{
	echo $_.exception
  }
})
  
$fm_menu_w= New-Object System.Windows.Forms.ToolStripMenuItem 
$fm_menu_w.Text= "Window"

$fm_menu_sb= New-Object System.Windows.Forms.ToolStripMenuItem
#$fm_menu_sb.Text= "FM OP window"

$fm_menu_sb.Add_Click({
 try{

  switch($key["open"]){
  'False'{

	$script:key["open"]= Popalg_build $True
	$sb_alg.Show()
	break;
  }'True'{

	## $script:key["open"]= Popalg_build $False
	$sb_alg.Close() # $sb_alg.Add_FormClosingへ
  }
  } #sw

 }catch{
	echo $_.exception
    	Write-Host '"ERROR: Safety Stopper >> $sb_alg.Show()"'
 }
})

$fm_menu_spy= New-Object System.Windows.Forms.ToolStripSeparator

$fm_menu_py= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_py.Text= "Player open"

$fm_menu_py.Add_Click({
 try{
	[string]$retn= Player_open 0 $val["player"]

	if($retn -ne ""){

		$retn= [Windows.Forms.MessageBox]::Show(
		$retn, "確認", "OK","Information","Button1"
		)
	}
 }catch{
	echo $_.exception
 }
})
 
$fm_menu_h= New-Object System.Windows.Forms.ToolStripMenuItem 
$fm_menu_h.Text= "Help"


$fm_menu_whelp= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_whelp.Text= "FMToneEditor Help"

$fm_menu_whelp.Add_Click({
 try{
	[string] $s= ""
	foreach($d in $edit.Keys){

		if($d.Contains("sted") -eq $True){
			$s= $d
			break; # first hit de stop
		}
	} #

	if($s -ne ""){
		[string]$retn= Editor_open $edit[$s] "..\doc\FM_Tone_Editor.txt"
	}else{
		[string]$retn= Editor_open $val["editor"] "..\doc\FM_Tone_Editor.txt"
	}

	if($retn -ne ''){
		$retn= [Windows.Forms.MessageBox]::Show(
		$retn, "確認", "OK","Information","Button1"
		)
	}
 }catch{
	echo $_.exception
 }
})

$fm_menu_srld= New-Object System.Windows.Forms.ToolStripSeparator
$fm_menu_rld= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_rld.Text= "mml Header reload"
$fm_menu_rld.Add_Click({
 try{
	$script:header["fm_header_mck"]= (cat '.\header\fm_header_mck' | Out-String)
	$script:header["fm_header_nsd"]= (cat '.\header\fm_header_nsd' | Out-String)
	$script:header["fm_header_pmd"]= (cat '.\header\fm_header_pmd' | Out-String)

	$script:box_mml["mck"]= (cat '.\header\fm_mml_mck' | Out-String)
	$script:box_mml["nsd"]= (cat '.\header\fm_mml_nsd' | Out-String)
	$script:box_mml["pmd"]= (cat '.\header\fm_mml_pmd' | Out-String)

	Write-Host '<< mml headerをリロードしました'

	$retn= [Windows.Forms.MessageBox]::Show(
	"mml headerをリロードしました", "確認", "OK","Information","Button1"
	)
 }catch{
	echo $_.exception
 }
})
	
$fm_menu_adv= New-Object System.Windows.Forms.ToolStripMenuItem 
$fm_menu_adv.Text= "Advanced"
 
$fm_menu_sadv= New-Object System.Windows.Forms.ToolStripSeparator 
 
$fm_menu_mckh= New-Object System.Windows.Forms.ToolStripMenuItem 
$fm_menu_mckh.Text= "edit mck header"
$fm_menu_mckh.Add_Click({
 try{
	Adv_edit "mck"
 }catch{
	echo $_.exception
 }
})

$fm_menu_mckm= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_mckm.Text= "edit mck mml"
$fm_menu_mckm.Add_Click({
 try{
	Adv_edit "mck_mml"
 }catch{
	echo $_.exception
 }
})
 
$fm_menu_nsdh= New-Object System.Windows.Forms.ToolStripMenuItem 
$fm_menu_nsdh.Text= "edit nsd header"
$fm_menu_nsdh.Add_Click({
 try{
	Adv_edit "nsd"
 }catch{
	echo $_.exception
 }
})

$fm_menu_nsdm= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_nsdm.Text= "edit nsd mml"
$fm_menu_nsdm.Add_Click({
 try{
	Adv_edit "nsd_mml"
 }catch{
	echo $_.exception
 }
})
 
$fm_menu_pmdh= New-Object System.Windows.Forms.ToolStripMenuItem 
$fm_menu_pmdh.Text= "edit pmd header"
$fm_menu_pmdh.Add_Click({
 try{
	Adv_edit "pmd"
 }catch{
	echo $_.exception
 }
})

$fm_menu_pmdm= New-Object System.Windows.Forms.ToolStripMenuItem
$fm_menu_pmdm.Text= "edit pmd mml"
$fm_menu_pmdm.Add_Click({
 try{
	Adv_edit "pmd_mml"
 }catch{
	echo $_.exception
 }
})
   
$fm_menu_lad.DropDownItems.AddRange(@($fm_lad_a,$fm_lad_b,$fm_lad_c,$fm_lad_d,$fm_lad_e,$fm_lad_f,$fm_lad_g,$fm_lad_h)) 
$fm_menu_sav.DropDownItems.AddRange(@($fm_sav_a,$fm_sav_b,$fm_sav_c,$fm_sav_d,$fm_sav_e,$fm_sav_f,$fm_sav_g,$fm_sav_h))

$fm_menu_cpmd.DropDownItems.AddRange(@($fm_menu_pmd0,$fm_menu_pmd1,$fm_menu_pmd2,$fm_menu_pmd3))
$fm_menu_cnsd.DropDownItems.AddRange(@($fm_menu_nsd0,$fm_menu_nsd1,$fm_menu_nsd2,$fm_menu_nsd3))
$fm_menu_cmck.DropDownItems.AddRange(@($fm_menu_mck0,$fm_menu_mck1,$fm_menu_mck2,$fm_menu_mck3))
$fm_menu_comp.DropDownItems.AddRange(@($fm_menu_cmck,$fm_menu_cnsd,$fm_menu_cpmd))

$fm_menu_play.DropDownItems.AddRange(@($fm_menu_ply0,$fm_menu_ply1,$fm_menu_ply2,$fm_menu_ply3,$fm_menu_ply4,$fm_menu_ply5,$fm_menu_ply6,$fm_menu_ply7))
$fm_menu_dosv.DropDownItems.AddRange(@($fm_menu_dos0,$fm_menu_dos1,$fm_menu_dos2,$fm_menu_dos3))
$fm_menu_edit.DropDownItems.AddRange(@($fm_menu_edt0,$fm_menu_edt1,$fm_menu_edt2,$fm_menu_edt3,$fm_menu_edt4,$fm_menu_edt5,$fm_menu_edt6,$fm_menu_edt7))

$fm_menu_type.DropDownItems.AddRange(@($fm_menu_type_nsd,$fm_menu_type_mckreg,$fm_menu_type_nsdreg))
$fm_menu_style.DropDownItems.AddRange(@($fm_menu_style_pmd,$fm_menu_style_mucom,$fm_menu_style_fmp7,$fm_menu_style_mxdrv))
$fm_menu_put.DropDownItems.AddRange(@($fm_menu_zero,$fm_menu_ten))
$fm_menu_adv.DropDownItems.AddRange(@($fm_menu_mckh, $fm_menu_nsdh, $fm_menu_pmdh, $fm_menu_sadv, $fm_menu_mckm, $fm_menu_nsdm, $fm_menu_pmdm))

$fm_menu_kt.DropDownItems.AddRange(@($menu_fty,$fm_menu_auton,$fm_menu_auto,$fm_menu_rcver,$fm_menu_rstn,$fm_menu_rst))

$fm_menu_f.DropDownItems.AddRange(@($fm_menu_pset,$fm_menu_ladn,$fm_menu_lad,$fm_menu_sav,$fm_menu_ktn,$fm_menu_kt,$fm_menu_sn,$fm_menu_n))
$fm_menu_o.DropDownItems.AddRange(@($fm_menu_ud,$fm_menu_comn,$fm_menu_comp,$fm_menu_play,$fm_menu_dosv,$fm_menu_edit,$fm_menu_setn,$fm_menu_set))

$fm_menu_m.DropDownItems.AddRange(@($fm_menu_mask,$fm_menu_so,$fm_menu_oct1,$fm_menu_oct2,$fm_menu_oct3,$fm_menu_oct4,$fm_menu_oct5,$fm_menu_oct6,$fm_menu_oct7,$fm_menu_oct8))
$fm_menu_b.DropDownItems.AddRange(@($fm_menu_put,$fm_menu_type,$fm_menu_style,$fm_menu_sendn,$fm_menu_send,$fm_menu_mmlun,$fm_menu_mml,$fm_menu_copy))
$fm_menu_w.DropDownItems.AddRange(@($fm_menu_sb,$fm_menu_spy,$fm_menu_py))
$fm_menu_h.DropDownItems.AddRange(@($fm_menu_adv,$fm_menu_rld,$fm_menu_srld,$fm_menu_whelp))

$fm_mnu.Items.AddRange(@($fm_menu_f,$fm_menu_o,$fm_menu_m,$fm_menu_b,$fm_menu_w,$fm_menu_h))
$osc_grp.Controls.AddRange(@($comb_vrc,$comb_opl,$comb_opn,$comb_opm,$comb_fm,$lisn_btn,$conv_btn))
$fm_panel.Controls.AddRange(@($eg_grp,$lev_grp,$ring_grp,$op_grp,$alg_grp,$osc_grp))
$fm_stus.Items.AddRange(@($fm_label))

$frm_fm.Controls.AddRange(@($fm_mnu, $fm_panel, $fm_box_mml, $fm_box, $fm_stus))
   
# Global variable ====== 
	 
# color setting 








	 
 try{ 
 
# bg,line,text ------ 

$poix= New-Object System.Drawing.Point(0,0)			# グラデーションpoint obj
$poia= New-Object System.Drawing.Point(162,0)
	 
# 'white' set ------ 
$white= [System.Drawing.Color]::FromArgb(255, 251, 250, 245)	# 生成り色 A:254
$white248= [System.Drawing.Color]::FromArgb(248, $white.R, $white.G, $white.B)

$darkwhite= [System.Drawing.Color]::FromArgb(240,255,255,252)	# 胡粉色 a:240
$gr_white= [System.Drawing.Color]::FromArgb(199,255,255,252)	# a:224

$Cdbrend= New-Object System.Drawing.Drawing2D.ColorBlend(3)	# グラデーション
$Cdbrend.Colors= @($gr_white,$darkwhite,$gr_white)
$Cdbrend.Positions= @(0.0, 0.25, 1.0)

# alg fill,Polygon -----
$Whsolid= New-Object System.Drawing.SolidBrush($white)
$Whwpen= New-Object System.Drawing.Pen($darkwhite, 2)
# .LinearGradientBrush 仮色指定が必要
$Whbrush= New-Object System.Drawing.Drawing2D.LinearGradientBrush($poix,$poia,$darkwhite,$gr_white)
$Whbrush.InterpolationColors= $Cdbrend
 
# 'black' set ----- 
$black= [System.Drawing.Color]::FromArgb(255, 24, 39, 61) # 59,71)	# 暗黒色改 Aは高級感 236,34,62,68
$black246= [System.Drawing.Color]::FromArgb(246, $black.R, $black.G, $black.B)

$naturalblack= [System.Drawing.Color]::FromArgb(216,0,11,0)		# 濡羽色 A:236
$gr_black= [System.Drawing.Color]::FromArgb(124,0,11,0)		# a:184

$Clbrend= New-Object System.Drawing.Drawing2D.ColorBlend(3)
$Clbrend.Colors= @($gr_black,$naturalblack,$gr_black)
$Clbrend.Positions= @(0.0, 0.25, 1.0)

# alg fill,Polygon -----
$Blsolid= New-Object System.Drawing.SolidBrush($black)
$Blwpen= New-Object System.Drawing.Pen($naturalblack, 2)
# .LinearGradientBrush 仮色指定が必要
$Blbrush= New-Object System.Drawing.Drawing2D.LinearGradientBrush($poix,$poia,$naturalblack,$gr_black)
$Blbrush.InterpolationColors= $Clbrend
  
# 桜色254,244,244	# 薄桜253,239,251	# 月白234,244,252 
# 生成り色251,250,245	# 卯の花色247,252,254	# 白磁248,251,248	# 胡粉色255,255,252
# 憲法黒茶36,26,8	# 鉄黒40,26,20		# 濡羽色 0,11,0		# 暗黒色22,22,14

#蒲公英色255,217,0	#黄色255,217,17		#中黄255,234,0
#向日葵色252,200,0	#山吹色248,181,0	#菜の花色255,236,71
#金色230,180,34		#金糸雀色235,216,66
 
# poly,sine,text ------ 
	 
$darkblue= [System.Drawing.Color]::FromArgb(195,0,139,139)	# 185 -> 195 alpha 
$naturalblue= [System.Drawing.Color]::FromArgb(221,32,178,170)	# 241 -> 221
$pastelblue= [System.Drawing.Color]::FromArgb(190,0,225,201)	# 190
$vividblue= [System.Drawing.Color]::FromArgb(200,35,134,215)	# 220 -> 200

$darkBEllipse= New-Object System.Drawing.SolidBrush($darkblue)
$naturalBEllipse= New-Object System.Drawing.SolidBrush($naturalblue)
$pastelBEllipse= New-Object System.Drawing.SolidBrush($pastelblue)
$vividBEllipse= New-Object System.Drawing.SolidBrush($vividblue)

$darkBPieD= Silver_convert $darkblue 0
$naturalBPieD= Silver_convert $naturalblue 0
$pastelBPieD= Silver_convert $pastelblue 0
$vividBPieD= Silver_convert $vividblue 0

$darkBPie= Silver_convert $darkblue 1
$naturalBPie= Silver_convert $naturalblue 1
$pastelBPie= Silver_convert $pastelblue 1
$vividBPie= Silver_convert $vividblue 1

$darkBPieL= Silver_convert $darkblue 2
$naturalBPieL= Silver_convert $naturalblue 2
$pastelBPieL= Silver_convert $pastelblue 2
$vividBPieL= Silver_convert $vividblue 2
 
$darkgreen= [System.Drawing.Color]::FromArgb(195,107,162,35) 
$naturalgreen= [System.Drawing.Color]::FromArgb(221,154,215,50)
$pastelgreen= [System.Drawing.Color]::FromArgb(190,140,220,61)
$vividgreen= [System.Drawing.Color]::FromArgb(200,35,216,66)

$darkGEllipse= New-Object System.Drawing.SolidBrush($darkgreen)
$naturalGEllipse= New-Object System.Drawing.SolidBrush($naturalgreen)
$pastelGEllipse= New-Object System.Drawing.SolidBrush($pastelgreen)
$vividGEllipse= New-Object System.Drawing.SolidBrush($vividgreen)

$darkGPieD= Silver_convert $darkgreen 0
$naturalGPieD= Silver_convert $naturalgreen 0
$pastelGPieD= Silver_convert $pastelgreen 0
$vividGPieD= Silver_convert $vividgreen 0

$darkGPie= Silver_convert $darkgreen 1
$naturalGPie= Silver_convert $naturalgreen 1
$pastelGPie= Silver_convert $pastelgreen 1
$vividGPie= Silver_convert $vividgreen 1

$darkGPieL= Silver_convert $darkgreen 2
$naturalGPieL= Silver_convert $naturalgreen 2
$pastelGPieL= Silver_convert $pastelgreen 2
$vividGPieL= Silver_convert $vividgreen 2
 
$darkorange= [System.Drawing.Color]::FromArgb(195,231,226,24) 
$naturalorange= [System.Drawing.Color]::FromArgb(221,239,254,48)
$pastelorange= [System.Drawing.Color]::FromArgb(190,254,248,34)
$vividorange= [System.Drawing.Color]::FromArgb(200,242,246,25)

$darkOEllipse= New-Object System.Drawing.SolidBrush($darkorange)
$naturalOEllipse= New-Object System.Drawing.SolidBrush($naturalorange)
$pastelOEllipse= New-Object System.Drawing.SolidBrush($pastelorange)
$vividOEllipse= New-Object System.Drawing.SolidBrush($vividorange)

$darkOPieD= Silver_convert $darkorange 0
$naturalOPieD= Silver_convert $naturalorange 0
$pastelOPieD= Silver_convert $pastelorange 0
$vividOPieD= Silver_convert $vividorange 0

$darkOPie= Silver_convert $darkorange 1
$naturalOPie= Silver_convert $naturalorange 1
$pastelOPie= Silver_convert $pastelorange 1
$vividOPie= Silver_convert $vividorange 1

$darkOPieL= Silver_convert $darkorange 2
$naturalOPieL= Silver_convert $naturalorange 2
$pastelOPieL= Silver_convert $pastelorange 2
$vividOPieL= Silver_convert $vividorange 2
 
$darkred= [System.Drawing.Color]::FromArgb(195,189,72,76) 
$naturalred= [System.Drawing.Color]::FromArgb(221,255,99,71)
$pastelred= [System.Drawing.Color]::FromArgb(190,252,81,84)
$vividred= [System.Drawing.Color]::FromArgb(200,241,55,55)

$darkREllipse= New-Object System.Drawing.SolidBrush($darkred)
$naturalREllipse= New-Object System.Drawing.SolidBrush($naturalred)
$pastelREllipse= New-Object System.Drawing.SolidBrush($pastelred)
$vividREllipse= New-Object System.Drawing.SolidBrush($vividred)

$darkRPieD= Silver_convert $darkred 0
$naturalRPieD= Silver_convert $naturalred 0
$pastelRPieD= Silver_convert $pastelred 0
$vividRPieD= Silver_convert $vividred 0

$darkRPie= Silver_convert $darkred 1
$naturalRPie= Silver_convert $naturalred 1
$pastelRPie= Silver_convert $pastelred 1
$vividRPie= Silver_convert $vividred 1

$darkRPieL= Silver_convert $darkred 2
$naturalRPieL= Silver_convert $naturalred 2
$pastelRPieL= Silver_convert $pastelred 2
$vividRPieL= Silver_convert $vividred 2
  
# nomal color 
$yellow= [System.Drawing.Color]::FromName("orange")		# RGup de yellow
$magenta= [System.Drawing.Color]::FromName("magenta")
$cyan= [System.Drawing.Color]::FromName("cyan")
$lime= [System.Drawing.Color]::FromName("lime")

# sine wave -----
$Ypen= New-Object System.Drawing.Pen($yellow, 1 )	# Draw
$Mpen= New-Object System.Drawing.Pen($magenta, 1 )
$Cpen= New-Object System.Drawing.Pen($cyan, 1 )
$Lpen= New-Object System.Drawing.Pen($lime, 1 )

# alg font point -----
$Ybrush= New-Object System.Drawing.SolidBrush($yellow)	# Fill
$Mbrush= New-Object System.Drawing.SolidBrush($magenta)
$Cbrush= New-Object System.Drawing.SolidBrush($cyan)
$Lbrush= New-Object System.Drawing.SolidBrush($lime)
 
# hilight color ------ 
$skyblue= [System.Drawing.Color]::FromArgb(210,176,224,230)	# powderblue :a220 -> [Alpha-20]
$greenyellow= [System.Drawing.Color]::FromArgb(210,173,255,47)	# greenyellow
$gold= [System.Drawing.Color]::FromArgb(210,255,215,0)		# gold 255,215,0
$pink= [System.Drawing.Color]::FromArgb(210,255,182,193)		# lightpink
$thistle= [System.Drawing.Color]::FromArgb(220,216,191,216)

# DrawString -----
$XBbrush= New-Object System.Drawing.SolidBrush($skyblue)
$XGbrush= New-Object System.Drawing.SolidBrush($greenyellow)
$XObrush= New-Object System.Drawing.SolidBrush($gold)
$XRbrush= New-Object System.Drawing.SolidBrush($pink)

# 中心軸,枠 -----
$XBpen= New-Object System.Drawing.Pen($skyblue, 1)
$XGpen= New-Object System.Drawing.Pen($greenyellow, 1)
$XOpen= New-Object System.Drawing.Pen($gold, 1)
$XRpen= New-Object System.Drawing.Pen($pink, 1)

# cable -----
$Ppen= New-Object System.Drawing.Pen($thistle, 7)	# Draw
$Bpen= New-Object System.Drawing.Pen($skyblue, 7)
$Gpen= New-Object System.Drawing.Pen($greenyellow, 7)
$Open= New-Object System.Drawing.Pen($gold, 7)
$Rpen= New-Object System.Drawing.Pen($pink, 7)


 
# listen line ------ 
$plum= [System.Drawing.Color]::FromName("plum")
$turquoise= [System.Drawing.Color]::FromName("powderblue")
$khaki= [System.Drawing.Color]::FromName("khaki")

$Pbrush= New-Object System.Drawing.SolidBrush($plum)
$Tbrush= New-Object System.Drawing.SolidBrush($turquoise)
$Kbrush= New-Object System.Drawing.SolidBrush($khaki)
 
# cyan		powderblue	darkcyan	cadetblue	lightseagreen 
# lime		greenyellow	olivedrab	darkseagreen	yellowgreen
# orange	gold	goldenrod	darkkhaki	khaki
# magenta	lightpink	brown	rosybrown	tomato
# plum		thistle		indigo
 
# $trans= [System.Drawing.Color]::FromName($transparent)	# 透明色 
 
 }catch{ 
	echo $_.exception
	Write-Host '"ERROR: Safety Stopper >> Color object err"'
 }
  
# Exit; 
 
# cable pointer 

# pos / 480,530
#	(530-5-100*4)/5= 25

#	20,	80= 5+25+50	180, 80
#	100,	205=80+100+25	260, 205
#	180,	330=205+100+25	340, 330
#	260,	455=330+100+25	420, 455
	
 try{ 
 
# 4op ------ 
 
[array]$pointab= @("","","","", "") # alg0 
[array]$pointab[0]= @("","","","")
[array]$pointab[1]= @("","","","")
[array]$pointab[2]= @("","","","")
[array]$pointab[3]= @("","","","")
[array]$pointab[4]= @("","","","")

$pointab[0][0]=  New-Object System.Drawing.Point(180,80)
$pointab[0][1]=  New-Object System.Drawing.Point(230,170) # 50,90 feedback
$pointab[0][2]=  New-Object System.Drawing.Point(-30,170)
$pointab[0][3]=  New-Object System.Drawing.Point(20,60)

$pointab[1][0]=  New-Object System.Drawing.Point(100,205)
$pointab[1][1]=  New-Object System.Drawing.Point(20,225) # 80,20
$pointab[1][2]=  New-Object System.Drawing.Point(240,140) # 60,60 1線1段
$pointab[1][3]=  New-Object System.Drawing.Point(180,80)

$pointab[2][0]=  New-Object System.Drawing.Point(180,330)
$pointab[2][1]=  New-Object System.Drawing.Point(100,350) # 80,20
$pointab[2][2]=  New-Object System.Drawing.Point(320,265) # 60,60 1線1段
$pointab[2][3]=  New-Object System.Drawing.Point(260,205)

$pointab[3][0]=  New-Object System.Drawing.Point(260,455)
$pointab[3][1]=  New-Object System.Drawing.Point(180,475) # 80,20
$pointab[3][2]=  New-Object System.Drawing.Point(400,390) # 60,60 1線1段
$pointab[3][3]=  New-Object System.Drawing.Point(340,330)

$pointab[4][0]=  New-Object System.Drawing.Point(485,505) # 480+5 gomikeshi
$pointab[4][1]=  New-Object System.Drawing.Point(530,505) # 50,0 outputline
$pointab[4][2]=  New-Object System.Drawing.Point(530,455)
$pointab[4][3]=  New-Object System.Drawing.Point(420,455)
 
[array]$pointad= @("","","","", "") # alg1 
[array]$pointad[0]= @("","","","")
[array]$pointad[1]= @("","","","")
[array]$pointad[2]= @("","","","")
[array]$pointad[3]= @("","","","")
[array]$pointad[4]= @("","","","")

$pointad[0][0]=  New-Object System.Drawing.Point(180,80)
$pointad[0][1]=  New-Object System.Drawing.Point(230,170) # 50,90 feedback
$pointad[0][2]=  New-Object System.Drawing.Point(-30,170)
$pointad[0][3]=  New-Object System.Drawing.Point(20,60)

$pointad[1][0]=  New-Object System.Drawing.Point(180,330)
$pointad[1][1]=  New-Object System.Drawing.Point(120,290) # 60,40 2線2段
$pointad[1][2]=  New-Object System.Drawing.Point(240,120)
$pointad[1][3]=  New-Object System.Drawing.Point(180,80)

$pointad[2][0]=  New-Object System.Drawing.Point(180,330)
$pointad[2][1]=  New-Object System.Drawing.Point(120,290) # 60,40 2線1段
$pointad[2][2]=  New-Object System.Drawing.Point(240,245)
$pointad[2][3]=  New-Object System.Drawing.Point(180,205)

$pointad[3][0]=  New-Object System.Drawing.Point(260,455)
$pointad[3][1]=  New-Object System.Drawing.Point(180,475) # 80,20
$pointad[3][2]=  New-Object System.Drawing.Point(400,390) # 60,60 1線1段
$pointad[3][3]=  New-Object System.Drawing.Point(340,330)

$pointad[4][0]=  New-Object System.Drawing.Point(485,505)
$pointad[4][1]=  New-Object System.Drawing.Point(530,505) # 110,0 outputline
$pointad[4][2]=  New-Object System.Drawing.Point(530,455)
$pointad[4][3]=  New-Object System.Drawing.Point(420,455)
 
[array]$pointaf= @("","","","", "") # alg2 
[array]$pointaf[0]= @("","","","")
[array]$pointaf[1]= @("","","","")
[array]$pointaf[2]= @("","","","")
[array]$pointaf[3]= @("","","","")
[array]$pointaf[4]= @("","","","")

$pointaf[0][0]=  New-Object System.Drawing.Point(260,80)
$pointaf[0][1]=  New-Object System.Drawing.Point(310,170) # 50,90 feedback
$pointaf[0][2]=  New-Object System.Drawing.Point(50,170)
$pointaf[0][3]=  New-Object System.Drawing.Point(100,60)

$pointaf[1][0]=  New-Object System.Drawing.Point(260,455)
$pointaf[1][1]=  New-Object System.Drawing.Point(200,415) # 60,40 2線3段
$pointaf[1][2]=  New-Object System.Drawing.Point(320,120)
$pointaf[1][3]=  New-Object System.Drawing.Point(260,80)

$pointaf[2][0]=  New-Object System.Drawing.Point(100,330)
$pointaf[2][1]=  New-Object System.Drawing.Point(20,350) # 80,20
$pointaf[2][2]=  New-Object System.Drawing.Point(240,265) # 60,60 1線1段
$pointaf[2][3]=  New-Object System.Drawing.Point(180,205)

$pointaf[3][0]=  New-Object System.Drawing.Point(260,455)
$pointaf[3][1]=  New-Object System.Drawing.Point(200,415) #60,40 2線1段
$pointaf[3][2]=  New-Object System.Drawing.Point(320,370)
$pointaf[3][3]=  New-Object System.Drawing.Point(260,330)

$pointaf[4][0]=  New-Object System.Drawing.Point(485,505)
$pointaf[4][1]=  New-Object System.Drawing.Point(530,505) # 110,0 outputline
$pointaf[4][2]=  New-Object System.Drawing.Point(530,455)
$pointaf[4][3]=  New-Object System.Drawing.Point(420,455)
 
[array]$pointah= @("","","","", "") # alg3 
[array]$pointah[0]= @("","","","")
[array]$pointah[1]= @("","","","")
[array]$pointah[2]= @("","","","")
[array]$pointah[3]= @("","","","")
[array]$pointah[4]= @("","","","")

$pointah[0][0]=  New-Object System.Drawing.Point(180,80)
$pointah[0][1]=  New-Object System.Drawing.Point(230,170) # 50,90 feedback
$pointah[0][2]=  New-Object System.Drawing.Point(-30,170)
$pointah[0][3]=  New-Object System.Drawing.Point(20,60)

$pointah[1][0]=  New-Object System.Drawing.Point(100,205)
$pointah[1][1]=  New-Object System.Drawing.Point(20,225) # 80,20
$pointah[1][2]=  New-Object System.Drawing.Point(240,140) # 60,60 1線1段
$pointah[1][3]=  New-Object System.Drawing.Point(180,80)

$pointah[2][0]=  New-Object System.Drawing.Point(260,455)
$pointah[2][1]=  New-Object System.Drawing.Point(200,415) # 60,40 2線2段
$pointah[2][2]=  New-Object System.Drawing.Point(320,245)
$pointah[2][3]=  New-Object System.Drawing.Point(260,205)

$pointah[3][0]=  New-Object System.Drawing.Point(260,455)
$pointah[3][1]=  New-Object System.Drawing.Point(200,415) # 60,40 2線1段
$pointah[3][2]=  New-Object System.Drawing.Point(320,370)
$pointah[3][3]=  New-Object System.Drawing.Point(260,330)

$pointah[4][0]=  New-Object System.Drawing.Point(485,505)
$pointah[4][1]=  New-Object System.Drawing.Point(530,505) # 110,0 outputline
$pointah[4][2]=  New-Object System.Drawing.Point(530,455)
$pointah[4][3]=  New-Object System.Drawing.Point(420,455)
 
[array]$pointaj= @("","","","", "") # alg4 
[array]$pointaj[0]= @("","","","")
[array]$pointaj[1]= @("","","","")
[array]$pointaj[2]= @("","","","")
[array]$pointaj[3]= @("","","","")
[array]$pointaj[4]= @("","","","")

$pointaj[0][0]=  New-Object System.Drawing.Point(260,80)
$pointaj[0][1]=  New-Object System.Drawing.Point(310,170) # 50,90 feedback
$pointaj[0][2]=  New-Object System.Drawing.Point(50,170)
$pointaj[0][3]=  New-Object System.Drawing.Point(100,60)

$pointaj[1][0]=  New-Object System.Drawing.Point(180,205)
$pointaj[1][1]=  New-Object System.Drawing.Point(100,225) # 80,20
$pointaj[1][2]=  New-Object System.Drawing.Point(320,140) # 60,60 1線1段
$pointaj[1][3]=  New-Object System.Drawing.Point(260,80)

$pointaj[2][0]=  New-Object System.Drawing.Point(180,455)
$pointaj[2][1]=  New-Object System.Drawing.Point(100,475) # 80,20
$pointaj[2][2]=  New-Object System.Drawing.Point(320,390) # 60,60 1線1段
$pointaj[2][3]=  New-Object System.Drawing.Point(260,330)

$pointaj[3][0]=  New-Object System.Drawing.Point(480,505)
$pointaj[3][1]=  New-Object System.Drawing.Point(390,505) # 50,0 outputline
$pointaj[3][2]=  New-Object System.Drawing.Point(390,205)
$pointaj[3][3]=  New-Object System.Drawing.Point(340,205)

$pointaj[4][0]=  New-Object System.Drawing.Point(480,505)
$pointaj[4][1]=  New-Object System.Drawing.Point(450,505) # 110,0 outputline
$pointaj[4][2]=  New-Object System.Drawing.Point(450,455)
$pointaj[4][3]=  New-Object System.Drawing.Point(340,455)
 
[array]$pointal= @("","","","", "","","") # alg5 
[array]$pointal[0]= @("","","","")
[array]$pointal[1]= @("","","","")
[array]$pointal[2]= @("","","","")
[array]$pointal[3]= @("","","","")
[array]$pointal[4]= @("","","","")
[array]$pointal[5]= @("","","","")
[array]$pointal[6]= @("","","","")

$pointal[0][0]=  New-Object System.Drawing.Point(180,80)
$pointal[0][1]=  New-Object System.Drawing.Point(230,170) # 50,90 feedback
$pointal[0][2]=  New-Object System.Drawing.Point(-30,170)
$pointal[0][3]=  New-Object System.Drawing.Point(20,60)

$pointal[1][0]=  New-Object System.Drawing.Point(180,205)
$pointal[1][1]=  New-Object System.Drawing.Point(120,165) # 60,40 2線1段
$pointal[1][2]=  New-Object System.Drawing.Point(240,120)
$pointal[1][3]=  New-Object System.Drawing.Point(180,80)

$pointal[2][0]=  New-Object System.Drawing.Point(180,330)
$pointal[2][1]=  New-Object System.Drawing.Point(120,290) # 60,40 2線2段
$pointal[2][2]=  New-Object System.Drawing.Point(240,120)
$pointal[2][3]=  New-Object System.Drawing.Point(180,80)

$pointal[3][0]=  New-Object System.Drawing.Point(180,455)
$pointal[3][1]=  New-Object System.Drawing.Point(120,415) # 60,40 2線3段
$pointal[3][2]=  New-Object System.Drawing.Point(240,120)
$pointal[3][3]=  New-Object System.Drawing.Point(180,80)

$pointal[4][0]=  New-Object System.Drawing.Point(480,505)
$pointal[4][1]=  New-Object System.Drawing.Point(390,505) # 50,0 outputline
$pointal[4][2]=  New-Object System.Drawing.Point(390,205)
$pointal[4][3]=  New-Object System.Drawing.Point(340,205)

$pointal[5][0]=  New-Object System.Drawing.Point(480,505)
$pointal[5][1]=  New-Object System.Drawing.Point(420,505) # 80,0 outputline
$pointal[5][2]=  New-Object System.Drawing.Point(420,330)
$pointal[5][3]=  New-Object System.Drawing.Point(340,330)

$pointal[6][0]=  New-Object System.Drawing.Point(480,505)
$pointal[6][1]=  New-Object System.Drawing.Point(450,505) # 110,0 outputline
$pointal[6][2]=  New-Object System.Drawing.Point(450,455)
$pointal[6][3]=  New-Object System.Drawing.Point(340,455)
 
[array]$pointan= @("","","","", "") # alg6 
[array]$pointan[0]= @("","","","")
[array]$pointan[1]= @("","","","")
[array]$pointan[2]= @("","","","")
[array]$pointan[3]= @("","","","")
[array]$pointan[4]= @("","","","")

$pointan[0][0]=  New-Object System.Drawing.Point(260,80)
$pointan[0][1]=  New-Object System.Drawing.Point(310,170) # 50,90 feedback
$pointan[0][2]=  New-Object System.Drawing.Point(50,170)
$pointan[0][3]=  New-Object System.Drawing.Point(100,60)

$pointan[1][0]=  New-Object System.Drawing.Point(180,205)
$pointan[1][1]=  New-Object System.Drawing.Point(100,225) # 80,20
$pointan[1][2]=  New-Object System.Drawing.Point(320,140) # 60,60 1線1段
$pointan[1][3]=  New-Object System.Drawing.Point(260,80)

$pointan[2][0]=  New-Object System.Drawing.Point(480,505)
$pointan[2][1]=  New-Object System.Drawing.Point(390,505) # 50,0 outputline
$pointan[2][2]=  New-Object System.Drawing.Point(390,205)
$pointan[2][3]=  New-Object System.Drawing.Point(340,205)

$pointan[3][0]=  New-Object System.Drawing.Point(480,505)
$pointan[3][1]=  New-Object System.Drawing.Point(420,505) # 80,0 outputline
$pointan[3][2]=  New-Object System.Drawing.Point(420,330)
$pointan[3][3]=  New-Object System.Drawing.Point(340,330)

$pointan[4][0]=  New-Object System.Drawing.Point(480,505)
$pointan[4][1]=  New-Object System.Drawing.Point(450,505) # 110,0  outputline
$pointan[4][2]=  New-Object System.Drawing.Point(450,455)
$pointan[4][3]=  New-Object System.Drawing.Point(340,455)
 
[array]$pointap= @("","","","", "") # alg7 
[array]$pointap[0]= @("","","","")
[array]$pointap[1]= @("","","","")
[array]$pointap[2]= @("","","","")
[array]$pointap[3]= @("","","","")
[array]$pointap[4]= @("","","","")

$pointap[0][0]=  New-Object System.Drawing.Point(340,80)
$pointap[0][1]=  New-Object System.Drawing.Point(390,170) # 50,90 feedback
$pointap[0][2]=  New-Object System.Drawing.Point(130,170)
$pointap[0][3]=  New-Object System.Drawing.Point(180,60)

$pointap[1][0]=  New-Object System.Drawing.Point(480,505)
$pointap[1][1]=  New-Object System.Drawing.Point(390,505) # 50,0 outputline
$pointap[1][2]=  New-Object System.Drawing.Point(390,80)
$pointap[1][3]=  New-Object System.Drawing.Point(340,80)

$pointap[2][0]=  New-Object System.Drawing.Point(480,505)
$pointap[2][1]=  New-Object System.Drawing.Point(390,505) # 50,0 outputline
$pointap[2][2]=  New-Object System.Drawing.Point(390,205)
$pointap[2][3]=  New-Object System.Drawing.Point(340,205)

$pointap[3][0]=  New-Object System.Drawing.Point(480,505)
$pointap[3][1]=  New-Object System.Drawing.Point(420,505) # 80,0 outputline
$pointap[3][2]=  New-Object System.Drawing.Point(420,330)
$pointap[3][3]=  New-Object System.Drawing.Point(340,330)

$pointap[4][0]=  New-Object System.Drawing.Point(480,505)
$pointap[4][1]=  New-Object System.Drawing.Point(450,505) # 110,0 outputline
$pointap[4][2]=  New-Object System.Drawing.Point(450,455)
$pointap[4][3]=  New-Object System.Drawing.Point(340,455)
 
# 2op ------ 
 
[array]$pointar= @("","","","", "") # alg0 
[array]$pointar[0]= @("","","","")
[array]$pointar[1]= @("","","","")
[array]$pointar[2]= @("","","","")

$pointar[0][0]=  New-Object System.Drawing.Point(260,80)
$pointar[0][1]=  New-Object System.Drawing.Point(310,170) # 50,90 feedback
$pointar[0][2]=  New-Object System.Drawing.Point(50,170)
$pointar[0][3]=  New-Object System.Drawing.Point(100,60)

$pointar[1][0]=  New-Object System.Drawing.Point(180,205)
$pointar[1][1]=  New-Object System.Drawing.Point(100,225) # 80,20
$pointar[1][2]=  New-Object System.Drawing.Point(320,140) # 60,60 1線1段
$pointar[1][3]=  New-Object System.Drawing.Point(260,80)

$pointar[2][0]=  New-Object System.Drawing.Point(480,255)
$pointar[2][1]=  New-Object System.Drawing.Point(390,255) # 50,0 outputline
$pointar[2][2]=  New-Object System.Drawing.Point(390,205)
$pointar[2][3]=  New-Object System.Drawing.Point(340,205)
 
[array]$pointat= @("","","","", "") # alg1 
[array]$pointat[0]= @("","","","")
[array]$pointat[1]= @("","","","")
[array]$pointat[2]= @("","","","")

$pointat[0][0]=  New-Object System.Drawing.Point(340,80)
$pointat[0][1]=  New-Object System.Drawing.Point(390,170) # 50,90 feedback
$pointat[0][2]=  New-Object System.Drawing.Point(130,170)
$pointat[0][3]=  New-Object System.Drawing.Point(180,60)

$pointat[1][0]=  New-Object System.Drawing.Point(480,255)
$pointat[1][1]=  New-Object System.Drawing.Point(390,255) # 50,0 outputline
$pointat[1][2]=  New-Object System.Drawing.Point(390,80)
$pointat[1][3]=  New-Object System.Drawing.Point(340,80)

$pointat[2][0]=  New-Object System.Drawing.Point(480,255)
$pointat[2][1]=  New-Object System.Drawing.Point(390,255) # 50,0 outputline
$pointat[2][2]=  New-Object System.Drawing.Point(390,205)
$pointat[2][3]=  New-Object System.Drawing.Point(340,205)
 
 }catch{ 
	echo $_.exception
	Write-Host '"ERROR: Safety Stopper >> Cable point object err"'
 }
  
# Operator resetting param 

 try{
	[array]$_vrc= @("","") #jag
	[string[]]$_vrc[0]= ""; $_vrc[0]*= 13
	[string[]]$_vrc[1]= ""; $_vrc[1]*= 13

	[array]$_opl= @("","")
	[string[]]$_opl[0]= ""; $_opl[0]*= 13
	[string[]]$_opl[1]= ""; $_opl[1]*= 13

	[array]$_opn= @("","","","")
	[string[]]$_opn[0]= ""; $_opn[0]*= 12
	[string[]]$_opn[1]= ""; $_opn[1]*= 12
	[string[]]$_opn[2]= ""; $_opn[2]*= 12
	[string[]]$_opn[3]= ""; $_opn[3]*= 12

	[array]$_opm= @("","","","")
	[string[]]$_opm[0]= ""; $_opm[0]*= 13
	[string[]]$_opm[1]= ""; $_opm[1]*= 13
	[string[]]$_opm[2]= ""; $_opm[2]*= 13
	[string[]]$_opm[3]= ""; $_opm[3]*= 13


	[array]$vrc_svn= @("","")
	[array]$opl_two= @("","")
	[array]$opn_fur= @("","","","")
	[array]$opm_fur= @("","","","")

	$vrc_svn[0]= 40,0,12,4,8,4,0,1,0,0,0,0,0 # 初期値
	$vrc_svn[1]= 0,0,12,4,8,4,0,1,0,0,0,0,0

	$opl_two[0]= 0,0,12,4,4,8,40,0,1,0,0,0,0
	$opl_two[1]= 0,0,12,4,4,8,0,0,1,0,0,0,0

	$opn_fur[0]= 4,0,25,10,15,10,10,40,0,1,0,0
	$opn_fur[1]= 0,0,25,10,15,10,10,0,0,1,0,0
	$opn_fur[2]= 0,0,25,10,15,10,10,40,0,2,0,0
	$opn_fur[3]= 0,0,25,10,15,10,10,0,0,1,0,0

	$opm_fur[0]= 4,0,25,10,15,10,10,40,0,1,0,0,0
	$opm_fur[1]= 0,0,25,10,15,10,10,0,0,1,0,0,0
	$opm_fur[2]= 0,0,25,10,15,10,10,40,0,2,0,0,0
	$opm_fur[3]= 0,0,25,10,15,10,10,0,0,1,0,0,0


 }catch{
	echo $_.exception
	Write-Host '"ERROR: Safety Stopper >> Operator resetting param err"'
 }
 
# PIradian= 180度/57.29578度(1radian) 
# $radian= [Math]::PI/ 180.0 # 1度のラジアン値

 try{
	[double]$radian= [Math]::PI

	[string[]]$adjr= "17","18","19","20","21","22","23"

	# [int[]]$img= 160, 100 # Op.box # -> func local側へ

	# Reso func
	[int]$bai= 0 # 精度
	[int]$count= 0
	[array]$sin_pos= @()
	[array]$sin_map= @()
	[array]$pointed= @()
	[array]$pointsg= @()
	[array]$pointing= @()


	[array]$xyi= @() # Chip_position 定数的ため
	[int[]]$xytwo= 0,0
	# [int[]]$xye2= 0,0,0,0
	[int[]]$xye2= 0,0,480,4,  0,276,480,4

	[array]$xyp= @()
	[int[]]$xyfour= 0,0
	# [int[]]$xye4= 0,0,0,0
	[int[]]$xye4= 0,0,480,4,  0,526,480,4

 }catch{
	echo $_.exception
	Write-Host '"ERROR: Safety Stopper >> global variable err"'
 }
  
# ------ main 

 try{
	# キャスト
	if((Chk_path '.\fm_editor.xml') -eq 0){
		$fm_xml= [xml](cat '.\fm_editor.xml')
	}else{
		$fm_xml= [xml]$xml_editor
	}

	# 連想配列化
	$val=@{}; $opt=@{}; $key=@{};
	$mck= @{}; $nsd= @{}; $pmd= @{};
	$play=@{}; $dos=@{}; $edit=@{};	# only memory<- setting.xml

	$hsmck= @{}; $hsvrc= @{}; $hs88= @{}; $hsx68= @{}; $hsefx= @{};
	$header=@{}; $box_mml=@{}; $box_header=@{};	# replace mtx


	# cat -> Out-String(改行あり)でstringへ
	$header["fm_header_mck"]= (cat '.\header\fm_header_mck' | Out-String)
	$header["fm_header_nsd"]= (cat '.\header\fm_header_nsd' | Out-String)
	$header["fm_header_pmd"]= (cat '.\header\fm_header_pmd' | Out-String)

	$box_mml["mck"]= (cat '.\header\fm_mml_mck' | Out-String)
	$box_mml["nsd"]= (cat '.\header\fm_mml_nsd' | Out-String)
	$box_mml["pmd"]= (cat '.\header\fm_mml_pmd' | Out-String)

	# box header メモリ読み込み
	$box_header["vrc"]= (cat '.\header\fm_box_vrc' | Out-String)
	$box_header["vrc_mckreg"]= (cat '.\header\fm_box_vrc_mckreg' | Out-String)
	$box_header["vrc_nsdreg"]= (cat '.\header\fm_box_vrc_nsdreg' | Out-String)

	$box_header["opl"]= (cat '.\header\fm_box_opl' | Out-String)

	$box_header["opn"]= (cat '.\header\fm_box_opn' | Out-String)
	$box_header["opn_fmp7"]= (cat '.\header\fm_box_opn_fmp7' | Out-String)
	$box_header["opn_mucom"]= (cat '.\header\fm_box_opn_mucom' | Out-String)
	$box_header["opn_mxdrv"]= (cat '.\header\fm_box_opn_mxdrv' | Out-String)

	$box_header["opm"]= (cat '.\header\fm_box_opm' | Out-String)
	$box_header["opm_fmp7"]= (cat '.\header\fm_box_opm_fmp7' | Out-String)
	$box_header["opm_mucom"]= (cat '.\header\fm_box_opm_mucom' | Out-String)
	$box_header["opm_mxdrv"]= (cat '.\header\fm_box_opm_mxdrv' | Out-String)


	# hash設定
	Fmxml_read $script:fm_xml.table.val $script:fm_xml.table.opt

	Chip_position $key["layout"]
	Peralg_build $bai
	Reso $bai

	# Menuのため読み込み
	if((Chk_path '.\setting.xml') -eq 0){

		$set_xml= [xml](cat '.\setting.xml')
		Setxml_read $script:set_xml.table # hash化
	}

	#preset,FF読み込み
	Preset_read > $null  # <- $pmd["MC.EXE"] <- .\setting.xml


# write-host "------"
# write-host $val["compiler"]
# write-host $val["player"]
# write-host "------"
#write-host  ("val.Keys: "+ $val.Keys)
#write-host  ("val.Values: "+ $val.Values)
# write-host $comp.Values
# write-host $play.Values
# write-host "------"

	Slot_build $fm_xml.table.slot "A"
	Slot_build $fm_xml.table.slot "B"
	Slot_build $fm_xml.table.slot "C"
	Slot_build $fm_xml.table.slot "D"
	Slot_build $fm_xml.table.slot "E"
	Slot_build $fm_xml.table.slot "F"
	Slot_build $fm_xml.table.slot "G"
	Slot_build $fm_xml.table.slot "H"


	# 全て読んでおく <- safe no tqnpo
 	$vrc_svn= All_sz $vrc_svn 13 # 1 -> ___1
	$opl_two= All_sz $opl_two 13
	$opn_fur= All_sz $opn_fur 12
	$opm_fur= All_sz $opm_fur 13

	# Parameter Reset時のため
	Saveauto $script:fm_xml.table.resetting

	if($fm_xml.table.autosave.name -eq ""){ # 初回起動ため
		Saveauto $script:fm_xml.table.autosave # 初動の値で埋めておく debug
	}


	if($key["autosave"] -eq 'True'){
		Autoload $fm_xml.table.autosave
	}else{
		Autoload $fm_xml.table.resetting # auto:off
	}

	[bool]$event_change= $True # 多重ロード防止

	Panel_chg $comb_fm.SelectedItem
	Color_Render

	Send_build 1

	Menu_comp_build $opt["radio_bin"] > $null

	Menu_build "mck"
	Menu_build "nsd"
	Menu_build "pmd"

	Menu_build "player"
	Menu_build "dos"
	Menu_build "editor"
	Stus_build

	[array]$undo= $null,$null,"" # array obj高速化
	# Unredo 2 # Reset,Enable


	[int[]]$frm_state= 0, 0,0,0,0 # Multi window state

	[string[]] $script:adsr= "","","", "",""

	$frm_fm.ShowDialog() > $null

	Write-Host ('"FM音色エディタ"を終了します'+ "`r`n")

 }catch{
	echo $_.exception
	Write-Host '"ERROR: Safety Stopper >> $frm_fm.ShowDialog()"'

 }finally{
	$sb_alg.Dispose()
	$ff_frm.Dispose()
	$sub_mask.Dispose()
	$sub_sav.Dispose()
	$tray_fm.Dispose()
 }
 
#$graphics.DrawLine($pen, 10, 20, 100, 200) 	# 直線 
#$graphics.DrawRectangle($pen, 0, 0, 200, 300)	# 四角

#$graphics.FillPolygon($brush,$point)		# 折れ線

#$graphics.FillRectangle($brush, $xe[0], $ye[0], 1, 1) # 1px dot
#$graphics.FillEllipse($brush, 0, 0, 200, 300)	# 円
 
# base part 
	
#$graphics.DrawLine($pen, 10, 20, 100, 200) 	# 直線 
#$graphics.DrawRectangle($pen, 0, 0, 200, 300)	# 四角

#$graphics.FillPolygon($brush,$point)		# 折れ線

#$graphics.FillRectangle($brush, $xe[0], $ye[0], 1, 1) # 1px dot
#$graphics.FillEllipse($brush, 0, 0, 200, 300)	# 円

 
#$alg_img= [System.Drawing.Image]::FromFile(".\img\algorithm.png") 
 
#$Pictbox= New-Object System.Windows.Forms.PictureBox 
#$Pictbox.ClientSize= $alg_img.Size
#$Pictbox.Image= $alg_img
 
#$sub_alg= New-Object System.Windows.Forms.Form 
#$sub_alg.Text= "Algorithm List"
## $sub_alg.Size= "360,480"
#$sub_alg.Location= "500,0"
#$sub_alg.FormBorderStyle= "FixedSingle"
#$sub_alg.StartPosition= "WindowsDefaultLocation"
#$sub_alg.MaximizeBox= $false
#$sub_alg.MinimizeBox= $false

#$sub_alg.TopLevel= $True
#$sub_alg.Owner= $frm_fm

#$sub_alg.ClientSize= $alg_img.Size

#$sub_alg.Add_FormClosing({ #
# try{

#	if($_.CloseReason -eq 'UserClosing'){ # x ボタンの場合
#	}

#	$_.Cancel= $True # Hide -> 再度 Showのため
#	# EventArgs -> $_.(c# dato e.)

#	$this.Hide() #.Visible= $false
# }catch{
#	echo $_.exception
# }
#})
 
#$sub_alg.Controls.Add($Pictbox) 
  
# VRC7 ------ 
# @TL FB
#  AR DR SL RR KSL ML AM VIB EG KSR DT  (Modulator,Carrier)

# vrc7	[0][1]	[2][3][4][5]	[6][7]	[8][9]	[10][11][12]
#	TL FB	AR DR SL RR	KSLML	AM VIB	EG KSR DT
#	63 7	15 15 15 15	3  15	1  1	1  1   1

#	AM     VIB    EG      KSR     ML4bit
# reg00	[0][8]+[0][9]+[0][10]+[0][11]+[0][7]
# reg01	[1][8]+[1][9]+[1][10]+[1][11]+[1][7]
#	KSL2bitTL6bit
# reg02	[0][6]+[0][0]
#	KSL2bit    DC      DM      FB3bit
# reg03	[1][6]+ 0 +[1][12]+[0][12]+[0][1]
#	AR4bit DR4bit
# reg04	[0][2]+[0][3]
# reg05	[1][2]+[1][3]
#	SL4bit RR4bit
# reg06	[0][4]+[0][5]
# reg07	[1][4]+[1][5]

# OPL2 ------
# @NM ALG FB
#  AR DR RR SL TL KSL ML KSR EG VIB AM  (Modulator,Carrier)

#opl2	[0][1]	[2][3][4][5]	[6][7]	[8][9]	[10][11][12]
#	ALG FB	AR DR RR SL	TL KSL	ML KSR	EG VIB AM
#	1   7	15 15 15 15	63 3	15 1	1  1   1

# OPN4 ------
# @ALG FB
#  AR DR SR RR SL TL KS ML DT AMS  (M3,M2,M1,CA)

#opn4	[0][1]	[2][3][4][5]	[6][7]	[8][9][10][11]
#	ALG FB	AR DR SR RR	SL TL	KS ML DT AMS
#	7   7	31 31 31 15	15 127	3  15 7  3

# OPM4 ------
# @ALG FB
#  AR DR SR RR SL TL KS ML DT1 DT2 AMS (M3,M2,M1,CA)

#opm4	[0][1]	[2][3][4][5]	[6][7]	[8][9][10][11][12]
#	ALG FB	AR DR SR RR	SL TL	KS ML DT1 DT2 AMS
#	7   7	31 31 31 15	15 127	3  15 7   3   3
 
