$PBExportHeader$w_asig_cita.srw
forward
global type w_asig_cita from window
end type
type dw_fin_proced from datawindow within w_asig_cita
end type
type dw_ver from datawindow within w_asig_cita
end type
type st_cita from statictext within w_asig_cita
end type
type dw_4 from datawindow within w_asig_cita
end type
type dw_3 from datawindow within w_asig_cita
end type
type pb_1 from pb_report within w_asig_cita
end type
type cb_guarda from picturebutton within w_asig_cita
end type
type cb_2 from picturebutton within w_asig_cita
end type
type cb_lleva from picturebutton within w_asig_cita
end type
type cb_guarda_yrec from picturebutton within w_asig_cita
end type
type pb_2 from picturebutton within w_asig_cita
end type
type pb_nocita from picturebutton within w_asig_cita
end type
type fecha_esperada from editmask within w_asig_cita
end type
type st_6 from statictext within w_asig_cita
end type
type rte_1 from richtextedit within w_asig_cita
end type
type st_4 from statictext within w_asig_cita
end type
type dw_2 from datawindow within w_asig_cita
end type
type em_3 from editmask within w_asig_cita
end type
type pb_print from pb_report within w_asig_cita
end type
type tab_2 from tab within w_asig_cita
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
type st_3 from statictext within tp2_2
end type
type dw_citas_ante from datawindow within tp2_2
end type
type tp2_2 from userobject within tab_2
st_3 st_3
dw_citas_ante dw_citas_ante
end type
type tp2_3 from userobject within tab_2
end type
type dw_citas_no_asig from datawindow within tp2_3
end type
type st_5 from statictext within tp2_3
end type
type tp2_3 from userobject within tab_2
dw_citas_no_asig dw_citas_no_asig
st_5 st_5
end type
type tab_2 from tab within w_asig_cita
tp2_1 tp2_1
tp2_2 tp2_2
tp2_3 tp2_3
end type
type tab_1 from tab within w_asig_cita
end type
type tp_1 from userobject within tab_1
end type
type pb_vacia from picturebutton within tp_1
end type
type pb_4 from picturebutton within tp_1
end type
type pb_3 from picturebutton within tp_1
end type
type st_1 from statictext within tp_1
end type
type dw_serv_cita from datawindow within tp_1
end type
type tp_1 from userobject within tab_1
pb_vacia pb_vacia
pb_4 pb_4
pb_3 pb_3
st_1 st_1
dw_serv_cita dw_serv_cita
end type
type tp_2 from userobject within tab_1
end type
type dw_serv_turno from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
dw_serv_turno dw_serv_turno
end type
type tab_1 from tab within w_asig_cita
tp_1 tp_1
tp_2 tp_2
end type
type st_consul from statictext within w_asig_cita
end type
type em_2 from editmask within w_asig_cita
end type
type em_1 from editmask within w_asig_cita
end type
type dw_1 from datawindow within w_asig_cita
end type
type dw_cruce from datawindow within w_asig_cita
end type
type dw_agenda from datawindow within w_asig_cita
end type
type dw_cita_asig from datawindow within w_asig_cita
end type
type mc_1 from monthcalendar within w_asig_cita
end type
type dw_escog_profe from datawindow within w_asig_cita
end type
type cbx_1 from checkbox within w_asig_cita
end type
type dw_cuenta_citas from datawindow within w_asig_cita
end type
end forward

global type w_asig_cita from window
integer width = 6021
integer height = 2516
boolean titlebar = true
string title = "Asignación de Citas"
boolean controlmenu = true
boolean maxbox = true
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "r_asig_cita.ico"
string pointer = "Arrow!"
dw_fin_proced dw_fin_proced
dw_ver dw_ver
st_cita st_cita
dw_4 dw_4
dw_3 dw_3
pb_1 pb_1
cb_guarda cb_guarda
cb_2 cb_2
cb_lleva cb_lleva
cb_guarda_yrec cb_guarda_yrec
pb_2 pb_2
pb_nocita pb_nocita
fecha_esperada fecha_esperada
st_6 st_6
rte_1 rte_1
st_4 st_4
dw_2 dw_2
em_3 em_3
pb_print pb_print
tab_2 tab_2
tab_1 tab_1
st_consul st_consul
em_2 em_2
em_1 em_1
dw_1 dw_1
dw_cruce dw_cruce
dw_agenda dw_agenda
dw_cita_asig dw_cita_asig
mc_1 mc_1
dw_escog_profe dw_escog_profe
cbx_1 cbx_1
dw_cuenta_citas dw_cuenta_citas
end type
global w_asig_cita w_asig_cita

type variables
long i_dura,i_cuantos,i_fila_prof,i_fila_ant,i_col_ant
int l_cita 
datawindowchild i_dw_grupc,i_dw_proc_gcita,idw_lugar,idw_fincon,idw_finconpac
datetime i_desde,i_hasta
string i_profes,i_esp,i_consul,i_clug,ls_tipo,is_pdf
boolean i_guardo,lb_espera=false,lb_fina=false,lb_tipoc=false
//m_principal im_main 
m_ppal im_main 

end variables

forward prototypes
public subroutine trae_agenda ()
public subroutine pinta ()
public subroutine f_limpia ()
public subroutine f_estados_dw ()
public function integer lleva_afactu ()
public function integer guardar (integer tipo)
public function integer lleva_a_recibos ()
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
if dw_escog_profe.rowcount()=0 then return
tab_2.tp2_1.dw_consultxgcita.setredraw(false)
tab_2.tp2_1.dw_consultxgcita.reset()
tab_2.tp2_1.dw_consultxgcita.retrieve(dw_escog_profe.getitemstring(1,1),i_desde,i_hasta,i_clug)
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

end subroutine

public subroutine pinta ();time hora
long cual
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
	hora=relativetime(hora,i_dura*60)
LOOP
tab_1.tp_2.dw_serv_turno.setredraw(false)
tab_1.tp_2.dw_serv_turno.setfilter('prof="'+i_profes+'" and date(fecha)>=date("'+string(i_desde,'yyyy-mm-dd')+'") and date(fecha)<=date("'+string(i_hasta,'yyyy-mm-dd')+'")')
tab_1.tp_2.dw_serv_turno.filter()
long j,dia
for j=1 to tab_1.tp_2.dw_serv_turno.rowcount()
	hora=time(tab_1.tp_2.dw_serv_turno.getitemdatetime(j,'hora'))
	if hora>=time(em_1.text) and hora<=time(em_2.text) then //esta en ese intervalo
		cual=dw_1.find('hora=time("'+string(hora,'HH:mm')+'")',1,dw_1.rowcount())
		dia=daysafter(date(i_desde),date(tab_1.tp_2.dw_serv_turno.getitemdatetime(j,'fecha'))) +1
		dw_1.setitem(cual,'proc'+string(dia),tab_1.tp_2.dw_serv_turno.getitemstring(j,'cproced'))
		dw_1.setitem(cual,'dia'+string(dia),tab_1.tp_2.dw_serv_turno.getitemstring(j,'cproced'))
		dw_1.setitem(cual,'sel'+string(dia),'1')
		dw_1.setitem(cual,'nserv'+string(dia),tab_1.tp_2.dw_serv_turno.getitemnumber(j,'nservicio'))
		dw_1.setitem(cual,'sec_cant'+string(dia),tab_1.tp_2.dw_serv_turno.getitemnumber(j,'sec_cant'))
		if (isnull(tab_1.tp_2.dw_serv_turno.getitemnumber(j,'nfact'))) and (isnull(tab_1.tp_2.dw_serv_turno.getitemnumber(j,'nrcaj') ) ) then
			dw_1.setitem(cual,'fac'+string(dia),'0')
		else
			dw_1.setitem(cual,'fac'+string(dia),'1')
		end If
		dw_1.setitem(cual,'conf'+string(dia),tab_1.tp_2.dw_serv_turno.getitemstring(j,'control'))
		
	end if
next
tab_1.tp_2.dw_serv_turno.setfilter('')
tab_1.tp_2.dw_serv_turno.filter()
tab_1.tp_2.dw_serv_turno.setredraw(true)

end subroutine

public subroutine f_limpia ();long j,donde
for j=1 to 7
	donde=dw_1.find('sel'+string(j)+'="1"',1,dw_1.rowcount())
	do while donde<>0 
		dw_1.setitem(donde,'sel'+string(j),'0')
		dw_1.setitem(donde,'dia'+string(j),'Libre')
		dw_1.setitem(donde,'proc'+string(j),'')
		dw_1.setitem(donde,'nserv'+string(j),'')
		dw_1.setitem(donde,'fac'+string(j),'')
		dw_1.setitem(donde,'conf'+string(j),'')
		donde=dw_1.find('sel'+string(j)+'="1"',donde,dw_1.rowcount())
	loop
next
for j=1 to tab_1.tp_1.dw_serv_cita.rowcount()
	tab_1.tp_1.dw_serv_cita.setitem(j,'tempo',0)
next
string snulo
datetime nulo
setnull(nulo)
setnull(snulo)
for j=1 to tab_1.tp_2.dw_serv_turno.rowcount()
	tab_1.tp_2.dw_serv_turno.setitem(j,'fecha',nulo)
	tab_1.tp_2.dw_serv_turno.setitem(j,'hora',nulo)
	tab_1.tp_2.dw_serv_turno.setitem(j,'prof',snulo)
	tab_1.tp_2.dw_serv_turno.setitem(j,'consult',snulo)
	tab_1.tp_2.dw_serv_turno.setitem(j,'duracion',0)
next
end subroutine

public subroutine f_estados_dw ();dw_cita_asig.reset()
dw_cita_asig.insertrow(1)
tab_1.tp_1.dw_serv_cita.resetupdate()
tab_1.tp_2.dw_serv_turno.resetupdate()
end subroutine

public function integer lleva_afactu ();long col
if not w_principal.m_principal.m_3.m_3_10.m_3_10_1.visible then 
	messagebox("Atención","No tiene permiso de facturar")
	return -1
end if
if not isvalid(w_factura) then 
	opensheet (w_factura,w_principal,7,original!)
else
	w_factura.triggerevent(open!)
end if
string cproc,uf,cc,emp,cont,codta,sexo,estrato,desproc,activo,tipo_cont
long ncita,nserv_cita,sec_cant_cita,cantidad,edad
if w_factura.dw_emppac.rowcount()=0 then return -1
if w_factura.dw_emppac.rowcount()>1 then
	openwithparm(w_escoge,w_factura.dw_emppac)
	if message.doubleparm=0 then
		close(w_factura)
		return -1
	end if
	emp=w_factura.dw_emppac.getitemstring(message.doubleparm,'codemp')
	cont=w_factura.dw_emppac.getitemstring(message.doubleparm,'codcontrato')
	codta=w_factura.dw_emppac.getitemstring(message.doubleparm,'codta')
	tipo_cont=w_factura.dw_emppac.getitemstring(message.doubleparm,'tipo_fac')
	activo=w_factura.dw_emppac.getitemstring(message.doubleparm,'estado')
else
	emp=w_factura.dw_emppac.getitemstring(1,'codemp')
	cont=w_factura.dw_emppac.getitemstring(1,'codcontrato')
	codta=w_factura.dw_emppac.getitemstring(1,'codta')
	tipo_cont=w_factura.dw_emppac.getitemstring(1,'tipo_fac')
	activo=w_factura.dw_emppac.getitemstring(1,'estado')
end if
if activo='0' then
	messagebox('Atención','El contrato no está activo')
	return -1
