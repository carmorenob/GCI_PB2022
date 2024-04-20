$PBExportHeader$w_intf_ppto.srw
forward
global type w_intf_ppto from w_center
end type
type pb_cancela from picturebutton within w_intf_ppto
end type
type dw_cc from datawindow within w_intf_ppto
end type
type dw_1 from datawindow within w_intf_ppto
end type
type pb_1 from picturebutton within w_intf_ppto
end type
type pb_2 from picturebutton within w_intf_ppto
end type
end forward

global type w_intf_ppto from w_center
integer width = 4626
integer height = 1840
string title = "Nómina - Interfaz Ppto"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_ppto.ico"
boolean center = false
pb_cancela pb_cancela
dw_cc dw_cc
dw_1 dw_1
pb_1 pb_1
pb_2 pb_2
end type
global w_intf_ppto w_intf_ppto

type variables
DataWindowChild dw_ccosto, dwc_cp
st_ppto st_parm
string i_cemp

end variables

on w_intf_ppto.create
int iCurrent
call super::create
this.pb_cancela=create pb_cancela
this.dw_cc=create dw_cc
this.dw_1=create dw_1
this.pb_1=create pb_1
this.pb_2=create pb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_cancela
this.Control[iCurrent+2]=this.dw_cc
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.pb_2
end on

on w_intf_ppto.destroy
call super::destroy
destroy(this.pb_cancela)
destroy(this.dw_cc)
destroy(this.dw_1)
destroy(this.pb_1)
destroy(this.pb_2)
end on

event open;call super::open;dw_cc.SetTransObject(SQLCA)
select cod_empresa into :i_cemp from lugar where codlugar=:clugar;
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo la tabla lugar",sqlca.sqlerrtext)
	return -1
end if
if isnull(i_cemp) then
	messagebox("Error Código Empresa",'No existe el código de la empresa en la tabla lugar, debe colocarlo allí para poder continuar')
	return -1
end if
dw_cc.GetChild('cod_concep',dwc_cp)
dwc_cp.SetTransObject(SQLCA)
dwc_cp.Retrieve(i_cemp)

end event

event closequery;call super::closequery;int ret
if dw_cc.GetNextModified(0,Primary!) > 0 or dw_cc.DeletedCount() > 0 then
	ret = MessageBox('Aviso','Ha realizado cambios. Desea guardarlos?',Question!,YESNOCANCEL!)
	if ret = 1 then
		pb_grabar.TriggerEvent(clicked!)
	elseif ret = 2 then
		Return 0
	elseif ret = 3 then
		Return -1
	end if
end if

end event

event resize;call super::resize;dw_cc.resize(newwidth -100, newheight - 400)
pb_cancela.y=dw_cc.y + dw_cc.height + 24
pb_1.y=dw_cc.y + dw_cc.height + 24
pb_2.y=dw_cc.y + dw_cc.height + 24
pb_grabar.y=dw_cc.y + dw_cc.height + 24

end event

