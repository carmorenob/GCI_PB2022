$PBExportHeader$w_tratamiento.srw
forward
global type w_tratamiento from window
end type
type pb_res from picturebutton within w_tratamiento
end type
type t1 from tab within w_tratamiento
end type
type p1 from userobject within t1
end type
type cb_delsug from picturebutton within p1
end type
type pb_1 from picturebutton within p1
end type
type pb_3 from picturebutton within p1
end type
type pb_4 from picturebutton within p1
end type
type pb_5 from picturebutton within p1
end type
type pb_6 from picturebutton within p1
end type
type dw_cpo from datawindow within p1
end type
type p1 from userobject within t1
cb_delsug cb_delsug
pb_1 pb_1
pb_3 pb_3
pb_4 pb_4
pb_5 pb_5
pb_6 pb_6
dw_cpo dw_cpo
end type
type p2 from userobject within t1
end type
type uo_1 from uo_odontograma within p2
end type
type p2 from userobject within t1
uo_1 uo_1
end type
type t1 from tab within w_tratamiento
p1 p1
p2 p2
end type
type st_1 from statictext within w_tratamiento
end type
type cb_save from picturebutton within w_tratamiento
end type
type dw_trato from datawindow within w_tratamiento
end type
type pb_2 from picturebutton within w_tratamiento
end type
type gb_2 from groupbox within w_tratamiento
end type
type cb_ins from picturebutton within w_tratamiento
end type
type cb_atender from picturebutton within w_tratamiento
end type
type cb_grabar from picturebutton within w_tratamiento
end type
type st_2 from statictext within w_tratamiento
end type
type dw_qtratamiento from datawindow within w_tratamiento
end type
end forward

global type w_tratamiento from window
integer width = 5147
integer height = 1888
boolean titlebar = true
string title = "Odontología - Definición Tratamiento"
boolean controlmenu = true
long backcolor = 67108864
string icon = "r_odontto.ico"
pb_res pb_res
t1 t1
st_1 st_1
cb_save cb_save
dw_trato dw_trato
pb_2 pb_2
gb_2 gb_2
cb_ins cb_ins
cb_atender cb_atender
cb_grabar cb_grabar
st_2 st_2
dw_qtratamiento dw_qtratamiento
end type
global w_tratamiento w_tratamiento

type variables
DataWindowChild procedimientos
long xant,yant
string  clugar_odongr
long nOdontograma
end variables

forward prototypes
public subroutine sugerir ()
public function integer sincronizaod ()
end prototypes

public subroutine sugerir ();
long fila, f

if dw_qtratamiento.Retrieve(nOdontograma,cLugar_odongr) > 0 then		
	long codigo, i
	if dw_qtratamiento.RowCount() = 0 then return
	codigo = long(t1.p1.dw_cpo.Describe("Evaluate('max(item)',0)"))
	if isNull(codigo) then
		codigo = 0
	end if
	
	for i = 1 to dw_qtratamiento.RowCount()
		f = procedimientos.Find('codigo_cuadrante=' + String(dw_qtratamiento.GetItemNumber(i,'odongrama_codigo_cuadrante')) +&
		' and codigo_pieza='+String(dw_qtratamiento.GetItemNumber(i,'odongrama_codigo_pieza')) +&
		' and cod_conven=' + String(dw_qtratamiento.GetItemNumber(i,'odongrama_cod_conven')) + " and sugerido='1'",1,procedimientos.RowCount())
		do while f > 0
			fila = t1.p1.dw_cpo.InsertRow(0)
			t1.p1.dw_cpo.SetItem(fila,'ntratamiento',dw_trato.GetItemNumber(dw_trato.GetRow(),'ntratamiento'))
			t1.p1.dw_cpo.SetItem(fila,'clugar',clugar)
			//t1.p1.dw_cpo.SetItem(fila,'codproced',dw_qtratamiento.GetItemString(i,'odonconvenproced_codproced'))
			//t1.p1.dw_cpo.SetItem(fila,'proced_descripcion',dw_qtratamiento.GetItemString(i,'proced_descripcion'))
			t1.p1.dw_cpo.SetItem(fila,'codigo_cuadrante',dw_qtratamiento.GetItemNumber(i,'odongrama_codigo_cuadrante'))
			t1.p1.dw_cpo.SetItem(fila,'codigo_pieza',dw_qtratamiento.GetItemNumber(i,'odongrama_codigo_pieza'))
			t1.p1.dw_cpo.SetItem(fila,'codigo_super',dw_qtratamiento.GetItemNumber(i,'odonsuperficie_codigo_super'))
			t1.p1.dw_cpo.SetItem(fila,'Observacion',dw_qtratamiento.GetItemString(i,'observa'))
			t1.p1.dw_cpo.SetItem(fila,'cod_conven',dw_qtratamiento.GetItemNumber(i,'odongrama_cod_conven'))
			t1.p1.dw_cpo.SetItem(fila,'des_conven',dw_qtratamiento.GetItemString(i,'odonconvencion_des_conven'))
			t1.p1.dw_cpo.SetItem(fila,'des_superficie',dw_qtratamiento.GetItemString(i,'odonsuperficie_des_superficie'))
			t1.p1.dw_cpo.SetItem(fila,'realizado','0')
			codigo = codigo + 1
			t1.p1.dw_cpo.SetItem(fila,'Item',codigo)
			
			t1.p1.dw_cpo.SetItem(fila,'codproced',procedimientos.GetItemString(f,'proced_codproced'))
			t1.p1.dw_cpo.SetItem(fila,'proced_descripcion',procedimientos.GetItemString(f,'proced_descripcion'))
			if f + 1 > procedimientos.RowCount() then EXIT
			f = procedimientos.Find('codigo_cuadrante=' + String(dw_qtratamiento.GetItemNumber(i,'odongrama_codigo_cuadrante')) +&
			' and codigo_pieza='+String(dw_qtratamiento.GetItemNumber(i,'odongrama_codigo_pieza')) +&
			' and cod_conven=' + String(dw_qtratamiento.GetItemNumber(i,'odongrama_cod_conven')) + " and sugerido='1'",f+1,procedimientos.RowCount())
		loop

	Next
