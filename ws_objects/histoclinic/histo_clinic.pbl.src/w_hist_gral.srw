$PBExportHeader$w_hist_gral.srw
forward
global type w_hist_gral from window
end type
type dw_3 from datawindow within w_hist_gral
end type
type dw_his_acu from datawindow within w_hist_gral
end type
type pb_pyp from picturebutton within w_hist_gral
end type
type pb_notas from picturebutton within w_hist_gral
end type
type gb_6 from groupbox within w_hist_gral
end type
type pb_print from picturebutton within w_hist_gral
end type
type cb_2 from picturebutton within w_hist_gral
end type
type cb_1 from picturebutton within w_hist_gral
end type
type dw_empac from datawindow within w_hist_gral
end type
type tab_s from tab within w_hist_gral
end type
type tps_1 from userobject within tab_s
end type
type uo_serv from uo_serv_ing within tps_1
end type
type tps_1 from userobject within tab_s
uo_serv uo_serv
end type
type tps_2 from userobject within tab_s
end type
type pb_pvisible from picturebutton within tps_2
end type
type uo_hc_new from uo_hclin within tps_2
end type
type tps_2 from userobject within tab_s
pb_pvisible pb_pvisible
uo_hc_new uo_hc_new
end type
type tps_3 from userobject within tab_s
end type
type uo_os_fo from uo_orden_formula within tps_3
end type
type tps_3 from userobject within tab_s
uo_os_fo uo_os_fo
end type
type tab_s from tab within w_hist_gral
tps_1 tps_1
tps_2 tps_2
tps_3 tps_3
end type
type gb_5 from groupbox within w_hist_gral
end type
type dw_historial from datawindow within w_hist_gral
end type
end forward

global type w_hist_gral from window
integer width = 6981
integer height = 3120
boolean titlebar = true
string title = "Consultorio"
boolean controlmenu = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "medico.ico"
string pointer = "Arrow!"
integer unitsperline = 10
integer linesperpage = 10
integer unitspercolumn = 10
integer columnsperpage = 10
dw_3 dw_3
dw_his_acu dw_his_acu
pb_pyp pb_pyp
pb_notas pb_notas
gb_6 gb_6
pb_print pb_print
cb_2 cb_2
cb_1 cb_1
dw_empac dw_empac
tab_s tab_s
gb_5 gb_5
dw_historial dw_historial
end type
global w_hist_gral w_hist_gral

type variables
string i_clugar_his,i_profe,i_espe,i_atiende,i_plant,i_codfina
long i_contador,i_nservicio
string is_f_imprime
end variables

forward prototypes
public function long cambia_prof_espe (string p_prof, string p_espe)
public function integer setdatadde (string s)
end prototypes

public function long cambia_prof_espe (string p_prof, string p_espe);i_profe=p_prof
i_espe=p_espe
tab_s.tps_1.uo_serv.cambia_prof_espe(i_profe,i_espe,i_atiende)
return tab_s.tps_2.uo_hc_new.f_cambia_espe(i_espe)
end function

public function integer setdatadde (string s);tab_s.tps_2.uo_hc_new.ids_hijos_histo.settransobject(sqlca)
return 0
end function

on w_hist_gral.create
this.dw_3=create dw_3
this.dw_his_acu=create dw_his_acu
this.pb_pyp=create pb_pyp
this.pb_notas=create pb_notas
this.gb_6=create gb_6
this.pb_print=create pb_print
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_empac=create dw_empac
this.tab_s=create tab_s
this.gb_5=create gb_5
this.dw_historial=create dw_historial
this.Control[]={this.dw_3,&
this.dw_his_acu,&
this.pb_pyp,&
this.pb_notas,&
this.gb_6,&
this.pb_print,&
this.cb_2,&
this.cb_1,&
this.dw_empac,&
this.tab_s,&
this.gb_5,&
this.dw_historial}
end on

on w_hist_gral.destroy
destroy(this.dw_3)
destroy(this.dw_his_acu)
destroy(this.pb_pyp)
destroy(this.pb_notas)
destroy(this.gb_6)
destroy(this.pb_print)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_empac)
destroy(this.tab_s)
destroy(this.gb_5)
destroy(this.dw_historial)
end on

event open;dw_historial.reset()
dw_empac.reset()
tab_s.tps_1.uo_serv.reset()
tab_s.tps_3.uo_os_fo.reset()

select imprime into :is_f_imprime from tipoingreso where codtingre='1';

