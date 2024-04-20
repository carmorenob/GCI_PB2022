$PBExportHeader$w_sum_cierre.srw
forward
global type w_sum_cierre from window
end type
type pb_4 from picturebutton within w_sum_cierre
end type
type pb_3 from picturebutton within w_sum_cierre
end type
type dw_alm from datawindow within w_sum_cierre
end type
type pb_sumcierre from picturebutton within w_sum_cierre
end type
type pb_1 from picturebutton within w_sum_cierre
end type
type pb_8 from picturebutton within w_sum_cierre
end type
type pb_9 from picturebutton within w_sum_cierre
end type
type dw_1 from datawindow within w_sum_cierre
end type
type pb_7 from picturebutton within w_sum_cierre
end type
type gb_3 from groupbox within w_sum_cierre
end type
end forward

global type w_sum_cierre from window
integer width = 2930
integer height = 1440
boolean titlebar = true
string title = "Periodos - Suministros"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_vigencia.ico"
boolean center = true
pb_4 pb_4
pb_3 pb_3
dw_alm dw_alm
pb_sumcierre pb_sumcierre
pb_1 pb_1
pb_8 pb_8
pb_9 pb_9
dw_1 dw_1
pb_7 pb_7
gb_3 gb_3
end type
global w_sum_cierre w_sum_cierre

type variables
String codalm
datawindowchild dwc_alm

//carmoreno pruebas
end variables

on w_sum_cierre.create
this.pb_4=create pb_4
this.pb_3=create pb_3
this.dw_alm=create dw_alm
this.pb_sumcierre=create pb_sumcierre
this.pb_1=create pb_1
this.pb_8=create pb_8
this.pb_9=create pb_9
this.dw_1=create dw_1
this.pb_7=create pb_7
this.gb_3=create gb_3
this.Control[]={this.pb_4,&
this.pb_3,&
this.dw_alm,&
this.pb_sumcierre,&
this.pb_1,&
this.pb_8,&
this.pb_9,&
this.dw_1,&
this.pb_7,&
this.gb_3}
end on

on w_sum_cierre.destroy
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.dw_alm)
destroy(this.pb_sumcierre)
destroy(this.pb_1)
destroy(this.pb_8)
destroy(this.pb_9)
destroy(this.dw_1)
destroy(this.pb_7)
destroy(this.gb_3)
end on

event open;dw_alm.InsertRow(1)
end event

event closequery;int ret
if dw_1.ModifiedCount() > 0 then
	ret = MessageBox('Aviso','Ha realizado cambios, Desea grabarlos?',Question!,yesnocancel!)
	if ret = 1 then
		Return pb_7.Event Clicked()
	elseif ret = 2 then
		Return 0
	else
		Return -1
	end if
end if

end event

type pb_4 from picturebutton within w_sum_cierre
event mousemove pbm_mousemove
integer x = 1499
integer y = 1172
integer width = 146
integer height = 128
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Eliminar Periodo"
end type

event clicked;if dw_1.RowCount() = 0 then Return

if dw_1.GetItemString(dw_1.getrow(),'estado') = '0' then
	dw_1.DeleteRow(dw_1.GetRow())
else
	messageBox('Aviso','Solo se pueden borrar perodos nuevos')
end if

end event

type pb_3 from picturebutton within w_sum_cierre
event mousemove pbm_mousemove
integer x = 1349
integer y = 1172
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Agregar Periodo"
end type

event clicked;integer fila
fila = dw_1.InsertRow(0)
dw_1.ScrolltoRow(fila)
dw_1.SetItem(fila,'codalmacen',dw_alm.GetItemString(1,'codalmacen'))
dw_1.SetItem(fila,'ano',year(today()))
dw_1.SetItem(fila,'mes',month(today()))
dw_1.SetItem(fila,'usuario',usuario)

end event

type dw_alm from datawindow within w_sum_cierre
event retornar ( )
integer x = 64
integer y = 80
integer width = 1751
integer height = 76
integer taborder = 10
string title = "none"
string dataobject = "dw_ext_almacen"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retornar();this.SetItem(1,'codalmacen',codalm)

end event

