$PBExportHeader$w_trasl_cita.srw
forward
global type w_trasl_cita from window
end type
type pb_2 from picturebutton within w_trasl_cita
end type
type pb_1 from picturebutton within w_trasl_cita
end type
type anula from datawindow within w_trasl_cita
end type
end forward

global type w_trasl_cita from window
integer width = 2953
integer height = 548
boolean titlebar = true
string title = "Trasladar Cita a otra Fecha"
boolean controlmenu = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "r_asig_cita.ico"
boolean center = true
pb_2 pb_2
pb_1 pb_1
anula anula
end type
global w_trasl_cita w_trasl_cita

forward prototypes
public function integer f_traslada (long ncita_new)
end prototypes

public function integer f_traslada (long ncita_new);long ncita,activos,j,nfact,nitem_fac
string prof_cita,proc_cita,clug_fac,clug_cita,tipo_fac,cod_tcita,codemp,cod_fina
datetime fecha_cita,hor_cita
for j=1 to anula.rowcount()
	anula.setitem(j,"control",'4')
	anula.setitem(j,"fecha_anula",datetime(today(),now()))
	prof_cita=anula.getitemstring(j,"prof")
	fecha_cita=anula.getitemdatetime(j,"fecha")
	hor_cita=anula.getitemdatetime(j,"hora")
	cod_tcita=anula.getitemstring(j,"cod_tcita")
	codemp=anula.getitemstring(j,"codemp")	
	cod_fina=anula.getitemstring(j,"cod_fina")	
	UPDATE AgendaProf SET EstCita = Null, ncita=null,clugar=null 
	WHERE AgendaProf.EstCita='1' AND AgendaProf.Prof=:prof_cita AND AgendaProf.Fecha=:fecha_cita AND AgendaProf.Hora=:hor_cita;
	if sqlca.sqlcode<>0 then
		messagebox("Error Moviendo esta cita",sqlca.sqlerrtext)
		rollback;
		return -1
	end if
	nfact=anula.getitemnumber(j,'nfact')
	if not isnull(nfact) then//cambiar ncita en faccpo
		nitem_fac=anula.getitemnumber(j,'nitem')
		clug_fac=anula.getitemstring(j,'clugar_fac')
		tipo_fac=anula.getitemstring(j,'tipo_fac')
		update factcpo set ncita=:ncita_new
		where nfact=:nfact and clugar=:clug_fac and nitem=:nitem_fac and tipo=:tipo_fac;
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando estado de factCpo",sqlca.sqlerrtext)
			rollback;
			return -1
		end if
	end if
next
if anula.update()=-1 then
	rollback;
	return -1
end if
ncita=anula.getitemnumber(1,'ncita')
clug_cita=anula.getitemstring(1,'clugar')
SELECT Count(SerciosTurno.CProced) into :activos FROM SerciosTurno 
WHERE SerciosTurno.NCita=:ncita and clugar=:clug_cita AND SerciosTurno.control='1';
if activos=0 then //se movieron todos los turnos de esa cita entoces pasa a ser toda trasladada
	UPDATE CitasAsig SET Estado = '4' WHERE CitasAsig.NCita=:ncita and clugar=:clug_cita;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando CitasAsig",sqlca.sqlerrtext)
		rollback;
		return -1
	end if
	if sqlca.sqlnrows=0 then //si es cero hay algun errorcito metido por ahi
		rollback;
		messagebox("Error","No se puede Mover esta cita")
		return -1
	end if
end if
return 1
end function

on w_trasl_cita.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.anula=create anula
this.Control[]={this.pb_2,&
this.pb_1,&
this.anula}
end on

on w_trasl_cita.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.anula)
end on

event open;long ncita,sec_cant,k,t,l_n_citas,l_n_turno,l_nser,ojo
string proc_cita,clug_cita
boolean lb_mult=false
ncita=w_asig_cita.dw_1.getitemnumber(w_asig_cita.dw_1.getrow(),"ncita"+right(w_asig_cita.dw_1.getcolumnname(),1))
clug_cita=w_asig_cita.i_clug


