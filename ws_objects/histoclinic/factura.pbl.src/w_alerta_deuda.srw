$PBExportHeader$w_alerta_deuda.srw
forward
global type w_alerta_deuda from window
end type
type pb_2 from picturebutton within w_alerta_deuda
end type
type pb_1 from picturebutton within w_alerta_deuda
end type
type st_1 from statictext within w_alerta_deuda
end type
type dw_1 from datawindow within w_alerta_deuda
end type
type gb_1 from groupbox within w_alerta_deuda
end type
end forward

global type w_alerta_deuda from window
integer width = 3154
integer height = 1196
boolean titlebar = true
string title = "Alerta de Pagarés"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Exclamation!"
boolean clientedge = true
boolean center = true
pb_2 pb_2
pb_1 pb_1
st_1 st_1
dw_1 dw_1
gb_1 gb_1
end type
global w_alerta_deuda w_alerta_deuda

type variables
string cerrar='!'
end variables

on w_alerta_deuda.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_1=create st_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.st_1,&
this.dw_1,&
this.gb_1}
end on

on w_alerta_deuda.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;if dw_1.retrieve(tipdoc,docu) < 1 then
	cerrar=''
	close(this)
end if
end event

event close;closewithreturn(this,cerrar)
end event

type pb_2 from picturebutton within w_alerta_deuda
integer x = 1499
integer y = 944
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &n"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
string powertiptext = "Cancelar -NO- [Alt+N]"
end type

event clicked;cerrar='!'
close(parent)
end event

type pb_1 from picturebutton within w_alerta_deuda
integer x = 1344
integer y = 944
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &s"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
string powertiptext = "Aceptar -SI- [Alt+S]"
end type

event clicked;cerrar=''
close(parent)
end event

type st_1 from statictext within w_alerta_deuda
integer x = 41
integer y = 836
integer width = 3049
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Desea continuar aunque el paciente posea esa deuda?"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_alerta_deuda
integer x = 59
integer y = 80
integer width = 3017
integer height = 668
integer taborder = 10
string title = "none"
string dataobject = "dw_pagares_pend"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type gb_1 from groupbox within w_alerta_deuda
integer x = 18
integer y = 12
integer width = 3086
integer height = 800
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "El Paciente tiene los siguientes pagarés sin cancelar:"
borderstyle borderstyle = styleraised!
end type

