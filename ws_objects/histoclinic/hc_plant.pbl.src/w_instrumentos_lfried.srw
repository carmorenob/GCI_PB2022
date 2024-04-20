$PBExportHeader$w_instrumentos_lfried.srw
forward
global type w_instrumentos_lfried from window
end type
type dw_calc_edad from datawindow within w_instrumentos_lfried
end type
type pb_1 from picturebutton within w_instrumentos_lfried
end type
type pb_cancelar from picturebutton within w_instrumentos_lfried
end type
type dw_1 from datawindow within w_instrumentos_lfried
end type
end forward

global type w_instrumentos_lfried from window
integer width = 3817
integer height = 2076
boolean titlebar = true
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
global w_instrumentos_lfried w_instrumentos_lfried

type variables
st_xa_graficas i_stde
string dataw
st_edad_meses_dias ist_edad

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

on w_instrumentos_lfried.create
this.dw_calc_edad=create dw_calc_edad
this.pb_1=create pb_1
this.pb_cancelar=create pb_cancelar
this.dw_1=create dw_1
this.Control[]={this.dw_calc_edad,&
this.pb_1,&
this.pb_cancelar,&
this.dw_1}
end on

on w_instrumentos_lfried.destroy
destroy(this.dw_calc_edad)
destroy(this.pb_1)
destroy(this.pb_cancelar)
destroy(this.dw_1)
end on

event open;i_stde=message.powerobjectparm
string des_ins

title='Instrumento LINDA FRIED'
dw_1.settransobject(sqlca)
dw_1.retrieve()

ist_edad=wf_edad_meses_dias(date(i_stde.fecha),today(),0)
dw_calc_edad.setitem(1,'fecha_nace',i_stde.fecha)
dw_calc_edad.setitem(1,'fecha_evalua',datetime(today(),now()))
dw_calc_edad.setitem(1,'edad_anyos',ist_edad.anyos)
dw_calc_edad.setitem(1,'edad_meses',ist_edad.meses)
dw_calc_edad.setitem(1,'edad_dias',ist_edad.dias)
dw_calc_edad.setitem(1,'ver','0')

end event

event resize;if dataw='dw_apgar_familiar' then
	resize(3598,1570)
	dw_1.width=3410
	dw_1.height=955
end if

if dataw='dw_indice_brody'  or dataw='dw_indice_brody' or dataw='dw_indice_lfried' then
	resize(3808,1924)
	dw_1.width=3643
	dw_1.height=1348
end if
pb_1.x=1678
pb_1.y=dw_1.y+dw_1.height + 52
pb_cancelar.x=1861
pb_cancelar.y=dw_1.y+dw_1.height + 52
end event

type dw_calc_edad from datawindow within w_instrumentos_lfried
integer x = 82
integer y = 28
integer width = 3031
integer height = 168
integer taborder = 10
string title = "none"
string dataobject = "dw_edad_instrumentos"
boolean border = false
boolean livescroll = true
end type

event constructor;insertrow(1)
end event

type pb_1 from picturebutton within w_instrumentos_lfried
integer x = 2139
integer y = 1812
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

event clicked;
//i_stde.dw_captura.setitem(i_stde.origen,'texto',dw_1.getitemstring(1,'interpretacion')+' Total('+string(dw_1.getitemnumber(1,'total'))+")")
i_stde.dw_captura.setitem(i_stde.origen,'texto',dw_1.getitemstring(1,'interpretacion'))
close(parent)
end event

type pb_cancelar from picturebutton within w_instrumentos_lfried
event mousemove pbm_mousemove
integer x = 2322
integer y = 1812
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

type dw_1 from datawindow within w_instrumentos_lfried
integer x = 78
integer y = 196
integer width = 3643
integer height = 1536
integer taborder = 10
string dataobject = "dw_indice_lfried_new"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//if dwo.name="selec" and data='1' then
//	Collapse(row,1)
//end if
end event

