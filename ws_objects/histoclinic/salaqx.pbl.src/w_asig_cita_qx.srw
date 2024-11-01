$PBExportHeader$w_asig_cita_qx.srw
forward
global type w_asig_cita_qx from window
end type
type pb_3 from pb_report within w_asig_cita_qx
end type
type sle_1 from singlelineedit within w_asig_cita_qx
end type
type dw_profes from datawindow within w_asig_cita_qx
end type
type pb_2 from picturebutton within w_asig_cita_qx
end type
type cb_2 from picturebutton within w_asig_cita_qx
end type
type cb_guarda from picturebutton within w_asig_cita_qx
end type
type pb_1 from pb_report within w_asig_cita_qx
end type
type dw_qxcita from datawindow within w_asig_cita_qx
end type
type pb_cambio from picturebutton within w_asig_cita_qx
end type
type pb_adiciona from picturebutton within w_asig_cita_qx
end type
type pb_4 from picturebutton within w_asig_cita_qx
end type
type dw_qxcita_cir from datawindow within w_asig_cita_qx
end type
type st_4 from statictext within w_asig_cita_qx
end type
type dw_2 from datawindow within w_asig_cita_qx
end type
type em_3 from editmask within w_asig_cita_qx
end type
type tab_2 from tab within w_asig_cita_qx
end type
type tp2_1 from userobject within tab_2
end type
type st_2 from statictext within tp2_1
end type
type dw_consultxgcita from datawindow within tp2_1
end type
type tp2_1 from userobject within tab_2
st_2 st_2
dw_consultxgcita dw_consultxgcita
end type
type tp2_2 from userobject within tab_2
end type
type st_5 from statictext within tp2_2
end type
type dw_citas_ante from datawindow within tp2_2
end type
type tp2_2 from userobject within tab_2
st_5 st_5
dw_citas_ante dw_citas_ante
end type
type tab_2 from tab within w_asig_cita_qx
tp2_1 tp2_1
tp2_2 tp2_2
end type
type st_sala from statictext within w_asig_cita_qx
end type
type em_2 from editmask within w_asig_cita_qx
end type
type em_1 from editmask within w_asig_cita_qx
end type
type dw_cruce from datawindow within w_asig_cita_qx
end type
type mc_1 from monthcalendar within w_asig_cita_qx
end type
type dw_escog_qx from datawindow within w_asig_cita_qx
end type
type gb_1 from groupbox within w_asig_cita_qx
end type
type dw_agenda from datawindow within w_asig_cita_qx
end type
type dw_1 from datawindow within w_asig_cita_qx
end type
end forward

global type w_asig_cita_qx from window
integer width = 6144
integer height = 2456
boolean titlebar = true
string title = "Programación Quirurgica"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "bisturi_re.ico"
string pointer = "Arrow!"
pb_3 pb_3
sle_1 sle_1
dw_profes dw_profes
pb_2 pb_2
cb_2 cb_2
cb_guarda cb_guarda
pb_1 pb_1
dw_qxcita dw_qxcita
pb_cambio pb_cambio
pb_adiciona pb_adiciona
pb_4 pb_4
dw_qxcita_cir dw_qxcita_cir
st_4 st_4
dw_2 dw_2
em_3 em_3
tab_2 tab_2
st_sala st_sala
em_2 em_2
em_1 em_1
dw_cruce dw_cruce
mc_1 mc_1
dw_escog_qx dw_escog_qx
gb_1 gb_1
dw_agenda dw_agenda
dw_1 dw_1
end type
global w_asig_cita_qx w_asig_cita_qx

type variables
long i_dura,i_cuantos,i_fila_prof,i_fila_ant,i_col_ant
int l_cita 
datawindowchild idw_grupo,idw_sala,idw_anesl,idw_anestesiologos
datetime i_desde,i_hasta
string i_profes,i_esp,i_consul,i_clug,ls_tipo,is_pdf
boolean i_guardo,l_espera=false
m_ppal im_main 


end variables

forward prototypes
public subroutine trae_agenda ()
public subroutine pinta ()
public subroutine f_limpia ()
public subroutine f_estados_dw ()
public function integer guardar (integer tipo)
public function dwobject lf_dwo (integer p_dia)
public function integer anular (string p_motivo, string p_codigo)
end prototypes

public subroutine trae_agenda ();date fec
mc_1.getselecteddate(fec)
if (daysafter(date(i_desde),date(fec))<0 and daysafter(date(i_hasta),date(fec))<0) or (daysafter(date(i_desde),date(fec))>0 and daysafter(date(i_hasta),date(fec))>0) then
	i_desde=datetime(relativedate(fec,1 - daynumber(fec)))
	i_hasta=datetime(relativedate(fec,7 - daynumber(fec)))
	dw_1.reset()
end if
if dw_escog_qx.rowcount()=0 then return
tab_2.tp2_1.dw_consultxgcita.setredraw(false)
tab_2.tp2_1.dw_consultxgcita.reset()
tab_2.tp2_1.dw_consultxgcita.retrieve(dw_escog_qx.getitemstring(1,1),i_desde,i_hasta,i_clug,idw_sala.getitemstring(idw_sala.getrow(),'codconsultorio'))
tab_2.tp2_1.dw_consultxgcita.sort()
tab_2.tp2_1.dw_consultxgcita.groupcalc()
tab_2.tp2_1.dw_consultxgcita.setredraw(true)
if tab_2.tp2_1.dw_consultxgcita.rowcount()=0 then
	dw_1.reset()
	dw_1.modify("t_1.text='Domingo'")
	dw_1.modify("t_2.text='Lunes'")
	dw_1.modify("t_3.text='Martes'")
	dw_1.modify("t_4.text='Miércoles'")
	dw_1.modify("t_5.text='Jueves'")
	dw_1.modify("t_6.text='Viernes'")
	dw_1.modify("t_7.text='Sábado'")
end if
dw_agenda.retrieve(i_consul,i_desde,i_hasta)

end subroutine

public subroutine pinta ();time hora
long cual
int dia,l_i

em_1.text=string(idw_sala.getitemdatetime(idw_sala.getrow(),'inicia'),'hh:mm')
em_2.text=string(idw_sala.getitemdatetime(idw_sala.getrow(),'fin'),'hh.mm')
i_dura=idw_sala.getitemnumber(idw_sala.getrow(),'duracion')
hora=time(em_1.text)
date esta
dw_1.modify("t_1.text='&Domingo~r~n"+string(day(date(i_desde)))+"-"+mes(month(date(i_desde)),"mmm")+"'")
esta=relativedate(date(i_desde),1)
dw_1.modify("t_2.text='&Lunes~r~n"+string(day(esta))+"-"+mes(month(esta),"mmm")+"'")
esta=relativedate(esta,1)
dw_1.modify("t_3.text='&Martes~r~n"+string(day(esta))+"-"+mes(month(esta),"mmm")+"'")
esta=relativedate(esta,1)
dw_1.modify("t_4.text='M&iércoles~r~n"+string(day(esta))+"-"+mes(month(esta),"mmm")+"'")
esta=relativedate(esta,1)
dw_1.modify("t_5.text='&Jueves~r~n"+string(day(esta))+"-"+mes(month(esta),"mmm")+"'")
esta=relativedate(esta,1)
dw_1.modify("t_6.text='&Viernes~r~n"+string(day(esta))+"-"+mes(month(esta),"mmm")+"'")
esta=relativedate(esta,1)
dw_1.modify("t_7.text='&Sábado~r~n"+string(day(esta))+"-"+mes(month(esta),"mmm")+"'")
dw_1.reset()
DO WHILE hora < time(em_2.text)
	cual=dw_1.insertrow(0)
	dw_1.setitem(cual,"hora",hora)
	for l_i= 1 to  7
		dw_1.setitem(cual,"dia"+string(l_i),"Libre")
	next
	hora=relativetime(hora,i_dura*60)
