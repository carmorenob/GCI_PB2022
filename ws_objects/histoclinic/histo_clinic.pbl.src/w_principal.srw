$PBExportHeader$w_principal.srw
forward
global type w_principal from window
end type
type mdi_1 from mdiclient within w_principal
end type
type rbb_1 from ribbonbar within w_principal
end type
type dw_huella from uo_datawindow within w_principal
end type
type p_imagen from picture within w_principal
end type
type huella_total from olecustomcontrol within w_principal
end type
type dw_1 from uo_datawindow within w_principal
end type
type gb_1 from groupbox within w_principal
end type
type dw_odprofe from uo_datawindow within w_principal
end type
type dw_profe from uo_datawindow within w_principal
end type
end forward

global type w_principal from window
integer width = 5723
integer height = 3228
boolean titlebar = true
string title = "GCI Ltda."
string menuname = "m_mdiasis"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 67108864
string pointer = "Arrow!"
boolean toolbarvisible = false
mdi_1 mdi_1
rbb_1 rbb_1
dw_huella dw_huella
p_imagen p_imagen
huella_total huella_total
dw_1 dw_1
gb_1 gb_1
dw_odprofe dw_odprofe
dw_profe dw_profe
end type
global w_principal w_principal

type variables
datawindowchild espe, odespe, t_doc
string i_espe_area
st_busca_capi st_usu
Int intentos,ii_contexto
Long il_resolucion, il_height, il_width,l_dias_update
st_biometria pac_template
Boolean l_huella=false
m_ppal m_principal
end variables

forward prototypes
public function integer busca_paciente ()
public subroutine lf_titulo ()
public function date wf_fecha_nace ()
public subroutine f_init_ribbonbar (ribbonbar nom_rib, boolean rib_boo)
public subroutine mf_abre_tablas2 (string titulo, string dw_dataobject1, string dw_dataobject2)
end prototypes

public function integer busca_paciente ();long j
boolean lb_debe=false

j=dw_1.retrieve(tipdoc,docu)

if j=-1 then 
	dw_1.insertrow(0)
	dw_1.setitem(1,"tipodoc",tipdoc)
	return 0
elseif j=0 then
	string base
	long selecc
	dw_1.insertrow(0)
	dw_1.setitem(1,"tipodoc",tipdoc)
	if ls_pro=32 THEN RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "BASE_CAPI", Regstring!, base)
	if ls_pro=64 THEN RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "BASE_CAPI", Regstring!, base)
	if base='1' then
		selecc=messagebox('Atención','Paciente no encontrado seleccione.~r~n~r~nSI~t~tPara buscarlo en la base Capitada y crearlo ~r~n~r~nNO~t~tPara no buscarlo en la base pero crearlo ~r~n~r~nCANCELAR~tPara no crearlo',question!,yesnocancel!,1)
		choose case selecc
			case 1,2
				dw_1.setitem(1,"documento",docu)
				dw_1.setitem(1,"tipodoc",tipdoc)
				if selecc=1 then
					st_usu.valida='capi'
					st_usu.usuario=g_descrip_usu
					openwithparm(w_busca_en_capit,st_usu)
				end if
				opensheet (win_regis_pac,w_principal,4,original!)
				win_regis_pac.dw_2.modify("historia.edit.DisplayOnly=FALSE")
				win_regis_pac.tab_1.selectedtab=1
				win_regis_pac.sle_1.triggerevent(modified!)
			case 3
				es_nuevo=true
				docu=""
				tipdoc=""
				histo=""
				if isvalid(win_regis_pac) then win_regis_pac.blanquea()
		end choose
	else
		selecc=messagebox("Atención","Paciente no encontrado. Desea Buscarlo Crearlo ?",Question!,YesNo! )
		if selecc=1 then 
			dw_1.setitem(1,"documento",docu)
			dw_1.setitem(1,"tipodoc",tipdoc)
			opensheet (win_regis_pac,w_principal,4,original!)
			win_regis_pac.dw_2.modify("historia.edit.DisplayOnly=FALSE")
			win_regis_pac.tab_1.selectedtab=1
			win_regis_pac.sle_1.triggerevent(modified!)
		else
			es_nuevo=true
			docu=""
			tipdoc=""
			histo=""
			if isvalid(win_regis_pac) then win_regis_pac.blanquea()
		end if
	end if
