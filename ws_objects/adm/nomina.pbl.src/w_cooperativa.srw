$PBExportHeader$w_cooperativa.srw
forward
global type w_cooperativa from w_center
end type
type dw_cab from datawindow within w_cooperativa
end type
type dw_cooperativa from datawindow within w_cooperativa
end type
type tab_1 from tab within w_cooperativa
end type
type p_1 from userobject within tab_1
end type
type pb_anulapl from picturebutton within p_1
end type
type pb_3 from picturebutton within p_1
end type
type dw_plan from datawindow within p_1
end type
type p_1 from userobject within tab_1
pb_anulapl pb_anulapl
pb_3 pb_3
dw_plan dw_plan
end type
type p_2 from userobject within tab_1
end type
type pb_8 from picturebutton within p_2
end type
type pb_7 from picturebutton within p_2
end type
type pb_6 from picturebutton within p_2
end type
type pb_2 from picturebutton within p_2
end type
type st_1 from statictext within p_2
end type
type dw_cpo from datawindow within p_2
end type
type p_2 from userobject within tab_1
pb_8 pb_8
pb_7 pb_7
pb_6 pb_6
pb_2 pb_2
st_1 st_1
dw_cpo dw_cpo
end type
type tab_1 from tab within w_cooperativa
p_1 p_1
p_2 p_2
end type
type pb_1 from picturebutton within w_cooperativa
end type
type pb_cancelar from picturebutton within w_cooperativa
end type
type pb_anular from picturebutton within w_cooperativa
end type
type pb_4 from picturebutton within w_cooperativa
end type
type st_2 from statictext within w_cooperativa
end type
type pb_5 from picturebutton within w_cooperativa
end type
type pb_9 from picturebutton within w_cooperativa
end type
type pb_10 from picturebutton within w_cooperativa
end type
end forward

global type w_cooperativa from w_center
string tag = "Realizó cambios. Desea guardarlos?"
integer width = 5211
integer height = 1992
string title = "Préstamos"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_prestamo.ico"
boolean center = false
dw_cab dw_cab
dw_cooperativa dw_cooperativa
tab_1 tab_1
pb_1 pb_1
pb_cancelar pb_cancelar
pb_anular pb_anular
pb_4 pb_4
st_2 st_2
pb_5 pb_5
pb_9 pb_9
pb_10 pb_10
end type
global w_cooperativa w_cooperativa

type variables
string codDocumento,estado
long nuevo, nuevo_plan
datawindowchild idw_tercer
end variables

forward prototypes
public function integer addcuotas (integer cuotas, date inicio, double valor)
public function integer grabar ()
end prototypes

public function integer addcuotas (integer cuotas, date inicio, double valor);date fecha
int i, fila, mes, dia,anyo
anyo=year(inicio)
mes=month(inicio)
for i = 1 to cuotas
	fila = tab_1.p_2.dw_cpo.InsertRow(0)
	tab_1.p_2.dw_cpo.SetItem(fila,'num_prescoopera',tab_1.p_1.dw_plan.GetItemNumber(tab_1.p_1.dw_plan.GetRow(),'num_prescoopera'))
	tab_1.p_2.dw_cpo.SetItem(fila,'num_plan',tab_1.p_1.dw_plan.GetItemNumber(tab_1.p_1.dw_plan.GetRow(),'num_plan'))
	tab_1.p_2.dw_cpo.SetItem(fila,'ncuota',i)
	if mes>12 then
	  mes=1
	  anyo++
   end if
	fecha = date(anyo, mes, day(inicio))
	dia = 1
	do while fecha = date("1900-01-01")
		fecha = date(year(inicio)+integer((month(inicio) - 1 + i)/12), mes, day(inicio) - dia)
		dia++
	loop
	tab_1.p_2.dw_cpo.SetItem(fila,'fecha',fecha)
	tab_1.p_2.dw_cpo.SetItem(fila,'estado','0')
	tab_1.p_2.dw_cpo.SetItem(fila,'valor',valor)
	mes++
next
Return 0

end function

public function integer grabar ();Return pb_grabar.TriggerEvent(clicked!)
end function

