$PBExportHeader$w_tsup.srw
forward
global type w_tsup from window
end type
type pb_4 from picturebutton within w_tsup
end type
type pb_3 from picturebutton within w_tsup
end type
type pb_2 from picturebutton within w_tsup
end type
type pb_1 from picturebutton within w_tsup
end type
type ddlb_2 from dropdownlistbox within w_tsup
end type
type ddlb_1 from dropdownlistbox within w_tsup
end type
type pb_7 from picturebutton within w_tsup
end type
type dw_2 from datawindow within w_tsup
end type
type dw_1 from datawindow within w_tsup
end type
type dw_emp from datawindow within w_tsup
end type
end forward

global type w_tsup from window
integer width = 3927
integer height = 1988
boolean titlebar = true
string title = "Trabajo Suplementario"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_suma.ico"
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
ddlb_2 ddlb_2
ddlb_1 ddlb_1
pb_7 pb_7
dw_2 dw_2
dw_1 dw_1
dw_emp dw_emp
end type
global w_tsup w_tsup

type variables
string tipodoc, documento, codtsup
long mes
boolean calcula, cancela

end variables

on w_tsup.create
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.ddlb_2=create ddlb_2
this.ddlb_1=create ddlb_1
this.pb_7=create pb_7
this.dw_2=create dw_2
this.dw_1=create dw_1
this.dw_emp=create dw_emp
this.Control[]={this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.ddlb_2,&
this.ddlb_1,&
this.pb_7,&
this.dw_2,&
this.dw_1,&
this.dw_emp}
end on

on w_tsup.destroy
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.ddlb_2)
destroy(this.ddlb_1)
destroy(this.pb_7)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.dw_emp)
end on

event open;dw_emp.Retrieve()

end event

event resize;//
end event

type pb_4 from picturebutton within w_tsup
event mousemove pbm_mousemove
string tag = "&Cancelar"
integer x = 3611
integer y = 964
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $c"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string powertiptext = "Eliminar Registro"
end type

event clicked;if isNull(dw_1.GetItemNumber(dw_1.GetRow(),'num_nomina')) then
	if MessageBox('Atención','Esta seguro de borrar el registro activo?',QUESTION!,YESNO!,2) = 2 then Return 
	dw_1.deleteRow(dw_1.GetRow())
	if dw_1.Update() = -1 then
		Rollback;
		dw_1.retrieve(tipodoc,documento,long(ddlb_1.text),long(left(ddlb_2.text,2)))
		Return -1
	end if
else
	MessageBox('Atención','Ya ha sido cargado en una nomina. No puede borrarse')
end if

end event

type pb_3 from picturebutton within w_tsup
event mousemove pbm_mousemove
string tag = "&Cancelar"
integer x = 3611
integer y = 824
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
string text = "                $c"
boolean originalsize = true
string picturename = "asig_cita.gif"
string powertiptext = "Recalcular T.Suplementario"
end type

event clicked;if dw_emp.RowCount()  = 0 then Return 0

if dw_1.Find("num_nomina > 0",1,dw_1.RowCount()) > 0 then
	MessageBox('Atención','Ya ha sido llevado a nómina. No puede recalcularse')
	Return -1
end if

if MessageBox('Atención','Esta seguro de recalcular el trabajo suplementario para '+dw_emp.GetItemString(dw_emp.GetRow(),'compute_1')+' mes' + ddlb_2.text ,QUESTION!,YESNO!,2) = 2 then Return 
string td,doc,msg
date fecini,fecfin
long l_ano, l_mes, i
fecini = date(long(ddlb_1.text),long(left(ddlb_2.text,2)),1)
fecfin = RelativeDate(f_finmes(date(fecini)),1)
td = dw_emp.GetItemString(dw_emp.GetRow(),'tipodoc')
doc = dw_emp.GetItemString(dw_emp.GetRow(),'documento')
l_ano = long(ddlb_1.text)
l_mes = long(left(ddlb_2.text,2))

