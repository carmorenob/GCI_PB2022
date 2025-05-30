$PBExportHeader$w_principal.srw
forward
global type w_principal from window
end type
type mdi_1 from mdiclient within w_principal
end type
type rbb_1 from ribbonbar within w_principal
end type
end forward

global type w_principal from window
integer width = 3227
integer height = 1724
boolean titlebar = true
string title = "Configuración Tablas Básicas GCI"
string menuname = "m_mdiconf"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdi!
windowstate windowstate = maximized!
long backcolor = 134217732
string icon = "gci_cfg.ico"
string pointer = "Arrow!"
integer toolbarheight = 100
event f_init_ribon ( ribbonbar nom_rib,  boolean rib_boo )
event f_act_cate ( ribbonbar arbb_ribbonbar,  string as_tag )
mdi_1 mdi_1
rbb_1 rbb_1
end type
global w_principal w_principal

type variables

end variables

forward prototypes
public subroutine lf_titulo ()
public subroutine f_init_ribbonbar (ribbonbar nom_rib, boolean rib_boo)
public subroutine mf_abre_tablas (string titulo, string dw_dataobject, integer mipres)
public subroutine mf_abre_tablas2 (string titulo, string dw_dataobject1, string dw_dataobject2)
public subroutine mf_abre_tablas3 (string titulo, string dw_dataobject1, string dw_dataobject2, string dw_dataobject3)
end prototypes

public subroutine lf_titulo ();string descrip
select descripcion into :descrip from lugar where codlugar=:clugar;
title='GCI Ltda.  [* * '+ f_coloca_esp(descrip)+' * *]'
end subroutine

public subroutine f_init_ribbonbar (ribbonbar nom_rib, boolean rib_boo);blob ls_ribon
int li_ini=1
string ls_rep, ls_cad='.\\img\\',ls_dinst