end if
edad=w_principal.dw_1.getitemnumber(1,'dias')
sexo=w_principal.dw_1.getitemstring(1,'sexo')
estrato=w_principal.dw_1.getitemstring(1,'estrato')
for col=1 to tab_1.tp_1.dw_serv_cita.rowcount()
	cproc=tab_1.tp_1.dw_serv_cita.getitemstring(col,"cproced")
	if cproc='' or isnull(cproc) then continue
	select descripcion into :desproc from proced where codproced=:cproc;
	nserv_cita=tab_1.tp_1.dw_serv_cita.getitemnumber(col,"nservicio")
	ncita=tab_1.tp_1.dw_serv_cita.getitemnumber(col,"ncita")
	cantidad=tab_1.tp_1.dw_serv_cita.getitemnumber(col,"cantidad")
	uf=tab_2.tp2_1.dw_consultxgcita.getitemstring(tab_2.tp2_1.dw_consultxgcita.getrow(),"cufuncional")
	cc=tab_2.tp2_1.dw_consultxgcita.getitemstring(tab_2.tp2_1.dw_consultxgcita.getrow(),"cccosto")

	
	//37 parametros ( p_codigo,p_desproc, p_cantidad,  p_tipo,  p_tipoing,  p_autoriza,  p_cemp,  p_cont,  p_cons_soat, 
	//  p_clug_soat,  p_tdoc,  p_docu,  p_edad,  p_sexo,  p_codta,p_estrato,  p_uf,  p_cc,  p_desde,  p_facturar,  p_contador, 
	//  p_clug_his,  p_nserv,  p_prof_cir,  p_espe_cir,  p_via,  p_acto,  p_tipo_cir,  p_ncita, p_clug_cita, p_nserv_cita, 
	//  p_sec_cant_cita,  p_nreci,  p_clug_rec,  p_item_rec,  p_ntrat, p_clug_trat, p_item_trat)
	w_factura.lf_cargar_a(cproc,desproc,cantidad,'C','1','',emp,cont,0, &
	  '',tipdoc,docu,edad,sexo,codta,estrato,uf,cc,'C',1,0, &
	  '',0,'','','',0,'',ncita,i_clug,nserv_cita,&
	  0,0,'',0,0,'',0,'','!',0,0,0,'',tipo_cont,0,'','',0,'0','','','','','')
		
next
w_factura.i_tipo_prof=tab_2.tp2_1.dw_consultxgcita.getitemstring(tab_2.tp2_1.dw_consultxgcita.getrow(),'persoatiende')
w_factura.i_profe=i_profes
return 1
end function

public function integer guardar (integer tipo);if not f_demo('pac') then return -1
if lb_espera=false then 
	messagebox("Atención","Seleccione Fecha Esperada ")
	setfocus(fecha_esperada)
	return 0
end if
if isnull(dw_3.getitemstring(1,'cod_tcita')) or lb_tipoc=false then
	messagebox("Atención","Seleccione Tipo cita")
	setfocus(dw_3)
	return 0
end if	
if isnull(dw_4.getitemstring(1,'codfin')) or lb_fina=false then
	messagebox("Atención","Seleccione Finalidad cita")
	setfocus(dw_4)
	return 0
end if	
if docu="" then 
	messagebox("Atención","Seleccione un paciente")
	return 0
end if
if tab_1.tp_1.dw_serv_cita.rowcount()<1 then return 0
if tab_1.tp_1.dw_serv_cita.find("tempo -(cantidad*nturnos)<>0",1,tab_1.tp_1.dw_serv_cita.rowcount())<>0 then
	messagebox("Error","Para poder guardar o facturar los servicios debe asignar todas las citas")
	return 0
end if

st_busca_emp_capit st_emp
openwithparm(w_escoge_empresa_citas,st_emp)
st_emp=message.powerobjectparm
if isvalid(st_emp) then
	IF ISNULL(st_emp.emp) then 
		messagebox('Atención','No hay empresa responsable empresa')
		return 0
	end if
end if

long ncita,actu,nulo
string snulo,i_cod_cita='CIT'
setnull(snulo)
setnull(nulo)
if isnull(dw_cita_asig.getitemnumber(1,"ncita")) then
	ncita=f_trae_ndoc(i_cod_cita,i_clug,'Citas')
	if ncita=-1 then
		rollback;
		return -1
	end if
	dw_cita_asig.setitem(1,"ncita",ncita)
	dw_cita_asig.setitem(1,"clugar",i_clug)
	dw_cita_asig.setitem(1,"tipodoc",tipdoc)
	dw_cita_asig.setitem(1,"documento",docu)
	dw_cita_asig.setitem(1,"usuario",usuario)
	dw_cita_asig.setitem(1,"fecha_crea",datetime(today(),now()))
	dw_cita_asig.setitem(1,"codgc",dw_escog_profe.getitemstring(1,'codgc'))
	dw_cita_asig.setitem(1,'codemp',st_emp.emp)
	dw_cita_asig.setitem(1,'ccontrato',st_emp.cont)	
	dw_cita_asig.setitem(1,'cod_tcita',dw_3.getitemstring(1,'cod_tcita'))
	dw_cita_asig.setitem(1,'cod_fina',dw_4.getitemstring(1,'codfin'))	
	datetime fec
	fec=datetime(fecha_esperada.text)
	dw_cita_asig.setitem(1,"fecha_esperada",fec)
	actu=dw_cita_asig.update(true,false)
	if actu=-1 or isnull(actu) then
		dw_cita_asig.setitem(1,"ncita",nulo)
		return -1
	end if
	//em_3.text=string(fec,'dd/mm/yyyy')
else
	ncita=dw_cita_asig.getitemnumber(1,"ncita")
end if

long i,j
for i=1 to tab_1.tp_1.dw_serv_cita.rowcount()
	tab_1.tp_1.dw_serv_cita.setitem(i,"ncita",ncita)
	tab_1.tp_1.dw_serv_cita.setitem(i,"clugar",i_clug)
	if tab_1.tp_1.dw_serv_cita.getitemstring(i,'cproced')='Ning.' then tab_1.tp_1.dw_serv_cita.setitem(i,"cproced",snulo)
next
actu=tab_1.tp_1.dw_serv_cita.update(true,false)
if actu= -1 or isnull(actu) then
	dw_cita_asig.setitem(1,"ncita",nulo)
	return -1
end if
long fila
datetime fecha,hora
string c_prof
boolean error_g
for fila=1 to tab_1.tp_2.dw_serv_turno.rowcount()
	if tab_1.tp_2.dw_serv_turno.getitemstring(fila,'cproced')='Ning.' then tab_1.tp_2.dw_serv_turno.setitem(fila,'cproced',snulo)
	c_prof=tab_1.tp_2.dw_serv_turno.getitemstring(fila,"prof")
	hora=tab_1.tp_2.dw_serv_turno.getitemdatetime(fila,"hora")
	fecha=tab_1.tp_2.dw_serv_turno.getitemdatetime(fila,"fecha")
	if fila= 1 then 
		UPDATE AgendaProf SET EstCita = '1',ncita=:ncita ,clugar=:i_clug WHERE AgendaProf.EstCita Is Null AND AgendaProf.Prof=:c_prof AND AgendaProf.Fecha=:fecha AND AgendaProf.Hora= :hora;
		if sqlca.sqlnrows=0 or sqlca.sqlcode=-1 then 
			error_g=true
			exit
		end if
	end if
	tab_1.tp_2.dw_serv_turno.setitem(fila,"ncita",ncita)
	tab_1.tp_2.dw_serv_turno.setitem(fila,"clugar",i_clug)
next
if error_g then
	Messagebox("Error en Asignación de Cita","Es posible que esta cita ya se haya asignado,Intente nuevamente")
	dw_cita_asig.setitem(1,"ncita",nulo)
	return -1
end if
actu=tab_1.tp_2.dw_serv_turno.update(true,false)
if actu=-1 or isnull(actu) then
	dw_cita_asig.setitem(1,"ncita",nulo)
	return -1
end if
//////////////////interface con orden de servicio y odontologia
if not isvalid(w_trasl_cita) then
	long nserv,cont_os,nsoli_os,item_os,ntra_tto,item_tto
	string clug_os,clug_tto
	
	i= tab_1.tp_1.dw_serv_cita.rowcount()
	for i=1 to tab_1.tp_1.dw_serv_cita.rowcount()
		j=tab_1.tp_1.dw_serv_cita.getitemnumber(i,'cantidad')
		for j=1 to tab_1.tp_1.dw_serv_cita.getitemnumber(i,'cantidad')//toca uno a uno por si isertaron uno manualmente
			nserv=tab_1.tp_1.dw_serv_cita.getitemnumber(i,'nservicio')
			tab_1.tp_2.dw_serv_turno.setfilter('nservicio='+string(nserv)+' and sec_cant='+string(j))
			tab_1.tp_2.dw_serv_turno.filter()
			cont_os=tab_1.tp_2.dw_serv_turno.getitemnumber(1,'contador_os')
			if not isnull(cont_os) then
				clug_os=tab_1.tp_2.dw_serv_turno.getitemstring(1,'clugar_os')
				nsoli_os=tab_1.tp_2.dw_serv_turno.getitemnumber(1,'nsolicitud_os')
				item_os=tab_1.tp_2.dw_serv_turno.getitemnumber(1,'item_os')
				update oscuerpo set cant_encita = cant_encita +1 
				where contador=:cont_os and clugar=:clug_os and nsolicitud=:nsoli_os and item=:item_os;
				if sqlca.sqlcode=-1 then
					messagebox("Error actualizando OSCuerpo",sqlca.sqlerrtext)
					tab_1.tp_2.dw_serv_turno.setfilter('')
					tab_1.tp_2.dw_serv_turno.filter()
					dw_cita_asig.setitem(1,"ncita",nulo)
					return -1
				end if
			end if // fin contador
			ntra_tto=tab_1.tp_2.dw_serv_turno.getitemnumber(1,'ntratamiento')
			if not isnull(ntra_tto) then
				clug_tto=tab_1.tp_2.dw_serv_turno.getitemstring(1,'clugar_tto')
				item_tto=tab_1.tp_2.dw_serv_turno.getitemnumber(1,'item_tto')
				UPDATE odontratacpo SET cant_encita = '1'
				WHERE 
					(((odontratacpo.ntratamiento)=:ntra_tto) AND ((odontratacpo.clugar)=:clug_tto) 
					AND ((odontratacpo.item)=:item_tto));
				if sqlca.sqlcode=-1 then
					messagebox("Error actualizando Odonttramiento",sqlca.sqlerrtext)
					tab_1.tp_2.dw_serv_turno.setfilter('')
					tab_1.tp_2.dw_serv_turno.filter()
					dw_cita_asig.setitem(1,"ncita",nulo)
					return -1
				end if
			end if  /// fin tratamiento
		next
	next
end if
//////////////////fin interface con orden de servicio y odontologia

///recuerda citas
if l_cita=1 and not isnull(w_principal.dw_1.getitemstring(1,"email")) then
	string em
	em=w_principal.dw_1.getitemstring(1,"email")
	f_recuerda_cita(ncita,i_clug,'G',em,rte_1,true,'')
end if
//////////////recuerda citas

i_guardo=true ///para chequear numero de turnos
//st_cita.text=string(ncita)
if cbx_1.checked then
	any par[2]
	par[1]=i_clug
	par[2]=ncita
	pb_print.imprimir(par,'','0')
end if
pb_2.enabled=true
f_estados_dw()//resetear las banderas de los dw actualizados ( sino pasa lo de facturar de todas maneras la cita si se guardo)
choose case tipo
	case 1 
		lleva_afactu()
	case 2
		lleva_a_recibos()
end choose
tab_1.tp_1.dw_serv_cita.reset()
tab_1.tp_2.dw_serv_turno.reset()
fecha_esperada.enabled=false
fecha_esperada.visible=false
dw_3.visible=false
dw_4.visible=false
st_6.visible=false
st_6.enabled=false
fecha_esperada.text=string(datetime(today(),now()))
dw_4.reset()
dw_4.insertrow(1)
dw_3.reset()
dw_3.insertrow(1)
return 1
end function

public function integer lleva_a_recibos ();long col
if not w_principal.m_principal.m_3.m_3_10.m_3_10_2.visible then
	messagebox("Atención","No tiene permiso de Hacer Recibos de Caja")
	return -1
end if
if not isvalid(w_rec_caja) then 
	opensheet (w_rec_caja,w_principal,7,original!)
else
	w_rec_caja.triggerevent(open!)
