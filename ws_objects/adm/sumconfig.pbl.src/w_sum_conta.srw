$PBExportHeader$w_sum_conta.srw
forward
global type w_sum_conta from w_center
end type
type dw_ufunc from datawindow within w_sum_conta
end type
type dw_sum_conta from datawindow within w_sum_conta
end type
type dw_emp from datawindow within w_sum_conta
end type
type pb_anular from picturebutton within w_sum_conta
end type
type pb_cerrar from picturebutton within w_sum_conta
end type
type pb_insert from picturebutton within w_sum_conta
end type
type pb_1 from picturebutton within w_sum_conta
end type
type gb_1 from groupbox within w_sum_conta
end type
type gb_2 from groupbox within w_sum_conta
end type
end forward

global type w_sum_conta from w_center
integer width = 6318
integer height = 1956
string title = "Interfaz Suministros - Contabilidad"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_conta.ico"
dw_ufunc dw_ufunc
dw_sum_conta dw_sum_conta
dw_emp dw_emp
pb_anular pb_anular
pb_cerrar pb_cerrar
pb_insert pb_insert
pb_1 pb_1
gb_1 gb_1
gb_2 gb_2
end type
global w_sum_conta w_sum_conta

type variables
datawindowchild dwc_ufunc, dwc_ccosto
string filtroSer, field, texto
end variables

forward prototypes
public subroutine f_bcuenta (string busca, string campo)
end prototypes

public subroutine f_bcuenta (string busca, string campo);st_general st_parm
string filtro, inven, afijo, cbodega

st_parm.valor = busca
st_parm.articulo = dwc_ufunc.GetItemString(dwc_ufunc.GetRow(),'consumo')
st_parm.almacen = dw_emp.getItemString(dw_emp.GetRow(),'cod_empresa')
st_parm.dw_obj = dw_sum_conta
if not isvalid(w_bcuenta) then
	openwithparm(w_bcuenta,st_parm)
	w_bcuenta.dw_2.Enabled = FALSE
	dw_sum_conta.setfocus()
end if
if w_bcuenta.windowstate=minimized! then
	w_bcuenta.windowstate=normal!
	if isvalid(dw_sum_conta) then dw_sum_conta.setfocus()
end if
if trim(lower(busca))="" or isnull(busca) then
	w_bcuenta.dw_1.setfilter("inven='1' or afijo='1'")
else
	filtro = "(lower(codtotal) like '"+lower(trim(busca))+"%')"
	if campo = "codtotal_bodega" then
		filtro = filtro + " and (inven='1' or afijo='1')"
		w_bcuenta.dw_1.setfilter(filtro)
	elseif campo = "codtotal_servicio" then
		cbodega = dw_sum_conta.GetItemString(dw_sum_conta.GetRow(),'codtotal_bodega')
		filtro = "(lower(codtotal) like '" + lower(trim(busca)) + "%')"
	end if
	w_bcuenta.dw_1.setfilter(filtro)		
end if
w_bcuenta.dw_2.setitem(1,1,busca)
w_bcuenta.dw_1.filter()
w_bcuenta.dw_1.sort()

end subroutine

event open;call super::open;dw_ufunc.GetChild('coduf', dwc_ufunc)
dwc_ufunc.SetTransObject(SQLCA)
if dwc_ufunc.Retrieve() = 0 then
	messageBox('Error','No hay unidades funcionales configuradas')
	dwc_ufunc.insertRow(0)
end if
dw_ufunc.GetChild('codcc', dwc_ccosto)
dwc_ccosto.SetTransObject(SQLCA)
dwc_ccosto.InsertRow(0)

dw_emp.SetTransObject(SQLCA)
dw_ufunc.SetTransObject(SQLCA)
dw_sum_conta.SetTransObject(SQLCA)
dw_emp.InsertRow(0)
dw_ufunc.InsertRow(0)


end event

on w_sum_conta.create
int iCurrent
call super::create
this.dw_ufunc=create dw_ufunc
this.dw_sum_conta=create dw_sum_conta
this.dw_emp=create dw_emp
this.pb_anular=create pb_anular
this.pb_cerrar=create pb_cerrar
this.pb_insert=create pb_insert
this.pb_1=create pb_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_ufunc
this.Control[iCurrent+2]=this.dw_sum_conta
this.Control[iCurrent+3]=this.dw_emp
this.Control[iCurrent+4]=this.pb_anular
this.Control[iCurrent+5]=this.pb_cerrar
this.Control[iCurrent+6]=this.pb_insert
this.Control[iCurrent+7]=this.pb_1
this.Control[iCurrent+8]=this.gb_1
this.Control[iCurrent+9]=this.gb_2
end on

