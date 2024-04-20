$PBExportHeader$w_addproctto.srw
forward
global type w_addproctto from window
end type
type pb_2 from picturebutton within w_addproctto
end type
type cb_2 from picturebutton within w_addproctto
end type
type pb_1 from picturebutton within w_addproctto
end type
type cb_1 from picturebutton within w_addproctto
end type
type dw_tratamientocpo from datawindow within w_addproctto
end type
end forward

global type w_addproctto from window
integer width = 3401
integer height = 948
boolean titlebar = true
string title = "Adición de Procedimientos a Tratamiento"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_2 pb_2
cb_2 cb_2
pb_1 pb_1
cb_1 cb_1
dw_tratamientocpo dw_tratamientocpo
end type
global w_addproctto w_addproctto

type variables
datawindowchild procedimientos
st_fact st_p
long cambio

end variables

forward prototypes
public function integer sincronizaod ()
end prototypes

public function integer sincronizaod ();int i, f
long nodontograma, ntrata
string valor, lugar, ltrata
uo_datastore dw_og

dw_og = Create uo_datastore
dw_og.DataObject = 'dw_odongrama'
dw_og.SetTransObject(SQLCA)
ntrata = st_p.dw_source.GetItemNumber(st_p.dw_source.GetRow(),'ntratamiento')
ltrata=st_p.dw_source.GetItemString(st_p.dw_source.GetRow(),'cLugar')

Select nodontograma, clugar_ocb into :nodontograma,:lugar from odontratacab
where ntratamiento=:ntrata and clugar=:ltrata;
IF SQLCA.SQLCode = -1 THEN
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return -1
END IF
dw_og.Retrieve(nodontograma, lugar)
for i = 1 to dw_tratamientocpo.RowCount()
	f = dw_og.Find("codigo_cuadrante="+string(dw_tratamientocpo.GetItemNumber(i,'codigo_cuadrante')) +&
		" and codigo_pieza="+string(dw_tratamientocpo.GetItemNumber(i,'codigo_pieza')) +&
		" and codigo_super="+string(dw_tratamientocpo.GetItemNumber(i,'codigo_super')) +&
		" and cod_conven="+string(dw_tratamientocpo.GetItemNumber(i,'cod_conven')),1,dw_og.RowCount())
	if f = 0 then
		f = dw_og.InsertRow(0)
		valor = dw_og.Describe("Evaluate('max(item)',0)")
		dw_og.SetItem(f,'nodontograma', nodontograma)
		dw_og.SetItem(f,'cLugar', clugar)
		dw_og.SetItem(f,'item',long(valor) + 1)
		dw_og.SetItem(f,'codigo_cuadrante',dw_tratamientocpo.GetItemNumber(i,'codigo_cuadrante'))
		dw_og.SetItem(f,'codigo_pieza',dw_tratamientocpo.GetItemNumber(i,'codigo_pieza'))
		dw_og.SetItem(f,'codigo_super',dw_tratamientocpo.GetItemNumber(i,'codigo_super'))
		dw_og.SetItem(f,'cod_conven',dw_tratamientocpo.GetItemNumber(i,'cod_conven'))
	end if
next
if dw_og.Update() = -1 then
	MessageBox('Error','No se adicionaron procedimientos del Tratamiento al odontograma.')
	Return -1
end if
Return 0
end function

on w_addproctto.create
this.pb_2=create pb_2
this.cb_2=create cb_2
this.pb_1=create pb_1
this.cb_1=create cb_1
this.dw_tratamientocpo=create dw_tratamientocpo
this.Control[]={this.pb_2,&
this.cb_2,&
this.pb_1,&
this.cb_1,&
this.dw_tratamientocpo}
end on

on w_addproctto.destroy
destroy(this.pb_2)
destroy(this.cb_2)
destroy(this.pb_1)
destroy(this.cb_1)
destroy(this.dw_tratamientocpo)
end on

event open;st_p = Message.PowerObjectParm
if not isValid(st_p) then
	MessageBox('Error','No hay tratamiento válido')
	Return -1
end if
dw_tratamientocpo.SetTransObject(SQLCA)
dw_tratamientocpo.GetChild('proced_descripcion',procedimientos)
procedimientos.SetTransObject(SQLCA)
procedimientos.Retrieve()

long fila
if st_p.contador = 1 then
	fila = pb_2.Event clicked()
	dw_tratamientocpo.SetItem(fila,'cod_conven',st_p.dw_obj.GetItemNumber(st_p.dw_obj.GetRow(),'cod_conven'))
	dw_tratamientocpo.SetItem(fila,'codigo_cuadrante',st_p.dw_obj.GetItemNumber(st_p.dw_obj.GetRow(),'codigo_cuadrante'))
	dw_tratamientocpo.SetItem(fila,'codigo_pieza',st_p.dw_obj.GetItemNumber(st_p.dw_obj.GetRow(),'codigo_pieza'))
	dw_tratamientocpo.SetItem(fila,'codigo_super',st_p.dw_obj.GetItemNumber(st_p.dw_obj.GetRow(),'codigo_super'))
	dw_tratamientocpo.triggerEvent(itemchanged!)
