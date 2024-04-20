$PBExportHeader$w_af_mantto.srw
forward
global type w_af_mantto from w_center
end type
type dw_respon from datawindow within w_af_mantto
end type
type sle_1 from singlelineedit within w_af_mantto
end type
type pb_nuevo from picturebutton within w_af_mantto
end type
type dw_placa from datawindow within w_af_mantto
end type
type pb_cerrar from picturebutton within w_af_mantto
end type
type st_1 from statictext within w_af_mantto
end type
type pb_borrar from picturebutton within w_af_mantto
end type
type pb_buscar from picturebutton within w_af_mantto
end type
type pb_1 from picturebutton within w_af_mantto
end type
type st_3 from statictext within w_af_mantto
end type
type dw_cab from datawindow within w_af_mantto
end type
type st_2 from statictext within w_af_mantto
end type
type pb_print from pb_report within w_af_mantto
end type
type t1 from tab within w_af_mantto
end type
type p1 from userobject within t1
end type
type sle_2 from singlelineedit within p1
end type
type pb_5 from picturebutton within p1
end type
type pb_4 from picturebutton within p1
end type
type dw_comp from datawindow within p1
end type
type p1 from userobject within t1
sle_2 sle_2
pb_5 pb_5
pb_4 pb_4
dw_comp dw_comp
end type
type p2 from userobject within t1
end type
type pb_3 from picturebutton within p2
end type
type pb_2 from picturebutton within p2
end type
type dw_det from datawindow within p2
end type
type p2 from userobject within t1
pb_3 pb_3
pb_2 pb_2
dw_det dw_det
end type
type p_nsale from userobject within t1
end type
type rte_sale from richtextedit within p_nsale
end type
type p_nsale from userobject within t1
rte_sale rte_sale
end type
type p_nentra from userobject within t1
end type
type rte_entra from richtextedit within p_nentra
end type
type p_nentra from userobject within t1
rte_entra rte_entra
end type
type t1 from tab within w_af_mantto
p1 p1
p2 p2
p_nsale p_nsale
p_nentra p_nentra
end type
type t2 from tab within w_af_mantto
end type
type p_sale from userobject within t2
end type
type p_sale from userobject within t2
end type
type p_mantto from userobject within t2
end type
type p_mantto from userobject within t2
end type
type p_mantto2 from userobject within t2
end type
type p_mantto2 from userobject within t2
end type
type p_entra from userobject within t2
end type
type p_entra from userobject within t2
end type
type t2 from tab within w_af_mantto
p_sale p_sale
p_mantto p_mantto
p_mantto2 p_mantto2
p_entra p_entra
end type
type gb_1 from groupbox within w_af_mantto
end type
end forward

global type w_af_mantto from w_center
string tag = "Ha realizado cambios. Desea guardarlos?"
integer width = 4503
integer height = 2048
string title = "Activos Fijos- Mantenimientos / Valorizaciones"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_mmto.ico"
boolean center = false
dw_respon dw_respon
sle_1 sle_1
pb_nuevo pb_nuevo
dw_placa dw_placa
pb_cerrar pb_cerrar
st_1 st_1
pb_borrar pb_borrar
pb_buscar pb_buscar
pb_1 pb_1
st_3 st_3
dw_cab dw_cab
st_2 st_2
pb_print pb_print
t1 t1
t2 t2
gb_1 gb_1
end type
global w_af_mantto w_af_mantto

type variables
DataWindowChild dwc_ccosto
string codDocumento
long nuevo

end variables

forward prototypes
public function integer grabar ()
end prototypes

public function integer grabar ();Return pb_grabar.Event clicked()

end function

on w_af_mantto.create
int iCurrent
call super::create
this.dw_respon=create dw_respon
this.sle_1=create sle_1
this.pb_nuevo=create pb_nuevo
this.dw_placa=create dw_placa
this.pb_cerrar=create pb_cerrar
this.st_1=create st_1
this.pb_borrar=create pb_borrar
this.pb_buscar=create pb_buscar
this.pb_1=create pb_1
this.st_3=create st_3
this.dw_cab=create dw_cab
this.st_2=create st_2
this.pb_print=create pb_print
this.t1=create t1
this.t2=create t2
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_respon
this.Control[iCurrent+2]=this.sle_1
this.Control[iCurrent+3]=this.pb_nuevo
this.Control[iCurrent+4]=this.dw_placa
this.Control[iCurrent+5]=this.pb_cerrar
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.pb_borrar
this.Control[iCurrent+8]=this.pb_buscar
this.Control[iCurrent+9]=this.pb_1
this.Control[iCurrent+10]=this.st_3
this.Control[iCurrent+11]=this.dw_cab
this.Control[iCurrent+12]=this.st_2
this.Control[iCurrent+13]=this.pb_print
this.Control[iCurrent+14]=this.t1
this.Control[iCurrent+15]=this.t2
this.Control[iCurrent+16]=this.gb_1
end on

