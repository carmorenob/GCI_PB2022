$PBExportHeader$w_seglugar.srw
forward
global type w_seglugar from window
end type
type pb_guardar from picturebutton within w_seglugar
end type
type pb_salir from picturebutton within w_seglugar
end type
type st_3 from statictext within w_seglugar
end type
type dw_2 from datawindow within w_seglugar
end type
type st_2 from statictext within w_seglugar
end type
type dw_1 from datawindow within w_seglugar
end type
type st_1 from statictext within w_seglugar
end type
type pb_7 from picturebutton within w_seglugar
end type
type pb_6 from picturebutton within w_seglugar
end type
type pb_5 from picturebutton within w_seglugar
end type
type pb_4 from picturebutton within w_seglugar
end type
type dw_no_estan from datawindow within w_seglugar
end type
type dw_estan from datawindow within w_seglugar
end type
type gb_2 from groupbox within w_seglugar
end type
type dw_alm from datawindow within w_seglugar
end type
end forward

global type w_seglugar from window
integer width = 2953
integer height = 1760
boolean titlebar = true
string title = "Grupos autorizados por Lugar"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "ribon_slugar.ico"
pb_guardar pb_guardar
pb_salir pb_salir
st_3 st_3
dw_2 dw_2
st_2 st_2
dw_1 dw_1
st_1 st_1
pb_7 pb_7
pb_6 pb_6
pb_5 pb_5
pb_4 pb_4
dw_no_estan dw_no_estan
dw_estan dw_estan
gb_2 gb_2
dw_alm dw_alm
end type
global w_seglugar w_seglugar

type variables
datawindowchild dwc_almfuente

end variables

on w_seglugar.create
this.pb_guardar=create pb_guardar
this.pb_salir=create pb_salir
this.st_3=create st_3
this.dw_2=create dw_2
this.st_2=create st_2
this.dw_1=create dw_1
this.st_1=create st_1
this.pb_7=create pb_7
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_4=create pb_4
this.dw_no_estan=create dw_no_estan
this.dw_estan=create dw_estan
this.gb_2=create gb_2
this.dw_alm=create dw_alm
this.Control[]={this.pb_guardar,&
this.pb_salir,&
this.st_3,&
this.dw_2,&
this.st_2,&
this.dw_1,&
this.st_1,&
this.pb_7,&
this.pb_6,&
this.pb_5,&
this.pb_4,&
this.dw_no_estan,&
this.dw_estan,&
this.gb_2,&
this.dw_alm}
end on

on w_seglugar.destroy
destroy(this.pb_guardar)
destroy(this.pb_salir)
destroy(this.st_3)
destroy(this.dw_2)
destroy(this.st_2)
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.dw_no_estan)
destroy(this.dw_estan)
destroy(this.gb_2)
destroy(this.dw_alm)
end on

event open;string varnul
dw_alm.GetChild('descripcion', dwc_almfuente)
dwc_almfuente.SetTransObject(SQLCA)
if dwc_almfuente.Retrieve('%','%') = 0 then
	messageBox('Aviso','No hay almacenes configurados')
	dwc_almfuente.InsertRow(0)
end if
dw_alm.SetTransObject(SQLCA)
dw_alm.InsertRow(0)
setnull(varnul)
dw_alm.SetItem(1,'descripcion',varnul)

end event

