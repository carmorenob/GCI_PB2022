$PBExportHeader$w_cantidad.srw
forward
global type w_cantidad from window
end type
type st_1 from statictext within w_cantidad
end type
type sle_1 from singlelineedit within w_cantidad
end type
type mle_1 from multilineedit within w_cantidad
end type
type pb_aceptar from picturebutton within w_cantidad
end type
end forward

global type w_cantidad from window
integer width = 987
integer height = 592
boolean titlebar = true
string title = "Cantidad"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Question!"
boolean center = true
st_1 st_1
sle_1 sle_1
mle_1 mle_1
pb_aceptar pb_aceptar
end type
global w_cantidad w_cantidad

type variables
datawindow dw_factura
end variables

event open;dw_factura=message.powerobjectparm
mle_1.text=dw_factura.getitemstring(dw_factura.getrow(),'descripcion')
sle_1.SelectText ( 1, 1)
end event

on w_cantidad.create
this.st_1=create st_1
this.sle_1=create sle_1
this.mle_1=create mle_1
this.pb_aceptar=create pb_aceptar
this.Control[]={this.st_1,&
this.sle_1,&
this.mle_1,&
this.pb_aceptar}
end on

on w_cantidad.destroy
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.mle_1)
destroy(this.pb_aceptar)
end on

type st_1 from statictext within w_cantidad
integer x = 82
integer y = 244
integer width = 256
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cantidad:"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_cantidad
integer x = 347
integer y = 232
integer width = 370
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 1090519039
string text = "1"
integer limit = 5
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type mle_1 from multilineedit within w_cantidad
integer x = 23
integer y = 20
integer width = 933
integer height = 184
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type pb_aceptar from picturebutton within w_cantidad
integer x = 389
integer y = 348
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
end type

event clicked;if long(sle_1.text)<1 then return
if dw_factura.getitemstring(dw_factura.getrow(),'es_medica')<>'1' then
//	if long(sle_1.text)> 30 then
if real(sle_1.text)> 30 then
		if messagebox('Atención','Cantidad muy grande, desea continuar?',question!,yesno!,2)=2 then return
	end if
end if
dw_factura.setitem(dw_factura.getrow(),"cantidad",real(sle_1.text))
close(parent)
end event

