$PBExportHeader$w_programa_cir.srw
forward
global type w_programa_cir from window
end type
type dw_det_sala from datawindow within w_programa_cir
end type
type tab_1 from tab within w_programa_cir
end type
type tp_1 from userobject within tab_1
end type
type pb_muestra from picturebutton within tp_1
end type
type st_10 from statictext within tp_1
end type
type dw_todos from datawindow within tp_1
end type
type st_7 from statictext within tp_1
end type
type dw_cruce from datawindow within tp_1
end type
type pb_find from picturebutton within tp_1
end type
type dw_anula from datawindow within tp_1
end type
type pb_prog from picturebutton within tp_1
end type
type pb_delcir from picturebutton within tp_1
end type
type pb_newcir from picturebutton within tp_1
end type
type pb_del from picturebutton within tp_1
end type
type pb_new from picturebutton within tp_1
end type
type st_6 from statictext within tp_1
end type
type st_4 from statictext within tp_1
end type
type st_1 from statictext within tp_1
end type
type dw_cirprofe from datawindow within tp_1
end type
type dw_qxcita_cir from datawindow within tp_1
end type
type dw_qxcita from datawindow within tp_1
end type
type tp_1 from userobject within tab_1
pb_muestra pb_muestra
st_10 st_10
dw_todos dw_todos
st_7 st_7
dw_cruce dw_cruce
pb_find pb_find
dw_anula dw_anula
pb_prog pb_prog
pb_delcir pb_delcir
pb_newcir pb_newcir
pb_del pb_del
pb_new pb_new
st_6 st_6
st_4 st_4
st_1 st_1
dw_cirprofe dw_cirprofe
dw_qxcita_cir dw_qxcita_cir
dw_qxcita dw_qxcita
end type
type tp_2 from userobject within tab_1
end type
type hsb_1 from hscrollbar within tp_2
end type
type st_help from statictext within tp_2
end type
type pb_2 from pb_report within tp_2
end type
type st_9 from statictext within tp_2
end type
type em_emp from editmask within tp_2
end type
type st_8 from statictext within tp_2
end type
type dw_det_prog from datawindow within tp_2
end type
type pb_atras from picturebutton within tp_2
end type
type pb_guardar from picturebutton within tp_2
end type
type st_3 from statictext within tp_2
end type
type em_time from editmask within tp_2
end type
type pb_trae from picturebutton within tp_2
end type
type dw_min_prof from datawindow within tp_2
end type
type st_5 from statictext within tp_2
end type
type st_hora from statictext within tp_2
end type
type st_hora2 from statictext within tp_2
end type
type st_hora1 from statictext within tp_2
end type
type uo_1 from u_ddcal within tp_2
end type
type dw_prog_sala from datawindow within tp_2
end type
type st_2 from statictext within tp_2
end type
type dw_sala from datawindow within tp_2
end type
type dw_profes from datawindow within tp_2
end type
type gb_2 from groupbox within tp_2
end type
type tp_2 from userobject within tab_1
hsb_1 hsb_1
st_help st_help
pb_2 pb_2
st_9 st_9
em_emp em_emp
st_8 st_8
dw_det_prog dw_det_prog
pb_atras pb_atras
pb_guardar pb_guardar
st_3 st_3
em_time em_time
pb_trae pb_trae
dw_min_prof dw_min_prof
st_5 st_5
st_hora st_hora
st_hora2 st_hora2
st_hora1 st_hora1
uo_1 uo_1
dw_prog_sala dw_prog_sala
st_2 st_2
dw_sala dw_sala
dw_profes dw_profes
gb_2 gb_2
end type
type tab_1 from tab within w_programa_cir
tp_1 tp_1
tp_2 tp_2
end type
end forward

global type w_programa_cir from window
integer width = 4096
integer height = 1924
boolean titlebar = true
string title = "Programación de Cirugías"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "bisturi_re.ico"
boolean center = true
dw_det_sala dw_det_sala
tab_1 tab_1
end type
global w_programa_cir w_programa_cir

type variables
datawindowchild idw_profe,idw_aneste
datetime i_fechaini
boolean i_asigno
int i_dia=0,i_inicia,i_termina
long i_ncita
string i_clug_cita
date i_fecha
end variables

forward prototypes
public subroutine resumen_profes ()
end prototypes

public subroutine resumen_profes ();tab_1.tp_1.dw_cirprofe.accepttext()
tab_1.tp_1.dw_todos.reset()
boolean todos=true
long j ,k,actual
string cprof
actual=tab_1.tp_1.dw_qxcita_cir.getrow()
tab_1.tp_1.setredraw(false)
tab_1.tp_1.dw_qxcita_cir.setredraw(false)
tab_1.tp_1.dw_cirprofe.setfilter('')
tab_1.tp_1.dw_cirprofe.filter()
for k=1 to tab_1.tp_1.dw_cirprofe.rowcount()
	if tab_1.tp_1.dw_cirprofe.getitemstring(k,'tipo')='0' then
		cprof=tab_1.tp_1.dw_cirprofe.getitemstring(k,'codprof')
	else
		cprof=tab_1.tp_1.dw_cirprofe.getitemstring(k,'anest')
	end if
	if isnull(cprof) then 
		todos=false
		continue
	end if
	j=tab_1.tp_1.dw_todos.find('codprof="'+cprof+'"',1,tab_1.tp_1.dw_todos.rowcount())
	if j=0 then
		j=tab_1.tp_1.dw_todos.insertrow(0)
		tab_1.tp_1.dw_todos.setitem(j,'codprof',cprof)
	end if
next
tab_1.tp_1.dw_qxcita_cir.setrow(actual)
tab_1.tp_1.dw_qxcita_cir.event rowfocuschanged(actual)
tab_1.tp_1.setredraw(true)
tab_1.tp_1.dw_qxcita_cir.setredraw(true)
if todos then tab_1.tp_1.pb_muestra.event clicked()

end subroutine

on w_programa_cir.create
this.dw_det_sala=create dw_det_sala
this.tab_1=create tab_1
this.Control[]={this.dw_det_sala,&
this.tab_1}
end on

on w_programa_cir.destroy
destroy(this.dw_det_sala)
destroy(this.tab_1)
end on

event open;tab_1.tp_1.dw_qxcita.reset()
tab_1.tp_1.dw_qxcita_cir.reset()
tab_1.tp_1.dw_cirprofe.reset()
tab_1.tp_1.dw_qxcita.retrieve(tipdoc,docu)
i_asigno=false
i_dia=0
tab_1.tp_2.dw_prog_sala.reset()
tab_1.selectedtab=1
end event

type dw_det_sala from datawindow within w_programa_cir
boolean visible = false
integer x = 1728
integer width = 2034
integer height = 104
integer taborder = 40
string title = "none"
string dataobject = "dw_det_sala"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

type tab_1 from tab within w_programa_cir
integer x = 18
integer width = 3776
integer height = 1816
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
alignment alignment = center!
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.Control[]={this.tp_1,&
this.tp_2}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
end on

type tp_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3739
integer height = 1688
long backcolor = 67108864
string text = "Citas QX"
long tabtextcolor = 33554432
string picturename = "bisturi_re.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra el Historial de Actos Qx del Paciente"
pb_muestra pb_muestra
st_10 st_10
dw_todos dw_todos
st_7 st_7
dw_cruce dw_cruce
pb_find pb_find
dw_anula dw_anula
pb_prog pb_prog
pb_delcir pb_delcir
pb_newcir pb_newcir
pb_del pb_del
pb_new pb_new
st_6 st_6
st_4 st_4
st_1 st_1
dw_cirprofe dw_cirprofe
dw_qxcita_cir dw_qxcita_cir
dw_qxcita dw_qxcita
end type

