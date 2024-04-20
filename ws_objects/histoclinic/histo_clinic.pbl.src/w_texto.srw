$PBExportHeader$w_texto.srw
forward
global type w_texto from window
end type
type pb_2 from picturebutton within w_texto
end type
type pb_1 from picturebutton within w_texto
end type
type mle_1 from multilineedit within w_texto
end type
end forward

global type w_texto from window
integer width = 1115
integer height = 816
boolean titlebar = true
string title = "Insertar/Modificar Texto"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "DosEdit5!"
pb_2 pb_2
pb_1 pb_1
mle_1 mle_1
end type
global w_texto w_texto

on w_texto.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.mle_1=create mle_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.mle_1}
end on

on w_texto.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.mle_1)
end on

event open;mle_1.text=message.stringparm
if isvalid(w_muestra_imag) then
	x=w_muestra_imag.pointerx()
	y=w_muestra_imag.pointery()
end if
if isvalid(w_corpograma) then
	x=w_corpograma.pointerx()
	y=w_corpograma.pointery()
end if
end event

type pb_2 from picturebutton within w_texto
integer x = 549
integer y = 544
integer width = 146
integer height = 128
integer taborder = 30
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

type pb_1 from picturebutton within w_texto
integer x = 370
integer y = 540
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;closewithreturn(parent,mle_1.text)
end event

type mle_1 from multilineedit within w_texto
integer width = 1097
integer height = 524
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean vscrollbar = true
boolean autohscroll = true
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