end if

end event

event close;closewithreturn(this,cambio)

end event

type pb_2 from picturebutton within w_addproctto
event mousemove pbm_mousemove
integer x = 1518
integer y = 696
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Adicionar Ingreso [Alt+A]"
end type

event clicked;long fila, codigo
fila = dw_tratamientocpo.InsertRow(0)
dw_tratamientocpo.SetItem(fila,'nTratamiento',st_p.dw_source.GetItemNumber(st_p.dw_source.GetRow(),'ntratamiento'))
dw_tratamientocpo.SetItem(fila,'cLugar',st_p.dw_source.GetItemString(st_p.dw_source.GetRow(),'cLugar'))
codigo = long(st_p.dw_obj.Describe("Evaluate('max(item)',0)"))
dw_tratamientocpo.SetItem(fila,'item', codigo + 1)
dw_tratamientocpo.SetItem(fila,'realizado', '0')
Return fila

end event

type cb_2 from picturebutton within w_addproctto
event mousemove pbm_mousemove
integer x = 1659
integer y = 696
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &b"
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Ingreso [Alt+B]"
end type

event clicked;dw_tratamientocpo.DeleteRow(0)
end event

type pb_1 from picturebutton within w_addproctto
event mousemove pbm_mousemove
integer x = 1806
integer y = 696
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Adicionar Ingreso [Alt+A]"
end type

event clicked;closewithreturn(parent,cambio)

end event

type cb_1 from picturebutton within w_addproctto
event mousemove pbm_mousemove
integer x = 1367
integer y = 696
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "Adicionar Ingreso [Alt+A]"
end type

event clicked;if dw_tratamientocpo.RowCount() = 0 then Return
long i
for i = 1 to dw_tratamientocpo.RowCount()
	if isNull(dw_tratamientocpo.GetItemString(i,'codproced')) or isNull(dw_tratamientocpo.GetItemNumber(i,'cod_conven')) or isNull(dw_tratamientocpo.GetItemNumber(i,'codigo_cuadrante')) or isNull(dw_tratamientocpo.GetItemNumber(i,'codigo_pieza')) or isNull(dw_tratamientocpo.GetItemNumber(i,'codigo_super')) then
		MessageBox('Atención','Debe completar los datos')
		Return -1
	end if
next
sincronizaOd()
if dw_tratamientocpo.Update() = -1 then
	Rollback;
else
	commit;
	cambio = 1
//	st_p.dw_obj.Retrieve(st_p.dw_obj.GetItemNumber(st_p.dw_obj.GetRow(),'ntratamiento'), st_p.dw_obj.GetItemString(st_p.dw_obj.GetRow(),'cLugar'))
	closewithreturn(parent, cambio)
end if

end event

type dw_tratamientocpo from datawindow within w_addproctto
integer x = 14
integer y = 96
integer width = 3218
integer height = 560
integer taborder = 10
string title = "none"
string dataobject = "dw_tratamientosug"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string codigo, filtro
this.AcceptText()
if this.GetColumnName() = 'proced_descripcion' then
	codigo = procedimientos.getItemString(procedimientos.getRow(),'proced_codproced')
	this.SetItem(row,'codproced',codigo)
else
	int cuad,diente,conv
	cuad = this.GetItemNumber(this.GetRow(),"codigo_cuadrante")
	diente = this.GetItemNumber(this.GetRow(),"codigo_pieza")
	conv = this.GetItemNumber(this.GetRow(),"cod_conven")
	if isNull(cuad) or isNull(diente) or isNull(conv) then 
		filtro = ""
	else
		filtro = 'codigo_cuadrante=' + String(cuad) +&
			' and codigo_pieza='+String(diente) + ' and cod_conven=' + String(conv)
	end if
	procedimientos.SetFilter(filtro)
	procedimientos.Filter()
	if procedimientos.RowCount() = 0 then
		setNull(codigo)
		this.SetItem(this.GetRow(),'codproced',codigo)
	end if
end if

end event

event rowfocuschanged;if this.RowCount() = 0 or currentrow=0 then Return
int cuad,diente,conv, codigo
string filtro
cuad = this.GetItemNumber(this.GetRow(),"codigo_cuadrante")
diente = this.GetItemNumber(this.GetRow(),"codigo_pieza")
conv = this.GetItemNumber(this.GetRow(),"cod_conven")
if isNull(cuad) or isNull(diente) or isNull(conv) then 
	filtro = ""
else
	filtro = 'codigo_cuadrante=' + String(cuad) +&
		' and codigo_pieza='+String(diente) + ' and cod_conven=' + String(conv)
end if
procedimientos.SetFilter(filtro)
procedimientos.Filter()
if procedimientos.RowCount() = 0 then
	setNull(codigo)
	this.SetItem(this.GetRow(),'codproced',codigo)
end if

end event

