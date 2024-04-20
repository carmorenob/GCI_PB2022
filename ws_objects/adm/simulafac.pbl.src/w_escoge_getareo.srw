$PBExportHeader$w_escoge_getareo.srw
forward
global type w_escoge_getareo from window
end type
type pb_cancel from picturebutton within w_escoge_getareo
end type
type pb_aceptar from picturebutton within w_escoge_getareo
end type
type st_1 from statictext within w_escoge_getareo
end type
type dw_tarifa from datawindow within w_escoge_getareo
end type
end forward

global type w_escoge_getareo from window
integer width = 1595
integer height = 908
boolean titlebar = true
string title = "Facturación: Escoger grupo Etareo"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "DosEdit5!"
boolean clientedge = true
boolean center = true
pb_cancel pb_cancel
pb_aceptar pb_aceptar
st_1 st_1
dw_tarifa dw_tarifa
end type
global w_escoge_getareo w_escoge_getareo

type variables
st_cargar_a st
end variables

on w_escoge_getareo.create
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.st_1=create st_1
this.dw_tarifa=create dw_tarifa
this.Control[]={this.pb_cancel,&
this.pb_aceptar,&
this.st_1,&
this.dw_tarifa}
end on

on w_escoge_getareo.destroy
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.st_1)
destroy(this.dw_tarifa)
end on

event open;st = message.powerobjectparm
dw_tarifa.settransobject(sqlca)
long edad
string sexo
edad =  w_simula_fac.f_edad_dias(w_simula_fac.dw_emppac.GetItemDateTime(w_simula_fac.dw_emppac.GetRow(),'fnacimiento'))
sexo = w_simula_fac.dw_emppac.GetItemString(w_simula_fac.dw_emppac.GetRow(),'sexo')
dw_tarifa.retrieve(edad,sexo,st.emp,st.cont,st.plan,st.tipoingreso,"2")//2 es de tipo, siempre como que va a ser 2???

end event

type pb_cancel from picturebutton within w_escoge_getareo
integer x = 750
integer y = 644
integer width = 151
integer height = 132
integer taborder = 30
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

type pb_aceptar from picturebutton within w_escoge_getareo
integer x = 590
integer y = 644
integer width = 151
integer height = 132
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;dw_tarifa.triggerevent(doubleclicked!)
end event

type st_1 from statictext within w_escoge_getareo
integer x = 37
integer width = 1490
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Doble click o Aceptar sobre el grupo etareo que se ajuste:"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_tarifa from datawindow within w_escoge_getareo
integer x = 37
integer y = 84
integer width = 1486
integer height = 536
integer taborder = 10
string title = "none"
string dataobject = "dw_getareo_cumple"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if this.getrow()<1 then return
closewithreturn(parent,getrow())

end event

