$PBExportHeader$w_admision.srw
forward
global type w_admision from window
end type
type rte_1 from richtextedit within w_admision
end type
type pb_cierre from picturebutton within w_admision
end type
type dw_his_acu from datawindow within w_admision
end type
type pb_print from picturebutton within w_admision
end type
type dw_tingres from datawindow within w_admision
end type
type pb_catas from picturebutton within w_admision
end type
type pb_activos from picturebutton within w_admision
end type
type st_3 from statictext within w_admision
end type
type st_2 from statictext within w_admision
end type
type pb_save from picturebutton within w_admision
end type
type tab_1 from tab within w_admision
end type
type tabpage_1 from userobject within tab_1
end type
type mle_1 from multilineedit within tabpage_1
end type
type pb_5 from picturebutton within tabpage_1
end type
type pb_4 from pb_report within tabpage_1
end type
type cbx_2 from checkbox within tabpage_1
end type
type pb_triage from picturebutton within tabpage_1
end type
type pb_change_est from picturebutton within tabpage_1
end type
type pb_change_ting from picturebutton within tabpage_1
end type
type pb_print_ent from pb_report within tabpage_1
end type
type pb_3 from pb_report within tabpage_1
end type
type dw_facts from datawindow within tabpage_1
end type
type cbx_1 from checkbox within tabpage_1
end type
type cbx_res from checkbox within tabpage_1
end type
type dw_admi from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
mle_1 mle_1
pb_5 pb_5
pb_4 pb_4
cbx_2 cbx_2
pb_triage pb_triage
pb_change_est pb_change_est
pb_change_ting pb_change_ting
pb_print_ent pb_print_ent
pb_3 pb_3
dw_facts dw_facts
cbx_1 cbx_1
cbx_res cbx_res
dw_admi dw_admi
end type
type tabpage_2 from userobject within tab_1
end type
type st_5 from statictext within tabpage_2
end type
type st_4 from statictext within tabpage_2
end type
type pb_2 from picturebutton within tabpage_2
end type
type pb_anula_trasl from picturebutton within tabpage_2
end type
type em_2 from editmask within tabpage_2
end type
type em_1 from editmask within tabpage_2
end type
type pb_trasl from picturebutton within tabpage_2
end type
type dw_1 from datawindow within tabpage_2
end type
type dw_3 from datawindow within tabpage_2
end type
type gb_1 from groupbox within tabpage_2
end type
type tabpage_2 from userobject within tab_1
st_5 st_5
st_4 st_4
pb_2 pb_2
pb_anula_trasl pb_anula_trasl
em_2 em_2
em_1 em_1
pb_trasl pb_trasl
dw_1 dw_1
dw_3 dw_3
gb_1 gb_1
end type
type tab_note from userobject within tab_1
end type
type pb_guao from picturebutton within tab_note
end type
type pb_boro from picturebutton within tab_note
end type
type pb_newo from picturebutton within tab_note
end type
type dw_obs from datawindow within tab_note
end type
type tab_note from userobject within tab_1
pb_guao pb_guao
pb_boro pb_boro
pb_newo pb_newo
dw_obs dw_obs
end type
type tabpage_3 from userobject within tab_1
end type
type pb_6 from pb_report within tabpage_3
end type
type pb_print_sal from pb_report within tabpage_3
end type
type pb_1 from pb_report within tabpage_3
end type
type pb_print_catas from pb_report within tabpage_3
end type
type pb_egreso from picturebutton within tabpage_3
end type
type st_diagsal from statictext within tabpage_3
end type
type dw_sale from datawindow within tabpage_3
end type
type pb_guardaegres from picturebutton within tabpage_3
end type
type tabpage_3 from userobject within tab_1
pb_6 pb_6
pb_print_sal pb_print_sal
pb_1 pb_1
pb_print_catas pb_print_catas
pb_egreso pb_egreso
st_diagsal st_diagsal
dw_sale dw_sale
pb_guardaegres pb_guardaegres
end type
type tab_1 from tab within w_admision
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tab_note tab_note
tabpage_3 tabpage_3
end type
type pb_del from picturebutton within w_admision
end type
type dw_emppac from datawindow within w_admision
end type
type dw_historial from datawindow within w_admision
end type
type st_1 from statictext within w_admision
end type
type pb_new from picturebutton within w_admision
end type
end forward

global type w_admision from window
boolean visible = false
integer width = 5243
integer height = 2316
boolean titlebar = true
string title = "Admisiones del Paciente (Hospitalización y/o Urgencias)"
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "r_hospital.ico"
rte_1 rte_1
pb_cierre pb_cierre
dw_his_acu dw_his_acu
pb_print pb_print
dw_tingres dw_tingres
pb_catas pb_catas
pb_activos pb_activos
st_3 st_3
st_2 st_2
pb_save pb_save
tab_1 tab_1
pb_del pb_del
dw_emppac dw_emppac
dw_historial dw_historial
st_1 st_1
pb_new pb_new
end type
global w_admision w_admision

type variables
string tipo_ingres,clugar_ing,i_varios_ingre,l_aut,l_autc
boolean guardo=true
DataWindowChild pab, Hab,Camas,idw_tiping,idw_precibe,idw_destino,idw_viaing,idw_causaex
String Pabellon, Habitacion, Cdemp, Ctemp,cama,continua
end variables

forward prototypes
public function integer rn (long nh, string clug_hadm)
public function integer guardar ()
public subroutine f_anula_ing ()
public subroutine a_reserv ()
end prototypes

public function integer rn (long nh, string clug_hadm);string esparto
long nrn
setnull(esparto)
SELECT Max(proced.parto) into :esparto
FROM HospAdmi, ServiciosIngreso, Proced
WHERE HospAdmi.NH=:nh AND HospAdmi.clugar=:clug_hadm AND HospAdmi.Contador=serviciosingreso.contador AND HospAdmi.clugar_his=serviciosingreso.clugar AND ServiciosIngreso.cproced=proced.codproced;
IF SQLCA.SQLCODE=-1 THEN 
	messagebox("Error leyendo proced",sqlca.sqlerrtext)
	return -1
end if
if not isnull(esparto) and esparto='1' and w_principal.dw_1.getitemstring(1,"sexo")='F' then
	select count(nrn) into :nrn from hosprn where nh=:nh and clugar=:clug_hadm;
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo Hosprn",sqlca.sqlerrtext)
		return -1
	end if
	if nrn=0 then 
		trae trae2
		trae2.numero=nh
		trae2.lugar=clug_hadm
		trae2.otro=tipo_ingres
		openwithparm(w_rn,trae2)
		trae2=message.powerobjectparm
		if trae2.numero=0 then return -1
	end if
	return 1
else
	return 1	
end if

end function

public function integer guardar ();if not guardo then //1:cancelar o no pudo guardar 2:perder cambios 0:guardar y si pudo
	choose case messagebox("Atención","No ha guardado los cambios del ingreso, desea guardarlos ahora ?",question!,yesnocancel!,1)
		case 1
			pb_save.triggerevent(clicked!)
			if not guardo then return 1 // no pudo guardar
		case 2
			//if pb_del.event clicked()=-1 then return 1
			guardo=true
			return 2
		case 3
			return 1
	end choose
end if
return 0
end function

public subroutine f_anula_ing ();if tab_1.tabpage_1.dw_admi.rowcount()<1 then return
choose case tab_1.tabpage_1.dw_admi.getitemstring(1,"estado")
	case '5'
		messagebox("Atención","Esta admisión ya está anulada")
	case '2'
		messagebox("Atención","Esta admisión está con orden de salida, no la puede anular")
	case "1",'6'
		long nh,ingreqx,abonos
		string clug_hadm
		clug_hadm=tab_1.tabpage_1.dw_admi.getitemstring(1,"clugar")
		nh=tab_1.tabpage_1.dw_admi.getitemnumber(1,"nh")
		
		select count(codigosala) into :ingreqx from qxcabacto where nh=:nh and clugar_hadm=:clug_hadm;
		if sqlca.sqlcode=-1 then
			messagebox("Error leyendo QxCabActo",sqlca.sqlerrtext)
			rollback;
			return
		end if
		if ingreqx>0 then
			messagebox("Atención","Este ingreso tiene actos quirúrgicos cargados no lo puede anular")
			return
		end if
		//se agrega para evitar que se anule con ordenes 
		
		SELECT Count(oscabeza.NSolicitud) into :ingreqx
		FROM HospAdmi INNER JOIN (OSCabeza INNER JOIN OSCuerpo ON (OSCabeza.clugar = OSCuerpo.clugar) AND (OSCabeza.Contador = OSCuerpo.Contador)) ON (HospAdmi.clugar_his = OSCabeza.clugar) AND (HospAdmi.Contador = OSCabeza.Contador)
		WHERE (((HospAdmi.NH)=:nh) AND ((HospAdmi.clugar)=:clug_hadm));
		if sqlca.sqlcode=-1 then
			messagebox("Error leyendo Ordenes",sqlca.sqlerrtext)
			rollback;
			return
		end if
		if ingreqx>0 then
			messagebox("Atención","Este ingreso tiene ordenes cargados no lo puede anular")
			return
		end if
		if messagebox("Atención","Está seguro que desea anular esta admisión ?",question!,yesno!,2)=2 then return
		
		st_xa_anular st_anula
		st_anula.tipo='AD'
		openwithparm (w_motiv_anula,st_anula)
		st_anula=message.powerobjectparm
		if not isValid(st_anula) then return
		datetime fec_anu
		fec_anu=datetime(today(),now())
		update hospadmi set estado='5',fecha_anula =:fec_anu,motiv_anula=:st_anula.observacion,cod_anula=:st_anula.motivo,usu_anula =:usuario
		where nh=:nh and codtingre=:tipo_ingres and clugar=:clug_hadm;
		if sqlca.sqlcode=-1 then 
			messagebox("Error actualizando estado de Admisión",sqlca.sqlerrtext)
			rollback;
			RETURN
		end if
		update camas set tipodoc=null, documento=null, ningreso=null, clugar_ing=null, tingreso=null where ningreso=:nh and tingreso=:tipo_ingres and clugar_ing=:clug_hadm;
		if sqlca.sqlcode=-1 then 
			messagebox("Error actualizando estado de Cama",sqlca.sqlerrtext)
			rollback;
			RETURN
		end if
		commit;
		dw_tingres.triggerevent(itemchanged!)
		if isvalid(w_new_at_os) then w_new_at_os.dw_historial.triggerevent(rowfocuschanged!)
		if isvalid(w_new_sala_qx) then w_new_sala_qx.triggerevent(open!)
		if isvalid(w_entrega_med) then w_entrega_med.dw_historial.triggerevent(rowfocuschanged!)
	case '3'
		messagebox("Atención","Esta admisión ya se encuentra facturada, si desea anularla debe anular primero la factura y luego anular la salida")
end choose
end subroutine

public subroutine a_reserv ();if tipo_ingres<>'4' then return
if dw_historial.rowcount()=0 then return
if isnull(tab_1.tabpage_1.dw_admi.getitemnumber(1,'nh')) then return
tab_1.tabpage_1.dw_admi.setitem(1,'estado','6')
guardo=false
end subroutine

on w_admision.create
this.rte_1=create rte_1
this.pb_cierre=create pb_cierre
this.dw_his_acu=create dw_his_acu
this.pb_print=create pb_print
this.dw_tingres=create dw_tingres
this.pb_catas=create pb_catas
this.pb_activos=create pb_activos
this.st_3=create st_3
this.st_2=create st_2
this.pb_save=create pb_save
this.tab_1=create tab_1
this.pb_del=create pb_del
this.dw_emppac=create dw_emppac
this.dw_historial=create dw_historial
this.st_1=create st_1
this.pb_new=create pb_new
this.Control[]={this.rte_1,&
this.pb_cierre,&
this.dw_his_acu,&
this.pb_print,&
this.dw_tingres,&
this.pb_catas,&
this.pb_activos,&
this.st_3,&
this.st_2,&
this.pb_save,&
this.tab_1,&
this.pb_del,&
this.dw_emppac,&
this.dw_historial,&
this.st_1,&
this.pb_new}
end on

on w_admision.destroy
destroy(this.rte_1)
destroy(this.pb_cierre)
destroy(this.dw_his_acu)
destroy(this.pb_print)
destroy(this.dw_tingres)
destroy(this.pb_catas)
destroy(this.pb_activos)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.pb_save)
destroy(this.tab_1)
destroy(this.pb_del)
destroy(this.dw_emppac)
destroy(this.dw_historial)
destroy(this.st_1)
destroy(this.pb_new)
end on

event open;SELECT cadena into :l_aut
FROM parametros_gen
WHERE (((codigo_para)=2));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 2')
	return 
end if

SELECT cadena into :l_autc
FROM parametros_gen
WHERE (((codigo_para)=45));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 45')
	return 
end if

if not isnull(w_principal.dw_1.getitemstring(1,"documento")) AND (isnull(w_principal.dw_1.getitemdatetime(1,"fecha_captura")) OR (DaysAfter(date(w_principal.dw_1.getitemdatetime(1,"fecha_captura")),date(now()))> 365)) then
	messagebox("Atención","Actualicé Datos de paciente")
	opensheet (win_regis_pac,w_principal,4,original!)
	Close (This)
	return
end if
if docu<>"" then
	if not guardo then
		if guardar()=1 then 
			return -1
		end if
	end if
	dw_emppac.reset()
	dw_emppac.retrieve(tipdoc,docu)
	if dw_emppac.rowcount()=0 then messagebox("Atención","Este paciente no tiene una empresa responsable, asignele una en la ficha de pacientes")
else
	dw_emppac.reset()
end if