if ls_pro=32 then
	RegistryGet ( "HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "DIRECTORIO", RegString!, ls_dinst)
end If
if ls_pro=64 then
	RegistryGet ( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "DIRECTORIO", RegString!, ls_dinst)
end If

If	rib_boo Then
	SELECTblob ribon into :ls_ribon from pm_aplicativos where cod_aplica='CONF';
	if isnull(ls_ribon) then 
		//messagebox('Atención','No se puede cargar ribon')
		nom_rib.ImportFromXMLFile ("conf.xml") 
		return
	else
		ls_rep=string(ls_ribon)
		li_ini= Pos(ls_dinst,':\')
		ls_dinst=mid(ls_dinst,1,li_ini)+'\'+mid(ls_dinst,li_ini+1,len(ls_dinst))+'\img\\'
	
		DO WHILE Pos(ls_rep,ls_cad)<>0
		  ls_rep=mid(ls_rep,1,POS(ls_rep,ls_cad)-1)+ ls_dinst+mid(ls_rep,POS(ls_rep,ls_cad)+len(ls_cad),len(ls_rep))
		LOOP	
		nom_rib.ImportJSON (ls_rep)
	end if
	f_poblar_menus_ribon(rbb_1,'CONF')
	return
End If
end subroutine

public subroutine mf_abre_tablas (string titulo, string dw_dataobject, integer mipres);boolean bValid
window wSheet,child

//wSheet = ParentWindow.GetFirstSheet()
bvalid= IsValid (wSheet)
DO while bvalid
	if wsheet.title=titulo then
		wsheet.setfocus()
		return 
	end if
	//wSheet = ParentWindow.GetNextSheet(wSheet)
	bValid = IsValid (wSheet)
LOOP
if mipres=0 then 
	OpenSheet(child, 'w_tablas', w_principal, 1,original!)
	w_tablas=child
	w_tablas.title=titulo
	w_tablas.dw_1.dataobject=dw_dataobject
	w_tablas.inicializa()
else
	OpenSheet(child, 'w_tablas_mipres', w_principal, 1,original!)
	w_tablas_mipres=child
	w_tablas_mipres.st_titulo.text=titulo
	w_tablas_mipres.dw_1.dataobject=dw_dataobject
	w_tablas_mipres.inicializa()
end if
w_principal.arrangesheets(layer!)
end subroutine

public subroutine mf_abre_tablas2 (string titulo, string dw_dataobject1, string dw_dataobject2);boolean bValid
window wSheet,child
//wSheet = ParentWindow.GetFirstSheet()
bvalid= IsValid (wSheet)
DO while bvalid
	if wsheet.title=titulo then
		wsheet.setfocus()
		return 
	end if
	//wSheet = ParentWindow.GetNextSheet(wSheet)
	bValid = IsValid (wSheet)
LOOP
OpenSheet(child, 'w_tablas2', w_principal, 1,original!)
w_tablas2=child
w_tablas2.title=titulo
w_tablas2.dw_1.dataobject=dw_dataobject1
w_tablas2.dw_2.dataobject=dw_dataobject2
w_tablas2.inicializa()
w_principal.arrangesheets(layer!)
end subroutine

public subroutine mf_abre_tablas3 (string titulo, string dw_dataobject1, string dw_dataobject2, string dw_dataobject3);boolean bValid
window wSheet,child
//wSheet = ParentWindow.GetFirstSheet()
bvalid= IsValid (wSheet)
DO while bvalid
	if wsheet.title=titulo then
		wsheet.setfocus()
		return 
	end if
	//wSheet = ParentWindow.GetNextSheet(wSheet)
	bValid = IsValid (wSheet)
LOOP
OpenSheet(child, 'w_tablas3', w_principal, 1,original!)
w_tablas3=child
w_tablas3.title=titulo
w_tablas3.dw_1.dataobject=dw_dataobject1
w_tablas3.dw_2.dataobject=dw_dataobject2
w_tablas3.dw_3.dataobject=dw_dataobject3
w_tablas3.inicializa()
w_principal.arrangesheets(layer!)
end subroutine

on w_principal.create
if this.MenuName = "m_mdiconf" then this.MenuID = create m_mdiconf
this.mdi_1=create mdi_1
this.rbb_1=create rbb_1
this.Control[]={this.mdi_1,&
this.rbb_1}
end on

on w_principal.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.rbb_1)
end on

event open;if isvalid(w_presenta) then w_presenta.setfocus()
//settoolbarpos(1,1,1,false)
//settoolbar(1,true,AlignAtTop!,"GCI Configurador")
//
lf_titulo()
f_init_ribbonbar(rbb_1,True)
timer(1)



end event

event close;disconnect;
if isvalid(w_presenta) then close(w_presenta)
HALT
end event

event timer;close(w_presenta)
setfocus()
timer(0)
end event

event resize;if newwidth <= 0 then
	newwidth = this.workspacewidth( )
end if
if newheight <=0 then
	newheight = this.workspaceheight( )
end if

rbb_1.move(0,newheight - this.workspaceheight()  )
rbb_1.width = newwidth
mdi_1.move(0,rbb_1.height +newheight -  this.workspaceheight())
mdi_1.resize(newwidth,newheight - rbb_1.height - ( newheight - this.workspaceheight()))
this.arrangesheets( layer!)
end event

type mdi_1 from mdiclient within w_principal
long BackColor=33554431
end type

type rbb_1 from ribbonbar within w_principal
event e_cierra ( long param )
event e_acerca ( long param1,  long param2,  long param3 )
event e_ips ( long param )
event e_docus ( long param )
event e_flujo ( long param )
event e_cierrav ( long param )
event e_pais ( long param1,  long param2,  long param3 )
event e_dpto ( long param1,  long param2,  long param3 )
event e_ciudad ( long param1,  long param2,  long param3 )
event e_barrio ( long param1,  long param2,  long param3 )
event e_postal ( long param1,  long param2,  long param3 )
event e_gusuuario ( long param1,  long param2,  long param3 )
event e_usuario ( long param1,  long param2,  long param3 )
event e_personaliza ( long param1,  long param2,  long param3 )
event e_salm ( long param1,  long param2,  long param3 )
event e_slugar ( long param1,  long param2,  long param3 )
event e_cversion ( long param1,  long param2,  long param3 )
event e_parametros ( long param1,  long param2,  long param3 )
event e_cambial ( long param1,  long param2,  long param3 )
event e_catastrofe ( long param1,  long param2,  long param3 )
event e_condivic ( long param1,  long param2,  long param3 )
event e_tasegura ( long param1,  long param2,  long param3 )
event e_tipoveh ( long param1,  long param2,  long param3 )
event e_trips ( long param1,  long param2,  long param3 )
event e_arips ( long param1,  long param2,  long param3 )
event e_tipodir ( long param1,  long param2,  long param3 )
event e_tcorreo ( long param1,  long param2,  long param3 )
event e_tdocu ( long param1,  long param2,  long param3 )
event e_tingreso ( long param1,  long param2,  long param3 )
event e_tproce ( long param1,  long param2,  long param3 )
event e_tregim ( long param1,  long param2,  long param3 )
event e_treporte ( long param1,  long param2,  long param3 )
event e_tusuario ( long param1,  long param2,  long param3 )
event e_cred ( long param )
event e_escolaridad ( long param )
event e_eafiliado ( long param )
event e_estrato ( long param )
event e_finalidadc ( long param1,  long param2,  long param3 )
event e_getareo ( long param )
event e_pertenencia ( long param )
event e_motivoa ( long param )
event e_sincexp ( long param1,  long param2,  long param3 )
event e_sincpre ( long param1,  long param2,  long param3 )
event e_sincsub ( long param1,  long param2,  long param3 )
event e_apdxarea ( long param1,  long param2,  long param3 )
event e_apdxper ( long param1,  long param2,  long param3 )
event e_apdxtubo ( long param1,  long param2,  long param3 )
event e_apdxtmu ( long param1,  long param2,  long param3 )
event e_btipodon ( long param1,  long param2,  long param3 )
event e_banco ( long param1,  long param2,  long param3 )
event e_bempaque ( long param1,  long param2,  long param3 )
event e_btsempaque ( long param1,  long param2,  long param3 )
event e_bsempaque ( long param1,  long param2,  long param3 )
event e_bproducto ( long param1,  long param2,  long param3 )
event e_bconfigura ( long param1,  long param2,  long param3 )
event e_cita_lugar ( long param1,  long param2,  long param3 )
event e_cita_cons ( long param1,  long param2,  long param3 )
event e_cita_grp ( long param1,  long param2,  long param3 )
event e_cita_cgrp ( long param1,  long param2,  long param3 )
event e_cita_progrp ( long param1,  long param2,  long param3 )
event e_cita_recuerda ( long param1,  long param2,  long param3 )
event e_profesional ( long param1,  long param2,  long param3 )
event e_especialidad ( long param1,  long param2,  long param3 )
event e_espprofe ( long param1,  long param2,  long param3 )
event e_citas_seguerido ( long param1,  long param2,  long param3 )
event e_turarea ( long param1,  long param2,  long param3 )
event e_trugrp ( long param1,  long param2,  long param3 )
event e_turagrp ( long param1,  long param2,  long param3 )
event e_pabellon ( long param1,  long param2,  long param3 )
event e_habitacion ( long param1,  long param2,  long param3 )
event e_camas ( long param1,  long param2,  long param3 )
event e_kits ( long param1,  long param2,  long param3 )
event e_triagge ( long param1,  long param2,  long param3 )
event e_tparto ( long param1,  long param2,  long param3 )
event e_porden ( long param1,  long param2,  long param3 )
event e_ipsr ( long param1,  long param2,  long param3 )
event e_odontosp ( long param1,  long param2,  long param3 )
event e_odontocu ( long param1,  long param2,  long param3 )
event e_odontopz ( long param1,  long param2,  long param3 )
event e_odontocua ( long param1,  long param2,  long param3 )
event e_odontocfg ( long param1,  long param2,  long param3 )
event e_qxanes ( long param1,  long param2,  long param3 )
event e_qxsalas ( long param1,  long param2,  long param3 )
event e_qxcgrp ( long param1,  long param2,  long param3 )
event e_qxcuvr ( long param1,  long param2,  long param3 )
event e_qxlateralidad ( long param1,  long param2,  long param3 )
event e_medcls ( long param )
event e_medpact ( long param )
event e_medff ( long param )
event e_medum ( long param )
event e_medva ( long param )
event e_medsmf ( long param )
event e_medumd ( long param )
event e_medicamnto ( long param )
event e_hcvdx ( long param1,  long param2,  long param3 )
event e_hcapcdx ( long param1,  long param2,  long param3 )
event e_hcdx ( long param1,  long param2,  long param3 )
event e_hcedaddx ( long param1,  long param2,  long param3 )
event e_edadfin ( long param1,  long param2,  long param3 )
event e_ocupv ( long param1,  long param2,  long param3 )
event e_ocupacion ( long param1,  long param2,  long param3 )
event e_esten ( long param1,  long param2,  long param3 )
event e_estedad ( long param1,  long param2,  long param3 )
event e_hcplan ( long param1,  long param2,  long param3 )
event e_hccurva ( long param1,  long param2,  long param3 )
event e_hcpercen ( long param1,  long param2,  long param3 )
event e_hcantc ( long param1,  long param2,  long param3 )
event e_epab ( long param1,  long param2,  long param3 )
event e_contrato ( long param1,  long param2,  long param3 )
event e_fmanual ( long param1,  long param2,  long param3 )
event e_fsoat ( long param1,  long param2,  long param3 )
event e_fliqsoat ( long param1,  long param2,  long param3 )
event e_fuvr ( long param1,  long param2,  long param3 )
event e_fliquvr ( long param1,  long param2,  long param3 )
event e_ftarmed ( long param1,  long param2,  long param3 )
event e_ftarpro ( long param1,  long param2,  long param3 )
event e_cupsv ( long param )
event e_cupssec ( long param )
event e_cupscap ( long param )
event e_cupsgrp ( long param )
event e_cupssgrp ( long param )
event e_cupscate ( long param )
event e_cups ( long param )
event e_cupsespe ( long param )
event e_planes ( long param1,  long param2,  long param3 )
event e_planmed ( long param1,  long param2,  long param3 )
event e_planproc ( long param1,  long param2,  long param3 )
event e_uf ( long param1,  long param2,  long param3 )
event e_cc ( long param1,  long param2,  long param3 )
event e_srvufcc ( long param1,  long param2,  long param3 )
event e_up ( long param )
event e_reportes ( long param )
event e_hcdxfina ( long param1,  long param2,  long param3 )
event e_pypact ( long param1,  long param2,  long param3 )
event e_pypcond ( long param1,  long param2,  long param3 )
event e_pypconf ( long param1,  long param2,  long param3 )
event e_vacunas ( long param1,  long param2,  long param3 )
event e_vacconf ( long param1,  long param2,  long param3 )
event e_tserv ( long param1,  long param2,  long param3 )
event e_tqueja ( long param1,  long param2,  long param3 )
event e_campopedt ( long param1,  long param2,  long param3 )
event e_femstusu ( long param )
event e_femstide ( long param )
event e_femstctp ( long param )
event e_femspcob ( long param )
event e_pres_ambito ( long param1,  long param2,  long param3 )
event e_mipres_enfhu ( long param1,  long param2,  long param3 )
event e_mipresfrecuso ( long param1,  long param2,  long param3 )
event e_mipres_tdispo ( long param1,  long param2,  long param3 )
event e_mipres_servc ( long param1,  long param2,  long param3 )
event e_mipres_tipom ( long param1,  long param2,  long param3 )
event e_mipres_viaadm ( long param1,  long param2,  long param3 )
event e_mipres_formaf ( long param1,  long param2,  long param3 )
event e_mipres_unidadmed ( long param1,  long param2,  long param3 )
event e_mipres_indesp ( long param1,  long param2,  long param3 )
event e_mipres_tipopn ( long param1,  long param2,  long param3 )
event e_mipres_prodnuti ( long param1,  long param2,  long param3 )
event e_mipres_formapn ( long param1,  long param2,  long param3 )
event e_causaext ( long param1,  long param2,  long param3 )
event e_viaingreso ( long param1,  long param2,  long param3 )
event e_clasep ( long param1,  long param2,  long param3 )
event e_finproc ( long param1,  long param2,  long param3 )
event e_desteg ( long param1,  long param2,  long param3 )
event e_gserv ( long param1,  long param2,  long param3 )
event e_modarealiza ( long param1,  long param2,  long param3 )
event e_cita_tipo ( long param1,  long param2,  long param3 )
event e_atc ( long param )
event e_estcivil ( long param )
event e_hcins ( long param1,  long param2,  long param3 )
event e_parentesco ( long param )
event e_pvulnera ( long param )
event e_rcoms ( long param1,  long param2,  long param3 )
event e_umm ( long param )
event e_tmedica ( long param )
event e_menu ( long param,  long param2,  long param3 )
event e_metplanifica ( long param )
event e_moduloa ( long param )
event e_pypcohortes ( long param1,  long param2,  long param3 )
event e_cqueja ( long param1,  long param2,  long param3 )
event e_zonar ( long param1,  long param2,  long param3 )
event e_oserv ( long param1,  long param2,  long param3 )
event e_local ( long param1,  long param2,  long param3 )
event e_microt ( long param1,  long param2,  long param3 )
event e_ugob ( long param1,  long param2,  long param3 )
event e_duramed ( long param )
event e_frecmed ( long param )
event e_grepserv ( long param1,  long param2,  long param3 )
event e_servcups ( long param1,  long param2,  long param3 )
event e_servlugar ( long param1,  long param2,  long param3 )
event e_apdxnotap ( long param1,  long param2,  long param3 )
event e_adire ( long param1,  long param2,  long param3 )
event e_fincext ( long param1,  long param2,  long param3 )
event e_finproced ( long param1,  long param2,  long param3 )
event e_lugprofe ( long param1,  long param2,  long param3 )
integer width = 3191
integer height = 492
long backcolor = 15132390
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event e_cierra(long param);disconnect;
if isvalid(w_presenta) then close(w_presenta)
HALT
close(parent)
end event

event e_acerca(long param1, long param2, long param3);openwithparm(w_acercade,'conf')
w_principal.ArrangeSheets ( layer!)
end event

event e_ips(long param);opensheet(w_ips,w_principal,1,original!)
end event

event e_docus(long param);OpenSheet(w_docus_new, w_principal, 1,original!)
end event

event e_flujo(long param);opensheet(w_flujo,w_principal,1,original!)
end event

event e_cierrav(long param);//Cierra Ventana Activa
window  lw_sheet

lw_sheet = parent.getactivesheet( )
if isvalid(lw_sheet) then
	close(lw_sheet)
else
	close(parent)
end if
end event

event e_pais(long param1, long param2, long param3);mf_abre_tablas("Paises",'dw_pais',0)
end event

event e_dpto(long param1, long param2, long param3);mf_abre_tablas("Departamentos",'dw_departamentos',0)
end event

event e_ciudad(long param1, long param2, long param3);mf_abre_tablas2("Ciudades",'dw_combo_depart','dw_ciudades')
end event

event e_barrio(long param1, long param2, long param3);mf_abre_tablas3("Barrios",'dw_combo_depart','dw_combo_ciudad2','dw_barrios')
end event

event e_postal(long param1, long param2, long param3);mf_abre_tablas3("Código Postal",'dw_combo_depart','dw_combo_ciudad2','dw_cod_postal')
end event

event e_gusuuario(long param1, long param2, long param3);opensheet(w_seguridad,w_principal,1,original!)

end event

event e_usuario(long param1, long param2, long param3);opensheet(w_administra_usuario,w_principal,1,original!)
end event

event e_personaliza(long param1, long param2, long param3);opensheet(w_perso_ventana,w_principal,1,original!)

end event

event e_salm(long param1, long param2, long param3);opensheet(w_segalmacen,w_principal,1,original!)
end event

event e_slugar(long param1, long param2, long param3);opensheet(w_seglugar,w_principal,1,original!)
end event

event e_cversion(long param1, long param2, long param3);OpenSheet(w_versiones, w_principal, 1,original!)
end event

event e_parametros(long param1, long param2, long param3);OpenSheet(w_para_grales_new, w_principal, 1,original!)
end event

event e_cambial(long param1, long param2, long param3);if not enabled then return
open(w_cambia_lugar_conf)
end event

event e_catastrofe(long param1, long param2, long param3);mf_abre_tablas("Catastrofes Naturales",'dw_catastrofe_natural',0)
end event

event e_condivic(long param1, long param2, long param3);mf_abre_tablas("Condición de la Victima",'dw_condicion_victima',0)
end event

event e_tasegura(long param1, long param2, long param3);mf_abre_tablas("Tipo Asegurado",'dw_tipo_asegurado_soat',0)
end event

event e_tipoveh(long param1, long param2, long param3);mf_abre_tablas("Tipo Vehiculo",'dw_tipo_vehiculo',0)
end event

event e_trips(long param1, long param2, long param3);OpenSheet(w_config_rias, w_principal, 1,original!)

end event

event e_arips(long param1, long param2, long param3);mf_abre_tablas("Agrupación Furips",'dr_agrup_rips',0)
end event

event e_tipodir(long param1, long param2, long param3);mf_abre_tablas("Tipo Dirección",'dw_tipo_direccion',0)
end event

event e_tcorreo(long param1, long param2, long param3);mf_abre_tablas("Tipo Correos",'dw_tipo_correo',0)
end event

event e_tdocu(long param1, long param2, long param3);mf_abre_tablas("Tipo Documento",'dw_tipodocumento',0)

end event

event e_tingreso(long param1, long param2, long param3);mf_abre_tablas("Tipos de Ingreso",'dw_tipoingreso',0)

end event

event e_tproce(long param1, long param2, long param3);mf_abre_tablas("Tipos de Procedimiento",'dw_tipo_procedimiento',0)
end event

event e_tregim(long param1, long param2, long param3);mf_abre_tablas("Tipo Regimen",'dw_tipo_regimen',0)
end event

event e_treporte(long param1, long param2, long param3);mf_abre_tablas("Tipo Reportes",'dw_tiporeport',0)
end event

event e_tusuario(long param1, long param2, long param3);mf_abre_tablas("Tipo Usuario",'dw_tip_usu',0)
end event

event e_cred(long param); delete from control_red ;
 If sqlca.sqlcode=-1 then
	  messagebox("Error borrando control_red en ajuste",sqlca.sqlerrtext)
	  rollback;
	   return
Else
	commit;
End If
Messagebox("Finalizado", "Se ejecuto con exito el proceso" )
end event

event e_escolaridad(long param);mf_abre_tablas("Escolaridad",'dw_escolaridad',0)
end event

event e_eafiliado(long param);mf_abre_tablas("Estado Afiliación",'dw_afiliacion_estado',0)
end event

event e_estrato(long param);mf_abre_tablas("Estratos",'dw_estratos',0)
end event

event e_finalidadc(long param1, long param2, long param3);mf_abre_tablas("Finalidad Consulta",'dw_fin_consulta',0)
end event

event e_getareo(long param);mf_abre_tablas("Grupos Etareos",'dw_getareo',0)
end event

event e_pertenencia(long param);mf_abre_tablas("Pertenecia Étnica",'dw_grupo_especial',0)
end event

event e_motivoa(long param);mf_abre_tablas2("Motivos Anulación",'dw_combo_pm_moduloa','dw_motivo_anula')
end event

event e_sincexp(long param1, long param2, long param3);openwithparm(w_sincroniza,'B')
end event

event e_sincpre(long param1, long param2, long param3);openwithparm(w_sincroniza,'S')
end event

event e_sincsub(long param1, long param2, long param3);openwithparm(w_sincroniza,'SS')
end event

event e_apdxarea(long param1, long param2, long param3);OpenSheet(w_areas_apdx, w_principal, 1,Layered!)
end event

event e_apdxper(long param1, long param2, long param3);OpenSheet(w_grup_clinic, w_principal, 1,Layered!)

end event

event e_apdxtubo(long param1, long param2, long param3);mf_abre_tablas("Tubos de Muestra",'dw_pm_tipotubo',0)

end event

event e_apdxtmu(long param1, long param2, long param3);mf_abre_tablas("Tipo Muestra",'dw_pm_tipo_muestra',0)
end event

event e_btipodon(long param1, long param2, long param3);mf_abre_tablas2("Bancos de Fluidos - Tipos de Donación",'dw_combo_bancoapdx','dw_banco_tipo_don')
end event

event e_banco(long param1, long param2, long param3);mf_abre_tablas("Bancos de Fluidos",'dw_bancos',0)

end event

event e_bempaque(long param1, long param2, long param3);mf_abre_tablas2("Bancos de Fluidos - Empaques",'dw_combo_bancoapdx','dw_empaques_bancos')

end event

event e_btsempaque(long param1, long param2, long param3);mf_abre_tablas2("Bancos de Fluidos - Tipos de Subempaques",'dw_combo_bancoapdx','dw_banco_tsubempaq')

end event

event e_bsempaque(long param1, long param2, long param3);mf_abre_tablas3("Bancos de Fluidos - Sub-Empaques",'dw_combo_bancoapdx','dw_combo_banco_empaque','dw_banco_subemp')

end event

event e_bproducto(long param1, long param2, long param3);OpenSheet(w_productos_banco, w_principal, 1,Layered!)
end event

event e_bconfigura(long param1, long param2, long param3);OpenSheet(w_bancos, w_principal, 1,Layered!)
end event

event e_cita_lugar(long param1, long param2, long param3);//mf_abre_tablas("Lugares",'dw_lugares',0)
opensheet(w_lugares,w_principal,1,original!)
w_principal.arrangesheets(layer!)

end event

event e_cita_cons(long param1, long param2, long param3);mf_abre_tablas("Consultorios",'dw_consultorios',0)

end event

event e_cita_grp(long param1, long param2, long param3);mf_abre_tablas("Grupos de Citas",'dw_grupocita',0)
end event

event e_cita_cgrp(long param1, long param2, long param3);mf_abre_tablas2("Consultorios por Grupo",'dw_grupcita_combo','dw_grup_consul')

end event

event e_cita_progrp(long param1, long param2, long param3);OpenSheet(w_proc_grupcons, w_principal, 1,original!)
end event

event e_cita_recuerda(long param1, long param2, long param3);OpenSheet(w_recuerda_citas, w_principal, 1,original!)
end event

event e_profesional(long param1, long param2, long param3);mf_abre_tablas("Profesionales",'dw_profesional',0)

end event

event e_especialidad(long param1, long param2, long param3);mf_abre_tablas("Especialidades",'dw_especialidad',0)
end event

event e_espprofe(long param1, long param2, long param3);mf_abre_tablas2("Especialidades de Profesionales",'dw_profe_combo','dw_espe_profe')
end event

event e_citas_seguerido(long param1, long param2, long param3);OpenSheet(w_hora_bas, w_principal, 1,original!)
end event

event e_turarea(long param1, long param2, long param3);mf_abre_tablas("Areas de Turnos",'dw_consultorios_qx',0)

end event

event e_trugrp(long param1, long param2, long param3);mf_abre_tablas("Grupos de Turnos",'dw_grupocita_qx',0)
end event

event e_turagrp(long param1, long param2, long param3);mf_abre_tablas2("Areas por Grupos de Turnos",'dw_combo_grupocitaqx','dw_consulgcita_qx')
end event

event e_pabellon(long param1, long param2, long param3);mf_abre_tablas2("Pabellón",'dw_combo_lugar_label','dw_pabellon')
end event

event e_habitacion(long param1, long param2, long param3);mf_abre_tablas3("Habitación",'dw_combo_lugar_label','dw_combo_pabellon','dw_habitacion')
end event

event e_camas(long param1, long param2, long param3);OpenSheet(w_camas, w_principal, 1,original!)
end event

event e_kits(long param1, long param2, long param3);OpenSheet(w_kits_hosp, w_principal, 1,original!)
end event

event e_triagge(long param1, long param2, long param3);mf_abre_tablas("Estados Triage",'dw_triage',0)
end event

event e_tparto(long param1, long param2, long param3);mf_abre_tablas("Tipo Parto",'dw_tipo_parto',0)
end event

event e_porden(long param1, long param2, long param3);OpenSheet(w_primer_orden, w_principal, 1,original!)
end event

event e_ipsr(long param1, long param2, long param3);mf_abre_tablas("Instituciones a donde Remitir",'dw_remitir',0)
end event

event e_odontosp(long param1, long param2, long param3);mf_abre_tablas("Odontología Superficies",'dw_odonto_superficie',0)
end event

event e_odontocu(long param1, long param2, long param3);mf_abre_tablas("Odontología Cuadrantes",'dw_odonto_cuadrante',0)
end event

event e_odontopz(long param1, long param2, long param3);mf_abre_tablas2("Piezas Odontologicas",'dw_odonto_cuadrante_drop','dw_odonto_pieza')
end event

event e_odontocua(long param1, long param2, long param3);mf_abre_tablas("Odontología Convenciones",'dw_odonto_convencion',0)
end event

event e_odontocfg(long param1, long param2, long param3);Open(w_convproced)
end event

event e_qxanes(long param1, long param2, long param3);mf_abre_tablas("Tipos de Anestesia",'dw_tipo_anes',0)

end event

event e_qxsalas(long param1, long param2, long param3);mf_abre_tablas("Salas Quirúrgicas",'dw_salaqx',0)


end event

event e_qxcgrp(long param1, long param2, long param3);OpenSheet(w_qxconf, w_principal, 1,original!)
end event

event e_qxcuvr(long param1, long param2, long param3);OpenSheet(w_qxconf_iss, w_principal, 1,original!)
end event

event e_qxlateralidad(long param1, long param2, long param3);mf_abre_tablas("Latearalidad",'dw_lateralidad',0)
end event

event e_medcls(long param);mf_abre_tablas("Clase de Medicamento",'dw_medclase',0)
end event

event e_medpact(long param);mf_abre_tablas("Principio Activo",'dw_medprinactivo',0)
end event

event e_medff(long param);mf_abre_tablas("Forma Farmacéutica",'dw_medformafarma',0)

end event

event e_medum(long param);mf_abre_tablas("Unidad de Medida",'dw_medunimedida',0)
end event

event e_medva(long param);mf_abre_tablas("Vía Administración",'dw_formula_via',0)
end event

event e_medsmf(long param);mf_abre_tablas("Semaforos Medicamentos",'dw_semaforo_medica',0)
end event

event e_medumd(long param);mf_abre_tablas("Unidad de Medida Dian",'dw_umedida_dian',0)

end event

event e_medicamnto(long param);opensheet(w_medgrupo,w_principal, 1,original!)
end event

event e_hcvdx(long param1, long param2, long param3);mf_abre_tablas("Versiones de Diagnósticos",'dw_vers_diag',0)
end event

event e_hcapcdx(long param1, long param2, long param3);mf_abre_tablas2("Capítulos de Diagnósticos",'dw_combo_verdiag','dw_capsdiags')

end event

event e_hcdx(long param1, long param2, long param3);mf_abre_tablas2("Diagnósticos",'dw_combo_verdiag','dw_diags')

end event

event e_hcedaddx(long param1, long param2, long param3);mf_abre_tablas2("Diagnósticos",'dw_combo_verdiag','dw_diagedad')
end event

event e_edadfin(long param1, long param2, long param3);mf_abre_tablas2("Edades por Finalidad",'dw_combo_finconsulta','dw_edad_finalidad')
end event

event e_ocupv(long param1, long param2, long param3);mf_abre_tablas("Versiones de Ocupaciones",'dw_vers_ocupaciones',0)
end event

event e_ocupacion(long param1, long param2, long param3);OpenSheet(w_ocupaciones, w_principal, 1,original!)
end event

event e_esten(long param1, long param2, long param3);mf_abre_tablas('Estadisticas - Entidades','dw_estad_enti',0)
end event

event e_estedad(long param1, long param2, long param3);mf_abre_tablas2("Estadísticas - Grupo etareo Entidad ",'dw_comb_estad_enti','dw_estad_edad')
end event

event e_hcplan(long param1, long param2, long param3);OpenSheet(w_plant_hcs, w_principal, 1,original!)
w_principal.arrangesheets(layer!)
end event

event e_hccurva(long param1, long param2, long param3);mf_abre_tablas("Tipo Gráfica Hc",'dw_hclin_graficas',0)
end event

event e_hcpercen(long param1, long param2, long param3);mf_abre_tablas2("Percentiles - Graficas Hc",'dw_combo_hclin_graficas','dw_hclin_graficas_porcentil')
end event

event e_hcantc(long param1, long param2, long param3);OpenSheet(w_antecedentes, w_principal, 1,original!)
end event

event e_epab(long param1, long param2, long param3);OpenSheet(w_empresas, w_principal, 1,original!)

end event

event e_contrato(long param1, long param2, long param3);opensheet(w_contratos,w_principal,1,original!)
w_principal.arrangesheets(layer!)
end event

event e_fmanual(long param1, long param2, long param3);mf_abre_tablas("Manuales tarifarios",'dw_manuales',0)
end event

event e_fsoat(long param1, long param2, long param3);OpenSheet(w_serv_man_soat, w_principal, 1,original!)
end event

event e_fliqsoat(long param1, long param2, long param3);OpenSheet(w_liq_grupo_soat, w_principal, 1,original!)
end event

event e_fuvr(long param1, long param2, long param3);OpenSheet(w_serv_man_iss, w_principal, 1,original!)
end event

event e_fliquvr(long param1, long param2, long param3);OpenSheet(w_liq_uvr, w_principal, 1,original!)
end event

event e_ftarmed(long param1, long param2, long param3);mf_abre_tablas2("Tarifas de Medicamentos",'dw_combo_manual_med','dw_tarifa_med')
end event

event e_ftarpro(long param1, long param2, long param3);mf_abre_tablas2("Tarifas de procedimientos de tipo General",'dw_combo_manual','dw_tarifas')

end event

event e_cupsv(long param);mf_abre_tablas("Versiones de CUPS",'dw_vers_cups',0)
end event

event e_cupssec(long param);mf_abre_tablas2("Secciones de Procedimientos en Salud",'dw_combo_vcups','dw_proc_secciones')
end event

event e_cupscap(long param);mf_abre_tablas3("Capítulos de Procedimientos en Salud",'dw_combo_vcups','dw_combo_secciones','dw_proc_capitulo')
end event

event e_cupsgrp(long param);mf_abre_tablas2("Grupos de Procedimientos",'dw_combo_vcups','dw_prog_grupo')

end event

event e_cupssgrp(long param);mf_abre_tablas3("Subgrupos de Procedimientos",'dw_combo_vcups','dw_combo_pgrupo','dw_proc_subgrupo')
end event

event e_cupscate(long param);opensheet(w_pcategorias,w_principal,1,original!)
end event

event e_cups(long param);opensheet(w_procedimientos,w_principal,1,original!)
end event

event e_cupsespe(long param);OpenSheet(w_proc_especialidad, w_principal, 1,original!)
end event

event e_planes(long param1, long param2, long param3);mf_abre_tablas("Planes de Servicios",'dw_plan',0)
end event

event e_planmed(long param1, long param2, long param3);OpenSheet(w_plan_medica, w_principal, 1,original!)
end event

event e_planproc(long param1, long param2, long param3);OpenSheet(w_planes, w_principal, 1,original!)
end event

event e_uf(long param1, long param2, long param3);mf_abre_tablas("Unidad Funcional",'dw_ufun',0)
end event

event e_cc(long param1, long param2, long param3);//mf_abre_tablas2("Centros de Costo",'dw_combo_ufun','dw_centro_costos')
opensheet(w_centros_costo,w_principal,1,original!)
w_principal.arrangesheets(layer!)

end event

event e_srvufcc(long param1, long param2, long param3);OpenSheet(w_serv_x_cc, w_principal, 1,original!)
end event

event e_up(long param);window  lw_sheet
string ls_pic
ribbontabbuttonitem lrbb_item

this.gettabbutton(param, lrbb_item)
lw_sheet = parent.getactivesheet( )
if isvalid(lw_sheet) then
	if lw_sheet.WindowState =Maximized!  or lw_sheet.WindowState =Normal! then 
		ls_pic = ".\img\ribon_up.ico"
		lrbb_item.text = "Maximiza"		
		lw_sheet.WindowState = Minimized!
	else
		ls_pic = ".\img\ribon_dw.ico"
		lrbb_item.text = "Maximiza"
		lw_sheet.WindowState = Maximized!
	end if
end if
lrbb_item.picturename = ls_pic
this.settabbutton( param,lrbb_item)

end event

event e_reportes(long param);opensheet(w_reportes,w_principal,1,original!)
w_principal.arrangesheets(layer!)
end event

event e_hcdxfina(long param1, long param2, long param3);mf_abre_tablas2("Diagnóstico por Finalidad",'dw_combo_finconsulta','dw_diag_finalidad')

end event

event e_pypact(long param1, long param2, long param3);mf_abre_tablas("Actividades de PyP",'dw_pyp_act',0)


end event

event e_pypcond(long param1, long param2, long param3);mf_abre_tablas("Condiciones de PyP",'dw_condiciones',0)

end event

event e_pypconf(long param1, long param2, long param3);OpenSheet(w_pyp_config, w_principal, 1,original!)
end event

event e_vacunas(long param1, long param2, long param3);mf_abre_tablas("Vacunas",'dw_vacuna',0)
end event

event e_vacconf(long param1, long param2, long param3);mf_abre_tablas2("Configurar Vacunas",'dw_vacuna_drop','dw_vacuna_config')
end event

event e_tserv(long param1, long param2, long param3);mf_abre_tablas("Tipo Servicios",'dw_tipo_queja_serv',0)
end event

event e_tqueja(long param1, long param2, long param3);opensheet(w_tipo_queja,w_principal,1,original!)
end event

event e_campopedt(long param1, long param2, long param3);mf_abre_tablas("Campos 4505",'dw_variable_salud',0)
end event

event e_femstusu(long param);mf_abre_tablas("Tipo Usuario MS","dw_tipo_usuario_fems",0)


end event

event e_femstide(long param);mf_abre_tablas("Tipo Usuario MS",'dw_tipoidentificacion_fems',0)

end event

event e_femstctp(long param);mf_abre_tablas("Mod Contrato MS",'dw_modopago_fems',0)
end event

event e_femspcob(long param);mf_abre_tablas("Plan Beneficio MS",'dw_planbene_fems',0)
end event

event e_pres_ambito(long param1, long param2, long param3);mf_abre_tablas("Mipres Ambito Atención",'dw_mipres_ambito_aten',1)
end event

event e_mipres_enfhu(long param1, long param2, long param3);mf_abre_tablas("Mipres Enfermedad Huerfana",'dw_mipres_enfhuerfana',1)
end event

event e_mipresfrecuso(long param1, long param2, long param3);mf_abre_tablas("Mipres Frecuencia de Uso",'dw_mipres_frecuencia_uso',1)
end event

event e_mipres_tdispo(long param1, long param2, long param3);mf_abre_tablas("Mipres Tipo Dispositivo",'dw_mipres_tipodispo',1)

end event

event e_mipres_servc(long param1, long param2, long param3);mf_abre_tablas("Mipres Servicios Complementarios",'dw_mipres_sercom',1)

end event

event e_mipres_tipom(long param1, long param2, long param3);mf_abre_tablas("Mipres Tipo Medicamento",'dw_mipres_tmedica',1)

end event

event e_mipres_viaadm(long param1, long param2, long param3);mf_abre_tablas("Mipres Via Administración",'dw_mipres_viaadm',1)

end event

event e_mipres_formaf(long param1, long param2, long param3);mf_abre_tablas("Mipres Forma Farmaceutica",'dw_mipres_formafa',1)
end event

event e_mipres_unidadmed(long param1, long param2, long param3);mf_abre_tablas("Mipres Unidad de Medida",'dw_mipres_unidadmed',1)
end event

event e_mipres_indesp(long param1, long param2, long param3);mf_abre_tablas("Mipres Indicación Especial",'dw_mipres_indesp',1)
end event

event e_mipres_tipopn(long param1, long param2, long param3);mf_abre_tablas("Mipres Tipo Producto Nutricional",'dw_mipres_tipopn',1)
end event

event e_mipres_prodnuti(long param1, long param2, long param3);mf_abre_tablas("Mipres Producto Nutricional",'dw_mipres_prodnuti',1)
end event

event e_mipres_formapn(long param1, long param2, long param3);mf_abre_tablas("Mipres Forma Producto Nutricional",'dw_mipres_formapn',1)
end event

event e_causaext(long param1, long param2, long param3);mf_abre_tablas("Causa Externa",'dw_pm_causaexterna',0)
end event

event e_viaingreso(long param1, long param2, long param3);mf_abre_tablas("Vía Ingreso",'dw_pm_viaingreso',0)
end event

event e_clasep(long param1, long param2, long param3);mf_abre_tablas("Clase Procedimiento",'dw_pm_clase_proc',0)
end event

event e_finproc(long param1, long param2, long param3);mf_abre_tablas("Finalidad Procedimiento",'dw_tipo_procedimiento',0)
end event

event e_desteg(long param1, long param2, long param3);mf_abre_tablas("Destino Egreso",'dw_pm_destino_salida',0)
end event

event e_gserv(long param1, long param2, long param3);mf_abre_tablas("Grupo Servicio",'dw_pm_grpservicio',0)
end event

event e_modarealiza(long param1, long param2, long param3);mf_abre_tablas("Modalidad Realización",'dw_modalidad_realiza',0)
end event

event e_cita_tipo(long param1, long param2, long param3);mf_abre_tablas("Tipo Cita",'dw_tipo_cita',0)

end event

event e_atc(long param);mf_abre_tablas("Codigos ATC",'dw_pm_codigoatc',0)
end event

event e_estcivil(long param);mf_abre_tablas("Estado Civil",'dw_pm_estado_civil',0)
end event

event e_hcins(long param1, long param2, long param3);mf_abre_tablas("Instrumentos Hc",'dw_instrumento_hc',0)
end event

event e_parentesco(long param);mf_abre_tablas("Parentesco",'dw_pm_parentesco',0)
end event

event e_pvulnera(long param);mf_abre_tablas("Poblacion Vulnerable",'dw_pm_pobla_vulnera',0)
end event

event e_rcoms(long param1, long param2, long param3);mf_abre_tablas("Tabla Riesgo Cardiaco OMS",'dw_oms_riesgocardio',0)
end event

event e_umm(long param);mf_abre_tablas("Unidad Miníma Dispensación",'dw_unidamdispensa',0)
end event

event e_tmedica(long param);mf_abre_tablas("tipo Medicamento",'dw_tmedica',0)
end event

event e_menu(long param, long param2, long param3);mf_abre_tablas("Aplicaciones",'dw_pm_aplicativos',0)
end event

event e_metplanifica(long param);mf_abre_tablas("Metodo Planificación",'dw_pm_mplanifica',0)
end event

event e_moduloa(long param);mf_abre_tablas("Modulos Anulación",'dw_modulo_anula',0)

end event

event e_pypcohortes(long param1, long param2, long param3);if not enabled then return
opensheet (w_cohortes,w_principal,7,original!)

end event

event e_cqueja(long param1, long param2, long param3);mf_abre_tablas("Clase Queja",'dw_pm_tipo_queja',0)
end event

event e_zonar(long param1, long param2, long param3);mf_abre_tablas("Zona Residencia",'dw_pm_zona',0)
end event

event e_oserv(long param1, long param2, long param3);mf_abre_tablas("Otros Servicios",'dw_pm_oserv',0)
end event

event e_local(long param1, long param2, long param3);mf_abre_tablas("Localidaddes",'dw_localidad',0)
end event

event e_microt(long param1, long param2, long param3);OpenSheet(w_microter, w_principal, 1,original!)
end event

event e_ugob(long param1, long param2, long param3);mf_abre_tablas("Unidad Gobierno",'dw_pm_ugob',0)
end event

event e_duramed(long param);mf_abre_tablas("Duración Medicamentos",'dw_pm_duracion_med',0)
end event

event e_frecmed(long param);mf_abre_tablas("Frecuencia Medicamentos",'dw_frecuencia_medica',0)
end event

event e_grepserv(long param1, long param2, long param3);mf_abre_tablas("Reps Servicio",'dw_pm_servicios',0)
end event

event e_servcups(long param1, long param2, long param3);OpenSheet(w_reps_cups, w_principal, 1,Layered!)
end event

event e_servlugar(long param1, long param2, long param3);mf_abre_tablas2("Reps VS Lugar",'dw_combo_lugar','dw_pm_servicios_lugar')
end event

event e_apdxnotap(long param1, long param2, long param3);mf_abre_tablas("Notas Procesamiento",'dw_pm_notas_apdx',0)
end event

event e_adire(long param1, long param2, long param3);mf_abre_tablas("Abreviatura Direcciones",'dw_pm_direccion',0)
end event

event e_fincext(long param1, long param2, long param3);mf_abre_tablas("Finalidad vs Causa Externa",'dw_finconsulta_causaexterna',0)
end event

event e_finproced(long param1, long param2, long param3);mf_abre_tablas("Finalidad vs Procedimiento",'dw_finconsulta_proced',0)
end event

event e_lugprofe(long param1, long param2, long param3);mf_abre_tablas2("Lugares Profesionales",'dw_profe_combo','dw_profe_lugar')
end event

