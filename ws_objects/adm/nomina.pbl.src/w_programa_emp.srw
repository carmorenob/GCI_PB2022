$PBExportHeader$w_programa_emp.srw
forward
global type w_programa_emp from window
end type
type st_4 from statictext within w_programa_emp
end type
type st_1 from statictext within w_programa_emp
end type
type st_7 from statictext within w_programa_emp
end type
type mc_1 from monthcalendar within w_programa_emp
end type
type st_13 from statictext within w_programa_emp
end type
type dw_hs from datawindow within w_programa_emp
end type
type st_12 from statictext within w_programa_emp
end type
type pb_3 from picturebutton within w_programa_emp
end type
type st_6 from statictext within w_programa_emp
end type
type dw_lugar from datawindow within w_programa_emp
end type
type st_5 from statictext within w_programa_emp
end type
type dw_2 from datawindow within w_programa_emp
end type
type dw_dist from datawindow within w_programa_emp
end type
type st_2 from statictext within w_programa_emp
end type
type st_3 from statictext within w_programa_emp
end type
type dw_5 from datawindow within w_programa_emp
end type
type st_8 from statictext within w_programa_emp
end type
type dw_hm from datawindow within w_programa_emp
end type
type em_1 from editmask within w_programa_emp
end type
type em_2 from editmask within w_programa_emp
end type
type em_cada from editmask within w_programa_emp
end type
type dw_hora_resu from datawindow within w_programa_emp
end type
type pb_6 from pb_report within w_programa_emp
end type
type gb_1 from groupbox within w_programa_emp
end type
type cb_2 from picturebutton within w_programa_emp
end type
type pb_4 from picturebutton within w_programa_emp
end type
type pb_sug from picturebutton within w_programa_emp
end type
type pb_2 from picturebutton within w_programa_emp
end type
type pb_1 from picturebutton within w_programa_emp
end type
type cb_1 from picturebutton within w_programa_emp
end type
type pb_5 from picturebutton within w_programa_emp
end type
type cb_guarda from picturebutton within w_programa_emp
end type
end forward

global type w_programa_emp from window
integer width = 5010
integer height = 2104
boolean titlebar = true
string title = "Programación Turnos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "ribon_vigencia.ico"
st_4 st_4
st_1 st_1
st_7 st_7
mc_1 mc_1
st_13 st_13
dw_hs dw_hs
st_12 st_12
pb_3 pb_3
st_6 st_6
dw_lugar dw_lugar
st_5 st_5
dw_2 dw_2
dw_dist dw_dist
st_2 st_2
st_3 st_3
dw_5 dw_5
st_8 st_8
dw_hm dw_hm
em_1 em_1
em_2 em_2
em_cada em_cada
dw_hora_resu dw_hora_resu
pb_6 pb_6
gb_1 gb_1
cb_2 cb_2
pb_4 pb_4
pb_sug pb_sug
pb_2 pb_2
pb_1 pb_1
cb_1 cb_1
pb_5 pb_5
cb_guarda cb_guarda
end type
global w_programa_emp w_programa_emp

type variables
datawindowchild dw_ufun,dw_ccosto 
long filaini,colini,ffin,cfin,pres //para seleccionar los cuadrados
long dura,cuantos,fila_prof,fila_ant,col_ant, resaltado, il_dia, hbase
datetime desde, hasta, inimes, finmes
boolean cambio, ib_resaltado
string cl, uf, cc, tipo_ts, td_u, doc_u, tipo_u, td_j, doc_j
double l_colo
m_turnos m_t
uo_dataStore dw_t, dw_th
string is_selected

end variables

forward prototypes
public subroutine pinta ()
public subroutine marcacol (long columna)
public subroutine marcafila (long fila)
public function integer resaltacal ()
public subroutine festivos ()
public subroutine f_marca_turno (string codigo)
public function integer f_ver_horas ()
public function integer f_verifica (integer l_dia, st_time tiempo)
public function integer f_quitar_intervalo ()
end prototypes

public subroutine pinta ();date f_ptr
dw_5.dataObject = 'dw_programa_bar'
dw_5.InsertRow(0)

f_ptr = date(desde)
dw_5.Modify("dia1.Text='Lunes "+string(day(f_ptr))+"'")
f_ptr = RelativeDate(f_ptr, 1)
dw_5.Modify("dia2.Text='Martes "+string(day(f_ptr))+"'")
f_ptr = RelativeDate(f_ptr, 1)
dw_5.Modify("dia3.Text='Miércoles "+string(day(f_ptr))+"'")
f_ptr = RelativeDate(f_ptr, 1)
dw_5.Modify("dia4.Text='Jueves "+string(day(f_ptr))+"'")
f_ptr = RelativeDate(f_ptr, 1)
dw_5.Modify("dia5.Text='Viernes "+string(day(f_ptr))+"'")
f_ptr = RelativeDate(f_ptr, 1)
dw_5.Modify("dia6.Text='Sábado "+string(day(f_ptr))+"'")
f_ptr = RelativeDate(f_ptr, 1)
dw_5.Modify("dia7.Text='Domingo "+string(day(f_ptr))+"'")
festivos()

end subroutine

public subroutine marcacol (long columna);long i
for i=1 to dw_5.rowcount()
	if dw_5.getitemstring(1,"selcol"+string(columna))="0" then
		dw_5.setitem(i,"sel"+string(columna),"1")
	else
		dw_5.setitem(i,"sel"+string(columna),"0")
	end if
next
if dw_5.getitemstring(1,"selcol"+string(columna))="0" then
	dw_5.setitem(1,"selcol"+string(columna),"1")
else
	dw_5.setitem(1,"selcol"+string(columna),"0")
end if

end subroutine

public subroutine marcafila (long fila);long i
for i=1 to 7 
	if dw_5.getitemstring(fila,"selfil")="0" then
		dw_5.setitem(fila,"sel"+string(i),"1")
	else
		dw_5.setitem(fila,"sel"+string(i),"0")
	end if
next
if dw_5.getitemstring(fila,"selfil")="0" then
	dw_5.setitem(fila,"selfil","1")
else
	dw_5.setitem(fila,"selfil","0")
end if	
end subroutine

public function integer resaltacal ();Return 0

end function

public subroutine festivos ();uo_datastore dw_f
long i,cel,ini_mes
date fecha
string boton
dw_f = Create uo_datastore
dw_f.DataObject = 'dw_festivos'
dw_f.SetTransObject(SQLCA)
date fecha_sel
mc_1.GetSelectedDate ( fecha_sel )

dw_f.Retrieve(year(fecha_sel),Month(fecha_sel))
for i = 1 to dw_f.RowCount()
	fecha = date(dw_f.GetItemDatetime(i,'fecha'))
	if datetime(fecha) >= desde and datetime(fecha) <= hasta then
		choose case f_diaNumero(fecha)
			case 1
				boton = "dia1"
				boton = dw_5.Modify("dia1.background.color=15780518")
			case 2
				boton = "dia2"
				boton = dw_5.Modify("dia2.background.color=15780518")
			case 3
				boton = "dia3"
				boton = dw_5.Modify("dia3.background.color=15780518")
			case 4
				boton = "dia4"
				boton = dw_5.Modify("dia4.background.color=15780518")
			case 5
				boton = "dia5"
				boton = dw_5.Modify("dia5.background.color=15780518")
			case 6
				boton = "dia6"
				boton = dw_5.Modify("dia6.background.color=15780518")
			case 7
				boton = "dia7"
				boton = dw_5.Modify(" dia7.background.color=15780518 ") 
		end choose	
	end if
next
end subroutine

public subroutine f_marca_turno (string codigo);string l_uf1,l_cc1
long i, fila, hora, fraccion, posx, largo, ll_color, fase, obj, item
string valor, ret
double horaini, horafin
datetime ldt_ini, ldt_fin, ldt_fechadom

if il_dia = 0 then 
	MessageBox('Atención','No seleccionó día válido')
	Return
