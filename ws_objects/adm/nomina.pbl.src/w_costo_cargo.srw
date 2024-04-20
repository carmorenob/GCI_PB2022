$PBExportHeader$w_costo_cargo.srw
forward
global type w_costo_cargo from w_center
end type
type dw_concep from datawindow within w_costo_cargo
end type
type pb_1 from picturebutton within w_costo_cargo
end type
type pb_2 from picturebutton within w_costo_cargo
end type
type pb_3 from picturebutton within w_costo_cargo
end type
type dw_cargo from datawindow within w_costo_cargo
end type
type st_1 from statictext within w_costo_cargo
end type
type dw_emp from datawindow within w_costo_cargo
end type
type dw_lugar from datawindow within w_costo_cargo
end type
type dw_1 from datawindow within w_costo_cargo
end type
end forward

global type w_costo_cargo from w_center
string tag = "Desea guardar los cambios y salir?"
integer width = 6034
integer height = 1784
string title = "Nómina  Interfaz Contable"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_conta.ico"
boolean center = false
dw_concep dw_concep
pb_1 pb_1
pb_2 pb_2
pb_3 pb_3
dw_cargo dw_cargo
st_1 st_1
dw_emp dw_emp
dw_lugar dw_lugar
dw_1 dw_1
end type
global w_costo_cargo w_costo_cargo

type variables
st_nomina st_nom
string i_codemp,i_lugar, i_cargo
datawindowchild idw_concep,dw_ccosto
end variables

forward prototypes
public function integer grabar ()
end prototypes

public function integer grabar ();if dw_concep.AcceptText()=-1 then return -1
if dw_concep.update(true,false) = -1 then
	rollback;
	Return -1
end if
commit;
dw_concep.resetupdate()
cambio = FALSE
Return 0

end function

on w_costo_cargo.create
int iCurrent
call super::create
this.dw_concep=create dw_concep
this.pb_1=create pb_1
this.pb_2=create pb_2
this.pb_3=create pb_3
this.dw_cargo=create dw_cargo
this.st_1=create st_1
this.dw_emp=create dw_emp
this.dw_lugar=create dw_lugar
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_concep
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.pb_2
this.Control[iCurrent+4]=this.pb_3
this.Control[iCurrent+5]=this.dw_cargo
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.dw_emp
this.Control[iCurrent+8]=this.dw_lugar
this.Control[iCurrent+9]=this.dw_1
end on

on w_costo_cargo.destroy
call super::destroy
destroy(this.dw_concep)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.dw_cargo)
destroy(this.st_1)
destroy(this.dw_emp)
destroy(this.dw_lugar)
destroy(this.dw_1)
end on

event resize;call super::resize;dw_concep.resize(newwidth -100,newheight -400)
pb_1.y=dw_concep.y + dw_concep.height +10
pb_2.y=dw_concep.y + dw_concep.height +10
pb_grabar.y=dw_concep.y + dw_concep.height +10
pb_3.y=dw_concep.y + dw_concep.height +10
st_1.y=dw_concep.y + dw_concep.height +10
st_1.x=dw_concep.width -700


end event