tipo_ingres=""
cama=""
dw_tingres.triggerevent(itemchanged!)
guardo=true
pb_new.enabled=true
return 0
end event

event closequery;if guardar()=1 then return 1


end event

event activate;//anular ingreso
if w_principal.m_principal.m_3.m_3_7.m_3_7_4.enabled=true then
	f_ribon_activa_menu(w_principal.rbb_1,3,3,1,true)
end if

//anular ingreso
if w_principal.m_principal.m_3.m_3_7.m_3_7_6.enabled=true then
	f_ribon_activa_menu(w_principal.rbb_1,3,3,2,true)
end if

//anular salida
if w_principal.m_principal.m_3.m_3_7.m_3_7_5.enabled=true then
	f_ribon_activa_menu(w_principal.rbb_1,3,3,3,true)
end if


end event

event deactivate;//anular ingreso
if w_principal.m_principal.m_3.m_3_7.m_3_7_4.enabled=true then
	f_ribon_activa_menu(w_principal.rbb_1,3,3,1,false)
end if

//anular ingreso
if w_principal.m_principal.m_3.m_3_7.m_3_7_6.enabled=true then
	f_ribon_activa_menu(w_principal.rbb_1,3,3,2,false)
end if

//anular salida
if w_principal.m_principal.m_3.m_3_7.m_3_7_5.enabled=true then
	f_ribon_activa_menu(w_principal.rbb_1,3,3,3,false)
end if


end event

type rte_1 from richtextedit within w_admision
boolean visible = false
integer x = 1614
integer y = 2148
integer width = 343
integer height = 116
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long init_backcolor = 0
boolean border = false
end type

type pb_cierre from picturebutton within w_admision
integer x = 1902
integer y = 380
integer width = 146
integer height = 128
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "anulardoc.gif"
string disabledname = "d_anulardoc.gif"
alignment htextalign = left!
string powertiptext = "Cierre Arbitrario"
end type

event clicked;if f_permiso_boton(this,'ADM')=0 then return
If messageBox('Atención','Está seguro de querer cambiar el estado del documento ?',question!,yesno!,2) = 2 then Return 

long num_hosp
string clug_hadm,diaging
clug_hadm=tab_1.tabpage_1.dw_admi.getitemstring(1,"clugar")
num_hosp=tab_1.tabpage_1.dw_admi.getitemnumber(1,"nh")
st_xa_anular st_anula
st_anula.tipo='AB'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return
	datetime fec_anu
	fec_anu=datetime(today(),now())
	update hospadmi set estado='7',fecha_anula =:fec_anu,motiv_anula=:st_anula.observacion,cod_anula=:st_anula.motivo,usu_anula =:usuario
	where nh=:num_hosp and codtingre=:tipo_ingres and clugar=:clug_hadm;
	if sqlca.sqlcode=-1 then 
		messagebox("Error actualizando el estado de Admisión cierre arbitrario",sqlca.sqlerrtext)
		rollback;
		RETURN
	end if
update camas set tipodoc= null , documento = null ,ningreso=null ,tingreso=null ,clugar_ing=null where ningreso=:num_hosp and clugar_ing=:clug_hadm ;
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando el estado de la Cama",sqlca.sqlerrtext)
	rollback;
	return
end if
commit;
dw_historial.setitem(dw_historial.getrow(),'estado','7')
dw_historial.resetupdate()
dw_historial.triggerevent(rowfocuschanged!)
end event

type dw_his_acu from datawindow within w_admision
boolean visible = false
integer x = 5
integer y = 2128
integer width = 686
integer height = 400
integer taborder = 80
string title = "none"
string dataobject = "dw_historial_acumcab"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type pb_print from picturebutton within w_admision
event mousemove pbm_mousemove
integer x = 2208
integer y = 376
integer width = 146
integer height = 128
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &h"
boolean originalsize = true
string picturename = "print.GIF"
string disabledname = "d_print.GIF"
alignment htextalign = left!
string powertiptext = "Imprimir Historia Clínica [Alt+H]"
end type

event clicked;if f_permiso_boton(this,'ADM')=0 then return
if dw_historial.rowcount()=0 then return

trae historial

historial.numero=dw_historial.getitemnumber(dw_historial.getrow(),'contador')
historial.lugar=dw_historial.getitemstring(dw_historial.getrow(),'clugar')
historial.tingres=tipo_ingres

openwithparm(w_print_histor_txt,historial)


end event

event constructor;f_inicia_boton(this,'ADM')
end event

type dw_tingres from datawindow within w_admision
integer x = 320
integer y = 392
integer width = 1061
integer height = 84
integer taborder = 30
string title = "none"
string dataobject = "dw_tip_ingres_drop"
boolean border = false
boolean livescroll = true
end type

event constructor;modify('datawindow.detail.height="116" ')
modify('codtingre.font.height="-10" ')
modify('codtingre.height="70"')
modify('codtingre.width="791"') 
settransobject(sqlca)
getchild('codtingre',idw_tiping)
idw_tiping.settransobject(sqlca)
idw_tiping.modify('datawindow.detail.height="90" ')
idw_tiping.modify('descripcion.font.height="-10" ')
idw_tiping.modify('descripcion.height="70"')
idw_tiping.modify('descripcion.width="791"') 
idw_tiping.retrieve()
idw_tiping.deleterow(1)
string ojo
if ls_pro=32 THEN	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "TINGRESO", Regstring!, ojo)
if ls_pro=64 THEN	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "TINGRESO", Regstring!, ojo)
insertrow(1)
setitem(1,1,ojo)
post event itemchanged(1,object.codtingre,ojo)
end event

event itemchanged;if isnull(gettext()) or gettext()='' then
	tab_1.tabpage_1.dw_admi.reset()
	tab_1.tabpage_3.dw_sale.reset()
	return 0
end if
tipo_ingres=gettext()
if guardar()=1 then 
	settext(getitemstring(1,1))
	return 1
end if
pb_new.enabled=true
tab_1.tabpage_1.cbx_res.visible=false
//tab_1.tabpage_1.cbx_2.visible=false
tab_1.tabpage_1.pb_4.enabled=false
dw_historial.reset()
if tipo_ingres='2' then
	tab_1.tabpage_1.pb_triage.enabled=true
	idw_causaex.setfilter("xa_urge='1'")
else
	tab_1.tabpage_1.pb_triage.enabled=false
	idw_causaex.setfilter("xa_hosp='1'")
end if
if tipo_ingres='4' then
	tab_1.tabpage_1.pb_change_ting.visible=true
else
	tab_1.tabpage_1.pb_change_ting.visible=false
end if
i_varios_ingre=idw_tiping.getitemstring(idw_tiping.getrow(),'varios_ingre')
idw_causaex.filter()
dw_historial.retrieve(tipdoc,docu,tipo_ingres)
tab_1.tabpage_2.dw_1.triggerevent(constructor!)
return 0
end event

type pb_catas from picturebutton within w_admision
event mousemove pbm_mousemove
boolean visible = false
integer x = 2057
integer y = 380
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
boolean originalsize = true
string picturename = "hombre.gif"
string disabledname = "d_hombre.gif"
alignment htextalign = left!
string powertiptext = "Mostrar Catástrofe del Ingreso"
end type

event clicked;if dw_historial.rowcount()<1 then return
trae trae2,trae1
trae2.numero=dw_historial.getitemnumber(dw_historial.getrow(),'ncatastrofe')
trae2.lugar=dw_historial.getitemstring(dw_historial.getrow(),'clugar_catas')
openwithparm(w_catastrofes,trae2)
if message.stringparm='!' or not isvalid(message.powerobjectparm) then return
trae1=message.powerobjectparm
if trae1.numero<>trae2.numero or trae1.lugar<>trae2.lugar then
	dw_historial.setitem(dw_historial.getrow(),'ncatastrofe',trae1.numero)
	dw_historial.setitem(dw_historial.getrow(),'clugar_catas',trae1.lugar)
	if dw_historial.update()=-1 then
		rollback;
	else
		commit;
	end if
end if
end event

type pb_activos from picturebutton within w_admision
event mousemove pbm_mousemove
integer x = 1408
integer y = 380
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &a"
boolean originalsize = true
string picturename = "buscar.GIF"
string disabledname = "d_buscar.GIF"
alignment htextalign = left!
string powertiptext = "Mostrar Pacientes con Admisiones Activas [Alt+A]"
end type

event clicked;openwithparm(w_hospitaliz,dw_tingres.getitemstring(1,1))
end event

type st_3 from statictext within w_admision
integer x = 3168
integer y = 8
integer width = 2016
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = " Ingresos Anteriores del Paciente"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_2 from statictext within w_admision
integer x = 14
integer y = 8
integer width = 3104
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = " Empresa a responder por el Ingreso"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type pb_save from picturebutton within w_admision
event mousemove pbm_mousemove
integer x = 4128
integer y = 652
integer width = 146
integer height = 128
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &g"
boolean originalsize = true
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "Guardar Datos Ingreso [Alt+G]"
end type

event clicked;string ips_r1, l_viain,lprof_recibe,lcargo_profe_recibe,naut
datetime l_fecha_notifica,l_fecha_aceptacion

if not f_demo('pac') then return -1
if tab_1.tabpage_1.dw_admi.rowcount()<1 then return -1
Datetime fecha
long ntraslado
if isnull(tab_1.tabpage_1.dw_admi.getitemstring(1,"viaingreso")) then
	messagebox("Error","Debe escoger la vía de ingreso")
	return -1
end if

ips_r1=tab_1.tabpage_1.dw_admi.getitemstring(1,"c_ips_remite")
l_viain=tab_1.tabpage_1.dw_admi.getitemstring(1,"viaingreso")
lprof_recibe=tab_1.tabpage_1.dw_admi.getitemstring(1,"prof_recibe")
l_fecha_notifica=tab_1.tabpage_1.dw_admi.getitemdatetime(1,"fecha_notifica")
l_fecha_aceptacion=tab_1.tabpage_1.dw_admi.getitemdatetime(1,"fecha_aceptacion")
if (l_viain='3') then
	if isnull(ips_r1) then
		messagebox("Error","Debe escoger Ips Remite")
		return -1
	end if
	if isnull(l_fecha_notifica) then
		messagebox("Error","Debe escoger Fecha de Notificación a la Ips")
		return -1
	end if
	if isnull(l_fecha_aceptacion) then
		messagebox("Error","Debe escoger Fecha de Aceptación a la Ips")
		return -1
	end if
	if isnull(lprof_recibe) then
		messagebox("Error","Debe escoger profesional que Recibe")
		return -1
	end if
end if

if isnull(tab_1.tabpage_1.dw_admi.getitemstring(1,"causaexterna")) then
	messagebox("Error","Debe escoger la causa externa")
	return -1
end if
if cama="" and (tipo_ingres="3" or tipo_ingres="7")  and tab_1.tabpage_2.dw_3.rowcount()=0 then 
	messagebox("Atención","Debe escoger una cama para este tipo de ingreso")
	return -1
end if
boolean is_new
if isnull(tab_1.tabpage_1.dw_admi.getitemnumber(1,'contador')) then 
	is_new=true
	long contador

	contador=f_trae_ndoc('HIS',clugar,'Historial')
	tab_1.tabpage_1.dw_admi.setitem(1,"contador",contador)
	dw_historial.setitem(1,"contador",contador)
	if dw_historial.update(true,false)=-1 then
		rollback;
		setnull(ntraslado)
		tab_1.tabpage_1.dw_admi.setitem(1,'contador',ntraslado)
		return -1
	end if
	dw_his_acu.setitem(1,"contador",contador)
	if dw_his_acu.update()=-1 then
		dw_his_acu.deleterow(1)
		dw_his_acu.resetupdate()
		rollback;
		return -1
	end if

	contador=f_trae_ndoc('ING',clugar,'INGRESO ADMISIONES')
	tab_1.tabpage_1.dw_admi.setitem(1,"nh",contador)
	tab_1.tabpage_1.dw_admi.setitem(1,"clugar_his",clugar)
	if tipo_ingres='4' and tab_1.tabpage_1.cbx_res.checked then tab_1.tabpage_1.dw_admi.setitem(1,"estado",'6')
end if

if tab_1.tabpage_1.dw_admi.update(true,false)=-1 then
	rollback;
	if is_new then
		setnull(ntraslado)
		tab_1.tabpage_1.dw_admi.setitem(1,'contador',ntraslado)
	end if
	return -1
