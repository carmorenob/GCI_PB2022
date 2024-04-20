$PBExportHeader$w_vig_per.srw
$PBExportComments$Configuracion Vigencias y Periodos
forward
global type w_vig_per from w_center
end type
type dw_p from datawindow within w_vig_per
end type
type st_1 from statictext within w_vig_per
end type
type pb_3 from picturebutton within w_vig_per
end type
type pb_4 from picturebutton within w_vig_per
end type
type pb_5 from picturebutton within w_vig_per
end type
type pb_6 from picturebutton within w_vig_per
end type
type st_2 from statictext within w_vig_per
end type
type pb_7 from picturebutton within w_vig_per
end type
type pb_8 from picturebutton within w_vig_per
end type
type hpb_1 from hprogressbar within w_vig_per
end type
type tab_1 from tab within w_vig_per
end type
type tabpage_1 from userobject within tab_1
end type
type pb_2 from picturebutton within tabpage_1
end type
type pb_1 from picturebutton within tabpage_1
end type
type dw_v from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
pb_2 pb_2
pb_1 pb_1
dw_v dw_v
end type
type tab_1 from tab within w_vig_per
tabpage_1 tabpage_1
end type
type gb_1 from groupbox within w_vig_per
end type
end forward

global type w_vig_per from w_center
string tag = "Desea Guardarlos?"
integer width = 5029
integer height = 2108
string title = "Presupuesto - Vigencias y Periodos "
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_vigencia.ico"
dw_p dw_p
st_1 st_1
pb_3 pb_3
pb_4 pb_4
pb_5 pb_5
pb_6 pb_6
st_2 st_2
pb_7 pb_7
pb_8 pb_8
hpb_1 hpb_1
tab_1 tab_1
gb_1 gb_1
end type
global w_vig_per w_vig_per

type variables
long nuevo
boolean cambia
datawindow dw
end variables

on w_vig_per.create
int iCurrent
call super::create
this.dw_p=create dw_p
this.st_1=create st_1
this.pb_3=create pb_3
this.pb_4=create pb_4
this.pb_5=create pb_5
this.pb_6=create pb_6
this.st_2=create st_2
this.pb_7=create pb_7
this.pb_8=create pb_8
this.hpb_1=create hpb_1
this.tab_1=create tab_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_p
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.pb_3
this.Control[iCurrent+4]=this.pb_4
this.Control[iCurrent+5]=this.pb_5
this.Control[iCurrent+6]=this.pb_6
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.pb_7
this.Control[iCurrent+9]=this.pb_8
this.Control[iCurrent+10]=this.hpb_1
this.Control[iCurrent+11]=this.tab_1
this.Control[iCurrent+12]=this.gb_1
end on

on w_vig_per.destroy
call super::destroy
destroy(this.dw_p)
destroy(this.st_1)
destroy(this.pb_3)
destroy(this.pb_4)
destroy(this.pb_5)
destroy(this.pb_6)
destroy(this.st_2)
destroy(this.pb_7)
destroy(this.pb_8)
destroy(this.hpb_1)
destroy(this.tab_1)
destroy(this.gb_1)
end on

event open;call super::open;tab_1.tabpage_1.dw_v.SetTransObject(SQLCA)
dw_p.SetTransObject(SQLCA)
tab_1.tabpage_1.dw_v.Retrieve()
nuevo = 0

end event

event closequery;call super::closequery;if cambia then
	int rta
	rta = messageBox('Aviso','Se han hecho cambio en los periodos. Desea salvar los cambios?',QUESTION!,YESNOCANCEL!)
	if rta = 1 then 
		pb_grabar.triggerEvent(clicked!)
	elseif rta = 2 then
		cambia = FALSE
		Return
	elseif rta = 3 then 
		Return -1
	end if
end if

end event

