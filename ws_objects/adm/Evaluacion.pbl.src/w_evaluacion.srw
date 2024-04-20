$PBExportHeader$w_evaluacion.srw
forward
global type w_evaluacion from window
end type
type pb_1 from picturebutton within w_evaluacion
end type
type pb_2 from picturebutton within w_evaluacion
end type
type pb_3 from picturebutton within w_evaluacion
end type
type st_2 from statictext within w_evaluacion
end type
type st_1 from statictext within w_evaluacion
end type
type dw_2 from datawindow within w_evaluacion
end type
type dw_1 from datawindow within w_evaluacion
end type
end forward

global type w_evaluacion from window
integer width = 3758
integer height = 1604
boolean titlebar = true
string title = "Nómina - Evaluación de Desempeño"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_desempeño.ico"
pb_1 pb_1
pb_2 pb_2
pb_3 pb_3
st_2 st_2
st_1 st_1
dw_2 dw_2
dw_1 dw_1
end type
global w_evaluacion w_evaluacion

type variables
st_evalua st_p

end variables

on w_evaluacion.create
this.pb_1=create pb_1
this.pb_2=create pb_2
this.pb_3=create pb_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.pb_1,&
this.pb_2,&
this.pb_3,&
this.st_2,&
this.st_1,&
this.dw_2,&
this.dw_1}
end on

on w_evaluacion.destroy
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_2)
destroy(this.dw_1)
end on

event open;dw_1.Retrieve()

end event

type pb_1 from picturebutton within w_evaluacion
event mousemove pbm_mousemove
integer x = 1646
integer y = 1052
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
string text = "        &a"
string picturename = "buscar.gif"
string disabledname = "d_buscar.gif"
alignment htextalign = left!
string powertiptext = "Ver documento"
end type

event clicked;if dw_2.RowCount() = 0 then Return 0

st_p.tipodoc = dw_1.GetItemString(dw_1.GetRow(),'tipodoc')
st_p.documento = dw_1.GetItemString(dw_1.GetRow(),'documento')
st_p.lugar = dw_2.GetItemString(dw_2.GetRow(),'clugar')
st_p.numdoc = dw_2.GetItemNumber(dw_2.GetRow(),'numdoc')
st_p.ncargo = dw_2.GetItemNumber(dw_2.GetRow(),'ncargo')
st_p.codplantilla = dw_2.GetItemString(dw_2.GetRow(),'codplantilla')
st_p.nuevo = FALSE

opensheetwithparm(w_test,st_p,w_principal,0,layered!)

end event

type pb_2 from picturebutton within w_evaluacion
event mousemove pbm_mousemove
integer x = 1646
integer y = 1180
integer width = 142
integer height = 124
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
string picturename = "anular_doc.gif"
string disabledname = "d_anular_doc.gif"
alignment htextalign = left!
string powertiptext = "Anular Documento"
end type

type pb_3 from picturebutton within w_evaluacion
event mousemove pbm_mousemove
integer x = 1646
integer y = 924
integer width = 142
integer height = 124
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Crear documento nuevo"
end type

event clicked;if dw_1.RowCount() = 0 then 
	MessageBox('Atención','No existen empleados activos')
	Return 0
end if

st_p.tipodoc = dw_1.GetItemString(dw_1.GetRow(),'tipodoc')
st_p.documento = dw_1.GetItemString(dw_1.GetRow(),'documento')
st_p.lugar = clugar
st_p.ncargo = dw_1.GetItemNumber(dw_1.GetRow(),'ncargo')
st_p.nuevo = TRUE

opensheetwithparm(w_test,st_p,w_principal,0,layered!)

end event

type st_2 from statictext within w_evaluacion
integer x = 50
integer y = 840
integer width = 622
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Documentos Elaborados"
boolean focusrectangle = false
end type

type st_1 from statictext within w_evaluacion
integer x = 46
integer y = 20
integer width = 521
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Empleados Activos"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_evaluacion
integer x = 41
integer y = 904
integer width = 1522
integer height = 544
integer taborder = 20
string title = "none"
string dataobject = "dw_lista_evalua"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

type dw_1 from datawindow within w_evaluacion
integer x = 37
integer y = 96
integer width = 3584
integer height = 728
integer taborder = 10
string title = "none"
string dataobject = "dw_emp_activos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event rowfocuschanged;dw_2.Reset()
dw_2.Retrieve(dw_1.GetItemString(dw_1.GetRow(),'tipodoc'), dw_1.GetItemString(dw_1.GetRow(),'documento'),dw_1.GetItemNumber(dw_1.GetRow(),'ncargo'))

end event

event clicked;if row > 0 and row <> getRow() then
	SetRow(row)
end if

end event