LOOP
end subroutine

public subroutine f_limpia ();//long j,donde
//for j=1 to 7
//	donde=dw_1.find('sel'+string(j)+'="1"',1,dw_1.rowcount())
//	do while donde<>0 
//		dw_1.setitem(donde,'sel'+string(j),'0')
//		dw_1.setitem(donde,'dia'+string(j),'Libre')
//		dw_1.setitem(donde,'proc'+string(j),'')
//		dw_1.setitem(donde,'nserv'+string(j),'')
//		donde=dw_1.find('sel'+string(j)+'="1"',donde,dw_1.rowcount())
//	loop
//next
//for j=1 to tab_1.tp_1.dw_serv_cita.rowcount()
//	tab_1.tp_1.dw_serv_cita.setitem(j,'tempo',0)
//next
//string snulo
//datetime nulo
//setnull(nulo)
//setnull(snulo)
//for j=1 to tab_1.tp_2.dw_serv_turno.rowcount()
//	tab_1.tp_2.dw_serv_turno.setitem(j,'fecha',nulo)
//	tab_1.tp_2.dw_serv_turno.setitem(j,'hora',nulo)
//	tab_1.tp_2.dw_serv_turno.setitem(j,'prof',snulo)
//	tab_1.tp_2.dw_serv_turno.setitem(j,'consult',snulo)
//	tab_1.tp_2.dw_serv_turno.setitem(j,'duracion',0)
//next
end subroutine

public subroutine f_estados_dw ();//dw_cita_asig.reset()
//dw_cita_asig.insertrow(1)
//tab_1.tp_1.dw_serv_cita.resetupdate()
//tab_1.tp_2.dw_serv_turno.resetupdate()
end subroutine

public function integer guardar (integer tipo);if not f_demo('pac') then return -1
if docu="" then 
	messagebox("Atención","Seleccione un paciente")
	return 0
end if

long ncita,actu,nulo,ncita1,ncita2
string snulo,i_cod_cita='SQP'
int l_j,l_k,l_h,l_donde
setnull(snulo)
setnull(nulo)
if dw_qxcita_cir.getitemnumber(1,'obliga')>0 then
	messagebox('Atención','Dato de tipo Anestesia Obligatorio')
	return -1
end if
if dw_qxcita_cir.getitemnumber(1,'autoriza')>0 then
	messagebox("Error","Falta Autorizacion verifique")
	return -1
end if
if dw_qxcita_cir.getitemnumber(1,'lates')>0 then
	messagebox("Error","Falta Lateralidad verifique")
	return -1
end if
if dw_qxcita.rowcount() >0  then
	if isnull(dw_qxcita.getitemnumber(1,"ncita"))  then
		ncita=f_trae_ndoc(i_cod_cita,i_clug,'Programación')
		if ncita=-1 then
			rollback;
			return -1
		end if
		dw_qxcita.setitem(1,'ncita',ncita)
		dw_qxcita.setitem(1,'clugar',i_clug)
		dw_qxcita.setitem(1,'estado','1')
		dw_qxcita.setitem(1,'fecha_crea',datetime(today(),now()))
	end if

	for l_j=1 to dw_qxcita_cir.rowcount()
		dw_qxcita_cir.setitem(l_j,'ncita',ncita)
		dw_qxcita_cir.setitem(l_j,'clugar_cita',i_clug)
		l_donde=dw_profes.find('prof="'+dw_qxcita_cir.getitemstring(l_j,'qx')+'"',1,dw_profes.rowcount())
		if l_donde=0 then
			l_donde=dw_profes.insertrow(0)
			dw_profes.setitem(l_donde,'item',l_j)
		end if
		dw_profes.setitem(l_donde,'ncita',ncita)
		dw_profes.setitem(l_donde,'clugar',i_clug)
		dw_profes.setitem(l_donde,'prof',dw_qxcita_cir.getitemstring(l_j,'qx'))
		dw_profes.setitem(l_donde,'fecha',dw_qxcita.getitemdatetime(1,'fecha_asigna'))
		dw_profes.setitem(l_donde,'hora',datetime(date("1/1/1900"),time(dw_qxcita_cir.getitemdatetime(l_j,'hora'))))
		datetime jaer
		jaer=dw_qxcita_cir.getitemdatetime(l_donde,'iniciacir')
		dw_profes.setitem(l_donde,'iniciaqx',dw_qxcita_cir.getitemdatetime(l_donde,'iniciacir'))
		dw_profes.setitem(l_donde,'terminaqx',dw_qxcita_cir.getitemdatetime(l_donde,'terminacir'))
		dw_profes.setitem(l_donde,'usuario',usuario)
		if not isnull(dw_qxcita_cir.getitemstring(l_j,'anes')) then
			l_donde=dw_profes.find('prof="'+dw_qxcita_cir.getitemstring(l_j,'anes')+'"',1,dw_profes.rowcount())
			if l_donde=0 then
				l_donde=dw_profes.insertrow(0)
				dw_profes.setitem(l_donde,'item',l_j+1)
			end if
			dw_profes.setitem(l_donde,'ncita',ncita)
			dw_profes.setitem(l_donde,'clugar',i_clug)
			dw_profes.setitem(l_donde,'prof',dw_qxcita_cir.getitemstring(l_j,'anes'))
			dw_profes.setitem(l_donde,'fecha',dw_qxcita_cir.getitemdatetime(l_j,'fecha_anes'))
			dw_profes.setitem(l_donde,'hora',datetime(date("1/1/1900"),time(dw_qxcita_cir.getitemdatetime(l_j,'hora_anes'))))
			dw_profes.setitem(l_donde,'iniciaqx',dw_qxcita_cir.getitemdatetime(l_j,'iniciacir'))
			dw_profes.setitem(l_donde,'terminaqx',dw_qxcita_cir.getitemdatetime(l_j,'terminacir'))
			dw_profes.setitem(l_donde,'usuario',usuario)
		end if
	next
end if
if dw_qxcita.update()=-1 then
	rollback;
	dw_qxcita.reset()
	dw_qxcita_cir.reset()
	dw_1.reset()
	trae_agenda()
	return -1
end if

if dw_qxcita_cir.update()=-1 then
	rollback;
	dw_qxcita.reset()
	dw_qxcita_cir.reset()
	dw_1.reset()
	trae_agenda()
	return -1
end if

if dw_profes.update()=-1 then
	rollback;
	dw_qxcita.reset()
	dw_qxcita_cir.reset()
	dw_1.reset()
	trae_agenda()
	return -1
end if
commit;
dw_qxcita.reset()
dw_qxcita_cir.reset()
dw_1.reset()
trae_agenda()
return 1
end function

public function dwobject lf_dwo (integer p_dia);choose case p_dia
	case 1
		return dw_1.object.dia1
	case 2
		return dw_1.object.dia2
	case 3
		return dw_1.object.dia3
	case 4
		return dw_1.object.dia4
	case 5
		return dw_1.object.dia5
	case 6
		return dw_1.object.dia6
	case 7
		return dw_1.object.dia7
end choose
end function

public function integer anular (string p_motivo, string p_codigo);uo_datastore anula
anula=create uo_datastore

long ncita,activos,sec_cant,j,ojo,fact,l_n_citas,l_n_turno,l_nser
string prof_cita,proc_cita
datetime fecha_cita,hor_cita

ncita=tab_2.tp2_2.dw_citas_ante.getitemnumber(tab_2.tp2_2.dw_citas_ante.getrow(),"ncita")
anula.dataobject="dw_anula_citaqx"	
ojo=anula.settransobject(sqlca)
ojo=anula.retrieve(ncita,i_clug)

if ojo=0 then
	messagebox('Atención','Error no se puede encontrar esta cita no la puede anular')
	return -1
end if
for j=1 to anula.rowcount()
	if not isnull(anula.getitemnumber(j,'ingre')) then
		messagebox("Atención",'Esta cita ya se encuentra Atendida en salas')
		return -1
	end if
	//anula.setitem(j,"estado",usuario)