i_profe=w_principal.dw_profe.getitemstring(1,1)
i_espe=w_principal.dw_profe.getitemstring(1,'cesp')
if i_profe='' or isnull(i_profe) or i_espe='' or isnull(i_espe) then
	messagebox("Atención","Debe escoger profesional para poder continuar")
	i_contador=-1
	return
else
	SELECT Profe.PersoAtiende into :i_atiende
	FROM Profe
	WHERE Profe.CodProf=:i_profe;
	tab_s.tps_1.uo_serv.cambia_prof_espe(i_profe,i_espe,i_atiende)
end if
if tipdoc<>"" and docu<>"" then
	dw_empac.retrieve(tipdoc,docu)
	if dw_empac.rowcount()=0 then 
		messagebox("Advertencia","Paciente no tiene empresa asignada, asignele una en la ficha de Datos generales del Paciente")
		cb_1.enabled=false
	else
		cb_1.enabled=true
	end if
	tab_s.tps_1.uo_serv.cambia_emppac(dw_empac)
	dw_historial.retrieve(tipdoc,docu,clugar)
	dw_historial.retrieve(tipdoc,docu,'%')
end if
dw_historial.setfocus()

int l_pendientedx 
select
	count(1) into :l_pendientedx 
from 
	((resultadoscab inner join resultadoscpo on (resultadoscab.nrepor = resultadoscpo.nrepor) 
	and (resultadoscab.clugar = resultadoscpo.clugar) and (resultadoscab.coddoc = resultadoscpo.coddoc)) 
	inner join serviciosadx on (resultadoscpo.item = serviciosadx.item) and (resultadoscpo.nrepor = serviciosadx.nrepor) 
	and (resultadoscpo.clugar = serviciosadx.clugar_res) and (resultadoscpo.coddoc = serviciosadx.coddoc)) 
	inner join ingresoadx on (serviciosadx.ningreso = ingresoadx.ningreso) and (serviciosadx.codaadx = ingresoadx.codaadx) 
	and (serviciosadx.clugar = ingresoadx.clugar)
where 
	(((resultadoscpo.contador_hc) Is Null) AND ((serviciosadx.estado)='7') AND ((ingresoadx.tipodoc)=:tipdoc) AND ((ingresoadx.documento)=:docu));
IF SQLCA.SQLCode = 100 or SQLCA.SQLCode = -1 THEN
	MessageBox("No se puede leer paraclicinos si hay", SQLCA.SQLErrText)
	Return -1
END IF
	
if  l_pendientedx =0 then
	tab_s.tps_2.pb_pvisible.visible=false
else
	tab_s.tps_2.pb_pvisible.visible=true
end if
end event

event resize;//if height>=1888 then
//	vscrollbar=false
//else
//	vscrollbar=true
//end if
//if this.width>=3584 then 
//	this.hscrollbar=false
//else
//	this.hscrollbar=true
//end if
tab_s.resize(newwidth - 20 , newheight - tab_s.y)
tab_s.tps_2.uo_hc_new.tamanyo(newwidth - 70,newheight - tab_s.y - 140)

end event

event deactivate;//m_principal.m_3.m_3_3.dropdown=false
//m_principal.m_3.m_3_3.m_3_3_2.enabled=false
//m_principal.m_3.m_3_3.m_3_3_2.toolbaritemvisible=false
//m_principal.m_3.m_3_3.m_3_3_3.enabled=false
//m_principal.m_3.m_3_3.m_3_3_3.toolbaritemvisible=false
//m_principal.m_3.m_3_3.m_3_3_4.enabled=false
//m_principal.m_3.m_3_3.m_3_3_4.toolbaritemvisible=false
w_principal.dw_profe.visible=false
cb_1.enabled=false
cb_2.enabled=false
pb_notas.enabled=false
tab_s.tps_1.uo_serv.enabled=false
tab_s.tps_3.uo_os_fo.enabled=false
end event

event activate;//m_principal.m_3.m_3_3.dropdown=true
//m_principal.m_3.m_3_3.m_3_3_2.enabled=true
//m_principal.m_3.m_3_3.m_3_3_2.toolbaritemvisible=true
//m_principal.m_3.m_3_3.m_3_3_3.enabled=true
//m_principal.m_3.m_3_3.m_3_3_3.toolbaritemvisible=true
//m_principal.m_3.m_3_3.m_3_3_4.enabled=true
//m_principal.m_3.m_3_3.m_3_3_4.toolbaritemvisible=true
//im_menu.m_3.m_3_3.m_3_3_4.toolbaritemvisible=true

