$PBExportHeader$w_concep_cargo.srw
forward
global type w_concep_cargo from w_center
end type
type dw_cc from datawindow within w_concep_cargo
end type
type dw_con from datawindow within w_concep_cargo
end type
type dw_rela from datawindow within w_concep_cargo
end type
type pb_adiciona from picturebutton within w_concep_cargo
end type
type pb_quita from picturebutton within w_concep_cargo
end type
type pb_cancela from picturebutton within w_concep_cargo
end type
type st_1 from statictext within w_concep_cargo
end type
type st_2 from statictext within w_concep_cargo
end type
type st_3 from statictext within w_concep_cargo
end type
type st_4 from statictext within w_concep_cargo
end type
type pb_1 from picturebutton within w_concep_cargo
end type
end forward

global type w_concep_cargo from w_center
integer width = 5051
integer height = 1632
string title = "Nómina - Conceptos por cargo"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_concar.ico"
dw_cc dw_cc
dw_con dw_con
dw_rela dw_rela
pb_adiciona pb_adiciona
pb_quita pb_quita
pb_cancela pb_cancela
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
pb_1 pb_1
end type
global w_concep_cargo w_concep_cargo

type variables
DataWindowChild temple, cargo,dwc_cp
string ordenar[8] ,ordena[2]
string i_cemp

end variables

on w_concep_cargo.create
int iCurrent
call super::create
this.dw_cc=create dw_cc
this.dw_con=create dw_con
this.dw_rela=create dw_rela
this.pb_adiciona=create pb_adiciona
this.pb_quita=create pb_quita
this.pb_cancela=create pb_cancela
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_cc
this.Control[iCurrent+2]=this.dw_con
this.Control[iCurrent+3]=this.dw_rela
this.Control[iCurrent+4]=this.pb_adiciona
this.Control[iCurrent+5]=this.pb_quita
this.Control[iCurrent+6]=this.pb_cancela
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.pb_1
end on

on w_concep_cargo.destroy
call super::destroy
destroy(this.dw_cc)
destroy(this.dw_con)
destroy(this.dw_rela)
destroy(this.pb_adiciona)
destroy(this.pb_quita)
destroy(this.pb_cancela)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.pb_1)
end on

event open;call super::open;dw_con.SetTransObject(SQLCA)
dw_cc.SetTransObject(SQLCA)
dw_rela.SetTransObject(SQLCA)
dw_rela.getchild("tipoemple",temple)
temple.settransobject(SQLCA)
temple.Retrieve()
dw_rela.getchild("cargo",cargo)
cargo.settransobject(SQLCA)
cargo.Retrieve()

select cod_empresa into :i_cemp from lugar where codlugar=:clugar;
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo la tabla lugar",sqlca.sqlerrtext)
	return -1
end if
if isnull(i_cemp) then
	messagebox("Error Código Empresa",'No existe el código de la empresa en la tabla lugar, debe colocarlo allí para poder continuar')
	return -1
end if

dw_con.Modify("cod_concep.Edit.DisplayOnly=TRUE sigla.edit.displayonly=true des_concep.Edit.DisplayOnly=TRUE ")
dw_rela.InsertRow(0)
dw_con.Retrieve(i_cemp)
dw_con.setfilter('estado="1"')
dw_con.filter()

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