next
string snulo
int inulo
setnull(snulo)
setnull(inulo)
j=tab_2.tp2_2.dw_citas_ante.getrow()
tab_2.tp2_2.dw_citas_ante.setitem(j,"estado",usuario)
tab_2.tp2_2.dw_citas_ante.setitem(j,"motivo_anula",p_motivo)
tab_2.tp2_2.dw_citas_ante.setitem(j,"cod_anula",p_codigo)
tab_2.tp2_2.dw_citas_ante.setitem(j,"fecha_anula",datetime(today(),now()))
tab_2.tp2_2.dw_citas_ante.setitem(j,"fecha_anula",datetime(today(),now()))
tab_2.tp2_2.dw_citas_ante.setitem(j,'contador',inulo)
tab_2.tp2_2.dw_citas_ante.setitem(j,'clugar_os',snulo)
tab_2.tp2_2.dw_citas_ante.setitem(j,'nsolicitud',inulo)
//if anula.update()=-1 then return -1

if tab_2.tp2_2.dw_citas_ante.update()=-1 then return -1
dw_qxcita.reset()
dw_qxcita_cir.reset()
dw_1.reset()
trae_agenda()
//////////////////interface con oscuerpo

update qxcita_cir set contador=:inulo,clugar_os=:snulo, nsolicitud=:inulo,item_os=:inulo
where ncita=:ncita and clugar_cita=:i_clug;
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando Qxcita_cir",sqlca.sqlerrtext)
	return -1
end if

delete from qxcita_proced
where ncita=:ncita and clugar=:i_clug;
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando Qxcita_cir",sqlca.sqlerrtext)
	return -1
end if

//////////////////fin interface con oscuerpo



end function

event open;RegistryGet( "HKEY_CLASSES_ROOT\.pdf", "", RegString!, ls_tipo)
RegistryGet( "HKEY_CLASSES_ROOT\"+ls_tipo+"\shell\open\command", "", RegString!, is_pdf)

f_limpia()
int cuan
select count(codemp) into :cuan from emppac where tipodoc=:tipdoc and  documento=:docu;
if sqlca.sqlcode=-1 then 
	messagebox("Error leyendo de emppac",sqlca.sqlerrtext)
	return
end if
if cuan=0 then 
	messagebox("Atención",'Este Paciente no tiene empresa responsable, debe asignarle una para continuar')
	dw_escog_qx.reset()
	tab_2.tp2_1.dw_consultxgcita.reset()
	return
else
	if dw_escog_qx.rowcount()=0 then 
		dw_escog_qx.insertrow(1)
	end if
end if
tab_2.tp2_2.dw_citas_ante.retrieve(tipdoc,docu)
end event

on w_asig_cita_qx.create
this.pb_3=create pb_3
this.sle_1=create sle_1
this.dw_profes=create dw_profes
this.pb_2=create pb_2
this.cb_2=create cb_2
this.cb_guarda=create cb_guarda
this.pb_1=create pb_1
this.dw_qxcita=create dw_qxcita
this.pb_cambio=create pb_cambio
this.pb_adiciona=create pb_adiciona
this.pb_4=create pb_4
this.dw_qxcita_cir=create dw_qxcita_cir
this.st_4=create st_4
this.dw_2=create dw_2
this.em_3=create em_3
this.tab_2=create tab_2
this.st_sala=create st_sala
this.em_2=create em_2
this.em_1=create em_1
this.dw_cruce=create dw_cruce
this.mc_1=create mc_1
this.dw_escog_qx=create dw_escog_qx
this.gb_1=create gb_1
this.dw_agenda=create dw_agenda
this.dw_1=create dw_1
this.Control[]={this.pb_3,&
this.sle_1,&
this.dw_profes,&
this.pb_2,&
this.cb_2,&
this.cb_guarda,&
this.pb_1,&
this.dw_qxcita,&
this.pb_cambio,&
this.pb_adiciona,&
this.pb_4,&
this.dw_qxcita_cir,&
this.st_4,&
this.dw_2,&
this.em_3,&
this.tab_2,&
this.st_sala,&
this.em_2,&
this.em_1,&
this.dw_cruce,&
this.mc_1,&
this.dw_escog_qx,&
this.gb_1,&
this.dw_agenda,&
this.dw_1}
end on

on w_asig_cita_qx.destroy
destroy(this.pb_3)
destroy(this.sle_1)
destroy(this.dw_profes)
destroy(this.pb_2)
destroy(this.cb_2)
destroy(this.cb_guarda)
destroy(this.pb_1)
destroy(this.dw_qxcita)
destroy(this.pb_cambio)
destroy(this.pb_adiciona)
destroy(this.pb_4)
destroy(this.dw_qxcita_cir)
destroy(this.st_4)
destroy(this.dw_2)
destroy(this.em_3)
destroy(this.tab_2)
destroy(this.st_sala)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.dw_cruce)
destroy(this.mc_1)
destroy(this.dw_escog_qx)
destroy(this.gb_1)
destroy(this.dw_agenda)
destroy(this.dw_1)
end on

event timer;if tab_2.tp2_1.dw_consultxgcita.rowcount()<1 then return
w_principal.setmicrohelp('Leyendo ....')
i_fila_prof=tab_2.tp2_1.dw_consultxgcita.getrow()
//dw_agenda.retrieve(i_consul,i_desde,i_hasta,i_profes,tab_2.tp2_1.dw_consultxgcita.getitemstring(i_fila_prof,"cesp"),dw_escog_profe.getitemstring(1,1))
//w_principal.setmicrohelp('Gestión Clínica Integrada')
end event

type pb_3 from pb_report within w_asig_cita_qx
integer x = 1810
integer y = 800
integer taborder = 130
string text = "       &o"
string powertiptext = "Imprimir Reporte Recordatorio Cita Qx"
string cod_rep = "RQX"
string nombre_rep = "RECORDATORIO DE CITAS QX"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;if dw_qxcita_cir.rowcount()<1 then return
any par[2]
par[1]=dw_qxcita_cir.getitemnumber(dw_qxcita_cir.getrow(),'ncita')
par[2]=dw_qxcita_cir.getitemstring(dw_qxcita_cir.getrow(),'clugar_cita')
imprimir(par,'','0')
end event

type sle_1 from singlelineedit within w_asig_cita_qx
boolean visible = false
integer x = 4562
integer y = 56
integer width = 1504
integer height = 64
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type dw_profes from datawindow within w_asig_cita_qx
boolean visible = false
integer x = 5527
integer y = 860
integer width = 471
integer height = 400
integer taborder = 70
boolean enabled = false
string title = "none"
string dataobject = "dw_qxcita_proced"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

type pb_2 from picturebutton within w_asig_cita_qx
integer x = 1655
integer y = 800
integer width = 146
integer height = 128
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &s"
boolean originalsize = true
string picturename = "prescripcion.gif"
string disabledname = "d_prescripcion.gif"
alignment htextalign = left!
string powertiptext = "Citas para Ordenes de Servicio"
end type

event clicked;if docu="" then 
	messagebox("Atención","Seleccione un paciente")
	return
end if
if isnull(dw_escog_qx.getitemstring(1,1)) then
	messagebox("Atención",'Debe elegir el Grupo de Cita')
	return
end if
dw_qxcita_cir.reset()
f_limpia()
st_prog_cir st_os
st_os.dw_qxcita=dw_qxcita
st_os.dw_qxcita_cir=dw_qxcita_cir
openwithparm(w_actos_pend,st_os)
if dw_qxcita_cir.rowcount()>0 then enabled=false
end event

type cb_2 from picturebutton within w_asig_cita_qx
integer x = 1499
integer y = 800
integer width = 146
integer height = 128
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &r"
boolean originalsize = true
string picturename = "refrescar.GIF"
string disabledname = "d_refrescar.GIF"
alignment htextalign = left!
string powertiptext = "Refrescar [Alt+R]"
end type