type pb_grabar from w_center`pb_grabar within w_intf_ppto
integer x = 2286
integer y = 1564
integer taborder = 60
end type

event pb_grabar::clicked;call super::clicked;if dw_cc.update() = -1 then
	Rollback;
end if
commit;

end event

type pb_cancela from picturebutton within w_intf_ppto
event mousemove pbm_mousemove
string tag = "&Cancelar"
integer x = 1833
integer y = 1564
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
string text = "                $c"
boolean originalsize = true
string picturename = "cancelar.GIF"
end type

event clicked;Close(parent)
end event

type dw_cc from datawindow within w_intf_ppto
event teclea pbm_dwnkey
integer x = 50
integer y = 168
integer width = 4475
integer height = 1360
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_concep_ppto"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event teclea;if getColumnName() = 'codtotal_ingre' then
	st_parm.cod_vigencia = GetItemNumber(GetRow(),'cod_vigencia_ingre')
	if isNull(st_parm.cod_vigencia) then Return -1
	if key = keyBack! then Return -1
	st_parm.filtro = "tipo='0' and movimiento='1'"
	st_parm.dw_obj = this
	openwithparm(w_buscactapre,st_parm)
end if
if getColumnName() = 'codtotal_gasto' then
	st_parm.cod_vigencia = GetItemNumber(GetRow(),'cod_vigencia_gasto')
	if isNull(st_parm.cod_vigencia) then Return -1
	if key = keyBack! then Return -1
	st_parm.filtro = "tipo='1' and movimiento='1'"
	st_parm.dw_obj = this
	openwithparm(w_buscactapre,st_parm)
end if
if getColumnName() = 'cod_total' or getColumnName() = 'cod_total_pte' then
	if i_cemp='' then return
	f_busca_cuenta(key,i_cemp,this)
end if

end event

event itemfocuschanged;if getColumnName() = 'codtotal_ingre' then
	st_parm.cod_vigencia = GetItemNumber(GetRow(),'cod_vigencia_ingre')
	if isNull(st_parm.cod_vigencia) then Return -1
	st_parm.filtro = "tipo='0' and movimiento='1'"
	st_parm.dw_obj = this
	openwithparm(w_buscactapre,st_parm)
end if
if getColumnName() = 'codtotal_gasto' then
	st_parm.cod_vigencia = GetItemNumber(GetRow(),'cod_vigencia_gasto')
	if isNull(st_parm.cod_vigencia) then Return -1
	st_parm.filtro = "tipo='1' and movimiento='1'"
	st_parm.dw_obj = this
	openwithparm(w_buscactapre,st_parm)
end if

end event

type dw_1 from datawindow within w_intf_ppto
integer x = 41
integer y = 20
integer width = 2478
integer height = 144
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_uf_cc"
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
string valor
long ret

if dw_cc.GetNextModified(0,Primary!) > 0 or dw_cc.DeletedCount() > 0 then
	ret = MessageBox('Aviso','Ha realizado cambios. Desea guardarlos?',Question!,YESNOCANCEL!)
	if ret = 1 then
		pb_grabar.TriggerEvent(clicked!)
	elseif ret = 3 then
		if this.getcolumnName() = 'coduf' then
			valor = this.GetItemString(row,'coduf')
			this.SetItem(row, 'coduf', valor)
		end if
		if this.getcolumnName() = 'codcc' then
			valor = this.GetItemString(row,'codcc')
			this.SetItem(row, 'codcc', valor)
		end if
		this.SetText(valor)
		Return 2
	end if
end if

if this.AcceptText() = -1 then Return

if this.getColumnName() = 'coduf' then
	setNull(valor)
	this.setitem(1,'codcc',valor)
	dw_ccosto.setfilter("coduf='"+this.getitemstring(1,'coduf')+"'")
	dw_ccosto.filter()
	acceptText()
end if

if isNull(dw_1.GetItemString(1,'coduf')) or dw_1.GetItemString(1,'coduf') = '' or isNull(dw_1.GetItemString(1,'codcc')) then Return
dw_cc.Retrieve(dw_1.GetItemString(1,'coduf'),dw_1.GetItemString(1,'codcc'),i_cemp)

end event

event constructor;setTransObject(SQLCA)
dw_1.getchild("codcc",dw_ccosto)
dw_ccosto.SetTransObject(SQLCA)
dw_ccosto.retrieve()
insertRow(1)

end event

type pb_1 from picturebutton within w_intf_ppto
event mousemove pbm_mousemove
integer x = 1984
integer y = 1564
integer width = 146
integer height = 128
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.GIF"
string powertiptext = "Insertar registro"
end type

event clicked;if isNull(dw_1.GetItemString(1,'coduf')) or dw_1.GetItemString(1,'coduf') = '' or isNull(dw_1.GetItemString(1,'codcc')) then Return
long fila
fila = dw_cc.InsertRow(0)
dw_cc.SetItem(fila,'coduf',dw_1.GetItemString(1,'coduf'))
dw_cc.SetItem(fila,'codcc',dw_1.GetItemString(1,'codcc'))
dw_cc.ScrolltoRow(fila)

end event

type pb_2 from picturebutton within w_intf_ppto
event mousemove pbm_mousemove
integer x = 2135
integer y = 1564
integer width = 146
integer height = 128
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string powertiptext = "Borrar Registro"
end type

event clicked;if isNull(dw_1.GetItemString(1,'coduf')) or dw_1.GetItemString(1,'coduf') = '' or isNull(dw_1.GetItemString(1,'codcc')) then Return

dw_cc.DeleteRow(dw_cc.GetRow())

end event