on tp_1.create
this.pb_muestra=create pb_muestra
this.st_10=create st_10
this.dw_todos=create dw_todos
this.st_7=create st_7
this.dw_cruce=create dw_cruce
this.pb_find=create pb_find
this.dw_anula=create dw_anula
this.pb_prog=create pb_prog
this.pb_delcir=create pb_delcir
this.pb_newcir=create pb_newcir
this.pb_del=create pb_del
this.pb_new=create pb_new
this.st_6=create st_6
this.st_4=create st_4
this.st_1=create st_1
this.dw_cirprofe=create dw_cirprofe
this.dw_qxcita_cir=create dw_qxcita_cir
this.dw_qxcita=create dw_qxcita
this.Control[]={this.pb_muestra,&
this.st_10,&
this.dw_todos,&
this.st_7,&
this.dw_cruce,&
this.pb_find,&
this.dw_anula,&
this.pb_prog,&
this.pb_delcir,&
this.pb_newcir,&
this.pb_del,&
this.pb_new,&
this.st_6,&
this.st_4,&
this.st_1,&
this.dw_cirprofe,&
this.dw_qxcita_cir,&
this.dw_qxcita}
end on

on tp_1.destroy
destroy(this.pb_muestra)
destroy(this.st_10)
destroy(this.dw_todos)
destroy(this.st_7)
destroy(this.dw_cruce)
destroy(this.pb_find)
destroy(this.dw_anula)
destroy(this.pb_prog)
destroy(this.pb_delcir)
destroy(this.pb_newcir)
destroy(this.pb_del)
destroy(this.pb_new)
destroy(this.st_6)
destroy(this.st_4)
destroy(this.st_1)
destroy(this.dw_cirprofe)
destroy(this.dw_qxcita_cir)
destroy(this.dw_qxcita)
end on

type pb_muestra from picturebutton within tp_1
integer x = 1234
integer y = 1264
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "buscar.gif"
alignment htextalign = left!
string powertiptext = "Traer programavion en común de los profesionales"
end type

event clicked;date l_fecha

l_fecha =today()
l_fecha=date('2019-02-23')
dw_cirprofe.setfilter('')
dw_cirprofe.filter()
if dw_cirprofe.find('(tipo="0" and isnull(codprof)) or (tipo="1" and isnull(anest))',1,dw_cirprofe.rowcount())>0 then
	messagebox('Atención','Debe escoger todos los profesionales')
	dw_qxcita_cir.event rowfocuschanged(dw_qxcita_cir.getrow())
	return
end if
sqlca.autocommit=true
CHOOSE case dw_cirprofe.rowcount()
	case 1
		if dw_cruce.dataobject<>'dw_dispon1' then 
			if g_motor='postgres' then
				dw_cruce.dataobject='dw_dispon1_postgres'
			else
				dw_cruce.dataobject='dw_dispon1'
			end if
			dw_cruce.settransobject(sqlca)
		end if
		dw_cruce.retrieve(today(),dw_cirprofe.getitemstring(1,'codprof'))
	case 2
		if dw_cruce.dataobject<>'dw_dispon2' then 
			if g_motor='postgres' then
				dw_cruce.dataobject='dw_dispon2_postgres'
			else
				dw_cruce.dataobject='dw_dispon2'
			end if
			dw_cruce.settransobject(sqlca)
		end if
		dw_cruce.retrieve(l_fecha,dw_cirprofe.getitemstring(1,'codprof'),dw_cirprofe.getitemstring(2,'codprof'))
	case 3
		if dw_cruce.dataobject<>'dw_dispon3' then 
			if g_motor='postgres' then
				dw_cruce.dataobject='dw_dispon3_postgres'				
			else
				dw_cruce.dataobject='dw_dispon3'
			end IF
			dw_cruce.settransobject(sqlca)
		end if
		dw_cruce.retrieve(l_fecha,dw_cirprofe.getitemstring(1,'codprof'),dw_cirprofe.getitemstring(2,'codprof'),dw_cirprofe.getitemstring(3,'codprof'))
	case 4
		if dw_cruce.dataobject<>'dw_dispon4' then 
			if g_motor='postgres' then	
				dw_cruce.dataobject='dw_dispon4_postgres'				
			else
				dw_cruce.dataobject='dw_dispon4'
			end if
			dw_cruce.settransobject(sqlca)
		end if
		dw_cruce.retrieve(l_fecha,dw_cirprofe.getitemstring(1,'codprof'),dw_cirprofe.getitemstring(2,'codprof'),dw_cirprofe.getitemstring(3,'codprof'),dw_cirprofe.getitemstring(4,'codprof'))
end choose
sqlca.autocommit=false
dw_qxcita_cir.event rowfocuschanged(dw_qxcita_cir.getrow())
end event

type st_10 from statictext within tp_1
integer x = 23
integer y = 1216
integer width = 558
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Profesionales del Acto:"
boolean focusrectangle = false
end type

type dw_todos from datawindow within tp_1
integer x = 23
integer y = 1272
integer width = 1198
integer height = 380
integer taborder = 60
string title = "none"
string dataobject = "dw_profes_acto"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_7 from statictext within tp_1
integer x = 1403
integer y = 776
integer width = 1211
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Programación en común de los Profesionales del Acto:"
boolean focusrectangle = false
end type

type dw_cruce from datawindow within tp_1
integer x = 1394
integer y = 832
integer width = 1897
integer height = 816
integer taborder = 90
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_find from picturebutton within tp_1
integer x = 3049
integer y = 256
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "buscar.gif"
string disabledname = "d_buscar.gif"
string powertiptext = "Traer Actos Solicitados en Cons. Ext."
end type

event clicked;st_prog_cir st
st.dw_qxcita=dw_qxcita
st.dw_qxcita_cir=dw_qxcita_cir
st.dw_cirprofe=dw_cirprofe
st.idw_profe=idw_profe
openwithparm(w_actos_pend,st)
end event

type dw_anula from datawindow within tp_1
boolean visible = false
integer x = 3237
integer y = 52
integer width = 114
integer height = 136
integer taborder = 90
boolean enabled = false
string title = "none"
string dataobject = "dw_anula_citaqx"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_prog from picturebutton within tp_1
integer x = 3314
integer y = 836
integer width = 142
integer height = 124
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "adelante_1.gif"
string disabledname = "d_adelante_1.gif"
string powertiptext = "Ir a programar Cirugía"
end type

event clicked;long j,donde,cuantos
string prof
tab_1.tp_2.dw_profes.reset()
dw_cirprofe.setfilter('')
dw_cirprofe.filter()
for j=1 to dw_cirprofe.rowcount()
	if isnull(dw_cirprofe.getitemstring(j,'codprof')) then
		messagebox("Atención",'No ha asignado todos los profesionales')
		dw_qxcita_cir.triggerevent(rowfocuschanged!)
		return
	end if
next
if dw_cruce.rowcount()=0 then
	messagebox('Atención','No hay programación en común de los Profesionales')
	return
end if
for j=1 to dw_qxcita_cir.rowcount()
	if isnull(dw_qxcita_cir.getitemstring(j,'codproced')) or dw_qxcita_cir.getitemstring(j,'codproced')='' then
		messagebox("Aytención",'Debe colocar todos los códigos de las cirugías')
		dw_qxcita_cir.scrolltorow(j)
		dw_qxcita_cir.setfocus()
		return
	end if
	if isnull(dw_qxcita_cir.getitemnumber(j,'tiempoqx')) or dw_qxcita_cir.getitemnumber(j,'tiempoqx')=0 then
		messagebox("Aytención",'Debe colocar todos los tiempos de las cirugías')
		dw_qxcita_cir.scrolltorow(j)
		dw_qxcita_cir.setfocus()
		return
	end if
	dw_cirprofe.setfilter('nro_cir='+string(dw_qxcita_cir.getitemnumber(j,'nro_cir'))+' and tipo="0"')
	dw_cirprofe.filter()
	prof=dw_cirprofe.getitemstring(1,'codprof')
	dw_cirprofe.setfilter('codprof="'+prof+'" and tipo="0"')
	dw_cirprofe.filter()
	donde=tab_1.tp_2.dw_profes.find('prof="'+prof+'"',1,tab_1.tp_2.dw_profes.rowcount())
	if donde=0 then
		if dw_cirprofe.rowcount()=5 then
			messagebox("Atención", 'Está tratando de programar más de 5 profesionales en total, lo cual no es posible')
			dw_qxcita_cir.triggerevent(rowfocuschanged!)
			return
		end if
		donde=tab_1.tp_2.dw_profes.insertrow(0)
	end if
	tab_1.tp_2.dw_profes.setitem(donde,'prof',prof)
	tab_1.tp_2.dw_profes.setitem(donde,'tiempo',dw_cirprofe.getitemnumber(1,'t_tiempo'))