event closequery;if dw_estan.ModifiedCount() > 0 or dw_estan.DeletedCount() > 0 then
	int ret
	ret = MessageBox('Aviso','Ha realizado cambios. Desea guardarlos?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then 
		Return pb_guardar.Event Clicked()
	elseif ret = 2 then
		Return 0
	else
		Return -1
	end if
end if

end event

type pb_guardar from picturebutton within w_seglugar
integer x = 1330
integer y = 1520
integer width = 151
integer height = 132
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "guardar.gif"
alignment htextalign = left!
end type

event clicked;if dw_estan.Update() = -1 then
	Rollback;
	Return -1
end if
commit;
Return 0

end event

type pb_salir from picturebutton within w_seglugar
integer x = 1134
integer y = 1520
integer width = 146
integer height = 128
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
end type

event clicked;Close(parent)

end event

type st_3 from statictext within w_seglugar
integer x = 1550
integer y = 960
integer width = 302
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Usuarios"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_seglugar
integer x = 1550
integer y = 1028
integer width = 1230
integer height = 400
integer taborder = 140
string title = "none"
string dataobject = "dw_usu_grup"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type st_2 from statictext within w_seglugar
integer x = 78
integer y = 960
integer width = 302
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Usuarios"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_seglugar
integer x = 78
integer y = 1028
integer width = 1230
integer height = 404
integer taborder = 110
string title = "none"
string dataobject = "dw_usu_grup"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type st_1 from statictext within w_seglugar
integer x = 46
integer y = 20
integer width = 293
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lugar"
boolean focusrectangle = false
end type

type pb_7 from picturebutton within w_seglugar
integer x = 1353
integer y = 504
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ultimo.gif"
vtextalign vtextalign = vcenter!
string powertiptext = "Retirar a todos del Grupo"
end type

event clicked;do while dw_estan.rowcount()>0
	pb_4.triggerevent(clicked!)
loop
end event

type pb_6 from picturebutton within w_seglugar
integer x = 1353
integer y = 644
integer width = 146
integer height = 128
integer taborder = 120
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "atras_1.gif"
vtextalign vtextalign = vcenter!
string powertiptext = "Agregar al Grupo"
end type

event clicked;if dw_no_estan.rowcount()=0 then return
long fila
fila=dw_no_estan.getrow()
dw_estan.insertrow(1)
dw_estan.setitem(1,'codlugar',dw_alm.GetItemString(1,'descripcion'))
dw_estan.setitem(1,'codgrupo',dw_no_estan.getitemstring(fila,'codgrupo'))
dw_estan.setitem(1,'descripcion',dw_no_estan.getitemstring(fila,'descripcion'))
dw_no_estan.deleterow(fila)
end event

type pb_5 from picturebutton within w_seglugar
integer x = 1353
integer y = 780
integer width = 146
integer height = 128
integer taborder = 130
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "atras.gif"
vtextalign vtextalign = vcenter!
string powertiptext = "Agregar Todos al Grupo"
end type

event clicked;do while dw_no_estan.rowcount()>0
	pb_6.triggerevent(clicked!)
loop
end event

type pb_4 from picturebutton within w_seglugar
integer x = 1353
integer y = 372
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "adelante_1.gif"
vtextalign vtextalign = vcenter!
string powertiptext = "Retirar del Grupo"
end type

event clicked;if dw_estan.rowcount()=0 then return
long fila
fila=dw_estan.getrow()
dw_no_estan.insertrow(1)
dw_no_estan.setitem(1,'codgrupo',dw_estan.getitemstring(fila,'codgrupo'))
//dw_no_estan.setitem(1,'codalmacen',dw_estan.getitemstring(fila,'codalmacen'))
dw_no_estan.setitem(1,'descripcion',dw_estan.getitemstring(fila,'descripcion'))
dw_estan.deleterow(fila)

end event

type dw_no_estan from datawindow within w_seglugar
integer x = 1550
integer y = 232
integer width = 1230
integer height = 684
integer taborder = 140
string title = "none"
string dataobject = "dw_nogrupolugar"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event doubleclicked;if this.getrow()>0 then pb_6.triggerevent(clicked!)
end event

event rowfocuschanged;if currentrow = 0 or RowCount() = 0 then Return
dw_2.Retrieve(GetItemString(GetRow(),'codgrupo'))

end event

type dw_estan from datawindow within w_seglugar
integer x = 78
integer y = 232
integer width = 1230
integer height = 684
integer taborder = 90
string title = "none"
string dataobject = "dw_grupolugar"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event doubleclicked;if this.getrow()>0 then pb_4.triggerevent(clicked!)
end event

event rowfocuschanged;if currentrow = 0 or RowCount() = 0 then Return
dw_1.Retrieve(GetItemString(GetRow(),'codgrupo'))
end event

type gb_2 from groupbox within w_seglugar
integer x = 37
integer y = 128
integer width = 2816
integer height = 1364
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupos"
borderstyle borderstyle = styleraised!
end type

type dw_alm from datawindow within w_seglugar
integer x = 347
integer y = 20
integer width = 1120
integer height = 92
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_lugarseg"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;AcceptText()
dw_estan.Reset()
dw_no_estan.Reset()
dw_estan.Retrieve(GetItemString(1,'descripcion'))
dw_no_estan.Retrieve(GetItemString(1,'descripcion'))

end event