end if
end subroutine

public function integer sincronizaod ();int i, f
string valor
uo_datastore dw_og

dw_og = Create uo_datastore
dw_og.DataObject = 'dw_odongrama'
dw_og.SetTransObject(SQLCA)

dw_og.Retrieve(dw_trato.GetItemNumber(dw_trato.GetRow(),'nodontograma'), dw_trato.GetItemString(dw_trato.GetRow(),'clugar_ocb'))
for i = 1 to t1.p1.dw_cpo.RowCount()
	f = dw_og.Find("codigo_cuadrante="+string(t1.p1.dw_cpo.GetItemNumber(i,'codigo_cuadrante')) +&
		" and codigo_pieza="+string(t1.p1.dw_cpo.GetItemNumber(i,'codigo_pieza')) +&
		" and codigo_super="+string(t1.p1.dw_cpo.GetItemNumber(i,'codigo_super')) +&
		" and cod_conven="+string(t1.p1.dw_cpo.GetItemNumber(i,'cod_conven')),1,dw_og.RowCount())
	if f = 0 then
		f = dw_og.InsertRow(0)
		valor = dw_og.Describe("Evaluate('max(item)',0)")
		dw_og.SetItem(f,'nodontograma',dw_trato.GetItemNumber(dw_trato.GetRow(),'nodontograma'))
		dw_og.SetItem(f,'cLugar',dw_trato.GetItemString(dw_trato.GetRow(),'clugar_ocb'))
		dw_og.SetItem(f,'item',long(valor) + 1)
		dw_og.SetItem(f,'codigo_cuadrante',t1.p1.dw_cpo.GetItemNumber(i,'codigo_cuadrante'))
		dw_og.SetItem(f,'codigo_pieza',t1.p1.dw_cpo.GetItemNumber(i,'codigo_pieza'))
		dw_og.SetItem(f,'codigo_super',t1.p1.dw_cpo.GetItemNumber(i,'codigo_super'))
		dw_og.SetItem(f,'cod_conven',t1.p1.dw_cpo.GetItemNumber(i,'cod_conven'))
	end if
next
if dw_og.Update() = -1 then
	MessageBox('Error','No se adicionaron procedimientos adicionales del Tratamiento al odontograma.')
	Return -1
end if
Return 0
end function

on w_tratamiento.create
this.pb_res=create pb_res
this.t1=create t1
this.st_1=create st_1
this.cb_save=create cb_save
this.dw_trato=create dw_trato
this.pb_2=create pb_2
this.gb_2=create gb_2
this.cb_ins=create cb_ins
this.cb_atender=create cb_atender
this.cb_grabar=create cb_grabar
this.st_2=create st_2
this.dw_qtratamiento=create dw_qtratamiento
this.Control[]={this.pb_res,&
this.t1,&
this.st_1,&
this.cb_save,&
this.dw_trato,&
this.pb_2,&
this.gb_2,&
this.cb_ins,&
this.cb_atender,&
this.cb_grabar,&
this.st_2,&
this.dw_qtratamiento}
end on