event clicked;parent.event timer()
tab_2.tp2_2.dw_citas_ante.retrieve(tipdoc,docu)
end event

type cb_guarda from picturebutton within w_asig_cita_qx
integer x = 1339
integer y = 800
integer width = 146
integer height = 128
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &g"
boolean originalsize = true
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
string powertiptext = "Guardar Cita [Alt+G]"
end type

event clicked;if tag='1' then
	if f_permiso_boton(this,'PRQX')=0 then return
end if
//if isvalid(w_trasl_cita) then return
choose case guardar(0)
	case 0
		return
	case 1
		commit;
	case -1
		rollback;
		parent.event timer()
		return
end choose
tab_2.tp2_2.dw_citas_ante.retrieve(tipdoc,docu)
pb_2.enabled=true
end event

event constructor;f_inicia_boton(this,'ASCI')
end event

type pb_1 from pb_report within w_asig_cita_qx
integer x = 1184
integer y = 800
integer taborder = 90
string text = "       &o"
string powertiptext = "Imprimir Reporte Programación Qx"
string cod_rep = "CPQX"
string nombre_rep = "REPORTE PROGRAMACION QX"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;any par[2]
date fec
mc_1.GetSelectedDate ( fec )
par[1]=datetime(fec)
par[2]=datetime(fec,time("23:59"))
imprimir(par,'','0')
end event

type dw_qxcita from datawindow within w_asig_cita_qx
boolean visible = false
integer x = 5545
integer y = 1292
integer width = 544
integer height = 320
integer taborder = 50
string title = "none"
string dataobject = "dw_qxcita"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_cambio from picturebutton within w_asig_cita_qx
integer x = 5961
integer y = 488
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "refrescar.gif"
string disabledname = "d_refrescar.gif"
alignment htextalign = left!
end type

event clicked;if dw_qxcita_cir.rowcount()=0 then return
if (dw_qxcita_cir.getitemstring(dw_qxcita_cir.getrow(),'estado')<>'0' ) and  (dw_qxcita_cir.getitemstring(dw_qxcita_cir.getrow(),'estado')<>'1')  then return

long l_nfact,l_ncita,l_nro_cir,l_conta
string l_clug_cita,l_proced

setnull(l_nfact)
setnull(l_conta)
l_ncita=dw_qxcita_cir.getitemnumber(dw_qxcita_cir.getrow(),'ncita')
l_clug_cita=dw_qxcita_cir.getitemstring(dw_qxcita_cir.getrow(),'clugar_cita')
l_nro_cir=dw_qxcita_cir.getitemnumber(dw_qxcita_cir.getrow(),'nro_cir')
l_proced=dw_qxcita_cir.getitemstring(dw_qxcita_cir.getrow(),'codproced')
select serviciosingreso.nfactura, qxcita_cir.contador into :l_nfact,:l_conta
from (qxcita_cir inner join oscuerpo on (qxcita_cir.contador = oscuerpo.contador) and (qxcita_cir.clugar_os = oscuerpo.clugar) and (qxcita_cir.nsolicitud = oscuerpo.nsolicitud) and (qxcita_cir.item_os = oscuerpo.item)) left join serviciosingreso on (oscuerpo.contador = serviciosingreso.conta_orden) and (oscuerpo.clugar = serviciosingreso.clug_orden) and (oscuerpo.nsolicitud = serviciosingreso.norden_serv) and (oscuerpo.item = serviciosingreso.item_orden)
where (((qxcita_cir.ncita)=:l_ncita) and ((qxcita_cir.clugar_cita)=:l_clug_cita) and ((qxcita_cir.nro_cir)=:l_nro_cir));
if not isnull(l_nfact) then 
	messagebox('Atención', 'El procedimiento esta facturado debe anular Factura')
	return	
end if
if not isnull(l_conta) then 
	messagebox('Atención', 'El procedimiento viene de orden medica debe ajustar la orden para realizar cambio')
	return	
end if

st_cirug stx
stx.cesp=dw_qxcita_cir.getitemstring(dw_qxcita_cir.getrow(),'espe_qx')
stx.antecedente='0'
openwithparm(w_busca_qx_cups,stx)
stx=message.powerobjectparm
if isvalid(stx) then
	dw_qxcita_cir.setitem(dw_qxcita_cir.getrow(),'codproced',stx.proccups)
	dw_qxcita_cir.setitem(dw_qxcita_cir.getrow(),'descripcion',stx.descrip)
	dw_qxcita_cir.setitem(dw_qxcita_cir.getrow(),'tiempoqx',stx.tiempoqx)
	if isnull(stx.tiempoqx) then
		messagebox('Atención', 'El procedimiento no tienen tiempo Qx configurado no se puede hacer el cambio')
		return
	end if
	
	update qxcpacto set proccups=:stx.proccups
	from 
		(qxcita inner join qxcabacto on (qxcita.clugar_qx = qxcabacto.clugar) and (qxcita.numero_ingre = qxcabacto.numero_ingre)) 
		inner join qxcpacto on (qxcabacto.clugar = qxcpacto.clugar) and (qxcabacto.numero_ingre = qxcpacto.numero) 
	where 
		(((qxcita.ncita)=:l_ncita) and ((qxcita.clugar)=:l_clug_cita) and ((qxcpacto.cproced)=:l_proced));
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando qxcpacto",sqlca.sqlerrtext)
		return 
	end if
	update serviciosingreso set cproced =:stx.proccups
	 from 
	 	((qxcita inner join qxcabacto on (qxcita.clugar_qx = qxcabacto.clugar) and (qxcita.numero_ingre = qxcabacto.numero_ingre)) 
	 	inner join qxcpacto on (qxcabacto.clugar = qxcpacto.clugar) and (qxcabacto.numero_ingre = qxcpacto.numero)) 
		inner join serviciosingreso on (qxcpacto.nservicio = serviciosingreso.nservicio) and (qxcpacto.clugar_ser = serviciosingreso.clugar) 
		and (qxcpacto.contador = serviciosingreso.contador) 
	where (((qxcita.ncita)=:l_ncita) and ((qxcita.clugar)=:l_clug_cita) and ((serviciosingreso.cproced)=:l_proced));
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando serviciosingreso ",sqlca.sqlerrtext)
		return 
	end if
	dw_qxcita_cir.update()
else
	return
end if
end event

type pb_adiciona from picturebutton within w_asig_cita_qx
integer x = 5961
integer y = 204
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
string powertiptext = "Agregar Procedimiento"
end type

event clicked;if dw_qxcita_cir.rowcount()=0 and dw_qxcita.rowcount()=0 then return
if tab_2.tp2_1.dw_consultxgcita .rowcount()=0  then return
if dw_qxcita.getitemstring(dw_qxcita.getrow(),'estado')<>'0' and dw_qxcita.getitemstring(dw_qxcita.getrow(),'estado')<>'4' then  return

long j,k,l_fila,l_tiempo
string l_cual,l_emp

if dw_qxcita.getitemstring(dw_qxcita.getrow(),'estado') <>'4' then
	k=dw_qxcita_cir.getitemnumber(1,'maximo')
	if isnull(k) then k=0
	k=k+1
	j=dw_qxcita_cir.insertrow(0)
	dw_qxcita_cir.setitem(j,'nro_cir',k)
	dw_qxcita_cir.setitem(j,'estado','0')
else
	k=dw_qxcita_cir.getitemnumber(1,'nro_cir')
	j=1
