$PBExportHeader$w_instrumento_eclampsia.srw
forward
global type w_instrumento_eclampsia from window
end type
type dw_calc_edad from datawindow within w_instrumento_eclampsia
end type
type pb_1 from picturebutton within w_instrumento_eclampsia
end type
type pb_cancelar from picturebutton within w_instrumento_eclampsia
end type
type dw_1 from datawindow within w_instrumento_eclampsia
end type
end forward

global type w_instrumento_eclampsia from window
integer width = 3383
integer height = 2236
boolean titlebar = true
string title = "Instrumento PRECLAMPSIA"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_calc_edad dw_calc_edad
pb_1 pb_1
pb_cancelar pb_cancelar
dw_1 dw_1
end type
global w_instrumento_eclampsia w_instrumento_eclampsia

type variables
st_xa_graficas i_stde
st_edad_meses_dias ist_edad
string dataw,des_ins,ls_color
boolean ibn_cambio=true
int li_var

end variables

forward prototypes
public function st_edad_meses_dias wf_edad_meses_dias (date ad_nace, date ad_fecha_evaluacion, integer ai_semanas_gestacion)
end prototypes

public function st_edad_meses_dias wf_edad_meses_dias (date ad_nace, date ad_fecha_evaluacion, integer ai_semanas_gestacion);st_edad_meses_dias lst_edad
int li_restar_meses,li_restar_anyos,li_restar_dias

if day(ad_fecha_evaluacion)<day(ad_nace) then
	li_restar_meses=1
	lst_edad.dias=30 + day(ad_fecha_evaluacion) - day(ad_nace)
else
	lst_edad.dias=day(ad_fecha_evaluacion) - day(ad_nace)
end if
if month(ad_fecha_evaluacion) - li_restar_meses < month(ad_nace) then
	li_restar_anyos=1
	lst_edad.meses=12 + month(ad_fecha_evaluacion) - li_restar_meses - month(ad_nace)
else
	lst_edad.meses= month(ad_fecha_evaluacion) - li_restar_meses - month(ad_nace)
end if
lst_edad.anyos=year(ad_fecha_evaluacion) - li_restar_anyos - year(ad_nace)

if ((lst_edad.anyos=2 and lst_edad.meses=0 and lst_edad.dias=0) or lst_edad.anyos<2) and ai_semanas_gestacion<40 then
	li_restar_dias= (40 - ai_semanas_gestacion)*7
	li_restar_anyos=0
	if lst_edad.dias<li_restar_dias then
//		li_restar_meses= wf_meses_faltantes( 40 - ai_semanas_gestacion , lst_edad.dias)
		
		lst_edad.dias = (li_restar_meses*30) + lst_edad.dias - li_restar_dias
		
		if lst_edad.meses>li_restar_meses then
			lst_edad.meses -= li_restar_meses
		else
			li_restar_anyos=1
			lst_edad.meses= 12 + lst_edad.meses - li_restar_meses
		end if
		lst_edad.anyos -= li_restar_anyos
	else
		lst_edad.dias -= li_restar_dias
	end if
	
end if

return lst_edad
end function

on w_instrumento_eclampsia.create
this.dw_calc_edad=create dw_calc_edad
this.pb_1=create pb_1
this.pb_cancelar=create pb_cancelar
this.dw_1=create dw_1
this.Control[]={this.dw_calc_edad,&
this.pb_1,&
this.pb_cancelar,&
this.dw_1}
end on

on w_instrumento_eclampsia.destroy
destroy(this.dw_calc_edad)
destroy(this.pb_1)
destroy(this.pb_cancelar)
destroy(this.dw_1)
end on

event open;i_stde=message.powerobjectparm
double ld_ctot,ld_chdl
string ls_pare
int cod_riesgo,li_ant_dm,li_total_ra,li_ant_hp,li_ant_glu,li_total_rm


ist_edad=wf_edad_meses_dias(date(i_stde.fecha),today(),0)
dw_calc_edad.setitem(1,'fecha_nace',i_stde.fecha)
dw_calc_edad.setitem(1,'fecha_evalua',datetime(today(),now()))
dw_calc_edad.setitem(1,'edad_anyos',ist_edad.anyos)
dw_calc_edad.setitem(1,'edad_meses',ist_edad.meses)
dw_calc_edad.setitem(1,'edad_dias',ist_edad.dias)

dw_1.settransobject(sqlca)
dw_1.insertrow(0)

/// ALTO
//Verifica ERC
li_total_ra=0
setnull(li_ant_dm)
SELECT cast(texto as integer) into :li_ant_dm
FROM pacientes_alergias
WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN8' AND cod_tipo='1' and cod_alergia='10';	
if li_ant_dm>0 then
	li_total_ra=li_total_ra+1
	dw_1.setitem(1,'renal',1)
	dw_calc_edad.setitem(1,'renal',1)	
end if

//Verifica DIABETES
setnull(li_ant_dm)
SELECT cast(texto as integer) into :li_ant_dm
FROM pacientes_alergias
WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN8' AND cod_tipo='1' and cod_alergia='2';	
if li_ant_dm>0 then
	li_total_ra=li_total_ra+1
	dw_1.setitem(1,'diabe',1)
	dw_calc_edad.setitem(1,'diabe',1)	
end if