end if
if codigo = 'inserta' then
	fila = dw_hora_resu.find("dia="+string(il_dia),1,dw_hora_resu.rowCount())
	fila = dw_hora_resu.Insertrow(0)
	valor = dw_hora_resu.Describe("Evaluate('max(item)', 1)")
	obj = long(dw_hora_resu.describe("Evaluate('max(obj)',0)")) + 1
	dw_hora_resu.setItem(fila,'objeto',"obj_"+string(obj))
	dw_hora_resu.setItem(fila,'obj',obj)
	dw_hora_resu.setitem(fila,'tipodoc',dw_dist.getitemstring(dw_dist.getrow(),'tipodoc'))
	dw_hora_resu.setitem(fila,'documento',dw_dist.getitemstring(dw_dist.getrow(),'documento'))
	dw_hora_resu.setitem(fila,'ncargo',dw_dist.getitemnumber(dw_dist.getrow(),'ncargo'))
	dw_hora_resu.setitem(fila,'fecha_dom',desde)
	dw_hora_resu.setitem(fila,'item',long(valor) + 1)
	dw_hora_resu.setitem(fila,'h_ini',datetime(RelativeDate(date(desde), il_dia - 1),time("00:00")))
	dw_hora_resu.setitem(fila,'h_fin',datetime(RelativeDate(date(desde), il_dia - 1),time("00:00")))
	dw_hora_resu.setitem(fila,'Inicio',datetime(RelativeDate(date(desde), il_dia - 1),time("00:00")))
	dw_hora_resu.setitem(fila,'Fin',datetime(RelativeDate(date(desde), il_dia - 1),time("00:00")))
	dw_hora_resu.setitem(fila,'clugar',dw_lugar.getitemstring(1,'codlugar'))
	dw_hora_resu.setitem(fila,'ufuncional',dw_2.getitemstring(1,'coduf'))
	dw_hora_resu.setitem(fila,'ccosto',dw_2.getitemstring(1,'codcc'))
	dw_hora_resu.setitem(fila,'hextra','0')
	dw_hora_resu.setitem(fila,'compensa','0')
	dw_hora_resu.setitem(fila,'agendaprof','0')
	dw_hora_resu.setitem(fila,'calculado','0')
	dw_hora_resu.setitem(fila,'usuario',usuario)
	dw_hora_resu.setitem(fila,'fecha_modi',Today())
	l_uf1=dw_2.getitemstring(1,'coduf')
	l_cc1=dw_2.getitemstring(1,'codcc')
	select color into :ll_color from centrocostos
	where coduf=:l_uf1 and codcc=:l_cc1;
	if isnull(ll_color) then ll_color = 8421376
	ret = dw_5.Modify("CREATE rectangle(band=detail x='"+string(Posx)+"' y='"+string((il_dia - 1)*70 + 8)+"' height='60' width='"+string(largo)+"'  moveable=1 name=obj_"+string(obj)+" visible='1' brush.hatch='6' brush.color='"+string(ll_color)+"' pen.style='0' pen.width='5' pen.color='16777215'  background.mode='2' background.color='0') ")
	if ret <> '' then
		MessageBox('Atención','No pudo agregar al horario '+string(horaini) + ' - ' + string(horafin))
		return 
	end if
	dw_hora_resu.scrolltoRow(fila)
	return
end if
if codigo <> 'limpia' then
	dw_th.SetFilter("codigo='"+codigo+"'")
	dw_th.Filter()
	if dw_th.RowCount() = 0 then
		MessageBox('Atención','No aparecen intervalos de tiempo para el turno seleccionado')
		Return
	end if
end if

// Deselec
setNull(valor)
fila = dw_hora_resu.find("dia="+string(il_dia),1,dw_hora_resu.rowCount())
do while fila > 0
	if  dw_hora_resu.getitemstring(fila,'agendaprof')='1' Then
		MessageBox('Atención','No se puede Desocupar viene de Interface')
	else
		if codigo = 'limpia' then 
			dw_5.modify("destroy " + dw_hora_resu.getItemString(fila,'objeto'))
			dw_hora_resu.deleterow(fila)
		end if
	end if
	if 	fila+1 > dw_hora_resu.rowCount() then 	exit
	fila = dw_hora_resu.find("dia="+string(il_dia),fila+1,dw_hora_resu.rowCount())
loop

if codigo = 'limpia' then 
	return
end if

for i = 1 to dw_th.RowCount()
	ldt_fechadom = desde
	horaini = secondsAfter(time("0"),time(dw_th.getitemdatetime(i,"horaini")))/3600
	horafin = secondsAfter(time("0"),time(dw_th.getitemdatetime(i,"horafin")))/3600
	ldt_ini = dw_th.getitemdatetime(i,"horaini")
	ldt_fin = dw_th.getitemdatetime(i,"horafin")
	fase = 1
	if horaini > horafin then
		horafin = secondsAfter(time("0"),time("23:59"))/3600
		ldt_fin = datetime(date("0"),time("23:59"))
		fase = 2
	end if
	do
		hora = int(horaini)
		fraccion = int((horaini - hora)*100)
		posx = long(dw_5.describe("hora"+string(hora+1)+".x")) + long(dw_5.describe("hora"+string(hora)+".width"))*fraccion/100
		hora = int(horafin)
		fraccion = int((horafin - hora)*100)
		
		largo = long(dw_5.describe("hora"+string(hora+1)+".x")) + long(dw_5.describe("hora"+string(hora)+".width"))*fraccion/100 - posx
		fila = dw_hora_resu.Insertrow(0)
		obj = long(dw_hora_resu.describe("Evaluate('max(obj)',0)")) + 1
		valor = dw_hora_resu.Describe("Evaluate('max(item)', 1)")
		dw_hora_resu.setItem(fila,'objeto',"obj_"+string(obj))
		dw_hora_resu.setItem(fila,'obj',obj)
		dw_hora_resu.setitem(fila,'tipodoc',dw_dist.getitemstring(dw_dist.getrow(),'tipodoc'))
		dw_hora_resu.setitem(fila,'documento',dw_dist.getitemstring(dw_dist.getrow(),'documento'))
		dw_hora_resu.setitem(fila,'ncargo',dw_dist.getitemnumber(dw_dist.getrow(),'ncargo'))
		dw_hora_resu.setitem(fila,'fecha_dom', ldt_fechadom)
		dw_hora_resu.setitem(fila,'item',long(valor) + 1)
		dw_hora_resu.setitem(fila,'h_ini',datetime(RelativeDate(date(desde), il_dia - 1),time(ldt_ini)))
		dw_hora_resu.setitem(fila,'h_fin',datetime(RelativeDate(date(desde), il_dia - 1),time(ldt_fin)))
		dw_hora_resu.setitem(fila,'Inicio',datetime(RelativeDate(date(desde), il_dia - 1),time(ldt_ini)))
		dw_hora_resu.setitem(fila,'Fin',datetime(RelativeDate(date(desde), il_dia - 1),time(ldt_fin)))
		dw_hora_resu.setitem(fila,'Horas', round((horafin - horaini)/3600,1))

		dw_hora_resu.setitem(fila,'clugar',dw_lugar.getitemstring(1,'codlugar'))
		dw_hora_resu.setitem(fila,'ufuncional',dw_2.getitemstring(1,'coduf'))
		dw_hora_resu.setitem(fila,'ccosto',dw_2.getitemstring(1,'codcc'))
		l_uf1=dw_2.getitemstring(1,'coduf')
		l_cc1=dw_2.getitemstring(1,'codcc')
		select color into :ll_color from centrocostos
		where coduf=:l_uf1 and codcc=:l_cc1;
		if isnull(ll_color) then ll_color = 8421376
		///////
		dw_hora_resu.setitem(fila,'hextra','0')
		dw_hora_resu.setitem(fila,'compensa','0')
		dw_hora_resu.setitem(fila,'agendaprof','0')
		dw_hora_resu.setitem(fila,'calculado','0')
		dw_hora_resu.setitem(fila,'usuario',usuario)
		dw_hora_resu.setitem(fila,'fecha_modi',Today())
		dw_hora_resu.setitem(fila,'turno',codigo)
		ret = dw_5.Modify("CREATE rectangle(band=detail x='"+string(Posx)+"' y='"+string((il_dia - 1)*70 + 8)+"' height='60' width='"+string(largo)+"'  moveable=1 name=obj_"+string(obj)+" visible='1' brush.hatch='6' brush.color='"+string(ll_color)+"' pen.style='0' pen.width='5' pen.color='16777215'  background.mode='2' background.color='0') ")
		if ret <> '' then
			MessageBox('Atención','No pudo agregar al horario '+string(horaini) + ' - ' + string(horafin))
			return 
		end if
		fase --
		if fase > 0 then
			ldt_ini = datetime(date("0"),time("00:00"))
			ldt_fin = datetime(date("0"),time(dw_th.getitemdatetime(i,"horafin")))
			horaini = secondsAfter(time("0"),time("0"))
			horafin = secondsAfter(time("0"),time(dw_th.getitemdatetime(i,"horafin")))/3600
			il_dia ++
			ldt_fechadom = datetime(RelativeDate(date(desde), il_dia - 1))
			ldt_fechadom = DateTime(RelativeDate(date(ldt_fechadom),-1*f_diaNumero(date(ldt_fechadom)) + 1))
		end if
	loop while fase > 0