end if
dw_qxcita_cir.setitem(j,'qx',tab_2.tp2_1.dw_consultxgcita.getitemstring(tab_2.tp2_1.dw_consultxgcita.getrow(),'prof'))
dw_qxcita_cir.setitem(j,'hora',tab_2.tp2_1.dw_consultxgcita.getitemdatetime(tab_2.tp2_1.dw_consultxgcita.getrow(),'hora'))
dw_qxcita_cir.setitem(j,'espe_qx',tab_2.tp2_1.dw_consultxgcita.getitemstring(tab_2.tp2_1.dw_consultxgcita.getrow(),'cesp'))
if k=1 then
	dw_qxcita_cir.setitem(j,'iniciacir',datetime(left(pb_4.tag,10)+' '+string(dw_1.getitemtime(dw_1.getrow(),"hora"))))
else
	dw_qxcita_cir.setitem(j,'iniciacir',datetime(left(pb_4.tag,10)+' '+string(time(dw_qxcita_cir.getitemdatetime(j - 1,'terminacir')))))
end if
dw_qxcita_cir.setitem(j,'desesp',tab_2.tp2_1.dw_consultxgcita.getitemstring(tab_2.tp2_1.dw_consultxgcita.getrow(),'desesp'))
idw_anestesiologos.retrieve(dw_escog_qx.getitemstring(1,1),datetime(left(pb_4.tag,10)),datetime(left(pb_4.tag,10)),i_clug,idw_sala.getitemstring(idw_sala.getrow(),'codconsultorio'))
if dw_qxcita.getitemstring(dw_qxcita.getrow(),'estado') <>'4' then
	st_cirug st
	st.cesp=tab_2.tp2_1.dw_consultxgcita.getitemstring(tab_2.tp2_1.dw_consultxgcita.getrow(),'cesp')
	st.antecedente='0'
	openwithparm(w_busca_qx_cups,st)
	time hora1,hora2
	st=message.powerobjectparm
	if isvalid(st) then
		dw_qxcita_cir.setitem(j,'codproced',st.proccups)
		dw_qxcita_cir.setitem(j,'descripcion',st.descrip)
		dw_qxcita_cir.setitem(j,'tiempoqx',st.tiempoqx)
		if isnull(st.tiempoqx) then
			messagebox('Atención', 'El procedimiento no tienen tiempo Qx configurado')
			dw_qxcita.reset()
			dw_qxcita_cir.reset()
			dw_1.reset()
			trae_agenda()
			return
		end if
	else
		dw_qxcita.reset()
		dw_qxcita_cir.reset()
		dw_1.reset()
		trae_agenda()
		return
	end if
end if
l_tiempo=dw_qxcita_cir.getitemnumber(j,'tiempoqx')*60
//hora1=relativetime(time(dw_qxcita_cir.getitemdatetime(j,'iniciacir')),(st.tiempoqx*60))
hora1=relativetime(time(dw_qxcita_cir.getitemdatetime(j,'iniciacir')),l_tiempo)

dw_qxcita_cir.setitem(j,'terminacir',datetime(left(pb_4.tag,10)+' '+string(hora1)))
if idw_anestesiologos.rowcount() >0 then
	dw_qxcita_cir.setitem(j,'fecha_anes',idw_anestesiologos.getitemdatetime(idw_anestesiologos.getrow(),'fecha'))
	dw_qxcita_cir.setitem(j,'hora_anes',idw_anestesiologos.getitemdatetime(idw_anestesiologos.getrow(),'hora'))
end if
hora1=dw_1.getitemtime(dw_1.getrow(),"hora")
hora2=time(dw_qxcita_cir.getitemdatetime(1,'maxima'))
l_cual=pb_adiciona.tag
l_fila=dw_1.getrow()
int  ix_dura
ix_dura=idw_sala.getitemnumber(idw_sala.getrow(),'duracion')
Do While hora1 < hora2
	dw_1.setitem(l_fila ,"sel"+l_cual,"1")
	hora1=relativetime(hora1,ix_dura*60)
	l_fila++	
loop
dw_qxcita.setitem(1,'tterminaqx',datetime(left(pb_4.tag,10)+' '+string(hora2)))
dw_qxcita_cir.scrolltorow(j)

end event

type pb_4 from picturebutton within w_asig_cita_qx
integer x = 5961
integer y = 348
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &b"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Procedimiento"
end type

event clicked;if dw_qxcita_cir.rowcount()=0  then return
if not( isnull(dw_qxcita_cir.getitemstring(dw_qxcita_cir.getrow(),'estado'))) or dw_qxcita_cir.getitemstring(dw_qxcita_cir.getrow(),'estado')<>'0' then  return
dw_qxcita_cir.deleterow(0)
f_limpia()

end event

type dw_qxcita_cir from datawindow within w_asig_cita_qx
integer x = 1175
integer y = 212
integer width = 4773
integer height = 540
integer taborder = 60
string title = "none"
string dataobject = "dw_qxcita_cir"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
this.getchild('codtipoanestesia',idw_anesl)
idw_anesl.settransobject(sqlca)

dw_qxcita_cir.modify('anes.dddw.name="dw_lista_anestesia_turno"')
this.getchild('anes',idw_anestesiologos)
idw_anestesiologos.settransobject(sqlca)

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event itemchanged;string nulo
st_return_diags st

choose case getcolumnName()
	case "codtipoanestesia" 
		setnull(nulo)
		if idw_anesl.getitemstring(idw_anesl.getrow(),'anestesiologo')='1' then
			this.Modify("anes.Protect='0'")
		else
			this.Modify("anes.Protect='1'")
			this.setitem(1,'anes',nulo)
		end if

	case 'simultanea'
		time hora1
		if data='1' then
			dw_qxcita_cir.setitem(row,'iniciacir',dw_qxcita_cir.getitemdatetime(1,'iniciacir'))
			hora1=relativetime(time(dw_qxcita_cir.getitemdatetime(row,'iniciacir')),(dw_qxcita_cir.getitemnumber(row,'tiempoqx')*60))
			dw_qxcita_cir.setitem(row,'terminacir',datetime(string(dw_qxcita_cir.getitemdatetime(row,'iniciacir'),'dd/mm/yyyy')+' ' +string(hora1)))
		else
			dw_qxcita_cir.setitem(row,'iniciacir',dw_qxcita_cir.getitemdatetime(1,'terminacir'))
			hora1=relativetime(time(dw_qxcita_cir.getitemdatetime(row,'iniciacir')),(dw_qxcita_cir.getitemnumber(row,'tiempoqx')*60))
			dw_qxcita_cir.setitem(row,'terminacir',datetime(string(dw_qxcita_cir.getitemdatetime(row,'iniciacir'),'dd/mm/yyyy')+' ' +string(hora1)))
		end if

	case "cod_rips" 
		string diagn,este=''
		sex_busca=w_principal.dw_1.getitemstring(1,"sexo_t")
		edad_busca=w_principal.dw_1.getitemnumber(1,"dias")
		st=f_check_diag(data,sex_busca,edad_busca,este,'0')
		if st.descrip_diag="" then
			setitem(row,'cod_rips','')
			setitem(row,'dx_preqx','')
			return 1
		else
			accepttext()
			setitem(row,'dx_preqx',este)
		end if
end choose
setitem(row,'espe_qx',getitemstring(row,'espe_qx'))
this.accepttext()
end event

event losefocus;accepttext()

end event

event rowfocuschanged;if this.rowcount()<0 or this.getrow()<1 then return
//i_cuantos=this.getitemnumber(this.getrow(),"tempo")

end event

event doubleclicked;choose case getcolumnName()
	case 'cod_rips'
		st_edadsexo st_es
		st_diag st_d
		st_es.sexo=w_principal.dw_1.getitemstring(1,"sexo")
		st_es.edad=w_principal.dw_1.getitemnumber(1,"dias")
		st_es.antece='0'
		openwithparm(w_busca_diag,st_es)
		st_d=message.powerobjectparm
		if not isValid(st_d) then return
		if not isNull(st_d.codrip) then
			setitem(row,'cod_rips',st_d.codrip)
			setitem(row,'dx_preqx',st_d.codgeral)
		end if
	case 'nautoriza'
		setitem(row,'nautoriza','123456')
