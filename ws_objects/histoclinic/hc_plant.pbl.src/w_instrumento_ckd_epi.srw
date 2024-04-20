$PBExportHeader$w_instrumento_ckd_epi.srw
forward
global type w_instrumento_ckd_epi from window
end type
type dw_calc_edad from datawindow within w_instrumento_ckd_epi
end type
type pb_1 from picturebutton within w_instrumento_ckd_epi
end type
type pb_cancelar from picturebutton within w_instrumento_ckd_epi
end type
type dw_1 from datawindow within w_instrumento_ckd_epi
end type
end forward

global type w_instrumento_ckd_epi from window
integer width = 3177
integer height = 1900
boolean titlebar = true
string title = "INSTRUMENTO FILTRADO GLOMERULAR (CKD-EPI)"
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
global w_instrumento_ckd_epi w_instrumento_ckd_epi

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

on w_instrumento_ckd_epi.create
this.dw_calc_edad=create dw_calc_edad
this.pb_1=create pb_1
this.pb_cancelar=create pb_cancelar
this.dw_1=create dw_1
this.Control[]={this.dw_calc_edad,&
this.pb_1,&
this.pb_cancelar,&
this.dw_1}
end on

on w_instrumento_ckd_epi.destroy
destroy(this.dw_calc_edad)
destroy(this.pb_1)
destroy(this.pb_cancelar)
destroy(this.dw_1)
end on

event open;i_stde=message.powerobjectparm
double ld_cret=0,ld_protl,ld_tgp,ld_fge,ld_micro
string ls_afro,ls_riesgo,ls_color
int cod_riesgo,ld_a,ld_g,ld_erc

dw_1.settransobject(sqlca)

///saca creatina
//ld_cret=f_resultado_hc_apdx_numero('903876',tipdoc,docu,i_stde.instr)
if ld_cret=0 then ld_cret=f_resultado_hc_apdx_numero('903895',tipdoc,docu,i_stde.instr)	

///saca microalbuminuria
ld_micro=f_resultado_hc_apdx_numero('903026',tipdoc,docu,i_stde.instr)

///saca prote
if ld_micro=0 then  
	ls_afro=f_resultado_hc_apdx_texto('907106',tipdoc,docu,i_stde.instr)	
	if ls_afro='NEGATIVO' then ld_protl=0
	if ls_afro='+' then ld_protl=1	
	if ls_afro='++' then ld_protl=2
	if ls_afro='+++' then ld_protl=3	
end if	
setnull(ls_afro)

if (ld_cret=0 or isnull(ld_cret) or ld_micro=0 or isnull(ld_micro)) then 
	i_stde.cambio=ibn_cambio
	if ld_cret=0 or isnull(ld_cret) then
		Messagebox('Atención','No hay Creatinina')
	end if
	if ld_micro=0 or isnull(ld_micro) then
		Messagebox('Atención','No hay Microalbumuria')
	end if	
	i_stde.texto='PACIENTE SIN EVALUAR RIESGO RENAL'
	setnull(i_stde.json)
	pb_1.triggerevent(clicked!)
	return
end if

///afro
SELECT case when pacientes.grupoae is null then '0' else '1' end into :ls_afro
FROM pacientes
WHERE (((pacientes.grupoae) In ('3','4','5')) AND ((pacientes.tipodoc)=:tipdoc) AND ((pacientes.documento)=:docu));
IF sqlca.Sqlnrows > 0 then
	dw_calc_edad.setitem(1,'afro','1')
	ls_afro='1'
else
	dw_calc_edad.setitem(1,'afro','0')
	ls_afro='0'
end if

ist_edad=wf_edad_meses_dias(date(i_stde.fecha),today(),0)
dw_calc_edad.setitem(1,'fecha_nace',i_stde.fecha)
dw_calc_edad.setitem(1,'fecha_evalua',datetime(today(),now()))
dw_calc_edad.setitem(1,'edad_anyos',ist_edad.anyos)
dw_calc_edad.setitem(1,'edad_meses',ist_edad.meses)
dw_calc_edad.setitem(1,'edad_dias',ist_edad.dias)
dw_calc_edad.setitem(1,'creat',ld_cret)
dw_calc_edad.setitem(1,'albu',ld_micro)
dw_calc_edad.setitem(1,'prote',ld_protl)
dw_calc_edad.setitem(1,'peso',i_stde.valor)

ld_tgp=((140 - ist_edad.anyos) * i_stde.valor)/(ld_cret*72)
if w_principal.dw_1.getitemstring(1,'sexo')='M' then
	dw_calc_edad.setitem(1,'mujer','0')
else
	ld_tgp=ld_tgp* 0.85
	dw_calc_edad.setitem(1,'mujer','1')
end if

///Calculo TFG
if w_principal.dw_1.getitemstring(1,'sexo')='M' then
	if ld_cret<=0.9 then
		ld_fge= (141 * (ld_cret/0.9) ^-0.411 * 0.993^ ist_edad.anyos)
	else
		ld_fge= (141 * (ld_cret/0.9) ^-1.209 * 0.993^ ist_edad.anyos)
	end if
	if ls_afro='1' then
		ld_fge=ld_fge* 1.159
	end if