end if
string clug_hadm
clug_hadm=tab_1.tabpage_1.dw_admi.getitemstring(1,"clugar")
//***** Actualiza Camas
if tab_1.tabpage_1.dw_admi.getitemstring(1,'estado')<>'6' then//actualiza camas si no es reserva
	if tab_1.tabpage_2.dw_3.rowcount()=0 and cama<>"" then
		fecha=datetime(date(tab_1.tabpage_1.dw_admi.getitemdatetime(1,"fechaingreso")),time(tab_1.tabpage_1.dw_admi.getitemdatetime(1,"horaingreso")))
		long ningres
		ningres=tab_1.tabpage_1.dw_admi.getitemnumber(1,"nh")
		select max(ntraslado) into :ntraslado from hosptrasl where nh=:ningres and clugar=:clug_hadm;
		if isnull(ntraslado) then ntraslado=0
		ntraslado++
		tab_1.tabpage_2.dw_3.insertrow(1)
		tab_1.tabpage_2.dw_3.Setitem(1,"Fecha",Fecha)
		tab_1.tabpage_2.dw_3.Setitem(1,"ntraslado",ntraslado)
		tab_1.tabpage_2.dw_3.Setitem(1,"CodTIngre",tipo_ingres)
		tab_1.tabpage_2.dw_3.Setitem(1,"Usuario",usuario)
		tab_1.tabpage_2.dw_3.setitem(1,"nh",ningres)
		tab_1.tabpage_2.dw_3.setitem(1,"clugar",clug_hadm)
		tab_1.tabpage_2.dw_3.setitem(1,"clugar_cam",clugar)
		tab_1.tabpage_2.dw_3.setitem(1,"codcama",cama)
		tab_1.tabpage_2.dw_3.setitem(1,"codser",pabellon)
		tab_1.tabpage_2.dw_3.setitem(1,"codhab", habitacion)
		If tab_1.tabpage_2.dw_3.update(true,false)=-1 then
			rollback;
			if is_new then
				setnull(ntraslado)
				tab_1.tabpage_1.dw_admi.setitem(1,'contador',ntraslado)
			end if
			return -1
		End If
		tab_1.tabpage_2.dw_3.retrieve(tab_1.tabpage_1.dw_admi.getitemnumber(1,"nh"),clug_hadm)
		update camas set tipodoc=:tipdoc, documento=:docu, ningreso=:ningres , tingreso=:tipo_ingres, clugar_ing=:clugar_ing 
		where codser=:pabellon and codhab=:habitacion and codigocama=:cama and documento is null and clugar=:clugar;
		if sqlca.sqlcode=-1 or sqlca.sqlnrows=0 then
			messagebox("Error actualizando estado de cama",sqlca.sqlerrtext)
			rollback;
			if is_new then
				setnull(ntraslado)
				tab_1.tabpage_1.dw_admi.setitem(1,'contador',ntraslado)
			end if
			tab_1.tabpage_2.dw_1.triggerevent(constructor!)
			return -1
		End If
	else
		If tab_1.tabpage_2.dw_3.update(true,false)=-1 then
			rollback;
			if is_new then
				setnull(ntraslado)
				tab_1.tabpage_1.dw_admi.setitem(1,'contador',ntraslado)
			end if
			return -1
		End If
	end if
end if //fin actualiza camas si no es reserva
if tab_1.tabpage_1.cbx_1.visible then
	string enobserva
	long nh
	nh=tab_1.tabpage_1.dw_admi.getitemnumber(1,"nh")
	if tab_1.tabpage_1.cbx_1.checked then
		enobserva='1'
	else
		enobserva='0'
	end if
	update hospadmi set en_observa=:enobserva where nh=:nh and clugar=:clug_hadm and codtingre='2';
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando el campo en_observa",sqlca.sqlerrtext)
		rollback;
		if is_new then
			setnull(ntraslado)
			tab_1.tabpage_1.dw_admi.setitem(1,'contador',ntraslado)
		end if
		return -1
	end if
end if

if tab_1.tabpage_1.cbx_2.visible then
	string perte
	nh=tab_1.tabpage_1.dw_admi.getitemnumber(1,"nh")
	tipo_ingres=tab_1.tabpage_1.dw_admi.getitemstring(1,"codtingre")
	if tab_1.tabpage_1.cbx_2.checked then
		perte='1'
		tab_1.tabpage_1.cbx_2.enabled=false
		tab_1.tabpage_1.pb_4.enabled=true
	else
		perte='0'
	end if
	update hospadmi set perte=:perte where nh=:nh and clugar=:clug_hadm and codtingre=:tipo_ingres;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando el campo en_observa",sqlca.sqlerrtext)
		rollback;
		if is_new then
			setnull(ntraslado)
			tab_1.tabpage_1.dw_admi.setitem(1,'contador',ntraslado)
		end if
		return -1
	end if
end if

contador=tab_1.tabpage_1.dw_admi.getitemnumber(1,'contador')
naut=tab_1.tabpage_1.dw_admi.getitemstring(1,"autoriza")
if trim(naut)='' or naut='0' then setnull(naut)
update serviciosingreso set nautoriza = :naut
where (((contador)=:contador) and ((serviciosingreso.clugar)=:clugar) and ((serviciosingreso.nautoriza) is null));
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando nautorizacion servicios",sqlca.sqlerrtext)
	rollback;
	return -1
end if
commit;
dw_historial.resetupdate()
tab_1.tabpage_1.dw_admi.resetupdate()
tab_1.tabpage_2.dw_3.resetupdate()
dw_historial.setitem(dw_historial.getrow(),'nh',nh)
dw_historial.setitem(dw_historial.getrow(),'estado','1')
tab_1.tabpage_1.cbx_res.visible=false
guardo=true
pb_new.enabled=true
tab_1.tabpage_2.dw_1.reset()
tab_1.tabpage_2.dw_1.triggerevent(constructor!)
if isvalid(w_new_at_os) then w_new_at_os.dw_tip_ingres.triggerevent(itemchanged!)
if isvalid(w_entrega_med) then w_entrega_med.dw_tip_ingres.triggerevent(itemchanged!)
return 1
end event

type tab_1 from tab within w_admision
event create ( )
event destroy ( )
integer x = 37
integer y = 516
integer width = 5143
integer height = 1616
integer taborder = 70
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
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tab_note tab_note
tabpage_3 tabpage_3
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tab_note=create tab_note
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tab_note,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tab_note)
destroy(this.tabpage_3)
end on

event selectionchanged;if newindex=3 or newindex=4 then
	pb_save.visible=false
else
	pb_save.visible=true
end if
end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5106
integer height = 1488
long backcolor = 67108864
string text = "Admisión"
long tabtextcolor = 33554432
string picturename = "hospital.ico"
long picturemaskcolor = 536870912
mle_1 mle_1
pb_5 pb_5
pb_4 pb_4
cbx_2 cbx_2
pb_triage pb_triage
pb_change_est pb_change_est
pb_change_ting pb_change_ting
pb_print_ent pb_print_ent
pb_3 pb_3
dw_facts dw_facts
cbx_1 cbx_1
cbx_res cbx_res
dw_admi dw_admi
end type

on tabpage_1.create
this.mle_1=create mle_1
this.pb_5=create pb_5
this.pb_4=create pb_4
this.cbx_2=create cbx_2
this.pb_triage=create pb_triage
this.pb_change_est=create pb_change_est
this.pb_change_ting=create pb_change_ting
this.pb_print_ent=create pb_print_ent
this.pb_3=create pb_3
this.dw_facts=create dw_facts
this.cbx_1=create cbx_1
this.cbx_res=create cbx_res
this.dw_admi=create dw_admi
this.Control[]={this.mle_1,&
this.pb_5,&
this.pb_4,&
this.cbx_2,&
this.pb_triage,&
this.pb_change_est,&
this.pb_change_ting,&
this.pb_print_ent,&
this.pb_3,&
this.dw_facts,&
this.cbx_1,&
this.cbx_res,&
this.dw_admi}
end on

on tabpage_1.destroy
destroy(this.mle_1)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.cbx_2)
destroy(this.pb_triage)
destroy(this.pb_change_est)
destroy(this.pb_change_ting)
destroy(this.pb_print_ent)
destroy(this.pb_3)
destroy(this.dw_facts)
destroy(this.cbx_1)
destroy(this.cbx_res)
destroy(this.dw_admi)
end on

type mle_1 from multilineedit within tabpage_1
boolean visible = false
integer x = 3739
integer y = 20
integer width = 279
integer height = 132
integer taborder = 65
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 15793151
string text = "none"
boolean border = false
end type

type pb_5 from picturebutton within tabpage_1
integer x = 4082
integer y = 1088
integer width = 146
integer height = 128
integer taborder = 55
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "copiar.gif"
alignment htextalign = left!
string powertiptext = "Trae Motivo Atención"
end type

event clicked;if dw_admi.rowcount()=0 then return
long ll_reg,ll_contador
string ls_lugar_his,ls_tingre

ll_contador=dw_admi.getitemnumber(1,'contador')
ls_lugar_his=dw_admi.getitemstring(1,'clugar_his')
ls_tingre=dw_admi.getitemstring(1,'codtingre')		
mle_1=f_motivo(ll_contador,ls_lugar_his,ls_tingre,rte_1,mle_1)
//clipboard(' ')
end event

type pb_4 from pb_report within tabpage_1
boolean visible = false
integer x = 3081
integer y = 1308
integer width = 224
integer height = 108
integer taborder = 55
boolean enabled = false
boolean originalsize = false
string picturename = ""
string disabledname = ""
string cod_rep = "CP"
string nombre_rep = "Control Pertenencias"
string tipo_rep = "interno!"
boolean v_preliminar = true
end type

event clicked;call super::clicked;if dw_admi.rowcount()<1 then return
any par[3]
par[1]=dw_admi.getitemnumber(1,"nh")
par[2]=tipo_ingres
par[3]=dw_admi.getitemstring(1,"clugar")
imprimir(par,'','0')


end event

type cbx_2 from checkbox within tabpage_1
boolean visible = false
integer x = 2597
integer y = 1400
integer width = 475
integer height = 96
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Deja Pertenencias"
end type

type pb_triage from picturebutton within tabpage_1
integer x = 4082
integer y = 920
integer width = 146
integer height = 128
integer taborder = 45
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "           &t"
boolean originalsize = true
string picturename = "triagge.gif"
string disabledname = "d_triagge.gif"
alignment htextalign = left!
string powertiptext = "TRIAGE [Alt+T]"
end type

event clicked;if dw_historial.rowcount()=0 then return
if isnull(dw_historial.getitemnumber(dw_historial.getrow(),'nh')) then return

if f_permiso_boton(this,'ADM')=0 then return

trae st
st.numero=dw_historial.getitemnumber(dw_historial.getrow(),'nh')
st.lugar=dw_historial.getitemstring(dw_historial.getrow(),'clugar')
st.est_hadm=dw_admi.getitemstring(1,'estado')
st.otro=dw_admi.getitemstring(1,'clasif')
openwithparm(w_triage,st)
if message.stringparm<>'!' then
	dw_admi.setitem(1,'clasif',message.stringparm)
	long colo
	select n_color into :colo from hosp_triage where cod_triage =:message.stringparm;
	dw_admi.setitem(1,'n_color',colo)
	if message.stringparm='N' then
		dw_admi.setitem(1,'estado','N')
		dw_historial.setitem(1,'estado','N')
	end if
end if

end event

event constructor;f_inicia_boton(this,'ADM')
end event

type pb_change_est from picturebutton within tabpage_1
boolean visible = false
integer x = 4082
integer y = 732
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
string picturename = "abrir2.gif"
string disabledname = "d_abrir2.gif"
alignment htextalign = left!
string powertiptext = "Cambiar Estado a Activa"
end type

event clicked;dw_admi.setitem(1,'estado','1')
guardo=false
end event

type pb_change_ting from picturebutton within tabpage_1
boolean visible = false
integer x = 4082
integer y = 584
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "llevar.gif"
alignment htextalign = left!
string powertiptext = "Cambiar Tipo Ingreso a HOSPITALIZADO"
end type

event clicked;if dw_admi.rowcount()=0 then return
if dw_admi.getitemstring(1,'estado')<>'1' then
	messagebox("Atención",'No se puede cambiar el tipo de ingreso ya la admisión no se encuentra abierta')
	return
end if
string l_es
select estado into :l_es
from tipoingreso where (((codtingre)='7'));

if (not isnull(l_es)) and l_es='1' then 
	choose case MessageBox("Atención", "Para hacer HOSPITALIZACION elija ~r~n~r~nPISO -> SI~r~nUCI  -> NO",Question!, YesNo!,2)
		case 1
			tipo_ingres='3'
			 setnull(l_es)
			 l_es='3'
		case 2
			tipo_ingres='7'
			 setnull(l_es)
			 l_es='7'			
		case 3
			return
	end choose
else
	tipo_ingres='3'
	 setnull(l_es)
	 l_es='3'
end if
tab_1.selectedtab=2
openwithparm(w_cama_libre,tipo_ingres)
if message.stringparm<>'ok' then 
	tipo_ingres='4'
	return
end if
long nh,contador
string clug,clug_his
nh=dw_admi.getitemnumber(1,'nh')
contador=dw_admi.getitemnumber(1,'contador')
clug_his=dw_admi.getitemstring(1,'clugar_his')
if isnull(nh) then return

clug=dw_admi.getitemstring(1,'clugar')
INSERT INTO hospadmi (nh, clugar, codtingre, tipodoc, documento, cemp, ccontrato, contador, clugar_his, docac, telac, viaingreso, fechaingreso, horaingreso, nombreac, observaciones, estado, usuario, pendiente, condiusuaria, causaexterna, diagingre, diagcomplica, tipodiscap, gradodiscap, enfsagregada, conria, autoriza, nradica, clugar_rad, en_observa, nh_ori, clugar_ori, codtingre_ori, nh_des, clugar_des, codtingre_des, diagingre1, diagingre2, diagingre3, fecha_anula, motiv_anula, usu_anula, estad_evol, ta, t, fc, fr, at_inicial, peso, talla, clasif, perso_autoriza, triage_hc, o, m, v, cod_activid, usu_triage, c_ips_remite, fecha_triage, fecha_notifica, fecha_aceptacion, prof_recibe, fin_consulta, tipodiagprin, sat02, perte, ta_sis, ta_dia, per_br, discap)
select nh, clugar, :l_es, tipodoc, documento, cemp, ccontrato, contador, clugar_his, docac, telac, viaingreso, fechaingreso, horaingreso, nombreac, observaciones, estado, usuario, pendiente, condiusuaria, causaexterna, diagingre, diagcomplica, tipodiscap, gradodiscap, enfsagregada, conria, autoriza, nradica, clugar_rad, en_observa, nh_ori, clugar_ori, codtingre_ori, nh_des, clugar_des, codtingre_des, diagingre1, diagingre2, diagingre3, fecha_anula, motiv_anula, usu_anula, estad_evol, ta, t, fc, fr, at_inicial, peso, talla, clasif, perso_autoriza, triage_hc, o, m, v, cod_activid, usu_triage, c_ips_remite, fecha_triage, fecha_notifica, fecha_aceptacion, prof_recibe, fin_consulta, tipodiagprin, sat02, perte, ta_sis, ta_dia, per_br, discap
FROM HospAdmi
WHERE (((HospAdmi.NH)=:nh) AND ((HospAdmi.clugar)=:clug));
if sqlca.sqlcode=-1 then
	messagebox("Error insertando en Hospadmi",sqlca.sqlerrtext)
	rollback;
	return