w_principal.dw_profe.visible=true
cb_1.enabled=true
cb_2.enabled=true
pb_notas.enabled=true
tab_s.tps_1.uo_serv.enabled=true
tab_s.tps_3.uo_os_fo.enabled=true

end event

event closequery;if tab_s.tps_2.uo_hc_new.event closequery()=1 then return 1
return tab_s.tps_1.uo_serv.f_pregunta()
end event

type dw_3 from datawindow within w_hist_gral
boolean visible = false
integer x = 786
integer y = 2768
integer width = 686
integer height = 120
integer taborder = 90
string title = "none"
string dataobject = "dw_serv_ingre"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_his_acu from datawindow within w_hist_gral
boolean visible = false
integer x = 37
integer y = 2864
integer width = 713
integer height = 64
integer taborder = 80
string title = "none"
string dataobject = "dw_historial_acumcab"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_pyp from picturebutton within w_hist_gral
integer x = 1742
integer y = 540
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &p"
boolean originalsize = true
string picturename = "pyp.gif"
string disabledname = "d_pyp.gif"
alignment htextalign = left!
string powertiptext = "Promoción y Prevención [Alt+P]"
end type

event clicked;if dw_historial.rowcount()=0 then return
st_notas st
st.contador=i_contador
st.clugar=i_clugar_his
st.profe=i_profe
openwithparm(w_pyp_pacos,st)
end event

type pb_notas from picturebutton within w_hist_gral
integer x = 2194
integer y = 540
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "contrato.gif"
string disabledname = "d_contrato.gif"
alignment htextalign = left!
string powertiptext = "Notas del Paciente en este Ingreso"
end type

event clicked;if dw_historial.rowcount()=0 then return
st_notas st_not
st_not.contador=i_contador
st_not.clugar=i_clugar_his
st_not.profe=i_profe
st_not.ventana='CEXT'
if dw_empac.rowcount()>0 then st_not.empresa=dw_empac.getitemstring(dw_empac.getrow(),'desemp')
openwithparm(w_notaspac,st_not)
end event

type gb_6 from groupbox within w_hist_gral
integer x = 3159
integer width = 3017
integer height = 656
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de Consultas del Paciente:"
borderstyle borderstyle = styleraised!
end type

type pb_print from picturebutton within w_hist_gral
event mousemove pbm_mousemove
integer x = 2345
integer y = 540
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
string picturename = "print2.GIF"
string disabledname = "d_print2.GIF"
alignment htextalign = left!
string powertiptext = "Imprimir Historia Clínica"
end type

event clicked;trae historial
if dw_historial.rowcount()>0 then 
	historial.numero=i_contador
	historial.lugar=i_clugar_his
	historial.tingres='1'
else
	return
end if

openwithparm(w_print_histor_txt,historial)


end event

type cb_2 from picturebutton within w_hist_gral
event mousemove pbm_mousemove
integer x = 2043
integer y = 540
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &b"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Ingreso [Alt+B]"
end type

event clicked;if (not isvalid(w_citas_asig)) or (not isvalid(w_lleva_factu_cons) ) then
	if tab_s.tps_1.uo_serv.i_interface=0 then 
		if f_permiso_boton(this,'CONS')=0 then return -1
	end If
end if
if w_principal.dw_1.getitemstring(1,'estado')='1' then
  messagebox("Atención","Este Paciente esta Fallecido no puede eliminarr servicios")
  return
end if
if i_contador = -1 or dw_historial.rowcount()=0 then return
delete from serviciosingreso where contador = :i_contador and clugar=:i_clugar_his;
if sqlca.sqlcode=-1 then
	messagebox("Error borrando de Serviciosingreso",sqlca.sqlerrtext)
	return
end if
delete from Evolucionhc where contador = :i_contador and clugar=:i_clugar_his;
if sqlca.sqlcode=-1 then
	messagebox("Error borrando de evolucionhc",sqlca.sqlerrtext)
	return
end if
delete from aperhc where contador = :i_contador and clugar_his=:i_clugar_his;
if sqlca.sqlcode=-1 then
	messagebox("Error borrando de aperhc",sqlca.sqlerrtext)
	return
end if
DELETE 	FROM ACUMCAB_HISTORIAL
WHERE (ACUMCAB_HISTORIAL.CONTADOR=:i_contador ) AND (ACUMCAB_HISTORIAL.CLUGAR=:i_clugar_his);
if SQLCA.sqlcode =-1 then
	Messagebox("Error",SQLCA.sqlerrtext)
	return