on w_tratamiento.destroy
destroy(this.pb_res)
destroy(this.t1)
destroy(this.st_1)
destroy(this.cb_save)
destroy(this.dw_trato)
destroy(this.pb_2)
destroy(this.gb_2)
destroy(this.cb_ins)
destroy(this.cb_atender)
destroy(this.cb_grabar)
destroy(this.st_2)
destroy(this.dw_qtratamiento)
end on

event open;string sqlproc
int fila

dw_trato.SetTransObject(SQLCA)
dw_qtratamiento.SetTransObject(SQLCA)
t1.p1.dw_cpo.SetTransObject(SQLCA)
t1.p1.dw_cpo.GetChild('proced_descripcion',procedimientos)
procedimientos.SetTransObject(SQLCA)
procedimientos.Retrieve()
nOdontograma = w_consulta.t1.p2.dwc_consult.GetItemNumber(w_consulta.t1.p2.dwc_consult.GetRow(),'nOdontograma')
cLugar_odongr = w_consulta.t1.p2.dwc_consult.GetItemString(w_consulta.t1.p2.dwc_consult.GetRow(),'cLugar')
fila = dw_trato.Retrieve(nodontograma,clugar_odongr)
t1.p2.uo_1.Retrieve(nodontograma,clugar_odongr)
if fila = 0 then
	dw_trato.InsertRow(1)
	dw_trato.SetItem(1,'cLugar',cLugar)
	dw_trato.SetItem(1,'fecha',today())
	dw_trato.SetItem(1,'tipodoc',tipdoc)
	dw_trato.SetItem(1,'documento',docu)
	dw_trato.SetItem(1,'nOdontograma',nOdontograma)
	dw_trato.SetItem(1,'clugar_ocb',cLugar_odongr)
	dw_trato.SetItem(1,'cEmp',w_consulta.dw_empac.GetItemString(w_consulta.dw_empac.GetRow(),'codemp'))
	dw_trato.SetItem(1,'desEmp',w_consulta.dw_empac.GetItemString(w_consulta.dw_empac.GetRow(),'desemp'))
	dw_trato.SetItem(1,'ccontrato',w_consulta.dw_empac.GetItemString(w_consulta.dw_empac.GetRow(),'codcontrato'))
	dw_trato.SetItem(1,'descontrato',w_consulta.dw_empac.GetItemString(w_consulta.dw_empac.GetRow(),'descontrato'))
	dw_trato.SetItem(1,'Estado','N')
	dw_trato.SetItem(1,'contador',w_consulta.dw_historial.GetItemNumber(w_consulta.dw_historial.GetRow(),'contador'))
	dw_trato.SetItem(1,'cLugar_his',w_consulta.dw_historial.GetItemString(w_consulta.dw_historial.GetRow(),'cLugar'))	
	dw_trato.SetItem(1,'codprof',w_principal.dw_odprofe.GetItemString(1,1))	
	sugerir()
else
	t1.p1.dw_cpo.Retrieve(dw_trato.GetItemNumber(1,'nTratamiento'),dw_trato.GetItemString(1,'cLugar'))
end if

if t1.p1.dw_cpo.RowCount() < 1 then Return
int cuad,diente,conv

cuad = t1.p1.dw_cpo.GetItemNumber(1,"codigo_cuadrante")
diente = t1.p1.dw_cpo.GetItemNumber(1,"codigo_pieza")
conv = t1.p1.dw_cpo.GetItemNumber(1,"cod_conven")

procedimientos.SetFilter('codigo_cuadrante=' + String(cuad) &
		+ ' and codigo_pieza='+String(diente) + ' and cod_conven=' + String(conv))
procedimientos.Filter()

end event

event activate;w_principal.dw_1.x=18
w_principal.dw_1.y=456
w_principal.dw_odprofe.x=3003
w_principal.dw_odprofe.y=476	
w_principal.dw_odprofe.visible=TRUE
end event

event deactivate;w_principal.dw_odprofe.visible=FALSE
end event

type pb_res from picturebutton within w_tratamiento
string tag = "Cambio Resposable"
integer x = 3406
integer y = 468
integer width = 146
integer height = 128
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cambia_res.jpg"
string disabledname = "cambia_res.jpg"
alignment htextalign = left!
end type