end if
if tab_1.tabpage_2.dw_3.rowcount()=0 then
	if cama='' then
		messagebox("Atención",'Debe escoger una cama para poder continuar')
		return
	end if
	if pb_save.event clicked()=-1 then return
else
	tipo_ingres='4'
	if tab_1.tabpage_2.pb_trasl.event clicked()=-1 then return
end if
UPDATE factadm SET factadm.CodTIngre = :l_es
WHERE (((factadm.NH)=:nh) AND ((factadm.clugar_ingre)=:clug));
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando factadm",sqlca.sqlerrtext)
	rollback;
	return
end if

UPDATE HospRN SET HospRN.CodTIngre =  :l_es
WHERE (((HospRN.NH)=:nh) AND ((HospRN.clugar)=:clug));
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando Hosprn",sqlca.sqlerrtext)
	rollback;
	return
end if

update camas set tingreso=:l_es
where ningreso=:nh and clugar_ing=:clug;
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando Camas",sqlca.sqlerrtext)
	rollback;
	return
end if

UPDATE HospSali SET HospSali.CodTIngre =:l_es
WHERE (((HospSali.NHosp)=:nh) AND ((HospSali.clugar_hadm)=:clug));
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando HospSali",sqlca.sqlerrtext)
	rollback;
	return
end if


UPDATE HospRespon SET HospRespon.CodTIngre =:l_es
WHERE (((HospRespon.NH)=:nh) AND ((HospRespon.clugar)=:clug));
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando HospRespon",sqlca.sqlerrtext)
	rollback;
	return
end if


UPDATE HospTrasl SET HospTrasl.CodTIngre = :l_es
WHERE (((HospTrasl.NH)=:nh) AND ((HospTrasl.clugar)=:clug));
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando HospTrasl",sqlca.sqlerrtext)
	rollback;
	return
end if

UPDATE hospadmi_obs SET hospadmi_obs.CodTIngre = :l_es
WHERE (((hospadmi_obs.NH)=:nh) AND ((hospadmi_obs.clugar)=:clug));
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando hospadmi_obs",sqlca.sqlerrtext)
	rollback;
	return
end if


UPDATE QxCabActo SET QxCabActo.ViaIngreso =:l_es
WHERE (((QxCabActo.NH)=:nh) AND ((QxCabActo.clugar_hadm)=:clug));
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando QxCabActo",sqlca.sqlerrtext)
	rollback;
	return
end if


UPDATE IngresoADX SET IngresoADX.tipo_ingres =:l_es
where IngresoADX.Contador = :contador and 
IngresoADX.clugar_his = :clug_his;
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando IngresoAdx",sqlca.sqlerrtext)
	rollback;
	return
end if

delete from hospadmi where nh=:nh and clugar=:clug and codtingre='4';
if sqlca.sqlcode=-1 then
	messagebox("Error borrando de hospAdmi",sqlca.sqlerrtext)
	rollback;
	return
end if
dw_historial.setitem(dw_historial.getrow(),'indapdx',l_es)
if dw_historial.update()=-1 then
	rollback;
	return
end if
commit;
dw_tingres.setitem(1,1,'3')
dw_tingres.settext('3')
dw_tingres.triggerevent(itemchanged!)
end event

type pb_print_ent from pb_report within tabpage_1
integer x = 4082
integer y = 280
integer taborder = 60
string text = "        &p"
string powertiptext = "Imprimir Admisión [Alt+P]"
string cod_rep = "ADHU"
string nombre_rep = "Admisión Urg./Hosp"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;if dw_admi.rowcount()<1 then return
any par[3]
par[1]=dw_admi.getitemnumber(1,"nh")
par[2]=tipo_ingres
par[3]=dw_admi.getitemstring(1,"clugar")
imprimir(par,'','0')


end event

type pb_3 from pb_report within tabpage_1
integer x = 4082
integer y = 416
integer taborder = 80
string text = "        &b"
string picturename = "contrato.gif"
string disabledname = "d_contrato.gif"
string powertiptext = "Imprimir Boleta de Hospitalización [Alt+B]"
string cod_rep = "BH"
string nombre_rep = "Boleta de Hospitalización"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;if dw_admi.rowcount()<1 then return
any par[3]
par[1]=dw_admi.getitemnumber(1,"nh")
par[2]=tipo_ingres
par[3]=dw_admi.getitemstring(1,"clugar")
imprimir(par,'','0')



end event

type dw_facts from datawindow within tabpage_1
integer x = 2199
integer y = 104
integer width = 663
integer height = 148
integer taborder = 80
string title = "none"
string dataobject = "dw_fact_x_adm"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event clicked;if dwo.name='nfact' then
	if not isnull(getitemnumber(getrow(),'nfact')) then
		openwithparm(w_busca_fact,'factu')
		w_busca_fact.dw_busca.setitem(1,1,'factcab.nfact = ')
		w_busca_fact.dw_busca.setitem(1,2,string(getitemnumber(getrow(),'nfact')))
		w_busca_fact.dw_busca.accepttext()
		w_busca_fact.pb_busca.triggerevent(clicked!)
	end if
end if
end event

type cbx_1 from checkbox within tabpage_1
integer x = 3227
integer y = 148
integer width = 425
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "En Observación"
end type

type cbx_res from checkbox within tabpage_1
boolean visible = false
integer x = 3040
integer y = 12
integer width = 265
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
string text = "Reserva"
end type

type dw_admi from datawindow within tabpage_1
integer x = 32
integer width = 4000
integer height = 1484
integer taborder = 60
string title = "none"
string dataobject = "dw_admision"
boolean border = false
end type

event constructor;settransobject(sqlca)
getchild('viaingreso',idw_viaing)
idw_viaing.settransobject(sqlca)
getchild('prof_recibe',idw_precibe)
idw_precibe.settransobject(sqlca)
idw_precibe.setfilter("cirujano ='1' or  anestesia ='1' or  odontologo ='1' or  mgeneral ='1'")
idw_precibe.filter()
getchild('causaexterna',idw_causaex)
idw_causaex.settransobject(sqlca)

end event

event doubleclicked;if getcolumnname()<>"cod_rips" then return
st_edadsexo st_es
st_diag st_d
st_es.sexo=w_principal.dw_1.getitemstring(1,"sexo")
st_es.edad=w_principal.dw_1.getitemnumber(1,"dias")
st_es.antece='0'
st_es.proced='0'
openwithparm(w_busca_diag,st_es)
st_d=message.powerobjectparm
if not isValid(st_d) then return
if not isNull(st_d.codrip) then
	setitem(1,"diagingre",st_d.codgeral)
	setitem(1,"cod_rips",st_d.codrip)
	setitem(1,"desdiag",st_d.descripcion)
end if
end event

event itemchanged;if getcolumnname()="cod_rips" then
	string este='',nulo
	st_return_diags st
	
	setnull(nulo)
	if trim(data)="" then 
		setitem(1,'diagingre',nulo)
		return
	end if
	sex_busca=w_principal.dw_1.getitemstring(1,"sexo_t")
	edad_busca=w_principal.dw_1.getitemnumber(1,"dias")
	st=f_check_diag(data,sex_busca,edad_busca,este,'0')
	if st.descrip_diag="" or isnull(st.descrip_diag) then
		setitem(1,"diagingre",nulo)
		setitem(1,"cod_rips",'')
		setitem(1,"desdiag",'')
		return 1
	else
		accepttext()
		setitem(1,"diagingre",este)
		setitem(1,"desdiag",st.descrip_diag)
	end if
end if
if getcolumnname()='horaingreso' then
	datetime horitas
	horitas=datetime(data)
	tab_1.tabpage_2.em_2.text=string(horitas,"HH:mm")
end if
if getcolumnname()='viaingreso' then
	if idw_viaing.getitemstring(idw_viaing.getrow(),'accion')='1' then
//		tab_1.tabpage_1.cbx_1.y=600
		this.modify ("gb_6.visible=1")
		this.modify ("gb_6.height=308")		
		this.modify ("t_6.visible=1")
		this.modify ("t_7.visible=1")
		this.modify ("t_9.visible=1")
		this.modify ("t_8.visible=1")		
		this.modify ("c_ips_remite.visible=1")	
		this.modify ("prof_recibe.visible=1")	
		this.modify ("fecha_notifica.visible=1")	
		this.modify ("fecha_aceptacion.visible=1")	
		this.modify ("observaciones.y=1208")
		this.modify ("siras.y=1208")
		this.modify ("observaciones_t.y=1148")
		this.modify ("t_10.y=1148")
		this.modify ("gb_7.y=1088")	
		this.modify ("docac.y=972")	
		this.modify ("nombreac.y=972")	
		this.modify ("telac.y=972")		
		this.modify ("docac_t.y=912")	
		this.modify ("nombreac_t.y=912")	
		this.modify ("telac_t.y=912")	
		this.modify ("gb_1.y=856")		
		this.modify ("gb_5.y=856")
		this.modify ("clasif.y=972")
		this.modify ("gb_3.y=700")
		this.modify ("cod_rips.y=764")
		this.modify ("desdiag.y=764")
	else
//		tab_1.tabpage_1.cbx_1.y=536
		this.modify ("gb_6.visible=0")
		this.modify ("gb_6.height=224")			
		this.modify ("t_6.visible=0")
		this.modify ("t_7.visible=0")
		this.modify ("t_9.visible=0")
		this.modify ("t_8.visible=0")		
		this.modify ("c_ips_remite.visible=0")	
		this.modify ("prof_recibe.visible=0")	
		this.modify ("fecha_notifica.visible=0")	
		this.modify ("fecha_aceptacion.visible=0")		
		this.modify ("observaciones.y=860")
		this.modify ("siras.y=860")
		this.modify ("observaciones_t.y=800")
		this.modify ("t_10.y=800")			
		this.modify ("gb_7.y=760")		
		this.modify ("docac.y=648")	
		this.modify ("nombreac.y=648")	
		this.modify ("telac.y=648")	
		this.modify ("docac_t.y=588")	
		this.modify ("nombreac_t.y=588")	
		this.modify ("telac_t.y=588")	
		this.modify ("gb_1.y=532")	
		this.modify ("gb_5.y=532")
		this.modify ("clasif.y=648")
		this.modify ("gb_3.y=376")
		this.modify ("cod_rips.y=440")
		this.modify ("desdiag.y=440")
	end if
end if

if getcolumnname()='fechaingreso' then
	datetime fech,fech1
	if tipo_ingres<>'4'  and tab_1.tabpage_1.cbx_res.checked=false then
		fech=datetime(date(left(data,10)))
		fech1=datetime(RelativeDate(date(fech),-60))
		if  (fech<fech1) or (fech>datetime(today()))   then 
			setitem(1,getcolumn(),getitemdatetime(1,'fechaingreso'))
			settext(string(getitemdatetime(1,'fechaingreso')))
			return 1
		end if
	end if
	tab_1.tabpage_2.em_1.text=string(fech,"dd/mm/yyyy")
	long contador,cuantos
	string clug_his
	contador=getitemnumber(1,'contador')
	if not isnull(contador) then
		clug_his=getitemstring(1,'clugar_his')
		select count(nservicio) into :cuantos from serviciosingreso where contador=:contador and clugar=:clug_his and fecha<:fech;
		if cuantos>0 then
			setitem(1,getcolumn(),getitemdatetime(1,'fechaingreso'))
			settext(string(getitemdatetime(1,'fechaingreso')))
			messagebox('Atención','Hay '+string(cuantos)+' servicios que fueron prestados o suministrados antes de esta fecha')
			return 1
		end if
		if tab_1.tabpage_2.dw_3.rowcount()>0 then
			tab_1.tabpage_2.dw_3.setitem(tab_1.tabpage_2.dw_3.rowcount(),'fecha',fech)
		end if
	end if
end if

accepttext()
guardo=false


end event

event retrieveend;if rowcount<1 then 
	tab_1.tabpage_1.dw_facts.reset()
	return
end if
string clug_hadm

long nh
nh=getitemnumber(1,"nh")
clug_hadm=getitemstring(1,"clugar")
tab_1.tabpage_1.dw_facts.retrieve(nh,clug_hadm,tipo_ingres)
tab_1.tabpage_2.dw_3.retrieve(nh,clug_hadm)
if tipo_ingres='2' then
	string enobserv
	setnull(enobserv)
	tab_1.tabpage_1.cbx_1.visible=true
	tab_1.tabpage_1.cbx_1.enabled=true
	select en_observa into :enobserv from hospadmi where nh=:nh and clugar=:clug_hadm and codtingre='2';
	if enobserv='1' then tab_1.tabpage_1.cbx_1.checked=true
	if getitemstring(1,'estado')<>'1' then tab_1.tabpage_1.cbx_1.enabled=false
end if
if getitemstring(1,'estado')='6' then
	pb_change_est.visible=true
else
	pb_change_est.visible=false
end if

setnull(enobserv)

select perte into :enobserv from hospadmi where nh=:nh and clugar=:clug_hadm and codtingre=:tipo_ingres;
if enobserv='1' then 
	tab_1.tabpage_1.pb_4.enabled=true
