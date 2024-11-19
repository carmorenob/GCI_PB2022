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
integer width = 5449
integer height = 1496
boolean titlebar = true
string title = "Gestión Cliente Interno"
string menuname = "m_mdiadm"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdi!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "gci_int.ico"
mdi_1 mdi_1
rbb_1 rbb_1
end type
global w_principal w_principal

type variables
uo_datastore dw_control
boolean l_con=true,l_tes=true,l_sum=true,l_car=true,l_act=true,l_nom=true,l_cos=true,l_pre=true
transaction sqlcr

end variables

forward prototypes
public subroutine lf_titulo ()
public subroutine f_init_ribbonbar (ribbonbar nom_rib, boolean rib_boo)
public subroutine mf_abre_tablas2 (string titulo, string dw_dataobject1, string dw_dataobject2)
public subroutine mf_abre_tablas3 (string titulo, string dw_dataobject1, string dw_dataobject2, string dw_dataobject3)
public subroutine mf_abre_tablas (string titulo, string dw_dataobject, integer mipres)
end prototypes

public subroutine lf_titulo ();string descrip
select descripcion into :descrip from lugar where codlugar=:clugar;
title='GCI Ltda.  [* * '+ f_coloca_esp(descrip)+' * *]'
title+=' ('+usuario+') '+g_descrip_usu
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
	SELECTblob ribon into :ls_ribon from pm_aplicativos where cod_aplica='ADM';
	if isnull(ls_ribon) then 
		//messagebox('Atención','No se puede cargar ribon')
		nom_rib.ImportFromXMLFile ("adm.xml") 
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
	f_poblar_menus_ribon(rbb_1,'ADM')
	return
End If
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

on w_principal.create
if this.MenuName = "m_mdiadm" then this.MenuID = create m_mdiadm
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
//settoolbar(1,true,AlignAtTop!,"GCI Administrativo")
//f_poblar_menus()
f_init_ribbonbar(rbb_1,True)
//dw_control = create uo_datastore
//dw_control.dataobject="dw_control_red"
//dw_control.settransobject(sqlca)
timer(1)
lf_titulo()
SELECT ENTERO into :i_dec_gral_car
FROM parametros_gen
WHERE (((codigo_para)=30));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 32')
	return 
end if
end event

event close;if isvalid(w_presenta) then close(w_presenta)
delete from control_red where nom_equipo=upper(:g_nequipo) and aplicativo not like 'H%';
RUN("del c:\windows\temp\*.pdf")
RUN("del c:\windows\temp\*.png")
RUN("del c:\windows\temp\*.log")
commit;
disconnect;
HALT
end event

event timer;if isvalid(w_presenta) then
	close(w_presenta)
	setfocus()
	timer(80)
	return
end if

if not l_con then 
	if f_num_compu('c','o')=false then messagebox("Atención","Se encuentran trabajando más computadores de los licenciados")
end if

if not l_tes then 
	if f_num_compu('t','o')=false then messagebox("Atención","Se encuentran trabajando más computadores de los licenciados")
end if

if not l_sum then 
	if f_num_compu('s','o')=false then messagebox("Atención","Se encuentran trabajando más computadores de los licenciados")
end if

if not l_car then 
	if f_num_compu('r','o')=false then messagebox("Atención","Se encuentran trabajando más computadores de los licenciados")
end if 

if not l_act then 
	if f_num_compu('a','o')=false then messagebox("Atención","Se encuentran trabajando más computadores de los licenciados")
end if 

if not l_nom then 
	if f_num_compu('n','o')=false then messagebox("Atención","Se encuentran trabajando más computadores de los licenciados")
end if 
if not l_cos then 
	if f_num_compu('o','o')=false then messagebox("Atención","Se encuentran trabajando más computadores de los licenciados")
end if 

if not l_pre then 
	if f_num_compu('p','o')=false then messagebox("Atención","Se encuentran trabajando más computadores de los licenciados")
end if 
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
long BackColor=268435456
end type

