$PBExportHeader$w_instrumento_cardiovascular.srw
forward
global type w_instrumento_cardiovascular from window
end type
type dw_calc_edad from datawindow within w_instrumento_cardiovascular
end type
type pb_1 from picturebutton within w_instrumento_cardiovascular
end type
type pb_cancelar from picturebutton within w_instrumento_cardiovascular
end type
type dw_1 from datawindow within w_instrumento_cardiovascular
end type
end forward

global type w_instrumento_cardiovascular from window
integer width = 3383
integer height = 1832
boolean titlebar = true
string title = "INSTRUMENTO FRAMINGHAM/OMS"
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
global w_instrumento_cardiovascular w_instrumento_cardiovascular

type variables
st_xa_graficas i_stde
st_edad_meses_dias ist_edad
string dataw,des_ins
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

on w_instrumento_cardiovascular.create
this.dw_calc_edad=create dw_calc_edad
this.pb_1=create pb_1
this.pb_cancelar=create pb_cancelar
this.dw_1=create dw_1
this.Control[]={this.dw_calc_edad,&
this.pb_1,&
this.pb_cancelar,&
this.dw_1}
end on

on w_instrumento_cardiovascular.destroy
destroy(this.dw_calc_edad)
destroy(this.pb_1)
destroy(this.pb_cancelar)
destroy(this.dw_1)
end on

event open;i_stde=message.powerobjectparm
double ld_ctot,ld_chdl
string ls_sexo,ls_ant_dm,ls_tto_c02
int cod_riesgo,li_total

SELECT datawin, des_inst into :dataw,:des_ins
FROM pm_instrumentos_hc
WHERE (((pm_instrumentos_hc.cod_inst)=:i_stde.instr) AND ((pm_instrumentos_hc.estado)='1'));

dw_1.settransobject(sqlca)

if i_stde.sistolica=0 or isnull(i_stde.sistolica) then
	messagebox("Atención","Paciente no tiene dato en Tensión Sistólica no calculara instrumento")
	close(this)
	return
end if
if i_stde.ipa<0  then
	messagebox("Atención","Paciente no dato de IPA no calulara instrumento")
	close(this)
	return
end if

///saca colesterol Total ultimo
ld_ctot=f_resultado_hc_apdx_numero('903818',tipdoc,docu,i_stde.instr)
	 
///saca colesterol hdl
ld_chdl=f_resultado_hc_apdx_numero('903815',tipdoc,docu,i_stde.instr)

//diabetes militus
SELECT sino into :ls_ant_dm
FROM pacientes_alergias
WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN8' AND cod_tipo='1' and cod_alergia='2';
IF sqlca.Sqlnrows > 0 then
	ls_ant_dm='1'
else
	ls_ant_dm='0'
end if

ist_edad=wf_edad_meses_dias(date(i_stde.fecha),today(),0)
dw_calc_edad.setitem(1,'fecha_nace',i_stde.fecha)
dw_calc_edad.setitem(1,'fecha_evalua',datetime(today(),now()))
dw_calc_edad.setitem(1,'edad_anyos',ist_edad.anyos)
dw_calc_edad.setitem(1,'edad_meses',ist_edad.meses)
dw_calc_edad.setitem(1,'edad_dias',ist_edad.dias)
dw_calc_edad.setitem(1,'sistolica',i_stde.sistolica)
dw_calc_edad.setitem(1,'ctotal',ld_ctot)
dw_calc_edad.setitem(1,'hdl',ld_chdl)
if i_stde.ipa>1 then
	dw_calc_edad.setitem(1,'ipa',1)
	i_stde.ipa=1
else
	dw_calc_edad.setitem(1,'ipa',0)
	i_stde.ipa=0
end if
dw_calc_edad.setitem(1,'diabetes',ls_ant_dm)

if w_principal.dw_1.getitemstring(1,'sexo')='M' then
	ls_sexo='1'
else
	ls_sexo='2'
end if