next

end subroutine

public function integer f_ver_horas ();long hnorm, hextra, hcomp
if dw_hora_resu.rowCount() = 0 then return 0
hnorm = dw_hora_resu.GetItemNumber(1,'t_normal')
hextra = dw_hora_resu.GetItemNumber(1,'t_extra')
hcomp = dw_hora_resu.GetItemNumber(1,'t_compensa')
if hnorm +hcomp < hbase and hextra > 0 then
	MessageBox('Atención','El número de horas normales está por debajo de las horas base '+string(hbase)+'. No debería tener horas extras')
	Return -1
end if
if hnorm + hcomp > hbase then
	MessageBox('Atención','Excede el número de horas normales en '+string(hnorm + hcomp - hbase)+'. Debe definir algunas como extras')
	Return -1
end if

Return 0

end function

public function integer f_verifica (integer l_dia, st_time tiempo);long fila
st_interfec tr, t1, t2
fila = dw_hora_resu.find("dia="+string(l_dia),1,dw_hora_resu.rowCount())
do while fila > 0
	t1.x = dw_hora_resu.getItemdateTime(fila,'inicio')
	t1.y = dw_hora_resu.getItemdateTime(fila,'fin')
loop
return 0

end function

public function integer f_quitar_intervalo ();
return 0

end function

on w_programa_emp.create
this.st_4=create st_4
this.st_1=create st_1
this.st_7=create st_7
this.mc_1=create mc_1
this.st_13=create st_13
this.dw_hs=create dw_hs
this.st_12=create st_12
this.pb_3=create pb_3
this.st_6=create st_6
this.dw_lugar=create dw_lugar
this.st_5=create st_5
this.dw_2=create dw_2
this.dw_dist=create dw_dist
this.st_2=create st_2
this.st_3=create st_3
this.dw_5=create dw_5
this.st_8=create st_8
this.dw_hm=create dw_hm
this.em_1=create em_1
this.em_2=create em_2
this.em_cada=create em_cada
this.dw_hora_resu=create dw_hora_resu
this.pb_6=create pb_6
this.gb_1=create gb_1
this.cb_2=create cb_2
this.pb_4=create pb_4
this.pb_sug=create pb_sug
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_1=create cb_1
this.pb_5=create pb_5
this.cb_guarda=create cb_guarda
this.Control[]={this.st_4,&
this.st_1,&
this.st_7,&
this.mc_1,&
this.st_13,&
this.dw_hs,&
this.st_12,&
this.pb_3,&
this.st_6,&
this.dw_lugar,&
this.st_5,&
this.dw_2,&
this.dw_dist,&
this.st_2,&
this.st_3,&
this.dw_5,&
this.st_8,&
this.dw_hm,&
this.em_1,&
this.em_2,&
this.em_cada,&
this.dw_hora_resu,&
this.pb_6,&
this.gb_1,&
this.cb_2,&
this.pb_4,&
this.pb_sug,&
this.pb_2,&
this.pb_1,&
this.cb_1,&
this.pb_5,&
this.cb_guarda}
end on

on w_programa_emp.destroy
destroy(this.st_4)
destroy(this.st_1)
destroy(this.st_7)
destroy(this.mc_1)
destroy(this.st_13)
destroy(this.dw_hs)
destroy(this.st_12)
destroy(this.pb_3)
destroy(this.st_6)
destroy(this.dw_lugar)
destroy(this.st_5)
destroy(this.dw_2)
destroy(this.dw_dist)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.dw_5)
destroy(this.st_8)
destroy(this.dw_hm)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.em_cada)
destroy(this.dw_hora_resu)
destroy(this.pb_6)
destroy(this.gb_1)
destroy(this.cb_2)
destroy(this.pb_4)
destroy(this.pb_sug)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cb_1)
destroy(this.pb_5)
destroy(this.cb_guarda)
end on

event open;col_ant=0
fila_ant=0

dw_dist.InsertRow(1)
dw_lugar.settransobject(SQLCA)
dw_2.settransobject(SQLCA)
dw_lugar.insertrow(1)
dw_hora_resu.settransobject(SQLCA)
dw_dist.settransobject(SQLCA)
dw_2.getchild("codcc",dw_ccosto)
dw_ccosto.settransobject(SQLCA)
dw_ccosto.retrieve()
dw_ccosto.setfilter("coduf=''")
dw_ccosto.filter()
dw_2.insertrow(1)
pinta()
dw_dist.SetFocus()
dw_dist.SetColumn('documento')

long i
m_t = Create m_turnos
dw_t = Create uo_datastore
dw_t.DataObject = 'dw_turnos'
dw_t.SetTransObject(SQLCA)
dw_t.Retrieve()
for i = 1 to dw_t.RowCount()
	m_t.Item[i+1].visible = true
	m_t.Item[i+1].toolbaritemvisible = true
	m_t.Item[i+1].enabled = true
	m_t.Item[i+1].text = UPPER(dw_t.GetItemString(i,'descripcion'))
	m_t.Item[i+1].Tag = dw_t.GetItemString(i,'codigo')
	m_t.Item[i+1].toolbaritemtext=wordcap(dw_t.GetItemString(i,'descripcion'))
	if i = 16 then EXIT
next
for i = dw_t.RowCount() + 2 to 16
	m_t.Item[i].visible = FALSE
	m_t.Item[i].toolbaritemvisible = FALSE
	m_t.Item[i].enabled = FALSE	
next
dw_th = Create uo_datastore
dw_th.DataObject = 'dw_turnos_horas'
dw_th.SetTransObject(SQLCA)
dw_th.Retrieve()
mc_1.setselecteddate(today())
mc_1.event datechanged()
select tipodoc,documento,tipo into :td_u, :doc_u, :tipo_u from usuarios
where usuario = :usuario;
IF SQLCA.SQLCode = -1 THEN
	MessageBox("No se puede determinar documento del usuario", 'No puede modificar programaciones' + SQLCA.SQLErrText)
END IF

if isNull(doc_u) and tipo_u <> 'S' then
	MessageBox("Atención", 'No puede modificar programaciones. No está definida la identificación del usuario.' + SQLCA.SQLErrText)
end if

end event