type rbb_1 from ribbonbar within w_principal
event e_tercero ( long param )
event e_utercero ( long param )
event e_cierra ( long param )
event e_cierrav ( long param )
event e_cambialug ( long param )
event e_acerca ( long param,  long param2,  long param3 )
event e_asientoc ( long param )
event e_plantillac ( long param )
event e_librosc ( long param )
event e_planc ( long param )
event e_periodosc ( long param )
event e_empresac ( long param,  long param2,  long param3 )
event e_asientosc ( long param,  long param2,  long param3 )
event e_estadosc ( long param,  long param2,  long param3 )
event e_utiliper ( long param,  long param2,  long param3 )
event e_clasficac ( long param,  long param2,  long param3 )
event e_up ( long param )
event e_transc ( long param,  long param2,  long param3 )
event e_docuec ( long param,  long param2,  long param3 )
event e_regimenc ( long param,  long param2,  long param3 )
event e_retencionc ( long param,  long param2,  long param3 )
event e_impuestoc ( long param,  long param2,  long param3 )
event e_almacenes ( long param,  long param2,  long param3 )
event e_vunspsc ( long param,  long param2,  long param3 )
event e_cunspsc ( long param,  long param2,  long param3 )
event e_actieco ( long param,  long param2,  long param3 )
event e_arqueo ( long param )
event e_cajamy ( long param )
event e_mvtosb ( long param )
event e_rfc ( long param )
event e_planillap ( long param )
event e_ordenp ( long param )
event e_repocm ( long param )
event e_mvtocm ( long param )
event e_certifica ( long param )
event e_reasigna ( long param )
event e_tranteso ( long param,  long param2,  long param3 )
event e_operateso ( long param,  long param2,  long param3 )
event e_conpago ( long param,  long param2,  long param3 )
event e_tiporfc ( long param,  long param2,  long param3 )
event e_cajamnp ( long param,  long param2,  long param3 )
event e_cajamp ( long param,  long param2,  long param3 )
event e_bancost ( long param,  long param2,  long param3 )
event e_cuenban ( long param,  long param2,  long param3 )
event e_notaban ( long param,  long param2,  long param3 )
event e_datosban ( long param,  long param2,  long param3 )
event e_suministros ( long param )
event e_nomina ( long param )
event e_ajustelote ( long param )
event e_unificart ( long param )
event e_costop ( long param )
event e_sumperiodo ( long param )
event e_grpcls ( long param,  long param2,  long param3 )
event e_generico ( long param,  long param2,  long param3 )
event e_articulo ( long param,  long param2,  long param3 )
event e_pac ( long param,  long param2,  long param3 )
event e_sumcon ( long param,  long param2,  long param3 )
event e_sumrie ( long param,  long param2,  long param3 )
event e_sumtpago ( long param,  long param2,  long param3 )
event e_sumconlote ( long param,  long param2,  long param3 )
event e_suminterc ( long param,  long param2,  long param3 )
event e_afregistro ( long param )
event e_afrespon ( long param )
event e_afmtto ( long param )
event e_afdeprecia ( long param )
event e_afdevuelve ( long param )
event e_afbaja ( long param )
event e_afcomo ( long param )
event e_afplaca ( long param )
event e_afsecc ( long param,  long param2,  long param3 )
event e_cartera ( long param )
event e_carob ( long param )
event e_carta ( long param )
event e_carren ( long param )
event e_carrecla ( long param )
event e_carper ( long param )
event e_cartrans ( long param,  long param2,  long param3 )
event e_caroper ( long param,  long param2,  long param3 )
event e_carentidad ( long param,  long param2,  long param3 )
event e_caredad ( long param,  long param2,  long param3 )
event e_carreg ( long param,  long param2,  long param3 )
event e_carobjn ( long param,  long param2,  long param3 )
event e_carrtan ( long param,  long param2,  long param3 )
event e_nomhv ( long param )
event e_nomcargos ( long param )
event e_nomprogra ( long param )
event e_nomsuplem ( long param )
event e_nomausen ( long param )
event e_nomahor ( long param )
event e_nomsuge ( long param )
event e_nomcargp ( long param,  long param2,  long param3 )
event e_nomtipoc ( long param,  long param2,  long param3 )
event e_nomcop ( long param,  long param2,  long param3 )
event e_nomccargo ( long param,  long param2,  long param3 )
event e_nomrete ( long param,  long param2,  long param3 )
event e_nomvref ( long param,  long param2,  long param3 )
event e_nomfest ( long param,  long param2,  long param3 )
event e_nomreqc ( long param,  long param2,  long param3 )
event e_nomtipoaus ( long param,  long param2,  long param3 )
event e_nomfun ( long param,  long param2,  long param3 )
event e_nomnivel ( long param,  long param2,  long param3 )
event e_nomtrabs ( long param,  long param2,  long param3 )
event e_nomturno ( long param,  long param2,  long param3 )
event e_nomciclo ( long param,  long param2,  long param3 )
event e_nomintcon ( long param,  long param2,  long param3 )
event e_nominppto ( long param,  long param2,  long param3 )
event e_nomban ( long param,  long param2,  long param3 )
event e_nombanofc ( long param,  long param2,  long param3 )
event e_nomperfil ( long param,  long param2,  long param3 )
event e_nomevalorg ( long param )
event e_nomeval ( long param )
event e_pptotras ( long param,  long param2,  long param3 )
event e_pptoadic ( long param,  long param2,  long param3 )
event e_pptorec ( long param,  long param2,  long param3 )
event e_pptoplan ( long param )
event e_pptosold ( long param,  long param2,  long param3 )
event e_pptosdis ( long param,  long param2,  long param3 )
event e_pptores ( long param,  long param2,  long param3 )
event e_pptogiro ( long param,  long param2,  long param3 )
event e_pptorecon ( long param,  long param2,  long param3 )
event e_pptoreca ( long param,  long param2,  long param3 )
event e_pptored ( long param,  long param2,  long param3 )
event e_pptovig ( long param )
event e_pptorequil ( long param )
event e_pptocon ( long param )
event e_pptocosto ( long param )
event e_pptoconvenio ( long param )
event e_contratos ( long param )
event e_contreq ( long param )
event e_contpoli ( long param )
event e_conttipo ( long param )
event e_contrxt ( long param )
event e_contcausa ( long param )
event e_contpago ( long param )
event e_reportes ( long param )
event e_contclase ( long param )
event e_otrosrep ( long param )
event e_impresora ( long param )
event e_contratoss ( long param )
event e_contratosn ( long param )
event e_nompre ( long param )
event e_tipoimpues ( long param,  long param2,  long param3 )
event e_tipoobliga ( long param,  long param2,  long param3 )
event e_costo_gi ( long param )
event e_costo_gicc ( long param )
event e_costo_gimes ( long param )
event e_costo_ins ( long param )
event e_costo_can ( long param )
event e_costo_tg ( long param )
event e_costo_dep ( long param )
event e_costo_calculo ( long param )
event e_costo_depd ( long param )
event e_nomasalario ( long param,  long param2,  long param3 )
integer width = 3575
integer height = 492
long backcolor = 15132390
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event e_tercero(long param);opensheet(w_cfgterceros,w_principal,0,Original!)
w_principal.arrangesheets(layer!)
end event