end if
dw_historial.deleterow(0)
if dw_historial.update()=-1 then 
	rollback;
	dw_historial.retrieve(tipdoc,docu,clugar)
else
	dw_historial.event rowfocuschanged(dw_historial.getrow())
	commit;
end if
end event

type cb_1 from picturebutton within w_hist_gral
event mousemove pbm_mousemove
integer x = 1893
integer y = 540
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &a"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Adicionar Ingreso [Alt+A]"
end type

event clicked;if not f_hasta() then 
	messagebox("Atención","Su periodo de validez ha caducado, comuníquese con GCI Ltda. para reactivarlo")
	return -1
end if
if not f_demo('pac') then return
////////////// ojo para que no metan goles ^
if (not isvalid(w_citas_asig)) and (not isvalid(w_lleva_factu_cons) ) then
	if tab_s.tps_1.uo_serv.i_interface=0 then 
		if f_permiso_boton(this,'CONS')=0 then return -1
	end If
	tab_s.tps_1.uo_serv.i_interface=0
end if
if isvalid(w_citas_asig) then
	i_codfina=w_citas_asig.dw_citas.getitemstring(w_citas_asig.dw_citas.getrow(),'cod_fina')
end if
if dw_empac.rowcount()<1 then return -1
if tab_s.tps_1.uo_serv.f_pregunta()=1 then return
if w_principal.dw_1.getitemstring(1,'estado')='1' then
  messagebox("Atención","Este Paciente esta Fallecido no puede adicionar servicios")
  return
end if
string clugar_soat
long consec_soat
st_soat st
setnull(consec_soat)
setnull(clugar_soat)
if dw_empac.getitemstring(dw_empac.getrow(),'soat')='1' then //and not isvalid(w_lleva_factu_cons) then
	st.nsoat=consec_soat
	st.newemp=dw_empac.getitemstring(dw_empac.getrow(),"codemp")
	st.newcont=dw_empac.getitemstring(dw_empac.getrow(),"codcontrato")
	setnull(st.contador)
	openwithparm(w_soat,st)
	if message.stringparm="!" or not isvalid(message.powerobjectparm)then return -1
	st=message.powerobjectparm
	clugar_soat=st.clug_soat
	consec_soat=st.nsoat
end if

long ll_newrow
ll_newrow = dw_historial.insertrow(1)
i_contador=f_trae_ndoc('HIS',clugar,'Historial')
dw_historial.setitem(ll_newrow ,"fecha",datetime(today(),now()))
dw_historial.setitem(ll_newrow ,"tipodoc",tipdoc)
dw_historial.setitem(ll_newrow ,"documento",docu)
dw_historial.setitem(ll_newrow ,"indapdx",'0')
dw_historial.setitem(ll_newrow ,"clugar",clugar)
dw_historial.setitem(ll_newrow ,"consec_soat",consec_soat)
dw_historial.setitem(ll_newrow ,"clugar_soat",clugar_soat)
dw_historial.setitem(ll_newrow ,"contador",i_contador)
dw_historial.setitem(ll_newrow ,"codprof",i_profe)
if dw_historial.update()=-1 then
	dw_historial.deleterow(ll_newrow )
	rollback;
else
	if tab_s.tps_2.uo_hc_new.retrieve(i_contador, i_clugar_his,'C','1','',i_espe,dw_empac.getitemstring(dw_empac.getrow(),'codemp'),dw_empac.getitemstring(dw_empac.getrow(),'codcontrato'),i_profe,0,'','1',i_codfina)=-1 then	
		rollback;
		dw_historial.deleterow(ll_newrow )
		return -1
	end if
	commit;
	if dw_historial.getrow()<>1 then
		dw_historial.scrolltorow(ll_newrow )
	else
		dw_historial.event rowfocuschanged(ll_newrow )
	end if
end if
//por nueva tabla para ligar ingresos al abrir cuenta en soat
if not isnull(consec_soat) then
	ll_newrow = dw_his_acu.insertrow(0)
	dw_his_acu.setitem(ll_newrow,"contador",i_contador)
	dw_his_acu.setitem(ll_newrow,"clugar",clugar)
	dw_his_acu.setitem(ll_newrow,"consec_soat",consec_soat)
	dw_his_acu.setitem(ll_newrow,"clugar_soat",clugar_soat)
	if dw_his_acu.update()=-1 then
		dw_his_acu.deleterow(ll_newrow)
		dw_his_acu.resetupdate()
		rollback;
		return -1
	end if