end choose
end event

event itemfocuschanged;if row<1 then return
if getcolumnName()='cod_rips' then
	sle_1.visible=true
	sle_1.text= getitemstring(row,'desdiag')
else
	sle_1.visible=false
	sle_1.text= ''
end if
end event

type st_4 from statictext within w_asig_cita_qx
integer x = 14
integer y = 124
integer width = 283
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Fecha:"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_asig_cita_qx
integer x = 5
integer width = 1358
integer height = 116
integer taborder = 40
string title = "none"
string dataobject = "dw_combo_lugar"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
setitem(1,1,clugar)
i_clug=clugar
end event

event itemchanged;i_clug=data
dw_escog_qx.setcolumn(1)
dw_escog_qx.triggerevent (itemchanged!)
end event

type em_3 from editmask within w_asig_cita_qx
integer x = 325
integer y = 124
integer width = 430
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mmm/yyyy"
end type

type tab_2 from tab within w_asig_cita_qx
event create ( )
event destroy ( )
integer x = 23
integer y = 928
integer width = 2597
integer height = 1272
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
integer selectedtab = 1
tp2_1 tp2_1
tp2_2 tp2_2
end type

on tab_2.create
this.tp2_1=create tp2_1
this.tp2_2=create tp2_2
this.Control[]={this.tp2_1,&
this.tp2_2}
end on

on tab_2.destroy
destroy(this.tp2_1)
destroy(this.tp2_2)
end on

type tp2_1 from userobject within tab_2
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2560
integer height = 1144
long backcolor = 67108864
string text = "Disponibilidad"
long tabtextcolor = 33554432
string picturename = "medico.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra los profesionales Asignados para la fecha"
st_2 st_2
dw_consultxgcita dw_consultxgcita
end type

on tp2_1.create
this.st_2=create st_2
this.dw_consultxgcita=create dw_consultxgcita
this.Control[]={this.st_2,&
this.dw_consultxgcita}
end on

on tp2_1.destroy
destroy(this.st_2)
destroy(this.dw_consultxgcita)
end on

type st_2 from statictext within tp2_1
integer x = 14
integer y = 12
integer width = 2496
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = " Profesionales con Turno para la fecha:"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_consultxgcita from datawindow within tp2_1
integer x = 9
integer y = 80
integer width = 2510
integer height = 1024
integer taborder = 40
string dataobject = "dw_consullibrexgcita_qx"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if rowcount()<1 then return
i_dura=getitemnumber(getrow(),"duracion")
st_sala.text=getitemstring(getrow(),"descripcion")
i_profes=getitemstring(getrow(),"prof")
i_consul=getitemstring(getrow(),"consult")
//dw_agenda.retrieve(i_consul,i_desde,i_hasta,i_profes,getitemstring(getrow(),"cesp"),dw_escog_qx.getitemstring(1,1))
dw_agenda.retrieve(i_consul,i_desde,i_hasta)

end event

event constructor;settransobject(sqlca)

end event

type tp2_2 from userobject within tab_2
integer x = 18
integer y = 112
integer width = 2560
integer height = 1144
long backcolor = 67108864
string text = "Citas Anteriores"
long tabtextcolor = 33554432
string picturename = "audita.ico"
long picturemaskcolor = 536870912
st_5 st_5
dw_citas_ante dw_citas_ante
end type

on tp2_2.create
this.st_5=create st_5
this.dw_citas_ante=create dw_citas_ante
this.Control[]={this.st_5,&
this.dw_citas_ante}
end on

on tp2_2.destroy
destroy(this.st_5)
destroy(this.dw_citas_ante)
end on

type st_5 from statictext within tp2_2
integer x = 14
integer y = 12
integer width = 2505
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "Citas Anteriores del Paciente:"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_citas_ante from datawindow within tp2_2
integer x = 18
integer y = 84
integer width = 2510
integer height = 1008
integer taborder = 50
string title = "none"
string dataobject = "dw_qxcita"
boolean hscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event clicked;if row<1 then return
dw_qxcita_cir.retrieve(dw_citas_ante.getitemnumber(row,'ncita'),dw_citas_ante.getitemstring(row,'clugar'))


end event

event rbuttondown;if row<1 then return
if row<>getrow() then setrow(row)
if getitemstring(getrow(),'estado')<>'1' then return
if dw_escog_qx.getitemstring(1,'codgc')<>getitemstring(row,'codgc') or isnull(dw_escog_qx.getitemstring(1,'codgc')) then
	dw_escog_qx.setcolumn('codgc')
	dw_escog_qx.setitem(1,'codgc',getitemstring(row,'codgc'))
	dw_escog_qx.event itemchanged(1,dw_escog_qx.object.codgc,getitemstring(row,'codgc'))
end if

date fecha
mc_1.getselecteddate(fecha)
if date(getitemdatetime(row,'fecha_asigna'))<>fecha then mc_1.setselecteddate(date(getitemdatetime(row,'fecha_asigna')))

long ojo
ojo=dw_1.find('hora=time("'+string(time(getitemdatetime(row,'tiniciaqx')))+'")',1,dw_1.rowcount())
dw_1.setrow(ojo)
w_principal.m_principal.m_3.m_3_8.m_3_8_3.m_3_8_3_1.enabled=true
w_principal.m_principal.m_3.m_3_8.m_3_8_3.PopMenu (w_asig_cita_qx.PointerX()+200, w_asig_cita_qx.PointerY()+200)

end event

type st_sala from statictext within w_asig_cita_qx
integer x = 2670
integer y = 880
integer width = 2789
integer height = 108
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type em_2 from editmask within w_asig_cita_qx
string tag = "hora fin"
boolean visible = false
integer x = 46
integer y = 2228
integer width = 165
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "23:59"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event modified;tab_2.tp2_1.dw_consultxgcita.triggerevent(rowfocuschanged!)
end event

type em_1 from editmask within w_asig_cita_qx
string tag = "hora inicio"
boolean visible = false
integer x = 224
integer y = 2224
integer width = 160
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "0:00"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event modified;tab_2.tp2_1.dw_consultxgcita.triggerevent(rowfocuschanged!)
end event

type dw_cruce from datawindow within w_asig_cita_qx
boolean visible = false
integer x = 626
integer y = 876
integer width = 87
integer height = 60
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_cruce_xa_pac"
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(SQLCA)
end event

type mc_1 from monthcalendar within w_asig_cita_qx
integer x = 14
integer y = 212
integer width = 1111
integer height = 664
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long titletextcolor = 134217742
long trailingtextcolor = 134217745
long monthbackcolor = 1073741824
long titlebackcolor = 134217741
weekday firstdayofweek = sunday!
integer maxselectcount = 31
integer scrollrate = 1
boolean todaysection = true
boolean todaycircle = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event constructor;date fec
GetSelectedDate ( fec )
em_3.text=string(fec,'dd/mm/yyyy')
i_desde=datetime(relativedate(fec,1 - daynumber(fec)))
i_hasta=datetime(relativedate(fec,7 - daynumber(fec)))
end event

event datechanged;date fec
getselecteddate(fec)
em_3.text=string(fec,'dd/mm/yyyy')
trae_agenda()
//pinta()
end event

type dw_escog_qx from datawindow within w_asig_cita_qx
integer x = 1362
integer y = 4
integer width = 2642
integer height = 120
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_escog_consul_qx"
boolean border = false
boolean livescroll = true
end type

event itemchanged;accepttext()
date ld_fecha
string filtro
if isnull(getitemstring(1,1)) then
	filtro=''
else
	filtro="'"+getitemstring(1,1)+"'"
end if
idw_sala.setfilter("codgc="+filtro +" and codlugar='"+i_clug+"'")
idw_sala.filter()
dw_1.reset()
if  getcolumn()=2 then 
	trae_agenda()
//	pinta()
end if
pb_2.enabled=true
dw_qxcita.reset()
dw_qxcita_cir.reset()
end event