event itemchanged;if dw_1.ModifiedCount() > 0 then
	if messageBox('Aviso','Ha hecho modificaciones que no han sido guardadas. Desea continuar?',QUESTION!,YESNO!) = 2 then
		codalm = this.GetItemString(1,'codalmacen')
		this.PostEvent("retornar")
		Return -1
	end if
end if
acceptText()
dw_1.Retrieve(dw_alm.GetItemString(1,'codalmacen'))

end event

event constructor;SetTransObject(SQLCA)
dw_alm.GetChild('codalmacen', dwc_alm)
dwc_alm.SetTransObject(SQLCA)
dw_alm.InsertRow(1)
dwc_alm.setfilter("principal='1'")
dwc_alm.filter()

end event

type pb_sumcierre from picturebutton within w_sum_cierre
event mousemove pbm_mousemove
integer x = 1193
integer y = 1172
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cerrar.gif"
string disabledname = "d_anulardoc.gif"
alignment htextalign = left!
string powertiptext = "Cerrar Periodo"
end type

event clicked;if f_permiso_boton(this,'PSUM')=0 then return -1
if dw_1.RowCount() < 1 then Return
if dw_1.GetItemString(dw_1.GetRow(),'estado') = '1' or dw_1.GetItemString(dw_1.GetRow(),'estado') = '0' then
	dw_1.SetItem(dw_1.GetRow(),'estado','2')
	dw_1.SetItem(dw_1.GetRow(),'fecha_cierre',today())
end if


end event

type pb_1 from picturebutton within w_sum_cierre
event mousemove pbm_mousemove
integer x = 1650
integer y = 1172
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_anulardoc.gif"
alignment htextalign = left!
string powertiptext = "Abrir Periodo"
end type

event clicked;if dw_1.RowCount() = 0 then Return
int fila
datetime hoy
if isNull(dw_1.GetItemString(dw_1.GetRow(),'estado')) or dw_1.GetItemString(dw_1.GetRow(),'estado') = '0' then
	fila = dw_1.Find("estado='1'",1,dw_1.RowCount())
	if fila > 0 then
		dw_1.SetItem(fila,'estado','2')
		dw_1.SetItem(fila,'fecha_cierre',today())
	end if
	dw_1.SetItem(dw_1.GetRow(),'estado','1')
else
	if dw_1.GetItemString(dw_1.GetRow(),'estado') = '2' then
		if messagebox("Atención","Está seguro que desea abrir este mes?",question!,yesno!,2)=2 then return
		fila = dw_1.getrow()
		setnull(hoy)			
		dw_1.SetItem(fila,'estado','1')
		dw_1.SetItem(fila,'fecha_cierre',hoy)
	else
		MessageBox('Error','No se puede abrir un periodo cerrado')
	end if
end if

end event

type pb_8 from picturebutton within w_sum_cierre
event mousemove pbm_mousemove
integer x = 1033
integer y = 1172
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "anulardoc.gif"
string disabledname = "d_anulardoc.gif"
alignment htextalign = left!
string powertiptext = "Anular Periodo"
end type

event clicked;if dw_1.RowCount() = 0 then Return
dw_1.SetItem(dw_1.GetRow(),'estado','3')

end event

type pb_9 from picturebutton within w_sum_cierre
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 878
integer y = 1172
integer width = 146
integer height = 128
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type dw_1 from datawindow within w_sum_cierre
integer x = 37
integer y = 208
integer width = 2834
integer height = 932
integer taborder = 20
string title = "none"
string dataobject = "dw_sum_cierre"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

type pb_7 from picturebutton within w_sum_cierre
event mousemove pbm_mousemove
string tag = "Grabar &Temporal"
integer x = 1810
integer y = 1172
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                     &t"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Grabar &Temporal"
end type

event clicked;if dw_1.Update() = -1 then 
	Rollback;
	Return -1
end if
commit;
dw_1.Retrieve(dw_alm.GetItemString(1,'codalmacen'))
Return 0


end event

type gb_3 from groupbox within w_sum_cierre
integer x = 32
integer y = 24
integer width = 1838
integer height = 164
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Almacen"
end type