type pb_grabar from w_center`pb_grabar within w_costo_cargo
integer x = 2299
integer y = 1552
end type

event pb_grabar::clicked;call super::clicked;grabar()
end event

type dw_concep from datawindow within w_costo_cargo
event keyup pbm_dwnkey
integer x = 50
integer y = 156
integer width = 5915
integer height = 1376
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_costo_cargo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;if isNull(dw_cargo.GetItemString(1,1)) or isNull(dw_lugar.GetItemString(1,1)) or isNull(dw_emp.GetItemString(1,1)) then Return
if getColumnName() ='codtotal' then 
	f_busca_cuenta(key,i_codemp,this)
end if
end event

event itemchanged;string descrip
if isNull(dw_cargo.GetItemString(1,1)) or isNull(dw_lugar.GetItemString(1,1)) or isNull(dw_emp.GetItemString(1,1)) then 
	MessageBox('Atención','Debe seleccionar cargo, lugar y empresa')
	Return 1
end if
If dwo.name='cod_concep' then 
	SetItem(row,'cod_concep',data)
End If

If  dwo.name<>'cod_concep' and dwo.name<>'factor' then
	if isNull(GetItemString(row,string(dwo.name))) then
		SetItemStatus(row,0,primary!,NewModified!)
		SetItem(row,'cargo',i_cargo)
	//	SetItem(row,'cod_concep',GetItemString(row,'cod_concep_nom'))		
		SetItem(row,'lugar',i_lugar)
		SetItem(row,'factor',1)
		SetItem(row,'publico','1')
		SetItem(row,'cod_empresa',i_codemp)
		Setitem(row,'coduf',dw_1.GetItemString(1,'coduf'))
		Setitem(row,'codcc',dw_1.GetItemString(1,'codcc'))	
	End if
End If
if dwo.name='codtotal' then
	select descrip into :descrip from cont_plan
	where cod_empresa=:i_codemp and codtotal=:data and movimiento = '1';
	IF SQLCA.SQLCode = 100 THEN
		MessageBox("Atención", 'No se encuentra la cuenta')
		Return 1
	END IF
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return 1
	END IF
	SetItem(GetRow(),'descrip',descrip)
End If
cambio = TRUE

end event

event constructor;//getchild('cod_pago',idw_concep)
//idw_concep.SetTransObject(SQLCA)
SetTransObject(SQLCA)
end event

event rowfocuschanged;if RowCount() > 0 then
	st_1.Text = 'Registro ' + string(GetRow()) + ' de ' +string(RowCount())
end if

end event

type pb_1 from picturebutton within w_costo_cargo
event mousemove pbm_mousemove
string tag = "&Nuevo Concepto"
integer x = 1989
integer y = 1552
integer width = 146
integer height = 128
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $n"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar Registro"
end type

event clicked;if isNull(i_lugar) or i_lugar='' or isNull(i_cargo) or i_cargo='' or isNull(dw_1.GetItemString(1,'coduf')) or dw_1.GetItemString(1,'coduf') = '' or isNull(dw_1.GetItemString(1,'codcc')) then  return
long fila
dw_concep.SetColumn(1)
fila = dw_concep.InsertRow(0)
dw_concep.setitem(fila,'cargo',i_cargo)
dw_concep.setitem(fila,'lugar',i_lugar)
dw_concep.setitem(fila,'cod_empresa',i_codemp)
dw_concep.setitem(fila,'coduf',dw_1.GetItemString(1,'coduf'))
dw_concep.setitem(fila,'codcc',dw_1.GetItemString(1,'codcc'))
dw_concep.scrolltoRow(fila)
dw_concep.setFocus()

end event

type pb_2 from picturebutton within w_costo_cargo
event mousemove pbm_mousemove
string tag = "&Eliminar Concepto"
integer x = 2139
integer y = 1552
integer width = 146
integer height = 128
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $n"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar registro"
end type

event clicked;if messageBox('Aviso','Desea remover el concepto seleccionado?',QUESTION!,YESNO!) = 1 then
	dw_concep.DeleteRow(dw_concep.GetRow())
	if dw_concep.update() = -1 then
		rollback;
		dw_concep.Retrieve()
	end if
end if

end event

type pb_3 from picturebutton within w_costo_cargo
event mousemove pbm_mousemove
integer x = 2455
integer y = 1552
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
string picturename = "puerta.gif"
string disabledname = "d_puerta.gif"
alignment htextalign = left!
string powertiptext = "Salir"
end type

event clicked;close(parent)
end event

type dw_cargo from datawindow within w_costo_cargo
integer x = 46
integer y = 12
integer width = 1294
integer height = 144
integer taborder = 20
boolean bringtotop = true
string dataobject = "dw_combo_cargo"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(SQLCA)
insertrow(1)

end event

event itemchanged;choose case f_pregunta()
	case 1
		if grabar()=-1 then
			return 1
		else
			return 0
		end if
	case 2
	case 3
		return 1
end choose
accepttext()
i_cargo=getitemstring(1,1)
if isNull(i_lugar) or i_lugar='' or isNull(i_cargo) or i_cargo='' or isNull(dw_1.GetItemString(1,'coduf')) or dw_1.GetItemString(1,'coduf') = '' or isNull(dw_1.GetItemString(1,'codcc')) then 
	dw_concep.Reset()
	return
end if
dw_concep.retrieve(i_cargo,i_lugar,dw_1.GetItemString(1,'coduf'),dw_1.GetItemString(1,'codcc'))

end event

type st_1 from statictext within w_costo_cargo
integer x = 4512
integer y = 1620
integer width = 603
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
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_emp from datawindow within w_costo_cargo
integer x = 4873
integer y = 4
integer width = 1093
integer height = 140
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_cont_empresa"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(SQLCA)
insertrow(1)
long cuantos
string emp
select count(*),min(cod_empresa) into :cuantos,:emp from cont_empresa;
if cuantos=1 then 
	setitem(1,1,emp)
	post event itemchanged(1,object.cod_empresa,emp)
	dw_concep.setfocus()
end if
end event

event itemchanged;choose case f_pregunta()
	case 1
		if grabar()=-1 then
			return 1
		else
			return 0
		end if
	case 2
	case 3
		return 1
end choose
accepttext()
i_codemp=getitemstring(1,1)

end event

type dw_lugar from datawindow within w_costo_cargo
integer x = 1339
integer y = 12
integer width = 1275
integer height = 144
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_combo_lugar"
boolean border = false
boolean livescroll = true
end type

event itemchanged;choose case f_pregunta()
	case 1
		if grabar()=-1 then
			return 1
		else
			return 0
		end if
	case 2
	case 3
		return 1
end choose
accepttext()
i_lugar = getitemstring(1,1)
if isNull(i_lugar) or i_lugar='' or isNull(i_cargo) or i_cargo='' or isNull(dw_1.GetItemString(1,'coduf')) or dw_1.GetItemString(1,'coduf') = '' or isNull(dw_1.GetItemString(1,'codcc')) then 
	dw_concep.Reset()
	return 
end if
dw_concep.retrieve(i_cargo,i_lugar,dw_1.GetItemString(1,'coduf'),dw_1.GetItemString(1,'codcc'))

end event

event constructor;settransobject(SQLCA)
insertrow(1)
long cuantos
string lug
select count(*),min(codlugar) into :cuantos,:lug from
lugar;
if cuantos=1 then 
	setitem(1,1,lug)
	post event itemchanged(1,object.codlugar,lug)
	dw_concep.setfocus()
end if

end event

type dw_1 from datawindow within w_costo_cargo
integer x = 2619
integer y = 12
integer width = 2235
integer height = 144
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_uf_cc"
boolean border = false
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)
dw_1.getchild("codcc",dw_ccosto)
dw_ccosto.SetTransObject(SQLCA)
dw_ccosto.retrieve()
insertRow(1)

end event

event itemchanged;string valor

if this.getColumnName() = 'coduf' then
	setNull(valor)
	this.setitem(1,'codcc',valor)
	dw_ccosto.setfilter("coduf='"+data+"'")
	dw_ccosto.filter()
	this.acceptText()
end if
if this.getcolumnName() = 'codcc' then
	this.SetItem(row, 'codcc', data)
	this.acceptText()
end if
if isNull(i_lugar) or i_lugar='' or isNull(i_cargo) or i_cargo='' or isNull(dw_1.GetItemString(1,'coduf')) or dw_1.GetItemString(1,'coduf') = '' or isNull(dw_1.GetItemString(1,'codcc')) then 
	dw_concep.Reset()
	return
end if
dw_concep.retrieve(i_cargo,i_lugar,dw_1.GetItemString(1,'coduf'),dw_1.GetItemString(1,'codcc'))
end event