else
	es_nuevo=false
	histo=dw_1.getitemstring(1,"historia")
	if not isvalid(w_apoyo_diag2) then
		if isnull(dw_1.getitemstring(1,"fn_val")) or dw_1.getitemstring(1,"fn_val")='0' then
			messagebox("Atención","Paciente no tienen Dirección en nuevo formato Actualicé Datos",Question! )
			lb_debe=true
		end if
		
		if isnull(dw_1.getitemstring(1,"direccion")) then
			messagebox("Atención","Paciente no tienen Dirección Actualicé Datos",Question! )
			lb_debe=true
		end if
		if isnull(dw_1.getitemstring(1,"tel")) then
			messagebox("Atención","Paciente no tienen Teléfono Actualicé Datos",Question! )
			lb_debe=true
		end if
		if isnull(dw_1.getitemstring(1,"codocup")) then
			messagebox("Atención","Paciente no tienen Ocupación Actualicé Datos",Question! )
			lb_debe=true
		end if
		if isnull(dw_1.getitemstring(1,"grupoae")) then
			messagebox("Atención","Paciente no tienen Grupo AE Actualicé Datos",Question! )
			lb_debe=true
		end if
		if isnull(dw_1.getitemstring(1,"escolaridad")) then
			messagebox("Atención","Paciente no tienen Escolaridad Actualicé Datos",Question! )
			lb_debe=true
		end if	
		if isnull(dw_1.getitemstring(1,"usuario")) then
			messagebox("Atención","Paciente actualicé Datos",Question! )
			lb_debe=true
		end if		
		if not isnull(w_principal.dw_1.getitemstring(1,"documento")) AND (isnull(dw_1.getitemdatetime(1,"fecha_captura")) OR (DaysAfter(date(dw_1.getitemdatetime(1,"fecha_captura")),date(now()))> l_dias_update)) then
			if not isvalid(w_hist_gral) then 
				messagebox("Atención","Actualicé Datos de paciente")
				lb_debe=true
			end if
		end if
		if lb_debe then 	opensheet (win_regis_pac,w_principal,4,original!)
	end if	
	//encadenar con otras ventanas
	if isvalid(win_regis_pac) then
		win_regis_pac.sle_1.text=docu
		win_regis_pac.sle_1.triggerevent(modified!)
	end if
	if isvalid(w_hist_gral) then w_hist_gral.triggerevent(open!)
	if isvalid(w_cohortes_paciente) then w_cohortes_paciente.triggerevent(open!)
	if isvalid(w_apoyo_diag2) then w_apoyo_diag2.triggerevent(open!)
	if isvalid(w_vacunas) then w_vacunas.triggerevent(open!)
	if isvalid(w_factura) then 
		w_factura.triggerevent(open!)
		//w_factura.f_abrir_pendientes()
	end if
	if isvalid(w_rec_caja) then w_rec_caja.triggerevent(open!)
	if isvalid(w_asig_cita) then 
		if isvalid(w_trasl_cita) then close(w_trasl_cita)
		w_asig_cita.triggerevent(open!)
	end if
	if isvalid(w_admision) then w_admision.triggerevent(open!)
	if isvalid(w_new_at_os) then w_new_at_os.dw_tip_ingres.triggerevent(itemchanged!)
	if isvalid(w_entrega_med) then w_entrega_med.dw_tip_ingres.triggerevent(itemchanged!)
	if isvalid(w_devuelve_med) then w_devuelve_med.dw_tip_ingres.triggerevent(itemchanged!)
	if isvalid(w_new_sala_qx) then w_new_sala_qx.triggerevent(open!)
	if isvalid(w_programa_cir) then w_programa_cir.triggerevent(open!)
	if isvalid(w_consulta) then w_consulta.triggerevent(open!)
	if isvalid(w_atiendetto) then w_atiendetto.triggerevent(open!)
	if isvalid(w_abonos) then w_abonos.triggerevent(open!)
	if isvalid(w_pyp_pac) then w_pyp_pac.triggerevent(open!)
	if isvalid(w_imag_diag) then w_imag_diag.triggerevent(open!)
	if isvalid(w_banco_fluid) then w_banco_fluid.triggerevent(open!)
	if isvalid(w_asig_cita_qx) then w_asig_cita_qx.triggerevent(open!)
	if isvalid(w_cohortes_paciente) then w_cohortes_paciente.event open()
end if
return 1
end function

public subroutine lf_titulo ();string descrip
select descripcion into :descrip from lugar where codlugar=:clugar;
title='GCI Ltda.  [* * '+ f_coloca_esp(descrip)+' * *]'
title+=' ('+usuario+') '+g_descrip_usu
end subroutine

public function date wf_fecha_nace ();return date(dw_1.getitemdatetime(1,'fnacimiento'))
end function

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
	SELECTblob ribon into :ls_ribon from pm_aplicativos where cod_aplica='ASIS';
	if isnull(ls_ribon) then 
		//messagebox('Atención','No se puede cargar ribon')
		nom_rib.ImportFromXMLFile ("asis.xml") 
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
	f_poblar_menus_ribon_asis(rbb_1,'ASI')
	return
End If
end subroutine

public subroutine mf_abre_tablas2 (string titulo, string dw_dataobject1, string dw_dataobject2);boolean bValid
window wSheet,child
bvalid= IsValid (wSheet)
DO while bvalid
	if wsheet.title=titulo then
		wsheet.setfocus()
		return 
	end if
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

on w_principal.create
if this.MenuName = "m_mdiasis" then this.MenuID = create m_mdiasis
this.mdi_1=create mdi_1
this.rbb_1=create rbb_1
this.dw_huella=create dw_huella
this.p_imagen=create p_imagen
this.huella_total=create huella_total
this.dw_1=create dw_1
this.gb_1=create gb_1
this.dw_odprofe=create dw_odprofe
this.dw_profe=create dw_profe
this.Control[]={this.mdi_1,&
this.rbb_1,&
this.dw_huella,&
this.p_imagen,&
this.huella_total,&
this.dw_1,&
this.gb_1,&
this.dw_odprofe,&
this.dw_profe}
end on

on w_principal.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.rbb_1)
destroy(this.dw_huella)
destroy(this.p_imagen)
destroy(this.huella_total)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.dw_odprofe)
destroy(this.dw_profe)
end on

event open;if isvalid(w_presenta) then w_presenta.setfocus()
string tt
int l_cita

m_principal = create m_ppal

if nom_regis<>'GCI LTDA' then 
	m_principal.m_ayuda.m_basura.visible=false
end if

SELECT cadena into :gs_pdf
FROM parametros_gen
WHERE (((codigo_para)=40));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 40')
	return
end if

SELECT entero into :l_dias_update
FROM parametros_gen
WHERE (((codigo_para)=70));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 70')
end if

SELECT entero into :l_cita
FROM parametros_gen
WHERE (((codigo_para)=36));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 36')
end if

