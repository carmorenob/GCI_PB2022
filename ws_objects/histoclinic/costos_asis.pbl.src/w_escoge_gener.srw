$PBExportHeader$w_escoge_gener.srw
forward
global type w_escoge_gener from window
end type
type pb_1 from picturebutton within w_escoge_gener
end type
type pb_ok from picturebutton within w_escoge_gener
end type
type st_2 from statictext within w_escoge_gener
end type
type st_1 from statictext within w_escoge_gener
end type
type dw_insumo from datawindow within w_escoge_gener
end type
type dw_1 from datawindow within w_escoge_gener
end type
end forward

global type w_escoge_gener from window
integer width = 2016
integer height = 1416
boolean titlebar = true
string title = "Elegir Genérico"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
boolean center = true
pb_1 pb_1
pb_ok pb_ok
st_2 st_2
st_1 st_1
dw_insumo dw_insumo
dw_1 dw_1
end type
global w_escoge_gener w_escoge_gener

type variables
string i_cod
end variables

on w_escoge_gener.create
this.pb_1=create pb_1
this.pb_ok=create pb_ok
this.st_2=create st_2
this.st_1=create st_1
this.dw_insumo=create dw_insumo
this.dw_1=create dw_1
this.Control[]={this.pb_1,&
this.pb_ok,&
this.st_2,&
this.st_1,&
this.dw_insumo,&
this.dw_1}
end on

on w_escoge_gener.destroy
destroy(this.pb_1)
destroy(this.pb_ok)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_insumo)
destroy(this.dw_1)
end on

event open;i_cod=message.stringparm
message.stringparm=''
dw_insumo.retrieve(i_cod)
dw_1.retrieve(i_cod)
end event

type pb_1 from picturebutton within w_escoge_gener
integer x = 919
integer y = 1168
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_escoge_gener
integer x = 741
integer y = 1168
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;dw_1.triggerevent (doubleclicked!)
end event

type st_2 from statictext within w_escoge_gener
integer x = 1257
integer y = 152
integer width = 581
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Click contrario para filtros"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_escoge_gener
integer x = 32
integer y = 160
integer width = 608
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Genéricos del Insumo:"
boolean focusrectangle = false
end type

type dw_insumo from datawindow within w_escoge_gener
integer x = 23
integer width = 1943
integer height = 136
integer taborder = 10
string title = "none"
string dataobject = "dw_insumo_solo"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

type dw_1 from datawindow within w_escoge_gener
integer x = 9
integer y = 220
integer width = 1906
integer height = 924
integer taborder = 10
string title = "none"
string dataobject = "dw_generi_x_insumo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event constructor;settransobject(sqlca)
object.cantidad.visible=false
object.conversion.visible=false
object.c_medica.edit.displayonly='yes'
object.medicamento.edit.displayonly='yes'
end event

event doubleclicked;if rowcount()=0 then return
closewithreturn(parent,getitemstring(getrow(),'c_medica'))
end event