SELECT 
	hc_pm_riesgo_cardio_oms.cod_riesgo, hc_pm_riesgo_cardio_riesgo.des_riesgo
	into :cod_riesgo,:des_ins
FROM 
	hc_pm_riesgo_cardio_oms INNER JOIN hc_pm_riesgo_cardio_riesgo 
	ON hc_pm_riesgo_cardio_oms.cod_riesgo = hc_pm_riesgo_cardio_riesgo.cod_riesgo
WHERE 
	(((:ist_edad.anyos) Between hc_pm_riesgo_cardio_oms.edadi And hc_pm_riesgo_cardio_oms.edadf) 
	AND ((hc_pm_riesgo_cardio_oms.sexo)=:ls_sexo) 
	AND ((hc_pm_riesgo_cardio_oms.ipa)=:i_stde.ipa) 
	AND ((hc_pm_riesgo_cardio_oms.dm)=:ls_ant_dm) 
	AND ((:i_stde.sistolica) Between hc_pm_riesgo_cardio_oms.pasi And hc_pm_riesgo_cardio_oms.pasf));

dw_1.insertrow(0)
dw_1.setitem(1,'dato',cod_riesgo)
dw_1.setitem(1,'riesgo',des_ins)

///calculo edad
if ist_edad.anyos>= 20 AND ist_edad.anyos<=34  then li_var=-9
if ist_edad.anyos>= 35 AND ist_edad.anyos<=39  then li_var=-4
if ist_edad.anyos>= 40 AND ist_edad.anyos<=44  then li_var=0
if ist_edad.anyos>= 45 AND ist_edad.anyos<=49  then li_var=3
if ist_edad.anyos>= 50 AND ist_edad.anyos<=54  then li_var=6
if ist_edad.anyos>= 55 AND ist_edad.anyos<=59  then li_var=8
if ist_edad.anyos>= 60 AND ist_edad.anyos<=64  then li_var=10
if ist_edad.anyos>= 65 AND ist_edad.anyos<=69  then li_var=-11
if ist_edad.anyos>= 70 AND ist_edad.anyos<=74  then li_var=12
if ist_edad.anyos>= 75 AND ist_edad.anyos<=120  then li_var=13
dw_1.setitem(1,'v1',li_var)
li_total+=li_var

//evalua colesterol
setnull(li_var)
SELECT 
	puntaje into :li_var
FROM 
	hc_pm_riesgo_framinghan
WHERE 
	(((hc_pm_riesgo_framinghan.varia)='CLT') 
	AND ((:ist_edad.anyos) Between hc_pm_riesgo_framinghan.edadi And hc_pm_riesgo_framinghan.edadf) 
	AND ((:ld_ctot) Between hc_pm_riesgo_framinghan.valori And hc_pm_riesgo_framinghan.valorf));
dw_1.setitem(1,'v2',li_var)
li_total+=li_var

//evalua IPA
setnull(li_var)
SELECT 
	puntaje into :li_var
FROM 
	hc_pm_riesgo_framinghan
WHERE 
	(((hc_pm_riesgo_framinghan.varia)='IPA') 
	AND ((:ist_edad.anyos) Between hc_pm_riesgo_framinghan.edadi And hc_pm_riesgo_framinghan.edadf) 
	AND ((:i_stde.ipa) Between hc_pm_riesgo_framinghan.valori And hc_pm_riesgo_framinghan.valorf));
dw_1.setitem(1,'v3',li_var)
li_total+=li_var

//evalua HDL
setnull(li_var)
SELECT 
	puntaje into :li_var
FROM 
	hc_pm_riesgo_framinghan
WHERE 
	(((hc_pm_riesgo_framinghan.varia)='HDL') 
	AND ((:ist_edad.anyos) Between hc_pm_riesgo_framinghan.edadi And hc_pm_riesgo_framinghan.edadf) 
	AND ((:ld_chdl) Between hc_pm_riesgo_framinghan.valori And hc_pm_riesgo_framinghan.valorf));