if l_cita=0 then 
//	m_principal.m_3.m_3_2.m_recordatorio.visible=false
//	m_principal.m_3.m_3_2.m_recordatorio.enabled=false
//	m_principal.m_3.m_3_2.m_recordatorio.toolbaritemvisible=false	
end if


SELECT Min(Profe.CodProf) into :tt
FROM Profe
WHERE Profe.usuario=:usuario;
if not isnull(tt) and tt<>'' and tt<>g_profe then g_profe=tt
if g_profe<>'' then 
	dw_profe.setitem(1,'codprof',g_profe)
	espe.retrieve(g_profe)
	if espe.rowcount()=0 then 
		dw_profe.setitem(1,2,"")
		messagebox("Atención","El profesional que está por defecto en esta máquina no tiene especialidad configurada")
	else
		dw_profe.setitem(1,2,espe.getitemstring(1,'cesp'))
	end if
	dw_odprofe.setitem(1,'codprof',g_profe)
	odespe.retrieve(g_profe)
	if odespe.rowcount()=0 then 
		dw_odprofe.setitem(1,2,"")
		messagebox("Atención","El profesional que está por defecto en esta máquina no tiene especialidad configurada")
	else
		dw_odprofe.setitem(1,2,odespe.getitemstring(1,2))
	end if
end if
dw_1.setfocus()
f_poblar_menus()
f_init_ribbonbar(rbb_1,True)

timer(1)
lf_titulo()
If g_biometria='1' then
	g_captura=true
	huella_total.Object.DestroyContext(ii_contexto)
	huella_total.Object.Finalize()
	huella_total.object.Initialize()
	If l_error < 0 Then
		return -1
	End If
	huella_total.Object.CapInitialize()
end if

SELECT cadena into :gs_oxigeno
FROM parametros_gen
WHERE (((codigo_para)=78));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 78 Oxigeno')
	return 
end if
end event

event resize;il_width=newwidth
il_height=newheight
if newwidth <= 0 then
	il_width= this.workspacewidth( )
end if
if newheight <=0 then
	il_height= this.workspaceheight( )
end if

post event toolbarmoved()

end event

event timer;if isvalid(w_presenta) then
	close(w_presenta)
	dw_1.setfocus()
	timer(80)
	return
end if
if f_num_compu(g_aplicacion,'histo_clinic')=false then messagebox("Atención","Se encuentran trabajando más computadores de los licenciados")
end event

event toolbarmoved;boolean visib,visib2
string titulo
int fila , offset, newx,newy , resta_alto,resta_ancho
window activesheet



toolbaralignment  alinea , alinea2
if this.GetToolbar ( 1, visib , alinea)=-1 then
	visib=false
end if
activesheet = this.GetActiveSheet()

IF IsValid(activesheet) THEN
	if activesheet.GetToolbar ( 1, visib2 , alinea2,titulo)=-1 then
		visib2=false
	end if
end if
if visib then
	choose case alinea
		case AlignAtTop!
			newx=0
			newy=224
			resta_alto= 224 + 176 + MDI_1.MicroHelpHeight
			resta_ancho=30
			if visib2 then
				choose case alinea2
					case AlignAtTop!
						activesheet.GetToolbarPos ( 1, fila, offset )
						if fila > 1 then
							newy+=104
							resta_alto+=104
						end if
					case AlignAtLeft! 
						newx+=108
						resta_ancho+=116
					case AlignAtRight!
						resta_ancho+=116
					case AlignAtBottom!
						resta_alto+=112
					case floating!
				end choose
			end if
		case AlignAtLeft!
			newx=112
			newy=120
			resta_alto= 296 + MDI_1.MicroHelpHeight
			resta_ancho= 146
			if visib2 then
				choose case alinea2
					case AlignAtTop!
						newy+=104
						resta_alto+=104
					case AlignAtLeft! 
						activesheet.GetToolbarPos ( 1, fila, offset )
						if fila > 1 then
							newx+=120
							resta_ancho+=104
						end if
					case AlignAtRight!
						resta_ancho+=116
					case AlignAtBottom!
						resta_alto+=112
					case floating!
				end choose
			end if		
		case AlignAtRight!
			newx=0
			newy=120
			resta_alto= 296 + MDI_1.MicroHelpHeight
			resta_ancho= 150
			if visib2 then
				choose case alinea2
					case AlignAtTop!
						newy+=112
						resta_alto+=112
					case AlignAtLeft! 
						newx+=116
						resta_ancho+=116
					case AlignAtRight!
						activesheet.GetToolbarPos ( 1, fila, offset )
						if fila > 1 then
							resta_ancho+=124
						end if
					case AlignAtBottom!
						resta_alto+=112
					case floating!
				end choose
			end if
		case AlignAtBottom!
			newx=0
			newy=120
			resta_alto= 240 + 176 + MDI_1.MicroHelpHeight
			resta_ancho= 30
			if visib2 then
				choose case alinea2
					case AlignAtTop!
						newy+=120
						resta_alto+=120
					case AlignAtLeft! 
						newx+=120
						resta_ancho+=124
					case AlignAtRight!
						resta_ancho+=126
					case AlignAtBottom!
						activesheet.GetToolbarPos ( 1, fila, offset )
						if fila = 1 then
							resta_alto+=104
						end if
					case floating!
				end choose
			end if
		case Floating!
			newx=0
			newy=120
			resta_alto= 296 + MDI_1.MicroHelpHeight
			resta_ancho= 30
			if visib2 then
				choose case alinea2
					case AlignAtTop!
						newy+=120
						resta_alto+=120
					case AlignAtLeft! 
						newx+=120
						resta_ancho+=124
					case AlignAtRight!
						resta_ancho+=126
					case AlignAtBottom!
						resta_alto+=112
					case floating!
				end choose
			end if
	end choose