next
dw_cirprofe.setfilter('tipo="1"')
dw_cirprofe.filter()
if dw_cirprofe.rowcount()>0 then
	prof=dw_cirprofe.getitemstring(1,'codprof')
	donde=tab_1.tp_2.dw_profes.find('prof="'+prof+'"',1,tab_1.tp_2.dw_profes.rowcount())
	if donde=0 then
		if dw_cirprofe.rowcount()=5 then
			messagebox("Atención", 'Está tratando de programar más de 5 profesionales en total, lo cual no es posible')
			dw_qxcita_cir.triggerevent(rowfocuschanged!)
			return
		end if
		donde=tab_1.tp_2.dw_profes.insertrow(0)
		tab_1.tp_2.dw_profes.setitem(donde,'prof',prof)
		tab_1.tp_2.dw_profes.setitem(donde,'tiempo',dw_qxcita_cir.getitemnumber(1,'t_tiempo'))
	else
		if tab_1.tp_2.dw_profes.getitemnumber(donde,'tiempo')<dw_qxcita_cir.getitemnumber(1,'t_tiempo') then
			tab_1.tp_2.dw_profes.setitem(donde,'tiempo',dw_qxcita_cir.getitemnumber(1,'t_tiempo'))
		end if
	end if
end if
dw_qxcita_cir.triggerevent(rowfocuschanged!)
tab_1.tp_2.em_time.text=string(dw_qxcita_cir.getitemnumber(1,'t_tiempo'))
tab_1.tp_2.uo_1.init_cal(date(dw_cruce.getitemdatetime(dw_cruce.getrow(),'fecha')))
tab_1.selectedtab=2
end event

type pb_delcir from picturebutton within tp_1
integer x = 3314
integer y = 596
integer width = 142
integer height = 124
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Procedimiento del Acto"
end type

event clicked;if dw_qxcita_cir.rowcount()=0 then return
if not isnull(dw_qxcita_cir.getitemnumber(dw_qxcita_cir.getrow(),'contador')) then
	messagebox('Atención', 'No puede borrar esta cirugía ya que viene de una solicitud en consulta externa')
	return
end if
do while dw_cirprofe.rowcount()>0 
	dw_cirprofe.deleterow(0)
loop
dw_qxcita_cir.deleterow(0)
dw_qxcita_cir.triggerevent(rowfocuschanged!)
dw_cruce.reset()
resumen_profes()
end event

type pb_newcir from picturebutton within tp_1
integer x = 3314
integer y = 452
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Nuevo procedimiento del Acto"
end type

event clicked;dw_qxcita_cir.insertrow(1)
long j
for j=1 to dw_qxcita_cir.rowcount()
	if dw_qxcita_cir.find('nro_cir='+string(j),1,dw_qxcita_cir.rowcount())=0 then exit
next
dw_qxcita_cir.setitem(1,'nro_cir',j)
dw_cirprofe.insertrow(1)
dw_cirprofe.setitem(1,'nro_cir',j)
dw_cirprofe.setitem(1,'tipo','0')
dw_qxcita_cir.scrolltorow(1)
dw_qxcita_cir.setcolumn('codproced')
dw_qxcita_cir.event doubleclicked(0,0,1,dw_qxcita_cir.object.codproced)
end event

type pb_del from picturebutton within tp_1
integer x = 3049
integer y = 128
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Anular Cita QX"
end type

event clicked;if dw_qxcita.rowcount()=0 then return
choose case dw_qxcita.getitemstring(dw_qxcita.getrow(),'r_estado')
	case 'Anulada'
		messagebox('Atencíon','Ya se encuentra anulada')
	case 'Pendiente'
		if messagebox("Atención",'Está seguro que desea anular esta cita ?.',question!,yesno!,2)=2 then return
		string snul
		long nnul,j
		setnull(snul)
		setnull(nnul)
		dw_qxcita.setitem(dw_qxcita.getrow(),'estado',usuario)
		if dw_qxcita.update()=-1 then
			rollback;
			return
		end if
		for j=1 to dw_qxcita_cir.rowcount()
			dw_qxcita_cir.setitem(j,'contador',nnul)
			dw_qxcita_cir.setitem(j,'clugar_os',snul)
			dw_qxcita_cir.setitem(j,'nsolicitud',nnul)
			dw_qxcita_cir.setitem(j,'item_os',nnul)
		next
		if dw_qxcita_cir.update()=-1 then
			rollback;
			return
		end if
		dw_cirprofe.setredraw(false)
		dw_cirprofe.setfilter('')
		dw_cirprofe.filter()
		for j=1 to dw_cirprofe.rowcount()
			dw_cirprofe.setitem(j,'ncita_proc',nnul)
			dw_cirprofe.setitem(j,'clugar_citaproc',snul)
			dw_cirprofe.setitem(j,'item_citaproc',nnul)
		next
		dw_anula.retrieve(dw_qxcita.getitemnumber(dw_qxcita.getrow(),'ncita'),dw_qxcita.getitemstring(dw_qxcita.getrow(),'clugar'))
		if dw_cirprofe.update()=-1 then
			rollback;
			return
		end if
		do while dw_anula.rowcount()>0
			dw_anula.deleterow(0)
		loop
		if dw_anula.update()=-1 then
			rollback;
		else
			commit;
		end if
		dw_cirprofe.setredraw(true)
		dw_qxcita_cir.triggerevent(rowfocuschanged!)
	case 'Realizado'
		messagebox('Atencíon','Ya fue atendida')
	case 'No asistió'
		messagebox('Atencíon','Ya no se puede Anular')
end choose
end event

type pb_new from picturebutton within tp_1
integer x = 3049
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Nuevo Acto Quirúrgico a programar"
end type

event clicked;if docu='' or isnull(docu) then return
dw_qxcita.insertrow(1)
dw_qxcita.setitem(1,'tipodoc',tipdoc)
dw_qxcita.setitem(1,'documento',docu)
dw_qxcita.setitem(1,'usuario',usuario)
dw_qxcita.scrolltorow(1)
enabled=false
pb_del.powertiptext='Borrar Registro Nuevo'
pb_newcir.enabled=true
pb_delcir.enabled=true
pb_prog.enabled=true
pb_newcir.event clicked()


end event

type st_6 from statictext within tp_1
integer x = 23
integer y = 776
integer width = 594
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Profesionales de la Cirugía"
boolean focusrectangle = false
end type

type st_4 from statictext within tp_1
integer x = 27
integer y = 384
integer width = 384
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cirugías del Acto"
boolean focusrectangle = false
end type

type st_1 from statictext within tp_1
integer x = 27
integer width = 667
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de Citas de Actos Qx"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_cirprofe from datawindow within tp_1
integer x = 18
integer y = 832
integer width = 1330
integer height = 352
integer taborder = 80
string title = "none"
string dataobject = "dw_qxcita_cir_profe"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

getchild('codprof',idw_profe)
idw_profe.settransobject(sqlca)
//idw_profe.retrieve()
end event