if li_var<0  then li_var=0
dw_1.setitem(1,'v4',li_var)
li_total+=li_var

///CAlcula PAs
SELECT  cod_atc into :ls_tto_c02
FROM pacientes_antecedente
WHERE (((pacientes_antecedente.tipodoc)=:tipdoc ) AND ((pacientes_antecedente.documento)=:docu) AND ((pacientes_antecedente.cod_tipoa)='AN3') AND ((pacientes_antecedente.cod_atc) Like 'C02%'));
IF sqlca.Sqlnrows > 0 then
	ls_tto_c02='1'
else
	ls_tto_c02='0'
end if

if i_stde.sistolica<120 then
	if ls_tto_c02='1' then
		li_var=0
	else
		li_var=0
	end if
end if
if i_stde.sistolica>=120 and i_stde.sistolica<=129 then
	if ls_tto_c02='1' then
		li_var=1
	else
		li_var=0
	end if
end if
if i_stde.sistolica>=130 and i_stde.sistolica<=139 then
	if ls_tto_c02='1' then
		li_var=2
	else
		li_var=1
	end if
end if
if i_stde.sistolica>=140 and i_stde.sistolica<=159 then
	if ls_tto_c02='1' then
		li_var=2
	else
		li_var=1
	end if
end if
if i_stde.sistolica>=160 and i_stde.sistolica<=200 then
	if ls_tto_c02='1' then
		li_var=3
	else
		li_var=2
	end if
end if
dw_1.setitem(1,'v5',li_var)
li_total+=li_var

if li_total<0  then li_var=0
if li_total>= 0 AND li_total<=4  then li_var=1
if li_total>= 5 AND li_total<=6  then li_var=2
if li_total=7  then li_var=3
if li_total=8  then li_var=4
if li_total=9  then li_var=5
if li_total=10  then li_var=6
if li_total=11  then li_var=8
if li_total=12  then li_var=10
if li_total=13  then li_var=12
if li_total=14  then li_var=16
if li_total=15  then li_var=20
if li_total=16  then li_var=25
if li_total>= 17  then li_var=30
dw_1.setitem(1,'riesgo_fr',li_var)
end event

event resize;if dataw='dw_apgar_familiar' then
	resize(3598,1356)
	dw_1.width=3410
	dw_1.height=955
end if

if dataw='dw_indice_brody'  or dataw='dw_indice_brody' or dataw='dw_indice_lfried' then
	resize(3808,1724)
	dw_1.width=3643
	dw_1.height=1348
end if
pb_1.x=1678
pb_1.y=dw_1.y+dw_1.height + 52
pb_cancelar.x=1861
pb_cancelar.y=dw_1.y+dw_1.height + 52
end event

type dw_calc_edad from datawindow within w_instrumento_cardiovascular
integer x = 37
integer y = 24
integer width = 3310
integer height = 248
integer taborder = 10
string title = "none"
string dataobject = "dw_edad_instrumento_cv"
boolean border = false
boolean livescroll = true
end type

event constructor;insertrow(1)
end event

type pb_1 from picturebutton within w_instrumento_cardiovascular
integer x = 1646
integer y = 1564
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
i_stde.texto='OMS ->'+des_ins+' Semaforo '+dw_1.getitemstring(1,'color') +' FRAMINGHAN-> RIESGO A LOS 10 AÑOS EN (%) '+string(li_var)
i_stde.instr1=dw_1.getitemstring(1,'color')
closewithreturn(parent, i_stde)
end event

type pb_cancelar from picturebutton within w_instrumento_cardiovascular
event mousemove pbm_mousemove
integer x = 1829
integer y = 1564
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

type dw_1 from datawindow within w_instrumento_cardiovascular
integer x = 37
integer y = 276
integer width = 3287
integer height = 1240
integer taborder = 10
string dataobject = "dw_instrum_cardiovascular"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if dwo.name="selec" and data='1' then
	Collapse(row,1)
end if
ibn_cambio=true
end event