type pb_grabar from w_center`pb_grabar within w_vig_per
integer x = 1938
integer y = 1860
string powertiptext = "&Guardar"
end type

event pb_grabar::clicked;call super::clicked;if tab_1.tabpage_1.dw_v.AcceptText() = -1 then Return
if dw_p.AcceptText() = -1 then Return

uo_DataStore dw_plan
dw_plan = Create uo_DataStore
dw_plan.DataObject = 'dw_plan_ppto'
dw_plan.SetTransObject(SQLCA)

long i, j, fila
for i = 1 to dw_p.RowCount()
	if dw_p.GetItemDateTime(i,'inicia') > dw_p.GetItemDateTime(i,'termina') then
		messageBox('Error','La fecha de Inicio debe ser menor que Fecha Terminación para el periodo ' + string(dw_p.GetItemNumber(i,'periodo')))
		Return -1
	end if
next
if nuevo > 0 then
	for i = 1 to tab_1.tabpage_1.dw_v.RowCount()
		if tab_1.tabpage_1.dw_v.GetItemString(i,'estado') = '0' then
			tab_1.tabpage_1.dw_v.SetItem(i,'estado','1')
		end if
	next
	tab_1.tabpage_1.dw_v.SetItem(nuevo,'estado','0')
end if

for i = 1 to dw_p.RowCount()
	if dw_p.GetItemString(i,'estado') = 'N' then
		dw_p.SetItem(i,'estado','1')
	end if
next

if tab_1.tabpage_1.dw_v.Update() = -1 then 
	Rollback;
	Return -1
end if

if dw_p.Update() = -1 then 
	Rollback;
	Return -1
end if

string valor
valor=string(tab_1.tabpage_1.dw_v.GetItemNumber(tab_1.tabpage_1.dw_v.GetRow(),'cod_vigencia'))

if nuevo > 0 then	
	INSERT INTO pre_consecs ( cod_vigencia, CodDoc, clugar, consecutivo )
	SELECT :valor,coddoc,:clugar,0 FROM documentos_gral
	WHERE (((documentos_gral.codmodulo)='PRE'));
	if sqlca.sqlcode=-1 then
		messagebox("Error insertando Pre_consec",sqlca.sqlerrtext)
		rollback;
		return
	end if
End If
nuevo = 0
cambia = false
commit;
Return 0

end event

type dw_p from datawindow within w_vig_per
integer x = 46
integer y = 812
integer width = 3616
integer height = 952
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_periodo_totales"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;datetime fecha

if this.GetColumnName() = 'inicia' then
	fecha = this.GetItemDateTime(this.GetRow(),'inicia')
elseif this.GetColumnName() = 'termina' then
	fecha = this.GetItemDateTime(this.GetRow(),'termina')
end if

if this.AcceptText() = -1 then Return
choose case this.GetColumnName()
	case "inicia"
		if this.GetItemDateTime(this.GetRow(),'inicia') < tab_1.tabpage_1.dw_v.GetItemDateTime(tab_1.tabpage_1.dw_v.GetRow(),'inicia') or this.GetItemDateTime(this.GetRow(),'inicia') > tab_1.tabpage_1.dw_v.GetItemDateTime(tab_1.tabpage_1.dw_v.GetRow(),'termina') then
			messageBox('Error','La fecha Inicio debe estar dentro del periodo de VIGENCIA')
			this.SetItem(this.GetRow(),'inicia',fecha)
			this.SetText(string(fecha))
			Return 2
		end if
	case "termina"
		if this.GetItemDateTime(this.GetRow(),'termina') < tab_1.tabpage_1.dw_v.GetItemDateTime(tab_1.tabpage_1.dw_v.GetRow(),'inicia') or this.GetItemDateTime(this.GetRow(),'termina') > tab_1.tabpage_1.dw_v.GetItemDateTime(tab_1.tabpage_1.dw_v.GetRow(),'termina') then
			messageBox('Error','La fecha Terminación debe estar dentro del periodo de VIGENCIA')
			this.SetItem(this.GetRow(),'termina',fecha)
			this.SetText(string(fecha))
			Return 2
		end if	
end choose
cambia = true

end event

type st_1 from statictext within w_vig_per
integer x = 3968
integer y = 1196
integer width = 402
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
string text = "none"
boolean focusrectangle = false
end type

type pb_3 from picturebutton within w_vig_per
event mousemove pbm_mousemove
string tag = "Insertar Periodo"
integer x = 3707
integer y = 820
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
boolean originalsize = true
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Periodo"
end type

event clicked;if tab_1.tabpage_1.dw_v.RowCount() < 1 then Return
long valor,fila,anom
string fecha
date inicio
datetime fin

fecha=string(date(dw_p.getitemdatetime(1,'maxt')))
if isnull(fecha)  or fecha='??/??/????' then 
	inicio=date(tab_1.tabpage_1.dw_v.GetItemdatetime(tab_1.tabpage_1.dw_v.GetRow(),'inicia'))
else
	inicio=relativedate(date(fecha),1)
end if
if datetime(inicio) > tab_1.tabpage_1.dw_v.GetItemdatetime(tab_1.tabpage_1.dw_v.GetRow(),'termina') then
	messagebox('Atención','Periodo es mayor que la fecha de Terminación de la Vigencia')
	return
end if
if month(inicio)+1>12 then
	anom = year(inicio)+1
	fecha=string('01/01'+'/'+string(anom))
else
	anom = year(inicio)
	fecha=string('01/'+string(month(inicio)+1)+'/'+string(anom))
end if
anom=year(inicio)
valor=month(inicio)
fin=datetime(relativedate(date(fecha),-1),time('23:59:00'))
if datetime(fin) > tab_1.tabpage_1.dw_v.GetItemdatetime(tab_1.tabpage_1.dw_v.GetRow(),'termina') then
	fin=datetime(date(tab_1.tabpage_1.dw_v.GetItemdatetime(tab_1.tabpage_1.dw_v.GetRow(),'termina')),time('23:59:00'))
end if

fila = dw_p.InsertRow(0)
dw_p.scrolltoRow(fila)
dw_p.SetItem(fila,'cod_vigencia',tab_1.tabpage_1.dw_v.GetItemNumber(tab_1.tabpage_1.dw_v.GetRow(),'cod_vigencia'))
dw_p.SetItem(fila,'ano',anom)
dw_p.SetItem(fila,'periodo',valor)
dw_p.SetItem(fila,'inicia',inicio)
dw_p.SetItem(fila,'termina',fin)
dw_p.SetItem(fila,'estado','N')
dw_p.SetItem(fila,'descripcion',dw_p.getitemstring(fila,'mes'))
cambia = true
end event

type pb_4 from picturebutton within w_vig_per
event mousemove pbm_mousemove
string tag = "Borrar Periodo"
integer x = 3707
integer y = 948
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
string powertiptext = "Borrar Periodo"
end type

event clicked;if dw_p.RowCount() < 1 then Return

if dw_p.GetItemString(dw_p.getRow(),'estado') <> 'N' then
	messageBox('Error','No puede borrarse. Unicamente periodos nuevos')
	Return
end if

dw_p.DeleteRow(0)
cambia = true

end event

type pb_5 from picturebutton within w_vig_per
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 1623
integer y = 1860
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
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_6 from picturebutton within w_vig_per
event mousemove pbm_mousemove
string tag = "Anular Documento"
integer x = 1778
integer y = 1860
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
string picturename = "anulardoc.gif"
string disabledname = "d_anulardoc.gif"
alignment htextalign = left!
string powertiptext = "Anular Documento"
end type

event clicked;if tab_1.tabpage_1.dw_v.RowCount() = 0 then Return
if tab_1.tabpage_1.dw_v.GetItemString(tab_1.tabpage_1.dw_v.GetRow(),'Estado') <> '0' then
	messageBox('Aviso','El documento ya ha sido cerrado. No puede modificarse')
	Return
end if
if nuevo > 0 then
	tab_1.tabpage_1.pb_2.triggerEvent(clicked!)
	Return
end if
tab_1.tabpage_1.dw_v.SetItem(tab_1.tabpage_1.dw_v.GetRow(),'Estado','2')
tab_1.tabpage_1.dw_v.SetItem(tab_1.tabpage_1.dw_v.GetRow(),'usuario',usuario)
tab_1.tabpage_1.dw_v.SetItem(tab_1.tabpage_1.dw_v.GetRow(),'fecha_Anula',today())
if tab_1.tabpage_1.dw_v.Update() = 1 then
	commit;
else
	rollback;
end if

end event

type st_2 from statictext within w_vig_per
integer x = 3959
integer y = 768
integer width = 960
integer height = 416
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "Navegue con los botones de desplazamiento por las Vigencias. Podrá ver los periodos por cada una de ellas en la grilla de Periodos. Al Crear una vigencia, esta se establecerá Activa. "
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_7 from picturebutton within w_vig_per
event mousemove pbm_mousemove
string tag = "Cerrar Periodo"
integer x = 3707
integer y = 1216
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
string powertiptext = "Cerrar Periodo"
end type

event clicked;if dw_p.RowCount() < 1 then Return

if dw_p.GetItemString(dw_p.getRow(),'estado') = '1' then
	dw_p.SetItem(dw_p.getRow(),'estado','2')
	cambia = true
end if

end event

type pb_8 from picturebutton within w_vig_per
event mousemove pbm_mousemove
string tag = "Activar Periodo"
integer x = 3707
integer y = 1080
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
string picturename = "abrir2.GIF"
alignment htextalign = left!
string powertiptext = "Activar Periodo"
end type

event clicked;if dw_p.RowCount() < 1 then Return
long fila, filaant
filaant = dw_p.GetRow()

if dw_p.GetItemString(filaant,'estado') = '0' then
	fila = dw_p.Find("estado='1'",1,dw_p.RowCount())
	if fila > 0 and fila <> dw_p.GetRow() then
		dw_p.ScrolltoRow(fila)
		pb_7.TriggerEvent(clicked!)
	end if
	dw_p.SetItem(filaant,'estado','1')
	cambia = true
else
	messageBox('Aviso','Para activarlo, el periodo debe estar Inactivo')
end if

end event

type hpb_1 from hprogressbar within w_vig_per
boolean visible = false
integer x = 78
integer y = 1864
integer width = 1390
integer height = 68
boolean bringtotop = true
unsignedinteger minposition = 1
unsignedinteger maxposition = 100
unsignedinteger position = 1
integer setstep = 1
end type

type tab_1 from tab within w_vig_per
integer x = 32
integer y = 28
integer width = 4914
integer height = 696
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4878
integer height = 568
long backcolor = 67108864
string text = "Vigencias"
long tabtextcolor = 33554432
string picturename = "asig_cita.ico"
long picturemaskcolor = 536870912
pb_2 pb_2
pb_1 pb_1
dw_v dw_v
end type

on tabpage_1.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_v=create dw_v
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_v}
end on

on tabpage_1.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_v)
end on

type pb_2 from picturebutton within tabpage_1
string tag = "Borrar Vigencia"
integer x = 4713
integer y = 168
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Vigencia"
end type

event clicked;if tab_1.tabpage_1.dw_v.RowCount() < 1 then Return
if tab_1.tabpage_1.dw_v.GetItemString(tab_1.tabpage_1.dw_v.GetRow(),'estado') = '1' then
	messageBox('Error','La vigencia no puede ser borrada, solo cancelada')
	Return
end if
if nuevo = tab_1.tabpage_1.dw_v.GetRow() then
	nuevo = 0
	cambia = false
end if
tab_1.tabpage_1.dw_v.DeleteRow(0)

end event

type pb_1 from picturebutton within tabpage_1
string tag = "Insertar Vigencia"
integer x = 4713
integer y = 28
integer width = 146
integer height = 128
integer taborder = 40
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
string powertiptext = "Insertar Vigencia"
end type

event clicked;if nuevo > 0 then
	messagebox('Error','El Registro ' + string(nuevo) + ' es una vigencia nueva.')
	Return
end if

if cambia then
	int rta
	rta = messageBox('Aviso','Se han hecho cambio en los periodos. Desea salvar los cambios?',QUESTION!,YESNOCANCEL!)
	if rta = 1 then 
		pb_grabar.triggerEvent(clicked!)
	elseif rta = 2 then 
		cambia = false
	elseif rta = 3 then 
		Return
	end if
end if	
string valor
valor = tab_1.tabpage_1.dw_v.Describe("Evaluate('max(cod_vigencia)',0)")
nuevo = tab_1.tabpage_1.dw_v.InsertRow(0)
tab_1.tabpage_1.dw_v.scrolltoRow(nuevo)
tab_1.tabpage_1.dw_v.SetItem(nuevo,'cod_vigencia',long(valor) + 1)
tab_1.tabpage_1.dw_v.SetItem(nuevo,'ano',year(today()))
tab_1.tabpage_1.dw_v.SetItem(nuevo,'inicia',today())
tab_1.tabpage_1.dw_v.SetItem(nuevo,'termina',today())
tab_1.tabpage_1.dw_v.SetItem(nuevo,'usuario',usuario)
cambia = TRUE

end event

type dw_v from datawindow within tabpage_1
integer x = 37
integer y = 24
integer width = 4645
integer height = 516
integer taborder = 30
string title = "none"
string dataobject = "dw_vigencia_new"
boolean border = false
boolean livescroll = true
end type

event rowfocuschanged;if this.Rowcount() = 0 or currentRow = 0 then Return
dw_p.Reset()
dw_p.Retrieve(this.GetItemNumber(this.GetRow(),'cod_vigencia'))
st_1.Text = "Registro " + String(GetRow()) + " de " + String(RowCount())

end event

event rowfocuschanging;if cambia then
	int rta
	rta = messageBox('Aviso','Se han hecho cambio en los periodos. Desea salvar los cambios?',QUESTION!,YESNOCANCEL!)
	if rta = 1 then 
		pb_grabar.triggerEvent(clicked!)
	elseif rta = 2 then
		cambia = FALSE
		Return
	elseif rta = 3 then 
		Return -1
	end if
end if

end event

type gb_1 from groupbox within w_vig_per
integer x = 14
integer y = 740
integer width = 3913
integer height = 1092
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Periodos"
end type