end if
string cproc,uf,cc,emp,cont,codta,sexo,estrato,desproc,tipo_fac
long ncita,nserv_cita,sec_cant_cita,cantidad,edad
if w_rec_caja.dw_emppac.rowcount()=0 then return -1
if w_rec_caja.dw_emppac.rowcount()>1 then
	openwithparm(w_escoge,w_rec_caja.dw_emppac)
	if message.doubleparm=0 then
		close(w_rec_caja)
		return -1
	end if
	emp=w_rec_caja.dw_emppac.getitemstring(message.doubleparm,'codemp')
	cont=w_rec_caja.dw_emppac.getitemstring(message.doubleparm,'codcontrato')
	tipo_fac=w_rec_caja.dw_emppac.getitemstring(message.doubleparm,'tipo_fac')
	codta=w_rec_caja.dw_emppac.getitemstring(message.doubleparm,'codta')
else
	emp=w_rec_caja.dw_emppac.getitemstring(1,'codemp')
	cont=w_rec_caja.dw_emppac.getitemstring(1,'codcontrato')
	tipo_fac=w_rec_caja.dw_emppac.getitemstring(1,'tipo_fac')
	codta=w_rec_caja.dw_emppac.getitemstring(1,'codta')
end if
edad=w_principal.dw_1.getitemnumber(1,'dias')
sexo=w_principal.dw_1.getitemstring(1,'sexo')
estrato=w_principal.dw_1.getitemstring(1,'estrato')
for col=1 to tab_1.tp_1.dw_serv_cita.rowcount()
	cproc=tab_1.tp_1.dw_serv_cita.getitemstring(col,"cproced")
	if cproc='' or isnull(cproc) then continue
	select descripcion into :desproc from proced where codproced=:cproc;
	nserv_cita=tab_1.tp_1.dw_serv_cita.getitemnumber(col,"nservicio")
	ncita=tab_1.tp_1.dw_serv_cita.getitemnumber(col,"ncita")
	cantidad=tab_1.tp_1.dw_serv_cita.getitemnumber(col,"cantidad")
	uf=tab_2.tp2_1.dw_consultxgcita.getitemstring(tab_2.tp2_1.dw_consultxgcita.getrow(),"cufuncional")
	cc=tab_2.tp2_1.dw_consultxgcita.getitemstring(tab_2.tp2_1.dw_consultxgcita.getrow(),"cccosto")

	
	//37 parametros ( p_codigo,p_desproc, p_cantidad,  p_tipo,  p_tipoing,  p_autoriza,  p_cemp,  p_cont,  p_cons_soat, 
	//  p_clug_soat,  p_tdoc,  p_docu,  p_edad,  p_sexo,  p_codta,p_estrato,  p_uf,  p_cc,  p_desde,  p_facturar,  p_contador, 
	//  p_clug_his,  p_nserv,  p_prof_cir,  p_espe_cir,  p_via,  p_acto,  p_tipo_cir,  p_ncita, p_clug_cita, p_nserv_cita, 
	//  p_sec_cant_cita,  p_nreci,  p_clug_rec,  p_item_rec,  p_ntrat, p_clug_trat, p_item_trat)
	w_rec_caja.lf_cargar_a(cproc,desproc,cantidad,'C','1','',emp,cont,0, &
	  '',tipdoc,docu,edad,sexo,codta,estrato,uf,cc,'C',1,0, &
	  '',0,'','','',0,'',ncita,i_clug,nserv_cita,&
	  0,0,'',0,0,'',0,'','!',0,0,0,'',tipo_fac,0,'','',0,'0','','','','','')
		
next
w_rec_caja.i_tipo_prof=tab_2.tp2_1.dw_consultxgcita.getitemstring(tab_2.tp2_1.dw_consultxgcita.getrow(),'persoatiende')
w_rec_caja.i_profe=i_profes
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
DataWindowChild idw_finconanula

long ncita,activos,sec_cant,j,ojo,fact,l_n_citas,l_n_turno,l_nser
string prof_cita,proc_cita
datetime fecha_cita,hor_cita

ncita=dw_1.getitemnumber(dw_1.getrow(),"ncita"+right(dw_1.getcolumnname(),1))

/// Para veriifcar citas con mas de un producto
SELECT Count(SerciosCita.nservicio) into:l_n_citas
FROM SerciosCita
WHERE (((SerciosCita.NCita)=:ncita) AND ((SerciosCita.clugar)=:i_clug));
if l_n_citas>1 then
	anula.dataobject="dw_xa_anular_cita_productos"	
	ojo=anula.settransobject(sqlca)
	anula.getchild('cod_fina',idw_finconanula)
	idw_finconanula.settransobject(sqlca)	
	idw_finconanula.retrieve('1')
	ojo=anula.retrieve(ncita,i_clug)	
else
	///para verificar el numero de citas y los turnos respectivos
	proc_cita=dw_1.getitemstring(dw_1.getrow(),"proc"+right(dw_1.getcolumnname(),1))
	sec_cant=dw_1.getitemnumber(dw_1.getrow(),"sec_cant"+right(dw_1.getcolumnname(),1))
	l_nser=w_asig_cita.dw_1.getitemnumber(w_asig_cita.dw_1.getrow(),"nserv"+right(w_asig_cita.dw_1.getcolumnname(),1))
	
	SELECT  SerciosCita.cantidad, SerciosCita.NTurnos into:l_n_citas,:l_n_turno 
	FROM SerciosCita 
	WHERE (((SerciosCita.NCita)=:ncita) AND ((SerciosCita.NServicio)=:l_nser) AND ((SerciosCita.clugar)=:i_clug));
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo cupos de las citas ",sqlca.sqlerrtext)
		return -1
	end if
	
	if l_n_citas=1 and l_n_turno>1 then
		anula.dataobject="dw_xa_anular_cita_cupos"	
		ojo=anula.settransobject(sqlca)
		anula.getchild('cod_fina',idw_finconanula)
		idw_finconanula.settransobject(sqlca)	
		idw_finconanula.retrieve('1')
		ojo=anula.retrieve(ncita,l_nser,proc_cita,i_clug)
	else
		anula.dataobject="dw_xa_anular_cita"	
		ojo=anula.settransobject(sqlca)
		anula.getchild('cod_fina',idw_finconanula)
		idw_finconanula.settransobject(sqlca)	
		idw_finconanula.retrieve('1')		
		ojo=anula.retrieve(ncita,sec_cant,proc_cita,i_clug)
	end if
end if
//cuantos=dw_1.getitemnumber(dw_1.getrow(),"sec_cant"+right(dw_1.getcolumnname(),1))
if ojo=0 then
	messagebox('Atención','Error no se puede encontrar esta cita no la puede anular')
	return -1
end if
for j=1 to anula.rowcount()
	if not isnull(anula.getitemnumber(j,'nfact')) then
		messagebox("Atención",'Esta cita ya se encuentra facturada, no la puede anular')
		return -1
	end if
	if not isnull(anula.getitemnumber(j,'contador')) then
		messagebox("Atención",'Esta cita ya se encuentra Atendida, no la puede anular')
		return -1
	end if
	anula.setitem(j,"control",usuario)
	anula.setitem(j,"motivo_anula",p_motivo)
	anula.setitem(j,"cod_anula",p_codigo)
	anula.setitem(j,"fecha_anula",datetime(today(),now()))
	prof_cita=anula.getitemstring(j,"prof")
	fecha_cita=anula.getitemdatetime(j,"fecha")
	hor_cita=anula.getitemdatetime(j,"hora")
	UPDATE AgendaProf SET EstCita = Null ,ncita=null ,clugar=null 
	WHERE AgendaProf.EstCita='1' AND AgendaProf.Prof=:prof_cita AND AgendaProf.Fecha=:fecha_cita AND AgendaProf.Hora=:hor_cita;
	if sqlca.sqlcode<>0 then
		messagebox("Error cancelando esta cita",sqlca.sqlerrtext)
		return -1
	end if
next
if anula.update()=-1 then return -1
////////////////interface con oscuerpo
long cont_os,nsoli_os,item_os
string clug_os
for j=1 to anula.rowcount()
	cont_os=anula.getitemnumber(j,'contador_os')
	if not isnull(cont_os) then
		clug_os=anula.getitemstring(1,'clugar_os')
		nsoli_os=anula.getitemnumber(1,'nsolicitud_os')
		item_os=anula.getitemnumber(1,'item_os')
		update oscuerpo set cant_encita = cant_encita -1 
		where contador=:cont_os and clugar=:clug_os and nsolicitud=:nsoli_os and item=:item_os;
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando OSCuerpo",sqlca.sqlerrtext)
			return -1
		end if
	end if
next	
////////////////fin interface con oscuerpo
////////////////interface con tratmiento odontologico
long ntra_tto,item_tto
string clug_tto
for j=1 to anula.rowcount()
	ntra_tto=anula.getitemnumber(j,'ntratamiento')
	if not isnull(ntra_tto) then
		clug_tto=anula.getitemstring(j,'clugar_tto')
		item_tto=anula.getitemnumber(j,'item_tto')
		UPDATE odontratacpo SET cant_encita = null
		WHERE (((odontratacpo.ntratamiento)=:ntra_tto) AND ((odontratacpo.clugar)=:clug_tto) AND ((odontratacpo.item)=:item_tto));
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando Odontotratamiento",sqlca.sqlerrtext)
			return -1
		end if
	end if
next
////////////////fin interface con tratmiento odontologico

SELECT 
	Count(SerciosTurno.CProced) into :activos 
FROM 
	SerciosTurno 
WHERE 
	SerciosTurno.NCita=:ncita and SerciosTurno.clugar=:i_clug AND SerciosTurno.control='1';
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo citas activas",sqlca.sqlerrtext)
	return -1
end if
if activos=0 then 
	UPDATE CitasAsig SET Estado = :usuario WHERE CitasAsig.NCita=:ncita and CitasAsig.clugar=:i_clug;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando CitasAsig",sqlca.sqlerrtext)
		return -1
	end if
	if sqlca.sqlnrows=0 then //algun errorcito o manita metida por ahi
		messagebox("Error","No se puede cancelar esta cita")
		return -1
	end if
end if
///recuerda citas
if l_cita=1 and  not isnull(w_principal.dw_1.getitemstring(1,"email")) then
	string em
	em=w_principal.dw_1.getitemstring(1,"email")
	f_recuerda_cita(ncita,i_clug,'A',em,rte_1,true,'')
end if
//////////////recuerda citas
cb_2.triggerevent(clicked!)
return 1
end function