/// Para veriifcar citas con mas de un producto
SELECT Count(SerciosCita.nservicio) into:l_n_citas
FROM SerciosCita
WHERE (((SerciosCita.NCita)=:ncita) AND ((SerciosCita.clugar)=:clug_cita));
if l_n_citas>1 then
	anula.dataobject="dw_xa_anular_cita_productos"	
	ojo=anula.settransobject(sqlca)
	ojo=anula.retrieve(ncita,clug_cita)	
	lb_mult=true
else
	proc_cita=w_asig_cita.dw_1.getitemstring(w_asig_cita.dw_1.getrow(),"proc"+right(w_asig_cita.dw_1.getcolumnname(),1))
	sec_cant=w_asig_cita.dw_1.getitemnumber(w_asig_cita.dw_1.getrow(),"sec_cant"+right(w_asig_cita.dw_1.getcolumnname(),1))
	l_nser=w_asig_cita.dw_1.getitemnumber(w_asig_cita.dw_1.getrow(),"nserv"+right(w_asig_cita.dw_1.getcolumnname(),1))
	
	///para verificar el numero de citas y los turnos respectivos
	SELECT  SerciosCita.cantidad, SerciosCita.NTurnos into:l_n_citas,:l_n_turno 
	FROM SerciosCita 
	WHERE (((SerciosCita.NCita)=:ncita) AND ((SerciosCita.NServicio)=:l_nser) AND ((SerciosCita.clugar)=:clug_cita));
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo cupos de las citas ",sqlca.sqlerrtext)
		return -1
	end if
	
	if l_n_citas=1 and l_n_turno>1 then
		anula.dataobject="dw_xa_anular_cita_cupos"	
		ojo=anula.settransobject(sqlca)
		ojo=anula.retrieve(ncita,l_nser,proc_cita,clug_cita)
	else
		anula.dataobject="dw_xa_anular_cita"	
		ojo=anula.settransobject(sqlca)
		ojo=anula.retrieve(ncita,sec_cant,proc_cita,clug_cita)
	end if
end if
if ojo=0 then
	messagebox('Atención','Error no se puede encontrar esta cita para trasladar')
	return -1
end if

w_asig_cita.tab_1.tp_1.dw_serv_cita.reset()
w_asig_cita.f_limpia()
if lb_mult=false then
	w_asig_cita.tab_1.tp_1.dw_serv_cita.insertrow(1)
	
	if isnull(anula.getitemstring(1,'cproced') ) then
		w_asig_cita.tab_1.tp_1.dw_serv_cita.setitem(1,'cproced','Ning.')
	else
		w_asig_cita.tab_1.tp_1.dw_serv_cita.setitem(1,'cproced',anula.getitemstring(1,'cproced'))	
	end if
	w_asig_cita.tab_1.tp_1.dw_serv_cita.setitem(1,'nturnos',anula.getitemnumber(1,'nturnos'))
	w_asig_cita.tab_1.tp_1.dw_serv_cita.setitem(1,'secuencia',anula.getitemstring(1,'secuencia'))
	w_asig_cita.tab_1.tp_1.dw_serv_cita.setitem(1,'nservicio',1)//ahora siempre es uno
end if

