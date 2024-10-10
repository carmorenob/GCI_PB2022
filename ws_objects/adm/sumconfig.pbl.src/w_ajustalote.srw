$PBExportHeader$w_ajustalote.srw
forward
global type w_ajustalote from window
end type
type dw_lug from datawindow within w_ajustalote
end type
type st_3 from statictext within w_ajustalote
end type
type pb_1 from picturebutton within w_ajustalote
end type
type pb_nuevo from picturebutton within w_ajustalote
end type
type pb_2 from picturebutton within w_ajustalote
end type
type pb_cancelar from picturebutton within w_ajustalote
end type
type pb_grabar from picturebutton within w_ajustalote
end type
type dw_alm from datawindow within w_ajustalote
end type
type st_2 from statictext within w_ajustalote
end type
type st_1 from statictext within w_ajustalote
end type
type dw_l from datawindow within w_ajustalote
end type
type dw_k from datawindow within w_ajustalote
end type
end forward

global type w_ajustalote from window
integer width = 4480
integer height = 1344
boolean titlebar = true
string title = "Ajuste Lotes"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_ajustes.ico"
boolean center = true
dw_lug dw_lug
st_3 st_3
pb_1 pb_1
pb_nuevo pb_nuevo
pb_2 pb_2
pb_cancelar pb_cancelar
pb_grabar pb_grabar
dw_alm dw_alm
st_2 st_2
st_1 st_1
dw_l dw_l
dw_k dw_k
end type
global w_ajustalote w_ajustalote

type variables
datawindowchild dwc_a,dwc_alm,idw_lugar
string ordenar[4]

end variables

on w_ajustalote.create
this.dw_lug=create dw_lug
this.st_3=create st_3
this.pb_1=create pb_1
this.pb_nuevo=create pb_nuevo
this.pb_2=create pb_2
this.pb_cancelar=create pb_cancelar
this.pb_grabar=create pb_grabar
this.dw_alm=create dw_alm
this.st_2=create st_2
this.st_1=create st_1
this.dw_l=create dw_l
this.dw_k=create dw_k
this.Control[]={this.dw_lug,&
this.st_3,&
this.pb_1,&
this.pb_nuevo,&
this.pb_2,&
this.pb_cancelar,&
this.pb_grabar,&
this.dw_alm,&
this.st_2,&
this.st_1,&
this.dw_l,&
this.dw_k}
end on

on w_ajustalote.destroy
destroy(this.dw_lug)
destroy(this.st_3)
destroy(this.pb_1)
destroy(this.pb_nuevo)
destroy(this.pb_2)
destroy(this.pb_cancelar)
destroy(this.pb_grabar)
destroy(this.dw_alm)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_l)
destroy(this.dw_k)
end on

event open;dw_k.SetFilter("vence='1'")
dw_k.Filter()
dw_l.Modify("cantidad.Edit.DisplayOnly=no")

end event

type dw_lug from datawindow within w_ajustalote
integer x = 27
integer y = 20
integer width = 1285
integer height = 140
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_lugar"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild('codlugar',idw_lugar)
idw_lugar.settransobject(sqlca)
idw_lugar.retrieve()
insertrow(1)
if idw_lugar.rowcount()=1 then 
	setitem(1,1,idw_lugar.getitemstring(1,1))
	post event itemchanged(1,object.codlugar,idw_lugar.getitemstring(1,1))
end if

dw_alm.SetTransObject(SQLCA)
dw_alm.GetChild('codalmacen', dwc_alm)
dwc_alm.SetTransObject(SQLCA)

end event

event itemchanged;string ls_clugar
ls_clugar=data
if dwc_alm.Retrieve(usuario,'%',ls_clugar) = 0 then
	dw_alm.setitem(row,'codalmacen','')
	messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
	dwc_alm.InsertRow(0)
end if
dw_alm.InsertRow(0)
end event

type st_3 from statictext within w_ajustalote
integer x = 1445
integer y = 24
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Almacen"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_ajustalote
event mousemove pbm_mousemove
string tag = "Grabar"
integer x = 3479
integer y = 1084
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "import.gif"
string disabledname = "d_import.gif"
alignment htextalign = left!
string powertiptext = "Valores originales"
end type

event clicked;if dw_k.RowCount() = 0 then Return
dw_l.Retrieve(dw_k.GetItemString(dw_k.Getrow(),'codalmacen'),dw_k.GetItemString(dw_k.Getrow(),'codarticulo'))

end event

type pb_nuevo from picturebutton within w_ajustalote
event mousemove pbm_mousemove
integer x = 2171
integer y = 1080
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Nuevo Lote"
end type

