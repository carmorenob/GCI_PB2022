$PBExportHeader$w_concep.srw
forward
global type w_concep from w_center
end type
type dw_concep from datawindow within w_concep
end type
type pb_1 from picturebutton within w_concep
end type
type pb_2 from picturebutton within w_concep
end type
type pb_3 from picturebutton within w_concep
end type
type dw_emp from datawindow within w_concep
end type
type st_1 from statictext within w_concep
end type
type dw_tc from datawindow within w_concep
end type
type cbx_1 from checkbox within w_concep
end type
end forward

global type w_concep from w_center
string tag = "Desea guardar los cambios y salir?"
integer width = 6615
integer height = 1880
string title = "Nómina - Conceptos"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_conceptos.ico"
boolean center = false
dw_concep dw_concep
pb_1 pb_1
pb_2 pb_2
pb_3 pb_3
dw_emp dw_emp
st_1 st_1
dw_tc dw_tc
cbx_1 cbx_1
end type
global w_concep w_concep

type variables
st_nomina st_nom
string ordenar[8],i_codemp,i_lugar
datawindowchild idw_concep,idw_concep_pago,idw_concepr,idw_tipocon
end variables

forward prototypes
public function integer grabar ()
end prototypes

public function integer grabar ();if dw_concep.AcceptText()=-1 then return -1
//if dw_concep.find('(tipo="1" or tipo="P") and isnull(cod_impu)',1,dw_concep.rowcount())>0 then
//	messagebox('Atención','Debe escoger la equivalencia de impuesto para pago de los conceptos que son Deducidos o Patronales')
//	return -1
//end if

if dw_concep.update(true,false) = -1 then
	rollback;
	Return -1
end if
commit;
dw_concep.resetupdate()
cambio = FALSE
Return 0
end function

on w_concep.create
int iCurrent
call super::create
this.dw_concep=create dw_concep
this.pb_1=create pb_1
this.pb_2=create pb_2
this.pb_3=create pb_3
this.dw_emp=create dw_emp
this.st_1=create st_1
this.dw_tc=create dw_tc
this.cbx_1=create cbx_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_concep
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.pb_2
this.Control[iCurrent+4]=this.pb_3
this.Control[iCurrent+5]=this.dw_emp
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.dw_tc
this.Control[iCurrent+8]=this.cbx_1
end on

on w_concep.destroy
call super::destroy
destroy(this.dw_concep)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.dw_emp)
destroy(this.st_1)
destroy(this.dw_tc)
destroy(this.cbx_1)
end on

event resize;call super::resize;dw_concep.resize((newwidth -100),(newheight -500))
cbx_1.y=dw_concep.y+dw_concep.height +50
pb_2.y=dw_concep.y+dw_concep.height +50
pb_1.y=dw_concep.y+dw_concep.height +50
pb_grabar.y=dw_concep.y+dw_concep.height +50
pb_3.y=dw_concep.y+dw_concep.height +50
st_1.y=dw_concep.y+dw_concep.height +20
end event

type pb_grabar from w_center`pb_grabar within w_concep
integer x = 2336
integer y = 1640
end type

event pb_grabar::clicked;call super::clicked;grabar()
end event

type dw_concep from datawindow within w_concep
integer x = 41
integer y = 160
integer width = 6501
integer height = 1460
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_concep"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;if isValid(w_formula) then Return
setPointer(HourGlass!)
if this.GetColumnName() = "form_calculo" then
	st_nom.valor = "form_calculo"
	st_nom.dw_obj = this
	openWithParm(w_formula,st_nom)
elseif this.GetColumnName() = "form_verifica" then
	st_nom.valor = "form_verifica"
	st_nom.dw_obj = this
	openWithParm(w_formula,st_nom)
elseif this.GetColumnName() = "des_formula" then
	st_nom.valor = "des_formula"
	st_nom.dw_obj = this
	openWithParm(w_formula,st_nom)
end if

end event

event doubleclicked;this.TriggerEvent(itemfocuschanged!)
end event

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
end event

event itemchanged;if getColumnName() ='tipo' then
	idw_tipocon.setfilter("tipo='"+GetItemString(GetRow(),'tipo'))
	idw_tipocon.filter()
	if GetItemString(GetRow(),'tipo') = 'P' or GetItemString(GetRow(),'tipo') = 'V' then SetItem(GetRow(),'novedad','0')
end if
cambio = TRUE

end event

event constructor;SetTransObject(SQLCA)

getchild('cod_pago',idw_concep)
idw_concep.SetTransObject(SQLCA)

getchild('equ_retro',idw_concepr)
idw_concepr.SetTransObject(SQLCA)
idw_concepr.setfilter( "(tipo ='0' or  tipo ='L') and estado='1'")
idw_concepr.filter()

getchild('concep_pago',idw_concep_pago)
idw_concep_pago.settransobject(sqlca)

idw_tipocon.SetTransObject(SQLCA)
getchild('ord_dian',idw_tipocon)
end event

event rowfocuschanged;if RowCount() > 0 then
	st_1.Text = 'Registro ' + string(GetRow()) + ' de ' +string(RowCount())
end if

end event

event buttonclicked;long f
f = dw_tc.Find("cod_tipo_concep='"+GetItemString(GetRow(),'cod_tipo_concep')+"'",1,dw_tc.RowCount())
if f > 0 then
	if dw_tc.GetItemString(f,'tercero') = '1' then
		g_tercerodesde = 20
		openwithparm(w_buscater,this)
	else
		MessageBox('Atención','El tipo de concepto no es para asignar tercero directamente')
	end if
end if

end event

type pb_1 from picturebutton within w_concep
event mousemove pbm_mousemove
string tag = "&Nuevo Concepto"
integer x = 2176
integer y = 1640
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

event clicked;if isnull(dw_emp.getitemstring(1,1)) then return
long fila
dw_concep.SetColumn(1)
fila = dw_concep.InsertRow(0)
dw_concep.setitem(fila,'cod_empresa',i_codemp)
dw_concep.scrolltoRow(fila)
dw_concep.setFocus()

end event

type pb_2 from picturebutton within w_concep
event mousemove pbm_mousemove
string tag = "&Eliminar Concepto"
integer x = 2016
integer y = 1640
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

type pb_3 from picturebutton within w_concep
event mousemove pbm_mousemove
integer x = 2496
integer y = 1640
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

type dw_emp from datawindow within w_concep
integer x = 41
integer y = 16
integer width = 1115
integer height = 140
integer taborder = 20
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
idw_concep.retrieve(i_codemp,'0','1')
dw_concep.retrieve(i_codemp)
idw_concep_pago.retrieve(i_codemp,'0','1')
end event

type st_1 from statictext within w_concep
integer x = 5911
integer y = 1644
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

type dw_tc from datawindow within w_concep
boolean visible = false
integer x = 1591
integer y = 44
integer width = 462
integer height = 96
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_tipo_concep"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
Retrieve()

end event

type cbx_1 from checkbox within w_concep
integer x = 18
integer y = 1656
integer width = 603
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mostrar solo los Activos"
end type

event clicked;if checked then
	dw_concep.setfilter('estado="1"')
else
	dw_concep.setfilter('')
end if
dw_concep.filter()

end event

