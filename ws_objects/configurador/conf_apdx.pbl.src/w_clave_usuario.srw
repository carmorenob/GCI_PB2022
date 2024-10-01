$PBExportHeader$w_clave_usuario.srw
forward
global type w_clave_usuario from window
end type
type pb_2 from picturebutton within w_clave_usuario
end type
type pb_1 from picturebutton within w_clave_usuario
end type
type st_2 from statictext within w_clave_usuario
end type
type st_1 from statictext within w_clave_usuario
end type
type sle_2 from singlelineedit within w_clave_usuario
end type
type sle_1 from singlelineedit within w_clave_usuario
end type
type gb_1 from groupbox within w_clave_usuario
end type
end forward

global type w_clave_usuario from window
integer width = 1344
integer height = 676
boolean titlebar = true
string title = "Confirmación de clave"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
pb_2 pb_2
pb_1 pb_1
st_2 st_2
st_1 st_1
sle_2 sle_2
sle_1 sle_1
gb_1 gb_1
end type
global w_clave_usuario w_clave_usuario

type variables
string ls_campo
end variables
event open;ls_campo=message.stringparm
x=300
y=300

end event

on w_clave_usuario.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_2=create st_2
this.st_1=create st_1
this.sle_2=create sle_2
this.sle_1=create sle_1
this.gb_1=create gb_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.st_2,&
this.st_1,&
this.sle_2,&
this.sle_1,&
this.gb_1}
end on

on w_clave_usuario.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.gb_1)
end on

type pb_2 from picturebutton within w_clave_usuario
integer x = 699
integer y = 448
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.GIF"
alignment htextalign = left!
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_clave_usuario
integer x = 535
integer y = 448
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
end type

event clicked;if isnull(sle_1.text) or trim(sle_1.text)="" then
	messagebox("Error","Clave no puede ser nula")
	return
end If
if sle_1.text<>sle_2.text then 
	messagebox("Error","No coinciden las claves")
	return
end if
string ocultar
ocultar=f_encripta_new(sle_1.text)
long hj
hj=len(ocultar)
If f_valida_usuario(usuario,sle_1.text)<>0 then
	return -1
End If
if ls_campo='clave' then
	w_usuario_nuevo.dw_1.setitem(w_usuario_nuevo.dw_1.getrow(),'clave',ocultar)
else
	w_usuario_nuevo.dw_1.setitem(w_usuario_nuevo.dw_1.getrow(),'clave_sispro',ocultar)
end if
w_usuario_nuevo.dw_1.setitem(w_usuario_nuevo.dw_1.getrow(),'intento',0)
close(parent)
end event

type st_2 from statictext within w_clave_usuario
integer x = 96
integer y = 276
integer width = 489
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Confirme Clave:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_clave_usuario
integer x = 119
integer y = 108
integer width = 471
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nueva Clave:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_2 from singlelineedit within w_clave_usuario
integer x = 594
integer y = 276
integer width = 549
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean password = true
integer limit = 10
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_clave_usuario
integer x = 599
integer y = 112
integer width = 549
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean password = true
integer limit = 10
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_clave_usuario
integer x = 73
integer y = 32
integer width = 1147
integer height = 388
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