type pb_grabar from w_center`pb_grabar within w_concep_cargo
integer x = 2706
integer y = 20
integer taborder = 60
end type

event pb_grabar::clicked;call super::clicked;if dw_cc.update() = -1 then
	Rollback;
	if isNull(dw_rela.GetItemString(1,'codrela')) or dw_rela.GetItemString(1,'tipoemple') = '' or isNull(dw_rela.GetItemString(1,'cargo')) then Return
	dw_cc.Retrieve(dw_rela.GetITemString(1,'codrela'),dw_rela.GetITemString(1,'tipoemple'),dw_rela.GetITemString(1,'cargo'))
end if
commit;

end event

type dw_cc from datawindow within w_concep_cargo
event keypress pbm_dwnkey
integer x = 50
integer y = 308
integer width = 1993
integer height = 1124
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_concepcargo"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keypress;if getColumnName() = 'codtotal' then
	st_ppto st_parm
	st_parm.cod_vigencia = GetItemNumber(GetRow(),'cod_vigencia')
	if isNull(st_parm.cod_vigencia) then Return -1
	if key = keyBack! then Return -1
	st_parm.filtro = "tipo='1' and movimiento='1'"
	st_parm.dw_obj = this
	openwithparm(w_buscactapre,st_parm)
end if

end event

event clicked;if dwo.type="text" then
choose case dwo.name
	case "cod_concep_t"
		if ordena[1]="#4 A" then
			ordena[1]="#4 D"
		else
			ordena[1]="#4 A"
		end if
		this.setsort(ordena[1])
	case "sigla_t"
		if ordena[2]="#5 A" then
			ordena[2]="#5 D"
		else
			ordena[2]="#5 A"
		end if
		this.setsort(ordena[2])
end choose
this.sort()
end if

long cont,i
if row > 0 then
	if isSelected(row) then
		this.SelectRow(row,FALSE)
	else
		this.SelectRow(row,TRUE)
	end if
	for i = 1 to RowCount()
		if isSelected(i) then cont++
	next
end if
st_1.Text = 'Seleccionados ' + string(cont) + ' de ' + string(RowCount())

end event

event itemchanged;if getColumnName() = 'codtotal' then
	string codtotal
	long vigencia
	vigencia = GetItemNumber(GetRow(),'cod_vigencia')
	Select codtotal into :codtotal from pre_plan
	where cod_vigencia=:vigencia and tipo='1' and movimiento='1';
	if SQLCA.SQLCode = 100 then
		SetText('')
		SetItem(GetRow(),'codtotal','')
		MessageBox('Aviso','La cuenta no existe o no es de movimiento y gasto')		
		Return 1
	end if
end if

end event

event rowfocuschanged;if rowCount() = 0 or currentrow = 0 then
	st_1.Text = ''
	Return
end if


end event

type dw_con from datawindow within w_concep_cargo
integer x = 2363
integer y = 308
integer width = 2523
integer height = 1140
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_concep"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;
if dwo.type="text" then
choose case dwo.name
	case "cod_concep_t"
		if ordenar[1]="#1 A" then
			ordenar[1]="#1 D"
		else
			ordenar[1]="#1 A"
		end if
		this.setsort(ordenar[1])
	case "des_concep_t"
		if ordenar[2]="#2 A" then
			ordenar[2]="#2 D"
		else
			ordenar[2]="#2 A"
		end if
		this.setsort(ordenar[2])
	case "cod_tipo_concep_t"
		if ordenar[3]="#3 A" then
			ordenar[3]="#3 D"
		else
			ordenar[3]="#3 A"
		end if
		this.setsort(ordenar[3])
	case "tipo_t"
		if ordenar[4]="#4 A" then
			ordenar[4]="#4 D"
		else
			ordenar[4]="#4 A"
		end if
		this.setsort(ordenar[4])
	case "sigla_t"
		if ordenar[5]="#5 A" then
			ordenar[5]="#5 D"
		else
			ordenar[5]="#5 A"
		end if
		this.setsort(ordenar[5])
	case "novedad_t"
		if ordenar[6]="#6 A" then
			ordenar[6]="#6 D"
		else
			ordenar[6]="#6 A"
		end if
		this.setsort(ordenar[6])
	case "form_calculo_t"
		if ordenar[7]="#7 A" then
			ordenar[7]="#7 D"
		else
			ordenar[7]="#7 A"
		end if
		this.setsort(ordenar[7])
	case "form_verifica_t"
		if ordenar[8]="#8 A" then
			ordenar[8]="#8 D"
		else
			ordenar[8]="#8 A"
		end if
		this.setsort(ordenar[8])
end choose
this.sort()
end if

long cont,i
if row > 0 then
	if isSelected(row) then
		this.SelectRow(row,FALSE)
	else
		this.SelectRow(row,TRUE)
	end if
	for i = 1 to RowCount()
		if isSelected(i) then cont++
	next
	
end if
st_2.Text = 'Seleccionados ' + string(cont) + ' de ' + string(RowCount())

end event

event rowfocuschanged;if rowCount() = 0 or currentrow = 0 then
	st_2.Text = ''
	Return
end if

end event

type dw_rela from datawindow within w_concep_cargo
integer x = 46
integer y = 24
integer width = 2354
integer height = 136
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_nomrelalab"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;int ret
string valor
if dw_cc.GetNextModified(0,Primary!) > 0 or dw_cc.DeletedCount() > 0 then
	ret = MessageBox('Aviso','Ha realizado cambios. Desea guardarlos?',Question!,YESNOCANCEL!)
	if ret = 1 then
		pb_grabar.TriggerEvent(clicked!)
	elseif ret = 3 then
		if this.getcolumnName() = 'codrela' then
			valor = this.GetItemString(row,'codrela')
			this.SetItem(row, 'codrela', valor)
		end if
		if this.getcolumnName() = 'tipoemple' then
			valor = this.GetItemString(row,'tipoemple')
			this.SetItem(row, 'tipoemple', valor)
		end if
		if this.getcolumnName() = 'cargo' then
			valor = this.GetItemString(row,'cargo')
			this.SetItem(row, 'cargo', valor)
		end if
		this.SetText(valor)
		Return 2
	end if
end if

if this.AcceptText() = -1 then Return

if this.getcolumnName() = 'codrela' then
	dw_rela.SetItem(dw_rela.GetRow(),'tipoemple',"")
	temple.setfilter("codrela='" + data + "'")
	temple.filter()
//	cargo.SetFilter("codrela='" + data + "' and tipoemple='" + this.GetITemString(row,'tipoemple') + "'" )
//	cargo.Filter()
end if

if this.getcolumnName() = 'tipoemple' then
//	cargo.SetFilter("codrela='" + this.GetItemString(row,'codrela') + "' and tipoemple='" + data + "'")
//	cargo.Filter()	
end if

if isNull(dw_rela.GetItemString(1,'codrela')) or dw_rela.GetItemString(1,'tipoemple') = '' or isNull(dw_rela.GetItemString(1,'cargo')) then Return

dw_con.setfilter('estado="1"')
dw_con.filter()
dw_cc.Retrieve(dw_rela.GetItemString(1,'codrela'),dw_rela.GetItemString(1,'tipoemple'),dw_rela.GetItemString(1,'cargo'))

end event

type pb_adiciona from picturebutton within w_concep_cargo
event mousemove pbm_mousemove
string tag = "&Adicionar"
integer x = 2121
integer y = 664
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "             &a"
boolean originalsize = true
string picturename = "atras.gif"
string powertiptext = "&Adicionar"
end type

event clicked;if isNull(dw_rela.GetItemString(1,'codrela')) then
	messageBox('Error','Debe seleccionar la Relación Laboral')
	Return
elseif dw_rela.GetItemString(1,'tipoemple') = '' then
	messageBox('Error','Debe seleccionar el Tipo de Empleado')
	Return
elseif isNull(dw_rela.GetItemString(1,'cargo')) then
	messageBox('Error','Debe seleccionar el Cargo')
	Return
end if

long i, fila
for i = 1 to dw_con.RowCount()
	if dw_con.isSelected(i) then
		fila = dw_cc.Find("cod_concep='" + dw_con.GetItemString(i,'cod_concep') + "'",1,dw_cc.RowCount())
		if fila < 1 then
			fila = dw_cc.InsertRow(0)
			dw_cc.SetItem(fila,'codrela',dw_rela.GetItemString(1,'codrela'))
			dw_cc.SetItem(fila,'tipoemple',dw_rela.GetItemString(1,'tipoemple'))
			dw_cc.SetItem(fila,'cargo',dw_rela.GetItemString(1,'cargo'))
			dw_cc.SetItem(fila,'cod_concep',dw_con.GetItemString(i,'cod_concep'))
			dw_cc.SetItem(fila,'sigla',dw_con.GetItemString(i,'sigla'))
		end if
	end if
next
dw_con.SelectRow(0,FALSE)

end event

type pb_quita from picturebutton within w_concep_cargo
event mousemove pbm_mousemove
string tag = "&Quitar"
integer x = 2121
integer y = 812
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "           &q"
boolean originalsize = true
string picturename = "adelante_1.gif"
string powertiptext = "&Quitar"
end type

event clicked;if isNull(dw_rela.GetItemString(1,'codrela')) then
	messageBox('Error','Debe seleccionar la Relación Laboral')
	Return
elseif dw_rela.GetItemString(1,'tipoemple') = '' then
	messageBox('Error','Debe seleccionar el Tipo de Empleado')
	Return
elseif isNull(dw_rela.GetItemString(1,'cargo')) then
	messageBox('Error','Debe seleccionar el Cargo')
	Return
end if

long i, fila
for i = 1 to dw_cc.RowCount()
	if dw_cc.isSelected(i) then
		dw_cc.DeleteRow(i)
	end if
next
dw_cc.SelectRow(0,FALSE)

end event

type pb_cancela from picturebutton within w_concep_cargo
event mousemove pbm_mousemove
string tag = "&Cancelar"
integer x = 2533
integer y = 20
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

type st_1 from statictext within w_concep_cargo
integer x = 55
integer y = 1448
integer width = 955
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

type st_2 from statictext within w_concep_cargo
integer x = 2377
integer y = 1448
integer width = 1006
integer height = 56
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

type st_3 from statictext within w_concep_cargo
integer x = 46
integer y = 236
integer width = 928
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Conceptos asociados al cargo"
boolean focusrectangle = false
end type

type st_4 from statictext within w_concep_cargo
integer x = 2373
integer y = 232
integer width = 585
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
string text = "Lista de conceptos"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_concep_cargo
integer x = 2862
integer y = 20
integer width = 146
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "copiar.gif"
alignment htextalign = left!
string powertiptext = "Copiar Conceptos un nuevo cargo"
end type

event clicked;if dw_cc.rowcount()=0 then return
//openwithparm(w_copia_cargo_concepto,dw_p2_2)
//if message.stringparm='si' then cb_p2_ref.triggerevent(clicked!)
end event