event itemchanged;long j
choose case getcolumnname()
	case 'codprof'
		for j=1 to dw_qxcita_cir.rowcount()
			dw_qxcita_cir.setitem(j,'simultanea','0')
		next
		for j=1 to rowcount()
			setitem(j,'codprof',data)
		next		
		dw_cruce.reset()
		resumen_profes()
	case 'anest'
		setredraw(false)
		setfilter('tipo="1"')
		filter()
		for j=1 to rowcount()
			setitem(j,'anest',data)
			setitem(j,'codprof',data)
		next
		setfilter('nro_cir='+string(dw_qxcita_cir.getitemnumber(dw_qxcita_cir.getrow(),'nro_cir')))
		filter()
		setredraw(true)
		dw_cruce.reset()
		resumen_profes()
end choose
end event

type dw_qxcita_cir from datawindow within tp_1
event p_itemchanged ( long p_fila )
integer x = 23
integer y = 436
integer width = 3255
integer height = 312
integer taborder = 50
string title = "none"
string dataobject = "dw_qxcita_cir"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged(long p_fila);accepttext()
long ti,mod
ti=getitemnumber(p_fila,'tiempoqx')
mod=mod(ti,5)
if mod>2 then
	ti+= 5 -mod
else
	ti -= mod
end if
setitem(p_fila,'tiempoqx',ti)
long j
for j=1 to dw_cirprofe.rowcount()
	dw_cirprofe.setitem(j,'tiempo',getitemnumber(p_fila,'tiempoqx'))
next
end event

event constructor;settransobject(sqlca)
getchild('codtipoanestesia',idw_aneste)
idw_aneste.settransobject(sqlca)
idw_aneste.retrieve()

end event

event rowfocuschanged;if getrow()<1 then return
//idw_profe.retrieve(getitemstring(getrow(),'espe'))
if isnull(getitemnumber(getrow(),'nro_cir')) then
	dw_cirprofe.setfilter('isnull(nro_cir)')
else
	dw_cirprofe.setfilter('nro_cir='+string(getitemnumber(getrow(),'nro_cir')))
end if
dw_cirprofe.filter()
end event

event itemchanged;long j
choose case getcolumnName()
	case 'simultanea'
		if rowcount()>1 and data='1' then
			string prof
			dw_cirprofe.setfilter("tipo='0' and nro_cir="+string(getitemnumber(getrow(),'nro_cir')))
			dw_cirprofe.filter()
			prof=dw_cirprofe.getitemstring(1,'codprof')
			if not isnull(prof) then
				dw_cirprofe.setfilter('tipo="0" and nro_cir<>'+string(getitemnumber(getrow(),'nro_cir'))+' and codprof="'+prof+'"')
			else
				settext('0')
				dw_cirprofe.setfilter('nro_cir='+string(getitemnumber(getrow(),'nro_cir')))
				dw_cirprofe.filter()
				return 1
			end if
			dw_cirprofe.filter()
			if dw_cirprofe.rowcount()>0 then
				settext('0')
				dw_cirprofe.setfilter('nro_cir='+string(getitemnumber(getrow(),'nro_cir')))
				dw_cirprofe.filter()
				return 1
			end if
			dw_cirprofe.setfilter('nro_cir='+string(getitemnumber(getrow(),'nro_cir')))
			dw_cirprofe.filter()
		end if
		for j=1 to dw_cirprofe.rowcount()
			dw_cirprofe.setitem(j,'simultanea',data)
		next
	case 'espe'
		string nulo
		setnull(nulo)
		dw_cirprofe.setfilter('nro_cir='+string(getitemnumber(getrow(),'nro_cir'))+' and tipo="0"')
		dw_cirprofe.filter()
		for j=1 to dw_cirprofe.rowcount()
			dw_cirprofe.setitem(j,'codesp',data)
			dw_cirprofe.setitem(j,'codprof',nulo)
		next
		for j=1 to rowcount()
			setitem(j,'simultanea','0')
		next
		dw_cirprofe.setfilter('nro_cir='+string(getitemnumber(getrow(),'nro_cir')))
		dw_cirprofe.filter()
		idw_profe.retrieve(data)
		dw_cruce.reset()
		resumen_profes()
	case 'codtipoanestesia'
		string ane
		setnull(ane)
		setitem(getrow(),'anestesiologo',idw_aneste.getitemstring(idw_aneste.getrow(),'anestesiologo'))
		dw_cirprofe.setfilter('nro_cir='+string(getitemnumber(getrow(),'nro_cir'))+' and tipo="1"')
		dw_cirprofe.filter()
		if getitemstring(getrow(),'anestesiologo')='1' then
			if dw_cirprofe.rowcount()=0 then
				dw_cirprofe.setfilter('tipo="1"')
				dw_cirprofe.filter()
				if dw_cirprofe.rowcount()>0 then ane=dw_cirprofe.getitemstring(1,'anest')
				dw_cirprofe.insertrow(1)
				dw_cirprofe.setitem(1,'nro_cir',getitemnumber(getrow(),'nro_cir'))
				dw_cirprofe.setitem(1,'tipo','1')
				dw_cirprofe.setitem(1,'anest',ane)
				dw_cirprofe.setitem(1,'codprof',ane)
			end if
		else
			do while dw_cirprofe.rowcount()>0
				dw_cirprofe.deleterow(1)
			loop
		end if
		dw_cirprofe.setfilter('nro_cir='+string(getitemnumber(getrow(),'nro_cir')))
		dw_cirprofe.filter()
		dw_cruce.reset()
		resumen_profes()
	case 'codproced'
		if this.gettext()<>'' and not isnull(this.gettext()) then
			string desproc,cproc,parto,para,sexo
			long tiempo
			cproc=this.gettext()
			setnull(desproc)
			setnull(para)
			sexo=w_principal.dw_1.getitemstring(1,'sexo')
			SELECT Proced.Descripcion, Proced.parto, proced.tiempoqx,Min(QxConfiguracion.Sexo) 
			into :desproc,:parto,:tiempo,:para
			FROM (SERVICIOSMAN LEFT outer JOIN QxConfiguracion ON (SERVICIOSMAN.codservicio = QxConfiguracion.Proced) AND (SERVICIOSMAN.CodManual = QxConfiguracion.CodManual)) INNER JOIN (Proced INNER JOIN Tarifas ON Proced.CodProced = Tarifas.CodProced) ON (SERVICIOSMAN.codservicio = Tarifas.codservicio) AND (SERVICIOSMAN.CodManual = Tarifas.CodManual)
			WHERE (((SERVICIOSMAN.tiposervicio)='P' Or (SERVICIOSMAN.tiposervicio)='Q') AND ((Proced.estado)='1') AND ((SERVICIOSMAN.estado)='1'))
			GROUP BY Proced.Descripcion, Proced.parto, Proced.CodProced, proced.tiempoqx
			HAVING (((Proced.CodProced)=:cproc));
			if sqlca.sqlcode=-1 then
				messagebox('Atención',sqlca.sqlerrtext)
				return 1
			end if
			if isnull(desproc) or desproc='' then 
				this.settext('')
				this.setitem(row,'codproced','')
				return 1
			end if
			if parto='1' and sexo='M' then
				messagebox("Atención",'Este procedimiento es solo para sexo femenino')
				this.settext('')
				this.setitem(row,'codproced','')
				return 1
			end if
			if not isnull(para) then
				if para<>'A' then
					if (sexo='M' and para='F') or ( sexo='F' and para='M') then
						messagebox("Atención",'Este procedimiento es solo para sexo '+para)
						this.settext('')
						this.setitem(row,'codproced','')
						return 1
					end if
				end if
			end if
			this.setitem(row,'descripcion',desproc)
			this.setitem(row,'tiempoqx',tiempo)
		end if
	case 'tiempoqx'
		post event p_itemchanged(row)
end choose
end event

event doubleclicked;if this.getcolumnname()='codproced' then
	open(w_busca_qx)
	st_cirug st
	st=message.powerobjectparm
	if isvalid(st) then
		this.setitem(row,'codproced',st.proccups)
		this.event itemchanged(row,dwo,st.proccups)
	end if
end if
end event

event retrieveend;resumen_profes()
end event