event clicked;if dw_k.RowCount() = 0 then Return
if dw_k.GetItemNumber(dw_k.GetRow(),'saldoactual') = 0 then Return
long fila

fila = dw_l.InsertRow(0)
dw_l.SetItem(fila,'codalmacen',dw_k.GetItemString(dw_k.Getrow(),'codalmacen'))
dw_l.SetItem(fila,'codarticulo',dw_k.GetItemString(dw_k.Getrow(),'codarticulo'))
dw_l.SetItem(fila,'fecha_venc',today())

end event

type pb_2 from picturebutton within w_ajustalote
event mousemove pbm_mousemove
integer x = 2327
integer y = 1080
integer width = 146
integer height = 128
integer taborder = 40
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
string powertiptext = "Borrar Lote"
end type

event clicked;if dw_k.RowCount() = 0 then Return

dw_l.DeleteRow(0)

end event

type pb_cancelar from picturebutton within w_ajustalote
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 2638
integer y = 1084
integer width = 146
integer height = 128
integer taborder = 40
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

type pb_grabar from picturebutton within w_ajustalote
event mousemove pbm_mousemove
string tag = "Grabar"
integer x = 2478
integer y = 1080
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Grabar"
end type

event clicked;if long(dw_l.Describe("Evaluate('sum(cantidad)',0)")) <> dw_k.GetItemNumber(dw_k.GetRow(),'saldoactual') then
	messageBox('Atención','La cantidad del saldo no coincide con la de lotes')
	Return -1
end if

if dw_l.Update() = -1 then
	rollback;
	Return -1
end if
commit;
Return 0

end event

type dw_alm from datawindow within w_ajustalote
integer x = 1435
integer y = 84
integer width = 1157
integer height = 68
integer taborder = 10
string title = "none"
string dataobject = "dw_alm_ext"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event itemchanged;AcceptText()
dw_k.Reset()
dw_k.Retrieve(GetItemString(1,'codalmacen'))

end event

type st_2 from statictext within w_ajustalote
integer x = 2501
integer y = 200
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lotes"
boolean focusrectangle = false
end type

type st_1 from statictext within w_ajustalote
integer x = 32
integer y = 192
integer width = 288
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Kardex"
boolean focusrectangle = false
end type

type dw_l from datawindow within w_ajustalote
integer x = 2432
integer y = 272
integer width = 1952
integer height = 768
integer taborder = 20
string title = "none"
string dataobject = "dw_lote_config"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rowfocuschanged;if RowCount() = 0 or currentrow = 0 then Return

if GetItemNumber(GetRow(),'nuevo') = 0 then
	Modify("fecha_venc.Edit.DisplayOnly=yes lote.Edit.DisplayOnly=yes")
else
	Modify("fecha_venc.Edit.DisplayOnly=no lote.Edit.DisplayOnly=no")
end if

end event

type dw_k from datawindow within w_ajustalote
integer x = 27
integer y = 272
integer width = 2304
integer height = 764
integer taborder = 10
string title = "none"
string dataobject = "dw_kardexpre"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rowfocuschanged;dw_l.Reset()
if RowCount() = 0 or currentrow = 0 then Return

dw_l.Retrieve(GetItemString(Getrow(),'codalmacen'),GetItemString(Getrow(),'codarticulo'))

end event

event rowfocuschanging;if dw_l.ModifiedCount() > 0 or dw_l.DeletedCount() > 0 then
	int ret
	ret = MessageBox('Atención','Se han realizado modificaciones. Desea guardarlas?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		Return pb_grabar.Event clicked()
	elseif ret = 3 then
		Return 1
	end if
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

event clicked;if dwo.type="text" then

choose case dwo.name
	case "codarticulo_t"
		if ordenar[1]="codarticulo A" then
			ordenar[1]="codarticulo D"
		else
			ordenar[1]="codarticulo A"
		end if
		this.setsort(ordenar[1])
	case "descripcion_t"
		if ordenar[2]="descripcion A" then
			ordenar[2]="descripcion D"
		else
			ordenar[2]="descripcion A"
		end if
		this.setsort(ordenar[2])
	case "saldoactual_t"
		if ordenar[3]="saldoactual A" then
			ordenar[3]="saldoactual D"
		else
			ordenar[3]="saldoactual A"
		end if
		this.setsort(ordenar[3])
	case "costoprom_t"
		if ordenar[4]="costoprom A" then
			ordenar[4]="costoprom D"
		else
			ordenar[4]="costoprom A"
		end if
		this.setsort(ordenar[4])
end choose
this.sort()
TriggerEvent(RowFocuschanged!)
end if

end event