event e_utercero(long param);opensheet(w_borra_repetid,w_principal,0,Original!)
w_principal.arrangesheets(layer!)
end event

event e_cierra(long param);disconnect;
if isvalid(w_presenta) then close(w_presenta)
HALT
close(parent)
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

event e_cambialug(long param);open(w_cambia_lugar)
end event

event e_acerca(long param, long param2, long param3);openwithparm(w_acercade,'adm')
w_principal.arrangesheets(layer!)

end event

event e_asientoc(long param);if l_con then
	if not f_num_compu('c','I') then return
	l_con=false
else
   if not f_num_compu('c','o') then return
end if
opensheet(w_comp_cont,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_plantillac(long param);if l_con then
	if not f_num_compu('c','I') then return
	l_con=false
else
   if not f_num_compu('c','o') then return
end if
opensheet(w_plantilla_asiento,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_librosc(long param);if l_con then
	if not f_num_compu('c','I') then return
	l_con=false
else
   if not f_num_compu('c','o') then return
end if
opensheet(w_rad_lib,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_planc(long param);if l_con then
	if not f_num_compu('c','I') then return
	l_con=false
else
   if not f_num_compu('c','o') then return
end if
opensheet(w_plan2,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_periodosc(long param);if l_con then
	if not f_num_compu('c','I') then return
	l_con=false
else
   if not f_num_compu('c','o') then return
end if
opensheet(w_meses,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_empresac(long param, long param2, long param3);if l_con then
	if not f_num_compu('c','I') then return
	l_con=false
else
   if not f_num_compu('c','o') then return
end if
mf_abre_tablas("Contabilidad - Empresa",'dw_empresa_cont',0)
end event

event e_asientosc(long param, long param2, long param3);if l_con then
	if not f_num_compu('c','I') then return
	l_con=false
else
   if not f_num_compu('c','o') then return
end if
mf_abre_tablas2("Contabilidad - Asientos Contables",'dw_combo_cont_empresa','dw_doc_cont_todo')
end event

event e_estadosc(long param, long param2, long param3);if l_con then
	if not f_num_compu('c','I') then return
	l_con=false
else
   if not f_num_compu('c','o') then return
end if
opensheet(w_configura_estados,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_utiliper(long param, long param2, long param3);if l_con then
	if not f_num_compu('c','I') then return
	l_con=false
else
   if not f_num_compu('c','o') then return
end if
mf_abre_tablas2("Contabilidad - Cuentas de Utilidad y Pérdida",'dw_combo_cont_empresa','dw_ctas_uti_perd_desc')
end event

event e_clasficac(long param, long param2, long param3);if l_con then
	if not f_num_compu('c','I') then return
	l_con=false
else
   if not f_num_compu('c','o') then return
end if
opensheet(w_clasific_cuentas,w_principal,0,original!)
w_principal.arrangesheets(layer!)
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

event e_transc(long param, long param2, long param3);if l_con then
	if not f_num_compu('c','I') then return
	l_con=false
else
   if not f_num_compu('c','o') then return
end if
mf_abre_tablas("Contabilidad - Transacciones Contables",'dw_tipo_transac',0)
end event

event e_docuec(long param, long param2, long param3);if l_con then
	if not f_num_compu('c','I') then return
	l_con=false
else
   if not f_num_compu('c','o') then return
end if
mf_abre_tablas2("Contabilidad - Documentos Externos",'dw_combo_cont_empresa','dw_doc_ext')

end event

event e_regimenc(long param, long param2, long param3);if l_con then
	if not f_num_compu('c','I') then return
	l_con=false
else
   if not f_num_compu('c','o') then return
end if
mf_abre_tablas("Contabilidad - Tipo Régimen",'dw_sum_tipo_reg',0)

end event

event e_retencionc(long param, long param2, long param3);if l_con then
	if not f_num_compu('c','I') then return
	l_con=false
else
   if not f_num_compu('c','o') then return
end if
mf_abre_tablas2("Contabilidad - Tablas de Retención",'dw_combo_concepto_rtefte','dw_retefuente')
end event

event e_impuestoc(long param, long param2, long param3);if l_con then
	if not f_num_compu('c','I') then return
	l_con=false
else
   if not f_num_compu('c','o') then return
end if
opensheet(w_cont_impu,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_almacenes(long param, long param2, long param3);if l_sum then
	if not f_num_compu('s','I') then return
	l_sum=false
else
	if not f_num_compu('s','o') then return
end if
opensheet(w_almacen,w_principal,0,Original!)
w_principal.arrangesheets(layer!)
end event

event e_vunspsc(long param, long param2, long param3);if l_con then
	if not f_num_compu('c','I') then return
	l_con=false
else
   if not f_num_compu('c','o') then return
end if
mf_abre_tablas("Contabilidad - Versión UNSPSC",'dw_version_unspsc',0)
end event

event e_cunspsc(long param, long param2, long param3);if l_con then
	if not f_num_compu('c','I') then return
	l_con=false
else
   if not f_num_compu('c','o') then return
end if
opensheet(w_unspsc,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_actieco(long param, long param2, long param3);if l_con then
	if not f_num_compu('c','I') then return
	l_con=false
else
   if not f_num_compu('c','o') then return
end if
mf_abre_tablas("Contabilidad - Actividad Economica",'dw_act_econ',0)

end event

event e_arqueo(long param);if l_tes then
	if not f_num_compu('t','I') then return
	l_tes=false
else
	if not f_num_compu('t','o') then return
end if
opensheet(w_arqueo,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_cajamy(long param);if l_tes then
	if not f_num_compu('t','I') then return
	l_tes=false
else
	if not f_num_compu('t','o') then return
end if
opensheet(w_movimiento_caja_mayor,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_mvtosb(long param);if l_tes then
	if not f_num_compu('t','I') then return
	l_tes=false
else
	if not f_num_compu('t','o') then return
end if
opensheet(w_movimiento_bancario,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_rfc(long param);if l_tes then
	if not f_num_compu('t','I') then return
	l_tes=false
else
	if not f_num_compu('t','o') then return
end if
opensheet(w_recibe_fact,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_planillap(long param);if l_tes then
	if not f_num_compu('t','I') then return
	l_tes=false
else
	if not f_num_compu('t','o') then return
end if
opensheet(w_relacion_pago,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_ordenp(long param);if l_tes then
	if not f_num_compu('t','I') then return
	l_tes=false
else
	if not f_num_compu('t','o') then return
end if
opensheet(w_orden_pago2,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_repocm(long param);if l_tes then
	if not f_num_compu('t','I') then return
	l_tes=false
else
	if not f_num_compu('t','o') then return
end if
opensheet(w_repone_cmenor,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_mvtocm(long param);if l_tes then
	if not f_num_compu('t','I') then return
	l_tes=false
else
	if not f_num_compu('t','o') then return
end if
opensheet(w_movimiento_caja_menor,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_certifica(long param);if l_tes then
	if not f_num_compu('t','I') then return
	l_tes=false
else
	if not f_num_compu('t','o') then return
end if
opensheet(w_teso_certifica,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_reasigna(long param);if l_tes then
	if not f_num_compu('t','I') then return
	l_tes=false
else
	if not f_num_compu('t','o') then return
end if
opensheet(w_reasigna_receps,w_principal,0,original!)
w_principal.arrangesheets(layer!)

end event

event e_tranteso(long param, long param2, long param3);if l_tes then
	if not f_num_compu('t','I') then return
	l_tes=false
else
	if not f_num_compu('t','o') then return
end if
mf_abre_tablas("Tipo Transacciones",'dw_car_tipo_opera',0)

end event

event e_operateso(long param, long param2, long param3);if l_tes then
	if not f_num_compu('t','I') then return
	l_tes=false
else
	if not f_num_compu('t','o') then return
end if
mf_abre_tablas("Tipo operaciones Tesorería",'dw_car_opera',0)

end event

event e_conpago(long param, long param2, long param3);if l_tes then
	if not f_num_compu('t','I') then return
	l_tes=false
else
	if not f_num_compu('t','o') then return
end if
mf_abre_tablas2("Conceptos de Pagos",'dw_combo_cont_empresa','dw_concep_relfact')
w_principal.arrangesheets(layer!)
end event

event e_tiporfc(long param, long param2, long param3);if l_tes then
	if not f_num_compu('t','I') then return
	l_tes=false
else
	if not f_num_compu('t','o') then return
end if
mf_abre_tablas("Tipos de Recepción de Facturas",'dw_tipo_recep_fact',0)

end event

event e_cajamnp(long param, long param2, long param3);if l_tes then
	if not f_num_compu('t','I') then return
	l_tes=false
else
	if not f_num_compu('t','o') then return
end if
opensheet(w_caja_menor,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_cajamp(long param, long param2, long param3);if l_tes then
	if not f_num_compu('t','I') then return
	l_tes=false
else
	if not f_num_compu('t','o') then return
end if
mf_abre_tablas2("Caja Mayor",'dw_combo_lugar','dw_caja_mayor')
w_principal.arrangesheets(layer!)
end event

event e_bancost(long param, long param2, long param3);if l_tes then
	if not f_num_compu('t','I') then return
	l_tes=false
else
	if not f_num_compu('t','o') then return
end if
mf_abre_tablas("Lista Bancos",'dw_pm_bancos',0)
end event

event e_cuenban(long param, long param2, long param3);if l_tes then
	if not f_num_compu('t','I') then return
	l_tes=false
else
	if not f_num_compu('t','o') then return
end if
opensheet(w_bancos_cuentas,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_notaban(long param, long param2, long param3);if l_tes then
	if not f_num_compu('t','I') then return
	l_tes=false
else
	if not f_num_compu('t','o') then return
end if
mf_abre_tablas2("Notas Bancarias",'dw_combo_cont_empresa','dw_tnota_ban')
w_principal.arrangesheets(layer!)
end event

event e_datosban(long param, long param2, long param3);if l_tes then
	if not f_num_compu('t','I') then return
	l_tes=false
else
	if not f_num_compu('t','o') then return
end if
mf_abre_tablas("Datos Cuentas Bancarias",'dw_bancos_seg',0)
end event

event e_suministros(long param);if l_sum then
	if not f_num_compu('s','I') then return
	l_sum=false
else
	if not f_num_compu('s','o') then return
end if

string camino,coddocumento
integer nivel

//messagebox('',string(param))
setnull(coddocumento)
choose case param
	case 45
		coddocumento='SE'
		nivel=1
	case 46
		coddocumento='SDN'
		nivel=2
	case 47
		coddocumento='SEP'
		 nivel=3
	case 48
		coddocumento='SF'
		 nivel=4
	case 49
		coddocumento='SI'
		 nivel=5
	case 50
		coddocumento='SN'
		 nivel=6
	case 51
		coddocumento='SVR'
		 nivel=7

////EGRESOS		 
	case 53
		coddocumento='SD'		
		 nivel=8
	case 54
		coddocumento='SSD'		
		 nivel=9
	case 55
		coddocumento='SB'
		 nivel=10
	case 56
		coddocumento='SP'
		 nivel=11
	case 57
		coddocumento='SFR'
		 nivel=12
	case 58
		coddocumento='SC'
		 nivel=13
	case 59
		coddocumento='ST'
		nivel=14
	case 60
		coddocumento='SV'
		nivel=15		
		
		
///SOLICITUDES		
	case 62
		coddocumento='OC'
		nivel=16
	case 63
		coddocumento='SR'
		nivel=17
	case 64
		coddocumento='TR'
		nivel=18
		
//AJUSTES		
	case 66
		coddocumento='SAJ'
		nivel=19
END CHOOSE

if isnull(coddocumento) then return 
select dw into :camino from documentos_gral
where coddoc = :coddocumento;

if isnull(camino) or camino='' then return

opensheetwithparm(w_gen[Nivel],coddocumento, camino, w_principal, 0, Original!)
w_principal.arrangesheets(layer!)
end event

event e_nomina(long param);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_nomina,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_ajustelote(long param);if l_sum then
	if not f_num_compu('s','I') then return
	l_sum=false
else
	if not f_num_compu('s','o') then return
end if
opensheet(w_ajustalote,w_principal,0,Original!)

end event

event e_unificart(long param);if l_sum then
	if not f_num_compu('s','I') then return
	l_sum=false
else
	if not f_num_compu('s','o') then return
end if
opensheet(w_unifarticulo,w_principal,0,Original!)
end event

event e_costop(long param);if l_sum then
	if not f_num_compu('s','I') then return
	l_sum=false
else
	if not f_num_compu('s','o') then return
end if
opensheet(w_costoprom,w_principal,0,Original!)

end event

event e_sumperiodo(long param);if l_sum then
	if not f_num_compu('s','I') then return
	l_sum=false
else
	if not f_num_compu('s','o') then return
end if
opensheet(w_sum_cierre,w_principal,0,Original!)

end event

event e_grpcls(long param, long param2, long param3);if l_sum then
	if not f_num_compu('s','I') then return
	l_sum=false
else
	if not f_num_compu('s','o') then return
end if
opensheet(w_grupo_clase,w_principal,0,Original!)
w_principal.arrangesheets(layer!)
end event

event e_generico(long param, long param2, long param3);if l_sum then
	if not f_num_compu('s','I') then return
	l_sum=false
else
	if not f_num_compu('s','o') then return
end if
opensheet(w_genericos,w_principal,0,Original!)
w_principal.arrangesheets(layer!)
end event

event e_articulo(long param, long param2, long param3);if l_sum then
	if not f_num_compu('s','I') then return
	l_sum=false
else
	if not f_num_compu('s','o') then return
end if
opensheet(w_articulos,w_principal,0,Original!)
w_principal.arrangesheets(layer!)
end event

event e_pac(long param, long param2, long param3);if l_sum then
	if not f_num_compu('s','I') then return
	l_sum=false
else
	if not f_num_compu('s','o') then return
end if
opensheet(w_pac,w_principal,0,Original!)
w_pac.codDocumento = 'PAC'
w_principal.arrangesheets(layer!)
end event

event e_sumcon(long param, long param2, long param3);if l_sum then
	if not f_num_compu('s','I') then return
	l_sum=false
else
	if not f_num_compu('s','o') then return
end if
mf_abre_tablas("Suministros - Convenios",'dw_convenios_cfg',0)
end event

event e_sumrie(long param, long param2, long param3);if l_sum then
	if not f_num_compu('s','I') then return
	l_sum=false
else
	if not f_num_compu('s','o') then return
end if
mf_abre_tablas("Suministros - Tipo riesgo",'dw_riesgo',0)
end event

event e_sumtpago(long param, long param2, long param3);if l_sum then
	if not f_num_compu('s','I') then return
	l_sum=false
else
	if not f_num_compu('s','o') then return
end if
mf_abre_tablas("Suministros - Tipo Pago",'dw_tipo_pago',0)
end event

event e_sumconlote(long param, long param2, long param3);if l_sum then
	if not f_num_compu('s','I') then return
	l_sum=false
else
	if not f_num_compu('s','o') then return
end if
mf_abre_tablas("Suministros - Consecutivo Lote",'dw_lote_consecutivo',0)
end event

event e_suminterc(long param, long param2, long param3);if l_sum then
	if not f_num_compu('s','I') then return
	l_sum=false
else
	if not f_num_compu('s','o') then return
end if
opensheet(w_sum_conta,w_principal,0,Original!)
w_principal.arrangesheets(layer!)
end event

event e_afregistro(long param);if l_act then
	if not f_num_compu('a','I') then return
	l_act=false
else
	if not f_num_compu('a','o') then return
end if
opensheet(w_af_registro,w_principal,0,Layered!)
w_af_registro.codDocumento = 'AFR'
w_principal.arrangesheets(layer!)
end event

event e_afrespon(long param);if l_act then
	if not f_num_compu('a','I') then return
	l_act=false
else
	if not f_num_compu('a','o') then return
end if
opensheet(w_af_responsable,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)
end event

event e_afmtto(long param);if l_act then
	if not f_num_compu('a','I') then return
	l_act=false
else
	if not f_num_compu('a','o') then return
end if
opensheet(w_af_mantto,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)
end event

event e_afdeprecia(long param);if l_act then
	if not f_num_compu('a','I') then return
	l_act=false
else
	if not f_num_compu('a','o') then return
end if
opensheet(w_af_deprecia,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)
end event

event e_afdevuelve(long param);if l_act then
	if not f_num_compu('a','I') then return
	l_act=false
else
	if not f_num_compu('a','o') then return
end if
opensheet(w_af_devolucion,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)

end event

event e_afbaja(long param);if l_act then
	if not f_num_compu('a','I') then return
	l_act=false
else
	if not f_num_compu('a','o') then return
end if
opensheet(w_af_baja,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)
end event

event e_afcomo(long param);if l_act then
	if not f_num_compu('a','I') then return
	l_act=false
else
	if not f_num_compu('a','o') then return
end if
opensheet(w_af_comodato,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)
end event

event e_afplaca(long param);if l_act then
	if not f_num_compu('a','I') then return
	l_act=false
else
	if not f_num_compu('a','o') then return
end if
opensheet(w_af_cambio_placa,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)
end event

event e_afsecc(long param, long param2, long param3);if l_act then
	if not f_num_compu('a','I') then return
	l_act=false
else
	if not f_num_compu('a','o') then return
end if
mf_abre_tablas3("Activos Fijos - Secciones por Centro de Costo",'dw_combo_ufun','dw_combo_ccosto','dw_secciones_act')
end event

event e_cartera(long param);if l_car then
	if not f_num_compu('r','I') then return
	l_car=false
else
	if not f_num_compu('r','o') then return
end if

opensheet(w_teso_cartera,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_carob(long param);if l_car then
	if not f_num_compu('r','I') then return
	l_car=false
else
	if not f_num_compu('r','o') then return
end if
opensheet(w_maneja_glosas,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_carta(long param);if l_car then
	if not f_num_compu('r','I') then return
	l_car=false
else
	if not f_num_compu('r','o') then return
end if
opensheet(w_respu_glosas,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_carren(long param);if l_car then
	if not f_num_compu('r','I') then return
	l_car=false
else
	if not f_num_compu('r','o') then return
end if
opensheet(w_reenvia_glosas,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_carrecla(long param);if l_car then
	if not f_num_compu('r','I') then return
	l_car=false
else
	if not f_num_compu('r','o') then return
end if
opensheet(w_reclasif_cartera,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_carper(long param);if l_car then
	if not f_num_compu('r','I') then return
	l_car=false
else
	if not f_num_compu('r','o') then return
end if
opensheet(w_meses_cartera,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_cartrans(long param, long param2, long param3);if l_car then
	if not f_num_compu('r','I') then return
	l_car=false
else
	if not f_num_compu('r','o') then return
end if
mf_abre_tablas("Cartera - Tipo Transacciones",'dw_car_tipo_opera',0)

end event

event e_caroper(long param, long param2, long param3);if l_car then
	if not f_num_compu('r','I') then return
	l_car=false
else
	if not f_num_compu('r','o') then return
end if
mf_abre_tablas("Cartera - Tipo operaciones Cartera / Tesorería",'dw_car_opera',0)

end event

event e_carentidad(long param, long param2, long param3);if l_car then
	if not f_num_compu('r','I') then return
	l_car=false
else
	if not f_num_compu('r','o') then return
end if
mf_abre_tablas("Cartera - Entidades a Reportar Cartera",'dw_car_entidad',0)

end event

event e_caredad(long param, long param2, long param3);if l_car then
	if not f_num_compu('r','I') then return
	l_car=false
else
	if not f_num_compu('r','o') then return
end if
mf_abre_tablas2("Cartera - Edades de cartera",'dw_combo_car_entidad','dw_car_edades')
w_principal.arrangesheets(layer!)
end event

event e_carreg(long param, long param2, long param3);if l_car then
	if not f_num_compu('r','I') then return
	l_car=false
else
	if not f_num_compu('r','o') then return
end if
mf_abre_tablas("Cartera - Regimen / Tesorería",'dw_car_regimen',0)
end event

event e_carobjn(long param, long param2, long param3);if l_car then
	if not f_num_compu('r','I') then return
	l_car=false
else
	if not f_num_compu('r','o') then return
end if
opensheet(w_objeciones,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_carrtan(long param, long param2, long param3);if l_car then
	if not f_num_compu('r','I') then return
	l_car=false
else
	if not f_num_compu('r','o') then return
end if
opensheet(w_respuestas,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_nomhv(long param);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_hoja_vida,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_nomcargos(long param);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_empleado,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_nomprogra(long param);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_programa_new,w_principal,0,original!)
w_principal.arrangesheets(layer!)

end event

event e_nomsuplem(long param);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_tsup,w_principal,0,original!)
w_principal.arrangesheets(layer!)

end event

event e_nomausen(long param);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_ausentismo,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_nomahor(long param);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_ahorro,w_principal,0,original!)
w_principal.arrangesheets(layer!)

end event

event e_nomsuge(long param);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_sugerido_emp,w_principal,0,original!)
w_principal.arrangesheets(layer!)

end event

event e_nomcargp(long param, long param2, long param3);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_cargos,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_nomtipoc(long param, long param2, long param3);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
mf_abre_tablas("Nómina - Tipo Concepto",'dw_cfg_tipo_concep',0)

end event

event e_nomcop(long param, long param2, long param3);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_concep,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_nomccargo(long param, long param2, long param3);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_concep_cargo,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_nomrete(long param, long param2, long param3);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
mf_abre_tablas2("Nómina - Tabla Retefuente",'dw_combo_concepto_rtefte','dw_retefuente')
end event

event e_nomvref(long param, long param2, long param3);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_valores_ref,w_principal,0,original!)
w_principal.arrangesheets(layer!)

end event

event e_nomfest(long param, long param2, long param3);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
mf_abre_tablas("Nómina - Festivos",'dw_conf_festivos',0)

end event

event e_nomreqc(long param, long param2, long param3);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
mf_abre_tablas("Nómina - Requisitos Cargo",'dw_nomrequicargocfg',0)

end event

event e_nomtipoaus(long param, long param2, long param3);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_tipo_ausentismo,w_principal,0,original!)
w_principal.arrangesheets(layer!)

end event

event e_nomfun(long param, long param2, long param3);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
mf_abre_tablas("Nómina - Funciones Cargo",'dw_funcioncfg',0)

end event

event e_nomnivel(long param, long param2, long param3);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
mf_abre_tablas("Nómina - Niveles",'dw_funcioncfg',0)

end event

event e_nomtrabs(long param, long param2, long param3);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_def_tsup,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_nomturno(long param, long param2, long param3);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_def_turnos,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_nomciclo(long param, long param2, long param3);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_def_ciclos,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_nomintcon(long param, long param2, long param3);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_costo_cargo,w_principal,0,original!)
w_principal.arrangesheets(layer!)

end event

event e_nominppto(long param, long param2, long param3);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_intf_ppto,w_principal,0,original!)
w_principal.arrangesheets(layer!)
end event

event e_nomban(long param, long param2, long param3);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
mf_abre_tablas("Bancos Giros",'dw_pm_bancos',0)
end event

event e_nombanofc(long param, long param2, long param3);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
mf_abre_tablas2("Oficina x Bancos ",'dw_combo_bancos','dw_bancos_ciudad')
end event

event e_nomperfil(long param, long param2, long param3);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
mf_abre_tablas("Nómina - Perfil Ocupacional",'dw_perfil_ocupa',0)
end event

event e_nomevalorg(long param);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_hplantilla,w_principal,0,original!)
w_principal.arrangesheets(layer!)

end event

event e_nomeval(long param);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_evaluacion,w_principal,0,original!)
w_principal.arrangesheets(layer!)

end event

event e_pptotras(long param, long param2, long param3);if l_pre then
	if not f_num_compu('p','I') then return
	l_pre=false
else
	if not f_num_compu('p','o') then return
end if
opensheet(w_new_traslado,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)

end event

event e_pptoadic(long param, long param2, long param3);if l_pre then
	if not f_num_compu('p','I') then return
	l_pre=false
else
	if not f_num_compu('p','o') then return
end if
opensheet(w_new_adicion,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)


end event

event e_pptorec(long param, long param2, long param3);if l_pre then
	if not f_num_compu('p','I') then return
	l_pre=false
else
	if not f_num_compu('p','o') then return
end if
opensheet(w_new_recorte,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)


end event

event e_pptoplan(long param);if l_pre then
	if not f_num_compu('p','I') then return
	l_pre=false
else
	if not f_num_compu('p','o') then return
end if
opensheet(w_plan_ppto,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)
end event

event e_pptosold(long param, long param2, long param3);if l_pre then
	if not f_num_compu('p','I') then return
	l_pre=false
else
	if not f_num_compu('p','o') then return
end if
opensheet(w_new_soldispo,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)


end event

event e_pptosdis(long param, long param2, long param3);if l_pre then
	if not f_num_compu('p','I') then return
	l_pre=false
else
	if not f_num_compu('p','o') then return
end if
opensheet(w_new_dispon,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)


end event

event e_pptores(long param, long param2, long param3);if l_pre then
	if not f_num_compu('p','I') then return
	l_pre=false
else
	if not f_num_compu('p','o') then return
end if
opensheet(w_new_reser,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)

end event

event e_pptogiro(long param, long param2, long param3);if l_pre then
	if not f_num_compu('p','I') then return
	l_pre=false
else
	if not f_num_compu('p','o') then return
end if
opensheet(w_new_giro,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)

end event

event e_pptorecon(long param, long param2, long param3);if l_pre then
	if not f_num_compu('p','I') then return
	l_pre=false
else
	if not f_num_compu('p','o') then return
end if
opensheet(w_new_recon,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)
end event

event e_pptoreca(long param, long param2, long param3);if l_pre then
	if not f_num_compu('p','I') then return
	l_pre=false
else
	if not f_num_compu('p','o') then return
end if
opensheet(w_new_recaudo,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)
end event

event e_pptored(long param, long param2, long param3);if l_pre then
	if not f_num_compu('p','I') then return
	l_pre=false
else
	if not f_num_compu('p','o') then return
end if
opensheet(w_ch_vigen_recon,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)

end event

event e_pptovig(long param);if l_pre then
	if not f_num_compu('p','I') then return
	l_pre=false
else
	if not f_num_compu('p','o') then return
end if
opensheet(w_vig_per,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)
end event

event e_pptorequil(long param);if l_pre then
	if not f_num_compu('p','I') then return
	l_pre=false
else
	if not f_num_compu('p','o') then return
end if
opensheet(w_equilibrio,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)

end event

event e_pptocon(long param);if l_pre then
	if not f_num_compu('p','I') then return
	l_pre=false
else
	if not f_num_compu('p','o') then return
end if
opensheet(w_pre_consecs,w_principal,0,Layered!)

end event

event e_pptocosto(long param);if l_pre then
	if not f_num_compu('p','I') then return
	l_pre=false
else
	if not f_num_compu('p','o') then return
end if
mf_abre_tablas3("Presupuesto - Ctas por Centro Costo y Régimen",'dw_combo_ufun','dw_combo_ccosto','dw_reg_ccosto')
end event

event e_pptoconvenio(long param);if l_pre then
	if not f_num_compu('p','I') then return
	l_pre=false
else
	if not f_num_compu('p','o') then return
end if
mf_abre_tablas("Presupuesto - Convenios",'dw_pre_convenios',0)
end event

event e_contratos(long param);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return
end if
opensheetwithparm(w_contratacion,'%',"w_contratacion",w_principal,0,original!)
w_principal.arrangesheets(layer!)

end event

event e_contreq(long param);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return
end if
mf_abre_tablas("Requisitos Contratos ",'dw_contra_tipo_req',0)

end event

event e_contpoli(long param);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return
end if
mf_abre_tablas("Tipos de Pólizas ",'dw_tipo_poliza',0)

end event

event e_conttipo(long param);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return
end if

mf_abre_tablas2("Contratación - Tipos de Contratación",'dw_combo_ctr_new','dw_tipocontrato')
end event

event e_contrxt(long param);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return
end if

opensheet(w_cfg_reqs,w_principal,11,layered!)
w_principal.arrangesheets(layer!)
end event

event e_contcausa(long param);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return
end if

opensheet(w_contra_cuentas,w_principal,0,layered!)
w_principal.arrangesheets(layer!)
end event

event e_contpago(long param);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return
end if
mf_abre_tablas("Tipos Pagos",'dw_contra_tipo_pago',0)

end event

event e_reportes(long param);opensheet(w_reportes_adm,w_principal,0,Original!)
//w_principal.arrangesheets(layer!)

end event

event e_contclase(long param);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return
end if
mf_abre_tablas("Clase de Contrato - ",'dw_clase_contra',0)

end event

event e_otrosrep(long param);if not this.enabled then return
f_abrerepor('',0,i_rep_adm[])
end event

event e_impresora(long param);printsetup()
end event

event e_contratosS(long param);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return
end if
window wSheet
opensheetwithparm(w_contratacion,'SCT',"w_contratacion",w_principal,0,original!)
w_principal.arrangesheets(layer!)

end event

event e_contratosn(long param);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return
end if
window wSheet
opensheetwithparm(w_contratacion,'NC',"w_contratacion",w_principal,0,original!)
w_principal.arrangesheets(layer!)

end event

event e_nompre(long param);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_cooperativa,w_principal,0,original!)
w_principal.arrangesheets(layer!)

end event

event e_tipoimpues(long param, long param2, long param3);if l_con then
	if not f_num_compu('c','I') then return
	l_con=false
else
   if not f_num_compu('c','o') then return
end if
mf_abre_tablas("Contabilidad - Tipo Impuesto",'dw_cont_tipo_impu',0)

end event

event e_tipoobliga(long param, long param2, long param3);if l_con then
	if not f_num_compu('c','I') then return
	l_con=false
else
   if not f_num_compu('c','o') then return
end if
mf_abre_tablas2("Contabilidad - Tipo Obligacción",'dw_combo_tipo_retencion','dw_ctiporet_conf')

end event

event e_costo_gi(long param);if l_cos then
	if not f_num_compu('o','I') then return
	l_cos=false
else
	if not f_num_compu('o','o') then return	
end if
opensheet(w_cos_gi,w_principal,11,original!)
w_principal.arrangesheets(layer!)

end event

event e_costo_gicc(long param);if l_cos then
	if not f_num_compu('o','I') then return
	l_cos=false
else
	if not f_num_compu('o','o') then return	
end if
opensheet(w_cc_gi,w_principal,11,original!)
w_principal.arrangesheets(layer!)

end event

event e_costo_gimes(long param);if l_cos then
	if not f_num_compu('o','I') then return
	l_cos=false
else
	if not f_num_compu('o','o') then return	
end if
opensheet(w_cc_gi,w_principal,11,original!)
w_principal.arrangesheets(layer!)

end event

event e_costo_ins(long param);if l_cos then
	if not f_num_compu('o','I') then return
	l_cos=false
else
	if not f_num_compu('o','o') then return	
end if
opensheet(w_insumo,w_principal,11,original!)
w_principal.arrangesheets(layer!)
end event

event e_costo_can(long param);if l_cos then
	if not f_num_compu('o','I') then return
	l_cos=false
else
	if not f_num_compu('o','o') then return	
end if
opensheet(w_canasta,w_principal,11,original!)
w_principal.arrangesheets(layer!)
end event

event e_costo_tg(long param);if l_cos then
	if not f_num_compu('o','I') then return
	l_cos=false
else
	if not f_num_compu('o','o') then return	
end if
opensheet(w_cos_proced_cargo,w_principal,11,original!)
w_principal.arrangesheets(layer!)
end event

event e_costo_dep(long param);if l_cos then
	if not f_num_compu('o','I') then return
	l_cos=false
else
	if not f_num_compu('o','o') then return	
end if
opensheet(w_cos_proced_deprecia,w_principal,11,original!)
w_principal.arrangesheets(layer!)
end event

event e_costo_calculo(long param);if l_cos then
	if not f_num_compu('o','I') then return
	l_cos=false
else
	if not f_num_compu('o','o') then return	
end if
opensheet(w_cos_proc_total,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)
end event

event e_costo_depd(long param);if l_cos then
	if not f_num_compu('o','I') then return
	l_cos=false
else
	if not f_num_compu('o','o') then return	
end if
opensheet(w_cos_deprecia,w_principal,0,Layered!)
w_principal.arrangesheets(layer!)

end event

event e_nomasalario(long param, long param2, long param3);if l_nom then
	if not f_num_compu('n','I') then return
	l_nom=false
else
	if not f_num_compu('n','o') then return	
end if
opensheet(w_actualiza_salario,w_principal,0,original!)
w_principal.arrangesheets(layer!)

end event