type st_4 from statictext within w_programa_emp
integer x = 2885
integer y = 356
integer width = 261
integer height = 64
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421376
long backcolor = 16777215
string text = "Compensat"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_1 from statictext within w_programa_emp
integer x = 3150
integer y = 284
integer width = 261
integer height = 64
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
string text = "AgendaProf"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_7 from statictext within w_programa_emp
integer x = 2885
integer y = 284
integer width = 261
integer height = 64
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Libre"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type mc_1 from monthcalendar within w_programa_emp
integer x = 55
integer y = 1068
integer width = 1143
integer height = 744
integer taborder = 170
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long titletextcolor = 134217742
long trailingtextcolor = 134217745
long backcolor = 67108864
long monthbackcolor = 67108864
long titlebackcolor = 134217741
integer maxselectcount = 31
integer scrollrate = 1
boolean todaysection = true
boolean todaycircle = true
borderstyle borderstyle = styleraised!
end type

event datechanged;int ret
date fecha, f_ptr

getselecteddate(fecha)// = date(object.year(),object.month,object.day())
if DateTime(RelativeDate(fecha,-1*f_diaNumero(fecha) + 1)) <> desde then
	if cambio then 
		ret = MessageBox('Atención','Ha realizado cambios, Desea grabarlos?',QUESTION!,YESNOCANCEL!,3)
		if ret = 1 then
			cb_guarda.Event clicked()
		elseif ret = 3 then
			setselecteddate(date(desde))
			Return
		else
			cambio = FALSE
		end if
	end if
	
	desde = DateTime(RelativeDate(fecha,-1*f_diaNumero(fecha) + 1))
	hasta = DateTime(RelativeDate(fecha, 7 - f_diaNumero(fecha)))
	inimes = datetime(date(year(fecha),month(fecha),1))
	if month(fecha) = 12 then
		finmes = datetime(date(year(fecha) + 1,1,1))
	else
		finmes = datetime(date(year(fecha),month(fecha) + 1,1))
	end if
	finmes = datetime(RelativeDate(date(finmes), -1),time('23:59'))
//	resaltacal()
	pinta()
	
	dw_hora_resu.Retrieve(dw_dist.getItemString(1,'tipodoc'),dw_dist.getitemstring(1,'documento'),date(desde))
	dw_hm.Retrieve(dw_dist.getItemString(1,'tipodoc'),dw_dist.getitemstring(1,'documento'),inimes,finmes)
	dw_hs.Retrieve(dw_dist.getItemString(1,'tipodoc'),dw_dist.getitemstring(1,'documento'),desde,datetime(date(hasta),time('23:59')))
else
//	object.Value(desde)
end if

end event

type st_13 from statictext within w_programa_emp
integer x = 1225
integer y = 1244
integer width = 434
integer height = 52
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resumen Semanal"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_hs from datawindow within w_programa_emp
integer x = 1225
integer y = 1304
integer width = 471
integer height = 176
integer taborder = 70
string title = "none"
string dataobject = "dw_horas_mensuales"
boolean border = false
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)

end event

type st_12 from statictext within w_programa_emp
integer x = 1225
integer y = 1564
integer width = 434
integer height = 52
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resumen Mensual"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type pb_3 from picturebutton within w_programa_emp
event mosemove pbm_mousemove
integer x = 4398
integer y = 72
integer width = 137
integer height = 124
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "buscar.gif"
string disabledname = "d_buscar.gif"
string powertiptext = "Buscar empleado"
end type

event clicked;g_tercerodesde=13
openwithparm(w_busca_emp,dw_dist)
if not isNull(dw_dist.GetItemString(1,'documento')) then
	dw_dist.triggerEvent(itemchanged!)
end if

end event

type st_6 from statictext within w_programa_emp
integer x = 91
integer y = 376
integer width = 206
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lugar"
boolean focusrectangle = false
end type

type dw_lugar from datawindow within w_programa_emp
integer x = 82
integer y = 292
integer width = 704
integer height = 92
integer taborder = 20
string title = "none"
string dataobject = "dw_lugar_nom"
boolean border = false
boolean livescroll = true
end type

event itemchanged;acceptText()
string des,cod
cod = GetItemString(1,'codlugar')
select descripcion into :cl from lugar
where codlugar = :cod;

end event

type st_5 from statictext within w_programa_emp
boolean visible = false
integer x = 2738
integer y = 1664
integer width = 238
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Salida"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_programa_emp
integer x = 795
integer y = 296
integer width = 1664
integer height = 144
integer taborder = 30
string title = "none"
string dataobject = "dw_uf_cc"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string l_cod,l_cuf,l_vnul
AcceptText()
if this.getColumnName() = 'coduf' then
	setNull(l_vnul)
	this.setitem(1,'codcc',"")
	dw_ccosto.setfilter("coduf='"+this.getitemstring(1,'coduf')+"'")
	dw_ccosto.filter()
	acceptText()
	setItem(1,'codcc',l_vnul)
	l_cod = GetItemString(1,'coduf')
	select desufuncional into :uf from ufuncional
	where coduf = :l_cod;
else
	l_cuf = GetItemString(1,'coduf')
	l_cod = GetItemString(1,'codcc')
	select descripcion,color into :cc,:l_colo from centrocostos
	where coduf=:l_cuf and codcc=:l_cod;
	setItem(1,'color',l_colo)
end if


end event

type dw_dist from datawindow within w_programa_emp
integer x = 55
integer y = 72
integer width = 4320
integer height = 152
integer taborder = 10
string title = "none"
string dataobject = "dw_plant_emple"
borderstyle borderstyle = stylelowered!
end type

event clicked;if this.GetRow() <> row and row > 0  and string(dwo.name) = 'compute_1' then
	this.SetRow(row)
end if

end event

event itemchanged;this.accepttext()
string filtro, tipodoc, documento
long ncargo

tipodoc = this.getitemstring(this.getrow(),'tipodoc')
documento = this.getitemstring(this.getrow(),'documento')
if not isNull(dwo) then
	if string(dwo.Name) <> 'documento' then Return
end if
setNull(tipo_ts)
this.retrieve(tipodoc,documento)
IF this.rowcount()=0 THEN
	this.insertrow(0)
	messageBox ("Atención","Empleado no encontrado.")
	this.SetItem(1,'tipodoc',tipodoc)
	this.SetItem(1,'documento',documento)
	this.SetColumn('documento')
else
	dw_lugar.SetItem(1,'codlugar',GetItemString(getRow(),'codlugar'))
	dw_lugar.TriggerEvent(itemchanged!)
	dw_2.SetItem(1,'coduf',GetItemString(getRow(),'ufuncional'))
	dw_2.SetColumn("coduf")
	dw_2.TriggerEvent(itemchanged!)
	dw_2.SetItem(1,'codcc',GetItemString(getRow(),'ccosto'))
	dw_2.SetColumn("codcc")
	dw_2.TriggerEvent(itemchanged!)
	cl = GetItemString(getRow(),'des_cl')
	uf = GetItemString(getRow(),'des_uf')
	cc = GetItemString(getRow(),'des_cc')
	l_colo=GetItemnumber(getRow(),'color')
	dw_2.SetItem(1,'color',GetItemnumber(getRow(),'color'))
	ncargo = GetItemNumber(getRow(),'ncargo')
	dw_hora_resu.Retrieve(this.getItemString(this.getrow(),"tipodoc"),this.getitemstring(this.getrow(),"documento"),date(desde))
	dw_hm.Retrieve(tipodoc,documento,inimes,finmes)
	dw_hs.Retrieve(tipodoc,documento,desde,datetime(date(hasta),time('23:59')))

	SELECT NOM_ESQUEMA_TSUP.tipo, horas_base into :tipo_ts, :hbase
	FROM NOM_ESQUEMA_TSUP INNER JOIN EMPLEADOS ON NOM_ESQUEMA_TSUP.codtsup = EMPLEADOS.codtsup
	WHERE (EMPLEADOS.TipoDoc=:tipodoc AND EMPLEADOS.documento=:documento);
	IF SQLCA.SQLCode = -1 or SQLCA.SQLCode = 100 THEN
		setNull(tipo_ts)
	END IF
	if tipo_ts = 'M' or tipo_ts = 'S' then
		pb_4.Enabled = TRUE
	else
		pb_4.Enabled = FALSE
	end if
	if tipo_u = 'S' then
		cb_guarda.Enabled = TRUE
	else		
		select tipodoc_jefe, documento_jefe into :td_j,:doc_j from emplecargo
		where tipodoc=:tipodoc and documento=:documento and ncargo=:ncargo;
		IF SQLCA.SQLCode = -1 or isNull(doc_j) THEN
			MessageBox("SQL error. No se puede Determinar jefe Inmediato", 'No puede modificar programaciones' + SQLCA.SQLErrText)
			cb_guarda.Enabled = FALSE
		else
			if td_u = td_j and doc_u = doc_j then
				cb_guarda.Enabled = TRUE
			else
				cb_guarda.Enabled = FALSE
				MessageBox("atención", 'El usuario '+usuario+' con identificación '+td_u+doc_u+' No es jefe inmediato del empleado seleccionado. No puede modificar la programación')
			end if
		end if
	end if	