event clicked;st_historial st_odo
st_odo.contador=dw_trato.getitemnumber(dw_trato.getrow(),'ntratamiento')
st_odo.clugar=dw_trato.getitemString(dw_trato.getrow(),'clugar')
st_odo.cemp=dw_trato.getitemString(dw_trato.getrow(),'cemp')
st_odo.ccont=dw_trato.getitemString(dw_trato.getrow(),'ccontrato')
openwithparm(w_cambio_tto,st_odo)
dw_trato.Retrieve(st_odo.contador,st_odo.clugar)



end event

type t1 from tab within w_tratamiento
event create ( )
event destroy ( )
integer x = 37
integer y = 612
integer width = 4695
integer height = 1124
integer taborder = 50
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
p1 p1
p2 p2
end type

on t1.create
this.p1=create p1
this.p2=create p2
this.Control[]={this.p1,&
this.p2}
end on

on t1.destroy
destroy(this.p1)
destroy(this.p2)
end on

type p1 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4658
integer height = 996
long backcolor = 67108864
string text = "Tratamiento"
long tabtextcolor = 33554432
string picturename = "coronades16.ico"
long picturemaskcolor = 536870912
cb_delsug cb_delsug
pb_1 pb_1
pb_3 pb_3
pb_4 pb_4
pb_5 pb_5
pb_6 pb_6
dw_cpo dw_cpo
end type

on p1.create
this.cb_delsug=create cb_delsug
this.pb_1=create pb_1
this.pb_3=create pb_3
this.pb_4=create pb_4
this.pb_5=create pb_5
this.pb_6=create pb_6
this.dw_cpo=create dw_cpo
this.Control[]={this.cb_delsug,&
this.pb_1,&
this.pb_3,&
this.pb_4,&
this.pb_5,&
this.pb_6,&
this.dw_cpo}
end on

on p1.destroy
destroy(this.cb_delsug)
destroy(this.pb_1)
destroy(this.pb_3)
destroy(this.pb_4)
destroy(this.pb_5)
destroy(this.pb_6)
destroy(this.dw_cpo)
end on

type cb_delsug from picturebutton within p1
event mousemove pbm_mousemove
integer x = 4485
integer y = 172
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Eliminar fila de Tratamiento Sugerido"
end type

event clicked;if dw_trato.RowCount() = 0 then Return
string estado
estado = dw_trato.GetItemString(dw_trato.GetRow(),'estado')
if not (estado = '3' or estado = 'N') then 
	MessageBox('Aviso','El tratamiento no puede ser modificado')
	Return
end if
t1.p1.dw_cpo.deleterow(t1.p1.dw_cpo.getrow())
end event

type pb_1 from picturebutton within p1
event mousemove pbm_mousemove
integer x = 4485
integer y = 44
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Adicionar fila de Tratamiento Sugerido"
end type

event clicked;if dw_trato.RowCount() = 0 then Return
string estado
estado = dw_trato.GetItemString(dw_trato.GetRow(),'estado')
if not (estado = '3' or estado = 'N') then
	MessageBox('Aviso','El tratamiento no puede ser modificado')
	Return
end if
long fila, codigo
fila = t1.p1.dw_cpo.InsertRow(0)
t1.p1.dw_cpo.SetItem(fila,'nTratamiento',dw_trato.GetItemNumber(dw_trato.GetRow(),'ntratamiento'))
t1.p1.dw_cpo.SetItem(fila,'cLugar',cLugar)
codigo = long(t1.p1.dw_cpo.Describe("Evaluate('max(item)',0)"))
t1.p1.dw_cpo.SetItem(fila,'item', codigo + 1)
t1.p1.dw_cpo.SetItem(fila,'realizado', '0')

end event

type pb_3 from picturebutton within p1
event mousemove pbm_mousemove
integer x = 4485
integer y = 428
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
string picturename = "llevar.GIF"
string disabledname = "d_llevar.GIF"
alignment htextalign = left!
string powertiptext = "Traer Datos de Odontograma"
end type

event clicked;if dw_trato.RowCount() = 0 then Return
string estado
estado = dw_trato.GetItemString(dw_trato.GetRow(),'estado')
if not (estado = '3' or estado = 'N') then 
	MessageBox('Aviso','El tratamiento no puede ser modificado')
	Return
end if
long i, filas
filas = t1.p1.dw_cpo.RowCount()
for i = 1 to filas
	t1.p1.dw_cpo.DeleteRow(1)
next
sugerir()