on w_cooperativa.create
int iCurrent
call super::create
this.dw_cab=create dw_cab
this.dw_cooperativa=create dw_cooperativa
this.tab_1=create tab_1
this.pb_1=create pb_1
this.pb_cancelar=create pb_cancelar
this.pb_anular=create pb_anular
this.pb_4=create pb_4
this.st_2=create st_2
this.pb_5=create pb_5
this.pb_9=create pb_9
this.pb_10=create pb_10
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_cab
this.Control[iCurrent+2]=this.dw_cooperativa
this.Control[iCurrent+3]=this.tab_1
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.pb_cancelar
this.Control[iCurrent+6]=this.pb_anular
this.Control[iCurrent+7]=this.pb_4
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.pb_5
this.Control[iCurrent+10]=this.pb_9
this.Control[iCurrent+11]=this.pb_10
end on

on w_cooperativa.destroy
call super::destroy
destroy(this.dw_cab)
destroy(this.dw_cooperativa)
destroy(this.tab_1)
destroy(this.pb_1)
destroy(this.pb_cancelar)
destroy(this.pb_anular)
destroy(this.pb_4)
destroy(this.st_2)
destroy(this.pb_5)
destroy(this.pb_9)
destroy(this.pb_10)
end on

event open;call super::open;codDocumento = 'PC' // Prestamo cooperativa
dw_cooperativa.SetTransObject(SQLCA)
dw_cab.SetTransObject(SQLCA)
tab_1.p_1.dw_plan.SetTransObject(SQLCA)
tab_1.p_2.dw_cpo.SetTransObject(SQLCA)
dw_cooperativa.InsertRow(0)
dw_cooperativa.GetItemString(dw_cooperativa.GetRow(),'documento')
nuevo = 0
nuevo_plan = 0
end event

event resize;call super::resize;//
end event