event constructor;settransobject(sqlca)
insertrow(1)
getchild("salas",idw_sala)
idw_sala.settransobject(SQLCA)
end event

type gb_1 from groupbox within w_asig_cita_qx
integer x = 1138
integer y = 144
integer width = 4987
integer height = 648
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cirugías del Acto"
end type

type dw_agenda from datawindow within w_asig_cita_qx
boolean visible = false
integer x = 5550
integer y = 1608
integer width = 361
integer height = 104
boolean enabled = false
string title = "none"
string dataobject = "dw_agenda_qx_new"
boolean resizable = true
boolean border = false
boolean livescroll = true
end type

event retrieveend;dw_1.setredraw(false)
//pinta()
if this.rowcount()>0 then
//	boolean pintar=false
	time horaini,horafin,va
	if  dw_1.rowcount()=0 then pinta()
	long i,donde,dia
	string buscar,doc,tdoc
	double factu,rec
	
	dia=this.rowcount()
	for i = 1 to this.rowcount()
		horaini=time(this.getitemdatetime(i,"minimo"))
		horafin=time(this.getitemdatetime(i,"maximo"))
		buscar="hora=time('"+string(horaini)+"')"
		donde=dw_1.find(buscar,1,dw_1.rowcount())
		dia=daynumber(date(this.getitemdatetime(i,"fecha_asigna")))
		do while horaini<= horafin
			doc=this.getitemstring(i,"documento")
			tdoc=this.getitemstring(i,"tipodoc")
			if dw_1.getitemstring(donde,'sel'+string(dia))='1' then
				dw_1.setrow(donde)
				dw_1.setcolumn('dia'+string(dia))
				dw_1.event clicked(0,0,donde,lf_dwo(dia))
			end if
			if doc="" or isnull(doc) then
				dw_1.setitem(donde,"dia"+string(dia),"Ocupado")
			else
				dw_1.setitem(donde,"dia"+string(dia),doc)
				dw_1.setitem(donde,"ncita"+string(dia),this.getitemnumber(i,"ncita"))
				dw_1.setitem(donde,"tdoc"+string(dia),tdoc)
			//	dw_1.setitem(donde,"proc"+string(dia),this.getitemstring(i,"cproced"))
			//	dw_1.setitem(donde,"sec_cant"+string(dia),this.getitemnumber(i,"sec_cant"))
			//	dw_1.setitem(donde,"nserv"+string(dia),this.getitemnumber(i,"nservicio"))
			//	if isnull(factu) and isnull(rec) then
			//		dw_1.setitem(donde,"fac"+string(dia),'1')
			//	else
			//		dw_1.setitem(donde,"fac"+string(dia),'0')
		//	end  if
			end if
			if dw_1.getitemstring(donde,"sel"+string(dia))="1" then 
				dw_1.setitem(donde,"sel"+string(dia),"0")
				i_cuantos=i_cuantos -1
			end if
			horaini=relativetime(horaini,i_dura*60)
			buscar="hora=time('"+string(horaini)+"')"
			donde=dw_1.find(buscar,1,dw_1.rowcount())
		loop
	//	end if
	next
else
	pinta()
end if
dw_1.setredraw(true)
end event

event constructor;settransobject(SQLCA)
end event

type dw_1 from datawindow within w_asig_cita_qx
event mousemove pbm_dwnmousemove
event keypres pbm_dwnkey
event llena_asig ( long p_fila,  integer p_columna )
event borra_asig ( boolean p_todos )
integer x = 2679
integer y = 984
integer width = 2779
integer height = 1272
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "dw_horario_qx"
richtexttoolbaractivation richtexttoolbaractivation = richtexttoolbaractivationnever!
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event keypres;if key=keyspacebar! then
	this.triggerevent(clicked!)
end if
end event

event llena_asig(long p_fila, integer p_columna);//tab_1.tp_2.dw_serv_turno.setredraw(false)
//tab_1.tp_2.dw_serv_turno.setfilter('isnull(fecha) and cproced="'+getitemstring(p_fila,'proc'+string(p_columna))+'" and sec_cant='+string(getitemnumber(p_fila,'sec_cant'+string(p_columna))))
//tab_1.tp_2.dw_serv_turno.filter()
//tab_1.tp_2.dw_serv_turno.setitem(1,'fecha',datetime(relativedate(date(i_desde),p_columna -1),time('00:00:00')))
//tab_1.tp_2.dw_serv_turno.setitem(1,'hora',datetime(date('1900-01-01'),getitemtime(p_fila,'hora')))
//tab_1.tp_2.dw_serv_turno.setitem(1,'prof',i_profes)
//tab_1.tp_2.dw_serv_turno.setitem(1,'consult',i_consul)
//tab_1.tp_2.dw_serv_turno.setitem(1,'duracion',i_dura)
//tab_1.tp_2.dw_serv_turno.setfilter('')
//tab_1.tp_2.dw_serv_turno.filter()
//tab_1.tp_2.dw_serv_turno.setredraw(true)
end event

event borra_asig(boolean p_todos);//string cual,proc
//long fila,sec_cant
//date fecha
//time hora
//fila=getrow()
//cual = right(getcolumnname(),1)
//if p_todos then
//	proc=getitemstring(fila,"proc"+cual)
//	sec_cant=getitemnumber(fila,"sec_cant"+cual)
//	//tab_1.tp_2.dw_serv_turno.setfilter('sec_cant='+string(sec_cant)+' and cproced="'+proc+'"')
//	tab_1.tp_2.dw_serv_turno.setfilter( 'cproced="'+proc+'"')
//else
//	fecha=relativedate(date(i_desde), long(cual) -1)
//	hora=getitemtime(fila,'hora')
//	tab_1.tp_2.dw_serv_turno.setfilter('date(fecha)=date("'+string(fecha,'yyyy-mm-dd')+'") and time(hora)=time("'+string(hora,'HH:mm')+'")')
//end if
//tab_1.tp_2.dw_serv_turno.setredraw(false)
//tab_1.tp_2.dw_serv_turno.filter()
//long j
//datetime nulo
//string snulo
//setnull(snulo)
//setnull(nulo)
//
////tab_1.tp_1.dw_serv_cita.getitemnumber(tab_1.tp_1.dw_serv_cita.getrow(),"nturnos")
//for j=1 to tab_1.tp_2.dw_serv_turno.rowcount()
//	tab_1.tp_2.dw_serv_turno.setitem(j,'fecha',nulo)
//	tab_1.tp_2.dw_serv_turno.setitem(j,'hora',nulo)
//	tab_1.tp_2.dw_serv_turno.setitem(j,'prof',snulo)
//	tab_1.tp_2.dw_serv_turno.setitem(j,'consult',snulo)
//	tab_1.tp_2.dw_serv_turno.setitem(j,'duracion',0)
//next
//tab_1.tp_2.dw_serv_turno.setfilter('')
//tab_1.tp_2.dw_serv_turno.filter()
//tab_1.tp_2.dw_serv_turno.setredraw(true)
end event

event clicked;long fila,sec_cant
date fec,ld_fecha_cita
datetime ldt_fecha1,ldt_fecha2
mc_1.getselecteddate(fec)
if tab_2.tp2_1.dw_consultxgcita.rowcount()=0 then return
if docu='' or isnull(docu) then return
if dw_qxcita.rowcount()>0 then 
	if dw_qxcita.getitemstring(dw_qxcita.getrow(),'estado') <>'4' then
		dw_qxcita.reset()
		dw_qxcita_cir.reset()
		return
	end if
end if
if isvalid(dwo) then
	if string(dwo.type)="column" and string(dwo.name)<> "hora" then
		setcolumn(string(dwo.name))
		fila=row
		scrolltorow(fila)
	else
		fila=0
	end if
else
	fila=getrow()