end event

type pb_4 from picturebutton within p1
integer x = 4485
integer y = 556
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cotiza.gif"
alignment htextalign = left!
string powertiptext = "Cotizar"
end type

event clicked;if dw_trato.rowcount()=0 then return
if isnull(dw_trato.getitemnumber(dw_trato.getrow(),'ntratamiento')) then return
openwithparm(w_cotizar,t1.p1.dw_cpo)
if message.stringparm='si' then
	t1.p1.dw_cpo.Retrieve(dw_trato.GetItemNumber(1,'nTratamiento'),dw_trato.GetItemString(1,'cLugar'))
end if
end event

type pb_5 from picturebutton within p1
integer x = 4485
integer y = 684
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "lupa.gif"
alignment htextalign = left!
string powertiptext = "Ver Cotizaciones del Tratamiento"
end type

event clicked;openwithparm(w_cotizaciones,t1.p1.dw_cpo)
if message.stringparm='si' then
	t1.p1.dw_cpo.Retrieve(dw_trato.GetItemNumber(1,'nTratamiento'),dw_trato.GetItemString(1,'cLugar'))
end if
end event

type pb_6 from picturebutton within p1
event mousemove pbm_mousemove
integer x = 4485
integer y = 300
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "import.gif"
string disabledname = "d_import.gif"
alignment htextalign = left!
string powertiptext = "Adicionar Procedimiento no aplicable a piezas"
end type

event clicked;if dw_trato.RowCount() = 0 then Return
string estado
estado = dw_trato.GetItemString(dw_trato.GetRow(),'estado')
if not (estado = '3' or estado = 'N') then
	MessageBox('Aviso','El tratamiento no puede ser modificado')
	Return
end if
long fila, codigo
str_proc st_proc
open(w_busca_proc)
st_proc = Message.PowerObjectParm
if isValid(st_proc) then
	fila = t1.p1.dw_cpo.InsertRow(0)
	t1.p1.dw_cpo.SetItem(fila,'nTratamiento',dw_trato.GetItemNumber(dw_trato.GetRow(),'ntratamiento'))
	t1.p1.dw_cpo.SetItem(fila,'cLugar',cLugar)
	codigo = long(t1.p1.dw_cpo.Describe("Evaluate('max(item)',0)"))
	t1.p1.dw_cpo.SetItem(fila,'item', codigo + 1)
	t1.p1.dw_cpo.SetItem(fila,'realizado', '0')
	t1.p1.dw_cpo.SetItem(fila,'codproced', st_proc.cproc)
	t1.p1.dw_cpo.SetItem(fila,'proced_descripcion', st_proc.descripcion)
end if

end event

type dw_cpo from datawindow within p1
integer x = 32
integer y = 64
integer width = 4389
integer height = 788
integer taborder = 100
string title = "none"
string dataobject = "dw_tratamientosug"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string codigo, filtro
this.AcceptText()
if this.GetColumnName() = 'proced_descripcion' then
	codigo = procedimientos.getItemString(procedimientos.getRow(),'proced_codproced')
	this.SetItem(row,'codproced',codigo)
else
	int cuad,diente,conv
	cuad = this.GetItemNumber(this.GetRow(),"codigo_cuadrante")
	diente = this.GetItemNumber(this.GetRow(),"codigo_pieza")
	conv = this.GetItemNumber(this.GetRow(),"cod_conven")
	if isNull(cuad) or isNull(diente) or isNull(conv) then 
		filtro = ""
	else
		filtro = 'codigo_cuadrante=' + String(cuad) +&
			' and codigo_pieza='+String(diente) + ' and cod_conven=' + String(conv)
	end if
	procedimientos.SetFilter(filtro)
	procedimientos.Filter()
	if procedimientos.RowCount() = 0 then
		setNull(codigo)
		this.SetItem(this.GetRow(),'codproced',codigo)
	end if
end if

end event

event rowfocuschanged;if this.RowCount() = 0 or currentRow=0 then Return
int cuad,diente,conv, codigo
string filtro
cuad = this.GetItemNumber(this.GetRow(),"codigo_cuadrante")
diente = this.GetItemNumber(this.GetRow(),"codigo_pieza")
conv = this.GetItemNumber(this.GetRow(),"cod_conven")
if isNull(cuad) or isNull(diente) or isNull(conv) then 
	filtro = ""
else
	filtro = 'codigo_cuadrante=' + String(cuad) +&
		' and codigo_pieza='+String(diente) + ' and cod_conven=' + String(conv)