event open;RegistryGet( "HKEY_CLASSES_ROOT\.pdf", "", RegString!, ls_tipo)
RegistryGet( "HKEY_CLASSES_ROOT\"+ls_tipo+"\shell\open\command", "", RegString!, is_pdf)

if not isnull(w_principal.dw_1.getitemstring(1,"documento")) AND (isnull(w_principal.dw_1.getitemdatetime(1,"fecha_captura")) OR (DaysAfter(date(w_principal.dw_1.getitemdatetime(1,"fecha_captura")),date(now()))> 365)) then
	messagebox("Atención","Actualicé Datos de paciente")
	opensheet (win_regis_pac,w_principal,4,original!)
	Close (This)
	return
end if

i_guardo=true
tab_1.tp_1.dw_serv_cita.reset()
tab_1.tp_2.dw_serv_turno.reset()
f_limpia()
int cuan
select count(codemp) into :cuan from emppac where tipodoc=:tipdoc and  documento=:docu;
if sqlca.sqlcode=-1 then 
	messagebox("Error leyendo de emppac",sqlca.sqlerrtext)
	return
end if
if cuan=0 then 
	messagebox("Atención",'Este Paciente no tiene empresa responsable, debe asignarle una para continuar')
	dw_escog_profe.reset()
	tab_2.tp2_1.dw_consultxgcita.reset()
	return
else
	if dw_escog_profe.rowcount()=0 then dw_escog_profe.insertrow(1)
end if

SELECT entero into :l_cita
FROM parametros_gen
WHERE (((codigo_para)=36));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 36')
end if
//i_dw_grupc.retrieve()
tab_2.tp2_2.dw_citas_ante.retrieve(tipdoc,docu)
tab_2.tp2_3.dw_citas_no_asig.retrieve(tipdoc,docu)
timer(15)
end event

on w_asig_cita.create
this.dw_fin_proced=create dw_fin_proced
this.dw_ver=create dw_ver
this.st_cita=create st_cita
this.dw_4=create dw_4
this.dw_3=create dw_3
this.pb_1=create pb_1
this.cb_guarda=create cb_guarda
this.cb_2=create cb_2
this.cb_lleva=create cb_lleva
this.cb_guarda_yrec=create cb_guarda_yrec
this.pb_2=create pb_2
this.pb_nocita=create pb_nocita
this.fecha_esperada=create fecha_esperada
this.st_6=create st_6
this.rte_1=create rte_1
this.st_4=create st_4
this.dw_2=create dw_2
this.em_3=create em_3
this.pb_print=create pb_print
this.tab_2=create tab_2
this.tab_1=create tab_1
this.st_consul=create st_consul
this.em_2=create em_2
this.em_1=create em_1
this.dw_1=create dw_1
this.dw_cruce=create dw_cruce
this.dw_agenda=create dw_agenda
this.dw_cita_asig=create dw_cita_asig
this.mc_1=create mc_1
this.dw_escog_profe=create dw_escog_profe
this.cbx_1=create cbx_1
this.dw_cuenta_citas=create dw_cuenta_citas
this.Control[]={this.dw_fin_proced,&
this.dw_ver,&
this.st_cita,&
this.dw_4,&
this.dw_3,&
this.pb_1,&
this.cb_guarda,&
this.cb_2,&
this.cb_lleva,&
this.cb_guarda_yrec,&
this.pb_2,&
this.pb_nocita,&
this.fecha_esperada,&
this.st_6,&
this.rte_1,&
this.st_4,&
this.dw_2,&
this.em_3,&
this.pb_print,&
this.tab_2,&
this.tab_1,&
this.st_consul,&
this.em_2,&
this.em_1,&
this.dw_1,&
this.dw_cruce,&
this.dw_agenda,&
this.dw_cita_asig,&
this.mc_1,&
this.dw_escog_profe,&
this.cbx_1,&
this.dw_cuenta_citas}
end on

on w_asig_cita.destroy
destroy(this.dw_fin_proced)
destroy(this.dw_ver)
destroy(this.st_cita)
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.pb_1)
destroy(this.cb_guarda)
destroy(this.cb_2)
destroy(this.cb_lleva)
destroy(this.cb_guarda_yrec)
destroy(this.pb_2)
destroy(this.pb_nocita)
destroy(this.fecha_esperada)
destroy(this.st_6)
destroy(this.rte_1)
destroy(this.st_4)
destroy(this.dw_2)
destroy(this.em_3)
destroy(this.pb_print)
destroy(this.tab_2)
destroy(this.tab_1)
destroy(this.st_consul)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.dw_1)
destroy(this.dw_cruce)
destroy(this.dw_agenda)
destroy(this.dw_cita_asig)
destroy(this.mc_1)
destroy(this.dw_escog_profe)
destroy(this.cbx_1)
destroy(this.dw_cuenta_citas)
end on

event timer;if tab_2.tp2_1.dw_consultxgcita.rowcount()<1 then return
w_principal.setmicrohelp('Leyendo ....')
i_fila_prof=tab_2.tp2_1.dw_consultxgcita.getrow()
dw_agenda.retrieve(i_consul,i_desde,i_hasta,i_profes,tab_2.tp2_1.dw_consultxgcita.getitemstring(i_fila_prof,"cesp"),dw_escog_profe.getitemstring(1,1))
w_principal.setmicrohelp('Gestión Clínica Integrada')
end event

event resize;tab_2.resize(3237,newheight  - 1100)
tab_2.tp2_1.dw_consultxgcita.height= tab_2.height -250
tab_2.tp2_2.dw_citas_ante.height= tab_2.height - 250
tab_2.tp2_3.dw_citas_no_asig.height= tab_2.height - 250
end event

type dw_fin_proced from datawindow within w_asig_cita
boolean visible = false
integer x = 3003
integer y = 732
integer width = 165
integer height = 184
integer taborder = 130
string title = "none"
string dataobject = "dw_finalidad_cups"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

type dw_ver from datawindow within w_asig_cita
boolean visible = false
integer x = 3287
integer y = 2084
integer width = 2651
integer height = 256
integer taborder = 220
string title = "none"
string dataobject = "dw_cita_ver"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

type st_cita from statictext within w_asig_cita
boolean visible = false
integer x = 1993
integer y = 712
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_asig_cita
boolean visible = false
integer x = 1728
integer y = 792
integer width = 1198
integer height = 112
integer taborder = 70
string title = "none"
string dataobject = "dw_finalidad_cita"
boolean hscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
getchild('codfin',idw_fincon)
idw_fincon.settransobject(sqlca)
idw_fincon.retrieve('1')
insertrow(1)

end event

event itemchanged;lb_fina=true
end event

type dw_3 from datawindow within w_asig_cita
boolean visible = false
integer x = 1728
integer y = 908
integer width = 1184
integer height = 116
integer taborder = 90
string title = "none"
string dataobject = "dw_combo_tcita"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
insertrow(1)

end event

event itemchanged;lb_tipoc=true
end event

type pb_1 from pb_report within w_asig_cita
integer x = 27
integer y = 848
integer taborder = 150
string text = "       &o"
string powertiptext = "Imprimir Reporte de Citas Asignadas [Alt+O]"
string cod_rep = "CIPR"
string nombre_rep = "Citas de Profesionales"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;any par[2]
par[1]=i_desde
par[2]=i_hasta
imprimir(par,'','0')
end event

type cb_guarda from picturebutton within w_asig_cita
integer x = 178
integer y = 848
integer width = 146
integer height = 128
integer taborder = 100
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
	if f_permiso_boton(this,'ASCI')=0 then return
end if
if isvalid(w_trasl_cita) then return
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
dw_escog_profe.setcolumn(1)
dw_escog_profe.triggerevent(itemchanged!)
end event

event constructor;f_inicia_boton(this,'ASCI')
end event

type cb_2 from picturebutton within w_asig_cita
integer x = 329
integer y = 848
integer width = 146
integer height = 128
integer taborder = 160
integer textsize = -8
integer weight = 400
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

type cb_lleva from picturebutton within w_asig_cita
integer x = 485
integer y = 848
integer width = 146
integer height = 128
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &t"
boolean originalsize = true
string picturename = "factura.GIF"
string disabledname = "d_factura.GIF"
alignment htextalign = left!
end type

event clicked;if tag='1' then //tag lo asigna f_inicia_boton en constructor
	if f_permiso_boton(this,'ASCI')=0 then return
end if
if isvalid(w_trasl_cita) then return
choose case guardar(1)
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
dw_escog_profe.setcolumn(1)
dw_escog_profe.triggerevent(itemchanged!)
if isvalid(w_factura) then w_factura.setfocus()
end event

event constructor;f_inicia_boton(this,'ASCI')
end event

type cb_guarda_yrec from picturebutton within w_asig_cita
integer x = 635
integer y = 848
integer width = 146
integer height = 128
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &e"
boolean originalsize = true
string picturename = "pesos.GIF"
string disabledname = "d_pesos.GIF"
alignment htextalign = left!
string powertiptext = "Guardar Cita y llevar a Recibos de Caja [Alt+E]"
end type

event clicked;if tag='1' then
	if f_permiso_boton(this,'ASCI')=0 then return
end if
if isvalid(w_trasl_cita) then return
choose case guardar(2)
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
dw_escog_profe.setcolumn(1)
dw_escog_profe.triggerevent(itemchanged!)
if isvalid(w_rec_caja) then w_rec_caja.setfocus()

end event

event constructor;f_inicia_boton(this,'ASCI')
end event

type pb_2 from picturebutton within w_asig_cita
integer x = 786
integer y = 848
integer width = 146
integer height = 128
integer taborder = 190
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &s"
boolean originalsize = true
string picturename = "prescripcion.gif"
string disabledname = "d_prescripcion.gif"
alignment htextalign = left!
string powertiptext = "Citas para Ordenes de Servicio"
end type

event clicked;if isvalid(w_trasl_cita) then return
if docu="" then 
	messagebox("Atención","Seleccione un paciente")
	return
end if
if isnull(dw_escog_profe.getitemstring(1,1)) then
	messagebox("Atención",'Debe elegir el Grupo de Cita')
	return
end if
tab_1.tp_1.dw_serv_cita.reset()
tab_1.tp_2.dw_serv_turno.reset()
f_limpia()
st_citas_os st_os
st_os.grupo = dw_escog_profe.GetItemString(dw_escog_profe.GetRow(),'codgc')
st_os.dw_os = tab_1.tp_1.dw_serv_cita
st_os.dw_sercios = tab_1.tp_2.dw_serv_turno
openwithparm(w_citas_os,st_os)

if tab_1.tp_1.dw_serv_cita.rowcount()>0 then 
	enabled=false
	
	string ls_sex,ls_filtro,ls_proc
	double li_dias,ld_i
	ls_proc=tab_1.tp_1.dw_serv_cita.getitemstring(1,'cproced')
	li_dias=w_principal.dw_1.getitemnumber(1,'dias')
	if w_principal.dw_1.getitemstring(1,'sexo')="F" then ls_sex='2'
	if w_principal.dw_1.getitemstring(1,'sexo')="M" then ls_sex='1'
	dw_fin_proced.retrieve(ls_proc)
	setnull(ls_filtro)
	for ld_i=1 to dw_fin_proced.rowcount()
		if ld_i=1 then
			ls_filtro="'"+dw_fin_proced.getitemstring(ld_i,'codfin')+"'"
		else
			ls_filtro+=",'"+dw_fin_proced.getitemstring(ld_i,'codfin')+"'"
		end if
	next			
	
	if not isnull( ls_filtro) then 
		idw_fincon.setfilter("codfin in ("+ls_filtro+") and indsexo in('0','"+ls_sex+"') and  "+string(li_dias)+">=edadini  and  "+string(li_dias)+"<=edadfin ")
	else
		idw_fincon.setfilter("indsexo in('0','"+ls_sex+"') and  "+string(li_dias)+">=edadini  and  "+string(li_dias)+"<=edadfin ")
	end if
	idw_fincon.filter()
end if
end event

type pb_nocita from picturebutton within w_asig_cita
integer x = 937
integer y = 848
integer width = 146
integer height = 128
integer taborder = 200
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "nocita.gif"
string disabledname = "d_nocita.gif"
alignment htextalign = left!
string powertiptext = "No Cita"
end type

event clicked;if not f_demo('pac') then return -1
if docu="" then 
	messagebox("Atención","Seleccione un paciente")
	return 0
end if
if tab_1.tp_1.dw_serv_cita.rowcount()<1 then return 0
if tab_1.tp_1.dw_serv_cita.getitemnumber(1,'tempo')=1 then return 0
long ncita,actu,nulo
string snulo,i_cod_cita='CNA'
setnull(snulo)
setnull(nulo)
dw_cita_asig.reset()
dw_cita_asig.insertrow(1)
if isnull(tab_2.tp2_3.dw_citas_no_asig.getitemnumber(1,"ncita")) then
	ncita=f_trae_ndoc(i_cod_cita,i_clug,'Citas')
	if ncita=-1 then
		rollback;
		return -1
	end if
end if
tab_2.tp2_3.dw_citas_no_asig.setitem(1,"ncita",ncita)
tab_2.tp2_3.dw_citas_no_asig.setitem(1,"clugar",i_clug)
tab_2.tp2_3.dw_citas_no_asig.setitem(1,"tipodoc",tipdoc)
tab_2.tp2_3.dw_citas_no_asig.setitem(1,"documento",docu)
tab_2.tp2_3.dw_citas_no_asig.setitem(1,"usuario",usuario)
tab_2.tp2_3.dw_citas_no_asig.setitem(1,"cproced",tab_1.tp_1.dw_serv_cita.getitemstring(1,'cproced'))
tab_2.tp2_3.dw_citas_no_asig.setitem(1,"fecha_crea",datetime(today(),now()))
tab_2.tp2_3.dw_citas_no_asig.setitem(1,"codgc",dw_escog_profe.getitemstring(1,'codgc'))
tab_2.tp2_3.dw_citas_no_asig.setitem(1,"fecha_esperada",datetime(today(),now()))
actu=tab_2.tp2_3.dw_citas_no_asig.update(true,false)
if actu=-1 or isnull(actu) then
	tab_2.tp2_3.dw_citas_no_asig.setitem(1,"ncita",nulo)
	return -1