for k=1 to anula.rowcount()
	
	if lb_mult then
		w_asig_cita.tab_1.tp_1.dw_serv_cita.insertrow(k)
		if isnull(anula.getitemstring(k,'cproced') ) then
			w_asig_cita.tab_1.tp_1.dw_serv_cita.setitem(k,'cproced','Ning.')
			setnull(proc_cita)
		else
			w_asig_cita.tab_1.tp_1.dw_serv_cita.setitem(k,'cproced',anula.getitemstring(k,'cproced'))	
			proc_cita=anula.getitemstring(k,'cproced')
		end if
		w_asig_cita.tab_1.tp_1.dw_serv_cita.setitem(k,'nturnos',anula.getitemnumber(k,'nturnos'))
		w_asig_cita.tab_1.tp_1.dw_serv_cita.setitem(k,'secuencia',anula.getitemstring(k,'secuencia'))
		w_asig_cita.tab_1.tp_1.dw_serv_cita.setitem(k,'nservicio',anula.getitemnumber(k,'nservicio'))//ahora siempre es uno
	end if
	
	
	w_asig_cita.tab_1.tp_2.dw_serv_turno.insertrow(k)
	w_asig_cita.tab_1.tp_2.dw_serv_turno.setitem(k,'nservicio',anula.getitemnumber(k,'nservicio'))
	w_asig_cita.tab_1.tp_2.dw_serv_turno.setitem(k,'sec_cant',anula.getitemnumber(k,'sec_cant'))
	if isnull(proc_cita) then
		w_asig_cita.tab_1.tp_2.dw_serv_turno.setitem(k,'cproced','Ning.')
	else
		w_asig_cita.tab_1.tp_2.dw_serv_turno.setitem(k,'cproced',proc_cita)
	end if
	w_asig_cita.tab_1.tp_2.dw_serv_turno.setitem(k,"nfact",anula.getitemnumber(k,'nfact'))
	w_asig_cita.tab_1.tp_2.dw_serv_turno.setitem(k,"clugar_fac",anula.getitemstring(k,'clugar_fac'))
	w_asig_cita.tab_1.tp_2.dw_serv_turno.setitem(k,"tipo_fac",anula.getitemstring(k,'tipo_fac'))
	w_asig_cita.tab_1.tp_2.dw_serv_turno.setitem(k,"nitem",anula.getitemnumber(k,'nitem'))
	w_asig_cita.tab_1.tp_2.dw_serv_turno.setitem(k,"nrcaj",anula.getitemnumber(k,'nrcaj'))
	w_asig_cita.tab_1.tp_2.dw_serv_turno.setitem(k,"clugar_rec",anula.getitemstring(k,'clugar_rec'))
	w_asig_cita.tab_1.tp_2.dw_serv_turno.setitem(k,"items",anula.getitemnumber(k,'items'))
	w_asig_cita.tab_1.tp_2.dw_serv_turno.setitem(k,"nitem_rec",anula.getitemnumber(k,'nitem_rec'))
	w_asig_cita.tab_1.tp_2.dw_serv_turno.setitem(k,"contador_os",anula.getitemnumber(k,'contador_os'))
	w_asig_cita.tab_1.tp_2.dw_serv_turno.setitem(k,"clugar_os",anula.getitemstring(k,'clugar_os'))
	w_asig_cita.tab_1.tp_2.dw_serv_turno.setitem(k,"nsolicitud_os",anula.getitemnumber(k,'nsolicitud_os'))
	w_asig_cita.tab_1.tp_2.dw_serv_turno.setitem(k,"item_os",anula.getitemnumber(k,'item_os'))
	w_asig_cita.fecha_esperada.text=string(anula.getitemdatetime(1,'fecha'),'dd-mm-yyyy')+' '+string(anula.getitemdatetime(1,'hora'),'hh:mm:ss')
	w_asig_cita.fecha_esperada.text=string(anula.getitemdatetime(1,'fecha'),'dd-mm-yyyy')+' '+string(anula.getitemdatetime(1,'hora'),'hh:mm:ss')
	w_asig_cita.dw_3.setitem(1,'cod_tcita',anula.getitemstring(k,'cod_tcita'))
	w_asig_cita.dw_4.setitem(1,'codfin',anula.getitemstring(k,'cod_fina'))	
	w_asig_cita.lb_espera=true
	w_asig_cita. lb_tipoc=true
	w_asig_cita.lb_fina=true
	
next
end event

event close;w_asig_cita.tab_1.tp_1.dw_serv_cita.reset()
w_asig_cita.tab_1.tp_2.dw_serv_turno.reset()
w_asig_cita.f_limpia()
end event

type pb_2 from picturebutton within w_trasl_cita
integer x = 1399
integer y = 328
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_trasl_cita
integer x = 1243
integer y = 328
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Trasladar la Cita"
end type

event clicked;long ncita

choose case w_asig_cita.guardar(0)
	case 0
		return
	case -1
		rollback;
		return
end choose
ncita=long(w_asig_cita.st_cita.text)//se trae de alla pa no joder tanto(alla queda si guardó bien)
if f_traslada(ncita)=-1 then
	rollback;
	return
end if
commit;
w_asig_cita.cb_2.triggerevent(clicked!)//refrescar
close(parent)
end event

type anula from datawindow within w_trasl_cita
integer width = 2889
integer height = 320
integer taborder = 10
string title = "none"
string dataobject = "dw_xa_anular_cita"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;choose case dwo.name
	case 'cod_fina'	
		w_asig_cita.dw_4.setitem(1,'codfin',data)	
end choose
this.accepttext()
end event