type dw_qxcita from datawindow within tp_1
integer x = 23
integer y = 52
integer width = 2999
integer height = 316
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "dw_qxcita"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;dw_qxcita_cir.reset()
dw_cirprofe.reset()
dw_todos.reset()
dw_cruce.reset()
if getrow()<1 then return
i_ncita=getitemnumber(getrow(),'ncita')
i_clug_cita=getitemstring(getrow(),'clugar')

dw_cirprofe.retrieve(i_ncita,i_clug_cita)
dw_qxcita_cir.retrieve(i_ncita,i_clug_cita)

end event

event rowfocuschanging;if not pb_new.enabled then return 1
end event

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3739
integer height = 1688
long backcolor = 67108864
string text = "Programación"
long tabtextcolor = 33554432
string picturename = "asig_cita.ico"
long picturemaskcolor = 536870912
string powertiptext = "Asignar Sala y Profesionales para el Acto Quirúrgico"
hsb_1 hsb_1
st_help st_help
pb_2 pb_2
st_9 st_9
em_emp em_emp
st_8 st_8
dw_det_prog dw_det_prog
pb_atras pb_atras
pb_guardar pb_guardar
st_3 st_3
em_time em_time
pb_trae pb_trae
dw_min_prof dw_min_prof
st_5 st_5
st_hora st_hora
st_hora2 st_hora2
st_hora1 st_hora1
uo_1 uo_1
dw_prog_sala dw_prog_sala
st_2 st_2
dw_sala dw_sala
dw_profes dw_profes
gb_2 gb_2
end type

on tp_2.create
this.hsb_1=create hsb_1
this.st_help=create st_help
this.pb_2=create pb_2
this.st_9=create st_9
this.em_emp=create em_emp
this.st_8=create st_8
this.dw_det_prog=create dw_det_prog
this.pb_atras=create pb_atras
this.pb_guardar=create pb_guardar
this.st_3=create st_3
this.em_time=create em_time
this.pb_trae=create pb_trae
this.dw_min_prof=create dw_min_prof
this.st_5=create st_5
this.st_hora=create st_hora
this.st_hora2=create st_hora2
this.st_hora1=create st_hora1
this.uo_1=create uo_1
this.dw_prog_sala=create dw_prog_sala
this.st_2=create st_2
this.dw_sala=create dw_sala
this.dw_profes=create dw_profes
this.gb_2=create gb_2
this.Control[]={this.hsb_1,&
this.st_help,&
this.pb_2,&
this.st_9,&
this.em_emp,&
this.st_8,&
this.dw_det_prog,&
this.pb_atras,&
this.pb_guardar,&
this.st_3,&
this.em_time,&
this.pb_trae,&
this.dw_min_prof,&
this.st_5,&
this.st_hora,&
this.st_hora2,&
this.st_hora1,&
this.uo_1,&
this.dw_prog_sala,&
this.st_2,&
this.dw_sala,&
this.dw_profes,&
this.gb_2}
end on

on tp_2.destroy
destroy(this.hsb_1)
destroy(this.st_help)
destroy(this.pb_2)
destroy(this.st_9)
destroy(this.em_emp)
destroy(this.st_8)
destroy(this.dw_det_prog)
destroy(this.pb_atras)
destroy(this.pb_guardar)
destroy(this.st_3)
destroy(this.em_time)
destroy(this.pb_trae)
destroy(this.dw_min_prof)
destroy(this.st_5)
destroy(this.st_hora)
destroy(this.st_hora2)
destroy(this.st_hora1)
destroy(this.uo_1)
destroy(this.dw_prog_sala)
destroy(this.st_2)
destroy(this.dw_sala)
destroy(this.dw_profes)
destroy(this.gb_2)
end on

type hsb_1 from hscrollbar within tp_2
boolean visible = false
integer x = 1605
integer y = 1628
integer width = 338
integer height = 52
boolean stdheight = false
integer minposition = 30
integer maxposition = 700
integer position = 100
end type

event lineleft;if position=30 then return
IF Position < MinPosition + 10 THEN
   Position = MinPosition
ELSE
   Position = Position - 10
END IF
dw_prog_sala.object.datawindow.zoom=position
//st_zoom.text='Zoom: '+string(position)+' %'
end event

event lineright;if position=maxposition then return
IF Position > MaxPosition - 10 THEN
   Position = MaxPosition
ELSE
   Position = Position + 10
END IF
dw_prog_sala.object.datawindow.zoom=position
//st_zoom.text='Zoom: '+string(position)+' %'

end event

event moved;dw_prog_sala.object.datawindow.zoom=scrollpos
//st_zoom.text='Zoom: '+string(scrollpos)+' %'
end event

event pageleft;IF Position < MinPosition + 30 THEN
   Position = MinPosition
ELSE
   Position = Position - 30
END IF
dw_prog_sala.object.datawindow.zoom=position
//st_zoom.text='Zoom: '+string(position)+' %'
end event

event pageright;IF Position > MaxPosition - 30 THEN
   Position = MaxPosition
ELSE
   Position = Position + 30
END IF
dw_prog_sala.object.datawindow.zoom=position
//st_zoom.text='Zoom: '+string(position)+' %'
end event

type st_help from statictext within tp_2
integer x = 2117
integer y = 1608
integer width = 1326
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_2 from pb_report within tp_2
integer x = 457
integer y = 896
integer taborder = 80
string powertiptext = "Imprimir Detalle de Turnos de la Sala"
string cod_rep = "PSQX"
string nombre_rep = "Programación de Sala QX"
string tipo_rep = "interno!"
boolean v_preliminar = true
end type

event constructor;call super::constructor;if inicia()=-1 then return
dw_det_prog.create(report.dw_rep.describe('datawindow.syntax'))
end event

event clicked;call super::clicked;if dw_det_prog.rowcount()>0 then
//	any par[3]
//	par[1]=dw_sala.getitemstring(1,1)
//	par[2]=i_fechaini
//	par[3]=datetime(relativedate(date(i_fechaini),8))
//	imprimir(par)
	any par[2]
	par[1]=dw_profes.getitemstring(1,'prof')
	par[2]=i_fecha
	imprimir(par,'','0')
end if
end event

type st_9 from statictext within tp_2
integer x = 1134
integer y = 188
integer width = 338
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Empezar a las:"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_emp from editmask within tp_2
integer x = 1486
integer y = 172
integer width = 302
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event modified;if g_motor='postgres' then
	if dw_prog_sala.dataobject='dw_muestra_cruceqx0_postgres' or dw_profes.rowcount()=0 then return
else
	if dw_prog_sala.dataobject='dw_muestra_cruceqx0' or dw_profes.rowcount()=0 then return
end if

if not isnull(dw_profes.getitemdatetime(1,'iniciaqx')) then return
if i_asigno then dw_prog_sala.event desocupa()
long dia,j,otro,k,interv=5
dia=long(right(dw_prog_sala.getcolumnName(),1))
j=int(secondsafter(time('00:00'),time(text))/60)/interv +1
if dw_prog_sala.getitemnumber(j,'est'+string(dia))=0 then return
otro=dw_prog_sala.find('est'+string(dia)+'=0',j+1,j -1  + long(em_time.text)/interv)//buscar si hay uno donde no esté disponible
if otro<>0 then 
	messagebox("Atención",'A esta hora no tiene el espacio suficiente para programar el Acto')
	return
end if	
dw_prog_sala.setredraw(false)
dw_prog_sala.setcolumn('est'+string(dia))
i_inicia=j 
i_termina=j + long(em_time.text)/interv
for k=i_inicia to i_termina -1
	dw_prog_sala.setitem(k,'est'+string(dia),2)
next
i_asigno=true
i_dia=dia
dw_prog_sala.scrolltorow(j)
dw_prog_sala.setredraw(true)
end event

type st_8 from statictext within tp_2
integer x = 649
integer y = 264
integer width = 823
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de programación del Cirujano:"
boolean focusrectangle = false
end type

type dw_det_prog from datawindow within tp_2
integer x = 622
integer y = 324
integer width = 1605
integer height = 872
integer taborder = 70
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_atras from picturebutton within tp_2
integer x = 1961
integer y = 1228
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "atras_1.gif"
string powertiptext = "Asignar Otro Profsional"
end type