type pb_grabar from w_center`pb_grabar within w_cooperativa
integer x = 2007
integer y = 1680
string powertiptext = "Guardar"
end type

event pb_grabar::clicked;call super::clicked;long fila, numdoc, inicial, final, i
if dw_cab.RowCount() = 0 then Return 0
//if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then Return 0
if nuevo > 0 then
	if isNull(dw_cab.GetItemString(nuevo,'cod_concep')) then
		messageBox('Error','Debe seleccionar un concepto de préstamo para llevar a nómina')
		Return -1
	end if
	if isNull(dw_cab.GetItemString(nuevo,'documento')) then
		messageBox('Error','Debe seleccionar un empleado')
		Return -1
	end if
	if tab_1.p_1.dw_plan.RowCount() = 0 then
		messageBox('Error','Debe crear un plan')
		Return -1
	end if
	if tab_1.p_2.dw_cpo.RowCount() = 0 then
		messageBox('Error','Debe adicionar cuotas a descontar')
		Return -1
	end if
	numdoc = f_trae_ndoc(codDocumento,clugar,'Préstamos de Cooperativa')
	
	dw_cab.setItem(nuevo,'num_prescoopera', numdoc)
	dw_cab.setItem(nuevo,'estado', '1')
	for i = 1 to tab_1.p_1.dw_plan.RowCount()
		tab_1.p_1.dw_plan.SetItem(i,'num_prescoopera',numdoc)
	Next
	for i = 1 to tab_1.p_2.dw_cpo.RowCount()
		tab_1.p_2.dw_cpo.SetItem(i,'num_prescoopera',numdoc)
	Next
	estado = '1'
end if
if isNull(estado) or estado = ''then Return 0
dw_cab.SetItem(dw_cab.Getrow(),'estado',estado)
if dw_cab.update() = -1 then
	rollback;
	Return -1
end if
fila = tab_1.p_1.dw_plan.find("estado = '0'",1,tab_1.p_1.dw_plan.RowCount())
if fila > 0 then
	tab_1.p_1.dw_plan.SetItem(fila,'estado','1')
end if
if tab_1.p_1.dw_plan.update() = -1 then
	rollback;
	Return -1
end if
if tab_1.p_2.dw_cpo.update() = -1 then
	rollback;
	Return -1
end if
nuevo = 0
nuevo_plan = 0
cambio = FALSE
commit;
dw_cab.TriggerEvent(rowFocusChanged!)
Return 0

end event

type dw_cab from datawindow within w_cooperativa
event desecha ( )
integer x = 41
integer y = 192
integer width = 5061
integer height = 472
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_coopresta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event desecha();if nuevo > 0 then
	this.DeleteRow(nuevo)
	nuevo = 0
end if

end event

event rowfocuschanged;tab_1.p_1.dw_plan.Reset()
if this.RowCount() < 1 or currentrow = 0 then Return
tab_1.p_1.dw_plan.Retrieve(this.GetItemNumber(this.GetRow(),'num_prescoopera'))

end event

event rowfocuschanging;if currentRow = nuevo and nuevo > 0 then 
	if messageBox('Aviso','El documento nuevo no ha sido guardado, perderá los cambios. Desea continuar?',QUESTION!,YESNO!) = 2 then
		return -1
	else
		this.PostEvent("desecha")
	end if
end if

end event

event itemchanged;if getColumnName() = "documento" then
	string n1,n2,a1,a2,rs,td,doc,per
	td = GetItemString(GetRow(),'tipodoc')
	if isNull(data) then
		doc = GetItemString(GetRow(),'documento')
	else
		doc = data
	end if
	select nombre1,nombre2,apellido1,apellido2,razon_social,persona into :n1,:n2,:a1,:a2,:rs,:per
	from terceros where tipodoc=:td and documento=:doc;
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return 1
	elseif SQLCA.SQLCode = 100 THEN
		MessageBox('Atención','El tercero no existe.')
		Return -1
	END IF
	SetItem(GetRow(),'nombre1',n1)
	SetItem(GetRow(),'nombre2',n2)
	SetItem(GetRow(),'apellido1',a1)
	SetItem(GetRow(),'apellido2',a2)
	SetItem(GetRow(),'razon_social',rs)
end if

end event

event clicked;if row < 1 then Return 0
if row <> getRow() then
	ScrolltoRow(row)
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event constructor;getchild('cod_concep',idw_tercer)
idw_tercer.SetTransObject(SQLCA)
end event

type dw_cooperativa from datawindow within w_cooperativa
integer x = 41
integer y = 84
integer width = 1678
integer height = 72
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cooperativa"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;dw_cab.Reset()
dw_cab.Retrieve('NI',data)

idw_tercer.retrieve(data)

end event

type tab_1 from tab within w_cooperativa
integer x = 32
integer y = 676
integer width = 5010
integer height = 992
integer taborder = 30
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
p_1 p_1
p_2 p_2
end type

on tab_1.create
this.p_1=create p_1
this.p_2=create p_2
this.Control[]={this.p_1,&
this.p_2}
end on

on tab_1.destroy
destroy(this.p_1)
destroy(this.p_2)
end on

event selectionchanging;if oldindex = 1 then
	if p_1.dw_plan.AcceptText() = -1 then Return -1
elseif oldindex = 2 then
	if p_2.dw_cpo.AcceptText() = -1 then Return -1
end if

end event

type p_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4974
integer height = 864
long backcolor = 67108864
string text = "Plan"
long tabtextcolor = 33554432
string picturename = "abono.ico"
long picturemaskcolor = 536870912
pb_anulapl pb_anulapl
pb_3 pb_3
dw_plan dw_plan
end type

on p_1.create
this.pb_anulapl=create pb_anulapl
this.pb_3=create pb_3
this.dw_plan=create dw_plan
this.Control[]={this.pb_anulapl,&
this.pb_3,&
this.dw_plan}
end on

on p_1.destroy
destroy(this.pb_anulapl)
destroy(this.pb_3)
destroy(this.dw_plan)
end on

type pb_anulapl from picturebutton within p_1
event mousemove pbm_mousemove
string tag = "An&ula Plan"
integer x = 2875
integer y = 208
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $u"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "An&ula Plan"
end type

event clicked;if dw_cab.RowCount() < 1 then Return
if integer(dw_cab.GetItemString(dw_cab.getRow(),'estado')) > 0 then
	messageBox("Aviso","El prestamo ya ha sido cerrado")
	Return
end if
if dw_plan.RowCount() < 1 then Return
if integer(dw_plan.GetItemString(dw_plan.getRow(),'estado')) > 0 then
	messageBox("Aviso","El plan ya ha sido cerrado")
	Return
end if
if nuevo_plan > 0 and dw_plan.GetRow() = nuevo_plan then
	dw_plan.DeleteRow(nuevo_plan)
	nuevo_plan = 0
	dw_plan.triggerevent(rowfocuschanged!)
	Return 0
end if

dw_plan.SetItem(dw_plan.GetRow(),'estado','2')
dw_plan.SetItem(dw_plan.GetRow(),'usuario',usuario)
dw_plan.SetItem(dw_plan.GetRow(),'fecha_anulada',today())
cambio = TRUE

end event

type pb_3 from picturebutton within p_1
event mousemove pbm_mousemove
string tag = "&Insertar"
integer x = 2875
integer y = 80
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $I"
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "&Insertar"
end type

event clicked;if dw_cab.RowCount() < 1 then Return
if integer(dw_cab.GetItemString(dw_cab.getRow(),'estado')) > 1 then
	messageBox("Aviso","El prestamo ya ha sido cerrado")
	Return
end if
string valor
long fila
fila = dw_plan.Find("estado = '1'",1,dw_plan.RowCount())
if fila > 0 then
	if messageBox('Aviso','Existe un plan de pago activo. Desea cerrarlo y crear otro?',QUESTION!, YESNO!) = 2 then
		Return
	end if
	dw_plan.SetItem(fila,'estado','3')
end if
if tab_1.p_2.dw_cpo.DeletedCount() > 0 or tab_1.p_2.dw_cpo.ModifiedCount() > 0 then
	if MessageBox('Atención','Ha modificado las cuotas, si continua perderá los cambios. Desea continuar?',QUESTION!,YesNo!,2) = 2 then Return -1
	tab_1.p_2.dw_cpo.Reset()
end if

valor = dw_plan.describe("Evaluate('max(num_plan)', 1)")
dw_plan.InsertRow(1)
dw_plan.SetItem(1,'num_prescoopera',dw_cab.GetItemNumber(dw_cab.GetRow(),'num_prescoopera'))
dw_plan.SetItem(1,'num_plan', long(valor) + 1)
dw_plan.SetItem(1,'fecha', Today())
dw_plan.SetItem(1,'inicia', Today())
dw_plan.SetItem(1,'estado', '0')
dw_plan.ScrolltoRow(1)
dw_plan.TriggerEvent(RowFocusChanged!)
nuevo_plan = 1
cambio = TRUE

end event

type dw_plan from datawindow within p_1
integer x = 46
integer y = 36
integer width = 2798
integer height = 736
integer taborder = 30
string title = "none"
string dataobject = "dw_coopresta_plan"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;tab_1.p_2.dw_cpo.Reset()
if this.RowCount() < 1 then Return
tab_1.p_2.dw_cpo.Retrieve(this.GetItemNumber(this.GetRow(),'num_prescoopera'),this.GetItemNumber(this.GetRow(),'num_plan'))

end event

event rowfocuschanging;if tab_1.p_2.dw_cpo.DeletedCount() > 0 or tab_1.p_2.dw_cpo.ModifiedCount() > 0 then
	if MessageBox('Atención','Ha modificado las cuotas, si continua perderá los cambios. Desea continuar?',QUESTION!,YesNo!,2) = 2 then Return -1
end if

end event

type p_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4974
integer height = 864
long backcolor = 67108864
string text = "Cuotas"
long tabtextcolor = 33554432
string picturename = "asig_cita.ico"
long picturemaskcolor = 536870912
pb_8 pb_8
pb_7 pb_7
pb_6 pb_6
pb_2 pb_2
st_1 st_1
dw_cpo dw_cpo
end type

on p_2.create
this.pb_8=create pb_8
this.pb_7=create pb_7
this.pb_6=create pb_6
this.pb_2=create pb_2
this.st_1=create st_1
this.dw_cpo=create dw_cpo
this.Control[]={this.pb_8,&
this.pb_7,&
this.pb_6,&
this.pb_2,&
this.st_1,&
this.dw_cpo}
end on

on p_2.destroy
destroy(this.pb_8)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.pb_2)
destroy(this.st_1)
destroy(this.dw_cpo)
end on

type pb_8 from picturebutton within p_2
event mousemove pbm_mousemove
integer x = 3502
integer y = 428
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
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar plan de cuotas"
end type

event clicked;if not dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '1' then 
	messageBox('Atención','Solo documentos activos que se le quieran agregar cuotas')
	Return -1
end if

if dw_cpo.Update() = -1 then
	Rollback;
	Return -1
end if

end event

type pb_7 from picturebutton within p_2
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 3502
integer y = 300
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Eliminar documento Nuevo"
end type

event clicked;if dw_cpo.RowCount() = 0 then Return

if dw_cpo.GetItemString(dw_cpo.GetRow(),'estado_cb') = '0' then
	dw_cpo.DeleteRow(dw_cpo.GetRow())
else
	MessageBox('Atención','Solo se eliminan cuotas en estado nuevo')
end if

end event

type pb_6 from picturebutton within p_2
event mousemove pbm_mousemove
string tag = "Nuevo &Documento"
integer x = 3502
integer y = 168
integer width = 146
integer height = 128
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $d"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
long fila
string valor

fila = tab_1.p_2.dw_cpo.InsertRow(0)
valor = tab_1.p_2.dw_cpo.Describe("Evaluate('max(ncuota)',0)")
tab_1.p_2.dw_cpo.SetItem(fila,'num_prescoopera',tab_1.p_1.dw_plan.GetItemNumber(tab_1.p_1.dw_plan.GetRow(),'num_prescoopera'))
tab_1.p_2.dw_cpo.SetItem(fila,'num_plan',tab_1.p_1.dw_plan.GetItemNumber(tab_1.p_1.dw_plan.GetRow(),'num_plan'))
tab_1.p_2.dw_cpo.SetItem(fila,'ncuota',long(valor) + 1)
tab_1.p_2.dw_cpo.SetItem(fila,'fecha',today())
tab_1.p_2.dw_cpo.SetItem(fila,'estado','0')
tab_1.p_2.dw_cpo.SetItem(fila,'estado_cb','0')

end event

type pb_2 from picturebutton within p_2
event mousemove pbm_mousemove
string tag = "&Sugerir Plan"
integer x = 3502
integer y = 36
integer width = 151
integer height = 132
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $S"
boolean originalsize = true
string picturename = "calculator.gif"
string disabledname = "d_calculator.gif"
string powertiptext = "&Sugerir Plan"
end type

event clicked;if tab_1.p_1.dw_plan.RowCount() > 0 then
	openwithparm(w_calcuota,tab_1.p_1.dw_plan)
	cambio = TRUE
end if

end event

type st_1 from statictext within p_2
integer x = 3744
integer y = 36
integer width = 1184
integer height = 500
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "Area de Cuotas. Pueden revisarse cada una de las cuotas de las que está compuesta el plan y si han sido pagadas, aparecerá el número de nómina, el concepto y su item correspondiente."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_cpo from datawindow within p_2
integer x = 23
integer y = 28
integer width = 3419
integer height = 812
integer taborder = 40
string title = "none"
string dataobject = "dw_coopresta_cpo"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_1 from picturebutton within w_cooperativa
event mousemove pbm_mousemove
string tag = "Nuevo &Documento"
integer x = 1947
integer y = 44
integer width = 146
integer height = 128
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $d"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
end type

event clicked;long fila, numdoc, inicial, final
if nuevo > 0 then 
	if messageBox('Aviso','Existe un documento sin grabar.Desea Grabarlo y crear uno nuevo?',QUESTION!,YESNO!) = 1 then
		pb_grabar.TriggerEvent(clicked!)
	else
		Return
	end if
end if
fila = dw_cab.InsertRow(1)
dw_cab.setItem(fila,'fecha', today())
dw_cab.setItem(fila,'doc_tercero', "NI")
dw_cab.setItem(fila,'nit', dw_cooperativa.GetITemString(1,'documento'))
dw_cab.setItem(fila,'estado', '0')
dw_cab.scrolltoRow(fila)
nuevo = fila
cambio = TRUE
tab_1.p_1.dw_plan.Reset()
tab_1.p_2.dw_cpo.Reset()

end event

type pb_cancelar from picturebutton within w_cooperativa
event mousemove pbm_mousemove
string tag = "&Cerrar"
integer x = 1714
integer y = 1680
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $C"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
string powertiptext = "&Cerrar"
end type

event clicked;close(parent)
end event

type pb_anular from picturebutton within w_cooperativa
event mousemove pbm_mousemove
string tag = "&Anular Préstamo"
integer x = 1861
integer y = 1680
integer width = 146
integer height = 128
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $A"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "&Anular Préstamo"
end type

event clicked;if dw_cab.RowCount() < 1 then Return

if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '1' then
	messagebox('Error','El préstamo ya ha sido liquidado')
	Return
end if

long filas
double nd
nd = dw_cab.GetItemNumber(dw_cab.GetRow(),'num_prescoopera')
select count(*) into :filas from nom_coope_plan_cp 
where num_prescoopera=:nd and num_nomina > 0;
IF SQLCA.SQLCode = -1 THEN
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return
else
	if filas > 0 then
		messagebox('Error','Se han cancelado cuotas para el préstamo. Deberá crear otro plan')
		Return
	end if
END IF

if nuevo > 0 then
	pb_4.TriggerEvent(clicked!)
	Return
end if
	
dw_cab.SetItem(dw_cab.GetRow(),'estado','2')
dw_cab.SetItem(dw_cab.GetRow(),'usuario',usuario)
dw_cab.SetItem(dw_cab.GetRow(),'fecha_anulada',today())
if dw_cab.Update() = -1 then
	rollback;
end if
commit;

end event

type pb_4 from picturebutton within w_cooperativa
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 2094
integer y = 44
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Eliminar documento Nuevo"
end type

event clicked;if nuevo > 0 and dw_cab.GetRow() = nuevo then
	dw_cab.DeleteRow(nuevo)
	nuevo = 0
	dw_cab.triggerevent(rowfocuschanged!)
end if

end event

type st_2 from statictext within w_cooperativa
integer x = 41
integer y = 20
integer width = 375
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
string text = "Cooperativa"
boolean focusrectangle = false
end type

type pb_5 from picturebutton within w_cooperativa
event mousemove pbm_mousemove
string tag = "Nuevo &Documento"
integer x = 2235
integer y = 44
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
string text = "                $E"
boolean originalsize = true
string picturename = "medico.gif"
string powertiptext = "Buscar &Empleado"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
string vnul
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') =  '0' then
	setNull(vnul)
	if nuevo = 0 then Return
	g_tercerodesde=12
	openwithparm(w_buscater,dw_cab)
	if dw_cab.GetItemString(dw_cab.GetRow(),'persona') = "J" then 
		messageBox("Error","Solo personas Naturales")
		dw_cab.SetItem(dw_cab.GetRow(),'tipodoc',vnul)
		dw_cab.SetItem(dw_cab.GetRow(),'documento',vnul)
		Return
	end if
else
	MessageBox('Aviso','Solo para documentos nuevos')
end if

end event

type pb_9 from picturebutton within w_cooperativa
event mousemove pbm_mousemove
string tag = "Cerrar Documento Ahorro"
integer x = 2153
integer y = 1680
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
string picturename = "abrir2.gif"
alignment htextalign = left!
string powertiptext = "Desactivar Documento Préstamo"
end type

event clicked;if dw_cab.RowCount() > 0 then
	if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '1' then
		if messageBox('Aviso','Se desactivará el documento y no se tendrá en cuenta para la Nómina. Desea continuar?',QUESTION!,YESNO!,2) = 1 then
			estado = '3'
			cambio = TRUE
			pb_grabar.PostEvent(clicked!)
		end if
	end if
end if

end event

type pb_10 from picturebutton within w_cooperativa
event mousemove pbm_mousemove
string tag = "Cerrar Documento Ahorro"
integer x = 2299
integer y = 1680
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
string picturename = "cerrar.gif"
alignment htextalign = left!
string powertiptext = "Activar Documento Préstamo"
end type

event clicked;if dw_cab.RowCount() > 0 then
	if isNull(dw_cab.GetItemString(dw_cab.GetRow(),'estado')) or dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '3' or dw_cab.GetItemString(dw_cab.GetRow(),'estado') = ''  then
		if messageBox('Aviso','Se activará el documento y se tendrá en cuenta para la Nómina. Desea continuar?',QUESTION!,YESNO!,2) = 1 then
			estado = '1'
			cambio = TRUE
			pb_grabar.PostEvent(clicked!)
		end if
	end if
end if

end event