end if
tab_2.tp2_3.dw_citas_no_asig.retrieve(tipdoc,docu)
pb_nocita.enabled=false
dw_escog_profe.setcolumn(1)
dw_escog_profe.triggerevent(itemchanged!)
end event

type fecha_esperada from editmask within w_asig_cita
boolean visible = false
integer x = 1166
integer y = 788
integer width = 521
integer height = 68
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy hh:mm"
boolean autoskip = true
boolean spin = true
end type

event constructor;fecha_esperada.text=string(datetime(today(),now()))
end event

event modified;lb_espera=true
end event

type st_6 from statictext within w_asig_cita
boolean visible = false
integer x = 1166
integer y = 860
integer width = 416
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "Fecha Esperada"
boolean focusrectangle = false
end type

type rte_1 from richtextedit within w_asig_cita
boolean visible = false
integer x = 4672
integer y = 20
integer width = 329
integer height = 60
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_asig_cita
integer x = 18
integer y = 136
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

type dw_2 from datawindow within w_asig_cita
integer x = 5
integer width = 1312
integer height = 116
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_lugar"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild("codlugar",idw_lugar)
idw_lugar.settransobject(SQLCA)
insertrow(1)
setitem(1,1,clugar)
i_clug=clugar
end event

event itemchanged;i_clug=data
dw_escog_profe.setcolumn(1)
dw_escog_profe.triggerevent (itemchanged!)
end event

type em_3 from editmask within w_asig_cita
integer x = 320
integer y = 136
integer width = 430
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "none"
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mmm/yyyy"
end type

type pb_print from pb_report within w_asig_cita
boolean visible = false
integer x = 1170
integer y = 924
integer width = 96
integer height = 80
integer taborder = 140
boolean flatstyle = true
boolean originalsize = false
string picturename = "print2.gif"
string powertiptext = "Propiedades del Reporte"
string cod_rep = "CIAS"
string nombre_rep = "Cita Asignada"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;if report.dw_rep.describe('datawindow.syntax')='' then 
	if inicia()=-1 then return
end if
openwithparm(w_conf_pag,report)
end event

type tab_2 from tab within w_asig_cita
event create ( )
event destroy ( )
integer x = 18
integer y = 1044
integer width = 3237
integer height = 1376
integer taborder = 210
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
tp2_3 tp2_3
end type

on tab_2.create
this.tp2_1=create tp2_1
this.tp2_2=create tp2_2
this.tp2_3=create tp2_3
this.Control[]={this.tp2_1,&
this.tp2_2,&
this.tp2_3}
end on

on tab_2.destroy
destroy(this.tp2_1)
destroy(this.tp2_2)
destroy(this.tp2_3)
end on

event clicked;tab_2.tp2_3.dw_citas_no_asig.retrieve(tipdoc,docu)
end event

type tp2_1 from userobject within tab_2
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3200
integer height = 1248
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
integer y = 4
integer width = 3136
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Consultorios y Profesionales con cupo para la fecha:"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_consultxgcita from datawindow within tp2_1
integer x = 14
integer y = 72
integer width = 3145
integer height = 1120
integer taborder = 40
string dataobject = "dw_consullibrexgcita"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if rowcount()<1 then return
i_dura=getitemnumber(getrow(),"duracion")
st_consul.text=getitemstring(getrow(),"descripcion")
i_profes=getitemstring(getrow(),"prof")
i_consul=getitemstring(getrow(),"consult")
dw_agenda.retrieve(i_consul,i_desde,i_hasta,i_profes,getitemstring(getrow(),"cesp"),dw_escog_profe.getitemstring(1,1))
end event

event rowfocuschanging;st_consul.text=""
dw_1.reset()
end event

event constructor;settransobject(sqlca)
end event

type tp2_2 from userobject within tab_2
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3200
integer height = 1248
long backcolor = 67108864
string text = "Citas Anteriores"
long tabtextcolor = 33554432
string picturename = "audita.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra las Citas anteriores asignadas al paciente"
st_3 st_3
dw_citas_ante dw_citas_ante
end type

on tp2_2.create
this.st_3=create st_3
this.dw_citas_ante=create dw_citas_ante
this.Control[]={this.st_3,&
this.dw_citas_ante}
end on

on tp2_2.destroy
destroy(this.st_3)
destroy(this.dw_citas_ante)
end on

type st_3 from statictext within tp2_2
integer x = 9
integer y = 12
integer width = 3141
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Citas Anteriores del Paciente:"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_citas_ante from datawindow within tp2_2
integer x = 5
integer y = 72
integer width = 3150
integer height = 1160
integer taborder = 120
string title = "none"
string dataobject = "dw_citas_paciente"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if getrow()<1 then return
choose case dwo.name
	case 'nfact'
		if isnull(getitemnumber(getrow(),'nfact')) then return
		openwithparm(w_busca_fact,'factu')
		w_busca_fact.dw_busca.setitem(1,1,'factcab.nfact = ')
		w_busca_fact.dw_busca.setitem(1,2,string(getitemnumber(getrow(),'nfact')))
		w_busca_fact.dw_busca.accepttext()
		w_busca_fact.pb_busca.triggerevent(clicked!)
	case 'nrcaj'
		if isnull(getitemnumber(getrow(),'nrcaj')) then return
		openwithparm(w_busca_fact,'reci')	 
		w_busca_fact.dw_busca.setitem(1,1,'tesorecajcab.nrcaj = ')
		w_busca_fact.dw_busca.setitem(1,2,string(getitemnumber(getrow(),'nrcaj')))
		w_busca_fact.dw_busca.accepttext()
		w_busca_fact.pb_busca.triggerevent(clicked!)
end choose

end event

event constructor;settransobject(sqlca)
getchild('cod_fina',idw_finconpac)
idw_finconpac.settransobject(sqlca)
idw_finconpac.retrieve('%')
end event

event buttonclicked;any par[2]
par[1]=getitemstring(getrow(),'clugar')
par[2]=getitemnumber(getrow(),'ncita')
pb_print.imprimir(par,'','0')

end event

event rbuttondown;boolean pasox=false
if row<1 then return
if row<>getrow() then setrow(row)
if getitemstring(row,'control')<>'1' then return
if datetime(date(getitemdatetime(row,"fecha")),relativetime(time(getitemdatetime(row,"hora")),300)) < datetime(today(),now()) then 
	pasox=true
	//return
end if
if dw_escog_profe.getitemstring(1,'codgc')<>getitemstring(row,'codgc') or isnull(dw_escog_profe.getitemstring(1,'codgc')) then
	dw_escog_profe.setcolumn('codgc')
	dw_escog_profe.setitem(1,'codgc',getitemstring(row,'codgc'))
	dw_escog_profe.event itemchanged(1,dw_escog_profe.object.codgc,getitemstring(row,'codgc'))
end if
date fecha
mc_1.getselecteddate(fecha)
if date(getitemdatetime(row,'fecha'))<>fecha then mc_1.setselecteddate(date(getitemdatetime(row,'fecha')))
long ojo
ojo=tab_2.tp2_1.dw_consultxgcita.find('prof="'+getitemstring(row,'prof')+'" and consult="'+getitemstring(row,'consult')+'"',1,tab_2.tp2_1.dw_consultxgcita.rowcount())
if ojo=0 then return
tab_2.tp2_1.dw_consultxgcita.scrolltorow(ojo)
dw_1.setcolumn('dia'+string(daynumber(date(getitemdatetime(row,'fecha')))))

ojo=dw_1.find('hora=time("'+string(time(getitemdatetime(row,'hora')))+'")',1,dw_1.rowcount())
dw_1.setrow(ojo)
if pasox=false then
	if isvalid(w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_1) then w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_1.enabled=false
	if isvalid(w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_2) then w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_2.enabled=true
	if isvalid(w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_3) then w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_3.enabled=true
	if isvalid(w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_5) then w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_4.enabled=false
	if isvalid(w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_5) then w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_5.enabled=true	
else
	if isvalid(w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_1) then w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_1.enabled=false
	if isvalid(w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_2) then w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_2.enabled=false
	if isvalid(w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_3) then w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_3.enabled=false
	if isvalid(w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_5) then w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_4.enabled=false	
	if isvalid(w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_5) then w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_5.enabled=true	
end if
w_principal.m_principal.m_3.m_3_2.m_3_2_5.PopMenu (w_principal.PointerX(), w_principal.PointerY())
tab_2.tp2_2.dw_citas_ante.retrieve(tipdoc,docu)
end event

type tp2_3 from userobject within tab_2
integer x = 18
integer y = 112
integer width = 3200
integer height = 1248
long backcolor = 67108864
string text = "Citas No Asignada"
long tabtextcolor = 33554432
string picturename = "nocita.ico"
long picturemaskcolor = 536870912
dw_citas_no_asig dw_citas_no_asig
st_5 st_5
end type

on tp2_3.create
this.dw_citas_no_asig=create dw_citas_no_asig
this.st_5=create st_5
this.Control[]={this.dw_citas_no_asig,&
this.st_5}
end on

on tp2_3.destroy
destroy(this.dw_citas_no_asig)
destroy(this.st_5)
end on

type dw_citas_no_asig from datawindow within tp2_3
integer x = 14
integer y = 68
integer width = 3150
integer height = 1160
integer taborder = 60
string dataobject = "dw_citas_no_asig"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_5 from statictext within tp2_3
integer x = 14
integer y = 4
integer width = 3141
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Citas no Asignadas del Paciente:"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type tab_1 from tab within w_asig_cita
integer x = 1175
integer y = 120
integer width = 4763
integer height = 572
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
boolean showtext = false
tabposition tabposition = tabsonleft!
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
event create ( )
event destroy ( )
integer x = 128
integer y = 16
integer width = 4617
integer height = 540
long backcolor = 67108864
string text = "Asignar"
long tabtextcolor = 33554432
string picturename = "asigna.ico"
long picturemaskcolor = 536870912
string powertiptext = "Asignar los procedimientos"
pb_vacia pb_vacia
pb_4 pb_4
pb_3 pb_3
st_1 st_1
dw_serv_cita dw_serv_cita
end type

on tp_1.create
this.pb_vacia=create pb_vacia
this.pb_4=create pb_4
this.pb_3=create pb_3
this.st_1=create st_1
this.dw_serv_cita=create dw_serv_cita
this.Control[]={this.pb_vacia,&
this.pb_4,&
this.pb_3,&
this.st_1,&
this.dw_serv_cita}
end on

on tp_1.destroy
destroy(this.pb_vacia)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.st_1)
destroy(this.dw_serv_cita)
end on

type pb_vacia from picturebutton within tp_1
integer x = 4434
integer y = 180
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
string powertiptext = "Agregar Turnos sin Procedimiento"
end type

event clicked;long j,k
j=dw_serv_cita.find('cproced="Ning."',1,dw_serv_cita.rowcount())
if j=0 then
	j=dw_serv_cita.insertrow(0)
	dw_serv_cita.setitem(j,'nturnos',1)
	dw_serv_cita.setitem(j,'secuencia','1')
	dw_serv_cita.setitem(j,'cproced','Ning.')
	for k=1 to dw_serv_cita.rowcount()
		if dw_serv_cita.find('nservicio='+string(k),1,dw_serv_cita.rowcount())=0 then 
			dw_serv_cita.setitem(j,'nservicio',k)
			exit
		end if
	next
	tab_1.tp_2.dw_serv_turno.insertrow(1)
	tab_1.tp_2.dw_serv_turno.setitem(1,'nservicio',k)
	tab_1.tp_2.dw_serv_turno.setitem(1,'sec_cant',1)
	tab_1.tp_2.dw_serv_turno.setitem(1,'cproced','Ning.')
else
	dw_serv_cita.scrolltorow(j)
end if
end event

type pb_4 from picturebutton within tp_1
integer x = 4434
integer y = 44
integer width = 146
integer height = 128
integer taborder = 50
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
string powertiptext = "Borrar Procedimiento [Alt+B]"
end type

