$PBExportHeader$w_contrato_capitaufcc.srw
forward
global type w_contrato_capitaufcc from window
end type
type pb_1 from picturebutton within w_contrato_capitaufcc
end type
type pb_2 from picturebutton within w_contrato_capitaufcc
end type
type pb_4 from picturebutton within w_contrato_capitaufcc
end type
type pb_3 from picturebutton within w_contrato_capitaufcc
end type
type st_2 from statictext within w_contrato_capitaufcc
end type
type st_1 from statictext within w_contrato_capitaufcc
end type
type dw_1 from datawindow within w_contrato_capitaufcc
end type
type gb_1 from groupbox within w_contrato_capitaufcc
end type
end forward

global type w_contrato_capitaufcc from window
integer width = 3698
integer height = 1796
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
global w_contrato_capitaufcc w_contrato_capitaufcc

type variables
datawindowchild dw_uf,dw_ccosto
end variables

on w_contrato_capitaufcc.create
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

on w_contrato_capitaufcc.destroy
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;dw_1.retrieve(w_contratos.empres,w_contratos.i_contrat)

end event

type pb_1 from picturebutton within w_contrato_capitaufcc
string tag = "Adicionar"
integer x = 1563
integer y = 1468
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
string picturename = "insertar.GIF"
alignment htextalign = left!
end type

event clicked;long fila
dw_1.setfocus()
fila=dw_1.insertrow(0)
dw_1.scrolltorow(fila)
dw_1.setitem(fila,'codemp',w_contratos.empres)
dw_1.setitem(fila,'codcontrato',w_contratos.i_contrat)
dw_1.setitem(fila,'usuario',usuario)

end event

type pb_2 from picturebutton within w_contrato_capitaufcc
string tag = "Guardar"
integer x = 1755
integer y = 1468
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
string picturename = "guardar.GIF"
alignment htextalign = left!
end type

event clicked;if dw_1.update()=-1 then 
	rollback;
else 
	commit;
end if

end event

type pb_4 from picturebutton within w_contrato_capitaufcc
string tag = "Refrescar"
integer x = 2139
integer y = 1468
integer width = 146
integer height = 128
integer taborder = 70
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

type pb_3 from picturebutton within w_contrato_capitaufcc
string tag = "Eliminar"
integer x = 1947
integer y = 1468
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
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;dw_1.deleterow(0)
end event

type st_2 from statictext within w_contrato_capitaufcc
integer x = 69
integer y = 112
integer width = 3552
integer height = 104
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 134217752
string text = "Establezca para el contrato las unidades funcionales y los centros de costos asociados a los servicios de capita"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_contrato_capitaufcc
integer x = 73
integer y = 4
integer width = 1394
integer height = 112
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Discrimina Contrato por UF y CC"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_contrato_capitaufcc
integer x = 101
integer y = 304
integer width = 3502
integer height = 1052
integer taborder = 10
string title = "none"
string dataobject = "dw_contrato_capitaufcc"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;accepttext()
string nulo

setnull(nulo)
if getcolumnname()="coduf" then
	setitem(getrow(),"codcc",nulo)
	setitem(getrow(),"descripcion",nulo)
	dw_ccosto.retrieve(this.getitemstring(this.getrow(),'coduf'))
	setitem(getrow(),"desufuncional",dw_uf.getitemstring(dw_uf.getrow(),'desufuncional'))
end if
if getcolumnname()="codcc" then
	setitem(getrow(),"descripcion",dw_ccosto.getitemstring(dw_ccosto.getrow(),'descripcion'))
end if

accepttext()

end event

event constructor;settransobject(SQLCA)
getchild("coduf",dw_uf)
dw_uf.settransobject(sqlca)

getchild("codcc",dw_ccosto)
dw_ccosto.settransobject(sqlca)
end event

type gb_1 from groupbox within w_contrato_capitaufcc
integer x = 73
integer y = 236
integer width = 3566
integer height = 1180
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Configuaración UF X CC"
borderstyle borderstyle = styleraised!
end type

