$PBExportHeader$w_contr_tipo_afili.srw
forward
global type w_contr_tipo_afili from window
end type
type pb_1 from picturebutton within w_contr_tipo_afili
end type
type pb_2 from picturebutton within w_contr_tipo_afili
end type
type pb_4 from picturebutton within w_contr_tipo_afili
end type
type pb_3 from picturebutton within w_contr_tipo_afili
end type
type st_2 from statictext within w_contr_tipo_afili
end type
type st_1 from statictext within w_contr_tipo_afili
end type
type dw_1 from datawindow within w_contr_tipo_afili
end type
type gb_1 from groupbox within w_contr_tipo_afili
end type
end forward

global type w_contr_tipo_afili from window
integer width = 2949
integer height = 1232
boolean titlebar = true
string title = "Asistente de contratación"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
pb_1 pb_1
pb_2 pb_2
pb_4 pb_4
pb_3 pb_3
st_2 st_2
st_1 st_1
dw_1 dw_1
gb_1 gb_1
end type
global w_contr_tipo_afili w_contr_tipo_afili

on w_contr_tipo_afili.create
this.pb_1=create pb_1
this.pb_2=create pb_2
this.pb_4=create pb_4
this.pb_3=create pb_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.pb_1,&
this.pb_2,&
this.pb_4,&
this.pb_3,&
this.st_2,&
this.st_1,&
this.dw_1,&
this.gb_1}
end on

on w_contr_tipo_afili.destroy
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;dw_1.settransobject(SQLCA)
long fila
fila=w_contratos.tab_1.tp_5.dw_p5_4.getrow()
dw_1.retrieve(w_contratos.empres,w_contratos.i_contrat,w_contratos.tab_1.tp_5.dw_p5_4.getitemstring(fila,3),w_contratos.tab_1.tp_5.dw_p5_4.getitemstring(fila,4),w_contratos.tab_1.tp_5.dw_p5_4.getitemstring(fila,5))

end event

type pb_1 from picturebutton within w_contr_tipo_afili
string tag = "Adicionar"
integer x = 942
integer y = 992
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.GIF"
alignment htextalign = left!
end type

event clicked;long fila
string plan,ingreso,tipo
fila=w_contratos.tab_1.tp_5.dw_p5_4.getrow()
plan=w_contratos.tab_1.tp_5.dw_p5_4.getitemstring(fila,3)
ingreso=w_contratos.tab_1.tp_5.dw_p5_4.getitemstring(fila,4)
tipo=w_contratos.tab_1.tp_5.dw_p5_4.getitemstring(fila,5)
dw_1.setfocus()
fila=dw_1.insertrow(0)
dw_1.scrolltorow(fila)
dw_1.setitem(fila,1,w_contratos.empres)
dw_1.setitem(fila,2,w_contratos.i_contrat)
dw_1.setitem(fila,3,plan)
dw_1.setitem(fila,4,ingreso)
dw_1.setitem(fila,5,tipo)
end event

type pb_2 from picturebutton within w_contr_tipo_afili
string tag = "Guardar"
integer x = 1134
integer y = 992
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.GIF"
alignment htextalign = left!
end type

event clicked;if dw_1.update()=-1 then 
	rollback;
else 
	commit;
end if
end event

type pb_4 from picturebutton within w_contr_tipo_afili
string tag = "Refrescar"
integer x = 1518
integer y = 992
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "refrescar.gif"
alignment htextalign = left!
end type

event clicked;parent.triggerevent(open!)
end event

type pb_3 from picturebutton within w_contr_tipo_afili
string tag = "Eliminar"
integer x = 1326
integer y = 992
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;dw_1.deleterow(0)
end event

type st_2 from statictext within w_contr_tipo_afili
integer x = 41
integer y = 116
integer width = 2807
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 134217752
string text = "Establesca para el contrato, los tipos de afiliados que tienen excepciones en el cobro del copago y/o la cuota moderadora.  Para este tipo de afiliado se carga a la empresa lo que no se le cobra al usuario"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_contr_tipo_afili
integer x = 41
integer width = 1033
integer height = 112
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Contratos Tipo Afiliado"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_contr_tipo_afili
integer x = 46
integer y = 376
integer width = 2848
integer height = 552
integer taborder = 10
string title = "none"
string dataobject = "dw_cont_tipo_afil"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_contr_tipo_afili
integer x = 14
integer y = 304
integer width = 2912
integer height = 660
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Configuaración de Tipos de Afiliado"
borderstyle borderstyle = styleraised!
end type