END IF

end event

event constructor;setTransObject(SQLCA)

end event

type st_2 from statictext within w_programa_emp
integer x = 64
integer y = 12
integer width = 329
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Empleado"
boolean focusrectangle = false
end type

type st_3 from statictext within w_programa_emp
boolean visible = false
integer x = 2747
integer y = 1656
integer width = 210
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Entrada"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_5 from datawindow within w_programa_emp
event clickup pbm_dwnlbuttonup
event mousemove pbm_dwnmousemove
integer x = 69
integer y = 444
integer width = 3483
integer height = 584
integer taborder = 40
string dataobject = "dw_programa_bar"
borderstyle borderstyle = styleraised!
end type

event clickup;pres=0
if row<1 then return
string cual
long columna,i,j
if string(dwo.type)="column" and string(dwo.name)<>"hora" then
	cual = right(string(dwo.name),1)
	columna=long(cual)
	if columna=colini and row=filaini then
		if (isNull(this.GetitemString(row,"pro"+cual)) or this.GetitemString(row,"pro"+cual) = '0') and (isNull(this.GetitemString(row,"cal"+cual)) or this.GetitemString(row,"cal"+cual) = '0') then
			if this.getitemstring(row,"sel"+cual)="1" then
				this.setitem(row,"sel"+cual,"0")
			else
				this.setitem(row,"sel"+cual,"1")
			end if
		end if
	end if
end if

end event

event mousemove;//if row<1 then return
//string scol
//long columna,i,j,fila
//string lugar,ufun,ccostos,dlugar,dccostos,dufun
//
//if string(dwo.type)="column" and string(dwo.name)<>"hora" then
//	scol = right(string(dwo.name),1)
//	if this.getitemstring(row,"dia"+scol)<>"" then
//		columna = long(scol)
//		ccostos = this.getitemstring(row,"dia"+scol)
//		ufun = this.getitemstring(row,"ufun"+scol)
//		lugar = this.getitemstring(row,"cc"+scol)
//		if col_ant <> columna or fila_ant<>row then
//			col_ant = columna
//			fila_ant = row
//			st_lugar.text = this.GetItemString(row,'clugar'+scol)
//			st_ufun.text = this.GetItemString(row,'des_uf'+scol)
//			st_ccosto.text = this.GetItemString(row,'des_cc'+scol)
//		end if
//	else
//		st_lugar.text=""
//		st_ufun.text=""
//		st_ccosto.text=""
//		col_ant=0
//		fila_ant=0
//	end if
//end if
//
//if pres=0 then Return
//
//if string(dwo.type)="column" and string(dwo.name)<>"hora" then
//	scol = right(string(dwo.name),1)
//	columna=long(scol)
//	if columna<>colini or row<>filaini then
//		int paso1,paso2
//		i = filaini
//		j = colini
//		if (row - filaini)= 0 then 
//			paso1=1
//		else
//			paso1 = (row - filaini) / abs(filaini - row)
//		end if
//		if (columna - colini) = 0 then 
//			paso2=1
//		else
//			paso2 = (columna - colini) / abs(colini - columna)
//		end if
//		do 
//			do 
//				if pb_1.PictureName = 'selec.gif' then
//					if (isNull(this.GetitemString(i,"pro"+string(j))) or this.GetitemString(i,"pro"+string(j)) = '0') and (isNull(this.GetitemString(i,"cal"+string(j))) or this.GetitemString(i,"cal"+string(j)) = '0') then
//						this.setitem(i,"sel"+string(j),"1")
//					end if
//				else
//					this.setitem(i,"sel"+string(j),"0")
//				end if
//				j= j+ paso2
//			loop until j = columna + paso2 
//			i = i + paso1
//			j=colini
//		loop until i = row +paso1 
//		
//	end if
//	ffin = row
//	cfin = long(scol)
//end if
//
end event

event buttonclicked;if this.rowcount()<1 then return
if dwo.name<>"b_hora" then
	choose case dwo.name
		case "b_dom"
			marcacol(1)
		case "b_lun"
			marcacol(2)
		case "b_mar"
			marcacol(3)
		case "b_mie"
			marcacol(4)
		case "b_jue"
			marcacol(5)
		case "b_vie"
			marcacol(6)
		case "b_sab"
			marcacol(7)
	end choose	
else
	marcafila(row)
end if


end event

event clicked;if string(dwo.type)="rectangle" then
	long fila
	if is_selected <> '' then Modify(is_selected+".pen.color='16777215'")   
	Modify(string(dwo.name)+".pen.color='16711680'")
	is_selected = dwo.name
	fila = dw_hora_resu.Find("objeto='"+is_selected+"'",1,dw_hora_resu.rowCount())
	if fila > 0 then dw_hora_resu.ScrolltoRow(fila)
end if

end event

event rbuttondown;if left(dwo.Name,3) = 'dia' then il_dia = long(mid(dwo.name,4))
if il_dia > 0 then
	int i
	for i = dw_t.RowCount() + 2 to 16
		m_t.Item[i].visible = FALSE
		m_t.Item[i].toolbaritemvisible = FALSE
		m_t.Item[i].enabled = FALSE	
	next
	m_t.popMenu(w_principal.PointerX(),w_principal.PointerY())
end if

end event

type st_8 from statictext within w_programa_emp
integer x = 3150
integer y = 356
integer width = 261
integer height = 64
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 16777215
string text = "Hora Extra"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_hm from datawindow within w_programa_emp
integer x = 1225
integer y = 1620
integer width = 471
integer height = 176
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_horas_mensuales"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

type em_1 from editmask within w_programa_emp
boolean visible = false
integer x = 3314
integer y = 1520
integer width = 178
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0:00"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event modified;dw_hora_resu.triggerevent(retrieveend!)
end event

type em_2 from editmask within w_programa_emp
boolean visible = false
integer x = 3314
integer y = 1632
integer width = 160
integer height = 84
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "23:59"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event modified;dw_hora_resu.triggerevent(retrieveend!)
end event

type em_cada from editmask within w_programa_emp
boolean visible = false
integer x = 2592
integer y = 1676
integer width = 165
integer height = 64
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
string text = "60"
boolean border = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
string minmax = "5~~180"
end type

event modified;dw_hora_resu.triggerevent(retrieveend!)
end event

type dw_hora_resu from datawindow within w_programa_emp
event type integer verifica ( integer fila )
event modifica ( integer fila )
integer x = 1911
integer y = 1072
integer width = 2935
integer height = 744
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_programa_emp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type integer verifica(integer fila);long i
st_interfec a, b, r
b.x = getItemDateTime(fila,'inicio')
b.y = getItemDateTime(fila,'fin')
for i = 1 to rowCount()
	if fila = i then Continue
	a.x = getItemDateTime(i,'inicio')
	a.y = getItemDateTime(i,'fin')
	r = interseccion(a,b)
	if not isNull(r.x) and not isnull(r.y) then
		messageBox('Atención','El intervalo de tiempo de la fila ' + string(fila) + ' se cruza con la fila '+ string(i))
		return -1
	end if
next
return 0

end event

event modifica(integer fila);double horaini, horafin, fraccion, largo, posx
long hora
string ret