end if
procedimientos.SetFilter(filtro)
procedimientos.Filter()
if procedimientos.RowCount() = 0 then
	setNull(codigo)
	this.SetItem(this.GetRow(),'codproced',codigo)
end if
end event

event updateend;int filatto

filatto = this.find("realizado < '2'",1,this.Rowcount())

if filatto = 0 and this.rowcount()>0 then
	dw_trato.SetItem(dw_trato.GetRow(),'estado','2')
	dw_trato.SetItem(dw_trato.GetRow(),'fechafin',datetime(today()))
	if dw_trato.Update()=-1 then
		rollback;
	else
		commit;
	end if
end if

end event

type p2 from userobject within t1
integer x = 18
integer y = 112
integer width = 4658
integer height = 996
long backcolor = 67108864
string text = "Odontograma"
long tabtextcolor = 33554432
string picturename = "molar3cor.ico"
long picturemaskcolor = 536870912
uo_1 uo_1
end type

on p2.create
this.uo_1=create uo_1
this.Control[]={this.uo_1}
end on

on p2.destroy
destroy(this.uo_1)
end on

type uo_1 from uo_odontograma within p2
integer x = 91
integer y = 20
integer taborder = 30
end type

on uo_1.destroy
call uo_odontograma::destroy
end on

type st_1 from statictext within w_tratamiento
integer x = 18
integer y = 32
integer width = 2693
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = " Información General - Tratamiento"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_save from picturebutton within w_tratamiento
event mousemove pbm_mousemove
integer x = 3241
integer y = 468
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
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "Guardar Temporal"
end type

event clicked;long codigo, i
if t1.p1.dw_cpo.rowcount()=0 then
	MessageBox('Aviso','El tratamiento no tiene productos')
	return
end if

if dw_trato.GetItemString(dw_trato.GetRow(),'estado') = 'N' then
	select max(ntratamiento) into :codigo from odontratacab where clugar=:clugar;
	if isNull(codigo) then codigo=0
	codigo ++
	dw_trato.setitem(dw_trato.GetRow(),"Estado",'3')
	dw_trato.setitem(dw_trato.GetRow(),"ntratamiento",codigo)
	for i = 1 to t1.p1.dw_cpo.RowCount()
		t1.p1.dw_cpo.SetItem(i,'nTratamiento',codigo)
	Next
end if
if dw_trato.GetItemString(dw_trato.GetRow(),'estado') = '3' then
	if dw_trato.Update()=-1 then
		rollback;
		Return
	else
		if t1.p1.dw_cpo.Update()=-1 then 
			rollback;
		else
			commit;
		end if
	end if
else
	MessageBox('Aviso','El tratamiento no puede ser modificado')
end if
end event

type dw_trato from datawindow within w_tratamiento
integer x = 37
integer y = 92
integer width = 2651
integer height = 464
integer taborder = 30
string title = "none"
string dataobject = "dw_tratacab"
boolean border = false
boolean livescroll = true
end type

type pb_2 from picturebutton within w_tratamiento
event mousemove pbm_mousemove
integer x = 3081
integer y = 468
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
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar Tratamiento Definitivo"
end type

event clicked;long codigo, i
if t1.p1.dw_cpo.rowcount()=0 then
	MessageBox('Aviso','El tratamiento no tiene productos')
	return
end if

if dw_trato.GetItemString(dw_trato.GetRow(),'estado') = 'N' then	
	cb_save.TriggerEvent(clicked!)
end if

if dw_trato.GetItemString(dw_trato.GetRow(),'estado') = '3' then	
	dw_trato.SetItem(dw_trato.GetRow(),'estado','0')
	sincronizaOd()
	if dw_trato.Update()=-1 then
		rollback;
		Return
	else
		if t1.p1.dw_cpo.Update()=-1 then 
			rollback;
		else
			commit;
		end if
	end if
else
	MessageBox('Aviso','El tratamiento no puede ser modificado')
end if

end event

type gb_2 from groupbox within w_tratamiento
integer x = 14
integer width = 2962
integer height = 572
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type cb_ins from picturebutton within w_tratamiento
event mousemove pbm_mousemove
boolean visible = false
integer x = 3424
integer y = 120
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "        &a"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Adicionar Encabezado de Tratamiento [Alt+A]"
end type