//Verifica HTA
setnull(li_ant_dm)
SELECT cast(texto as integer) into :li_ant_dm
FROM pacientes_alergias
WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN8' AND cod_tipo='1' and cod_alergia='1';	
if li_ant_dm>0 then
	li_total_ra=li_total_ra+1
	dw_1.setitem(1,'hiper',1)
	dw_calc_edad.setitem(1,'hiper',1)	
end if

//Verifica Lupus
setnull(li_ant_dm)
SELECT cast(texto as integer) into :li_ant_dm
FROM pacientes_alergias
WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN8' AND cod_tipo='1' and cod_alergia='25';	
if li_ant_dm>0 then
	li_total_ra=li_total_ra+1
	dw_1.setitem(1,'lupus',1)
	dw_calc_edad.setitem(1,'lupus',1)	
end if

//Verifica PREC
setnull(li_ant_dm)
SELECT cast(texto as integer) into :li_ant_dm
FROM pacientes_alergias
WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN7' AND cod_tipo='2' and cod_alergia='1';	
if li_ant_dm>0 then
	li_total_ra=li_total_ra+1
	dw_1.setitem(1,'prec',1)
	dw_calc_edad.setitem(1,'prec',1)	
end if

//Verifica ANTI
setnull(li_ant_dm)
SELECT cast(texto as integer) into :li_ant_dm
FROM pacientes_alergias
WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN7' AND cod_tipo='2' and cod_alergia='21';	
if li_ant_dm>0 then
	li_total_ra=li_total_ra+1
	dw_1.setitem(1,'antif',1)
	dw_calc_edad.setitem(1,'antif',1)	
end if

///MODERADO
li_total_rm=0
	
//Verifica G1
setnull(li_ant_dm)
SELECT numero into :li_ant_dm
FROM pacientes_alergias
WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN7' AND cod_tipo='1' and cod_alergia='2';	
if li_ant_dm=1 then
	li_total_rm=li_total_rm+1
	dw_1.setitem(1,'parto',1)
	dw_calc_edad.setitem(1,'parto',1)	
end if

//Verifica ULTIMO PARTO
setnull(li_ant_dm)
SELECT datediff('yy',fecha_cap,cast(getdate() as date)) into :li_ant_dm
FROM pacientes_alergias
WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN7' AND cod_tipo='1' and cod_alergia='15';	
if li_ant_dm>=10 then
	li_total_rm=li_total_rm+1
	dw_1.setitem(1,'emb',1)
	dw_calc_edad.setitem(1,'parto',1)	
end if
	
//evalua IMC
if i_stde.ipa>= 35 then
	li_total_rm=li_total_rm+1
	dw_1.setitem(1,'imc1',1)
	dw_calc_edad.setitem(1,'imc',1)
end if

//ECLAMPI FAMI
setnull(li_ant_dm)
SELECT cast(texto as integer) into :li_ant_dm
FROM pacientes_alergias
WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN2' AND cod_tipo='1' and cod_alergia='21';	
if li_ant_dm>0 then
	li_total_rm=li_total_rm+1
	dw_1.setitem(1,'precf',1)
	dw_calc_edad.setitem(1,'precf',1)	
end if

///calculo edad
if ist_edad.anyos>= 40  then 
	li_total_rm=li_total_rm+1
	dw_1.setitem(1,'edad',1)
	dw_calc_edad.setitem(1,'edad',1)
end if
	

if li_total_ra>= 1 then 
	des_ins='ALTO'
	ls_color='ROJO INTENSO'
	dw_1.setitem(1,'total',li_total_ra)
else
	if li_total_rm> 1 then 
		des_ins='MODERADO'
		ls_color= 'NARANJA'
		dw_1.setitem(1,'total',li_total_rm)
	else
		des_ins='BAJO'
		ls_color= 'VERDE'
		dw_1.setitem(1,'total',0)
	end if
end if
dw_1.setitem(1,'riesgo',des_ins)

end event

type dw_calc_edad from datawindow within w_instrumento_eclampsia
integer x = 37
integer y = 32
integer width = 3310
integer height = 248
integer taborder = 10
string title = "none"
string dataobject = "dw_edad_instrumento_eclamp"
boolean border = false
boolean livescroll = true
end type

event constructor;insertrow(1)
end event

type pb_1 from picturebutton within w_instrumento_eclampsia
integer x = 1591
integer y = 1984
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
end type

event clicked;i_stde.cambio=ibn_cambio
setnull(i_stde.json)
setnull(i_stde.instr1)
setnull(i_stde.instr2)
setnull(i_stde.instr3)
setnull(i_stde.instr4)

if isnull(i_stde.texto) then
	i_stde.texto='Fallo'
else
	i_stde.texto='RIESGO '+ des_ins + ' Semaforo '+ls_color
	i_stde.instr1= des_ins
	i_stde.instr2=ls_color
end if 
closewithreturn(parent, i_stde)


end event

type pb_cancelar from picturebutton within w_instrumento_eclampsia
event mousemove pbm_mousemove
integer x = 1774
integer y = 1984
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type dw_1 from datawindow within w_instrumento_eclampsia
integer x = 37
integer y = 284
integer width = 3269
integer height = 1676
integer taborder = 10
string dataobject = "dw_instrum_eclampsia"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if dwo.name="selec" and data='1' then
	Collapse(row,1)
end if
ibn_cambio=true
end event