on w_af_mantto.destroy
call super::destroy
destroy(this.dw_respon)
destroy(this.sle_1)
destroy(this.pb_nuevo)
destroy(this.dw_placa)
destroy(this.pb_cerrar)
destroy(this.st_1)
destroy(this.pb_borrar)
destroy(this.pb_buscar)
destroy(this.pb_1)
destroy(this.st_3)
destroy(this.dw_cab)
destroy(this.st_2)
destroy(this.pb_print)
destroy(this.t1)
destroy(this.t2)
destroy(this.gb_1)
end on

event open;dw_placa.SetTransObject(SQLCA)
dw_respon.SetTransObject(SQLCA)

dw_respon.GetChild('ccosto', dwc_ccosto)
dwc_ccosto.SetTransObject(SQLCA)
dwc_ccosto.InsertRow(0)
nuevo = 0

end event

event closequery;call super::closequery;if nuevo > 0 then
	if messageBox('Aviso','El documento nuevo no ha sido guardado. Desea continuar?',QUESTION!,YESNO!) = 2 then
		Return -1
	end if
end if

end event

event resize;call super::resize;//
end event

type pb_grabar from w_center`pb_grabar within w_af_mantto
integer x = 2135
integer y = 1720
integer taborder = 100
boolean originalsize = false
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
string powertiptext = "&Guardar"
end type

event pb_grabar::clicked;long nm
if dw_cab.RowCount() = 0 then Return 0
if dw_cab.GetItemString(1,'estado') ='1' then
	messageBox('Atención','El documento esta cerrado. No puede modificarse')
	Return 0	
end if

if dw_cab.GetItemString(1,'estado') ='0' then
	if (dw_cab.GetItemString(1,'tipo') = '1' or dw_cab.GetItemString(1,'tipo') = '2') and isNull(dw_cab.GetItemNumber(1,'valor')) then
		messageBox('Error','Debe asignar un Valor a la valorización/desvalorización')
		Return -1
	end if
	if isNull(dw_cab.GetItemString(1,'tipo')) then
		messageBox('Error','Debe seleccionar el tipo de transacción ')
		Return -1
	end if
	if isNull(dw_cab.GetItemDateTime(1,'fecha_inicia')) then
		messageBox('Error','Debe asignar una fecha de inicio ')
		Return -1
	end if
	if dw_cab.GetItemString(1,'tipo') = '0' and isNull(dw_cab.GetItemString(1,'documento')) then
		messageBox('Error','Debe asignar un tercero a cargo del mantenimiento')
		Return -1
	end if
	if dw_cab.GetItemString(1,'tipo') = '0' and isNull(dw_cab.GetItemDateTime(1,'fecha_envio')) then
		messageBox('Error','Debe asignar una fecha de salida hacia Mantenimiento a cargo del tercero')
		Return -1
	end if
	if dw_cab.GetItemString(1,'tipo') = '0' or dw_cab.GetItemString(1,'tipo') = '3' then
		dw_cab.SetItem(1,'estado','3')
	else
		dw_cab.SetItem(1,'estado','1')
	end if
elseif dw_cab.GetItemString(1,'estado') ='3' then
	if dw_cab.GetItemString(1,'tipo') = '0' and isNull(dw_cab.GetItemDateTime(1,'fecha_termina')) then
		messageBox('Error','Debe asignar una fecha de Reintegro a Servicio')
		Return -1
	end if
	if dw_cab.GetItemString(1,'tipo') = '0' and isNull(dw_cab.GetItemDateTime(1,'fecha_retorno')) then
		messageBox('Error','Debe asignar una fecha de Retorno de Mantenimiento')
		Return -1
	end if
	if dw_cab.GetItemString(1,'tipo') = '0' and isNull(dw_cab.GetItemNumber(1,'valor')) then
		messageBox('Error','Debe asignar un Valor al mantenimiento')
		Return -1
	end if
	dw_cab.SetItem(1,'estado','1')
end if

if dw_cab.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
if t1.p2.dw_det.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
if t1.p1.dw_comp.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

commit;

blob nota
string l_placa, l_texto
long l_manten
l_placa = dw_cab.GetItemString(1,'placa')
l_manten = dw_cab.GetItemNumber(1,'num_manten')
SQLCA.Autocommit = TRUE
l_texto = t1.p_nsale.rte_sale.copyrtf(false,detail!)
nota = blob(l_texto)
updateblob af_mantenimiento set nota_salida=:nota
where placa=:l_placa and num_manten=:l_manten;
l_texto = t1.p_nentra.rte_entra.copyrtf(false,detail!)
nota = blob(l_texto)
updateblob af_mantenimiento set nota_entrada=:nota
where placa=:l_placa and num_manten=:l_manten;
l_texto = f_rtf(string(nota),TRUE)
if dw_cab.getItemString(1,'estado') = '1' then
	t1.p_nsale.rte_sale.DisplayOnly = TRUE
	t1.p_nentra.rte_entra.DisplayOnly = TRUE
elseif dw_cab.getItemString(1,'estado') = '3' then
	t1.p_nsale.rte_sale.DisplayOnly = TRUE
	t1.p_nentra.rte_entra.DisplayOnly = FALSE
end if
SQLCA.Autocommit = FALSE


dw_cab.ResetUpdate()
t1.p2.dw_det.ResetUpdate()
t1.p1.dw_comp.ResetUpdate()
nm = dw_cab.GetItemNumber(1,'num_manten')
dw_respon.Retrieve(dw_cab.GetItemString(1,'placa'))
nm = dw_respon.Find("num_manten="+string(nm),1,dw_respon.RowCount())
if nm > 0 then dw_respon.ScrolltoRow(nm)
nuevo = 0
Return 0

end event

type dw_respon from datawindow within w_af_mantto
event borrar_fila ( integer fila )
integer x = 23
integer y = 180
integer width = 2309
integer height = 524
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_af_mantto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event borrar_fila(integer fila);fila = Message.LongParm
if fila > 0 then DeleteRow(fila)
Nuevo = 0
PostEvent(rowfocuschanged!)

end event

event rowfocuschanged;dw_cab.Reset()
f_pega_a_rtf(t1.p_nsale.rte_sale,'',3)
f_pega_a_rtf(t1.p_nentra.rte_entra,'',3)
if rowCount() = 0 or currentrow = 0 then Return 0
dw_cab.Retrieve(GetItemString(Getrow(),'placa'),GetItemNumber(Getrow(),'num_manten'))
t1.p2.dw_det.Retrieve(GetItemString(Getrow(),'placa'),GetItemNumber(Getrow(),'num_manten'))
//string coddoc, lugar
//long numdoc, item, subitem
//mle_1.Text = ''
//if this.RowCount() = 0 then Return
//if GetItemString(GetRow(),'estado') = '0' then
//	mle_1.DisplayOnly = FALSE
//else
//	mle_1.DisplayOnly = TRUE
//end if
//mle_1.Text = GetItemString(GetRow(),'observacion')
//
end event

event clicked;if row > 0 then
	this.scrolltoRow(Row)
end if

end event

event rowfocuschanging;if dw_cab.GetItemStatus(currentrow,0,primary!) = NewModified! then 
	if messageBox('Aviso','El documento nuevo no ha sido guardado, perderá los cambios. Desea continuar?',QUESTION!,YESNO!) = 2 then
		return -1
	else
		PostEvent("Borrar_fila",currentrow,currentrow)
	end if
end if

end event

event losefocus;AcceptText()

end event

type sle_1 from singlelineedit within w_af_mantto
integer x = 238
integer y = 40
integer width = 306
integer height = 60
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;call super::modified;string placa

long numdoc, item, asignado, fila
string coddoc,lugar, codalmacen, msg, cl, uf, cc

if this.Text = '' then Return
dw_placa.Retrieve(this.Text)

if dw_placa.RowCount() = 0 then
	messageBox('Aviso','Activo fijo con placa ' + this.Text + ' no existe')
	Return
end if
dw_respon.Reset()
dw_respon.Retrieve(this.Text)
t1.p1.dw_comp.Retrieve(this.Text)
st_1.Text = dw_placa.GetItemString(1,'descripcion')
if dw_placa.GetItemString(1,'estado') = '2' then
	MessageBox('Atención','El artículo ya ha sido dado de baja.')
end if

end event

type pb_nuevo from picturebutton within w_af_mantto
event mousemove pbm_mousemove
string tag = "Nuevo Responsable"
integer x = 1842
integer y = 1720
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Nuevo Mantenimiento"
end type

event clicked;call super::clicked;long fila
string valor

if nuevo > 0 then
	messageBox('Aviso','Existe un documento en ELABORACION')
	dw_respon.SetRow(nuevo)
	Return -1
end if

if dw_placa.RowCount() = 0 then
	MessageBox('Aviso','No ha suministrado una placa válida')
	Return -1
end if
if dw_placa.GetItemString(1,'estado') = '2' then
	MessageBox('Atención','El artículo ya ha sido dado de baja.')
	Return -1
end if
if dw_cab.GetNextModified(0,primary!) > 0 then 
	if messageBox('Aviso','El documento no ha sido guardado, perderá los cambios. Desea continuar?',QUESTION!,YESNO!) = 2 then return -1
	dw_cab.ResetUpdate()
end if

dw_respon.insertRow(1)
valor = dw_respon.describe("Evaluate('max(num_manten)', 1)")
dw_respon.SetRow(1)
dw_respon.SetItem(1,'placa',dw_placa.GetItemString(1,'placa'))
dw_respon.SetItem(1,'num_manten',long(valor) + 1)
dw_respon.SetItem(1,'fecha_inicia',datetime(today(),time('0')))
dw_respon.SetItem(1,'estado','0')
dw_cab.insertRow(1)
dw_cab.SetItem(1,'placa',dw_placa.GetItemString(1,'placa'))
dw_cab.SetItem(1,'num_manten',long(valor) + 1)
dw_cab.SetItem(1,'fecha_inicia',datetime(today(),time('0')))
dw_cab.SetItem(1,'estado','0')
dw_cab.SetItem(1,'idx',t2.SelectedTab)

t1.p_nsale.rte_sale.DisplayOnly = FALSE
t1.p_nentra.rte_entra.DisplayOnly = TRUE

nuevo = 1
Return 1

end event

type dw_placa from datawindow within w_af_mantto
boolean visible = false
integer x = 581
integer y = 1432
integer width = 539
integer height = 72
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_af_regplaca"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_cerrar from picturebutton within w_af_mantto
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 1559
integer y = 1720
integer width = 142
integer height = 124
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cerrar"
end type

event clicked;close(parent)

end event

type st_1 from statictext within w_af_mantto
integer x = 581
integer y = 40
integer width = 827
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_borrar from picturebutton within w_af_mantto
event mousemove pbm_mousemove
string tag = "Borrar"
integer x = 1989
integer y = 1720
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar registro nuevo"
end type

event clicked;long i
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '0' then
	dw_respon.DeleteRow(dw_respon.GetRow())
	PostEvent(rowfocuschanged!)
else
	MessageBox('Atención','Solamente registros nuevos')
end if

end event

type pb_buscar from picturebutton within w_af_mantto
event mousemove pbm_mousemove
string tag = "Buscar"
integer x = 1467
integer y = 12
integer width = 142
integer height = 124
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "buscar.gif"
string disabledname = "d_buscar.gif"
alignment htextalign = left!
string powertiptext = "Buscar"
end type

event clicked;st_placa st_p
st_p.sle_obj = sle_1
openwithParm(w_af_bplaca,st_p)
end event

type pb_1 from picturebutton within w_af_mantto
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 1705
integer y = 1720
integer width = 142
integer height = 124
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "anular_doc.gif"
string disabledname = "d_anular_doc.gif"
alignment htextalign = left!
string powertiptext = "Anular Registro"
end type

event clicked;if dw_respon.RowCount() = 0 then Return
if dw_respon.GetItemString(dw_respon.GetRow(),'estado') = '1' or dw_respon.GetItemString(dw_respon.GetRow(),'estado') = '2' then
	dw_respon.SetItem(dw_respon.GetRow(),'estado','3')
else
	MessageBox('Atención','Solo registros con estado Activo')
end if

end event

type st_3 from statictext within w_af_mantto
integer x = 27
integer y = 40
integer width = 160
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Placa"
boolean focusrectangle = false
end type

type dw_cab from datawindow within w_af_mantto
integer x = 2775
integer y = 72
integer width = 1637
integer height = 604
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_af_mantto_ff"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event itemchanged;datetime fecha
setNull(fecha)
string valor
setnull(valor)
if AcceptText() = -1 then Return 0
if GetColumnName() = 'tipo' then
	dw_respon.SetItem(dw_respon.GetRow(),'tipo',GetItemString(1,'tipo'))
	if GetItemString(1,'tipo') = '0' or GetItemString(1,'tipo') = '3' then
		t2.p_sale.Text = 'Salida Servicio'
	elseif GetItemString(1,'tipo') = '1' then
		t2.p_sale.Text = 'Valorización'
	elseif GetItemString(1,'tipo') = '2' then
		t2.p_sale.Text = 'Desvalorización'
	end if
elseif  GetColumnName() = 'fecha_inicia' then
	if (GetItemDateTime(1,'fecha_inicia') > GetItemDateTime(1,'fecha_envio')) or (GetItemDateTime(1,'fecha_inicia') > GetItemDateTime(1,'fecha_termina'))then
		MessageBox('Atención','La fecha de salida de servicio debe ser mayor a la de terminación y de reingreso a servicio')
		SetItem(1,'fecha_inicia',fecha)
		SetText(valor)
		Return 2
	end if
	dw_respon.SetItem(dw_respon.GetRow(),'fecha_termina',GetItemDatetime(1,'fecha_termina'))	
	dw_respon.SetItem(dw_respon.GetRow(),'fecha_inicia',GetItemDateTime(1,'fecha_inicia'))	
elseif  GetColumnName() = 'fecha_termina' then
	if GetItemDateTime(1,'fecha_inicia') > GetItemDateTime(1,'fecha_termina') then
		MessageBox('Atención','La fecha de reingreso a servicio debe ser mayor que la fecha de salida del servicio')
		SetItem(1,'fecha_termina',fecha)
		SetText(valor)
		Return 2
	end if
	dw_respon.SetItem(dw_respon.GetRow(),'fecha_termina',GetItemDatetime(1,'fecha_termina'))	
elseif  GetColumnName() = 'fecha_envio' then
	if GetItemDateTime(1,'fecha_inicia') > GetItemDateTime(1,'fecha_envio') then
		MessageBox('Atención','La fecha de envio a mantenimiento debe ser mayor a la fecha de salida de servicio')
		SetItem(1,'fecha_envio',fecha)
		SetText(valor)
		Return 2
	end if
elseif  GetColumnName() = 'fecha_retorno' then
	if GetItemDateTime(1,'fecha_inicia') > GetItemDateTime(1,'fecha_retorno') or (GetItemDateTime(1,'fecha_envio') > GetItemDateTime(1,'fecha_retorno')) then
		MessageBox('Atención','La fecha de entrada de mantenimiento debe ser mayor a la fecha de salida de servicio y envío de mantto')
		SetItem(1,'fecha_retorno',fecha)
		SetText(valor)
		Return 2
	end if
	dw_respon.SetItem(dw_respon.GetRow(),'fecha_termina',GetItemDatetime(1,'fecha_termina'))	
end if

string td, doc, n1,n2,a1,a2,rs
if getColumnName() = 'documento' or getColumnName() = 'tipodoc' then
	td = GetItemString(GetRow(),'tipodoc')
	doc = GetItemString(GetRow(),'documento')
	if isNull(doc) or isNull(td) then Return 0
	select nombre1,nombre2,apellido1,apellido2,razon_social into :n1,:n2,:a1,:a2,:rs
	from terceros where tipodoc=:td and documento=:doc;
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return 1
	elseif SQLCA.SQLCode = 100 THEN
		MessageBox('Atención','El tercero no existe.')
		Return 0
	END IF
	SetItem(GetRow(),'nombre1',n1)
	SetItem(GetRow(),'nombre2',n2)
	SetItem(GetRow(),'apellido1',a1)
	SetItem(GetRow(),'apellido2',a2)
	SetItem(GetRow(),'razon_social',rs)
end if

end event

event doubleclicked;if dwo.Name = 'tipodoc' or dwo.name='documento' and GetItemString(GetRow(),'estado') = '0' and  getitemString(getRow(),'tipo') ='0' then
	g_tercerodesde=11
	openwithparm(w_buscater,this)
	if not isNull(GetItemString(Getrow(),'documento')) and not isNull(GetItemString(Getrow(),'tipodoc'))then
		setColumn('documento')
		TriggerEvent(itemchanged!)
	end if
end if

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())

end event

event losefocus;TriggerEvent(itemchanged!)
end event

event retrieveend;if rowCount() = 0 then Return 0
blob nota
string l_placa, l_texto
long l_manten
l_placa = GetItemString(1,'placa')
l_manten = GetItemNumber(1,'num_manten')
SQLCA.Autocommit = TRUE
selectblob nota_salida into:nota from af_mantenimiento
where placa=:l_placa and num_manten=:l_manten;
l_texto = f_rtf(string(nota),TRUE)
f_pega_a_rtf(t1.p_nsale.rte_sale,l_texto,3)
selectblob nota_entrada into:nota from af_mantenimiento
where placa=:l_placa and num_manten=:l_manten;
l_texto = f_rtf(string(nota),TRUE)
f_pega_a_rtf(t1.p_nentra.rte_entra,l_texto,3)
if getItemString(1,'estado') = '1' then
	t1.p_nsale.rte_sale.DisplayOnly = TRUE
	t1.p_nentra.rte_entra.DisplayOnly = TRUE
elseif getItemString(1,'estado') = '3' then
	t1.p_nsale.rte_sale.DisplayOnly = TRUE
	t1.p_nentra.rte_entra.DisplayOnly = FALSE
end if
SQLCA.Autocommit = FALSE

if GetItemString(1,'tipo') = '0' or GetItemString(1,'tipo') = '3' then
	t2.p_sale.Text = 'Salida Servicio'
elseif GetItemString(1,'tipo') = '1' then
	t2.p_sale.Text = 'Valorización'
elseif GetItemString(1,'tipo') = '2' then
	t2.p_sale.Text = 'Desvalorización'
end if

end event

type st_2 from statictext within w_af_mantto
integer x = 23
integer y = 120
integer width = 343
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Histórico"
boolean focusrectangle = false
end type

type pb_print from pb_report within w_af_mantto
integer x = 2281
integer y = 1720
integer width = 142
integer height = 124
integer taborder = 41
boolean bringtotop = true
boolean originalsize = false
string powertiptext = "Imprimir"
string cod_rep = "MT"
string nombre_rep = "Mantenimiento / Valorizaciones"
string tipo_rep = "documento!"
end type

event clicked;call super::clicked;if dw_respon.RowCount() = 0 then Return 0
any param[2]
param[1] = dw_respon.GetItemString(dw_respon.GetRow(),'placa')
param[2] = dw_respon.GetItemNumber(dw_respon.GetRow(),'num_manten')
imprimir(param,'','0')

end event

type t1 from tab within w_af_mantto
event create ( )
event destroy ( )
integer x = 46
integer y = 740
integer width = 4402
integer height = 976
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
p1 p1
p2 p2
p_nsale p_nsale
p_nentra p_nentra
end type

on t1.create
this.p1=create p1
this.p2=create p2
this.p_nsale=create p_nsale
this.p_nentra=create p_nentra
this.Control[]={this.p1,&
this.p2,&
this.p_nsale,&
this.p_nentra}
end on

on t1.destroy
destroy(this.p1)
destroy(this.p2)
destroy(this.p_nsale)
destroy(this.p_nentra)
end on

type p1 from userobject within t1
integer x = 18
integer y = 112
integer width = 4366
integer height = 848
long backcolor = 67108864
string text = "Componentes"
long tabtextcolor = 33554432
string picturename = "componente.ico"
long picturemaskcolor = 536870912
sle_2 sle_2
pb_5 pb_5
pb_4 pb_4
dw_comp dw_comp
end type

on p1.create
this.sle_2=create sle_2
this.pb_5=create pb_5
this.pb_4=create pb_4
this.dw_comp=create dw_comp
this.Control[]={this.sle_2,&
this.pb_5,&
this.pb_4,&
this.dw_comp}
end on

on p1.destroy
destroy(this.sle_2)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.dw_comp)
end on

type sle_2 from singlelineedit within p1
boolean visible = false
integer x = 2569
integer y = 764
integer width = 343
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
string text = "none"
borderstyle borderstyle = stylelowered!
end type

event modified;string codarticulo, descripcion
long fila

codarticulo = Text
if tag = '1' then
	tag = '0'
	fila = dw_comp.GetRow()
elseif tag = '0' then
	fila = pb_4.Event clicked()
end if
select descripcion into :descripcion
from sumarticulo where codarticulo=:codarticulo;
IF SQLCA.SQLCode = -1 THEN 
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return -1
elseif SQLCA.SQLCode = 100 THEN 
	MessageBox("Error", 'El artículo no existe')
	Return -1
END IF
dw_comp.SetItem(fila,'carticulo',codarticulo)
dw_comp.SetItem(fila,'descripcion',descripcion)

end event

type pb_5 from picturebutton within p1
event mousemove pbm_mousemove
string tag = "Borrar"
integer x = 4187
integer y = 152
integer width = 142
integer height = 124
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar item"
end type

event clicked;if dw_cab.RowCount() = 0 then Return 0
long fila
if dw_cab.GetItemString(1,'tipo') = '0' and (dw_cab.GetItemString(1,'estado') = '0'  or dw_cab.GetItemString(1,'estado') = '3') then
	if dw_comp.GetItemNumber(dw_comp.GetRow(),'nuevo') = 0 then
		messagebox('Atención','Solo puede borrar registros nuevos')
	else
		fila = dw_comp.DeleteRow(0)
	end if
end if

end event

type pb_4 from picturebutton within p1
event mousemove pbm_mousemove
integer x = 4187
integer y = 28
integer width = 142
integer height = 124
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Agregar Item"
end type

event clicked;if dw_cab.RowCount() = 0 then Return 0
long fila
string valor
if dw_cab.GetItemString(1,'tipo') = '0' and (dw_cab.GetItemString(1,'estado') = '0'  or dw_cab.GetItemString(1,'estado') = '3') then
	valor = dw_comp.describe("Evaluate('max(num_compo)', 1)")
	fila = dw_comp.InsertRow(0)
	dw_comp.SetItem(fila,'placa',dw_cab.GetItemString(1,'placa'))
	dw_comp.SetItem(fila,'coddocu',dw_placa.GetItemString(dw_placa.GetRow(),'coddocu'))
	dw_comp.SetItem(fila,'cLugar',dw_placa.GetItemString(dw_placa.GetRow(),'cLugar'))
	dw_comp.SetItem(fila,'numdoc',dw_placa.GetItemNumber(dw_placa.GetRow(),'numdoc'))
	dw_comp.SetItem(fila,'item',dw_placa.GetItemNumber(dw_placa.GetRow(),'item'))
	dw_comp.SetItem(fila,'num_compo',long(valor) + 1)
	dw_comp.SetItem(fila,'placa',dw_placa.GetItemString(dw_placa.GetRow(),'placa')+"-"+string(long(valor) + 1))
	dw_comp.SetItem(fila,'estado','1')
	dw_comp.ScrolltoRow(fila)
	if not isValid(w_buscaArt) then
		sle_2.Tag = '1'
		openwithParm(w_buscaArt,sle_2)
	end if
end if

end event

type dw_comp from datawindow within p1
integer x = 46
integer y = 24
integer width = 4110
integer height = 792
integer taborder = 40
string title = "none"
string dataobject = "dw_af_regcom_placa"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)

end event

event clicked;if dw_cab.RowCount() = 0 then Return 0
long fila
if dw_cab.GetItemString(1,'tipo') = '0' and dw_cab.GetItemString(1,'estado') = '3' then
	fila = dw_comp.DeleteRow(0)
end if

end event

type p2 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4366
integer height = 848
long backcolor = 67108864
string text = "Valores Mantenimiento"
long tabtextcolor = 33554432
string picturename = "mmto.ico"
long picturemaskcolor = 536870912
pb_3 pb_3
pb_2 pb_2
dw_det dw_det
end type

on p2.create
this.pb_3=create pb_3
this.pb_2=create pb_2
this.dw_det=create dw_det
this.Control[]={this.pb_3,&
this.pb_2,&
this.dw_det}
end on

on p2.destroy
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.dw_det)
end on

type pb_3 from picturebutton within p2
event mousemove pbm_mousemove
string tag = "Borrar"
integer x = 1454
integer y = 536
integer width = 142
integer height = 124
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar item"
end type

event clicked;if dw_cab.RowCount() = 0 then Return 0
long fila
if dw_cab.GetItemString(1,'tipo') = '0' and (dw_cab.GetItemString(1,'estado') = '0' or dw_cab.GetItemString(1,'estado') = '3') then
	fila = dw_det.DeleteRow(0)
end if

end event

type pb_2 from picturebutton within p2
event mousemove pbm_mousemove
integer x = 1312
integer y = 536
integer width = 142
integer height = 124
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Agregar Item"
end type

event clicked;if dw_cab.RowCount() = 0 then Return 0
long fila
if dw_cab.GetItemString(1,'tipo') = '0' and (dw_cab.GetItemString(1,'estado') = '0' or dw_cab.GetItemString(1,'estado') = '3') then
	fila = dw_det.InsertRow(0)
	dw_det.SetItem(fila,'placa',dw_cab.GetItemString(1,'placa'))
	dw_det.SetItem(fila,'num_manten',dw_cab.GetItemNumber(1,'num_manten'))
	dw_det.SetItem(fila,'item',long(dw_det.describe("Evaluate('max(item)',0)"))+1)
end if

end event

type dw_det from datawindow within p2
integer x = 55
integer y = 64
integer width = 1207
integer height = 596
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_mantto_det"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)

end event

event itemchanged;if not isnull(GetItemNumber(1,'compute_1')) then
	AcceptText()
	dw_cab.SetItem(1,'valor',GetItemNumber(1,'compute_1'))
	dw_respon.setItem(GetRow(),'valor',GetItemNumber(1,'compute_1'))
end if

end event

type p_nsale from userobject within t1
integer x = 18
integer y = 112
integer width = 4366
integer height = 848
long backcolor = 67108864
string text = "Nota a Salida"
long tabtextcolor = 33554432
string picturename = "contrato.ico"
long picturemaskcolor = 536870912
rte_sale rte_sale
end type

on p_nsale.create
this.rte_sale=create rte_sale
this.Control[]={this.rte_sale}
end on

on p_nsale.destroy
destroy(this.rte_sale)
end on

type rte_sale from richtextedit within p_nsale
integer x = 32
integer y = 8
integer width = 4279
integer height = 820
integer taborder = 40
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_toolbar = true
boolean border = false
end type

type p_nentra from userobject within t1
integer x = 18
integer y = 112
integer width = 4366
integer height = 848
long backcolor = 67108864
string text = "Nota a Entrada"
long tabtextcolor = 33554432
string picturename = "contrato.ico"
long picturemaskcolor = 536870912
rte_entra rte_entra
end type

on p_nentra.create
this.rte_entra=create rte_entra
this.Control[]={this.rte_entra}
end on

on p_nentra.destroy
destroy(this.rte_entra)
end on

type rte_entra from richtextedit within p_nentra
integer y = 12
integer width = 4279
integer height = 824
integer taborder = 70
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_toolbar = true
boolean border = false
end type

type t2 from tab within w_af_mantto
integer x = 2770
integer y = 204
integer width = 1646
integer height = 104
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
p_sale p_sale
p_mantto p_mantto
p_mantto2 p_mantto2
p_entra p_entra
end type

on t2.create
this.p_sale=create p_sale
this.p_mantto=create p_mantto
this.p_mantto2=create p_mantto2
this.p_entra=create p_entra
this.Control[]={this.p_sale,&
this.p_mantto,&
this.p_mantto2,&
this.p_entra}
end on

on t2.destroy
destroy(this.p_sale)
destroy(this.p_mantto)
destroy(this.p_mantto2)
destroy(this.p_entra)
end on

event selectionchanged;if dw_cab.RowCount() = 1 then
	dw_cab.SetItem(1,'idx',newindex)
end if

end event

type p_sale from userobject within t2
integer x = 18
integer y = 104
integer width = 1609
integer height = -16
long backcolor = 67108864
string text = "Salida Servicio"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

type p_mantto from userobject within t2
integer x = 18
integer y = 104
integer width = 1609
integer height = -16
long backcolor = 67108864
string text = "Salida Mantto"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

type p_mantto2 from userobject within t2
integer x = 18
integer y = 104
integer width = 1609
integer height = -16
long backcolor = 67108864
string text = "Entrada Mantto"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

type p_entra from userobject within t2
integer x = 18
integer y = 104
integer width = 1609
integer height = -16
long backcolor = 67108864
string text = "Reintegro Servicio"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

type gb_1 from groupbox within w_af_mantto
integer x = 2766
integer y = 12
integer width = 1669
integer height = 700
integer taborder = 110
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle"
end type

event constructor;if dw_cab.RowCount() = 0 then Return 0
long fila
if dw_cab.GetItemString(1,'tipo') = '0' and dw_cab.GetItemString(1,'estado') = '3' then
	t1.p2.dw_det.deleteRow(0)
end if

end event