horaini = secondsAfter(time("0"),time(this.getitemdatetime(fila,"Inicio")))/3600
horafin = secondsAfter(time("0"),time(this.getitemdatetime(fila,"fin")))/3600
hora = int(horaini)
fraccion = int((horaini - hora)*100)
posx = long(dw_5.describe("hora"+string(hora+1)+".x")) + long(dw_5.describe("hora"+string(hora)+".width"))*fraccion/100
hora = int(horafin)
fraccion = int((horafin - hora)*100)
largo = long(dw_5.describe("hora"+string(hora+1)+".x")) + long(dw_5.describe("hora"+string(hora)+".width"))*fraccion/100 - posx
ret = dw_5.Modify(getitemstring(fila,'objeto') + ".x='"+string(Posx)+"' "+getitemstring(fila,'objeto') + ".width='"+string(largo)+"'")
if ret <> '' then
	MessageBox('Atención','No pudo modificarse el objeto referente al horario '+string(getitemdatetime(fila,"Inicio")) + ' - ' + string(getitemdatetime(fila,"fin")))
end if

end event

event retrieveend;pinta()
if this.rowcount() > 0 then
	double horaini, horafin
	long hora, fraccion, posx, largo, i
	string ret
	long ll_color
	for i = 1 to this.rowcount()
		setItem(i,'h_ini',getItemDateTime(i,'inicio'))
		setItem(i,'h_fin',getItemDateTime(i,'fin'))
		horaini = secondsAfter(time("0"),time(this.getitemdatetime(i,"Inicio")))/3600
		horafin = secondsAfter(time("0"),time(this.getitemdatetime(i,"fin")))/3600
		if horaini < horafin then
			hora = int(horaini)
			fraccion = int((horaini - hora)*100)
			posx = long(dw_5.describe("hora"+string(hora+1)+".x")) + long(dw_5.describe("hora"+string(hora)+".width"))*fraccion/100
			hora = int(horafin)
			fraccion = int((horafin - hora)*100)
			largo = long(dw_5.describe("hora"+string(hora+1)+".x")) + long(dw_5.describe("hora"+string(hora)+".width"))*fraccion/100 - posx
			ll_color = getitemnumber(i,'color') 
			ret = dw_5.Modify("CREATE rectangle(band=detail x='"+string(Posx)+"' y='"+string((this.getitemnumber(i,"dia") - 1)*70 + 8)+"' height='60' width='"+string(largo)+"'  moveable=1 name=obj_"+string(i)+" visible='1' brush.hatch='6' brush.color='"+string(ll_color)+"' pen.style='0' pen.width='5' pen.color='16777215'  background.mode='2' background.color='0') ")
			if ret <> '' then
				MessageBox('Atención','No pudo agregare al horario '+string(horaini) + ' - ' + string(horafin))
				return -1
			end if
			if getItemString(i,'hextra') = '1' then
					ll_color = rgb(0,0,250)
			elseif getitemString(i,'compensa') = '1' then
//				ll_color = rgb(230,150,220)
			else
//				ll_color = getitemnumber(i,'color') 
			end if
			setItem(i,'objeto',"obj_"+string(i))
		end if
	next
end if

//if this.rowcount()>0 then
//	time horaini,horafin,va
//	horaini=relativetime(time("00:00"),this.getitemnumber(1,"menor"))
//	horafin=relativetime(time("00:00"),this.getitemnumber(1,"mayor"))
//	if horaini < time(em_1.text) then em_1.text=string(horaini)
//	if horafin > time(em_2.text) then em_2.text=string(horafin)
//	pinta()
//	long i,donde
//	for i = 1 to this.rowcount()
//		horaini=time(this.getitemdatetime(i,"Inicio"))
//		horafin=time(this.getitemdatetime(i,"fin"))
//		do while horaini < horafin
//			donde=dw_5.find("hora=time('"+string(horaini)+"')",1,dw_5.rowcount())
//			dw_5.setitem(donde,"dia"+string(this.getitemnumber(i,"dia")),dw_hora_resu.getitemstring(i,"ccosto"))
//			dw_5.setitem(donde,"ufun"+string(this.getitemnumber(i,"dia")),dw_hora_resu.getitemstring(i,"ufuncional"))
//			dw_5.setitem(donde,"cc"+string(this.getitemnumber(i,"dia")),dw_hora_resu.getitemstring(i,"clugar"))
//			dw_5.setitem(donde,"clugar"+string(this.getitemnumber(i,"dia")),dw_hora_resu.getitemstring(i,"des_cl"))
//			dw_5.setitem(donde,"des_uf"+string(this.getitemnumber(i,"dia")),dw_hora_resu.getitemstring(i,"des_uf"))
//			dw_5.setitem(donde,"des_cc"+string(this.getitemnumber(i,"dia")),dw_hora_resu.getitemstring(i,"des_cc"))
//			dw_5.setitem(donde,"pro"+string(this.getitemnumber(i,"dia")),dw_hora_resu.getitemstring(i,"agendaprof"))
//			dw_5.setitem(donde,"he"+string(this.getitemnumber(i,"dia")),dw_hora_resu.getitemstring(i,"hextra"))
//			dw_5.setitem(donde,"cp"+string(this.getitemnumber(i,"dia")),dw_hora_resu.getitemstring(i,"compensa"))
//			dw_5.setitem(donde,"cal"+string(this.getitemnumber(i,"dia")),dw_hora_resu.getitemstring(i,"calculado"))
//			dw_5.setitem(donde,"tr"+string(this.getitemnumber(i,"dia")),dw_hora_resu.getitemstring(i,"turno"))
//			horaini=relativetime(horaini,long(em_cada.text)*60)
//		loop	
//	next
//else
//	pinta()
//end if
//

end event

event constructor;setTransObject(SQLCA)

end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
//	operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

//messageBox(tipo,sqlSyntax)
//if operacion = 'Delete' then
//	if tipo = 'Delete' then
//		Return 0
//	else
//		Return 2
//	end if
//elseif operacion = 'Insert' then
//	if tipo = 'Insert' or tipo = 'Update' then
//		Return 0
//	else
//		Return 2
//	end if
//end if

end event

event rowfocuschanged;if currentrow = 0 then return 0
if is_selected <> getItemString(currentrow,'objeto') then
	if len(is_selected) > 0 then
		dw_5.modify(is_selected+".pen.color='16777215'") 
	end if
	dw_5.modify(getItemString(currentrow,'objeto')+".pen.color='16711680'")
	is_selected = getItemString(currentrow,'objeto')
end if

end event

event itemchanged;string campo
long largo, inicio
datetime ldt_ant
st_interfec a, b, r

if getcolumnName() = 'h_ini' then
	//setItem(getrow(),'h_ini',datetime(date(getItemdatetime(getrow(),'inicio')), time(datetime(data))))
	campo = 'inicio'
	b.x = datetime(date(getItemdatetime(getrow(),'inicio')), time(datetime(data)))
	b.y = getItemdatetime(getrow(),'fin')
end if 
if getcolumnName() = 'h_fin' then
	//setItem(getrow(),'h_fin',datetime(date(getItemdatetime(getrow(),'fin')), time(datetime(data))))
	campo = 'fin'
	b.x = getItemdatetime(getrow(),'inicio')
	b.y = datetime(date(getItemdatetime(getrow(),'fin')), time(datetime(data)))
end if

if len(campo) > 1 then
	if isnull(getItemDateTime(getrow(),'h_ini')) or isNull(getItemDateTime(getrow(),'h_fin')) then return 0
	int i
	for i = 1 to rowCount()
		if getrow() = i then Continue
		a.x = getItemDateTime(i,'inicio')
		a.y = getItemDateTime(i,'fin')
		r = interseccion(a,b)
		if not isNull(r.x) and not isnull(r.y) then
			messageBox('Atención','El intervalo de tiempo se cruza con la fila '+ string(i))
			return 1
		end if
	next
	setItem(getrow(),'inicio',b.x)
	setItem(getrow(),'fin',b.y)
	acceptText()
	post event modifica(getrow())