end if
return 1
end event

type dw_empac from datawindow within w_hist_gral
integer x = 27
integer y = 56
integer width = 3049
integer height = 448
integer taborder = 20
string dragicon = "none!"
string title = "Empresas del Paciente:"
string dataobject = "dw_empacguarda"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if this.rowcount()<1 then return
cb_1.triggerevent(clicked!)
end event

event constructor;this.settransobject(sqlca)
end event

type tab_s from tab within w_hist_gral
event mousemove pbm_mousemove
integer x = 32
integer y = 564
integer width = 6853
integer height = 2312
integer taborder = 70
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tps_1 tps_1
tps_2 tps_2
tps_3 tps_3
end type

on tab_s.create
this.tps_1=create tps_1
this.tps_2=create tps_2
this.tps_3=create tps_3
this.Control[]={this.tps_1,&
this.tps_2,&
this.tps_3}
end on

on tab_s.destroy
destroy(this.tps_1)
destroy(this.tps_2)
destroy(this.tps_3)
end on

type tps_1 from userobject within tab_s
integer x = 18
integer y = 112
integer width = 6816
integer height = 2184
string dragicon = "none!"
long backcolor = 67108864
string pointer = "Arrow!"
string text = "     Servicios    "
long tabtextcolor = 33554432
string picturename = "medico.ico"
long picturemaskcolor = 536870912
string powertiptext = "Capturar Servicios prestados con sus respectivos datos de RIPS"
uo_serv uo_serv
end type

on tps_1.create
this.uo_serv=create uo_serv
this.Control[]={this.uo_serv}
end on

on tps_1.destroy
destroy(this.uo_serv)
end on

type uo_serv from uo_serv_ing within tps_1
integer x = 14
integer y = 24
integer width = 5554
integer height = 1396
integer taborder = 20
boolean bringtotop = true
string i_indapdx = "0"
string tipo_ingres = "1"
end type

on uo_serv.destroy
call uo_serv_ing::destroy
end on

event constructor;call super::constructor;ipb_newingre=cb_1
end event

event cambia_diags;call super::cambia_diags;tab_s.tps_3.uo_os_fo.cambia_diags(p_cdiag)
tab_s.tps_2.uo_hc_new.refresh_diags()
end event

event cambian_serv;call super::cambian_serv;long ll_servs ,dif
long nnulo
string snulo
setnull(nnulo)
setnull(snulo)
if p_filas=0 then
	tab_s.tps_2.uo_hc_new.enabled=false
else
	tab_s.tps_2.uo_hc_new.enabled=true
end if
ll_servs=tab_s.tps_1.uo_serv.dw_serv_ing.rowcount()
dif	=SecondsAfter(time(dw_historial.getitemdatetime(dw_historial.getrow(),"fecha")),time(now()	))/60
if dif<0 then dif=3600
if  (ll_servs >0 ) and dif<=30  then 
	i_plant='1'
else
	i_plant='0'
end if
tab_s.tps_3.uo_os_fo.retrieve(i_contador,i_clugar_his,i_profe,nnulo,snulo,'1',nnulo,snulo,nnulo,i_espe)
tab_s.tps_2.uo_hc_new.retrieve(i_contador, i_clugar_his,'C','1','',i_espe,dw_empac.getitemstring(dw_empac.getrow(),'codemp'),dw_empac.getitemstring(dw_empac.getrow(),'codcontrato'),i_profe,0,'',i_plant,i_codfina)

end event

type tps_2 from userobject within tab_s
integer x = 18
integer y = 112
integer width = 6816
integer height = 2184
string dragicon = "none!"
long backcolor = 67108864
string pointer = "Arrow!"
string text = "   Registro Médico   "
long tabtextcolor = 33554432
string picturename = "libro.ico"
long picturemaskcolor = 536870912
string powertiptext = "Datos de Anamnesis, Antecedentes, etc."
pb_pvisible pb_pvisible
uo_hc_new uo_hc_new
end type

on tps_2.create
this.pb_pvisible=create pb_pvisible
this.uo_hc_new=create uo_hc_new
this.Control[]={this.pb_pvisible,&
this.uo_hc_new}
end on

on tps_2.destroy
destroy(this.pb_pvisible)
destroy(this.uo_hc_new)
end on

type pb_pvisible from picturebutton within tps_2
boolean visible = false
integer x = 3877
integer width = 759
integer height = 92
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "resultados.gif"
alignment htextalign = left!
end type