event clicked;tab_1.selectedtab=1


end event

type pb_guardar from picturebutton within tp_2
integer x = 1998
integer y = 20
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "guardar.gif"
string powertiptext = "Asignar Turnos"
end type

event clicked;//if not i_asigno then return
uo_datastore dw_agenda
dw_agenda=create uo_datastore
if g_motor='postgres' then
	dw_agenda.dataobject='dw_agendaprof_qx_postgres'
else
	dw_agenda.dataobject='dw_agendaprof_qx'
end if
dw_agenda.settransobject(sqlca)
datetime fecha
time hora
fecha=datetime(relativedate(date(i_fechaini), i_dia -1))

hora=time(dw_prog_sala.getitemdatetime(i_inicia,'hora'))

tab_1.tp_1.dw_qxcita.setitem(1,'tiniciaqx',datetime(date(fecha),time(dw_prog_sala.getitemdatetime(i_inicia,'hora'))))
tab_1.tp_1.dw_qxcita.setitem(1,'tterminaqx',datetime(date(fecha),time(dw_prog_sala.getitemdatetime(i_termina,'hora'))))
tab_1.tp_1.dw_qxcita.setitem(1,'codigosala',dw_sala.getitemstring(1,1))
tab_1.tp_1.dw_qxcita.setitem(1,'clugar',clugar)
long ncita
select max(ncita) into :ncita from qxcita where clugar=:clugar;
if sqlca.sqlcode=-1 then 
	messagebox("Error leyendo qxcita",sqlca.sqlerrtext)
	return
end if
if isnull(ncita) then ncita=0
ncita ++
tab_1.tp_1.dw_qxcita.setitem(1,'ncita',ncita)


//return

if tab_1.tp_1.dw_qxcita.update()=-1 then
	rollback;
	return
end if
dw_agenda.retrieve(fecha,hora)
dw_agenda.filter()
long j,donde,k,ncita2,ncita3,tlleva=0
for j=1 to tab_1.tp_1.dw_qxcita_cir.rowcount()
	tab_1.tp_1.dw_qxcita_cir.setitem(j,'ncita',ncita)
	tab_1.tp_1.dw_qxcita_cir.setitem(j,'clugar_cita',clugar)
	if tab_1.tp_1.dw_qxcita_cir.getitemstring(j,'simultanea')='1' then
		tab_1.tp_1.dw_qxcita_cir.setitem(j,'iniciacir',datetime(date(fecha),time(dw_prog_sala.getitemdatetime(i_inicia,'hora'))))
		tab_1.tp_1.dw_qxcita_cir.setitem(j,'terminacir',datetime(date(fecha),relativetime(time(dw_prog_sala.getitemdatetime(i_inicia,'hora')),tab_1.tp_1.dw_qxcita_cir.getitemnumber(j,'tiempoqx')*60)))
	else
		tab_1.tp_1.dw_qxcita_cir.setitem(j,'iniciacir',datetime(date(fecha),relativetime(time(dw_prog_sala.getitemdatetime(i_inicia,'hora')),tlleva*60)))
		tab_1.tp_1.dw_qxcita_cir.setitem(j,'terminacir',datetime(date(fecha),relativetime(time(dw_prog_sala.getitemdatetime(i_inicia,'hora')),60*(tlleva + tab_1.tp_1.dw_qxcita_cir.getitemnumber(j,'tiempoqx')))))
		tlleva+=tab_1.tp_1.dw_qxcita_cir.getitemnumber(j,'tiempoqx')
	end if
next
if tab_1.tp_1.dw_qxcita_cir.update()=-1 then
	rollback;
	return
end if
select max(ncita) into :ncita2 from qxcita_proced where clugar=:clugar;
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo qxcita_proced",sqlca.sqlerrtext)
	rollback;
	return
end if
if isnull(ncita2) then ncita2=0
ncita2 ++
select max(ncita_nro) into :ncita3 from qxcita_cir_profe ;
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo qxcita_cir_profe",sqlca.sqlerrtext)
	rollback;
	return
end if
if isnull(ncita3) then ncita3=0
ncita3 ++
time term
for j=1 to dw_profes.rowcount()
	donde=dw_agenda.find('prof="'+dw_profes.getitemstring(j,'prof')+'"',1,dw_agenda.rowcount())
	if donde=0 then
		messagebox("Atención","No se puede hallar un registro en agendaprof")
		rollback;
		return
	else
		dw_profes.setitem(j,'fecha',fecha)
		dw_profes.setitem(j,'hora',dw_agenda.getitemdatetime(donde,'hora'))
		dw_profes.setitem(j,'iniciaqx',dw_prog_sala.getitemdatetime(i_inicia,'hora'))
		term=time(dw_profes.getitemdatetime(j,'iniciaqx'))
		term=relativetime(term,dw_profes.getitemnumber(j,'tiempo')*60)
		dw_profes.setitem(j,'terminaqx',datetime(date(dw_profes.getitemdatetime(j,'iniciaqx')),term))
		dw_profes.setitem(j,'usuario',usuario)
		dw_profes.setitem(j,'ncita',ncita2)
		dw_profes.setitem(j,'clugar',clugar)
		dw_profes.setitem(j,'item',j)
		tab_1.tp_1.dw_cirprofe.setfilter('codprof="'+dw_profes.getitemstring(j,'prof')+'"')
		tab_1.tp_1.dw_cirprofe.filter()
		for k=1 to tab_1.tp_1.dw_cirprofe.rowcount()
			tab_1.tp_1.dw_cirprofe.setitem(k,'ncita_nro',ncita3)
			ncita3 ++
			tab_1.tp_1.dw_cirprofe.setitem(k,'ncita',ncita)
			tab_1.tp_1.dw_cirprofe.setitem(k,'clugar_cita',clugar)
			tab_1.tp_1.dw_cirprofe.setitem(k,'ncita_proc',ncita2)
			tab_1.tp_1.dw_cirprofe.setitem(k,'clugar_citaproc',clugar)
			tab_1.tp_1.dw_cirprofe.setitem(k,'item_citaproc',j)
		next
	end if
next
if dw_profes.update()=-1 then
	rollback;
	return
end if
if tab_1.tp_1.dw_cirprofe.update()=-1 then
	rollback;
	return
end if
commit;
dw_prog_sala.setredraw(false)
for j=i_inicia to i_termina -1
	dw_prog_sala.setitem(j,'est'+string(i_dia),0)
	dw_prog_sala.setitem(j,'sala'+string(i_dia),1)
	if j -i_inicia<=dw_profes.getitemnumber(1,'tiempo') then dw_prog_sala.setitem(j,'profa_'+string(i_dia),2)
	if dw_profes.rowcount()>=2 then 
		if j -i_inicia<=dw_profes.getitemnumber(2,'tiempo') then dw_prog_sala.setitem(j,'profb_'+string(i_dia),2)
	end if
	if dw_profes.rowcount()>=3 then 
		if j -i_inicia<=dw_profes.getitemnumber(3,'tiempo') then dw_prog_sala.setitem(j,'profc_'+string(i_dia),2)
	end if
	if dw_profes.rowcount()>=4 then 
		if j -i_inicia<=dw_profes.getitemnumber(4,'tiempo') then dw_prog_sala.setitem(j,'profd_'+string(i_dia),2)
	end if
	if dw_profes.rowcount()>=5 then 
		if j -i_inicia<=dw_profes.getitemnumber(5,'tiempo') then dw_prog_sala.setitem(j,'profe_'+string(i_dia),2)
	end if
next
dw_prog_sala.setredraw(true)
i_asigno=false
i_dia=0
tab_1.tp_1.pb_new.enabled=true
tab_1.tp_1.pb_newcir.enabled=false
tab_1.tp_1.pb_delcir.enabled=false
//tab_1.tp_1.pb_prog.enabled=false
end event