end if

return 0

end event

event rbuttondown;if this.rowcount()<1 then return
int l_i
il_dia=DayNumber(date(getitemdatetime(getrow(),'inicio')))
if il_dia=1 then il_dia=7 else il_dia=il_dia -1
setrow(row)
if il_dia > 0 then
	for l_i = 1 to upperbound(m_t.Item) - 1
		m_t.Item[L_i].visible = FALSE
		m_t.Item[L_i].toolbaritemvisible = FALSE
		m_t.Item[L_i].enabled = FALSE	
	next
	m_t.popMenu(w_principal.PointerX(),w_principal.PointerY())
end if

end event

type pb_6 from pb_report within w_programa_emp
integer x = 1573
integer y = 1048
integer taborder = 80
boolean bringtotop = true
string cod_rep = "NPR"
string nombre_rep = "Programación Empleados"
end type

event constructor;call super::constructor;inicia("interno!","NPR",clugar)
end event

event clicked;call super::clicked;any parametros[3]
parametros[1] = doc_j
parametros[2] = desde
parametros[3] = datetime(date(hasta),time('23:59'))
imprimir(parametros,'','0')

end event

type gb_1 from groupbox within w_programa_emp
event mouse pbm_mousemove
integer x = 32
integer y = 216
integer width = 4795
integer height = 1656
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Distribución de Obra Semanal"
end type

type cb_2 from picturebutton within w_programa_emp
event mousemove pbm_mousemove
boolean visible = false
integer x = 1728
integer y = 1580
integer width = 146
integer height = 128
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ocupar.gif"
string disabledname = "d_ocupar.gif"
string powertiptext = "Ocupar"
end type

event clicked;long fil,col
string valor
setNull(valor)
if isnull(dw_lugar.getitemstring(1,'codlugar')) then 
	messagebox('Alerta','Favor seleccione un lugar para asignar la mano de obra')
	return
end if
if isnull(dw_2.getitemstring(1,'coduf')) then 
	messagebox('Alerta','Favor seleccione una unidad funcional para asignar Tiempo')
	return
end if
if isnull(dw_2.getitemstring(1,'codcc')) then 
	messagebox('Alerta','Favor seleccione un centro de costo para asignar Tiempo')
	return
end if
for fil=1 to dw_5.rowcount()
	for col=1 to 7
		if dw_5.getitemstring(fil,'sel'+string(col)) = '1' then
			dw_5.setitem(fil,col,dw_2.getitemstring(1,'codcc')) //Centro Costo
			dw_5.SetItem(fil,'des_cc'+string(col),cc)
			dw_5.setitem(fil,'cc'+string(col),dw_lugar.getitemstring(1,'codlugar')) // Lugar
			dw_5.SetItem(fil,'clugar'+string(col),cl)
			dw_5.setitem(fil,'ufun'+string(col),dw_2.getitemstring(1,'coduf')) // U.funcional
			dw_5.SetItem(fil,'des_uf'+string(col),uf)
			dw_5.setitem(fil,'sel'+string(col),'0')
			dw_5.setitem(fil,'he'+string(col),'0')
			dw_5.setitem(fil,'cp'+string(col),'0')
			dw_5.setitem(fil,'pro'+string(col),'0')
		end if
	next
next
cambio = TRUE

end event

type pb_4 from picturebutton within w_programa_emp
event mousemove pbm_mousemove
boolean visible = false
integer x = 1728
integer y = 1180
integer width = 146
integer height = 128
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "-"
boolean originalsize = true
string picturename = "ocupar.gif"
string disabledname = "d_ocupar.gif"
string powertiptext = "Ocupar como Horas Extras"
end type

event clicked;long fil,col
string valor
setNull(valor)
if isnull(dw_lugar.getitemstring(1,'codlugar')) then 
	messagebox('Alerta','Favor seleccione un lugar para asignar la mano de obra')
	return
end if
if isnull(dw_2.getitemstring(1,'coduf')) then 
	messagebox('Alerta','Favor seleccione una unidad funcional para asignar Tiempo')
	return
end if
if isnull(dw_2.getitemstring(1,'codcc')) then 
	messagebox('Alerta','Favor seleccione un centro de costo para asignar Tiempo')
	return
end if
for fil=1 to dw_5.rowcount()
	for col=1 to 7
		if dw_5.getitemstring(fil,'sel'+string(col)) = '1' then
			dw_5.setitem(fil,col,dw_2.getitemstring(1,'codcc')) //Centro Costo
			dw_5.SetItem(fil,'des_cc'+string(col),cc)
			
			dw_5.setitem(fil,'cc'+string(col),dw_lugar.getitemstring(1,'codlugar')) // Lugar
			dw_5.SetItem(fil,'clugar'+string(col),cl)
			
			dw_5.setitem(fil,'ufun'+string(col),dw_2.getitemstring(1,'coduf')) // U.funcional
			dw_5.SetItem(fil,'des_uf'+string(col),uf)
			dw_5.setitem(fil,'sel'+string(col),'0')
			dw_5.setitem(fil,'he'+string(col),'1')
			dw_5.setitem(fil,'cp'+string(col),'0')
			dw_5.setitem(fil,'pro'+string(col),'0')
		end if
	next
next
cambio = TRUE

end event

type pb_sug from picturebutton within w_programa_emp
event mousemove pbm_mousemove
integer x = 1271
integer y = 1048
integer width = 146
integer height = 132
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "llevars.gif"
string disabledname = "d_llevars.gif"
string powertiptext = "Traer sugerido"
end type

event clicked;long i,f
uo_datastore dw_os
date f_dom
string l_cl,l_uf,l_cc,valor

dw_os = Create uo_datastore
dw_os.DataObject = 'dw_hora_prof_t_i'
dw_os.SetTransObject(SQLCA)

dw_os.Retrieve(dw_dist.GetItemString(1,'tipodoc'),dw_dist.GetItemString(1,'documento'),dw_dist.GetItemNumber(1,'ncargo'))

if dw_hora_resu.RowCount() > 0 then
	if MessageBox('Atención','Desea reemplazar la programación existente para la semana seleccionada?',QUESTION!,YESNO!,2) = 2 then Return 0
	i = 1
	do while dw_hora_resu.RowCount() > 0
		dw_hora_resu.DeleteRow(i)
		i = i + 1
	loop
end if
f_dom = date(desde)
for i = 1 to dw_os.RowCount()
	f = dw_hora_resu.InsertRow(0)
	l_cl = dw_os.GetItemString(i,'codlugar')
	l_uf = dw_os.GetItemString(i,'ufuncional')
	l_cc = dw_os.GetItemString(i,'ccosto')
	dw_hora_resu.SetItem(f,'tipodoc',dw_os.GetItemString(i,'tipodoc'))
	dw_hora_resu.SetItem(f,'documento',dw_os.GetItemString(i,'documento'))
	dw_hora_resu.SetItem(f,'ncargo',dw_os.GetItemNumber(i,'ncargo'))
	dw_hora_resu.SetItem(f,'clugar',l_cl)
	dw_hora_resu.SetItem(f,'ufuncional',l_uf)
	dw_hora_resu.SetItem(f,'ccosto',l_cc)
	dw_hora_resu.SetItem(f,'fecha_dom',f_dom)
	dw_hora_resu.SetItem(f,'item',i)
	dw_hora_resu.SetItem(f,'inicio',DateTime(RelativeDate(f_dom,dw_os.GetItemNumber(i,'dia') - 1),Time(dw_os.GetItemDatetime(i,'horaini'))))
	dw_hora_resu.SetItem(f,'fin',DateTime(RelativeDate(f_dom,dw_os.GetItemNumber(i,'dia') - 1),Time(dw_os.GetItemDatetime(i,'horafin'))))
	dw_hora_resu.Setitem(f,"Horas", round(secondsAfter(time(dw_os.GetItemDatetime(i,'horaini')),time(dw_os.GetItemDatetime(i,'horafin')))/3600,1) )
	
	Select descripcion into :valor from lugar
	where codlugar = :l_cl;
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return -1
	END IF
	dw_hora_resu.Setitem(f,"des_lu",valor)
	Select desufuncional into :valor from ufuncional
	where coduf = :l_uf;
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return -1
	END IF
	dw_hora_resu.Setitem(f,"des_uf",valor)
	Select descripcion into :valor from centrocostos
	where coduf = :l_uf and codcc = :l_cc;
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return -1
	END IF
	dw_hora_resu.Setitem(f,"des_cc",valor)
	