update nom_programacion set calculado = '0' 
where tipodoc=:td and documento=:doc and year(inicio)=:l_ano and month(inicio) = :l_mes;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("SQL error", msg)
	Return -1
END IF

delete from nom_tsup 
where tipodoc=:td and documento=:doc and ano=:l_ano and mes=:l_mes;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("SQL error", msg)
	Return -1
END IF

for i = 1 to dw_emp.RowCount()
	dw_emp.SetItem(i,'selec',0)
next
dw_emp.SetItem(dw_emp.GetRow(),'selec',1)

if pb_1.Event Clicked() = -1 then
	Rollback;
	dw_1.retrieve(tipodoc,documento,long(ddlb_1.text),long(left(ddlb_2.text,2)))
	Return -1
end if

end event

type pb_2 from picturebutton within w_tsup
event mousemove pbm_mousemove
string tag = "&Cancelar"
integer x = 1723
integer y = 1752
integer width = 146
integer height = 128
integer taborder = 30
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
string powertiptext = "Cerrar"
end type

event clicked;Close(parent)
end event

type pb_1 from picturebutton within w_tsup
event mousemove pbm_mousemove
integer x = 1883
integer y = 1752
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
string text = "              &b"
boolean originalsize = true
string picturename = "contrato.gif"
string disabledname = "d_contrato.gif"
string powertiptext = "Calcular desde programación"
end type

event clicked;long fila, h_comp, t_com, filas
date f_ptr

filas = long(dw_emp.Describe("Evaluate('sum(selec)',0)"))
fila = dw_emp.Find("selec=1",1,dw_emp.RowCount())
if filas > 1 then
	if MessageBox('Atención','Desea calcular los empleados seleccionados?',QUESTION!,YESNO!) = 2 then Return 0
end if
calcula = TRUE
do while fila > 0
	t_com = 0
	dw_emp.ScrolltoRow(fila)
	if cancela then Return 0
	if dw_emp.GetItemString(dw_emp.GetRow(),'tipo') = 'B' then
		if f_calcula_tsup_base(tipodoc,documento,long(ddlb_1.text),long(left(ddlb_2.text,2)),dw_emp.GetItemString(fila,'codtsup')) = -1 then
			calcula = FALSE
			Return -1
		end if
	elseif dw_emp.GetItemString(dw_emp.GetRow(),'tipo') = 'M' or dw_emp.GetItemString(dw_emp.GetRow(),'tipo') = 'H' then
		if f_calcula_tsup_ofic(tipodoc,documento,long(ddlb_1.text),long(left(ddlb_2.text,2)),dw_emp.GetItemString(fila,'codtsup')) = -1 then
			calcula = FALSE
			Return -1
		end if
	elseif dw_emp.GetItemString(dw_emp.GetRow(),'tipo') = 'S' then
		f_ptr = date(long(ddlb_1.text),long(left(ddlb_2.text,2)),1)
		f_ptr = RelativeDate(f_ptr,-1*f_diaNumero(f_ptr) + 1)
		do while String(f_ptr,'yyyy-mm') <= ddlb_1.text + '-' +left(ddlb_2.text,2)
			h_comp = f_calcula_tsup_sem(tipodoc,documento,datetime(f_ptr),dw_emp.GetItemString(fila,'codtsup'),long(left(ddlb_2.text,2)))
			t_com = t_com + h_comp
			if h_comp = -1000 then
				calcula = FALSE
				Return -1
			end if
			f_ptr = RelativeDate(f_ptr, 7)
		loop
		if t_com > 0 then
			if f_tsup_compensa(tipodoc,documento,long(ddlb_1.text),long(left(ddlb_2.text,2)),dw_emp.GetItemString(fila,'codtsup'),t_com) = -1 then
				Return -1
			end if
		end if
	end if
	dw_emp.SetItem(fila,'selec',0)
	fila = dw_emp.Find("selec=1",1,dw_emp.RowCount())
	if mod(fila,5) = 0 then GarbageCollect()
