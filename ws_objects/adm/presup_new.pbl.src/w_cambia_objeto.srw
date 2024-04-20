$PBExportHeader$w_cambia_objeto.srw
forward
global type w_cambia_objeto from window
end type
type mle_1 from multilineedit within w_cambia_objeto
end type
type st_1 from statictext within w_cambia_objeto
end type
type pb_9 from picturebutton within w_cambia_objeto
end type
type pb_grabar from picturebutton within w_cambia_objeto
end type
end forward

global type w_cambia_objeto from window
integer width = 2606
integer height = 988
boolean titlebar = true
string title = "Modificar Objeto"
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mle_1 mle_1
st_1 st_1
pb_9 pb_9
pb_grabar pb_grabar
end type
global w_cambia_objeto w_cambia_objeto

type variables
st_interfaz st_pasa
end variables

on w_cambia_objeto.create
this.mle_1=create mle_1
this.st_1=create st_1
this.pb_9=create pb_9
this.pb_grabar=create pb_grabar
this.Control[]={this.mle_1,&
this.st_1,&
this.pb_9,&
this.pb_grabar}
end on

on w_cambia_objeto.destroy
destroy(this.mle_1)
destroy(this.st_1)
destroy(this.pb_9)
destroy(this.pb_grabar)
end on

event open;st_pasa= Message.PowerObjectParm
mle_1.text=st_pasa.dw_cab.getitemstring(st_pasa.cod_vigencia,'objeto')
end event

type mle_1 from multilineedit within w_cambia_objeto
integer x = 50
integer y = 92
integer width = 2322
integer height = 744
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
end type

event modified;pb_grabar.enabled=true
end event

type st_1 from statictext within w_cambia_objeto
integer x = 55
integer y = 24
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Objeto"
boolean focusrectangle = false
end type

type pb_9 from picturebutton within w_cambia_objeto
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 2409
integer y = 228
integer width = 142
integer height = 124
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_grabar from picturebutton within w_cambia_objeto
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 2409
integer y = 92
integer width = 142
integer height = 124
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;st_pasa.dw_cab.setitem(st_pasa.cod_vigencia,'objeto',mle_1.text)
st_pasa.dw_cab.setitem(st_pasa.cod_vigencia,'impreso','0')
st_pasa.dw_cab.update()
close(parent)
end event