else
	newx=0
	newy=120
	resta_alto= 296 + MDI_1.MicroHelpHeight
	resta_ancho= 30
	if visib2 then
		choose case alinea2
			case AlignAtTop!
				newy+=120
				resta_alto+=120
			case AlignAtLeft! 
				newx+=120
				resta_ancho+=124
			case AlignAtRight!
				resta_ancho+=126
			case AlignAtBottom!
				resta_alto+=112
			case floating!
		end choose
	end if
end if


rbb_1.move(0,il_height - this.workspaceheight()  )
rbb_1.width = il_width -50
gb_1.width = il_width -50

mdi_1.move(0,rbb_1.height +gb_1.height +il_height -  this.workspaceheight())
mdi_1.resize(il_width,il_height  - rbb_1.height - gb_1.height  - ( il_height  - this.workspaceheight()))
end event

event close;if isvalid(w_presenta) then close(w_presenta)
//string nombre
//RegistryGet ("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName", "ComputerName", Regstring!, nombre)
delete from control_red where nom_equipo=upper(:g_nequipo) and aplicativo=upper('histo_clinic');
if sqlca.sqlcode=-1 then
	messagebox("Error borrando",sqlca.sqlerrtext)
	rollback;
	return
else
	commit;
end if

update profe set control=0 
WHERE profe.CodProf=:g_profe ;
if sqlca.sqlcode=-1 then
	messagebox("Error Actualizando profe",sqlca.sqlerrtext)
	rollback;
	return
else
	commit;
end if
If g_biometria='1' then
	huella_total.Object.DestroyContext(ii_contexto)
	huella_total.Object.Finalize()
End If
FileDelete(gbiometria_filePathName)
disconnect;
HALT
end event

type mdi_1 from mdiclient within w_principal
long BackColor=33554431
end type

type rbb_1 from ribbonbar within w_principal
event e_buscapte ( )
event e_reportes ( long param )
event e_otrosrep ( long param )
event e_impresora ( long param )
event e_cambialug ( long param )
event e_pac ( long param )
event e_buscapac ( long param )
event e_cpcte ( long param )
event e_upcte ( long param )
event e_treehc ( long param )
event e_imprimem ( long param )
event e_cierra ( long param )
event e_citas ( long param )
event e_recuerdac ( long param )
event e_programac ( long param )
event e_programat ( long param )
event e_horariosug ( long param )
event e_cext ( long param )
event e_vacuna ( long param )
event e_apoyodx ( long param )
event e_apoyore ( long param )
event e_odoncon ( long param )
event e_odontto ( long param )
event e_admision ( long param )
event e_ordenes ( long param )
event e_medent ( long param )
event e_meddev ( long param )
event e_cambior ( long param )
event e_anulaing ( long param )
event e_anulasal ( long param )
event e_ingresores ( long param )
event e_taburg ( long param )
event e_salasqx ( long param )
event e_salaspg ( long param )
event e_autorizas ( long param )
event e_autorizaa ( long param )
event e_ripsge ( long param )
event e_ripsmd ( long param )
event e_gestante ( long param )
event e_erc ( long param )
event e_acerca ( long param )
event e_ripsaudi ( long param )
event e_ripsfact ( long param )
event e_ripsreci ( long param )
event e_atusrad ( long param )
event e_aturesp ( long param )
event e_encelab ( long param )
event e_enctab ( long param )
event e_encest ( long param )
event e_enclist ( long param )
event e_encsat ( long param )
event e_contoll ( long param )
event e_mercadeo ( long param )
event e_cohortes ( long param )
event e_202 ( long param )
event e_factura ( long param )
event e_anticipo ( long param )
event e_recibo ( long param )
event e_bancorec ( long param )
event e_bancores ( long param )
integer width = 5641
integer height = 444
long backcolor = 15132390
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
end type

event e_buscapte();if not enabled then return
openwithparm(win_busqueda,w_principal.dw_1)
end event

event e_reportes(long param);opensheet(w_reportes_asis,w_principal,0,Original!)


end event

event e_otrosrep(long param);if not this.enabled then return
f_abrerepor('',0,i_rep_asis[])
end event

event e_impresora(long param);printsetup()
end event

event e_cambialug(long param);open(w_cambia_lugar)
end event

event e_pac(long param);if not enabled then return
opensheet (win_regis_pac,w_principal,7,original!)
w_principal.arrangesheets(layer!)
if docu<>"" and tipdoc<>"" then
	win_regis_pac.sle_1.text=docu
	win_regis_pac.sle_1.triggerevent(modified!)
end if

end event

event e_buscapac(long param);if not enabled then return
openwithparm(win_busqueda,w_principal.dw_1)
end event

event e_cpcte(long param);if not enabled then return
open(w_cambio_docu)

end event

event e_upcte(long param);if not enabled then return
opensheet (w_borra_repetid,w_principal,7,original!)
w_principal.arrangesheets(layer!)

end event

event e_treehc(long param);if not enabled then return
opensheet (w_imag_diag,w_principal,7,original!)
w_principal.arrangesheets(layer!)
end event

event e_imprimem(long param);if not enabled then return
opensheet (w_impresion_masiva,w_principal,7,original!)
w_principal.arrangesheets(layer!)
end event

event e_cierra(long param);disconnect;
if isvalid(w_presenta) then close(w_presenta)
HALT
close(parent)
end event

