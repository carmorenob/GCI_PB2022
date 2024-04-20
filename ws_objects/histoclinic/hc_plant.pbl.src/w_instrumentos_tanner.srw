$PBExportHeader$w_instrumentos_tanner.srw
forward
global type w_instrumentos_tanner from window
end type
type pb_1 from picturebutton within w_instrumentos_tanner
end type
type pb_cancelar from picturebutton within w_instrumentos_tanner
end type
type dw_1 from datawindow within w_instrumentos_tanner
end type
end forward

global type w_instrumentos_tanner from window
integer width = 3223
integer height = 2084
boolean titlebar = true
string title = "Tanner"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_1 pb_1
pb_cancelar pb_cancelar
dw_1 dw_1
end type
global w_instrumentos_tanner w_instrumentos_tanner

type variables
st_xa_graficas i_stde
string dataw
boolean ibn_cambio=false

end variables

on w_instrumentos_tanner.create
this.pb_1=create pb_1
this.pb_cancelar=create pb_cancelar
this.dw_1=create dw_1
this.Control[]={this.pb_1,&
this.pb_cancelar,&
this.dw_1}
end on

on w_instrumentos_tanner.destroy
destroy(this.pb_1)
destroy(this.pb_cancelar)
destroy(this.dw_1)
end on

event open;i_stde=message.powerobjectparm
//www.naizen.eus/comprender/fisiologia/pubertad/

if i_stde.sexo='F' then
	dw_1.dataobject='dw_tanner_mujer'
else
	dw_1.dataobject='dw_tanner_hombres'
end if
dw_1.settransobject(sqlca)
dw_1.retrieve(tipdoc,docu)

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

type pb_1 from picturebutton within w_instrumentos_tanner
integer x = 1394
integer y = 1844
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

event clicked;if dw_1.getitemnumber(1,'controles')=0 then
	messagebox('Atención', 'Pendiente por identificar variables de evaluación')
	return
End If	
i_stde.cambio=ibn_cambio
i_stde.texto=upper(dw_1.Describe('mensaje.text')	)
setnull(i_stde.json)
closewithreturn(parent, i_stde)

end event

type pb_cancelar from picturebutton within w_instrumentos_tanner
event mousemove pbm_mousemove
integer x = 1573
integer y = 1844
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
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type dw_1 from datawindow within w_instrumentos_tanner
event mousemove pbm_dwnmousemove
integer x = 37
integer y = 48
integer width = 3154
integer height = 1748
integer taborder = 10
string dataobject = "dw_tanner_mujer"
borderstyle borderstyle = stylelowered!
end type

event mousemove;string texto
 dw_1.accepttext()

if string(dwo.type)="bitmap" and (dw_1.getitemnumber(1,'t1')=0 and dw_1.getitemnumber(1,'t2')=0 and dw_1.getitemnumber(1,'t3')=0 and dw_1.getitemnumber(1,'t4')=0 and dw_1.getitemnumber(1,'t5')=0  ) then
	choose case string(dwo.name)
		case 't_1' 
			texto=dw_1.Describe('t_1.tag')
		case 't_2' 
			texto=dw_1.Describe('t_2.tag')			
		case 't_3' 
			texto=dw_1.Describe('t_3.tag')			
		case 't_4' 
			texto=dw_1.Describe('t_4.tag')			
		case 't_5' 
			texto=dw_1.Describe('t_5.tag')			
	end choose
	dw_1.modify("mensaje.text='"+texto+"'")	
end if
ibn_cambio=true
end event