end if

	if idw_viaing.getitemstring(idw_viaing.getrow(),'accion')='1' then
		this.modify ("gb_6.visible=1")
		this.modify ("gb_6.height=308")		
		this.modify ("t_6.visible=1")
		this.modify ("t_7.visible=1")
		this.modify ("t_9.visible=1")
		this.modify ("t_8.visible=1")		
		this.modify ("c_ips_remite.visible=1")	
		this.modify ("prof_recibe.visible=1")	
		this.modify ("fecha_notifica.visible=1")	
		this.modify ("fecha_aceptacion.visible=1")	
		this.modify ("observaciones.y=1208")
		this.modify ("siras.y=1208")
		this.modify ("observaciones_t.y=1148")
		this.modify ("t_10.y=1148")
		this.modify ("gb_7.y=1088")	
		this.modify ("docac.y=972")	
		this.modify ("nombreac.y=972")	
		this.modify ("telac.y=972")		
		this.modify ("docac_t.y=912")	
		this.modify ("nombreac_t.y=912")	
		this.modify ("telac_t.y=912")	
		this.modify ("gb_1.y=856")		
		this.modify ("gb_5.y=856")
		this.modify ("clasif.y=972")
		this.modify ("gb_3.y=700")
		this.modify ("cod_rips.y=764")
		this.modify ("desdiag.y=764")
	else
		this.modify ("gb_6.visible=0")
		this.modify ("gb_6.height=224")			
		this.modify ("t_6.visible=0")
		this.modify ("t_7.visible=0")
		this.modify ("t_9.visible=0")
		this.modify ("t_8.visible=0")		
		this.modify ("c_ips_remite.visible=0")	
		this.modify ("prof_recibe.visible=0")	
		this.modify ("fecha_notifica.visible=0")	
		this.modify ("fecha_aceptacion.visible=0")		
		this.modify ("observaciones.y=860")
		this.modify ("siras.y=860")
		this.modify ("observaciones_t.y=800")
		this.modify ("t_10.y=800")			
		this.modify ("gb_7.y=760")		
		this.modify ("docac.y=648")	
		this.modify ("nombreac.y=648")	
		this.modify ("telac.y=648")	
		this.modify ("docac_t.y=588")	
		this.modify ("nombreac_t.y=588")	
		this.modify ("telac_t.y=588")	
		this.modify ("gb_1.y=532")	
		this.modify ("gb_5.y=532")
		this.modify ("clasif.y=648")
		this.modify ("gb_3.y=376")
		this.modify ("cod_rips.y=440")
		this.modify ("desdiag.y=440")
	end if
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5106
integer height = 1488
long backcolor = 67108864
string text = "Camas / Traslados"
long tabtextcolor = 33554432
string picturename = "camas.ico"
long picturemaskcolor = 536870912
st_5 st_5
st_4 st_4
pb_2 pb_2
pb_anula_trasl pb_anula_trasl
em_2 em_2
em_1 em_1
pb_trasl pb_trasl
dw_1 dw_1
dw_3 dw_3
gb_1 gb_1
end type

on tabpage_2.create
this.st_5=create st_5
this.st_4=create st_4
this.pb_2=create pb_2
this.pb_anula_trasl=create pb_anula_trasl
this.em_2=create em_2
this.em_1=create em_1
this.pb_trasl=create pb_trasl
this.dw_1=create dw_1
this.dw_3=create dw_3
this.gb_1=create gb_1
this.Control[]={this.st_5,&
this.st_4,&
this.pb_2,&
this.pb_anula_trasl,&
this.em_2,&
this.em_1,&
this.pb_trasl,&
this.dw_1,&
this.dw_3,&
this.gb_1}
end on

on tabpage_2.destroy
destroy(this.st_5)
destroy(this.st_4)
destroy(this.pb_2)
destroy(this.pb_anula_trasl)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.pb_trasl)
destroy(this.dw_1)
destroy(this.dw_3)
destroy(this.gb_1)
end on

type st_5 from statictext within tabpage_2
integer x = 32
integer y = 236
integer width = 773
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de Traslados del Paciente:"
boolean focusrectangle = false
end type

type st_4 from statictext within tabpage_2
integer x = 3689
integer y = 408
integer width = 471
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha Inicio Traslado"
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_2 from picturebutton within tabpage_2
integer x = 2528
integer y = 84
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "buscar2.gif"
string powertiptext = "Buscar Camas Libres"
end type

event clicked;if tipo_ingres='' or tab_1.tabpage_1.dw_admi.rowcount()=0 then return
openwithparm(w_cama_libre,tipo_ingres)
end event

type pb_anula_trasl from picturebutton within tabpage_2
event mousemove pbm_mousemove
integer x = 3931
integer y = 488
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Anular Traslado"
end type

event clicked;if f_permiso_boton(this,'ADM')=0 then return
if tab_1.tabpage_1.dw_admi.rowcount()=0 then return
if tab_1.tabpage_1.dw_admi.getitemstring(1,"estado")<>"1" then return
if dw_3.rowcount()=0 then return
if dw_3.getrow()>1 then
	messagebox("Atención","Solo puede anular el último traslado hecho")
	return
end if
string pabe,habi,cam,snulo,clug_hadm
datetime fecha,fnula
long ntraslado,nh,nulo
setnull(fnula)
setnull(nulo)
setnull(snulo)
pabe=dw_3.getitemstring(1,"codser")
habi=dw_3.getitemstring(1,"codhab")
cam=dw_3.getitemstring(1,"codcama")
nh=tab_1.tabpage_1.dw_admi.getitemnumber(1,"nh")
clug_hadm=tab_1.tabpage_1.dw_admi.getitemstring(1,"clugar")
fecha=datetime(date(em_1.text),time(em_2.text))
if messagebox("Atención","Está seguro que desea anular este traslado",question!,yesno!,1)=2 then return
if dw_3.rowcount()=1 then
	if cama='' then
		if tipo_ingres='3' then
			messagebox("Atención","Debe escoger una nueva cama para poder anular el traslado")
			return
		else
			if messagebox("Atención","No ha escogido una nueva cama. Desea seguir aún así y no asignarle cama al paciente?",question!,yesno!,2)=2 then return
			update camas set tipodoc=:snulo , documento=:snulo , ningreso=:nulo , clugar_ing=:snulo , tingreso=:snulo where codser=:pabe and codhab=:habi and codigocama=:cam;
			if sqlca.sqlcode=-1 then
				messagebox("Error actualizando estado de cama",sqlca.sqlerrtext)
				rollback;
				return
			end if
			dw_3.setitem(2,'fecha_sale',fnula)
			dw_3.deleterow(1)
			if dw_3.update()=-1 then 
				rollback;
				return
			end if
		end if
	else //si seleccionó la nueva cama => borra el ultimo pero crea un nuevo registro
		update camas set tipodoc=:snulo , documento=:snulo , ningreso=:nulo , clugar_ing=:snulo , tingreso=:snulo where codser=:pabe and codhab=:habi and codigocama=:cam;
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando estado de cama",sqlca.sqlerrtext)
			rollback;
			return
		end if
		dw_3.deleterow(1)
		if dw_3.update()=-1 then 
			rollback;
			return
		end if
		select max(ntraslado) into :ntraslado from hosptrasl where nh=:nh and clugar=:clug_hadm;
		if isnull(ntraslado) then ntraslado=0
		ntraslado++
		dw_3.insertrow(1)
		dw_3.Setitem(1,"Fecha",Fecha)
		dw_3.Setitem(1,"ntraslado",ntraslado)
		dw_3.Setitem(1,"CodTIngre",tipo_ingres)
		dw_3.Setitem(1,"Usuario",usuario)
		dw_3.setitem(1,"nh",nh)
		dw_3.setitem(1,"clugar",clug_hadm)
		dw_3.setitem(1,"codcama",cama)
		dw_3.setitem(1,"codser",pabellon)
		dw_3.setitem(1,"codhab", habitacion)
		dw_3.setitem(2,'fecha_sale',fecha)
		If dw_3.update()=-1 then
			rollback;
			return
		End If
		dw_3.retrieve(nh,clug_hadm)
		update camas set tipodoc=null, documento=null,ningreso=null,tingreso=null,clugar_ing=null where tipodoc=:tipdoc and documento=:docu and cluga=:clug_hadm;
		if sqlca.sqlcode=-1 then
			messagebox("Error actualizando estado de cama",sqlca.sqlerrtext)
			rollback;
			tab_1.tabpage_2.dw_1.triggerevent(constructor!)
			return
		End If
		update camas set tipodoc=:tipdoc, documento=:docu,ningreso=:nh,tingreso=:tipo_ingres,clugar_ing=:clugar_ing where codser=:pabellon and codhab=:habitacion and codigocama=:cama and documento is null and cluga=:clug_hadm;
		if sqlca.sqlcode=-1 or sqlca.sqlnrows=0 then
			messagebox("Error actualizando estado de cama",sqlca.sqlerrtext)
			rollback;
			tab_1.tabpage_2.dw_1.triggerevent(constructor!)
			return
		End If
		tab_1.tabpage_2.dw_1.triggerevent(constructor!)
	end if
else 	//tiene mas de un traslado entonces debe revisar que
		//la anterior cama no este ocupada
	string pabe_ante,habi_ante,cama_ante,estado=''
	pabe_ante=dw_3.getitemstring(2,"codser")
	habi_ante=dw_3.getitemstring(2,"codhab")
	cama_ante=dw_3.getitemstring(2,"codcama")
	select documento into :estado from camas where codser=:pabe_ante and codhab=:habi_ante and codigocama=:cama_ante and clugar=:clug_hadm;
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo estado de cama anterior",sqlca.sqlerrtext)
		rollback;
		return
	end if
	if not isnull(estado) then
		messagebox("Atención","La cama anterior en la que estaba el paciente no está desocupada, por lo tanto no puede anular este traslado")
		return
	end if
	dw_3.setitem(2,'fecha_sale',fnula)
	dw_3.deleterow(1)
	if dw_3.update()=-1 then
		rollback;
		return
	end if
	update camas set tipodoc=:snulo, documento=:snulo,ningreso=:nulo,tingreso=:snulo,clugar_ing=:snulo where codser=:pabe and codhab=:habi and codigocama=:cam and cluga=:clug_hadm;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando estado de cama actual",sqlca.sqlerrtext)
		rollback;
		return
	end if
	update camas set tipodoc=:tipdoc, documento=:docu,ningreso=:nh,tingreso=:tipo_ingres,clugar_ing=:clugar_ing where codser=:pabe_ante and codhab=:habi_ante and codigocama=:cama_ante and documento is null and cluga=:clug_hadm;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando estado de cama anterior",sqlca.sqlerrtext)
		rollback;
		return
	end if
	if sqlca.sqlnrows=0 then
		messagebox("Error actualizando estado de cama anterior","La cama anterior ya no está desocupada")
		rollback;
		return
	end if
	tab_1.tabpage_2.dw_1.triggerevent(constructor!)
end if
commit;
		
end event

type em_2 from editmask within tabpage_2
integer x = 4000
integer y = 332
integer width = 178
integer height = 72
integer taborder = 80
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
string mask = "HH:mm"
end type

event constructor;text=string(now(),"HH:mm")
end event

type em_1 from editmask within tabpage_2
integer x = 3666
integer y = 332
integer width = 302
integer height = 72
integer taborder = 70
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
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
end type

event constructor;text=string(today(),"dd/mm/yyyy")

end event

event modified;date esta
datetime compara,sale
esta=date(text)
if esta>today() then
	messagebox('Atención','Esta fecha es mayor a la de hoy')
	text=string(today(),'dd/mm/yyyy')
	em_2.text=string(now(),'HH:mm')
	return -1
end if
if dw_3.rowcount()>0 then
	compara=dw_3.getitemdatetime(1,'fecha')
else
	compara=datetime(date(tab_1.tabpage_1.dw_admi.getitemdatetime(1,'fechaingreso')),time(tab_1.tabpage_1.dw_admi.getitemdatetime(1,'horaingreso')))
end if
if tab_1.tabpage_3.dw_sale.rowcount()>0 then
	sale=datetime(date(tab_1.tabpage_3.dw_sale.getitemdatetime(1,'fechaegreso')),time(tab_1.tabpage_3.dw_sale.getitemdatetime(1,'horaegreso')))
else
	setnull(sale)
end if
if esta<date(compara) or esta>date(sale) then
	messagebox('Atención','Esta fecha es menor a la de la admisión o al anterior traslado o a la de egreso')
	text=string(date(compara),'dd/mm/yyyy')
	em_2.text=string(time(compara),'HH:mm')
	return -1
end if
return 1
end event

type pb_trasl from picturebutton within tabpage_2
event mousemove pbm_mousemove
integer x = 3753
integer y = 488
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Realizar Traslado"
end type

event clicked;if f_permiso_boton(this,'ADM')=0 then return
if tab_1.tabpage_1.dw_admi.rowcount()=0 then return
if tab_1.tabpage_1.dw_admi.getitemstring(1,"estado")<>"1" then 
	messagebox("Atención",'Esta admisión ya se encuentra cerrada. No la puede modificar')
	return -1
end if
if cama="" or isnull(cama) then
	Messagebox("Atención","Para realizar el traslado debe escoger una cama")
	return -1
