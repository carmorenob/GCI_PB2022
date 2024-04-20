$PBExportHeader$w_pide_fecha.srw
forward
global type w_pide_fecha from window
end type
type pb_2 from picturebutton within w_pide_fecha
end type
type pb_1 from picturebutton within w_pide_fecha
end type
type dw_doc_cab from datawindow within w_pide_fecha
end type
end forward

global type w_pide_fecha from window
integer width = 901
integer height = 488
boolean titlebar = true
string title = "Fecha del Nuevo Asiento"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Question!"
boolean clientedge = true
boolean center = true
pb_2 pb_2
pb_1 pb_1
dw_doc_cab dw_doc_cab
end type
global w_pide_fecha w_pide_fecha

on w_pide_fecha.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_doc_cab=create dw_doc_cab
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_doc_cab}
end on

on w_pide_fecha.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_doc_cab)
end on

type pb_2 from picturebutton within w_pide_fecha
integer x = 421
integer y = 240
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_pide_fecha
integer x = 242
integer y = 240
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "       &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;dw_doc_cab.accepttext()
if dw_doc_cab.getitemnumber(1,"ano") <> year(date(dw_doc_cab.getitemdatetime(1,"fecha"))) then
	messagebox("Atención","El año no corresponde a la fecha del documento")
	dw_doc_cab.setcolumn("ano")
	dw_doc_cab.setfocus()
	return 
end if
if dw_doc_cab.getitemnumber(1,"mes") <> month(date(dw_doc_cab.getitemdatetime(1,"fecha"))) then
	messagebox("Atención","El mes no corresponde a la fecha del documento")
	dw_doc_cab.setcolumn("mes")
	dw_doc_cab.setfocus()
	return 
end if
long fila_mes
int ano_contable,mes_contable
ano_contable=dw_doc_cab.getitemnumber(1,"ano")
mes_contable=dw_doc_cab.getitemnumber(1,"mes")
fila_mes=w_comp_cont.dw_cierres.find("ano="+string(ano_contable)+" and mes="+string(mes_contable),1,w_comp_cont.dw_cierres.rowcount())
if fila_mes=0 then
	messagebox("Atención","Este mes contable no ha sido creado, debe crearlo primero para poder continuar")
	return 
end if
w_comp_cont.dw_doc_cab.setitem(1,"ano",dw_doc_cab.getitemnumber(1,'ano'))
w_comp_cont.dw_doc_cab.setitem(1,"mes",dw_doc_cab.getitemnumber(1,'mes'))
w_comp_cont.dw_doc_cab.setitem(1,"fecha",dw_doc_cab.getitemdatetime(1,'fecha'))
closewithreturn(parent,'si')
end event

type dw_doc_cab from datawindow within w_pide_fecha
integer x = 9
integer y = 20
integer width = 1152
integer height = 176
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_doc_cab"
boolean border = false
end type

event constructor;insertrow(1)
dw_doc_cab.setitem(1,"ano",year(today()))
dw_doc_cab.setitem(1,"mes",month(today()))
dw_doc_cab.setitem(1,"fecha",datetime(today()))

end event

