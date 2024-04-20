$PBExportHeader$w_af_comodato.srw
forward
global type w_af_comodato from w_center
end type
type dw_cab from datawindow within w_af_comodato
end type
type pb_nuevo from picturebutton within w_af_comodato
end type
type pb_anular from picturebutton within w_af_comodato
end type
type pb_cerrar from picturebutton within w_af_comodato
end type
type st_3 from statictext within w_af_comodato
end type
type pb_b from picturebutton within w_af_comodato
end type
type t1 from tab within w_af_comodato
end type
type p2 from userobject within t1
end type
type pb_reg from picturebutton within p2
end type
type dw_kardexmov from datawindow within p2
end type
type p2 from userobject within t1
pb_reg pb_reg
dw_kardexmov dw_kardexmov
end type
type p1 from userobject within t1
end type
type st_4 from statictext within p1
end type
type pb_1 from picturebutton within p1
end type
type dw_cpo from datawindow within p1
end type
type p1 from userobject within t1
st_4 st_4
pb_1 pb_1
dw_cpo dw_cpo
end type
type t1 from tab within w_af_comodato
p2 p2
p1 p1
end type
type pb_grabartmp from picturebutton within w_af_comodato
end type
type st_5 from statictext within w_af_comodato
end type
type dw_alm from datawindow within w_af_comodato
end type
type dw_1 from datawindow within w_af_comodato
end type
end forward

global type w_af_comodato from w_center
integer width = 4384
integer height = 2112
string title = "Activos Fijos- Comodatos"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_comodato.ico"
boolean center = false
dw_cab dw_cab
pb_nuevo pb_nuevo
pb_anular pb_anular
pb_cerrar pb_cerrar
st_3 st_3
pb_b pb_b
t1 t1
pb_grabartmp pb_grabartmp
st_5 st_5
dw_alm dw_alm
dw_1 dw_1
end type
global w_af_comodato w_af_comodato

type variables
DataWindowChild dwc_almfuente, dwc_alm
string codDocumento, codalm


end variables

forward prototypes
public function integer grabar (string tipo)
end prototypes

public function integer grabar (string tipo);long numdoc, fila, cont, i
string msg, placa

if dw_cab.RowCount() = 0 then return -1

if tipo = 'definitivo' then
	fila = dw_cab.Find("estado='N'",1,dw_cab.RowCount())
	do while fila > 0
		if isNull(dw_cab.GetItemDateTime(fila,'fecha_entrega')) then
			dw_cab.ScrolltoRow(fila)
			MessageBox('Atención','Debe asignar una fecha de dación del activo')
			Return -1
		end if
		if isNull(dw_cab.GetItemDateTime(fila,'fecha_adevolver')) then
			dw_cab.ScrolltoRow(fila)
			MessageBox('Atención','Debe asignar una fecha cuando se planee devolver el activo')
			Return -1
		end if
		if isNull(dw_cab.GetItemString(fila,'documento')) then
			dw_cab.ScrolltoRow(fila)
			MessageBox('Atención','Debe seleccionar un tercero')
			Return -1
		end if
		if fila + 1 > dw_cab.RowCount() then EXIT
		fila = dw_cab.Find("estado='N'",fila + 1,dw_cab.RowCount())
	loop
end if

if dw_cab.AcceptText() = -1 then Return -1

fila = dw_cab.Find("estado='N'",1,dw_cab.RowCount())
do while fila > 0
	dw_cab.ScrolltoRow(fila)
	dw_cab.TriggerEvent(rowfocuschanged!)
	placa = dw_cab.GetItemString(fila,'placa')
	select count(*) into :cont from af_comodato
	where placa=:placa and estado = '1';
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("SQL error", msg)
		Return -1
	END IF
	if cont > 0 then
		MessageBox('Atención','El activo con placa '+placa+ ' está en comodato.')