end if
if messagebox("Atención","Está seguro que desea realizar este traslado",question!,yesno!,1)=2 then return -1
datetime fecha
long ntraslado,nh,j
string clug_hadm
nh=tab_1.tabpage_1.dw_admi.getitemnumber(1,"nh")
clug_hadm=tab_1.tabpage_1.dw_admi.getitemstring(1,"clugar")
if dw_3.rowcount()>0 then
	fecha=datetime(date(em_1.text),time(em_2.text))
	if em_1.event modified()=-1 then return -1
	select max(ntraslado) into :ntraslado from hosptrasl where nh=:nh and clugar=:clug_hadm;
	if isnull(ntraslado) then ntraslado=0
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo HospTrasl",sqlca.sqlerrtext)
		return -1
	end if
	dw_3.setredraw(false)
	dw_3.setfilter('isnull(fecha_sale)')
	dw_3.filter()
	for j=1 to dw_3.rowcount()
		dw_3.setitem(j,'fecha_sale',fecha)
	next
	dw_3.setfilter('')
	dw_3.filter()
	dw_3.sort()
	ntraslado++
	dw_3.insertrow(1)
	dw_3.Setitem(1,"Fecha",Fecha)
	dw_3.Setitem(1,"ntraslado",ntraslado)
	dw_3.Setitem(1,"CodTIngre",tipo_ingres)
	dw_3.Setitem(1,"Usuario",usuario)
	dw_3.setitem(1,"nh",nh)
	dw_3.setitem(1,"clugar",clug_hadm)
	dw_3.setitem(1,"codcama",cama)
	dw_3.setitem(1,"codser",pabellon)
	dw_3.setitem(1,"codhab", habitacion)
	dw_3.setitem(1,"clugar_cam", clugar)
	If dw_3.update()=-1 then
		rollback;
		return -1
	End If
	dw_3.retrieve(nh,clug_hadm)
	dw_3.setredraw(true)
	if tipo_ingres='2' then
		tab_1.tabpage_1.dw_admi.setitem(1,"en_observa",'1')
		tab_1.tabpage_1.dw_admi.update()
	end if
	update camas set tipodoc=null, documento=null,ningreso=null,tingreso=null,clugar_ing=null 
	where tipodoc=:tipdoc and documento=:docu;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando estado de cama",sqlca.sqlerrtext)
		rollback;
		tab_1.tabpage_2.dw_1.triggerevent(constructor!)
		return -1
	End If
	update camas set tipodoc=:tipdoc, documento=:docu,ningreso=:nh,tingreso=:tipo_ingres,clugar_ing=:clugar_ing 
	where codser=:pabellon and clugar=:clugar and codhab=:habitacion and codigocama=:cama and documento is null ;
	if sqlca.sqlcode=-1 or sqlca.sqlnrows=0 then
		messagebox("Error actualizando estado de cama",sqlca.sqlerrtext)
		rollback;
		tab_1.tabpage_2.dw_1.triggerevent(constructor!)
		return -1
	End If
	commit;
	tab_1.tabpage_2.dw_1.triggerevent(constructor!)
else
	Messagebox("Atención","Debe guardar primero el ingreso para poder realizar traslados de cama")
	return -1
end if

end event

type dw_1 from datawindow within tabpage_2
integer x = 14
integer y = 76
integer width = 2464
integer height = 144
integer taborder = 70
string title = "none"
string dataobject = "dw_camaubi"
boolean border = false
boolean livescroll = true
end type

event itemchanged;If getcolumnname() = "codser" then
	accepttext()
	Pabellon=gettext()
	hab.retrieve(pabellon,clugar)
	camas.reset()
	setitem(1,"codhab","")
	setitem(1,"Codcama","")
	habitacion=""
	cama=""
End If
If getcolumnname() = "codhab" then
	accepttext()
	Habitacion=gettext()
	if isnull(habitacion) then return
	camas.retrieve(pabellon,clugar,habitacion,tipo_ingres)
	setitem(1,"Codcama","")
	cama=""
End If
If getcolumnname() = "codcama" then
	accepttext()
	cama=gettext()
End If
end event

event constructor;reset()
settransobject(sqlca)
getchild('codser',pab)
getchild('codhab',Hab)
getchild('codcama',camas)
pab.settransobject(sqlca)
Hab.settransobject(sqlca)
camas.settransobject(sqlca)
hab.reset()
camas.reset()
hab.insertrow(1)
camas.insertrow(1)
pab.retrieve(clugar)
pabellon = ''
cama = ''
habitacion = ''
Insertrow(1)

end event

type dw_3 from datawindow within tabpage_2
integer x = 32
integer y = 292
integer width = 3538
integer height = 1160
integer taborder = 30
string title = "none"
string dataobject = "dw_hiscama"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event clicked;if row >1 then scrolltorow(row)
end event

type gb_1 from groupbox within tabpage_2
integer x = 3621
integer y = 264
integer width = 590
integer height = 408
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Traslados:"
end type

type tab_note from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5106
integer height = 1488
long backcolor = 67108864
string text = "Observaciones"
long tabtextcolor = 33554432
string picturename = "notas_adm.ico"
long picturemaskcolor = 536870912
pb_guao pb_guao
pb_boro pb_boro
pb_newo pb_newo
dw_obs dw_obs
end type

on tab_note.create
this.pb_guao=create pb_guao
this.pb_boro=create pb_boro
this.pb_newo=create pb_newo
this.dw_obs=create dw_obs
this.Control[]={this.pb_guao,&
this.pb_boro,&
this.pb_newo,&
this.dw_obs}
end on

on tab_note.destroy
destroy(this.pb_guao)
destroy(this.pb_boro)
destroy(this.pb_newo)
destroy(this.dw_obs)
end on

type pb_guao from picturebutton within tab_note
integer x = 4082
integer y = 312
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "guardar2.gif"
alignment htextalign = left!
string powertiptext = "Guarda Observaciones"
end type

event clicked;if f_permiso_boton(this,'ADM')=0 then return
if tab_1.tabpage_1.dw_admi.getitemstring(1,"estado")<>"1" then 
	messagebox("Atención",'Esta admisión ya se encuentra cerrada. No la puede modificar')
	return 
end if
if dw_obs.update(true,false)=-1 then
	rollback;
	return 
end if
commit;
tab_1.tab_note.dw_obs.retrieve(tab_1.tabpage_1.dw_admi.getitemnumber(1,"nh"),tab_1.tabpage_1.dw_admi.getitemstring(1,"clugar"),tipo_ingres)
end event

type pb_boro from picturebutton within tab_note
integer x = 4082
integer y = 176
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "anulardoc.gif"
alignment htextalign = left!
string powertiptext = "Inactivar Observaciones"
end type

event clicked;if f_permiso_boton(this,'ADM')=0 then return
if tab_1.tabpage_1.dw_admi.getitemstring(1,"estado")<>"1" then 
	messagebox("Atención",'Esta admisión ya se encuentra cerrada. No la puede modificar')
	return 
end if

If messageBox('Atención','Está seguro de querer cambiar el estado de la observación ?',question!,yesno!,2) = 2 then Return 

long num_hosp,item,fila
string clug_hadm,diaging
fila=dw_obs.getrow()
clug_hadm=dw_obs.getitemstring(fila,"clugar")
num_hosp=dw_obs.getitemnumber(fila,"nh")
item=dw_obs.getitemnumber(fila,"item")
st_xa_anular st_anula
st_anula.tipo='AB'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return
datetime fec_anu
fec_anu=datetime(today(),now())
update hospadmi_obs set estado='2',fecha_anula =:fec_anu,motiv_anula=:st_anula.observacion,cod_anula=:st_anula.motivo,usu_anula =:usuario
where nh=:num_hosp and codtingre=:tipo_ingres and clugar=:clug_hadm and item=:item;
if sqlca.sqlcode=-1 then 
	messagebox("Error actualizando el estado de Admisión Observacion",sqlca.sqlerrtext)
	rollback;
	RETURN
end if
commit;
dw_obs.ReselectRow(fila) 
end event

type pb_newo from picturebutton within tab_note
integer x = 4082
integer y = 36
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.GIF"
alignment htextalign = left!
string powertiptext = "Nueva Observación"
end type

event clicked;if f_permiso_boton(this,'ADM')=0 then return
if tab_1.tabpage_1.dw_admi.rowcount()<1 then return
if w_principal.dw_1.getitemstring(1,'estado')='1' then
  messagebox("Atención","Este Paciente esta Fallecido no puede adicionar Observaciones")
  return
end if
if tab_1.tabpage_1.dw_admi.getitemstring(1,"estado")<>"1" then 
	messagebox("Atención",'Esta admisión ya se encuentra cerrada. No la puede modificar')
	return -1
end if
int maximo,fila
maximo=dw_obs.getitemnumber(1,'maximos')
if isnull(maximo) then maximo=0
maximo++
fila=dw_obs.insertrow(0)
dw_obs.setitem(fila,"nh",tab_1.tabpage_1.dw_admi.getitemnumber(1,"nh"))
dw_obs.setitem(fila,"clugar",clugar)
dw_obs.setitem(fila,"CodTIngre",tipo_ingres)
dw_obs.setitem(fila,"item",maximo)
dw_obs.Setitem(fila,"Usuario",usuario)
dw_obs.setitem(fila,"fecha",datetime(today(),time(string(now()))))
end event

type dw_obs from datawindow within tab_note
integer x = 46
integer y = 24
integer width = 3995
integer height = 1380
integer taborder = 90
string dataobject = "dw_hospadmi_obs"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5106
integer height = 1488
long backcolor = 67108864
string text = "Egresos"
long tabtextcolor = 33554432
string picturename = "anula_salida.ico"
long picturemaskcolor = 536870912
pb_6 pb_6
pb_print_sal pb_print_sal
pb_1 pb_1
pb_print_catas pb_print_catas
pb_egreso pb_egreso
st_diagsal st_diagsal
dw_sale dw_sale
pb_guardaegres pb_guardaegres
end type

on tabpage_3.create
this.pb_6=create pb_6
this.pb_print_sal=create pb_print_sal
this.pb_1=create pb_1
this.pb_print_catas=create pb_print_catas
this.pb_egreso=create pb_egreso
this.st_diagsal=create st_diagsal
this.dw_sale=create dw_sale
this.pb_guardaegres=create pb_guardaegres
this.Control[]={this.pb_6,&
this.pb_print_sal,&
this.pb_1,&
this.pb_print_catas,&
this.pb_egreso,&
this.st_diagsal,&
this.dw_sale,&
this.pb_guardaegres}
end on

on tabpage_3.destroy
destroy(this.pb_6)
destroy(this.pb_print_sal)
destroy(this.pb_1)
destroy(this.pb_print_catas)
destroy(this.pb_egreso)
destroy(this.st_diagsal)
destroy(this.dw_sale)
destroy(this.pb_guardaegres)
end on

type pb_6 from pb_report within tabpage_3
integer x = 3374
integer y = 1108
integer taborder = 55
string picturename = "hmedica.gif"
string disabledname = "d_hmedica.gif"
string cod_rep = "HMD"
string nombre_rep = "HOJA MEDICAMENTOS"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;any par[2]
par[1]=dw_historial.getitemnumber(dw_historial.getrow(),"contador")
par[2]=dw_historial.getitemstring(dw_historial.getrow(),"clugar")
imprimir(par,'','0')

end event

type pb_print_sal from pb_report within tabpage_3
integer x = 3355
integer y = 496
integer taborder = 60
string text = "        &e"
string powertiptext = "Imprimir Egreso [Alt+E]"
string cod_rep = "EGHU"
string nombre_rep = "Egreso Urg/Hosp."
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;if dw_sale.rowcount()<1 then return
any par[1]
par[1]=dw_sale.getitemnumber(1,"nsalida")
imprimir(par,'','0')

end event

type pb_1 from pb_report within tabpage_3
integer x = 3355
integer y = 628
integer taborder = 80
string text = "        &b"
string picturename = "Ambulan.jpg"
string disabledname = "BorderBox!"
string powertiptext = "Imprimir Reporte de Ambulancia [Alt+B]"
string cod_rep = "AM"
string nombre_rep = "Reporte de Transporte en ambulancia"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;if tab_1.tabpage_1.dw_admi.rowcount()=0 then return
any par[2]
par[1]=tab_1.tabpage_1.dw_admi.getitemnumber(1,"nh")
par[2]=tab_1.tabpage_1.dw_admi.getitemstring(1,"clugar")
imprimir(par,'','0')


end event

type pb_print_catas from pb_report within tabpage_3
integer x = 3355
integer y = 760
integer taborder = 90
string text = "       &v"
string picturename = "hombre.gif"
string disabledname = "d_hombre.gif"
string powertiptext = "Imprimir Reporte de Evento Catastrófico [Alt+V]"
string cod_rep = "ECAT"
string nombre_rep = "Evento catastrófico"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;if dw_historial.rowcount()=0 then return
any par[2]
par[1]=dw_historial.getitemnumber(dw_historial.getrow(),"contador")
par[2]=dw_historial.getitemstring(dw_historial.getrow(),"clugar")
imprimir(par,'','0')

end event

type pb_egreso from picturebutton within tabpage_3
event mousemove pbm_mousemove
integer x = 3355
integer y = 232
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &s"
boolean originalsize = true
string picturename = "puerta.gif"
string disabledname = "d_puerta.gif"
alignment htextalign = left!
string powertiptext = "Ingresar datos Salida [Alt+S]"
end type

event clicked;if tab_1.tabpage_1.dw_admi.rowcount()=0 then return
if tab_1.tabpage_1.dw_admi.getitemstring(1,'estado')='6' then return
open(w_audita)
if continua='no' then return
string clug_hadm,clug_his
long nh,conta
nh=tab_1.tabpage_1.dw_admi.getitemnumber(1,"nh")
clug_hadm=tab_1.tabpage_1.dw_admi.getitemstring(1,"clugar")
conta=tab_1.tabpage_1.dw_admi.getitemnumber(1,"contador")
clug_his=tab_1.tabpage_1.dw_admi.getitemstring(1,"clugar_his")
if rn(nh,clug_hadm)=-1 then 
	messagebox("Atención","Debe digitar los datos de RIPS Recien Nacido para poder continuar")
	return