end if
if fila<1 or rowcount()=0 then return
string t
t=getcolumnname()
if left(t,3)<>'dia' then return

string cual,eval
datetime fecha, hora
long columna,i,j,donde,k,busca,busca2,cit_x_dia,cit_x_mes
cual = right(t,1)
columna=long(cual)
if getitemstring(fila,"dia"+cual)="" or isnull(getitemstring(fila,"dia"+cual))  then return
ld_fecha_cita=relativedate(fec,columna - daynumber(fec))
if datetime(ld_fecha_cita,getitemtime(fila,"hora")) < datetime(today(),now()) and getitemstring(fila,"dia"+cual)='Libre'   then 
	messagebox("Atención","La fecha y/o hora de esta cita es menor a la del sistema, ya no la puede asignar")
	return
end if

if ld_fecha_cita<>date(tab_2.tp2_1.dw_consultxgcita.getitemdatetime(tab_2.tp2_1.dw_consultxgcita.getrow(),'fecha')) then
	messagebox("Atención","La fecha de esta cita no corresponde disponibilidad profesional selecionado ccccc")
	return
end if
if  ld_fecha_cita<date(tab_2.tp2_1.dw_consultxgcita.getitemdatetime(tab_2.tp2_1.dw_consultxgcita.getrow(),'fecha')) then
	messagebox("Atención","La fecha de esta cita no corresponde disponibilidad profesional selecionado")
	return
end if
if 	(datetime(ld_fecha_cita,getitemtime(fila,"hora")) < datetime(date(tab_2.tp2_1.dw_consultxgcita.getitemdatetime(tab_2.tp2_1.dw_consultxgcita.getrow(),'fecha')),time(tab_2.tp2_1.dw_consultxgcita.getitemdatetime(tab_2.tp2_1.dw_consultxgcita.getrow(),'hora'))) 	&
 	or   datetime(ld_fecha_cita,getitemtime(fila,"hora")) >datetime(date(tab_2.tp2_1.dw_consultxgcita.getitemdatetime(tab_2.tp2_1.dw_consultxgcita.getrow(),'fecha')),time(tab_2.tp2_1.dw_consultxgcita.getitemdatetime(tab_2.tp2_1.dw_consultxgcita.getrow(),'fin')))) &
 	and getitemstring(fila,"dia"+cual)='Libre' then
  messagebox("Atención","La fecha y/o hora no esta en el turno definido para el profesional, no puede asignar")
  return
end if

int año,mes
if	(getitemstring(fila,"dia"+cual)="Libre")  then
	if getitemstring(fila,"sel"+cual)="1" then 
		//quitar un proc
		busca2=find("dia"+cual+"='"+getitemstring(fila,"proc"+cual)+"' and sec_cant"+cual+"="+string(getitemnumber(fila,"sec_cant"+cual)),1,rowcount())
		setitem(busca2 +k -1,"dia"+cual,"Libre")
		setitem(busca2 +k -1,"sel"+cual,"0")
		setitem(busca2 +k -1,"proc"+cual,"")
		setitem(busca2 +k -1,"sec_cant"+cual,0)
		i_cuantos=i_cuantos -1
	else
		setitem(fila ,"sel"+cual,"1")
		if dw_qxcita.rowcount()=0 then//getitemstring(dw_qxcita.getrow(),'estado') <>'4' then
			dw_qxcita.insertrow(1)
			dw_qxcita.setitem(1,'tipodoc',tipdoc)
			dw_qxcita.setitem(1,'documento',docu)
			dw_qxcita.setitem(1,'usuario',usuario)
			dw_qxcita.setitem(1,'estado','0')
		end if	
		fecha=datetime(relativedate(fec,columna - daynumber(fec)),getitemtime(fila,"hora"))
		pb_4.tag=string(fecha)
		dw_qxcita.setitem(1,'tiniciaqx',fecha)
		dw_qxcita.setitem(1,'codigosala',dw_escog_qx.getitemstring(1,'salas'))
		dw_qxcita.setitem(1,'codgc',dw_escog_qx.getitemstring(1,'codgc'))
		dw_qxcita.setitem(1,'fecha_asigna',date(fecha))
		dw_qxcita.setitem(1,'fecha_crea',string(today())+' '+string(now()))
		pb_adiciona.tag=cual
		if isnull(dw_qxcita.getitemstring(1,'codemp')) then 
			st_busca_emp_capit st_emp
			openwithparm(w_escoge_empresa_qx,st_emp)
			st_emp=message.powerobjectparm
			if isvalid(st_emp) then
				IF ISNULL(st_emp.emp) then 
					messagebox('Atención','No hay empresa responsable empresa')
					return
				end if
			else
				dw_qxcita.reset()
				dw_qxcita_cir.reset()
				dw_1.reset()
				trae_agenda()
				return
			end if
			dw_qxcita.setitem(1,'codemp',st_emp.emp)
		end if
		dw_qxcita.scrolltorow(1)
		setitem(fila,"sec_cant"+cual,sec_cant)
		pb_adiciona.event clicked()
end if
//	tab_1.tp_1.dw_serv_cita.setitem(tab_1.tp_1.dw_serv_cita.getrow(),"tempo",i_cuantos)
end if

end event

event rbuttondown;date fec
mc_1.getselecteddate(fec)
long fila
if isvalid(dwo) then
	if string(dwo.type)="column" and string(dwo.name)<> "hora" then
		this.setcolumn(string(dwo.name))
		fila=row
		this.scrolltorow(fila)
	else
		fila=0
	end if
else
	fila=this.getrow()
end if
if fila<1 then return
string t,cual
long columna
t=this.getcolumnname()
cual = right(t,1)
columna=long(cual)
if this.getitemstring(fila,t)="" or isnull(this.getitemstring(fila,t)) or this.getitemstring(fila,t)="Libre" or isnull(this.getitemnumber(fila,"ncita"+Right ( t, 1 ))) then return
if datetime(relativedate(fec,columna - daynumber(fec)),this.getitemtime(fila,"hora")) < datetime(today(),now()) then 
	w_principal.m_principal.m_3.m_3_8.m_3_8_3.m_3_8_3_1.enabled=false
	w_principal.m_principal.m_3.m_3_8.m_3_8_3.m_3_8_3_2.enabled=false
	return
end if
If w_principal.m_principal <> im_main then
	w_principal.m_principal.m_3.m_3_8.m_3_8_3.m_3_8_3_1.enabled=true
	w_principal.m_principal.m_3.m_3_8.m_3_8_3.m_3_8_3_2.enabled=true
	if getitemstring(fila,t)=docu and getitemstring(fila,'tdoc'+cual)=tipdoc then
		w_principal.m_principal.m_3.m_3_8.m_3_8_3.m_3_8_3_1.enabled=true
	else
		w_principal.m_principal.m_3.m_3_8.m_3_8_3.m_3_8_3_2.enabled=false
	end if
	w_principal.m_principal.m_3.m_3_8.m_3_8_3.PopMenu (w_principal.PointerX(), w_principal.PointerY())
End If
end event

event constructor;settransobject(sqlca)
end event

event doubleclicked;if row<1 then return
string cual,t_doc,doc,nom_1,nom_2,ape_1,ape_2,proc,d_proc
long columna
if string(dwo.type)="column" and string(dwo.name)<>"hora" then
	cual = right(string(dwo.name),1)
	if this.getitemstring(row,"dia"+cual)<>"Libre" then
		columna=long(cual)
		doc=this.getitemstring(row,"dia"+cual)
		t_doc=this.getitemstring(row,"tdoc"+cual)
		if i_col_ant<>columna or i_fila_ant<>row then
			i_col_ant=columna
			i_fila_ant=row
			proc=this.getitemstring(row,"proc"+cual)
			dw_qxcita_cir.retrieve(dw_1.getitemnumber(row,"ncita"+cual),clugar,'1')
		end if
	else
		i_col_ant=0
		i_fila_ant=0
	end if
end if


end event