type st_3 from statictext within tp_2
integer x = 1801
integer y = 252
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mins a Utilizar:"
boolean focusrectangle = false
end type

type em_time from editmask within tp_2
integer x = 1824
integer y = 172
integer width = 302
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
string mask = "###"
end type

event modified;if i_asigno then dw_prog_sala.event desocupa()
end event

type pb_trae from picturebutton within tp_2
integer x = 1851
integer y = 24
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
boolean originalsize = true
string picturename = "llevar.gif"
alignment htextalign = left!
string powertiptext = "Traer Datos de disponibilidad de Sala y Profesional(es)"
end type

event clicked;if isnull(dw_sala.getitemstring(1,1)) or dw_sala.getitemstring(1,1)='' then return
setpointer(hourglass!)
string profes[]
long j
dw_profes.accepttext()
for j=1 to dw_profes.rowcount()
	if isnull(dw_profes.getitemstring(j,'prof')) or dw_profes.getitemstring(j,'prof')='' then
		messagebox("Atención","Complete los profesionales para el Acto Qx")
		return
	end if
	profes[j]=dw_profes.getitemstring(j,'prof')
next
sqlca.autocommit=true
dw_prog_sala.setredraw(false)
choose case dw_profes.rowcount()
	case 1
		if g_motor='postgres' then
			dw_min_prof.dataobject='dw_qxcruce1_postgres'			
		else
			dw_min_prof.dataobject='dw_qxcruce1'
		end if
		dw_min_prof.settransobject(sqlca)
		dw_min_prof.retrieve(dw_sala.getitemstring(1,1),i_fechaini,profes[1])
		dw_prog_sala.dataobject='dw_muestra_cruceqx1'
	case 2
		if g_motor='postgres' then
			dw_min_prof.dataobject='dw_qxcruce2_postgres'
		else
			dw_min_prof.dataobject='dw_qxcruce2'
		end if
		dw_min_prof.settransobject(sqlca)
		dw_min_prof.retrieve(dw_sala.getitemstring(1,1),i_fechaini,profes[1],profes[2])
		dw_prog_sala.dataobject='dw_muestra_cruceqx2'
	case 3
		if g_motor='postgres' then
			dw_min_prof.dataobject='dw_qxcruce3'
		else
			dw_min_prof.dataobject='dw_qxcruce3_postgres'
		end if
		dw_min_prof.settransobject(sqlca)
		dw_min_prof.retrieve(dw_sala.getitemstring(1,1),i_fechaini,profes[1],profes[2],profes[3])
		dw_prog_sala.dataobject='dw_muestra_cruceqx3'
	case 4
		if g_motor='postgres' then
			dw_min_prof.dataobject='dw_qxcruce4_postgres'
		else
			dw_min_prof.dataobject='dw_qxcruce4'
 		end if
		dw_min_prof.settransobject(sqlca)
		dw_min_prof.retrieve(dw_sala.getitemstring(1,1),i_fechaini,profes[1],profes[2],profes[3],profes[4])
		dw_prog_sala.dataobject='dw_muestra_cruceqx4'
	case 5
		if g_motor='postgres' then
			dw_min_prof.dataobject='dw_qxcruce5_postgres'
		else
			dw_min_prof.dataobject='dw_qxcruce5'
		end if
		dw_min_prof.settransobject(sqlca)
		dw_min_prof.retrieve(dw_sala.getitemstring(1,1),i_fechaini,profes[1],profes[2],profes[3],profes[4],profes[5])
		dw_prog_sala.dataobject='dw_muestra_cruceqx5'
end choose
dw_prog_sala.modify("t_1.text='Do"+string(day(date(i_fechaini)))+"'")
dw_prog_sala.modify("t_2.text='Lu"+string(day(relativedate(date(i_fechaini),1)))+"'")
dw_prog_sala.modify("t_3.text='Ma"+string(day(relativedate(date(i_fechaini),2)))+"'")
dw_prog_sala.modify("t_4.text='Mi"+string(day(relativedate(date(i_fechaini),3)))+"'")
dw_prog_sala.modify("t_5.text='Ju"+string(day(relativedate(date(i_fechaini),4)))+"'")
dw_prog_sala.modify("t_6.text='Vi"+string(day(relativedate(date(i_fechaini),5)))+"'")
dw_prog_sala.modify("t_7.text='Sa"+string(day(relativedate(date(i_fechaini),6)))+"'")
sqlca.autocommit=false
dw_min_prof.rowscopy(1,dw_min_prof.rowcount(),primary!,dw_prog_sala,1,primary!)
dw_prog_sala.setredraw(true)
i_asigno=false
i_dia=0
st_help.text='Detalle de Disponibilidad de la Sala y Profesionales'
end event

type dw_min_prof from datawindow within tp_2
boolean visible = false
integer x = 18
integer y = 728
integer width = 494
integer height = 88
integer taborder = 50
string title = "none"
string dataobject = "dw_qxcruce2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_5 from statictext within tp_2
integer y = 4
integer width = 389
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha a Asignar:"
boolean focusrectangle = false
end type

type st_hora from statictext within tp_2
integer x = 3442
integer y = 4
integer width = 174
integer height = 48
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
long textcolor = 33554432
long backcolor = 67108864
string text = "00:00"
boolean focusrectangle = false
end type

type st_hora2 from statictext within tp_2
integer x = 1961
integer y = 1508
integer width = 151
integer height = 40
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
long textcolor = 33554432
long backcolor = 67108864
string text = "24:00"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_hora1 from statictext within tp_2
integer x = 2107
integer y = 48
integer width = 178
integer height = 40
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
long textcolor = 33554432
long backcolor = 67108864
string text = "00:00"
alignment alignment = right!
boolean focusrectangle = false
end type

type uo_1 from u_ddcal within tp_2
integer y = 68
integer height = 628
integer taborder = 20
end type

on uo_1.destroy
call u_ddcal::destroy
end on

event constructor;call super::constructor;init_cal(today())
set_date_format ( "dd/mmm/yyyy" )
post event pe_clicked()
end event

event e_prev;call super::e_prev;triggerevent("pe_clicked")
end event

event pe_clicked;call super::pe_clicked;datetime inicia
inicia=datetime(relativedate(uo_1.id_date_selected,1 - daynumber(uo_1.id_date_selected)))
if inicia<>i_fechaini then
	i_fechaini=inicia
	dw_sala.triggerevent(itemchanged!)
end if
dw_prog_sala.modify("t_1.text='Do"+string(day(date(i_fechaini)))+"'")
dw_prog_sala.modify("t_2.text='Lu"+string(day(relativedate(date(i_fechaini),1)))+"'")
dw_prog_sala.modify("t_3.text='Ma"+string(day(relativedate(date(i_fechaini),2)))+"'")
dw_prog_sala.modify("t_4.text='Mi"+string(day(relativedate(date(i_fechaini),3)))+"'")
dw_prog_sala.modify("t_5.text='Ju"+string(day(relativedate(date(i_fechaini),4)))+"'")
dw_prog_sala.modify("t_6.text='Vi"+string(day(relativedate(date(i_fechaini),5)))+"'")
dw_prog_sala.modify("t_7.text='Sa"+string(day(relativedate(date(i_fechaini),6)))+"'")
end event

event e_prox;call super::e_prox;triggerevent("pe_clicked")
end event

type dw_prog_sala from datawindow within tp_2
event desocupa ( )
integer x = 2341
integer width = 1330
integer height = 1612
integer taborder = 30
string title = "none"
string dataobject = "dw_muestra_cruceqx2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event desocupa();long j
setredraw(false)
for j=i_inicia to i_termina -1
	setitem(j,'est'+string(i_dia),1)
next
setredraw(true)
i_asigno=false
i_dia=0
end event

event retrieveend;if rowcount=0 then
	long j,k
	time hora
	for j=0 to 1439
		hora=relativetime(time('00:00:00'),j*60)
		k=insertrow(0)
		setitem(k,'hora_c',datetime(uo_1.id_date_selected,hora))
	next