//		dw_cab.DeleteRow(fila)
		fila = dw_cab.Find("estado='N'",1,dw_cab.RowCount())
		CONTINUE
	end if
	Select max(item) into :cont from af_comodato
	where placa=:placa;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("SQL error", msg)
		Return -1
	END IF
	if isNull(cont) then cont = 0
	t1.p1.dw_cpo.SetItem(1,'item',cont + 1)
	t1.p1.dw_cpo.SetItem(1,'estado','1')
	if t1.p1.dw_cpo.Update() = -1 then
		Rollback;
		Return -1
	end if
	dw_cab.SetItem(fila,'item',cont + 1)
	dw_cab.SetItem(fila,'estado','1')
	fila = dw_cab.Find("estado='N'",1,dw_cab.RowCount())
	commit;
loop

//if dw_cab.Update(TRUE,FALSE) = -1 then
//	Rollback;
//	for i = 1 to dw_cab.RowCount()
//		if dw_cab.GetItemStatus(i,0,Primary!) = NewModified! then
//			dw_cab.SetItem(i,'estado','N')
//		end if
//	next
//	Return -1
//end if

//commit;
Return 0

end function

on w_af_comodato.create
int iCurrent
call super::create
this.dw_cab=create dw_cab
this.pb_nuevo=create pb_nuevo
this.pb_anular=create pb_anular
this.pb_cerrar=create pb_cerrar
this.st_3=create st_3
this.pb_b=create pb_b
this.t1=create t1
this.pb_grabartmp=create pb_grabartmp
this.st_5=create st_5
this.dw_alm=create dw_alm
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_cab
this.Control[iCurrent+2]=this.pb_nuevo
this.Control[iCurrent+3]=this.pb_anular
this.Control[iCurrent+4]=this.pb_cerrar
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.pb_b
this.Control[iCurrent+7]=this.t1
this.Control[iCurrent+8]=this.pb_grabartmp
this.Control[iCurrent+9]=this.st_5
this.Control[iCurrent+10]=this.dw_alm
this.Control[iCurrent+11]=this.dw_1
end on

on w_af_comodato.destroy
call super::destroy
destroy(this.dw_cab)
destroy(this.pb_nuevo)
destroy(this.pb_anular)
destroy(this.pb_cerrar)
destroy(this.st_3)
destroy(this.pb_b)
destroy(this.t1)
destroy(this.pb_grabartmp)
destroy(this.st_5)
destroy(this.dw_alm)
destroy(this.dw_1)
end on

event open;call super::open;dw_cab.Retrieve()

end event