event clicked;//if clugar_odongr<>clugar then
//	messagebox("Atención","La consulta inicial fue realizada en el lugar "+clugar_odongr+", distinto al de este equipo")
//	return
//end if
//long codigo
//date vfecha
//string cemp,ccont
//dw_trato.insertrow(1)
//	// Inserta TRATAMIENTO-CABECERA
//vfecha = today()
//cemp = w_consulta.dw_empac.getitemstring(w_consulta.dw_empac.getrow(),"codemp")
//ccont = w_consulta.dw_empac.getitemstring(w_consulta.dw_empac.getrow(),"codcontrato")
//dw_trato.setitem(1,"clugar",clugar)
//dw_trato.setitem(1,"fecha",datetime(vfecha))
//dw_trato.setitem(1,"tipodoc",tipdoc)
//dw_trato.setitem(1,"documento",docu)
//dw_trato.setitem(1,"nodontograma",nodontograma)
//dw_trato.setitem(1,"clugar_ocb",clugar_odongr)
//dw_trato.setitem(1,"cemp",cemp)
//dw_trato.setitem(1,"ccontrato",ccont)
//dw_trato.setitem(1,"contador",contador)
//dw_trato.setitem(1,"clugar_his",clugar_his)
//if dw_trato.getrow()<>1 then
//	dw_trato.scrolltorow(1)
//end if
//dw_trato.triggerevent(rowfocuschanged!)
//this.enabled=false
//cb_delsug.enabled=false
//cb_grabar.enabled=false
//cb_atender.enabled=false
//cb_grabartto.enabled=false
//
end event

type cb_atender from picturebutton within w_tratamiento
event mousemove pbm_mousemove
boolean visible = false
integer x = 3429
integer y = 284
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "llevar.GIF"
string disabledname = "d_llevar.GIF"
alignment htextalign = left!
string powertiptext = "Atender Procedimiento de Tratamiento"
end type

event clicked;//int codigo
//int fila
//string proced,cemp,ccontrato,rip,realizado
//date vfecha
//
//fila = dw_tratamientocpo.GetRow()
//if fila<1 then return
//if dw_trato.GetItemString(dw_trato.getrow(),'clugar_his')<>clugar then
//	messagebox("Atención","Este tratamiento es de otro lugar no puede atenderlo aquí")
//	return
//end if
//realizado = dw_tratamientocpo.GetItemString(fila,'realizado') 
//if realizado = '2' then return
//proced = dw_tratamientocpo.GetItemString(fila,'codproced')
//codigo = dw_tratamientocpo.GetItemNumber(fila,'item')
//dw_tratamientocpo.SetItem(fila,'realizado','1')
//if dw_tratamientocpo.update()=-1 then
//	rollback;
//	return
//end if
//fila = dw_trato.GetRow()
//contador = dw_trato.GetItemNumber(fila,'contador')
//clugar_his = dw_trato.GetItemString(fila,'clugar_his')
//cemp = dw_trato.GetItemString(fila,'cemp')
//ccontrato = dw_trato.GetItemString(fila,'ccontrato')
//vfecha = today()
//select rips into :rip from proced where codproced = :proced;
//
//opensheet(w_atender,w_principal,2,Layered!)
//if w_atender.dwc_rips.retrieve(contador,codigo,clugar_his) > 0 then return
//fila = w_atender.dwc_rips.insertRow(0)
//w_atender.dwc_rips.SetItem(fila,'contador',contador)
//w_atender.dwc_rips.SetItem(fila,'clugar',clugar_his)
//w_atender.dwc_rips.SetItem(fila,'nservicio',codigo)
//w_atender.dwc_rips.SetItem(fila,'cproced',proced)
//w_atender.dwc_rips.SetItem(fila,'cemp',cemp)
//w_atender.dwc_rips.SetItem(fila,'ccontrato',ccontrato)
////w_atender.dwc_rips.SetItem(fila,'cplan',cplan) ooooo0OOOOOOJJJOOOOO000oo
//w_atender.dwc_rips.SetItem(fila,'clugar',clugar)
//w_atender.dwc_rips.SetItem(fila,'rips',rip)
//w_atender.dwc_rips.SetItem(fila,'s_cantidad',1)
//w_atender.dwc_rips.SetItem(fila,'s_fecha',datetime(vfecha))
//if w_atender.dwc_rips.update()=-1 then
//	rollback;
//else
//	commit;
//	w_atender.dwc_rips.retrieve(contador,codigo,clugar_his)
//end if
//
end event

type cb_grabar from picturebutton within w_tratamiento
event mousemove pbm_mousemove
boolean visible = false
integer x = 3589
integer y = 468
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
string powertiptext = "Guardar Tratamiento a Definitivo"
end type