end if

long no_pos
setnull(no_pos)

select count(1) into :no_pos
from hclin_registro
where  (((contador)=:conta) and ((clugar)=:clug_his));
if no_pos>0 then 
	setnull(no_pos)
	select count(1) into :no_pos
	from 
		((resultadoscab inner join resultadoscpo on (resultadoscab.nrepor = resultadoscpo.nrepor) 
		and (resultadoscab.clugar = resultadoscpo.clugar) and (resultadoscab.coddoc = resultadoscpo.coddoc)) 
		inner join serviciosadx on (resultadoscpo.item = serviciosadx.item) and (resultadoscpo.nrepor = serviciosadx.nrepor) 
		and (resultadoscpo.clugar = serviciosadx.clugar_res) and (resultadoscpo.coddoc = serviciosadx.coddoc)) 
		inner join ingresoadx on (serviciosadx.ningreso = ingresoadx.ningreso) and (serviciosadx.codaadx = ingresoadx.codaadx) 
		and (serviciosadx.clugar = ingresoadx.clugar)
	where 
		(((resultadoscpo.contador_hc) is null) and ((serviciosadx.estado)='7') 
		and ((ingresoadx.contador)=:conta) and ((ingresoadx.clugar_his)=:clug_his));
	if no_pos>0 then 
		messagebox("Atención","Esta admisión tiene "+string(no_pos) +" resaultados sin llevar a HC")
		return
	end if
	
	setnull(no_pos)
	SELECT Sum(entregada-suministrada-devuelta) into :no_pos
	FROM hospadmi INNER JOIN oscuerpo ON (hospadmi.clugar_his = oscuerpo.clugar) AND (hospadmi.contador = oscuerpo.contador)
	WHERE (((hospadmi.nh)=:nh) AND ((hospadmi.clugar)=:clug_hadm) AND ((hospadmi.codtingre)=:tipo_ingres));
	if no_pos>0 then 
		messagebox("Atención","Esta admisión tiene "+string(no_pos) +" productos sin atender o devolver")
		return
	end if
	
	setnull(no_pos)
	select count(sum_mvto_cab.numdoc) into :no_pos
		from (sum_mvto_cab inner join sum_mvto_cpo on (sum_mvto_cab.numdoc = sum_mvto_cpo.numdoc) and (sum_mvto_cab.clugar = sum_mvto_cpo.clugar) and (sum_mvto_cab.coddoc = sum_mvto_cpo.coddoc)) inner join (((sum_mvto_cpo as sum_mvto_cpo_1 inner join oscuerpo on (sum_mvto_cpo_1.item_os = oscuerpo.item) and (sum_mvto_cpo_1.nsolicitud_os = oscuerpo.nsolicitud) and (sum_mvto_cpo_1.clugar_os = oscuerpo.clugar) and (sum_mvto_cpo_1.contador_os = oscuerpo.contador)) inner join hospadmi on (oscuerpo.clugar = hospadmi.clugar_his) and (oscuerpo.contador = hospadmi.contador)) inner join pacientes on (hospadmi.documento = pacientes.documento) and (hospadmi.tipodoc = pacientes.tipodoc)) on (sum_mvto_cpo.item_ori = sum_mvto_cpo_1.item) and (sum_mvto_cpo.numdoc_ori = sum_mvto_cpo_1.numdoc) and (sum_mvto_cpo.clugar_ori = sum_mvto_cpo_1.clugar) and (sum_mvto_cpo.coddoc_ori = sum_mvto_cpo_1.coddoc)
		where (((sum_mvto_cab.coddoc)='DEVF') and ((sum_mvto_cpo.control)='0') and ((sum_mvto_cab.estado)<>'2') and ((hospadmi.nh)=:nh) and ((hospadmi.clugar)=:clug_hadm) and ((hospadmi.codtingre)=:tipo_ingres));
	if  no_pos>0 then
		messagebox("Atención",'Paciente con Devoluciones Pendientes por confirmar')	
		return	
	end if
end if

if dw_sale.rowcount()=0 then
	if messagebox("Atención","Este paciente no tiene salida, desea realizar la salida aún así?",question!,yesno!,2)=2 then return
	dw_sale.insertrow(1)
	dw_sale.setitem(1,"nhosp",nh)
	dw_sale.setitem(1,"clugar_hadm",clug_hadm)
	dw_sale.setitem(1,"codtingre",tipo_ingres)
end if
dw_sale.setitem(1,"cusuario",usuario)
dw_sale.setitem(1,"fechaegreso",datetime(today()))
dw_sale.setitem(1,"horaegreso",datetime(date("1/1/1900"),time(string(now()))))

dw_sale.setitem(1,"fecha_notifica",   datetime(today(),time(string(now()))))
dw_sale.setitem(1,"fecha_aceptacion",datetime(today(),time(string(now()))))

string ding
ding=tab_1.tabpage_1.dw_admi.getitemstring(1,"diagingre")
if ding<>"" then dw_sale.setitem(1,"diagingre",ding)
dw_sale.setcolumn("fechaegreso")
dw_sale.triggerevent(itemchanged!)
enabled=false
end event

type st_diagsal from statictext within tabpage_3
integer x = 229
integer y = 1348
integer width = 2962
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_sale from datawindow within tabpage_3
integer x = 151
integer width = 3378
integer height = 1340
integer taborder = 80
string title = "none"
string dataobject = "dw_salida"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild('conductaurg',idw_destino)
idw_destino.settransobject(sqlca)
end event

event itemchanged;string colum,nulo
st_return_diags st

colum=getcolumnname()
setnull(nulo)
choose case colum
	case "horaegreso"
		accepttext()
		setcolumn("fechaegreso")
		triggerevent(itemchanged!)
	case "fechaegreso"
		accepttext()
		date ingreso,sale
		time hentra,hsale
		int cuantos
		ingreso=date(tab_1.tabpage_1.dw_admi.getitemdatetime(1,"fechaingreso"))
		sale=date(getitemdatetime(1,"fechaegreso"))
		hentra=time(tab_1.tabpage_1.dw_admi.getitemdatetime(1,"horaingreso"))
		hsale=time(getitemdatetime(1,"horaegreso"))
		if sale<ingreso then
			setitem(1,"fechaegreso",datetime(today()))
			setitem(1,"diasestancia",daysafter(ingreso,today()))
			return 1
		end if
		cuantos=daysafter(ingreso,sale)
		setitem(1,"diasestancia",cuantos)
		if tab_1.tabpage_1.dw_admi.getitemstring(1,"en_observa")='1' then
			cuantos=cuantos*24
			cuantos+=int((secondsafter(hentra,hsale)/3600))
			setitem(1,"horasobserva",cuantos)
		end if
	case "diagingre_","diagegreso_","diagegreso1_","diagegreso2_","diagcomplica_","causamuerte_"
		string este=''
		sex_busca=w_principal.dw_1.getitemstring(1,"sexo_t")
		edad_busca=w_principal.dw_1.getitemnumber(1,"dias")
		st=f_check_diag(data,sex_busca,edad_busca,este,'0')
		if st.descrip_diag="" then
			setitem(1,colum,"")
			setitem(1,left(colum,len(colum)-1),nulo)
			st_diagsal.text=""
			return 1
		else
			accepttext()
			setitem(1,left(colum,len(colum)-1),este)
			st_diagsal.text=st.descrip_diag
		end if
	case "estadosalida"
		accepttext()
		if data="1" then
			setnull(data)
			setitem(1,"causamuerte",data)
		end if
	case 'conductaurg'
		if idw_destino.getitemstring(idw_destino.getrow(),'accion')='1' then
			this.modify ("nivel.visible=1")
			this.modify ("t_3.visible=1")
			this.modify ("gb_4.visible=1")
			this.modify ("t_2.visible=1")
			this.modify ("t_5.visible=1")
			this.modify ("t_7.visible=1")
			this.modify ("t_8.visible=1")
			this.modify ("c_ips_remitir.visible=1")
			this.modify ("fecha_notifica.visible=1")
			this.modify ("prof_recibe.visible=1")
			this.modify ("t_6.visible=1")
			this.modify ("fecha_aceptacion.visible=1")
			this.modify ("cargo_profe_recibe.visible=1")
		else
			this.modify ("nivel.visible=0")
			this.modify ("t_3.visible=0")		
			this.modify ("gb_4.visible=0")
			this.modify ("t_2.visible=0")
			this.modify ("t_5.visible=0")
			this.modify ("t_7.visible=0")
			this.modify ("t_8.visible=0")
			this.modify ("c_ips_remitir.visible=0")
			this.modify ("fecha_notifica.visible=0")
			this.modify ("prof_recibe.visible=0")			
			this.modify ("t_6.visible=0")
			this.modify ("fecha_aceptacion.visible=0")
			this.modify ("cargo_profe_recibe.visible=0")			
		end if
		//if (tipo_ingres='3' or tipo_ingres='7') and (data='3' or data='7') then
		if (tipo_ingres='3' or tipo_ingres='7') and (idw_destino.getitemstring(idw_destino.getrow(),'accion')='1') then 
			setitem(1,'conductaurg',getitemstring(1,'conductaurg'))
			settext(getitemstring(1,'conductaurg'))
			return 1
		end if
		setitem(1,'c_ips_remitir',nulo)
end choose
setitem(1,"cusuario",usuario)
accepttext()
end event

event itemfocuschanged;string col
col=getcolumnname()
choose case col
	case "diagingre_","diagegreso_","diagegreso1_","diagegreso2_","diagcomplica_","causamuerte_"
		string data,este
		st_return_diags st
		
		data=getitemstring(1,getcolumnname())
		if data<>"" then
			sex_busca=w_principal.dw_1.getitemstring(1,"sexo_t")
			edad_busca=w_principal.dw_1.getitemnumber(1,"dias")
			este=getitemstring(1,left(col,len(col)-1))
			st=f_check_diag(data,sex_busca,edad_busca,este,'0')
			st_diagsal.text=st.descrip_diag
		else
			st_diagsal.text=""
		end if
end choose
end event

event doubleclicked;string nombre
nombre=getcolumnname()
choose case nombre
	case "diagingre_","diagegreso_","diagegreso1_","diagegreso2_","diagcomplica_","causamuerte_"
		st_edadsexo st_es
		st_diag st_d
		st_es.sexo=w_principal.dw_1.getitemstring(1,"sexo")
		st_es.edad=w_principal.dw_1.getitemnumber(1,"dias")
		st_es.antece='0'
		st_es.proced='0'		
		openwithparm(w_busca_diag,st_es)
		st_d=message.powerobjectparm
		if not isValid(st_d) then return
		if not isNull(st_d.codrip) then
			setitem(1,left(nombre,len(nombre)-1),st_d.codgeral)
			setitem(1,nombre,st_d.codrip)
			accepttext()
			st_diagsal.text=st_d.descripcion
		end if
end choose
	
end event

type pb_guardaegres from picturebutton within tabpage_3
event mousemove pbm_mousemove
integer x = 3355
integer y = 360
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &d"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
string powertiptext = "Guardar Salida [Alt+D]"
end type

event clicked;if dw_sale.rowcount()=0 then return
if f_permiso_boton(this,'ADM')=0 then return
long num_hosp
string clug_hadm,diaging
clug_hadm=tab_1.tabpage_1.dw_admi.getitemstring(1,"clugar")
num_hosp=tab_1.tabpage_1.dw_admi.getitemnumber(1,"nh")
if rn(num_hosp,clug_hadm)=-1 then 
	messagebox("Atención","Debe digitar los datos de RIPS Recien Nacido para poder continuar")
	return
end if
setnull(diaging)
select diagingre into :diaging from hospadmi where nh=:num_hosp and clugar=:clug_hadm and codtingre=:tipo_ingres;
if trim(diaging)="" or isnull(diaging) then 
	messagebox("Atención","Debe digitar el diagnóstico de Ingreso de esta admisión y guardarlo para poder grabar la salida")
	return
end if
if isnull(dw_sale.getitemdatetime(1,"fechaegreso")) or isnull(dw_sale.getitemdatetime(1,"horaegreso")) then 
	messagebox("Atención","La fecha/hora no puede estar en blanco")
	return
end if
dw_sale.accepttext()
if tab_1.tabpage_1.dw_admi.getitemstring(1,"estado")<>"1" then
	messagebox("Atención","Este ingreso ya se encuentra cerrado, no le puede realizar cambios")
	return
end if
if isnull(dw_sale.getitemstring(1,"cprof")) then
	messagebox("Atención","Elija el profesional")
	return
end if
if isnull(dw_sale.getitemstring(1,"diagegreso")) or dw_sale.getitemstring(1,"diagegreso")="" then
	messagebox("Atención","El diagnóstico de Egreso no puede ser vacio")
	return
end if
if tipo_ingres='2' and isnull(dw_sale.getitemstring(1,"conductaurg")) then
	messagebox("Atención","El Destino a la salida no puede ser nulo")
	return
end if
if isnull(dw_sale.getitemstring(1,"estadosalida")) then
	messagebox("Atención","El estado a la salida no puede ser vacio")
	return
end if
if dw_sale.getitemstring(1,"estadosalida")="2" and (isnull(dw_sale.getitemstring(1,"causamuerte")) or dw_sale.getitemstring(1,"causamuerte")="") then
	messagebox("Atención","El diagnóstico de Muerte no puede ser vacio")
	return
end if
if tab_1.tabpage_1.dw_Admi.getitemdatetime(1,"fechaingreso")>dw_sale.getitemdatetime(1,"fechaegreso") then
	messagebox("Error","La fecha de egreso no puede ser menor a la fecha de ingreso")
	return
