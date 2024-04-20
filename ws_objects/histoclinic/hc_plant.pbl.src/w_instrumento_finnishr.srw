$PBExportHeader$w_instrumento_finnishr.srw
forward
global type w_instrumento_finnishr from window
end type
type dw_calc_edad from datawindow within w_instrumento_finnishr
end type
type pb_1 from picturebutton within w_instrumento_finnishr
end type
type pb_cancelar from picturebutton within w_instrumento_finnishr
end type
type dw_1 from datawindow within w_instrumento_finnishr
end type
end forward

global type w_instrumento_finnishr from window
integer width = 3383
integer height = 1832
boolean titlebar = true
string title = "Instrumento FINNISH RISK"
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
global w_instrumento_finnishr w_instrumento_finnishr

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

on w_instrumento_finnishr.create
this.dw_calc_edad=create dw_calc_edad
this.pb_1=create pb_1
this.pb_cancelar=create pb_cancelar
this.dw_1=create dw_1
this.Control[]={this.dw_calc_edad,&
this.pb_1,&
this.pb_cancelar,&
this.dw_1}
end on

on w_instrumento_finnishr.destroy
destroy(this.dw_calc_edad)
destroy(this.pb_1)
destroy(this.pb_cancelar)
destroy(this.dw_1)
end on

event open;i_stde=message.powerobjectparm
double ld_ctot,ld_chdl
string ls_pare
int cod_riesgo,li_ant_dm,li_total,li_ant_hp,li_ant_glu

SELECT datawin, des_inst into :dataw,:des_ins
FROM pm_instrumentos_hc
WHERE (((pm_instrumentos_hc.cod_inst)=:i_stde.instr) AND ((pm_instrumentos_hc.estado)='1'));

dw_1.settransobject(sqlca)

ist_edad=wf_edad_meses_dias(date(i_stde.fecha),today(),0)
dw_calc_edad.setitem(1,'fecha_nace',i_stde.fecha)
dw_calc_edad.setitem(1,'fecha_evalua',datetime(today(),now()))
dw_calc_edad.setitem(1,'edad_anyos',ist_edad.anyos)
dw_calc_edad.setitem(1,'edad_meses',ist_edad.meses)
dw_calc_edad.setitem(1,'edad_dias',ist_edad.dias)
dw_calc_edad.setitem(1,'imc',i_stde.ipa)//IMC
dw_calc_edad.setitem(1,'cadb',i_stde.sistolica)//cincunferencia
dw_calc_edad.setitem(1,'afis',i_stde.actfis)
dw_calc_edad.setitem(1,'frtv',i_stde.frutas)


dw_1.insertrow(0)

//Verifica DM y parentezco
////si 7, 11 , 6 y 9  debe ser 3
///esi 2,1, 3 y 8 deberr ser 5
///sino 0
SELECT cast(texto as integer),parentesco into :li_ant_dm , :ls_pare
FROM pacientes_alergias
WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN2' AND cod_tipo='1' and cod_alergia='2';	

setnull(li_var)
li_var=0
if ls_pare='6' or ls_pare='7' or ls_pare='9' or ls_pare='11' then  li_var=3
if ls_pare='1' or ls_pare='2' or ls_pare='3' or ls_pare='8' then  li_var=5
dw_calc_edad.setitem(1,'diabetes',li_ant_dm)
dw_1.setitem(1,'diab',li_var)
li_total+=li_var


//Verifica Hipertension
setnull(li_var)
SELECT cast(texto as integer) into :li_ant_hp
FROM pacientes_alergias
WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN8' AND cod_tipo='1' and cod_alergia='1';	
dw_calc_edad.setitem(1,'hiper',li_ant_hp)
if li_ant_hp=1 then 
	li_var=2
else
	li_var=0
end if
dw_1.setitem(1,'med',li_var)
li_total+=li_var

