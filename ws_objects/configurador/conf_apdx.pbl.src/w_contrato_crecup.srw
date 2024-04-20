$PBExportHeader$w_contrato_crecup.srw
forward
global type w_contrato_crecup from window
end type
type pb_3 from picturebutton within w_contrato_crecup
end type
type pb_4 from picturebutton within w_contrato_crecup
end type
type pb_2 from picturebutton within w_contrato_crecup
end type
type pb_1 from picturebutton within w_contrato_crecup
end type
type st_2 from statictext within w_contrato_crecup
end type
type st_1 from statictext within w_contrato_crecup
end type
type dw_1 from datawindow within w_contrato_crecup
end type
type gb_1 from groupbox within w_contrato_crecup
end type
end forward

global type w_contrato_crecup from window
integer width = 2053
integer height = 1236
boolean titlebar = true
string title = "Asistente de contratación"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
pb_3 pb_3
pb_4 pb_4
pb_2 pb_2
pb_1 pb_1
st_2 st_2
st_1 st_1
dw_1 dw_1
gb_1 gb_1
end type
global w_contrato_crecup w_contrato_crecup

on w_contrato_crecup.create
this.pb_3=create pb_3
this.pb_4=create pb_4
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.pb_3,&
this.pb_4,&
this.pb_2,&
this.pb_1,&
this.st_2,&
this.st_1,&
this.dw_1,&
this.gb_1}
end on

on w_contrato_crecup.destroy
destroy(this.pb_3)
destroy(this.pb_4)
destroy(this.pb_2)
destroy(this.pb_1)
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

type pb_3 from picturebutton within w_contrato_crecup
string tag = "Eliminar"
integer x = 1102
integer y = 996
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

type pb_4 from picturebutton within w_contrato_crecup
string tag = "Refrescar"
integer x = 1294
integer y = 996
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
string picturename = "refrescar.gif"
alignment htextalign = left!
end type

event clicked;parent.triggerevent(open!)
end event

type pb_2 from picturebutton within w_contrato_crecup
string tag = "Guardar"
integer x = 910
integer y = 996
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

type pb_1 from picturebutton within w_contrato_crecup
string tag = "Adicionar"
integer x = 718
integer y = 996
integer width = 146
integer height = 128
integer taborder = 10
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

type st_2 from statictext within w_contrato_crecup
integer x = 55
integer y = 120
integer width = 1943
integer height = 220
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 134217752
string text = "Establezca para cada estrato cual es el porcentage a pagar en cada atención según el tipo de ingreso que halle tenido el paciente. Cada copago puede ser un porcentage , un valor fijo o tener un rango de porcentages siendo el campo %, el más común"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_contrato_crecup
integer x = 41
integer y = 4
integer width = 1975
integer height = 112
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Valores de Cuota de recuperacion  por estrato"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_contrato_crecup
integer x = 87
integer y = 420
integer width = 1851
integer height = 508
integer taborder = 10
string title = "none"
string dataobject = "dw_contrato_crecup"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_contrato_crecup
integer x = 55
integer y = 360
integer width = 1938
integer height = 612
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Configuaración de Topes"
borderstyle borderstyle = styleraised!
end type