event clicked;if isvalid(w_trasl_cita) then return
if dw_serv_cita.rowcount()=0 then return
long nserv
nserv=dw_serv_cita.getitemnumber(dw_serv_cita.getrow(),'nservicio')
tab_1.tp_2.dw_serv_turno.setfilter('nservicio='+string(nserv))
tab_1.tp_2.dw_serv_turno.filter()
do while tab_1.tp_2.dw_serv_turno.rowcount()>0
	tab_1.tp_2.dw_serv_turno.deleterow(0)
loop
tab_1.tp_2.dw_serv_turno.setfilter('')
tab_1.tp_2.dw_serv_turno.filter()
dw_serv_cita.deleterow(0)
f_limpia()
if tab_1.tp_1.dw_serv_cita.rowcount()=0 then pb_2.enabled=true
end event

type pb_3 from picturebutton within tp_1
string tag = "Imprime Preparación"
integer x = 4434
integer y = 316
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "contrato.gif"
string disabledname = "d_contrato.gif"
alignment htextalign = left!
end type

event clicked;if len(is_pdf) = 0 then
	messageBox('Atención','No tiene visor de pdf instalado')
	return 0
end if
long p
string is_prepa
is_prepa=dw_serv_cita.getitemstring(dw_serv_cita.getrow(),'cproced')
select preparacion into :is_prepa from proced where codproced=:is_prepa;
if not isnull(is_prepa) then 
	string ls_exec
	p = pos(is_pdf,'%1')
	ls_exec = replace(is_pdf,p,2,is_prepa)
	run(ls_exec)
end if
end event

type st_1 from statictext within tp_1
integer x = 27
integer width = 4338
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12639424
string text = "Procedimientos a Asignar Cita"
boolean focusrectangle = false
end type

type dw_serv_cita from datawindow within tp_1
event type long sec_cant ( )
integer x = 23
integer y = 64
integer width = 4357
integer height = 456
integer taborder = 40
string title = "none"
string dataobject = "dw_servc_cita"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type long sec_cant();long sec_cant
tab_1.tp_2.dw_serv_turno.setredraw(false)
tab_1.tp_2.dw_serv_turno.setfilter('isnull(fecha) and nservicio='+string(getitemnumber(getrow(),"nservicio")))
tab_1.tp_2.dw_serv_turno.filter()
tab_1.tp_2.dw_serv_turno.sort()
sec_cant=tab_1.tp_2.dw_serv_turno.getitemnumber(1,'sec_cant')
tab_1.tp_2.dw_serv_turno.setfilter('')
tab_1.tp_2.dw_serv_turno.filter()
tab_1.tp_2.dw_serv_turno.sort()
tab_1.tp_2.dw_serv_turno.setredraw(true)
return sec_cant
end event

event itemchanged;long actual,j,k
if dwo.name='nturnos' then 
	actual=getitemnumber(getrow(),'nturnos')
else
	actual=getitemnumber(getrow(),'cantidad')
end if
IF getitemnumber(getrow(),'tempo')>0 then
	settext(string(actual))
	return 1
end if


if long(data)<actual then 
	//solo entra si no se han asignado porque el datawindow lo está controlando
	tab_1.tp_2.dw_serv_turno.setfilter('nservicio='+string(getitemnumber(getrow(),'nservicio'))+' and sec_cant>'+data)
	tab_1.tp_2.dw_serv_turno.filter()
	do while tab_1.tp_2.dw_serv_turno.rowcount()>0 
		tab_1.tp_2.dw_serv_turno.deleterow(0)
	loop
	tab_1.tp_2.dw_serv_turno.setfilter('')
	tab_1.tp_2.dw_serv_turno.filter()
else
	for j=1 to long(data) - actual
		for k=1 to getitemnumber(getrow(),'nturnos')
			tab_1.tp_2.dw_serv_turno.insertrow(1)
			tab_1.tp_2.dw_serv_turno.setitem(1,'nservicio',getitemnumber(getrow(),'nservicio'))
			tab_1.tp_2.dw_serv_turno.setitem(1,'sec_cant',actual + j)
			tab_1.tp_2.dw_serv_turno.setitem(1,'cproced',getitemstring(getrow(),'cproced'))
		next
	next
end if
this.accepttext()
end event

event rowfocuschanged;if this.rowcount()<0 or this.getrow()<1 then return
i_cuantos=this.getitemnumber(this.getrow(),"tempo")

end event

event losefocus;accepttext()
end event

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

type tp_2 from userobject within tab_1
integer x = 128
integer y = 16
integer width = 4617
integer height = 540
long backcolor = 67108864
string text = "Fechas"
long tabtextcolor = 33554432
string picturename = "asig_cita.ico"
long picturemaskcolor = 536870912
string powertiptext = "Resumen de los Fechas Asignadas hasta el momento"
dw_serv_turno dw_serv_turno
end type

on tp_2.create
this.dw_serv_turno=create dw_serv_turno
this.Control[]={this.dw_serv_turno}
end on

on tp_2.destroy
destroy(this.dw_serv_turno)
end on

type dw_serv_turno from datawindow within tp_2
integer x = 5
integer width = 4567
integer height = 532
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "dw_serv_turno"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

type st_consul from statictext within w_asig_cita
integer x = 3287
integer y = 708
integer width = 2569
integer height = 80
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

type em_2 from editmask within w_asig_cita
string tag = "hora fin"
boolean visible = false
integer x = 1230
integer y = 136
integer width = 165
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
string text = "20:00"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event modified;tab_2.tp2_1.dw_consultxgcita.triggerevent(rowfocuschanged!)
end event

type em_1 from editmask within w_asig_cita
string tag = "hora inicio"
boolean visible = false
integer x = 910
integer y = 120
integer width = 160
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
string text = "6:00"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event modified;tab_2.tp2_1.dw_consultxgcita.triggerevent(rowfocuschanged!)
end event

type dw_1 from datawindow within w_asig_cita
event mousemove pbm_dwnmousemove
event keypres pbm_dwnkey
event llena_asig ( long p_fila,  integer p_columna )
event borra_asig ( boolean p_todos )
integer x = 3296
integer y = 784
integer width = 2633
integer height = 1292
integer taborder = 80
string title = "none"
string dataobject = "dw_horario"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event mousemove;if row<1 then return
string cual
long columna
if string(dwo.type)="column" and string(dwo.name)<>"hora" then
	cual = right(string(dwo.name),1)
	if this.getitemstring(row,"dia"+cual)<>"Libre" then
		columna=long(cual)
		if i_col_ant<>columna or i_fila_ant<>row then
			st_cita.text=string(this.getitemnumber(row,"ncita"+cual))		
			dw_ver.visible=true
		//	dw_ver.x=pointerx()
		//	dw_ver.y=pointery()
			dw_ver.retrieve(long(st_cita.text),i_clug)
		end if
	else
		dw_ver.visible=false
		st_cita.text=""
		i_col_ant=0
		i_fila_ant=0
	end if
end if


	
end event

event keypres;if key=keyspacebar! then
	this.triggerevent(clicked!)
end if
end event

event llena_asig(long p_fila, integer p_columna);tab_1.tp_2.dw_serv_turno.setredraw(false)
tab_1.tp_2.dw_serv_turno.setfilter('isnull(fecha) and cproced="'+getitemstring(p_fila,'proc'+string(p_columna))+'" and sec_cant='+string(getitemnumber(p_fila,'sec_cant'+string(p_columna))))
tab_1.tp_2.dw_serv_turno.filter()
tab_1.tp_2.dw_serv_turno.setitem(1,'fecha',datetime(relativedate(date(i_desde),p_columna -1),time('00:00:00')))
tab_1.tp_2.dw_serv_turno.setitem(1,'hora',datetime(date('1900-01-01'),getitemtime(p_fila,'hora')))
tab_1.tp_2.dw_serv_turno.setitem(1,'prof',i_profes)
tab_1.tp_2.dw_serv_turno.setitem(1,'consult',i_consul)
tab_1.tp_2.dw_serv_turno.setitem(1,'duracion',i_dura)
tab_1.tp_2.dw_serv_turno.setfilter('')
tab_1.tp_2.dw_serv_turno.filter()
tab_1.tp_2.dw_serv_turno.setredraw(true)
end event

event borra_asig(boolean p_todos);string cual,proc
long fila,sec_cant
date fecha
time hora
fila=getrow()
cual = right(getcolumnname(),1)
if p_todos then
	proc=getitemstring(fila,"proc"+cual)
	sec_cant=getitemnumber(fila,"sec_cant"+cual)
	tab_1.tp_2.dw_serv_turno.setfilter( 'cproced="'+proc+'"')
else
	fecha=relativedate(date(i_desde), long(cual) -1)
	hora=getitemtime(fila,'hora')
	tab_1.tp_2.dw_serv_turno.setfilter('date(fecha)=date("'+string(fecha,'yyyy-mm-dd')+'") and time(hora)=time("'+string(hora,'HH:mm')+'")')
end if
tab_1.tp_2.dw_serv_turno.setredraw(false)
tab_1.tp_2.dw_serv_turno.filter()
long j
datetime nulo
string snulo
setnull(snulo)
setnull(nulo)

for j=1 to tab_1.tp_2.dw_serv_turno.rowcount()
	tab_1.tp_2.dw_serv_turno.setitem(j,'fecha',nulo)
	tab_1.tp_2.dw_serv_turno.setitem(j,'hora',nulo)
	tab_1.tp_2.dw_serv_turno.setitem(j,'prof',snulo)
	tab_1.tp_2.dw_serv_turno.setitem(j,'consult',snulo)
	tab_1.tp_2.dw_serv_turno.setitem(j,'duracion',0)
next
tab_1.tp_2.dw_serv_turno.setfilter('')
tab_1.tp_2.dw_serv_turno.filter()
tab_1.tp_2.dw_serv_turno.setredraw(true)
end event

event clicked;long fila,sec_cant
date fec,ld_fecha_cita
datetime ldt_fecha1,ldt_fecha2
mc_1.getselecteddate(fec)
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
if fila<1 or rowcount()=0 or tab_1.tp_1.dw_serv_cita.rowcount()=0 then return
string t
t=getcolumnname()

if left(t,3)<>'dia' then return
if getitemstring(fila,t)="" or isnull(getitemstring(fila,t)) or getitemstring(fila,t)="Libre" or isnull(getitemnumber(fila,"ncita"+Right ( t, 1 ))) then 
	if isvalid(w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_2) then w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_2.enabled=false
	if isvalid(w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_3) then w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_3.enabled=false
else
	if isvalid(w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_2) then w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_2.enabled=true
	if isvalid(w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_3) then w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_3.enabled=true
end if
//////
if tab_1.tp_1.dw_serv_cita.rowcount()<1 and not isvalid(w_trasl_cita) then return
string cual,eval
datetime fecha, hora
long columna,i,j,donde,k,busca,busca2,cit_x_dia,cit_x_mes
cual = right(t,1)
columna=long(cual)
if getitemstring(fila,"dia"+cual)="" or isnull(getitemstring(fila,"dia"+cual))  then return

ld_fecha_cita=relativedate(fec,columna - daynumber(fec))
if datetime(ld_fecha_cita,relativetime(getitemtime(fila,"hora"),300)) < datetime(today(),now()) and getitemstring(fila,"dia"+cual)='Libre' then 
	messagebox("Atención","La fecha y/o hora de esta cita es menor a la del sistema, ya no la puede asignar")
	return
end if

cit_x_dia=i_dw_grupc.getitemnumber(i_dw_grupc.getrow(),'citas_x_dia')
if cit_x_dia>0 then
	ldt_fecha1=datetime(ld_fecha_cita,time(0,0,0))
	ldt_fecha2=datetime(ld_fecha_cita,time(23,59,59))
	if dw_cuenta_citas.retrieve(dw_escog_profe.getitemstring(1,'codgc'),ldt_fecha1,ldt_fecha2,tipdoc,docu)=-1 then return
	if dw_cuenta_citas.rowcount()>=cit_x_dia then
		messagebox('Atención','El paciente ya tiene '+string(cit_x_dia)+' citas de este grupo en el día')
		return
	end if