event e_citas(long param);if not enabled then return
opensheet (w_asig_cita,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_recuerdac(long param);if not enabled then return
opensheet (w_recuerda_cita,w_principal,7,original!)
w_principal.arrangesheets(layer!)
end event

event e_programac(long param);if not enabled then return
opensheet (w_prog_hora,w_principal,7,original!)
w_principal.arrangesheets(layer!)
end event

event e_programat(long param);if not enabled then return
opensheet (w_programa_sala2,w_principal,7,original!)
w_principal.arrangesheets(layer!)
end event

event e_horariosug(long param);if not enabled then return
opensheet (w_hora_bas,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_cext(long param);if aplicativo="2" or aplicativo = '7' then 
	this.enabled=false
	return
end if
if not enabled then return
opensheet (w_hist_gral,w_principal,7,original!)
w_principal.arrangesheets(layer!)
end event

event e_vacuna(long param);if aplicativo="2" or aplicativo = '7' then 
	return
end if
if not enabled then return
opensheet (w_vacunas,w_principal,7,original!)
w_principal.arrangesheets(layer!)

end event

event e_apoyodx(long param);if aplicativo="1" or aplicativo = '7'  then 
	this.enabled=false
	return
end if
if not enabled then return
opensheet (w_apoyo_diag2,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_apoyore(long param);if not enabled then return
opensheet (w_envia_result_apdx,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_odoncon(long param);if not enabled then return
opensheet(w_consulta,w_principal,7,Layered!)
w_principal.ArrangeSheets ( layer!)
end event

event e_odontto(long param);if not enabled then return
opensheet(w_atiendetto,w_principal,7,Layered!)
w_principal.ArrangeSheets ( layer!)
end event

event e_admision(long param);if long(aplicativo)<5 or aplicativo = '7' then 
	this.enabled=false
	return
end if
if not enabled then return
opensheet (w_admision,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_ordenes(long param);if long(aplicativo)<5 or aplicativo = '7'  then 
	this.enabled=false
	return
end if
if not enabled then return
opensheet (w_new_at_os,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_medent(long param);if long(aplicativo)<5 or aplicativo = '7'  then 
	this.enabled=false
	return
end if
if not enabled then return
opensheet (w_entrega_med,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_meddev(long param);if long(aplicativo)<5 or aplicativo = '7'  then 
	enabled=false
	return 
end if
if not enabled then return 
opensheet (w_devuelve_med,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_cambior(long param);if long(aplicativo)<5 or aplicativo = '7' then 
	this.enabled=false
	return
end if
if not enabled then return
if tipdoc="" or docu="" or isnull(docu) then return
opensheet (w_cambio_emp,w_admision,7,original!)
//w_principal.ArrangeSheets ( layer!)
end event

event e_anulaing(long param);if not enabled or not isvalid(w_admision) then return
w_admision.f_anula_ing()
end event

event e_anulasal(long param);if not enabled then return
if not isvalid(w_admision) then return 
if w_admision.tab_1.tabpage_1.dw_admi.rowcount()<1 then return
string abrir
long nh
select abrir_facturado into :abrir from tipoingreso where codtingre=:w_admision.tipo_ingres;
choose case w_admision.tab_1.tabpage_1.dw_admi.getitemstring(1,"estado")
	case '1'
		messagebox("Atención","Esta admisión está abierta, no es necesario abrirla")
	case "2"
		if messagebox("Atención","Está seguro que desea abrir esta admisión ?",question!,yesno!,2)=2 then return
		nh=w_admision.tab_1.tabpage_1.dw_admi.getitemnumber(1,"nh")
		update hospadmi set estado='1' where nh=:nh and codtingre=:w_admision.tipo_ingres;
		if sqlca.sqlcode=-1 then 
			messagebox("Error actualizando estado de Admisión",sqlca.sqlerrtext)
			rollback;
		else
			commit;
			w_admision.dw_tingres.triggerevent(itemchanged!)
			if isvalid(w_new_at_os) then w_new_at_os.dw_tip_ingres.triggerevent(itemchanged!)
			if isvalid(w_new_sala_qx) then w_new_sala_qx.triggerevent(open!)
			if isvalid(w_entrega_med) then w_entrega_med.dw_tip_ingres.triggerevent(itemchanged!)
		end if
	case '3'
		if abrir='1' then
			if messagebox("Atención","Está seguro que desea abrir esta admisión ?",question!,yesno!,2)=2 then return
			nh=w_admision.tab_1.tabpage_1.dw_admi.getitemnumber(1,"nh")
			update hospadmi set estado='1' where nh=:nh and codtingre=:w_admision.tipo_ingres;
			if sqlca.sqlcode=-1 then 
				messagebox("Error actualizando estado de Admisión",sqlca.sqlerrtext)
				rollback;
			else
				commit;
				w_admision.dw_tingres.triggerevent(itemchanged!)
				if isvalid(w_new_at_os) then w_new_at_os.dw_tip_ingres.triggerevent(itemchanged!)
				if isvalid(w_new_sala_qx) then w_new_sala_qx.triggerevent(open!)
				if isvalid(w_entrega_med) then w_entrega_med.dw_tip_ingres.triggerevent(itemchanged!)
			end if
		else
			messagebox("Atención","Esta admisión ya se encuentra facturada, si desea abrirla debe anular primero la factura")
		end if
end choose
end event

event e_ingresores(long param);if not enabled then return
if not isvalid(w_admision) then return
w_admision.a_reserv()
end event

event e_taburg(long param);opensheet (w_tablero_urgencias,w_principal,7,original!)
w_principal.arrangesheets(layer!)

end event

event e_salasqx(long param);if long(aplicativo)<6 or aplicativo = '7' then 
	enabled=false
	return
end if
if not enabled then return
opensheet (w_new_sala_qx,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_salaspg(long param);if long(aplicativo)<6 or aplicativo = '7'  then 
	this.enabled=false
	return
end if
if not enabled then return
opensheet (w_asig_cita_qx,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_autorizas(long param);if long(aplicativo)<6 or aplicativo = '7' then 
	enabled=false
	return
end if
if not enabled then return
opensheet (w_solicita_aut,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)

end event

event e_autorizaa(long param);if long(aplicativo)<6 or aplicativo = '7' then 
	enabled=false
	return
end if
if not enabled then return
opensheet (w_autoriza,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)

end event

event e_ripsge(long param);if not enabled then return
opensheet (w_rias,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_ripsmd(long param);if not enabled then return
opensheet (w_hist_restas,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_gestante(long param);opensheet (w_tablero_gestantes,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_erc(long param);opensheet (w_tablero_erc,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_acerca(long param);openwithparm(w_acercade,'asis')
w_principal.ArrangeSheets ( layer!)
end event

event e_ripsaudi(long param);if not enabled then return
opensheet (w_audita_rips,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_ripsfact(long param);if not enabled then return
opensheet (w_captur_rip,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)

end event

event e_ripsreci(long param);if not enabled  then return
opensheet (w_captur_rip_rec,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_atusrad(long param);if not enabled then return
opensheet(w_quejaspac,w_principal,f_pos_ventana(w_principal.m_principal),original!)
w_principal.arrangesheets(layer!)

end event

event e_aturesp(long param);if not enabled then return
opensheet(w_quejas_resp,w_principal,f_pos_ventana(w_principal.m_principal),original!)
w_principal.arrangesheets(layer!)

end event

event e_encelab(long param);if not enabled then return
opensheet (w_plant_hcs,w_principal,7,original!)
w_principal.arrangesheets(layer!)

end event

event e_enctab(long param);if not enabled then return
opensheet (w_tabulacion_encuentas,w_principal,7,original!)
w_principal.arrangesheets(layer!)

end event

event e_encest(long param);if not enabled then return
opensheet (w_generar_estadist,w_principal,7,original!)
w_principal.arrangesheets(layer!)

end event

event e_enclist(long param);if not enabled then return
OpenSheet( w_grid_encuestas,w_principal,7,original!)
w_principal.arrangesheets(layer!)

end event

event e_encsat(long param);if not f_num_compu('c','c') then return
mf_abre_tablas2("Encuestas - ",'dw_combo_lugar','dw_plant_tingre_conf')

end event

event e_contoll(long param);if not enabled then return
opensheet (w_llamadas,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_mercadeo(long param);if not enabled then return
opensheet (w_pyp_prog,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_cohortes(long param);if not enabled then return
opensheet (w_genera_202,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_202(long param);if not enabled then return
opensheet (w_genera_202,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_factura(long param);if not enabled then return
opensheet (w_factura,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
if isvalid(w_factura) then w_factura.f_abrir_pendientes()
end event

event e_anticipo(long param);if not enabled then return
opensheet (w_abonos,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_recibo(long param);if not enabled then return
opensheet (w_rec_caja,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_bancorec(long param);if not enabled then return
opensheet (w_banco_fluid,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)
end event

event e_bancores(long param);if not enabled then return
opensheet (w_banco_reserva,w_principal,7,original!)
w_principal.ArrangeSheets ( layer!)

end event

type dw_huella from uo_datawindow within w_principal
boolean visible = false
integer x = 5202
integer y = 732
integer width = 183
integer height = 88
integer taborder = 20
string title = "none"
string dataobject = "dw_biometria_pacientes"
boolean border = false
end type

event constructor;settransobject(sqlca)
end event

type p_imagen from picture within w_principal
boolean visible = false
integer x = 4969
integer y = 1048
integer width = 146
integer height = 96
boolean originalsize = true
boolean focusrectangle = false
end type

type huella_total from olecustomcontrol within w_principal
event sensorplug ( string idsensor )
event sensorunplug ( string idsensor )
event fingerup ( string idsensor )
event fingerdown ( string idsensor )
event imageacquired ( string idsensor,  long ocx_width,  long ocx_height,  any rawimage,  long res )
boolean visible = false
integer x = 4585
integer y = 984
integer width = 146
integer height = 128
integer taborder = 40
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_principal.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event sensorplug(string idsensor);If IsValid(win_regis_pac)= true then
	f_biometria_escribe_log(win_regis_pac.tab_1.biometria.log_es,"Sensor: " + idSensor)
End If
Object.CapStartCapture(idSensor)
if isnull(idSensor) or idSensor='' or  Upper(idSensor)=Upper('file') then
	g_sensor=false
else
	g_sensor=true
end if


end event

event sensorunplug(string idsensor);Object.CapStopCapture(idSensor)
end event

event imageacquired(string idsensor, long ocx_width, long ocx_height, any rawimage, long res);st_biometria pac_test
integer ret

If 	g_captura=true  then
	If IsValid(win_regis_pac)= true then
		win_regis_pac.tab_1.biometria.p_imagen.picturename = ''
	End If
	FileDelete(gbiometria_filePathName)
	//Graba la imagen en archivo para poder mostrarla
	huella_total.Object.CapSaveRawImageToFile(rawimage, ocx_width, ocx_Height,gbiometria_filePathName , GRCAP_IMAGE_FORMAT_BMP);
	pac_test.size = 10000
	pac_test.template = Blob(Space(pac_test.size))
	ret=huella_total.Object.Extract(ref rawimage, ocx_Width, ocx_Height, Res, Ref pac_test.template,Ref  pac_test.size, ii_contexto);
	If ret = GR_BAD_QUALITY Then
		If IsValid(win_regis_pac)= true then
			 win_regis_pac.tab_1.biometria.p_imagen.picturename = "Erroneo.png"
			return 
		End If
	ElseIf ret = GR_MEDIUM_QUALITY Then
		If IsValid(win_regis_pac)= true then
			 win_regis_pac.tab_1.biometria.p_imagen.picturename = "Erroneo.png"
			return 
		End If
	  ElseIf ret = GR_HIGH_QUALITY Then
		If IsValid(win_regis_pac)= true then
			f_biometria_escribe_log(win_regis_pac.tab_1.biometria.log_es,"Huella Dactilar Extraida Satisfactoriamente. Calidad Excelente.")
		End If

	End If
	pac_template =  pac_test
	If IsValid(win_regis_pac)= true then
		win_regis_pac.tab_1.biometria.p_imagen.picturename = gbiometria_filePathName 
		win_regis_pac.tab_1.biometria.p_imagen.originalsize=false
		win_regis_pac.tab_1.biometria.p_imagen.resize(914,936)
		win_regis_pac.tab_1.biometria.pb_save.enabled=true
	Else
		p_imagen.picturename = gbiometria_filePathName 
		p_imagen.originalsize=false
		p_imagen.resize(146,96)
		p_imagen.visible=true
		l_huella=true
	     dw_1.triggerevent(itemchanged!)
	End If
End If
end event

type dw_1 from uo_datawindow within w_principal
integer x = 18
integer y = 456
integer width = 3008
integer height = 152
integer taborder = 10
string dragicon = "none!"
string dataobject = "dw_pac_gral"
boolean border = false
end type

event itemchanged;if getcolumnname()="tipodoc" and getitemstring(1,"documento") <> "" and  l_huella=false then
	if isvalid(w_admision) then
		if not w_admision.guardo then
			if w_admision.guardar()=1 then 
				setitem(1,'tipodoc',getitemstring(1,'tipodoc'))
				settext(getitemstring(1,'tipodoc'))
				return 1
			end if
		end if
	end if
	string snulo
	datetime fnula
	setnull(fnula)
	setnull(snulo)
	setitem(1,"documento",snulo)
	setitem(1,"historia",snulo)
	setitem(1,"nombre1",snulo)
	setitem(1,"nombre2",snulo)
	setitem(1,"apellido1",snulo)
	setitem(1,"apellido2",snulo)
	setitem(1,"sexo",snulo)
	setitem(1,"fnacimiento",fnula)
	if getcolumnname()="tipodoc" and (data ='AS' or data='MS') then 
		string ls_doc
		ls_doc=f_sin_identificacion()
		if ls_doc='-1' then
			return 1
		end if
		setitem(1,'documento',ls_doc)
		dw_1.setcolumn("documento")
		tipdoc=data 
		docu=ls_doc
		accepttext()	
		busca_paciente()
	end if	
	return
end if
////// PARA VERIFICAR BIOMETRIA
If g_biometria='1' then
 st_usuarios usu_st
	if l_huella=true then
		String l_rec[2]
		l_rec=f_biometria_valida_paciente(pac_template,'%','%',dw_huella,GR_MATCH,w_principal.huella_total,'paciente')
		if l_rec[1]<>'-1' then
			setitem(1,'tipodoc',trim(l_rec[1]))
			setitem(1,'documento',trim(l_rec[2]))
			dw_1.setcolumn("documento")
		end if
	end if	
end if
/////// FIN VALIDACION BIOMETRIA

if getcolumnname()="documento" and isvalid(w_admision) then
	if not w_admision.guardo then
		if w_admision.guardar()=1 then 
			setitem(1,'documento',RightTrim(LeftTrim(getitemstring(1,'documento'))))
			settext(RightTrim(LeftTrim(getitemstring(1,'documento'))))
			return 1
		end if
	end if
end if
if getcolumnname()="tipodoc" and (data ='AS' or data='MS') then 
	ls_doc=f_sin_identificacion()
	if ls_doc='-1' then
		return 1
	end if
	setitem(1,'documento',ls_doc)
	dw_1.setcolumn("documento")
	accepttext()	
end if	
if getcolumnname()="documento" and gettext() <> "" then
	docu=gettext()
	tipdoc=getitemstring(1,"tipodoc")
	long nguion,j,donde, edad_ini,edad_fin,dias

	int largo
	string docu2,formato,l_dias

	
	t_doc.setfilter("codtipoident ='"+tipdoc+"'")
	t_doc.filter()
	tipo_pais=t_doc.getitemstring(1,"pais")
	If t_doc.rowcount()>0 then
		busca_paciente()
		largo=t_doc.getitemnumber(1,"largo")
		formato=t_doc.getitemstring(1,"formato")
		edad_ini=t_doc.getitemnumber(1,"edad_ini")
		edad_fin=t_doc.getitemnumber(1,"edad_fin")
		if edad_fin<=90 then l_dias='dias' else l_dias='años' 
		t_doc.setfilter("")
		t_doc.filter()
		if dw_1.getitemnumber(1,'dias')<>0 then 
			if dw_1.getitemnumber(1,'dias')<= edad_ini or dw_1.getitemnumber(1,'dias')>= edad_fin then
				messagebox('ERROR',UPPER('Inconsistencias en datos no aplica edad para el documento debe estar entre '+string(int(edad_ini/360))+' y ' +string(int(edad_fin/360)) + l_dias))
				return 1
			end if
			docu2=docu
			if pos(docu2,'.')>0 or pos(docu2,',')>0  then
				setnull(docu)
				setitem(1,"documento",docu)
				return 1
			end if
			if not f_valid_nu(tipdoc,docu,largo,formato) then
				setnull(docu)
				setitem(1,"documento",docu)
				return 1
			end if
		end if
	else
		setnull(docu)
		setnull(tipdoc)
	end If
else
	setnull(docu)
	setnull(tipdoc)
end if
accepttext()
end event

event buttonclicked;if tipdoc<>'' and docu<>'' then
	st_usu.valida='valida'
	st_usu.usuario=g_descrip_usu
	st_usu.n1=dw_1.getitemstring(1,'nombre1')
	st_usu.n2=dw_1.getitemstring(1,'nombre2')
	st_usu.a1=dw_1.getitemstring(1,'apellido1')
	st_usu.a2=dw_1.getitemstring(1,'apellido2')
	st_usu.td=dw_1.getitemstring(1,'tipodoc')
	st_usu.dc=dw_1.getitemstring(1,'documento')
	st_usu.fn=dw_1.getitemdatetime(1,'fnacimiento')
	openwithparm(w_busca_en_capit,st_usu)
	//open(w_busca_afil)
end if

end event

event constructor;settransobject(sqlca)
modify('b_1.visible=1')
insertrow(0)
GetChild('tipodoc',t_doc)
t_doc.SetTransObject(SQLCA)
t_doc.retrieve()

end event

event dberror;return 1
end event

type gb_1 from groupbox within w_principal
integer y = 428
integer width = 5673
integer height = 204
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_odprofe from uo_datawindow within w_principal
boolean visible = false
integer x = 3003
integer y = 476
integer width = 2697
integer height = 112
integer taborder = 30
string dragicon = "none!"
string dataobject = "dw_escogeodon"
boolean border = false
end type

event itemchanged;string profesi
choose case this.getcolumn()
	case 1
		profesi=gettext()
		string usu,evolu
		select usuario,evoluciona into :usu,:evolu from profe where codprof=:profesi;
		if isnull(usu) or evolu='0' then
			this.settext(this.getitemstring(1,1))
			return 1
		end if
		openwithparm(w_conecta_evol,profesi)
		st_ordenes st_llega
		st_llega= Message.PowerObjectParm
		if st_llega.clugar='!' then 
			settext(getitemstring(1,1))
			if isvalid(w_consulta) then w_consulta.triggerevent(deactivate!)
			if isvalid(w_atiendetto) then w_atiendetto.triggerevent(deactivate!)
			return 2
		end if
		setitem(1,2,"")
		accepttext()
		odespe.retrieve(profesi)
		if odespe.rowcount() < 1 then 
			messagebox("Atención","Profesional no tiene asignada Especialidad")
			this.settext(this.getitemstring(1,1))
			return 1
		else
			setitem(1,2,odespe.getitemstring(1,2))
		end if
		if isvalid(w_consulta) then w_consulta.triggerevent(open!)
		if isvalid(w_atiendetto) then w_atiendetto.triggerevent(open!)
		this.setfocus()
	case 2
		if isvalid(w_consulta) then 
			if w_consulta.cambia_prof_espe(getitemstring(1,1),gettext())=-1 then
				settext(getitemstring(1,2))
				return 2
			end if 
		end if
		if isvalid(w_atiendetto) then 
			if w_atiendetto.cambia_prof_espe(getitemstring(1,1),gettext())=-1 then
				settext(getitemstring(1,2))
				return 2
			end if 
		end if
end choose
end event

event constructor;settransobject(sqlca)
getchild('cesp',odespe)
odespe.settransobject(sqlca)
insertrow(1)
end event

type dw_profe from uo_datawindow within w_principal
boolean visible = false
integer x = 3003
integer y = 476
integer width = 2661
integer height = 112
integer taborder = 20
string dragicon = "none!"
boolean bringtotop = true
string dataobject = "dw_escogeprof"
boolean border = false
end type

event itemchanged;string profesi
choose case getcolumn()
	case 1
		profesi=gettext()
		string usu,evolu
		select usuario,evoluciona into :usu,:evolu from profe where codprof=:profesi;
		if isnull(usu) or evolu='0' then
			settext(getitemstring(1,1))
			return 1
		end if
		openwithparm(w_conecta_evol,profesi)
		st_ordenes st_llega
		st_llega= Message.PowerObjectParm
		if st_llega.clugar='!' then 
			settext(getitemstring(1,1))
			if isvalid(w_hist_gral) then w_hist_gral.triggerevent(deactivate!)
			return 2
		end if
		setitem(1,2,"")
		accepttext()
		espe.retrieve(profesi)
		if espe.rowcount() < 1 then 
			messagebox("Atención","Profesional no tiene asignada Especialidad")
			settext(getitemstring(1,1))
			return 1
		else
			setitem(1,2,espe.getitemstring(1,2))
		end if
		if isvalid(w_hist_gral) then w_hist_gral.triggerevent(open!)
		setfocus()
	case 2
		if isvalid(w_hist_gral) then 
			if w_hist_gral.cambia_prof_espe(getitemstring(1,1),gettext())=-1 then
				settext(getitemstring(1,2))
				return 2
			end if
		end if
end choose

end event

event constructor;settransobject(sqlca)
getchild('cesp',espe)
espe.settransobject(sqlca)
insertrow(1)


end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Fw_principal.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Fw_principal.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
