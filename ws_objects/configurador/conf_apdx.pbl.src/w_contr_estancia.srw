$PBExportHeader$w_contr_estancia.srw
forward
global type w_contr_estancia from window
end type
type pb_4 from picturebutton within w_contr_estancia
end type
type pb_3 from picturebutton within w_contr_estancia
end type
type pb_2 from picturebutton within w_contr_estancia
end type
type pb_1 from picturebutton within w_contr_estancia
end type
type st_2 from statictext within w_contr_estancia
end type
type st_1 from statictext within w_contr_estancia
end type
type dw_1 from datawindow within w_contr_estancia
end type
type gb_1 from groupbox within w_contr_estancia
end type
end forward

global type w_contr_estancia from window
integer width = 3131
integer height = 1180
boolean titlebar = true
string title = "Asistente de Contratación Estancia"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
st_2 st_2
st_1 st_1
dw_1 dw_1
gb_1 gb_1
end type
global w_contr_estancia w_contr_estancia

on w_contr_estancia.create
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.st_2,&
this.st_1,&
this.dw_1,&
this.gb_1}
end on

on w_contr_estancia.destroy
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;this.x=800
this.y=800
dw_1.settransobject(SQLCA)
long fila
fila=w_contratos.tab_1.tp_4.dw_p4_3.getrow()
string plan,tingres,tipo
plan=w_contratos.tab_1.tp_4.dw_p4_3.getitemstring(fila,3)
tingres=w_contratos.tab_1.tp_4.dw_p4_3.getitemstring(fila,4)
tipo=w_contratos.tab_1.tp_4.dw_p4_3.getitemstring(fila,5)
dw_1.retrieve(w_contratos.empres,w_contratos.i_contrat,plan,tingres,tipo)

end event

type pb_4 from picturebutton within w_contr_estancia
string tag = "Refrescar"
integer x = 2757
integer y = 116
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "refrescar.gif"
alignment htextalign = left!
end type

event clicked;parent.triggerevent(open!)
end event

type pb_3 from picturebutton within w_contr_estancia
string tag = "Borrar"
integer x = 2446
integer y = 116
integer width = 146
integer height = 128
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

type pb_2 from picturebutton within w_contr_estancia
string tag = "Guardar"
integer x = 2597
integer y = 116
integer width = 151
integer height = 132
integer taborder = 20
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

type pb_1 from picturebutton within w_contr_estancia
string tag = "Adicionar"
integer x = 2277
integer y = 116
integer width = 151
integer height = 132
integer taborder = 20
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
string plan,tingres,tipo
plan=w_contratos.tab_1.tp_4.dw_p4_3.getitemstring(w_contratos.tab_1.tp_4.dw_p4_3.getrow(),3)
tingres=w_contratos.tab_1.tp_4.dw_p4_3.getitemstring(w_contratos.tab_1.tp_4.dw_p4_3.getrow(),4)
tipo=w_contratos.tab_1.tp_4.dw_p4_3.getitemstring(w_contratos.tab_1.tp_4.dw_p4_3.getrow(),5)
dw_1.setfocus()
open(w_busca_proc_estancia)
for fila=1 to  dw_1.rowcount()
	dw_1.setitem(fila,1,w_contratos.empres)
	dw_1.setitem(fila,2,w_contratos.i_contrat)
	dw_1.setitem(fila,3,plan)
	dw_1.setitem(fila,4,tingres)
	dw_1.setitem(fila,5,tipo)
next
end event

type st_2 from statictext within w_contr_estancia
integer x = 50
integer y = 116
integer width = 2176
integer height = 132
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 134217752
string text = "Establezca para el contrato, los  procedimientos de estancia los cuales tienen cobros diferenciales despues de un tope de dias. "
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_contr_estancia
integer x = 50
integer width = 1431
integer height = 112
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Contratos Diferencial de Estancia"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_contr_estancia
integer x = 87
integer y = 352
integer width = 2930
integer height = 664
integer taborder = 10
string title = "none"
string dataobject = "dw_contra_estancia"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if dw_1.update()=-1 then 
	rollback;
else 
	commit;
end if

end event

type gb_1 from groupbox within w_contr_estancia
integer x = 50
integer y = 280
integer width = 3008
integer height = 764
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
string text = "Configuración de Estancias Diferenciales"
borderstyle borderstyle = styleraised!
end type