loop

dw_1.retrieve(tipodoc,documento,long(ddlb_1.text),long(left(ddlb_2.text,2)))
calcula = FALSE
Return 0

end event

type ddlb_2 from dropdownlistbox within w_tsup
integer x = 480
integer y = 704
integer width = 521
integer height = 644
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean hscrollbar = true
boolean vscrollbar = true
string item[] = {"01-ENERO","02-FEBRERO","03-MARZO","04-ABRIL","05-MAYO","06-JUNIO","07-JULIO","08-AGOSTO","09-SEPTIEMBRE","10-OCTUBRE","11-NOVIEMBRE","12-DICIEMBRE"}
borderstyle borderstyle = stylelowered!
end type

event constructor;SelectItem(month(today()))

end event

event selectionchanged;dw_1.retrieve(tipodoc,documento,long(ddlb_1.text),long(left(ddlb_2.text,2)))

end event

type ddlb_1 from dropdownlistbox within w_tsup
integer x = 41
integer y = 704
integer width = 370
integer height = 400
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean allowedit = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;long i
for i = 0 to 4
	ddlb_1.AddItem (string(year(today()) - i))
next
ddlb_1.SelectItem(5)

end event

type pb_7 from picturebutton within w_tsup
event mousemove pbm_mousemove
boolean visible = false
integer x = 3611
integer y = 1104
integer width = 146
integer height = 128
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "              &b"
boolean originalsize = true
string picturename = "lupa.gif"
string disabledname = "d_lupa.gif"
string powertiptext = "Buscar (Alt+B)"
end type

event clicked;//open(win_busqueda)
g_tercerodesde=1
openwithparm(w_busca_emp,dw_2)
if not isNull(dw_2.GetItemString(1,'documento')) then
	dw_2.triggerEvent(itemchanged!)
end if

end event

type dw_2 from datawindow within w_tsup
boolean visible = false
integer x = 64
integer width = 2446
integer height = 156
integer taborder = 10
boolean enabled = false
string dataobject = "dw_emple_regla"
boolean border = false
end type

event constructor;settransobject(SQLCA)
insertrow(1)
setColumn(2)
end event

event itemchanged;this.accepttext()
string filtro
tipodoc = this.getitemstring(this.getrow(),'tipodoc')
documento = this.getitemstring(this.getrow(),'documento')
if not isNull(dwo) then
	if string(dwo.Name) <> 'documento' then Return
end if

this.retrieve(tipodoc,documento)
If this.rowcount()=0 THEN
	this.insertrow(0)
	messageBox ("Atención","Empleado no encontrado.")
	this.SetItem(1,'tipodoc',tipodoc)
	this.SetItem(1,'documento',documento)
	this.SetColumn('documento')
Else
	dw_1.retrieve(tipodoc,documento,long(ddlb_1.text),long(left(ddlb_2.text,2)))
End If
end event

type dw_1 from datawindow within w_tsup
integer x = 41
integer y = 824
integer width = 3506
integer height = 808
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_tsup"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

type dw_emp from datawindow within w_tsup
integer x = 41
integer y = 56
integer width = 3776
integer height = 600
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_empact_tsup"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rowfocuschanged;
tipodoc = GetItemString(GetRow(),'tipodoc')
documento = GetItemString(GetRow(),'documento')
if not calcula then
	dw_1.retrieve(tipodoc,documento,long(ddlb_1.text),long(left(ddlb_2.text,2)))
end if

end event

event clicked;if dwo.name = 'selec_t' then
	long i
	if describe("selec_t.Text") = 'Selec.' then
		for i = 1 to RowCount()
			SetItem(i,'selec',1)
		next
		Modify("selec_t.Text='Desel.'")
	else
		for i = 1 to RowCount()
			SetItem(i,'selec',0)
		next
		Modify("selec_t.Text='Selec.'")
	end if
end if
if row < 1 then Return 0

if GetRow() <> row then SetRow(row)

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