next
dw_hora_resu.TriggerEvent(RetrieveEnd!)

cambio = TRUE
end event

type pb_2 from picturebutton within w_programa_emp
event mosemove pbm_mousemove
integer x = 1422
integer y = 1048
integer width = 146
integer height = 128
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "medico.gif"
string disabledname = "d_medico.gif"
string powertiptext = "Traer programación de Profesionales"
end type

event clicked;//if messageBox('Atención','') = 2 then Return

f_trae_prog_prof(dw_dist.getItemString(1,'tipodoc'),dw_dist.getitemstring(1,'documento'),desde,hasta)
dw_hora_resu.Retrieve(dw_dist.getItemString(1,'tipodoc'),dw_dist.getitemstring(1,'documento'),date(desde))
dw_hm.Retrieve(dw_dist.getItemString(1,'tipodoc'),dw_dist.getitemstring(1,'documento'),inimes,finmes)
dw_hs.Retrieve(dw_dist.getItemString(1,'tipodoc'),dw_dist.getitemstring(1,'documento'),desde,hasta)

end event

type pb_1 from picturebutton within w_programa_emp
boolean visible = false
integer x = 1728
integer y = 1712
integer width = 151
integer height = 132
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "selec.gif"
alignment htextalign = left!
string powertiptext = "Seleccionar"
end type

event clicked;
if PictureName = "selec.gif" then
	PictureName = "deselec.gif"
	PowerTipText = "Deselecccionar"
else
	PictureName = "selec.gif"
	PowerTipText = "Selecccionar"
end if

end event

type cb_1 from picturebutton within w_programa_emp
event mosemove pbm_mousemove
boolean visible = false
integer x = 1728
integer y = 1444
integer width = 146
integer height = 128
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "desocupar.gif"
string disabledname = "d_desocupar.gif"
string powertiptext = "Desocupar"
end type

event clicked;long fil,col
string valor
setNull(valor)
for fil=1 to dw_5.rowcount()
	for col=1 to 7
		if dw_5.getitemstring(fil,'sel'+string(col))='1' then
			dw_5.setitem(fil,col,valor)
			dw_5.setitem(fil,'ufun'+string(col),valor)
			dw_5.setitem(fil,'cc'+string(col),valor)
			dw_5.setitem(fil,'sel'+string(col),'0')
			dw_5.setitem(fil,'he'+string(col),valor)
			dw_5.setitem(fil,'cp'+string(col),valor)
			dw_5.setitem(fil,'pro'+string(col),valor)
		end if
	next
next

cambio = TRUE

end event

type pb_5 from picturebutton within w_programa_emp
event mousemove pbm_mousemove
boolean visible = false
integer x = 1728
integer y = 1312
integer width = 151
integer height = 132
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "casa.gif"
string disabledname = "d_casa.gif"
string powertiptext = "Ocupar como Compensatorio"
end type

event clicked;long fil,col
string valor
setNull(valor)
if isnull(dw_lugar.getitemstring(1,'codlugar')) then 
	messagebox('Alerta','Favor seleccione un lugar para asignar la mano de obra')
	return
end if
if isnull(dw_2.getitemstring(1,'coduf')) then 
	messagebox('Alerta','Favor seleccione una unidad funcional para asignar Tiempo')
	return
end if
if isnull(dw_2.getitemstring(1,'codcc')) then 
	messagebox('Alerta','Favor seleccione un centro de costo para asignar Tiempo')
	return
end if
for fil=1 to dw_5.rowcount()
	for col=1 to 7
		if dw_5.getitemstring(fil,'sel'+string(col)) = '1' then
			dw_5.setitem(fil,col,dw_2.getitemstring(1,'codcc')) //Centro Costo
			dw_5.SetItem(fil,'des_cc'+string(col),cc)
			
			dw_5.setitem(fil,'cc'+string(col),dw_lugar.getitemstring(1,'codlugar')) // Lugar
			dw_5.SetItem(fil,'clugar'+string(col),cl)
			
			dw_5.setitem(fil,'ufun'+string(col),dw_2.getitemstring(1,'coduf')) // U.funcional
			dw_5.SetItem(fil,'des_uf'+string(col),uf)
			dw_5.setitem(fil,'sel'+string(col),'0')
			dw_5.setitem(fil,'cp'+string(col),'1')
			dw_5.setitem(fil,'he'+string(col),'0')
			dw_5.setitem(fil,'pro'+string(col),'0')
		end if
	next
next
cambio = TRUE

end event

type cb_guarda from picturebutton within w_programa_emp
event mousemove pbm_mousemove
integer x = 1728
integer y = 1048
integer width = 146
integer height = 128
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
string powertiptext = "Guardar"
end type

event clicked;if dw_dist.rowcount() < 1 then 
	messagebox('Atención','Seleccione un empleado')
	return
end if
//cb_1.triggerevent(clicked!)
///////////////////// Ojo se necesita hacer la función
if f_ver_horas() = -1 then Return -1
/////////////////////
long fila, i
date f_dia
time horaini,horafin
//string ccost,lugar,ufun,valor,ccpt,lugarpt,ufunpt,extra,extpt, com, compt, aprof, appt
//empezo=0

for i = 1 to dw_hora_resu.rowCount()
	if dw_hora_resu.getItemNumber(i,'horascomp') < 0 then
		messageBox('Atención','La hora de inicio no puede ser mayor que la de finalización')
		return -1
	end if
	dw_hora_resu.setItem(i,'horas', dw_hora_resu.getItemNumber(i,'horascomp'))
next
if dw_hora_resu.update() = -1 then
	Rollback;
else
	Commit;
end if
cambio = FALSE
dw_hm.Retrieve(dw_dist.getItemString(1,'tipodoc'),dw_dist.getitemstring(1,'documento'),inimes,finmes)
dw_hs.Retrieve(dw_dist.getItemString(1,'tipodoc'),dw_dist.getitemstring(1,'documento'),desde,datetime(date(hasta),time('23:59')))

long hnorm, hext, hcomp, doms, tdom
string td,doc
datetime f1,f2
td  = dw_dist.getItemString(1,'tipodoc')
doc = dw_dist.getitemstring(1,'documento')
hnorm = long(dw_hm.Describe("Evaluate('sum(if(hextra=~~'0~~' and compensa=~~'0~~',total,0))',0)"))
hext = long(dw_hm.Describe("Evaluate('sum(if(hextra=~~'1~~',total,0))',0)"))
hcomp = long(dw_hm.Describe("Evaluate('sum(if(compensa=~~'1~~',total,0))',0)"))

for i = 1 to day(date(finmes))
	f1 = datetime(RelativeDate(date(inimes),i - 1))
	if dayNumber(date(f1)) > 1 and not festivo(f1) then Continue
	f2 = datetime(date(f1),time('23:59'))
	select sum(horas) into :doms from nom_programacion
	where tipodoc=:td and documento=:doc and inicio>=:f1 and inicio<=:f2 and (hextra is Null or hextra='0') ;
	if isNull(doms) then doms = 0
	tdom = tdom + doms
next

if tdom < hcomp then
	MessageBox('Atención','Las horas compensadas superan las horas dominicales y festivos dentro del mes '+string(hcomp)+' - '+string(tdom)+'. Los cambios fueron grabados. Si desea corregirla debe modificarla y grabar de nuevo')
end if

end event