type uo_hc_new from uo_hclin within tps_2
integer x = 5
integer width = 5568
integer height = 2276
integer taborder = 80
boolean enabled = true
string i_message = "Registro medico"
end type

event constructor;call super::constructor;tamanyo(3461,1236)
moverv(400)
datawindow dw
singlelineedit sle_ot,sle_tiporep
inicia_objs_ordenes(tab_s.tps_3.uo_os_fo.tab_1.tp_1.sle_1,tab_s.tps_3.uo_os_fo.tab_1.tp_2.sle_2,tab_s.tps_3.uo_os_fo.cb_nvorden,dw,sle_ot,sle_tiporep,i_espe,sle_tiporep)
end event

on uo_hc_new.destroy
call uo_hclin::destroy
end on

event cambio_diags;call super::cambio_diags;long j
for j=1 to tab_s.tps_1.uo_serv.dw_serv_ing.rowcount()
	tab_s.tps_1.uo_serv.dw_serv_ing.event rowfocuschanged(j)
	tab_s.tps_1.uo_serv.pb_guarda_diags.event clicked()
next
if tab_s.tps_1.uo_serv.dw_diags.rowcount()>0 then tab_s.tps_3.uo_os_fo.cambia_diags(tab_s.tps_1.uo_serv.dw_diags.getitemstring(1,'diagprin'))
end event

type tps_3 from userobject within tab_s
integer x = 18
integer y = 112
integer width = 6816
integer height = 2184
string dragicon = "none!"
long backcolor = 67108864
string pointer = "Arrow!"
string text = "Ordenes"
long tabtextcolor = 33554432
string picturename = "ap_dx.ico"
long picturemaskcolor = 536870912
string powertiptext = "Realizar las Ordenes de Servicio y la Fórmula Médica"
uo_os_fo uo_os_fo
end type

on tps_3.create
this.uo_os_fo=create uo_os_fo
this.Control[]={this.uo_os_fo}
end on

on tps_3.destroy
destroy(this.uo_os_fo)
end on

type uo_os_fo from uo_orden_formula within tps_3
integer x = 9
integer y = 8
integer width = 6770
integer height = 1904
integer taborder = 60
string i_codrep_formula = "FMCE"
string i_codrep_orden = "OSCE"
boolean repord_dialogo = true
boolean repfor_dialogo = true
end type

on uo_os_fo.destroy
call uo_orden_formula::destroy
end on

event constructor;call super::constructor;init('0')
end event

type gb_5 from groupbox within w_hist_gral
integer width = 3113
integer height = 536
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = " Empresas del Paciente:"
borderstyle borderstyle = styleraised!
end type

type dw_historial from datawindow within w_hist_gral
integer x = 3200
integer y = 52
integer width = 2935
integer height = 580
integer taborder = 60
string dragicon = "none!"
boolean bringtotop = true
string dataobject = "dw_historial"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long fila,dif

fila=getrow()
tab_s.tps_2.uo_hc_new.reset()
if fila>0 then
	string codplantilla,snulo
	long nnulo,ll_servs
	setnull(nnulo)
	setnull(snulo)
	if isnull(getitemnumber(fila,"contador")) then return
	i_contador=getitemnumber(fila,"contador")
	i_clugar_his=getitemstring(fila,"clugar")

	dif	=f_dif_fecha_minutos(getitemdatetime(fila,"fecha"),datetime(today(),now()))
	ll_servs=tab_s.tps_1.uo_serv.retrieve(i_contador,i_clugar_his,dif,'C')
	tab_s.tps_3.uo_os_fo.retrieve(i_contador,i_clugar_his,i_profe,nnulo,snulo,'1',nnulo,snulo,nnulo,i_espe)

	if dif > 1440 then
		i_plant='0'
	else
		if  (ll_servs >0 ) and dif<=60  then 
			i_plant='1'
		else
			i_plant='0'
		end if
	end if
	tab_s.tps_2.uo_hc_new.retrieve(i_contador, i_clugar_his,'C','1','',i_espe,dw_empac.getitemstring(dw_empac.getrow(),'codemp'),dw_empac.getitemstring(dw_empac.getrow(),'codcontrato'),i_profe,0,'',i_plant,i_codfina)
end if
end event

event constructor;settransobject(sqlca)
end event

event rowfocuschanging;if tab_s.tps_2.uo_hc_new.event closequery()=1 then return 1
return tab_s.tps_1.uo_serv.f_pregunta()
end event