event clicked;int i=1,fila,ret
long codigo

if dw_qtratamiento.RowCount() = 0 then return
codigo = long(t1.p1.dw_cpo.Describe("Evaluate('max(item)',0)"))
if isNull(codigo) then
	codigo = 0
end if

DO WHILE i <= dw_qtratamiento.RowCount()
	fila = t1.p1.dw_cpo.InsertRow(0)
	//t1.p1.dw_cpo.SetItem(fila,'Ntratamiento',InTratamiento)
	t1.p1.dw_cpo.SetItem(fila,'clugar',clugar)
	t1.p1.dw_cpo.SetItem(fila,'codproced',dw_qtratamiento.GetItemString(i,'odonconvenproced_codproced'))
	t1.p1.dw_cpo.SetItem(fila,'codigo_cuadrante',dw_qtratamiento.GetItemNumber(i,'odongrama_codigo_cuadrante'))
	t1.p1.dw_cpo.SetItem(fila,'codigo_pieza',dw_qtratamiento.GetItemNumber(i,'odongrama_codigo_pieza'))
	t1.p1.dw_cpo.SetItem(fila,'codigo_super',dw_qtratamiento.GetItemNumber(i,'odonsuperficie_codigo_super'))
	t1.p1.dw_cpo.SetItem(fila,'Observacion',dw_qtratamiento.GetItemString(i,'observa'))
	t1.p1.dw_cpo.SetItem(fila,'cod_conven',dw_qtratamiento.GetItemNumber(i,'odongrama_cod_conven'))
	t1.p1.dw_cpo.SetItem(fila,'proced_descripcion',dw_qtratamiento.GetItemString(i,'proced_descripcion'))
	t1.p1.dw_cpo.SetItem(fila,'odonsuperficie_des_superficie',dw_qtratamiento.GetItemString(i,'odonsuperficie_des_superficie'))
	t1.p1.dw_cpo.SetItem(fila,'realizado','0')
	codigo = codigo + 1
	t1.p1.dw_cpo.SetItem(fila,'Item',codigo)
	i = i + 1
LOOP
if t1.p1.dw_cpo.update()=-1 then
	Rollback;
else
	Commit;
	dw_qtratamiento.reset()
end if

end event

type st_2 from statictext within w_tratamiento
integer x = 3045
integer y = 28
integer width = 1632
integer height = 416
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Ventana para establecer algunos parámetros del Tratamiento y los procedimientos del mismo. Los items son obtenidos del  Odontograma. Para cambiar el procedimiento, seleccione de la lista uno de los aplicables."
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_qtratamiento from datawindow within w_tratamiento
boolean visible = false
integer x = 3625
integer y = 68
integer width = 315
integer height = 116
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_qtratamiento"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

event clicked;int cuad,diente,conv

if String(dwo.Name)='proced_descripcion' then
	cuad = this.GetItemNumber(row,"odongrama_codigo_cuadrante")
	diente = this.GetItemNumber(row,"odongrama_codigo_pieza")
	conv = this.GetItemNumber(row,"odongrama_cod_conven")
	procedimientos.SetFilter('odonconvenproced_codigo_cuadrante=' + String(cuad) &
			+ ' and odonconvenproced_codigo_pieza='+String(diente) + ' and odonconvenproced_cod_conven=' + String(conv))		
	procedimientos.Filter()
end if

end event

event itemchanged;string codigo
if String(dwo.Name)='proced_descripcion' then

	codigo = procedimientos.getItemString(procedimientos.getRow(),'proced_codproced')
	this.SetItem(row,'odonconvenproced_codproced',codigo)
end if
end event

event retrieveend;long fila, i
int vcuadrante, vpieza, vsuperf, vconv
for i = 1 to RowCount()
	vcuadrante = this.getItemNumber(i,'odongrama_codigo_cuadrante')
	vpieza = this.getItemNumber(i,'odongrama_codigo_pieza')
	vsuperf = this.getItemNumber(i,'odonsuperficie_codigo_super')
	vconv = this.getItemNumber(i,'odongrama_cod_conven')
	
	fila = t1.p1.dw_cpo.find('codigo_cuadrante=' + String(vcuadrante)+&
			 ' and codigo_pieza='+String(vpieza)+' and codigo_super='+String(vsuperf)+&
			 ' and cod_conven='+String(vconv),1,t1.p1.dw_cpo.RowCount())
	if fila > 0 then
		this.deleteRow(i)
	end if
next

end event