on w_sum_conta.destroy
call super::destroy
destroy(this.dw_ufunc)
destroy(this.dw_sum_conta)
destroy(this.dw_emp)
destroy(this.pb_anular)
destroy(this.pb_cerrar)
destroy(this.pb_insert)
destroy(this.pb_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event close;call super::close;rollback;

end event

event closequery;call super::closequery;if dw_sum_conta.DeletedCount() > 0 or dw_sum_conta.ModifiedCount() > 0 then
	if messageBox('Aviso','Ha realizado cambios que no han sido guardados.Desea Continuar?', QUESTION!,YESNO!) = 2 then
		Return -1
	end if
end if

end event

type pb_grabar from w_center`pb_grabar within w_sum_conta
integer x = 2350
integer y = 1704
integer taborder = 70
string powertiptext = "&Guardar"
end type

event pb_grabar::clicked;call super::clicked;if dw_sum_conta.Update() = -1 then
	rollback;
else
	commit;
end if

end event

type dw_ufunc from datawindow within w_sum_conta
integer x = 1362
integer y = 88
integer width = 2629
integer height = 80
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ext_ufunc"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string vnul
setNull(vnul)
this.AcceptText()
dw_sum_conta.Reset()
if not isNull(dw_emp.GetItemString(1,'cod_empresa')) then
	if this.GetColumnName() = 'coduf' then
		this.SetItem(1,'codcc',vnul)
		if dwc_ccosto.Retrieve(this.GetItemString(1,'coduf')) = 0 then
			messageBox('Error','No hay unidades Centros de Costos configurados')
			dwc_ccosto.insertRow(0)
		end if	
	elseif not isnull(this.GetItemString(1,'coduf')) then
		dw_sum_conta.Retrieve(dw_emp.GetItemString(1,'cod_empresa'),this.GetItemString(1,'coduf'),this.GetItemString(1,'codcc'))
	end if
end if

end event

type dw_sum_conta from datawindow within w_sum_conta
event teclea pbm_dwnkey
event replacetext ( )
integer x = 37
integer y = 224
integer width = 6213
integer height = 1432
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_sum_conta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event teclea;if this.getcolumnname()= "codtotal_servicio" then
	if isNull(this.getcolumnname()="codtotal_bodega") then
		messagebox('Error','Debe ingresar la cuenta Bodega para filtrar la cuenta Servicio')
		Return
	end if
end if
if this.getcolumnname()="codtotal_bodega" or this.getcolumnname()= "codtotal_servicio" or this.getcolumnname()= "codtotal_gasto" or this.getcolumnname()= "codtotal_deprecia" then
	string este="!"
	choose case key
		case KeyNumpad0!,key0!
			este='0'
		case KeyNumpad1!,key1!
			este='1'
		case KeyNumpad2!,key2!
			este='2'
		case KeyNumpad3!,key3!
			este='3'
		case KeyNumpad4!,key4!
			este='4'
		case KeyNumpad5!,key5!
			este='5'
		case KeyNumpad6!,key6!
			este='6'
		case KeyNumpad7!,key7!
			este='7'
		case KeyNumpad8!,key8!
			este='8'
		case KeyNumpad9!,key9!
			este='9'
		case KeyNumpad0!,key0!
			este='0'
		case KeyEnter!
			if this.acceptText() = -1 then Return
			this.TriggerEvent(itemchanged!)
			Return
		case keyback!
			este=this.gettext()
			este=left(este, len(este) -1)
			//if not isNumber(este) then return
			f_bcuenta(este,this.getcolumnname())
			return
	end choose
	if este<>"!" then
		if not isnull(this.gettext()) then este=this.gettext()+este
		f_bcuenta(este,this.getcolumnname())
	end if
end if
end event

event replacetext();this.SetItem(this.GetRow(), field, texto)
this.Settext(texto)
end event

event itemchanged;string cuenta, cservicio, cbodega, filtro,cemp

cemp = GetItemString(getRow(),'cod_empresa')
if this.GetColumnName() = 'codtotal_bodega' then
	cbodega = this.GetItemString(this.getRow(),'codtotal_bodega')
	if not isNull(cbodega) then
		select descrip into :cuenta from cont_plan
		where cod_empresa=:cemp and codtotal = :cbodega and (inven='1' or afijo='1');
		IF SQLCA.SQLCode = -1 THEN 
			MessageBox("SQL error", SQLCA.SQLErrText)
			Return
		elseif SQLCA.SQLCode = 100 THEN 
			MessageBox("SQL error", 'No se encontró la cuenta dada')
			Return
		elseif SQLCA.SQLCode = 0 then
			this.SetItem(this.GetRow(),'descripbod',cuenta)
		end if	
	end if
end if

if this.GetColumnName() = 'codtotal_servicio' then
	cservicio = this.GetItemString(this.getRow(),'codtotal_servicio')
	if not isNull(cservicio) then
		select descrip into :cuenta from cont_plan
		where cod_empresa=:cemp and codtotal = :cservicio;
		IF SQLCA.SQLCode = -1 THEN 
			MessageBox("SQL error", SQLCA.SQLErrText)
			Return
		elseif SQLCA.SQLCode = 100 THEN 
			MessageBox("SQL error", 'No se encontró la cuenta dada')
			Return
		ELSE
			this.SetItem(this.GetRow(),'descripserv',cuenta)
		END IF
	end if
end if

if this.GetColumnName() = 'codtotal_gasto' then
	cservicio = this.GetItemString(this.getRow(),'codtotal_gasto')
	if not isNull(cservicio) then
		select descrip into :cuenta from cont_plan
		where cod_empresa=:cemp and codtotal = :cservicio;
		IF SQLCA.SQLCode = -1 THEN 
			MessageBox("SQL error", SQLCA.SQLErrText)
			Return
		elseif SQLCA.SQLCode = 100 THEN 
			MessageBox("SQL error", 'No se encontró la cuenta dada')
			Return
		ELSE
			this.SetItem(this.GetRow(),'cont_plan_descrip_1',cuenta)
		END IF
	end if
end if

if this.GetColumnName() = 'codtotal_deprecia' then
	cservicio = this.GetItemString(this.getRow(),'codtotal_deprecia')
	if not isNull(cservicio) then
		select descrip into :cuenta from cont_plan
		where cod_empresa=:cemp and codtotal = :cservicio;
		IF SQLCA.SQLCode = -1 THEN 
			MessageBox("SQL error", SQLCA.SQLErrText)
			Return
		elseif SQLCA.SQLCode = 100 THEN 
			MessageBox("SQL error", 'No se encontró la cuenta dada')
			Return
		ELSE
			this.SetItem(this.GetRow(),'cont_plan_descrip',cuenta)
		END IF
	end if
end if
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)
end event

type dw_emp from datawindow within w_sum_conta
integer x = 73
integer y = 92
integer width = 1166
integer height = 76
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ext_emp"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_anular from picturebutton within w_sum_conta
event mousemove pbm_mousemove
string tag = "Deshacer"
integer x = 1897
integer y = 1704
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
string picturename = "contrato.gif"
string disabledname = "d_contrato.gif"
alignment htextalign = left!
string powertiptext = "Deshacer"
end type

event clicked;long filaAct, fila
filaAct = dw_sum_conta.GetRow()
fila = dw_sum_conta.Retrieve(dw_emp.GetItemString(1,'cod_empresa'),dw_ufunc.GetItemString(1,'coduf'),dw_ufunc.GetItemString(1,'codcc'))
if fila >= filaAct then
	dw_sum_conta.ScrolltoRow(filaAct)
end if

end event

type pb_cerrar from picturebutton within w_sum_conta
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 1746
integer y = 1704
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
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_insert from picturebutton within w_sum_conta
event mousemove pbm_mousemove
string tag = "Insertar"
integer x = 2199
integer y = 1704
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
string powertiptext = "Insertar"
end type

event clicked;long fila
fila = dw_sum_conta.InsertRow(0)
dw_sum_conta.scrollToRow(fila)
dw_sum_conta.SetItem(fila,'cod_empresa',dw_emp.GetItemString(1,'cod_empresa'))
dw_sum_conta.SetItem(fila,'cufuncional',dw_ufunc.GetItemString(1,'coduf'))
dw_sum_conta.SetItem(fila,'codcc',dw_ufunc.GetItemString(1,'codcc'))

end event

type pb_1 from picturebutton within w_sum_conta
event mousemove pbm_mousemove
integer x = 2048
integer y = 1704
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
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Insertar"
end type

event clicked;if dw_sum_conta.RowCount() > 0 then
	dw_sum_conta.DeleteRow(0)
end if

end event

type gb_1 from groupbox within w_sum_conta
integer x = 1312
integer y = 24
integer width = 2793
integer height = 164
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Unidad Funcional                                                                       Centro de Costo"
end type

type gb_2 from groupbox within w_sum_conta
integer x = 32
integer y = 20
integer width = 1239
integer height = 168
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Empresa Contable"
end type