else
	if ld_cret<=0.7 then
		ld_fge= (144 * (ld_cret/0.7) ^-0.329 * 0.993^ ist_edad.anyos)
	else
		ld_fge= (144 * (ld_cret/0.7) ^-1.209 * 0.993^ ist_edad.anyos)
	end if
	if ls_afro='1' then
		ld_fge=ld_fge* 1.159
	end if
end if

/////calculo a
if ld_micro>=0 and ld_micro<30 then
	if ld_micro=0 then
		if ld_protl=1 or ld_protl=0  then ld_a=1
	else
		ld_a=1
	end if
end if
if (ld_micro>=30 and ld_micro<300) or ld_micro=0 then
	if ld_micro=0 then
		if ld_protl=2 then ld_a=1
	else
		ld_a=2
	end if
end if
if ld_micro>=300 or ld_micro=0 then
	if ld_micro=0 then
		if ld_protl=2 then ld_a=3
	else
		ld_a=3
	end if
end if

/////calculo g
if ld_fge >=90 then 
	ld_g=1
	ld_erc=1
end if
if ld_fge >=60 and  ld_fge <=89 then 
	ld_g=2
	ld_erc=2
end if
if ld_fge >=45 and  ld_fge <=59 then 
	ld_g=3
	ld_erc=3
end if
if ld_fge >=30 and  ld_fge <=44 then 
	ld_g=4
	ld_erc=3
end if
if ld_fge >=15 and  ld_fge <=29 then 
	ld_g=5
	ld_erc=4
end if
if ld_fge <15 then 
	ld_g=6
	ld_erc=5
end if

/////calculo erc
if (ld_a=1 and ld_g=1) or (ld_a=1 and ld_g=2) or (ld_a=1 and ld_g=3) or (ld_a=2 and ld_g=1)  or (ld_a=2 and ld_g=2)  then 
	if (ld_a=1 and ld_g=1) or (ld_a=1 and ld_g=2) then
		ls_riesgo='BAJO'
		ls_color='VERDE'
	end if
	if  (ld_a=1 and ld_g=3) or (ld_a=2 and ld_g=1)  or (ld_a=2 and ld_g=2) then
		ls_riesgo='MODERADO'
		ls_color='AMARILLO'
	end if		
end if

if (ld_a=1 and ld_g=4) or (ld_a=2 and ld_g=3) or (ld_a=3 and ld_g=1) or (ld_a=3 and ld_g=2)  then 
	ls_riesgo='ALTO'
	ls_color='NARANJA'
end if

if (ld_a=1 and ld_g=5) or (ld_a=2 and ld_g=4) or (ld_a=2 and ld_g=5) or (ld_a=3 and ld_g=3)  or (ld_a=3 and ld_g=4) then 
	ls_riesgo='MUY ALTO'
	ls_color='ROJO'
end if

if (ld_a=1 and ld_g=6) or (ld_a=2 and ld_g=6) or (ld_a=3 and ld_g=5)  or (ld_a=3 and ld_g=6) then 
	ls_riesgo='RIESGO MUY ALTO'
	ls_color='ROJO'	
end if

dw_1.insertrow(0)
dw_1.setitem(1,'cg',ld_tgp)
dw_1.setitem(1,'fge',ld_fge)
dw_1.setitem(1,'g',ld_g)
dw_1.setitem(1,'a',ld_a)
dw_1.setitem(1,'erc',ld_erc)
dw_1.setitem(1,'rcolor',ls_color)
dw_1.setitem(1,'rdescri',ls_riesgo)
end event

type dw_calc_edad from datawindow within w_instrumento_ckd_epi
integer x = 37
integer y = 24
integer width = 3099
integer height = 248
integer taborder = 10
string title = "none"
string dataobject = "dw_edad_instrumento_ckd"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

type pb_1 from picturebutton within w_instrumento_ckd_epi
integer x = 1618
integer y = 1648
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
setnull(i_stde.instr1)
setnull(i_stde.instr2)
setnull(i_stde.instr3)
setnull(i_stde.instr4)
setnull(i_stde.json)

if i_stde.texto<>'PACIENTE SIN EVALUAR RIESGO RENAL' then
	i_stde.texto='RIESGO:'+dw_1.getitemstring(1,'rdescri')+' Color('+dw_1.getitemstring(1,'rcolor')+')'+ ' Cockroft- Gault: '+string(dw_1.getitemnumber(1,'cg'),'#,##0.00')+' CDK-EPI:'+string(dw_1.getitemnumber(1,'fge'),'#,##0.00')+' ERC:'+string(dw_1.getitemnumber(1,'erc')) +' A:'+string(dw_1.getitemnumber(1,'a'))
	i_stde.instr1=string(dw_1.getitemnumber(1,'cg'),'#,##0.00')
	i_stde.instr2=string(dw_1.getitemnumber(1,'fge'),'#,##0.00')
	i_stde.instr3=string(dw_1.getitemnumber(1,'erc'))
	i_stde.instr3=string(dw_1.getitemnumber(1,'a'))
end if
closewithreturn(parent, i_stde)
end event

type pb_cancelar from picturebutton within w_instrumento_ckd_epi
event mousemove pbm_mousemove
integer x = 1801
integer y = 1648
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

type dw_1 from datawindow within w_instrumento_ckd_epi
integer x = 37
integer y = 276
integer width = 3095
integer height = 1300
integer taborder = 10
string dataobject = "dw_instrum_ckd_epi"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if dwo.name="selec" and data='1' then
	Collapse(row,1)
end if
ibn_cambio=true
end event

