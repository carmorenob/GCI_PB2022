$PBExportHeader$w_almacen.srw
forward
global type w_almacen from w_center
end type
type dw_almacen from datawindow within w_almacen
end type
type pb_insert from picturebutton within w_almacen
end type
type pb_anular from picturebutton within w_almacen
end type
type pb_cancelar from picturebutton within w_almacen
end type
type gb_1 from groupbox within w_almacen
end type
type filtro from dropdownlistbox within w_almacen
end type
type sle_1 from singlelineedit within w_almacen
end type
type gb_4 from groupbox within w_almacen
end type
end forward

global type w_almacen from w_center
integer width = 6665
integer height = 1832
string title = "Almacenes"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_bodega.ico"
boolean center = false
dw_almacen dw_almacen
pb_insert pb_insert
pb_anular pb_anular
pb_cancelar pb_cancelar
gb_1 gb_1
filtro filtro
sle_1 sle_1
gb_4 gb_4
end type
global w_almacen w_almacen

type variables
datawindowchild dwc_ccosto, dwc_lug, dwc_doc

end variables

on w_almacen.create
int iCurrent
call super::create
this.dw_almacen=create dw_almacen
this.pb_insert=create pb_insert
this.pb_anular=create pb_anular
this.pb_cancelar=create pb_cancelar
this.gb_1=create gb_1
this.filtro=create filtro
this.sle_1=create sle_1
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_almacen
this.Control[iCurrent+2]=this.pb_insert
this.Control[iCurrent+3]=this.pb_anular
this.Control[iCurrent+4]=this.pb_cancelar
this.Control[iCurrent+5]=this.gb_1
this.Control[iCurrent+6]=this.filtro
this.Control[iCurrent+7]=this.sle_1
this.Control[iCurrent+8]=this.gb_4
end on

on w_almacen.destroy
call super::destroy
destroy(this.dw_almacen)
destroy(this.pb_insert)
destroy(this.pb_anular)
destroy(this.pb_cancelar)
destroy(this.gb_1)
destroy(this.filtro)
destroy(this.sle_1)
destroy(this.gb_4)
end on

event open;call super::open;dw_almacen.SetTransObject(SQLCA)
dw_almacen.GetChild('ccosto', dwc_ccosto)
dwc_ccosto.SetTransObject(SQLCA)
dwc_ccosto.InsertRow(0)

dw_almacen.GetChild('clugar_ent', dwc_lug)
dwc_lug.SetTransObject(SQLCA)
dwc_lug.InsertRow(0)
dw_almacen.Retrieve()

end event

event close;call super::close;rollback;

end event

event resize;call super::resize;gb_1.resize(newwidth -50, newheight - 400)
dw_almacen.resize(newwidth -100, newheight - 480)

pb_cancelar.y=newheight -140
pb_anular.y=newheight -140
pb_insert.y=newheight -140
pb_grabar.y=newheight -140

end event

type pb_grabar from w_center`pb_grabar within w_almacen
integer x = 2304
integer y = 1580
string powertiptext = "&Guardar"
end type

event pb_grabar::clicked;call super::clicked;if dw_almacen.AcceptText() = -1 then
	Return
end if

if dw_almacen.Update() = -1 then
	Rollback;
else
	commit;
end if

end event

type dw_almacen from datawindow within w_almacen
integer x = 69
integer y = 248
integer width = 6482
integer height = 1192
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cfgalmacen"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string valor
setNull(valor)
AcceptText()
if string(dwo.Name) = 'codufun' then
	if dwc_ccosto.Retrieve(data) = 0 then
		dwc_ccosto.InsertRow(0)
	end if
	this.SetItem(row,'ccosto',valor)
	this.SetItem(row,'codcencosto',valor)
end if
if string(dwo.Name) = 'ccosto' then
	this.SetItem(row,'codcencosto',dwc_ccosto.GetItemString(dwc_ccosto.GetRow(),'codcc'))
elseif string(dwo.Name) = 'principal' then
	if GetItemString(getRow(),'principal') = '1' then
		this.SetItem(row,'restringepac',valor)
	end if
end if

end event

event rowfocuschanged;if this.RowCount() < 1 then Return

if not isNull(dw_almacen.GetItemString(currentRow,'codufun')) then
	if dwc_ccosto.Retrieve(dw_almacen.GetItemString(currentRow,'codufun')) = 0 then
		dwc_ccosto.InsertRow(0)
	end if
end if
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)
end event

type pb_insert from picturebutton within w_almacen
event mousemove pbm_mousemove
string tag = "Insertar"
integer x = 2158
integer y = 1580
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar"
end type

event clicked;call super::clicked;long fila
fila = dw_almacen.InsertRow(0)
dw_almacen.SetItem(fila,'usuario',usuario)
dw_almacen.scrollToRow(fila)

end event

type pb_anular from picturebutton within w_almacen
event mousemove pbm_mousemove
string tag = "Borrar"
integer x = 2011
integer y = 1580
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar"
end type

event clicked;dw_almacen.DeleteRow(dw_almacen.GetRow())

end event

type pb_cancelar from picturebutton within w_almacen
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 1865
integer y = 1580
integer width = 146
integer height = 128
integer taborder = 10
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

type gb_1 from groupbox within w_almacen
integer x = 41
integer y = 180
integer width = 6560
integer height = 1288
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type filtro from dropdownlistbox within w_almacen
integer x = 78
integer y = 72
integer width = 512
integer height = 280
integer taborder = 160
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string item[] = {"NOMBRE","CODIGO"}
borderstyle borderstyle = stylelowered!
end type

event constructor;this.text="NOMBRE"
end event

type sle_1 from singlelineedit within w_almacen
event keypressed pbm_keyup
integer x = 663
integer y = 68
integer width = 677
integer height = 80
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
end type

event keypressed;string texto
texto = upper(text)
if right(texto,1) <> '%' then
	texto = texto + '%'
end if
choose case filtro.text
	case "CODIGO"
		dw_almacen.SetFilter("upper(codalmacen) like '" +upper( texto )+ "'")
	case 'NOMBRE'
		dw_almacen.SetFilter("upper(descripcion) like '" +upper( texto )+ "'")

end choose
dw_almacen.Filter()

end event

type gb_4 from groupbox within w_almacen
integer x = 37
integer y = 12
integer width = 2807
integer height = 168
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtro Por"
end type

