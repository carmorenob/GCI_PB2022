$PBExportHeader$w_contra_cuentas.srw
forward
global type w_contra_cuentas from w_center
end type
type dw_ufunc from datawindow within w_contra_cuentas
end type
type dw_sum_conta from datawindow within w_contra_cuentas
end type
type dw_emp from datawindow within w_contra_cuentas
end type
type pb_anular from picturebutton within w_contra_cuentas
end type
type pb_cerrar from picturebutton within w_contra_cuentas
end type
type pb_insert from picturebutton within w_contra_cuentas
end type
type pb_1 from picturebutton within w_contra_cuentas
end type
type gb_1 from groupbox within w_contra_cuentas
end type
type gb_2 from groupbox within w_contra_cuentas
end type
end forward

global type w_contra_cuentas from w_center
integer width = 4745
integer height = 1872
string title = "Interfaz Causación Contratación - Contabilidad"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "plan.ico"
boolean center = false
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
global w_contra_cuentas w_contra_cuentas

type variables
datawindowchild dwc_ufunc,dwc_cc, dwc_ccosto,idw_concep
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

event open;call super::open;dw_ufunc.SetTransObject(SQLCA)
dw_ufunc.GetChild('coduf', dwc_ufunc)
dwc_ufunc.SetTransObject(SQLCA)
if dwc_ufunc.Retrieve() = 0 then
	messageBox('Error','No hay unidades funcionales configuradas')
	dwc_ufunc.insertRow(0)
end if

dw_ufunc.GetChild('codcc', dwc_ccosto)
dwc_ccosto.SetTransObject(SQLCA)
dwc_ccosto.InsertRow(0)

dw_emp.InsertRow(0)
dw_sum_conta.SetTransObject(SQLCA)
dw_sum_conta.getchild('cod_rel',idw_concep)
idw_concep.settransobject(sqlca)
idw_concep.setfilter("nomina='0'")
idw_concep.filter()
dw_ufunc.InsertRow(0)
end event

on w_contra_cuentas.create
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

on w_contra_cuentas.destroy
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

type pb_grabar from w_center`pb_grabar within w_contra_cuentas
integer x = 2313
integer y = 1648
integer height = 124
integer taborder = 70
boolean originalsize = false
string powertiptext = "&Guardar"
end type

event pb_grabar::clicked;call super::clicked;if dw_sum_conta.Update() = -1 then
	rollback;
else
	commit;
end if

end event

type dw_ufunc from datawindow within w_contra_cuentas
integer x = 87
integer y = 284
integer width = 2610
integer height = 76
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
	idw_concep.retrieve(dw_emp.GetItemString(dw_emp.getRow(),'cod_empresa'),'R','1')
	if this.GetColumnName() = 'coduf' then
		this.SetItem(1,'codcc',vnul)
		if dwc_ccosto.Retrieve(this.GetItemString(1,'coduf')) = 0 then
			messageBox('Error','No hay unidades Centros de Costos configurados')
			dwc_ccosto.insertRow(0)
		end if	
		dwc_cc.SetFilter("coduf='" + this.GetItemString(1,'coduf')+ "'")
		dwc_cc.Filter()
	elseif not isnull(this.GetItemString(1,'coduf')) then
		dw_sum_conta.Retrieve(dw_emp.GetItemString(1,'cod_empresa'),this.GetItemString(1,'coduf'),this.GetItemString(1,'codcc'))
	end if
end if

end event

type dw_sum_conta from datawindow within w_contra_cuentas
event teclea pbm_dwnkey
event replacetext ( )
integer x = 41
integer y = 416
integer width = 4617
integer height = 1180
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_contra_contabil"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event teclea;if this.getcolumnname()= "codtotal_causa" then
	if isNull(this.getcolumnname()="codtotal_causa") then
		messagebox('Error','Debe ingresar la cuenta Bodega para filtrar la cuenta Servicio')
		Return
	end if
end if
if this.getcolumnname()="codtotal_causa" then
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
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)
end event

event constructor;Getchild('codcc',dwc_cc)
dwc_cc.SetTransObject(SQLCA)
end event

type dw_emp from datawindow within w_contra_cuentas
integer x = 78
integer y = 104
integer width = 1166
integer height = 72
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ext_emp"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_emp.SetTransObject(SQLCA)

end event

type pb_anular from picturebutton within w_contra_cuentas
event mousemove pbm_mousemove
string tag = "Deshacer"
integer x = 1861
integer y = 1648
integer width = 146
integer height = 124
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
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

type pb_cerrar from picturebutton within w_contra_cuentas
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 1710
integer y = 1648
integer width = 146
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
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_insert from picturebutton within w_contra_cuentas
event mousemove pbm_mousemove
string tag = "Insertar"
integer x = 2162
integer y = 1648
integer width = 146
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
string powertiptext = "Insertar"
end type

event clicked;long fila
fila = dw_sum_conta.InsertRow(0)
dw_sum_conta.scrollToRow(fila)
dw_sum_conta.SetItem(fila,'cod_empresa',dw_emp.GetItemString(dw_emp.getrow(),'cod_empresa'))
dw_sum_conta.SetItem(fila,'cufuncional',dw_ufunc.GetItemString(dw_ufunc.getrow(),'coduf'))
dw_sum_conta.SetItem(fila,'codcc',dwc_ccosto.GetItemString(dwc_ccosto.getrow(),'codcc'))

end event

type pb_1 from picturebutton within w_contra_cuentas
event mousemove pbm_mousemove
integer x = 2011
integer y = 1648
integer width = 146
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
string powertiptext = "Insertar"
end type

event clicked;if dw_sum_conta.RowCount() > 0 then
	dw_sum_conta.DeleteRow(0)
end if

end event

type gb_1 from groupbox within w_contra_cuentas
integer x = 37
integer y = 220
integer width = 2706
integer height = 160
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

type gb_2 from groupbox within w_contra_cuentas
integer x = 37
integer y = 32
integer width = 1239
integer height = 164
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