end if
end event

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;if currentrow<1 then return
st_hora.y=(currentrow -long(Object.Datawindow.FirstRowOnPage))*4 +40
st_hora.text=string(getitemdatetime(currentrow,'hora'),'hh:mm am/pm')

end event

event scrollvertical;string firstr, lastr
firstr = Object.Datawindow.FirstRowOnPage
lastr = Object.Datawindow.LastRowOnPage
st_hora1.text=string(getitemdatetime(long(firstr),'hora'),'hh:mm a/p')
st_hora2.text=string(getitemdatetime(long(lastr),'hora'),'hh:mm a/p')

end event

event clicked;if dwo.type<>'compute' or rowcount()=0 or dataobject='dw_muestra_cruceqx0' or dw_profes.rowcount()=0 then return
if not isnull(dw_profes.getitemdatetime(1,'iniciaqx')) then return
if i_asigno then
	if i_dia=long(right(dwo.name,1)) then
		return
	elseif getitemnumber(1,'min'+right(dwo.name,1))<>0 then
		event desocupa()
	end if
end if
long j=1,donde=0,k,otro,interv=5
if getitemnumber(1,'min'+right(dwo.name,1))<>0 then 
	do while j< 1440/interv -1
		donde=find('est'+right(dwo.name,1)+'=1',j,rowcount())
		if donde=0 then 
			j=1440/interv -1
			exit
		end if
		otro=find('est'+right(dwo.name,1)+'=0',donde,donde -1 + long(em_time.text)/interv)//buscar si hay uno donde no esté disponible
		if otro<>0 then //hay hueco y debe pasar a otro
			j= otro
		else
			setredraw(false)
			setcolumn('est'+right(dwo.name,1))
			i_inicia=donde
			i_termina=donde + long(em_time.text)/interv
			em_emp.text=string(time(getitemdatetime(i_inicia,'hora')))
			for k=i_inicia to i_termina -1
				setitem(k,'est'+right(dwo.name,1),2)
			next
			i_asigno=true
			i_dia=long(right(dwo.name,1))
			scrolltorow(donde)
			setredraw(true)
			exit
		end if
	loop
	if j>=1440/interv -1 then messagebox("Atención",'En este día no hay espacio para todo el tiempo de este Acto quirúrgico')
end if
end event

event itemfocuschanged;if g_motor='postgres' then
	if dataobject='dw_muestra_cruceqx0_postgres' then return
else
	if dataobject='dw_muestra_cruceqx0' then return
end if	
string cual
int cuantos
cual=right(dwo.name,1)
cuantos=dw_profes.rowcount()
dw_det_sala.setitem(1,'cuantos',cuantos)
dw_det_sala.setitem(1,'sala',getitemnumber(row,'sala'+cual))
dw_det_sala.setitem(1,'estp1',getitemnumber(row,'profa_'+cual))
dw_det_sala.setitem(1,'prof1',dw_profes.getitemstring(1,'prof'))
if i_fecha<>relativedate(date(i_fechaini),long(cual) -1) then
	i_fecha=relativedate(date(i_fechaini),long(cual) -1)
	dw_det_prog.settransobject(sqlca)
	dw_det_prog.retrieve(dw_profes.getitemstring(1,'prof'),i_fecha)
end if
if cuantos>=2 then
	dw_det_sala.setitem(1,'estp2',getitemnumber(row,'profb_'+cual))
	dw_det_sala.setitem(1,'prof2',dw_profes.getitemstring(2,'prof'))
end if
if cuantos>=3 then
	dw_det_sala.setitem(1,'estp3',getitemnumber(row,'profc_'+cual))
	dw_det_sala.setitem(1,'prof3',dw_profes.getitemstring(3,'prof'))
end if
if cuantos>=4 then
	dw_det_sala.setitem(1,'estp4',getitemnumber(row,'profd_'+cual))
	dw_det_sala.setitem(1,'prof4',dw_profes.getitemstring(4,'prof'))
end if
if cuantos>=5 then
	dw_det_sala.setitem(1,'estp5',getitemnumber(row,'profe_'+cual))
	dw_det_sala.setitem(1,'prof5',dw_profes.getitemstring(5,'prof'))
end if
end event

event getfocus;if g_motor='postgres' then
	if dataobject='dw_muestra_cruceqx0_postgres' then return
else
	if dataobject='dw_muestra_cruceqx0' then return
end if
dw_det_sala.x=2500 -200*dw_profes.rowcount()
dw_det_sala.visible=true


end event

event losefocus;dw_det_sala.visible=false
end event

event doubleclicked;if row<1 or dataobject='dw_muestra_cruceqx0' then return
if getitemnumber(row,'est'+right(getcolumnName(),1))=0 then return
em_emp.text=string(getitemdatetime(row,'hora'),'hh:mm')
em_emp.triggerevent(modified!)
end event

type st_2 from statictext within tp_2
integer x = 645
integer y = 4
integer width = 119
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sala:"
boolean focusrectangle = false
end type

type dw_sala from datawindow within tp_2
integer x = 622
integer y = 60
integer width = 1015
integer height = 96
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_sala_qx"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;dw_prog_sala.dataobject='dw_muestra_cruceqx0'
if g_motor='postgres' then
	dw_min_prof.dataobject='dw_qxcruce0_postgres'
else
	dw_min_prof.dataobject='dw_qxcruce0'
end If
dw_min_prof.settransobject(sqlca)
dw_prog_sala.modify("t_1.text='Do"+string(day(date(i_fechaini)))+"'")
dw_prog_sala.modify("t_2.text='Lu"+string(day(relativedate(date(i_fechaini),1)))+"'")
dw_prog_sala.modify("t_3.text='Ma"+string(day(relativedate(date(i_fechaini),2)))+"'")
dw_prog_sala.modify("t_4.text='Mi"+string(day(relativedate(date(i_fechaini),3)))+"'")
dw_prog_sala.modify("t_5.text='Ju"+string(day(relativedate(date(i_fechaini),4)))+"'")
dw_prog_sala.modify("t_6.text='Vi"+string(day(relativedate(date(i_fechaini),5)))+"'")
dw_prog_sala.modify("t_7.text='Sa"+string(day(relativedate(date(i_fechaini),6)))+"'")
if not isnull(gettext()) and gettext()<>'' then 
	//dw_det_prog.retrieve(gettext(),i_fechaini,datetime(relativedate(date(i_fechaini),7)))
	sqlca.autocommit=true
	dw_min_prof.retrieve(gettext(),i_fechaini)
	sqlca.autocommit=false
	dw_prog_sala.setredraw(false)
	dw_min_prof.rowscopy(1,dw_min_prof.rowcount(),primary!,dw_prog_sala,1,primary!)
	dw_prog_sala.setredraw(true)
end if
dw_det_sala.reset()
dw_det_sala.insertrow(1)
i_asigno=false
i_dia=0
accepttext()
st_help.text='Detalle de Disponibilidad de la Sala'
end event

type dw_profes from datawindow within tp_2
integer x = 23
integer y = 1252
integer width = 1897
integer height = 340
integer taborder = 50
string title = "none"
string dataobject = "dw_qxcita_proced"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

event itemchanged;//choose case GetColumnName()
//	case 'desprof'
//		if find('desprof="'+data+'"',1,rowcount())<>0 then 
//			setitem(getrow(),'desprof',getitemstring(getrow(),'desprof'))
//			settext(getitemstring(getrow(),'desprof'))
//			return 1
//		end if
//		setitem(row,'prof',idw_aneste.getitemstring(idw_profe.getrow(),'codprof'))
//		dw_prog_sala.reset()
//		dw_det_sala.reset()
//		dw_det_sala.insertrow(1)
//		i_asigno=false
//		i_dia=0
//		accepttext()
//end choose
end event

type gb_2 from groupbox within tp_2
integer y = 1196
integer width = 1952
integer height = 424
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Profesionales a Realizar Acto Qx:"
end type