//Verifica Glucosa
setnull(li_var)
SELECT cast(texto as integer) into :li_ant_glu
FROM pacientes_alergias
WHERE tipodoc=:tipdoc and documento=:docu and cod_tipoa='AN8' AND cod_tipo='1' and cod_alergia='2';	
dw_calc_edad.setitem(1,'gluco',li_ant_hp)
if li_ant_glu=1 then 
	li_var=5
else
	li_var=0
end if
dw_1.setitem(1,'gluc',li_var)
li_total+=li_var

///calculo edad
setnull(li_var)
if ist_edad.anyos>= 0 AND ist_edad.anyos<=45  then li_var=0
if ist_edad.anyos>= 45 AND ist_edad.anyos<=54  then li_var=2
if ist_edad.anyos>= 55 AND ist_edad.anyos<=64  then li_var=3
if ist_edad.anyos>= 64 AND ist_edad.anyos<=120  then li_var=4
dw_1.setitem(1,'edad',li_var)
li_total+=li_var

//evalua IMC
setnull(li_var)
if i_stde.ipa>= 0 AND i_stde.ipa<25  then li_var=0
if i_stde.ipa>=25 AND i_stde.ipa<30  then li_var=1
if i_stde.ipa>= 30 then li_var=3
dw_1.setitem(1,'imc',li_var)
li_total+=li_var

//evaluaCircunferencia Abdominal 
setnull(li_var)
if i_stde.sexo='M' then
	if i_stde.sistolica>= 0 AND i_stde.sistolica<94  then li_var=0
	if i_stde.sistolica>=94 AND i_stde.sistolica<102  then li_var=3
	if i_stde.sistolica>= 102 then li_var=4
end if
if i_stde.sexo='F' then
	if i_stde.sistolica>= 0 AND i_stde.sistolica<80  then li_var=0
	if i_stde.sistolica>=80 AND i_stde.sistolica<88  then li_var=3
	if i_stde.sistolica>= 88 then li_var=4
end if
dw_1.setitem(1,'cabd',li_var)
li_total+=li_var

//evalua actividad fisica
if i_stde.actfis = 1 then 
	li_var=0
else
	li_var=2
end if
dw_1.setitem(1,'actf',li_var)
li_total+=li_var

//evalua frutas y verduras
if i_stde.frutas = 1 then 
	li_var=0
else
	li_var=1
end if
dw_1.setitem(1,'frve',li_var)
li_total+=li_var

if li_total>= 0 AND li_total<=7  then 
	des_ins='BAJO'
	ls_color='VERDE' 
end if
if li_total>= 8 AND li_total<=11  then 
	des_ins='LIGERAMENTE ALTO'
	ls_color='AMARILLO'
end if
if li_total>= 12 AND li_total<=17  then 
	des_ins='MODERADO'
	ls_color= 'NARANJA'
end if
if li_total>= 15 AND li_total<=20  then 
	des_ins='ALTO'
	ls_color=	 'ROJO'
end if
if li_total>= 21 then 
	des_ins='MUY ALTO'
	ls_color='ROJO INTENSO'
end if
dw_1.setitem(1,'total',li_total)
dw_1.setitem(1,'riesgo',des_ins)

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

type dw_calc_edad from datawindow within w_instrumento_finnishr
integer x = 37
integer y = 32
integer width = 3310
integer height = 248
integer taborder = 10
string title = "none"
string dataobject = "dw_edad_instrumento_finnis"
boolean border = false
boolean livescroll = true
end type

event constructor;insertrow(1)
end event

type pb_1 from picturebutton within w_instrumento_finnishr
integer x = 1586
integer y = 1556
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
	i_stde.instr1=ls_color
end if 
closewithreturn(parent, i_stde)


end event

type pb_cancelar from picturebutton within w_instrumento_finnishr
event mousemove pbm_mousemove
integer x = 1769
integer y = 1556
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

type dw_1 from datawindow within w_instrumento_finnishr
integer x = 37
integer y = 284
integer width = 3269
integer height = 1192
integer taborder = 10
string dataobject = "dw_instrum_finnish"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if dwo.name="selec" and data='1' then
	Collapse(row,1)
end if
ibn_cambio=true
end event