type pb_grabar from w_center`pb_grabar within w_af_comodato
integer x = 1682
integer y = 1860
integer taborder = 70
string powertiptext = "&Guardar Definitivo"
end type

event pb_grabar::clicked;call super::clicked;if messageBox('Atención','Desea grabar definitivamente los registros de activos en comodato?',QUESTION!,YESNO!) = 1 then
	grabar('definitivo')
end if

end event

type dw_cab from datawindow within w_af_comodato
event borrarnuevo ( )
integer x = 50
integer y = 244
integer width = 2894
integer height = 388
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_af_comodatocab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;t1.p1.dw_cpo.Reset()
if this.rowCount() = 0 then Return
t1.p1.dw_cpo.Retrieve(GetItemString(GetRow(),'placa'),GetItemNumber(GetRow(),'item'))
if GetItemString(GetRow(),'estado') = 'N' then
	t1.p1.dw_cpo.InsertRow(1)
	t1.p1.dw_cpo.SetItem(1,'placa',GetItemString(GetRow(),'placa'))
	t1.p1.dw_cpo.SetItem(1,'descripcion',GetItemString(GetRow(),'descripcion'))
	t1.p1.dw_cpo.SetItem(1,'item',GetItemNumber(GetRow(),'item'))
	t1.p1.dw_cpo.SetItem(1,'fecha',GetItemDateTime(GetRow(),'fecha'))
	t1.p1.dw_cpo.SetItem(1,'fecha_entrega',GetItemDateTime(GetRow(),'fecha_entrega'))
	t1.p1.dw_cpo.SetItem(1,'fecha_adevolver',GetItemDateTime(GetRow(),'fecha_adevolver'))
	t1.p1.dw_cpo.SetItem(1,'fecha_devolucion',GetItemDateTime(GetRow(),'fecha_devolucion'))
	t1.p1.dw_cpo.SetItem(1,'estado',GetItemString(GetRow(),'estado'))
	t1.p1.dw_cpo.SetItem(1,'tipo',GetItemString(GetRow(),'tipo'))
	t1.p1.dw_cpo.SetItem(1,'tipodoc',GetItemString(GetRow(),'tipodoc'))
	t1.p1.dw_cpo.SetItem(1,'documento',GetItemString(GetRow(),'documento'))
	t1.p1.dw_cpo.SetItem(1,'observacion',GetItemString(GetRow(),'observacion'))
	t1.p1.dw_cpo.SetItem(1,'nombre1',GetItemString(GetRow(),'nombre1'))
	t1.p1.dw_cpo.SetItem(1,'nombre2',GetItemString(GetRow(),'nombre2'))
	t1.p1.dw_cpo.SetItem(1,'apellido1',GetItemString(GetRow(),'apellido1'))
	t1.p1.dw_cpo.SetItem(1,'apellido2',GetItemString(GetRow(),'apellido2'))
	t1.p1.dw_cpo.SetItem(1,'razon_social',GetItemString(GetRow(),'razon_social'))
end if

end event

event dberror;Rollback;
Return 0

end event

event constructor;dw_cab.SetTransObject(SQLCA)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

type pb_nuevo from picturebutton within w_af_comodato
event mousemove pbm_mousemove
string tag = "Nuevo Registro"
integer x = 992
integer y = 1856
integer width = 146
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "Import.gif"
string disabledname = "d_Import.gif"
alignment htextalign = left!
string powertiptext = "Recibir en Comodato"
end type

event clicked;long inicial, final, numdoc, fila

fila = dw_cab.InsertRow(1)
dw_cab.SetItem(fila,'tipo','1')
dw_cab.SetItem(fila,'fecha',today())
dw_cab.SetItem(fila,'usuario',usuario)
dw_cab.SetItem(fila,'estado','0')
dw_cab.ScrollToRow(fila)

t1.p1.dw_cpo.Reset()

end event

type pb_anular from picturebutton within w_af_comodato
event mousemove pbm_mousemove
string tag = "Anular Entrada"
integer x = 1536
integer y = 1860
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
string picturename = "anular_doc.gif"
string disabledname = "d_anular_doc.gif"
alignment htextalign = left!
string powertiptext = "Anular Registro"
end type

event clicked;string placa

if dw_cab.RowCount() = 0 then return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '2' then
	messageBox('Aviso','El activo de placa ' + string(dw_cab.GetItemString(dw_cab.GetRow(),'placa')) + ' ya ha sido anulado')
	return
end if
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = 'N' then
	if messageBox('Aviso','El registro para el activo de placa ' + string(dw_cab.GetItemString(dw_cab.GetRow(),'placa')) + ' es nuevo. Desea borrar el registro?',QUESTION!,YESNO!) = 1 then
		dw_cab.DeleteRow(dw_cab.GetRow())
	end if
	return
end if
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '1' then
	if messageBox('Aviso','Esta seguro de anular el registro de placa ' + string(dw_cab.GetItemString(dw_cab.GetRow(),'placa')) + '?',QUESTION!,YESNO!) = 1 then
		t1.p1.dw_cpo.SetItem(1,'Estado','2')
		dw_cab.SetItem(dw_cab.GetRow(),'Estado','2')
		if t1.p1.dw_cpo.Update() = 1 then
			commit;
		else
			rollback;
		end if
	end if
	return
end if


end event

type pb_cerrar from picturebutton within w_af_comodato
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 1390
integer y = 1860
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
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cerrar"
end type

event clicked;close(parent)

end event

type st_3 from statictext within w_af_comodato
integer x = 59
integer y = 180
integer width = 599
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
string text = "Historial de Comodatos"
boolean focusrectangle = false
end type

type pb_b from picturebutton within w_af_comodato
event mousemove pbm_mousemove
string tag = "Nuevo Registro"
integer x = 2967
integer y = 472
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Eliminar Registro Nuevo"
end type

event clicked;if dw_cab.RowCount() = 0 then Return 0
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = 'N' then
	dw_cab.DeleteRow(dw_cab.GetRow())
else
	MessageBox('Atención','El registro no es nuevo')
end if

end event

type t1 from tab within w_af_comodato
event create ( )
event destroy ( )
integer x = 37
integer y = 676
integer width = 4279
integer height = 1164
integer taborder = 80
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
p2 p2
p1 p1
end type

on t1.create
this.p2=create p2
this.p1=create p1
this.Control[]={this.p2,&
this.p1}
end on

on t1.destroy
destroy(this.p2)
destroy(this.p1)
end on

type p2 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4242
integer height = 1036
long backcolor = 67108864
string text = "Listado de Activos"
long tabtextcolor = 33554432
string picturename = "cambia_doc.ico"
long picturemaskcolor = 536870912
pb_reg pb_reg
dw_kardexmov dw_kardexmov
end type

on p2.create
this.pb_reg=create pb_reg
this.dw_kardexmov=create dw_kardexmov
this.Control[]={this.pb_reg,&
this.dw_kardexmov}
end on

on p2.destroy
destroy(this.pb_reg)
destroy(this.dw_kardexmov)
end on

type pb_reg from picturebutton within p2
event mousemove pbm_mousemove
integer x = 4055
integer y = 56
integer width = 142
integer height = 124
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "export.gif"
string disabledname = "d_export.gif"
alignment htextalign = left!
string powertiptext = "Llevar"
end type

event clicked;long fila, f
string placa, valor

fila = dw_kardexmov.Find("selec=1",1,dw_kardexmov.RowCount())
if fila > 0 then
	dw_cab.SetFilter("")
	dw_cab.Filter()
end if
do while fila > 0
	placa = dw_kardexmov.GetItemString(fila,'placa')
	f = dw_cab.Find("placa='"+placa+"' and (estado='"+"1' or estado='N')",1,dw_cab.RowCount())
	if f > 0 then
		dw_cab.ScrolltoRow(f)
		MessageBox('Atención','El activo con placa '+placa+' ya está en comodato o se esta elaborando el documento.')
	else
		if dw_cab.RowCount() = 0 then
			valor = '0'
		else
			valor = dw_cab.Describe("Evaluate('max(if(placa=~~'"+placa+"~~',item,0))',0)")
		end if
		f = dw_cab.InsertRow(0)
		dw_cab.SetItem(f,'placa',placa)
		dw_cab.SetItem(f,'descripcion',dw_kardexmov.GetItemString(fila,'descripcion'))
		dw_cab.SetItem(f,'item',long(valor) + 1)
		dw_cab.SetItem(f,'estado','N')
		dw_cab.SetItem(f,'tipo','0')
		dw_cab.SetItem(f,'fecha',today())
		dw_cab.ScrolltoRow(f)
		dw_cab.TriggerEvent(rowFocuschanged!)
	end if
	dw_kardexmov.setItem(fila,'selec',0)
	fila = dw_kardexmov.Find("selec=1",1,dw_kardexmov.RowCount())
loop
t1.SelectTab(2)
end event

type dw_kardexmov from datawindow within p2
integer x = 37
integer y = 48
integer width = 3986
integer height = 948
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_ls_placa"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;Rollback;
Return 0

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

event constructor;SetTransObject(SQLCA)
end event

event clicked;if dwo.Name = 'selec_t' then
	long i
	if describe("selec_t.Text") = 'Selec.' then
		for i = 1 to RowCount()
			if GetItemString(i,'estado') = '1' then
				SetItem(i,'selec',1)
			else
				SetItem(i,'selec',0)
			end if
		next
		Modify("selec_t.Text='Desel.'")
	else
		for i = 1 to RowCount()
			SetItem(i,'selec',0)
		next
		Modify("selec_t.Text='Selec.'")
	end if
end if

end event

event retrieveend;long i
for i = 1 to rowCount()
	SetItem(i,'selec',0)
next

end event

type p1 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4242
integer height = 1036
long backcolor = 67108864
string text = "Detalle"
long tabtextcolor = 33554432
string picturename = "audita.ico"
long picturemaskcolor = 536870912
st_4 st_4
pb_1 pb_1
dw_cpo dw_cpo
end type

on p1.create
this.st_4=create st_4
this.pb_1=create pb_1
this.dw_cpo=create dw_cpo
this.Control[]={this.st_4,&
this.pb_1,&
this.dw_cpo}
end on

on p1.destroy
destroy(this.st_4)
destroy(this.pb_1)
destroy(this.dw_cpo)
end on

type st_4 from statictext within p1
integer x = 2496
integer y = 428
integer width = 695
integer height = 512
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "Seleccione el almacén del que se registrarán los artículos. Haga doble clic sobre los Artículos en Kardex y digite el número de elementos a registrar y complete los datos. Si tiene componentes adicionales, adiciónelos en la grilla componentes."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within p1
event mousemove pbm_mousemove
string tag = "Nuevo Registro"
integer x = 2501
integer y = 88
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
string picturename = "export.gif"
string disabledname = "d_export.gif"
alignment htextalign = left!
string powertiptext = "Devolver activo"
end type

event clicked;if dw_cab.RowCount() = 0 then Return 0
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '1' then
	if not isNull(dw_cpo.GetItemDateTime(1,'fecha_devolucion')) then
		if dw_cpo.GetItemDateTime(1,'fecha_devolucion') <= dw_cpo.GetItemDateTime(1,'fecha_entrega') then
			MessageBox('Atención','La fecha de devolución debe ser posterior a la de recepción!!!',Exclamation!)
			Return 0
		end if
		if MessageBox('Atención','Desea establecer la fecha de devolución '+string(dw_cpo.GetItemDateTime(1,'fecha_devolucion'))+' y el estado a Devuelto?',QUESTION!,YESNO!) = 2 then Return 0
		dw_cpo.SetItem(1,'estado','3')
		if dw_cpo.Update() = -1 then
			Rollback;
			Return -1
		end if
		dw_cab.SetItem(dw_cab.GetRow(),'estado','3')
		dw_cab.SetItem(dw_cab.GetRow(),'fecha_devolucion',dw_cpo.GetItemDateTime(1,'fecha_devolucion'))
	else
		MessageBox('Atención','Debe ingresar una fecha válida')
	end if
end if

end event

type dw_cpo from datawindow within p1
integer x = 27
integer y = 28
integer width = 2423
integer height = 980
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_af_comodatoff"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;Rollback;
Return 0

end event

event constructor;setTransObject(SQLCA)

end event

event itemchanged;AcceptText()
if GetColumnName() = 'fecha_entrega' then
	dw_cab.SetItem(dw_cab.GetRow(),'fecha_entrega',GetItemDateTime(1,'fecha_entrega'))
elseif GetColumnName() = 'fecha_adevolver' then
	dw_cab.SetItem(dw_cab.GetRow(),'fecha_adevolver',GetItemDateTime(1,'fecha_adevolver'))
	if GetItemString(1,'tipo') = '1' and GetItemString(1,'estado') = '1' then
		if Update() = -1 then
			Rollback;
			Return -1
		end if
	end if
elseif GetColumnName() = 'fecha_devolucion' then
	dw_cab.SetItem(dw_cab.GetRow(),'fecha_devolucion',GetItemDateTime(1,'fecha_devolucion'))
elseif GetColumnName() = 'tipodoc' then
	dw_cab.SetItem(dw_cab.GetRow(),'tipodoc',GetItemString(1,'tipodoc'))
elseif GetColumnName() = 'observacion' then
	dw_cab.SetItem(dw_cab.GetRow(),'observacion',GetItemString(1,'observacion'))
elseif getColumnName() = 'documento' then
	string td,doc,n1,n2,a1,a2,rs
	td = GetItemString(GetRow(),'tipodoc')
	if isNull(data) then
		doc = GetItemString(GetRow(),'documento')
	else
		doc = data
	end if
	select nombre1,nombre2,apellido1,apellido2,razon_social into :n1,:n2,:a1,:a2,:rs
	from terceros where tipodoc=:td and documento=:doc;
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return 1
	elseif SQLCA.SQLCode = 100 THEN
		if MessageBox('Atención','El tercero no existe. Desea crearlo?',QUESTION!,YESNO!,2) = 1 then
			st_general st_p
			st_p.valor = td
			st_p.documento = doc
			openwithparm(w_cfgterceros,st_p)
			select nombre1,nombre2,apellido1,apellido2,razon_social into :n1,:n2,:a1,:a2,:rs
			from terceros where tipodoc=:td and documento=:doc;
		end if
	END IF
	dw_cab.SetItem(dw_cab.GetRow(),'tipodoc',GetItemString(1,'tipodoc'))
	dw_cab.SetItem(dw_cab.GetRow(),'documento',GetItemString(1,'documento'))
	SetItem(GetRow(),'nombre1',n1)
	SetItem(GetRow(),'nombre2',n2)
	SetItem(GetRow(),'apellido1',a1)
	SetItem(GetRow(),'apellido2',a2)
	SetItem(GetRow(),'razon_social',rs)
	dw_cab.SetItem(dw_cab.GetRow(),'nombre1',n1)
	dw_cab.SetItem(dw_cab.GetRow(),'nombre2',n2)
	dw_cab.SetItem(dw_cab.GetRow(),'apellido1',a1)
	dw_cab.SetItem(dw_cab.GetRow(),'apellido2',a2)
	dw_cab.SetItem(dw_cab.GetRow(),'razon_social',rs)
end if

end event

event losefocus;AcceptText()

end event

event buttonclicked;
g_tercerodesde=13
openwithparm(w_buscater,dw_cpo)
SetColumn('documento')
TriggerEvent(itemchanged!)

end event

type pb_grabartmp from picturebutton within w_af_comodato
event mousemove pbm_mousemove
string tag = "Guardar Temporal"
boolean visible = false
integer x = 1865
integer y = 1860
integer width = 142
integer height = 124
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar Temporal"
end type

event clicked;grabar('temporal')
end event

type st_5 from statictext within w_af_comodato
integer x = 1531
integer y = 24
integer width = 279
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Almacén:"
boolean focusrectangle = false
end type

type dw_alm from datawindow within w_af_comodato
integer x = 1522
integer y = 84
integer width = 1157
integer height = 72
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "dw_alm_ext"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
InsertRow(0)

end event

event itemchanged;if AcceptText() = -1 then Return 0
t1.p2.dw_kardexmov.Retrieve(GetItemString(1,1))

end event

type dw_1 from datawindow within w_af_comodato
integer x = 32
integer y = 28
integer width = 1326
integer height = 132
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_lugar_sumi"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
setitem(1,1,clugar)
dw_alm.SetTransObject(SQLCA)
dw_alm.GetChild('codalmacen', dwc_alm)
dwc_alm.SetTransObject(SQLCA)
if dwc_alm.Retrieve(usuario,'%',clugar) = 0 then
	dw_alm.setitem(1,'codalmacen','')
	messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
	dw_alm.InsertRow(0)
end if
dw_alm.InsertRow(1)
end event

event itemchanged;string ls_clugar
ls_clugar=data
if dwc_alm.Retrieve(usuario,'%',ls_clugar) = 0 then
	dw_alm.setitem(row,'codalmacen','')
	messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
	dwc_alm.InsertRow(0)
end if
dw_alm.setitem(1,1,'')
dw_alm.InsertRow(0)
end event

