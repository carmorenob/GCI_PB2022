$PBExportHeader$w_topes_estrato.srw
forward
global type w_topes_estrato from window
end type
type pb_1 from picturebutton within w_topes_estrato
end type
type pb_2 from picturebutton within w_topes_estrato
end type
type pb_3 from picturebutton within w_topes_estrato
end type
type pb_4 from picturebutton within w_topes_estrato
end type
type st_2 from statictext within w_topes_estrato
end type
type st_1 from statictext within w_topes_estrato
end type
type dw_1 from datawindow within w_topes_estrato
end type
type gb_1 from groupbox within w_topes_estrato
end type
end forward

global type w_topes_estrato from window
integer width = 1879
integer height = 1136
boolean titlebar = true
string title = "Asistente de contratación"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
pb_1 pb_1
pb_2 pb_2
pb_3 pb_3
pb_4 pb_4
st_2 st_2
st_1 st_1
dw_1 dw_1
gb_1 gb_1
end type
global w_topes_estrato w_topes_estrato

on w_topes_estrato.create
this.pb_1=create pb_1
this.pb_2=create pb_2
this.pb_3=create pb_3
this.pb_4=create pb_4
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.pb_1,&
this.pb_2,&
this.pb_3,&
this.pb_4,&
this.st_2,&
this.st_1,&
this.dw_1,&
this.gb_1}
end on

on w_topes_estrato.destroy
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.pb_4)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;this.x=800
this.y=800
dw_1.settransobject(SQLCA)
dw_1.retrieve(w_contratos.empres,w_contratos.i_contrat)

end event

type pb_1 from picturebutton within w_topes_estrato
string tag = "Adicionar"
integer x = 1440
integer y = 452
integer width = 151
integer height = 132
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.GIF"
alignment htextalign = left!
end type

event clicked;long fila
dw_1.setfocus()
fila=dw_1.insertrow(0)
dw_1.scrolltorow(fila)
dw_1.setitem(fila,'cemp',w_contratos.empres)
dw_1.setitem(fila,'ccontrato',w_contratos.i_contrat)

end event

type pb_2 from picturebutton within w_topes_estrato
string tag = "Guardar"
integer x = 1623
integer y = 620
integer width = 151
integer height = 132
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "guardar.GIF"
alignment htextalign = left!
end type

event clicked;if dw_1.update()=-1 then 
	rollback;
else 
	commit;
end if

end event

type pb_3 from picturebutton within w_topes_estrato
string tag = "Borrar"
integer x = 1623
integer y = 452
integer width = 151
integer height = 132
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;dw_1.deleterow(0)
end event

type pb_4 from picturebutton within w_topes_estrato
string tag = "Refrescar"
integer x = 1440
integer y = 620
integer width = 151
integer height = 132
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "refrescar.gif"
alignment htextalign = left!
end type

event clicked;dw_1.retrieve(w_contratos.empres,w_contratos.i_contrat)
end event

type st_2 from statictext within w_topes_estrato
integer x = 73
integer y = 124
integer width = 1760
integer height = 224
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 134217752
string text = "Establesca para cada estrato cual es el tope máximo de cobro por copago, si se excede el copago a este monto, el exedente se carga automáticamente a la empresa responsable. Este Tope está dado en pesos."
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_topes_estrato
integer x = 91
integer y = 4
integer width = 837
integer height = 104
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Topes por estrato"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_topes_estrato
integer x = 114
integer y = 456
integer width = 1234
integer height = 504
integer taborder = 10
string title = "none"
string dataobject = "dw_tope_estrato"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_topes_estrato
integer x = 78
integer y = 388
integer width = 1303
integer height = 600
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Configuaración de Topes"
borderstyle borderstyle = styleraised!
end type