end if
int año,mes
cit_x_mes=i_dw_grupc.getitemnumber(i_dw_grupc.getrow(),'citas_x_mes')
if cit_x_mes>0 then
	mes=month(ld_fecha_cita)
	año=year(ld_fecha_cita)	
	ldt_fecha1=datetime(DATE(año,mes,1),time(0,0,0))
	IF mes + 1 = 13 THEN 
		mes=1
		año=año+1
	else
		mes=mes+1
	end If
	ldt_fecha2=datetime(relativedate(DATE(año,mes,1),-1),time(23,59,59))
	if dw_cuenta_citas.retrieve(dw_escog_profe.getitemstring(1,'codgc'),ldt_fecha1,ldt_fecha2,tipdoc,docu)=-1 then return
	if dw_cuenta_citas.rowcount()>=cit_x_mes then
		messagebox('Atención','El paciente ya tiene '+string(cit_x_mes)+' citas de este grupo en el mes')
		return
	end if
end if

if	(getitemstring(fila,"dia"+cual)="Libre") or (getitemstring(fila,"proc"+cual)="" &
or isnull(getitemstring(fila,"proc"+cual)) or (getitemstring(fila,"proc"+cual)= &
tab_1.tp_1.dw_serv_cita.getitemstring(tab_1.tp_1.dw_serv_cita.getrow(),"cproced")) and &
getitemstring(fila,"dia"+cual)=tab_1.tp_1.dw_serv_cita.getitemstring(tab_1.tp_1.dw_serv_cita.getrow(),"cproced"))then
int l_i

for l_i=1 to tab_1.tp_1.dw_serv_cita.rowcount()
	i_cuantos=0
	tab_1.tp_1.dw_serv_cita.ScrollToRow(l_i)
	if  tab_1.tp_1.dw_serv_cita.getitemnumber(l_i,'esc')=1 then
		if getitemstring( l_i,"sel"+cual)="1" then 
			//quitar un proc	
			if not isvalid(w_trasl_cita) then
				fecha_esperada.enabled=false
				dw_3.visible=false
				dw_4.visible=false
				fecha_esperada.visible=false
				st_6.visible=false
				st_6.enabled=false
			end if
			busca=tab_1.tp_1.dw_serv_cita.find("cproced='"+getitemstring( l_i,"proc"+cual)+"'",1,tab_1.tp_1.dw_serv_cita.rowcount())
			if tab_1.tp_1.dw_serv_cita.getitemstring(busca,"secuencia") ='1' then
				event borra_asig(true)
				//busca2 es para buscar el primero de esa tanda
				busca2=find("dia"+cual+"='"+getitemstring( l_i,"proc"+cual)+"' and sec_cant"+cual+"="+string(getitemnumber( l_i,"sec_cant"+cual)),1,rowcount())
				for k=1 to tab_1.tp_1.dw_serv_cita.getitemnumber(busca,"nturnos")
					setitem(busca2 +k -1,"dia"+cual,"Libre")
					setitem(busca2 +k -1,"sel"+cual,"0")
					setitem(busca2 +k -1,"proc"+cual,"")
					setitem(busca2 +k -1,"sec_cant"+cual,0)
					i_cuantos=i_cuantos -1
				next
			else
				event borra_asig(false)
				setitem(fila,"dia"+cual,"Libre")
				setitem(fila,"sel"+cual,"0")
				setitem(fila,"proc"+cual,"")
				setitem(fila,"sec_cant"+cual,0)
				i_cuantos=i_cuantos -1
			end if
		else
			if not isvalid(w_trasl_cita) then
				fecha_esperada.enabled=true
				fecha_esperada.visible=true
				dw_3.visible=true
				dw_4.visible=true			
				st_6.visible=true
				st_6.enabled=true
			end If
			//asignar un proc
			//if i_cuantos < tab_1.tp_1.dw_serv_cita.getitemnumber(tab_1.tp_1.dw_serv_cita.getrow(),"nturnos")*tab_1.tp_1.dw_serv_cita.getitemnumber(tab_1.tp_1.dw_serv_cita.getrow(),"cantidad") then
			if i_cuantos < tab_1.tp_1.dw_serv_cita.getitemnumber(l_i,"nturnos")*tab_1.tp_1.dw_serv_cita.getitemnumber(l_i,"cantidad") then
				fecha=datetime(relativedate(fec,columna - daynumber(fec)),time("00:00:00"))
				hora=datetime(date("1/1/1900"),getitemtime( fila,"hora"))
				string ls_prod
				ls_prod=tab_1.tp_1.dw_serv_cita.getitemstring(l_i,"cproced")
				string pa_buscar
				pa_buscar= "(time(hora)<=time('"+string(hora,'HH:mm')+"') and relativetime(time(hora),(duracion -1)*60)>=time('"+string(hora,'HH:mm')+"')) or "
				pa_buscar+="(time(hora)>=time('"+string(hora,'HH:mm')+"') and relativetime(time('"+string(hora,'HH:mm')+"'),("+string(i_dura -1)+")*60 )>=time(hora))"
				donde=tab_1.tp_2.dw_serv_turno.find(pa_buscar+' and date(fecha)=date("'+string(fecha,'yyyy-mm-dd')+"') and (cproced='"+ ls_prod+' ")',1,tab_1.tp_2.dw_serv_turno.rowcount())
				if donde<>0 then
					messagebox("Atención","Ya está asignado para esta fecha y hora otra cita")
					return
				end if
				dw_cruce.retrieve(tipdoc,docu,i_consul,fecha)
				if dw_cruce.rowcount()<> 0 then
					donde=dw_cruce.find(pa_buscar,1,dw_cruce.rowcount())
					if donde<>0 then
						messagebox("Atención","Este paciente ya tiene asignada cita en el consultorio: "+dw_cruce.getitemstring(donde,"consult")+", con el Dr(a): "+dw_cruce.getitemstring(donde,"profe")+", para realizarse un(a): "+dw_cruce.getitemstring(donde,"proced"))
						return
					end if
				end if
				if i_dw_grupc.getitemstring(i_dw_grupc.getrow(),'bloquea_grupo')='1' then
					long ojo
					string tt
					tt='date(fecha)=date("'+string(fecha,'yyyy/mm/dd')+'") and codgc<>"'+dw_escog_profe.getitemstring(1,'codgc')+'" and (control="1" or control="2" or control="3")'
					ojo=tab_2.tp2_2.dw_citas_ante.find(tt,1,tab_2.tp2_2.dw_citas_ante.rowcount())
					if ojo>0 then
						messagebox("Atención","Este paciente ya tiene asignada cita para este día en otro Grupo")
						return
					end if
				end if
				choose case tab_1.tp_1.dw_serv_cita.getitemstring(l_i,"secuencia")
					case '1' //seguidos
						if  l_i + tab_1.tp_1.dw_serv_cita.getitemnumber(l_i,"nturnos") -1 > rowcount() then
							messagebox("Atención","No hay cupo libre para todos los turnos")
							return
						end if
						//for k=1 to tab_1.tp_1.dw_serv_cita.getitemnumber(tab_1.tp_1.dw_serv_cita.getrow(),"nturnos")
						for k=1 to tab_1.tp_1.dw_serv_cita.getitemnumber(l_i,"nturnos")
							if (getitemstring(fila + k -1 ,"dia"+cual)<>"Libre" and l_i=1 ) or isnull(getitemstring(fila + k -1 ,"dia"+cual)) then
								messagebox("Atención","No hay cupo libre para todos los turnos")
								return
							end if
						next
						sec_cant=tab_1.tp_1.dw_serv_cita.event sec_cant()
						//for k=1 to tab_1.tp_1.dw_serv_cita.getitemnumber(tab_1.tp_1.dw_serv_cita.getrow(),"nturnos")
						for k=1 to tab_1.tp_1.dw_serv_cita.getitemnumber(l_i,"nturnos")
							setitem( fila+ k -1,"sel"+cual,"1")
							//setitem( l_i + k -1,"dia"+cual,tab_1.tp_1.dw_serv_cita.getitemstring(tab_1.tp_1.dw_serv_cita.getrow(),"cproced"))
							setitem( fila+ k -1,"dia"+cual,tab_1.tp_1.dw_serv_cita.getitemstring(l_i,"cproced"))
							//setitem( l_i + k -1,"proc"+cual,tab_1.tp_1.dw_serv_cita.getitemstring(tab_1.tp_1.dw_serv_cita.getrow(),"cproced"))
							setitem( fila + k -1,"proc"+cual,tab_1.tp_1.dw_serv_cita.getitemstring(l_i,"cproced"))
							//if tab_1.tp_1.dw_serv_cita.getitemnumber(tab_1.tp_1.dw_serv_cita.getrow(),"nturnos")=1 then
							if tab_1.tp_1.dw_serv_cita.getitemnumber(l_i,"nturnos")=1 then
								setitem( fila+ k -1,"sec_cant"+cual,sec_cant)
							else
								setitem( fila+ k -1,"sec_cant"+cual,k)
							end if
							i_cuantos++
							event llena_asig( fila +k -1,columna)
						next
					case '2' //separados
						sec_cant=tab_1.tp_1.dw_serv_cita.event sec_cant()
						setitem( fila ,"sel"+cual,"1")
						setitem( fila ,"dia"+cual,tab_1.tp_1.dw_serv_cita.getitemstring(tab_1.tp_1.dw_serv_cita.getrow(),"cproced"))
						setitem( fila,"proc"+cual,tab_1.tp_1.dw_serv_cita.getitemstring(tab_1.tp_1.dw_serv_cita.getrow(),"cproced"))
						setitem( fila ,"sec_cant"+cual,sec_cant)
						event llena_asig( fila,columna)
						i_cuantos++
				end choose
			end if
		end if
		tab_1.tp_1.dw_serv_cita.setitem(l_i,"tempo",i_cuantos)
	end if
next
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
boolean pasox=false
t=this.getcolumnname()
cual = right(t,1)
columna=long(cual)
if this.getitemstring(fila,t)="" or isnull(this.getitemstring(fila,t)) or this.getitemstring(fila,t)="Libre" or isnull(this.getitemnumber(fila,"ncita"+Right ( t, 1 ))) then return
if datetime(relativedate(fec,columna - daynumber(fec)),relativetime(this.getitemtime(fila,"hora"),300)) < datetime(today(),now()) then 
	w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_2.enabled=false
	w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_3.enabled=false
	if getitemstring(fila,'conf'+cual)<>'5' then
		w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_5.enabled=true
	else
		w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_5.enabled=false
	end if
	pasox=true
//	return
end if
If w_principal.m_principal <> im_main then
	if pasox=false then
		w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_1.enabled=false
		w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_2.enabled=true
	
		if getitemstring(fila,t)=docu and getitemstring(fila,'tdoc'+cual)=tipdoc then
			w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_3.enabled=true
			if getitemstring(fila,'conf'+cual)<>'5' then
				w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_5.enabled=true
			else
				w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_5.enabled=false
			end if	
		else
			w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_3.enabled=false
			w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_5.enabled=false			
		end if
	else
		w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_1.enabled=false
		w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_2.enabled=false
		w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_4.enabled=false
		if getitemstring(fila,t)=docu and getitemstring(fila,'tdoc'+cual)=tipdoc then
			w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_3.enabled=false
			if getitemstring(fila,'conf'+cual)<>'5' then
				w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_5.enabled=true	
			else
				w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_5.enabled=false
			end if
		else
			w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_3.enabled=false
				if getitemstring(fila,'conf'+cual)<>'5' then
					w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_5.enabled=true
				else
					w_principal.m_principal.m_3.m_3_2.m_3_2_5.m_3_2_5_5.enabled=false
				end if
		end if		
	end if
	w_principal.m_principal.m_3.m_3_2.m_3_2_5.PopMenu (w_principal.PointerX(), w_principal.PointerY())
	tab_2.tp2_2.dw_citas_ante.retrieve(tipdoc,docu)
End If
end event

event constructor;settransobject(sqlca)
end event

type dw_cruce from datawindow within w_asig_cita
boolean visible = false
integer x = 791
integer y = 116
integer width = 73
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

type dw_agenda from datawindow within w_asig_cita
boolean visible = false
integer x = 1051
integer y = 104
integer width = 96
integer height = 108
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_agenda"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean border = false
boolean livescroll = true
end type