end if

long cuantos,nsal
datetime fsale,fentra

fentra=tab_1.tabpage_1.dw_admi.getitemdatetime(1,"fechaingreso")
fsale=dw_sale.getitemdatetime(1,"fechaegreso")
select count(serviciosingreso.contador) into :cuantos
from hospadmi inner join serviciosingreso on (hospadmi.clugar_his = serviciosingreso.clugar) and (hospadmi.contador = serviciosingreso.contador)
where (((serviciosingreso.fecha)<:fentra and (serviciosingreso.fecha)>:fsale) and ((hospadmi.nh)=:num_hosp) and ((hospadmi.clugar)=:clug_hadm) and ((hospadmi.codtingre)=:tipo_ingres));
if cuantos>0 then
	messagebox("Error",'Hay servicios atendidos fuera del rango comprendido entre '+string(fentra,'dd/mm/yyyy')+' y el '+string(fsale,'dd/mm/yyyy'))
	dw_historial.triggerevent(rowfocuschanged!)
	rollback;
	return
end if
setnull(cuantos)
if messagebox("Atención","Está seguro que desea guardar el egreso del Paciente",question!,yesno!,1)= 2 then return
if isnull(dw_sale.getitemnumber(1,"nsalida")) then
	select count(nsalida) into :cuantos from hospsali where nhosp=:num_hosp and clugar_hadm=:clug_hadm;
	if cuantos>0 then
		messagebox("Error",'Ya existe una salida para esta admisión')
		dw_historial.triggerevent(rowfocuschanged!)
		rollback;
		return
	end if
	nsal=f_trae_ndoc('SAL',clugar,'SALIDA ADMISIONES')
	if nsal<0 then
		rollback;
		return
	end if
	dw_sale.setitem(1,"nsalida",nsal)
end if
dw_sale.setitem(1,"cusuario",usuario)
if dw_sale.update()= -1 then
	rollback;
	return
end if
update hospadmi set estado='2' where nh=:num_hosp and clugar=:clug_hadm and codtingre=:tipo_ingres;
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando el estado de Admisión",sqlca.sqlerrtext)
	rollback;
	return
end if
update camas set tipodoc= null , documento = null ,ningreso=null ,tingreso=null ,clugar_ing=null where ningreso=:num_hosp and clugar_ing=:clug_hadm ;
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando el estado de la Cama",sqlca.sqlerrtext)
	rollback;
	return
end if
commit;
dw_historial.setitem(dw_historial.getrow(),'estado','2')
dw_historial.resetupdate()
dw_historial.triggerevent(rowfocuschanged!)
if idw_destino.getitemstring(idw_destino.getrow(),'accion')='3' then 
//if dw_sale.getitemstring(1,"conductaurg")='3' then
	if messagebox("Atención","Desea realizar ahora un nuevo ingreso a Hospitalización ?.~r~nSi no lo ingresa ahora lo puede realizar luego normalmente.",question!,yesno!,2)=2 then return
	string diaeg,causaext
	long filas
	diaeg=dw_sale.getitemstring(1,"diagegreso")
	causaext=tab_1.tabpage_1.dw_admi.getitemstring(1,"causaexterna")
	dw_tingres.setitem(1,1,'3')
	dw_tingres.triggerevent(itemchanged!)
	tipo_ingres='3'
	filas=dw_historial.rowcount()
	pb_new.triggerevent(clicked!)
	if dw_historial.rowcount()=filas then return
	tab_1.tabpage_1.dw_admi.setitem(1,"causaexterna",causaext)
	tab_1.tabpage_1.dw_admi.setitem(1,"diagingre",diaeg)
	tab_1.tabpage_1.dw_admi.accepttext()
	tab_1.tabpage_1.dw_admi.setitem(1,"viaingreso",'1')
	tab_1.selectedtab=1
end if
if isvalid(w_new_at_os) then w_new_at_os.dw_tip_ingres.triggerevent(itemchanged!)
end event

type pb_del from picturebutton within w_admision
event mousemove pbm_mousemove
integer x = 1751
integer y = 380
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Admisión"
end type

event clicked;if tab_1.tabpage_1.dw_admi.rowcount()<1 then return 1
long nh,nsal,ingreqx
string clug_hadm,clug_his
clug_hadm=tab_1.tabpage_1.dw_admi.getitemstring(1,"clugar")
nh=tab_1.tabpage_1.dw_admi.getitemnumber(1,"nh")
if isnull(nh) then
	pb_new.enabled=true
	dw_historial.deleterow(dw_historial.getrow())
	guardo=true
	dw_historial.event rowfocuschanged(1)
	return
else
	if dw_historial.getitemstring(dw_historial.getrow(),'estado')='5' then
		messagebox('Atención','Esta admisión ya se encuentra anulada')
	else
		messagebox('Atención','Esta admisión ya no se puede borrar, lo que debe hacer es anularla por el menu de Hospitalización')
	end if
	return
end if

end event

type dw_emppac from datawindow within w_admision
integer x = 14
integer y = 68
integer width = 3109
integer height = 308
integer taborder = 20
string title = "none"
string dataobject = "dw_empacguarda"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_historial from datawindow within w_admision
event p_borrar ( long nfila )
integer x = 3163
integer y = 68
integer width = 2021
integer height = 420
integer taborder = 10
string title = "none"
string dataobject = "dw_historial_tipo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_borrar(long nfila);deleterow(nfila)

end event

event constructor;this.settransobject(sqlca)
end event

event rowfocuschanged;string ls_nul
long ll_nul
setnull(ls_nul)
setnull(ll_nul)
tab_1.tabpage_2.dw_3.reset()
tab_1.tabpage_3.dw_sale.reset()
if getrow()<1 then 
	tab_1.tabpage_1.dw_admi.reset()
	tab_1.tabpage_1.dw_facts.reset()
	tab_1.tabpage_3.dw_sale.reset()
	tab_1.tabpage_1.cbx_1.visible=false
	tab_1.tabpage_1.cbx_1.checked=false
	pb_catas.visible=false
	return
end if
clugar_ing=getitemstring(getrow(),"clugar")
if not isnull(getitemnumber(getrow(),"contador")) then 
	tab_1.tabpage_1.dw_admi.retrieve(getitemnumber(getrow(),"contador"),getitemstring(getrow(),"clugar"),l_aut,l_autc)
	if tab_1.tabpage_1.dw_admi.rowcount()>0 then
		tab_1.tabpage_3.dw_sale.retrieve(tab_1.tabpage_1.dw_admi.getitemnumber(1,"nh"),tab_1.tabpage_1.dw_admi.getitemstring(1,"clugar"),tipo_ingres)
		if  tab_1.tabpage_3.dw_sale.rowcount()>1 then 
			tab_1.tabpage_3.pb_egreso.enabled=false
		else
			tab_1.tabpage_3.pb_egreso.enabled=true
		end if
		tab_1.tab_note.dw_obs.retrieve(tab_1.tabpage_1.dw_admi.getitemnumber(1,"nh"),tab_1.tabpage_1.dw_admi.getitemstring(1,"clugar"),tipo_ingres)
	end if
	guardo=true
end if
if not isnull(getitemnumber(getrow(),'ncatastrofe')) then
	pb_catas.visible=true
	tab_1.tabpage_3.pb_print_catas.visible=true
else
	pb_catas.visible=false
	tab_1.tabpage_3.pb_print_catas.visible=false
end if
tab_1.tabpage_2.dw_1.triggerevent(constructor!)
end event

event rowfocuschanging;if currentrow <1 then return
int resp
resp=guardar()
choose case resp
	case 1
		return 1
	case 2
		pb_new.enabled=true
		if isnull(getitemnumber(currentrow,'contador')) then post event p_borrar(currentrow)
end choose
end event

event retrieveend;if rowcount=0 then 
	pb_catas.visible=false
	tab_1.tabpage_3.pb_print_catas.visible=false
end if
end event

type st_1 from statictext within w_admision
integer x = 14
integer y = 408
integer width = 393
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo &Ingreso:"
boolean focusrectangle = false
end type

type pb_new from picturebutton within w_admision
event mousemove pbm_mousemove
integer x = 1600
integer y = 380
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &n"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Nueva admisión [Alt+N]"
end type

event clicked;if f_permiso_boton(this,'ADM')=0 then return
if dw_emppac.rowcount()=0 then 
	messagebox("Atención","Este paciente no tiene una empresa responsable, asignele una en la ficha de pacientes")
	return
end if
if dw_emppac.getitemstring(dw_emppac.getrow(),'estado')<>'1' then
	messagebox("Atención","Este Contrato no está activo, no puede continuar")
	return
end if
if w_principal.dw_1.getitemstring(1,'estado')='1' then
  messagebox("Atención","Este Paciente esta Fallecido no puede adicionar Admision")
  return
end if
long nhosp,consec_soat,ncatas
string empr,contr,clugar_soat,clugar_catas
if tipo_ingres="" then
	Messagebox("Atención","Elija el tipo de ingreso para poder continuar")
	return
end if
empr=dw_emppac.getitemstring(dw_emppac.getrow(),"codemp")
contr=dw_emppac.getitemstring(dw_emppac.getrow(),"codcontrato")

setnull(nhosp)
SELECT Count(contratodet.cplan) into :nhosp
FROM contratodet
GROUP BY contratodet.cemp, contratodet.ccontrato, contratodet.codtingre
HAVING (((contratodet.cemp)=:empr) AND ((contratodet.ccontrato)=:contr) AND ((contratodet.codtingre)='2'));

if nhosp<=0 then 
	messagebox("Error","Este Contrato no tiene planes activos para este servicio")
	return
end if

setnull(nhosp)
if i_varios_ingre='0' then
	select nh into :nhosp from hospadmi where tipodoc=:tipdoc and documento=:docu and (estado='1' or (estado='2' and codtingre=:tipo_ingres));
	if not isnull(nhosp) then
		messagebox("Error","Este paciente tiene una admisión abierta o alguna sin facturarla o anularla")
		return
	end if
end if
open(w_alerta_deuda)
if message.stringparm='!' then return
setnull(consec_soat)
setnull(clugar_soat)
setnull(ncatas)
setnull(clugar_catas)
if dw_emppac.getitemstring(dw_emppac.getrow(),"soat")='1' then
	st_soat st
	st.nsoat=consec_soat
	st.newemp=dw_emppac.getitemstring(dw_emppac.getrow(),"codemp")
	st.newcont=dw_emppac.getitemstring(dw_emppac.getrow(),"codcontrato")
	openwithparm(w_soat,st)
	if message.stringparm="!" or not isvalid(message.powerobjectparm) then return
	st=message.powerobjectparm
	clugar_soat=st.clug_soat
	consec_soat=st.nsoat
end if
if dw_emppac.getitemstring(dw_emppac.getrow(),"catastrofe")='1' then
	openwithparm(w_catastrofes,'nuevo')
	trae trae2
	if message.stringparm="!" or not isvalid(message.powerobjectparm) then return
	pb_catas.visible=true
	trae2=message.PowerObjectParm
	ncatas=trae2.numero
	clugar_catas=trae2.lugar
	tab_1.tabpage_3.pb_print_catas.visible=true
end if
dw_historial.insertrow(1)
dw_historial.setitem(1,"fecha",datetime(today(),time(string(now()))))
dw_historial.setitem(1,"tipodoc",tipdoc)
dw_historial.setitem(1,"documento",docu)
dw_historial.setitem(1,"indapdx",tipo_ingres)
dw_historial.setitem(1,"clugar",clugar)
dw_historial.setitem(1,"consec_soat",consec_soat)
dw_historial.setitem(1,"clugar_soat",clugar_soat)
dw_historial.setitem(1,"ncatastrofe",ncatas)
dw_historial.setitem(1,"clugar_catas",clugar_catas)
tab_1.tabpage_1.dw_admi.reset()
tab_1.tabpage_1.dw_admi.insertrow(1)
tab_1.tabpage_1.dw_admi.setitem(1,"tipodoc",tipdoc)
tab_1.tabpage_1.dw_admi.setitem(1,"documento",docu)
tab_1.tabpage_1.dw_admi.setitem(1,"clugar",clugar)
tab_1.tabpage_1.dw_admi.setitem(1,"CodTIngre",tipo_ingres)
tab_1.tabpage_1.dw_admi.setitem(1,"cemp",empr)
tab_1.tabpage_1.dw_admi.setitem(1,"ccontrato",contr)
tab_1.tabpage_1.dw_admi.Setitem(1,"CUsuario",usuario)
tab_1.tabpage_1.dw_admi.setitem(1,"FechaIngreso",datetime(today()))
tab_1.tabpage_1.dw_admi.setitem(1,"Horaingreso",datetime(date('1/1/1900'),time(string(now()))))
tab_1.tabpage_1.dw_admi.setitem(1,"l_autoriza",l_aut)
//por nueva tabla para ligar ingresos al abrir cuenta en soat

if not isnull(consec_soat) then
	dw_his_acu.insertrow(1)
	dw_his_acu.setitem(1,"clugar",clugar)
	dw_his_acu.setitem(1,"consec_soat",consec_soat)
	dw_his_acu.setitem(1,"clugar_soat",clugar_soat)
end if

if tipo_ingres='2' then
	tab_1.tabpage_1.cbx_1.visible=true
	tab_1.tabpage_1.cbx_1.enabled=true
end if
clugar_ing=clugar
dw_historial.scrolltorow(1)
guardo=false
tab_1.tabpage_1.dw_admi.setfocus()
tab_1.tabpage_1.dw_admi.enabled=true
enabled=false
if tipo_ingres='4' then tab_1.tabpage_1.cbx_res.visible=true
tab_1.tabpage_1.cbx_2.enabled=true

end event