event retrieveend;dw_1.setredraw(false)
dw_1.reset()
if this.rowcount()>0 then
	boolean pintar=false
	time horaini,horafin,va
	horaini=relativetime(time("00:00"),this.getitemnumber(1,"mini"))
	horafin=relativetime(time("00:00"),this.getitemnumber(1,"maxi"))
	if horaini <> time(em_1.text) then 
		em_1.text=string(horaini)
		pintar=true
	end if
	if horafin <> time(em_2.text) then 
		em_2.text=string(horafin)
		pintar=true
	end if
	if pintar or dw_1.rowcount()=0 then pinta()
	long i,donde,dia
	string buscar
	for i = 1 to this.rowcount()
		horaini=time(this.getitemdatetime(i,"hora"))
		buscar="hora=time('"+string(horaini)+"')"
		donde=dw_1.find(buscar,1,dw_1.rowcount())
		if donde=0 then
			em_1.text=string(relativetime(time("00:00"),this.getitemnumber(1,"mini")))
			dw_1.reset()
			tab_2.tp2_1.dw_consultxgcita.triggerevent(rowfocuschanged!)
			return
		end if
		dia=daynumber(date(this.getitemdatetime(i,"fecha")))
		if isnull(this.getitemstring(i,"estcita")) or this.getitemstring(i,"estcita")="" then
			string ojo
			ojo=dw_1.getitemstring(donde,"sel"+string(dia))
			if ojo="0" or isnull(ojo) or ojo="" then
				dw_1.setitem(donde,"dia"+string(dia),"Libre")
			end if
		else
			string doc,tdoc,est
			double factu,rec
			factu=this.getitemnumber(i,"nfact")
			rec=this.getitemnumber(i,"nrcaj")
			doc=this.getitemstring(i,"documento")
			tdoc=this.getitemstring(i,"tipodoc")
			est=this.getitemstring(i,"estcita")
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
				dw_1.setitem(donde,"proc"+string(dia),this.getitemstring(i,"cproced"))
				dw_1.setitem(donde,"sec_cant"+string(dia),this.getitemnumber(i,"sec_cant"))
				dw_1.setitem(donde,"nserv"+string(dia),this.getitemnumber(i,"nservicio"))
				dw_1.setitem(donde,"est"+string(dia),est)				
				dw_1.setitem(donde,"conf"+string(dia),this.getitemstring(i,"control"))
				if isnull(factu) and isnull(rec) then
					dw_1.setitem(donde,"fac"+string(dia),'1')
				else
					dw_1.setitem(donde,"fac"+string(dia),'0')
				end  if
			end if
			if dw_1.getitemstring(donde,"sel"+string(dia))="1" then 
				dw_1.setitem(donde,"sel"+string(dia),"0")
				i_cuantos=i_cuantos -1
			end if
		end if
	next
else
	pinta()
end if
dw_1.setredraw(true)
end event

event constructor;settransobject(SQLCA)
end event

type dw_cita_asig from datawindow within w_asig_cita
boolean visible = false
integer x = 1659
integer y = 688
integer width = 55
integer height = 64
boolean bringtotop = true
string title = "none"
string dataobject = "dw_citas_asig"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

type mc_1 from monthcalendar within w_asig_cita
integer x = 18
integer y = 224
integer width = 1125
integer height = 600
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
long backcolor = 67108864
long monthbackcolor = 67108864
long titlebackcolor = 134217741
weekday firstdayofweek = sunday!
integer maxselectcount = 31
integer scrollrate = 1
boolean todaycircle = true
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
end event

type dw_escog_profe from datawindow within w_asig_cita
integer x = 1353
integer width = 4210
integer height = 120
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_escog_prof_consul"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string ls_filtro

choose case getcolumn()
	case 1
		if isvalid(w_trasl_cita) then
			settext(getitemstring(1,1))
			return 1
		end if
		accepttext()
		tab_2.tp2_1.dw_consultxgcita.setredraw(false)
		tab_2.tp2_1.dw_consultxgcita.reset()
		tab_2.tp2_1.dw_consultxgcita.retrieve(getitemstring(1,1),i_desde,i_hasta,i_clug)
		tab_2.tp2_1.dw_consultxgcita.sort()
		tab_2.tp2_1.dw_consultxgcita.groupcalc()
		tab_2.tp2_1.dw_consultxgcita.setredraw(true)
		if tab_2.tp2_1.dw_consultxgcita.rowcount()=0 then dw_1.reset()

		if not isnull(i_dw_grupc.getitemstring(i_dw_grupc.getrow(),"codaadx")) then
			Modify("codproced.dddw.name='dw_procgcli2'")
			tab_1.tp_1.dw_serv_cita.modify("cproced.dddw.name='dw_procgcli2'")
			ls_filtro=i_dw_grupc.getitemstring(i_dw_grupc.getrow(),"codaadx")
		else
			Modify("codproced.dddw.name='dw_proc_gcita'")
			tab_1.tp_1.dw_serv_cita.modify("cproced.dddw.name='dw_proc_gcita'")
			if isnull(getitemstring(1,1)) then
				ls_filtro=''
			else
				ls_filtro="'"+getitemstring(1,1)+"'"
			end if
		end if
		dw_escog_profe.getchild("codproced",i_dw_proc_gcita)
		i_dw_proc_gcita.settransobject(SQLCA)
		i_dw_proc_gcita.retrieve()
		if not isnull(i_dw_grupc.getitemstring(i_dw_grupc.getrow(),"codaadx")) then
			i_dw_proc_gcita.setfilter("codaadx ='"+ls_filtro+"'")
		else
			i_dw_proc_gcita.setfilter("codgc="+ls_filtro)
		end if
		i_dw_proc_gcita.filter()
		setitem(1,2,"")
		tab_1.tp_1.dw_serv_cita.reset()
		dw_cita_asig.reset()
		dw_cita_asig.insertrow(1)
		//--------------------para cupos sin asignar
		tab_2.tp2_3.dw_citas_no_asig.reset()
		tab_2.tp2_3.dw_citas_no_asig.insertrow(1)
		
		tab_1.tp_2.dw_serv_turno.reset()
		if i_dw_grupc.getitemstring(i_dw_grupc.getrow(),'vacia')='1' then
			tab_1.tp_1.pb_vacia.enabled=true
		else
			tab_1.tp_1.pb_vacia.enabled=false
		end if
		
	case 2
		accepttext()
		long ldb_citas
		string ls_eval
		if isvalid(w_trasl_cita) then return
		ldb_citas=i_dw_grupc.getitemnumber(i_dw_grupc.getrow(),'citas_x_mes')
		
		if ldb_citas>0 then//para no dejar dar más de tantas ldb_citas por grupo por mes
			date ld_fecha
			datetime ldt_fecha1,ldt_fecha2
			
			mc_1.getselecteddate(ld_fecha)
			
			ldt_fecha1=datetime(date(year(ld_fecha),month(ld_fecha),1),time(0,0,0))
			ldt_fecha2=datetime(date(year(ld_fecha),month(ld_fecha),28),time(23,59,29))
			if isdate(string(year(ld_fecha))+'-'+string(month(ld_fecha))+'-29') then ldt_fecha2=datetime(date(year(ld_fecha),month(ld_fecha),29),time(23,59,29))
			if isdate(string(year(ld_fecha))+'-'+string(month(ld_fecha))+'-30') then ldt_fecha2=datetime(date(year(ld_fecha),month(ld_fecha),30),time(23,59,29))
			if isdate(string(year(ld_fecha))+'-'+string(month(ld_fecha))+'-31') then ldt_fecha2=datetime(date(year(ld_fecha),month(ld_fecha),31),time(23,59,29))
			
			if dw_cuenta_citas.retrieve(getitemstring(1,'codgc'),ldt_fecha1,ldt_fecha2,tipdoc,docu)=-1 then return
			if dw_cuenta_citas.rowcount()>=ldb_citas then
				messagebox('Atención','El paciente ya tiene '+string(ldb_citas)+' ldb_citas de este grupo en el mes')
				return
			end if
		end if
		long ldb_donde

		ldb_donde=tab_1.tp_1.dw_serv_cita.find("cproced='"+data+"'",1,tab_1.tp_1.dw_serv_cita.rowcount())
		if ldb_donde=0 then
			long i,k
			ldb_donde=tab_1.tp_1.dw_serv_cita.insertrow(0)
			for i=1 to ldb_donde 
				if tab_1.tp_1.dw_serv_cita.find("nservicio="+string(i),1,ldb_donde)= 0 then 
					tab_1.tp_1.dw_serv_cita.setitem(ldb_donde,"nservicio",i)
					exit
				end if
			next
			tab_1.tp_1.dw_serv_cita.setitem(ldb_donde,"cproced",data)
			tab_1.tp_1.dw_serv_cita.setitem(ldb_donde,"cod_cups",i_dw_proc_gcita.getitemstring(i_dw_proc_gcita.getrow(),"cod_cups"))
			tab_1.tp_1.dw_serv_cita.setitem(ldb_donde,"nturnos",i_dw_proc_gcita.getitemnumber(i_dw_proc_gcita.getrow(),"nturnos"))
			tab_1.tp_1.dw_serv_cita.setitem(ldb_donde,"secuencia",i_dw_proc_gcita.getitemstring(i_dw_proc_gcita.getrow(),"secuencia"))
			if not isnull(i_dw_grupc.getitemstring(i_dw_grupc.getrow(),"codaadx")) then tab_1.tp_1.dw_serv_cita.setitem(ldb_donde,"grup_clinic",i_dw_grupc.getitemstring(i_dw_grupc.getrow(),"codaadx"))
			for k=1 to tab_1.tp_1.dw_serv_cita.getitemnumber(ldb_donde,"nturnos")
				tab_1.tp_2.dw_serv_turno.insertrow(1)
				tab_1.tp_2.dw_serv_turno.setitem(1,'nservicio',i)
				if tab_1.tp_1.dw_serv_cita.getitemnumber(tab_1.tp_1.dw_serv_cita.getrow(),"nturnos")=1 then
					tab_1.tp_2.dw_serv_turno.setitem(1,'sec_cant',1)
				else
					tab_1.tp_2.dw_serv_turno.setitem(1,'sec_cant',k)
				end if
				tab_1.tp_2.dw_serv_turno.setitem(1,'cproced',data)
			next
			
			dw_fin_proced.retrieve(data)
			setnull(ls_filtro)
			for i=1 to dw_fin_proced.rowcount()
				if i=1 then
					ls_filtro="'"+dw_fin_proced.getitemstring(i,'codfin')+"'"
				else
					ls_filtro+=",'"+dw_fin_proced.getitemstring(i,'codfin')+"'"
				end if
			next			
			
		end if
		pb_nocita.enabled=true
end choose
pb_2.enabled=true

string ls_sex
double li_dias
li_dias=w_principal.dw_1.getitemnumber(1,'dias')
if w_principal.dw_1.getitemstring(1,'sexo')="F" then ls_sex='2'
if w_principal.dw_1.getitemstring(1,'sexo')="M" then ls_sex='1'
if not isnull( ls_filtro) then 
	idw_fincon.setfilter("codfin in ("+ls_filtro+") and indsexo in('0','"+ls_sex+"') and  "+string(li_dias)+">=edadini  and  "+string(li_dias)+"<=edadfin ")
else
	idw_fincon.setfilter("indsexo in('0','"+ls_sex+"') and  "+string(li_dias)+">=edadini  and  "+string(li_dias)+"<=edadfin ")
end if
idw_fincon.filter()

end event

event constructor;settransobject(sqlca)
getchild("codgc",i_dw_grupc)
i_dw_grupc.settransobject(SQLCA)
insertrow(1)
end event

type cbx_1 from checkbox within w_asig_cita
integer x = 1321
integer y = 924
integer width = 375
integer height = 80
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Imprimir Cita"
end type

event clicked;pb_print.visible=checked
end event

type dw_cuenta_citas from datawindow within w_asig_cita
boolean visible = false
integer x = 1559
integer y = 688
integer width = 87
integer height = 56
integer taborder = 120
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cuenta_citas"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;settransobject(sqlca)
end event

