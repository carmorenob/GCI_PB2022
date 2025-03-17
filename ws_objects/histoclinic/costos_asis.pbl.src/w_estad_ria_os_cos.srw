$PBExportHeader$w_estad_ria_os_cos.srw
forward
global type w_estad_ria_os_cos from window
end type
type st_4 from statictext within w_estad_ria_os_cos
end type
type dw_canasta from datawindow within w_estad_ria_os_cos
end type
type st_desdiag from statictext within w_estad_ria_os_cos
end type
type st_cdiaging from statictext within w_estad_ria_os_cos
end type
type st_3 from statictext within w_estad_ria_os_cos
end type
type dw_trae_varias from datawindow within w_estad_ria_os_cos
end type
type cb_registra from picturebutton within w_estad_ria_os_cos
end type
type dw_trae from datawindow within w_estad_ria_os_cos
end type
type dw_empac from datawindow within w_estad_ria_os_cos
end type
type dw_cont_det from datawindow within w_estad_ria_os_cos
end type
type dw_segrespon from datawindow within w_estad_ria_os_cos
end type
type sle_5 from singlelineedit within w_estad_ria_os_cos
end type
type sle_3 from singlelineedit within w_estad_ria_os_cos
end type
type sle_2 from singlelineedit within w_estad_ria_os_cos
end type
type sle_1 from singlelineedit within w_estad_ria_os_cos
end type
type gb_4 from groupbox within w_estad_ria_os_cos
end type
type gb_3 from groupbox within w_estad_ria_os_cos
end type
type cb_cancel from picturebutton within w_estad_ria_os_cos
end type
type cb_guarda from picturebutton within w_estad_ria_os_cos
end type
type rb_anul from radiobutton within w_estad_ria_os_cos
end type
type rb_incomp from radiobutton within w_estad_ria_os_cos
end type
type rb_comp from radiobutton within w_estad_ria_os_cos
end type
type rb_tod from radiobutton within w_estad_ria_os_cos
end type
type sle_4 from singlelineedit within w_estad_ria_os_cos
end type
type gb_1 from groupbox within w_estad_ria_os_cos
end type
type dw_inf from datawindow within w_estad_ria_os_cos
end type
type tab_1 from tab within w_estad_ria_os_cos
end type
type tp_1 from userobject within tab_1
end type
type cb_del from picturebutton within tp_1
end type
type st_desproc from statictext within tp_1
end type
type dw_rias from datawindow within tp_1
end type
type st_1 from statictext within tp_1
end type
type cbx_replica from checkbox within tp_1
end type
type st_2 from statictext within tp_1
end type
type tp_1 from userobject within tab_1
cb_del cb_del
st_desproc st_desproc
dw_rias dw_rias
st_1 st_1
cbx_replica cbx_replica
st_2 st_2
end type
type tp_2 from userobject within tab_1
end type
type pb_del_insumo from picturebutton within tp_2
end type
type dw_insumo from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
pb_del_insumo pb_del_insumo
dw_insumo dw_insumo
end type
type tab_1 from tab within w_estad_ria_os_cos
tp_1 tp_1
tp_2 tp_2
end type
end forward

global type w_estad_ria_os_cos from window
integer width = 3483
integer height = 2496
boolean titlebar = true
string title = "Atender Procedimientos / Estado de Rips"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "rips.ico"
string pointer = "Arrow!"
boolean clientedge = true
boolean center = true
st_4 st_4
dw_canasta dw_canasta
st_desdiag st_desdiag
st_cdiaging st_cdiaging
st_3 st_3
dw_trae_varias dw_trae_varias
cb_registra cb_registra
dw_trae dw_trae
dw_empac dw_empac
dw_cont_det dw_cont_det
dw_segrespon dw_segrespon
sle_5 sle_5
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
gb_4 gb_4
gb_3 gb_3
cb_cancel cb_cancel
cb_guarda cb_guarda
rb_anul rb_anul
rb_incomp rb_incomp
rb_comp rb_comp
rb_tod rb_tod
sle_4 sle_4
gb_1 gb_1
dw_inf dw_inf
tab_1 tab_1
end type
global w_estad_ria_os_cos w_estad_ria_os_cos

type variables
string sexo_paci,i_ccalm,i_ufalm,i_est_hadm,i_clug_hadm,i_cemp,i_ccont,i_nautoriza
long i_nh,i_norden,i_nserv_cos
datawindowchild idw_ufun,idw_cc,idw_espe
trae i_st
string i_cambio='n',i_cdiaging,i_causaext
DataWindowChild idw_fincon,idw_finproc,idw_causaex,idw_ambproc
end variables
on w_estad_ria_os_cos.create
this.st_4=create st_4
this.dw_canasta=create dw_canasta
this.st_desdiag=create st_desdiag
this.st_cdiaging=create st_cdiaging
this.st_3=create st_3
this.dw_trae_varias=create dw_trae_varias
this.cb_registra=create cb_registra
this.dw_trae=create dw_trae
this.dw_empac=create dw_empac
this.dw_cont_det=create dw_cont_det
this.dw_segrespon=create dw_segrespon
this.sle_5=create sle_5
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.gb_4=create gb_4
this.gb_3=create gb_3
this.cb_cancel=create cb_cancel
this.cb_guarda=create cb_guarda
this.rb_anul=create rb_anul
this.rb_incomp=create rb_incomp
this.rb_comp=create rb_comp
this.rb_tod=create rb_tod
this.sle_4=create sle_4
this.gb_1=create gb_1
this.dw_inf=create dw_inf
this.tab_1=create tab_1
this.Control[]={this.st_4,&
this.dw_canasta,&
this.st_desdiag,&
this.st_cdiaging,&
this.st_3,&
this.dw_trae_varias,&
this.cb_registra,&
this.dw_trae,&
this.dw_empac,&
this.dw_cont_det,&
this.dw_segrespon,&
this.sle_5,&
this.sle_3,&
this.sle_2,&
this.sle_1,&
this.gb_4,&
this.gb_3,&
this.cb_cancel,&
this.cb_guarda,&
this.rb_anul,&
this.rb_incomp,&
this.rb_comp,&
this.rb_tod,&
this.sle_4,&
this.gb_1,&
this.dw_inf,&
this.tab_1}
end on

on w_estad_ria_os_cos.destroy
destroy(this.st_4)
destroy(this.dw_canasta)
destroy(this.st_desdiag)
destroy(this.st_cdiaging)
destroy(this.st_3)
destroy(this.dw_trae_varias)
destroy(this.cb_registra)
destroy(this.dw_trae)
destroy(this.dw_empac)
destroy(this.dw_cont_det)
destroy(this.dw_segrespon)
destroy(this.sle_5)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.gb_4)
destroy(this.gb_3)
destroy(this.cb_cancel)
destroy(this.cb_guarda)
destroy(this.rb_anul)
destroy(this.rb_incomp)
destroy(this.rb_comp)
destroy(this.rb_tod)
destroy(this.sle_4)
destroy(this.gb_1)
destroy(this.dw_inf)
destroy(this.tab_1)
end on

event open;sle_5.backcolor=rgb(255,255,200) //color crema para el mostrario de no obligatorio
i_st=message.powerobjectparm
long j,k
string err
select nh,clugar,estado,cemp,ccontrato,autoriza,causaexterna,diagingre
into :i_nh ,:i_clug_hadm,:i_est_hadm,:i_cemp,:i_ccont,:i_nautoriza,:i_causaext,:i_cdiaging
from hospadmi where contador=:i_st.numero and clugar_his=:i_st.lugar;
dw_inf.retrieve(i_nh,i_clug_hadm)
if i_cdiaging<>'' then
	select cod_rips , desdiag into :st_cdiaging.text,:st_desdiag.text from diags where codgeral=:i_cdiaging;
end if
if i_st.dw_procs.rowcount()>0 then
	i_norden=i_st.dw_procs.getitemnumber(1,'nsolicitud')
else
	if i_st.dw_meds.rowcount()=0 then return
	i_norden=i_st.dw_meds.getitemnumber(1,'nsolicitud')
end if
i_st.dw_meds.rowscopy(1,i_st.dw_meds.filteredcount(),FILTER!,Dw_canasta,1,primary!)
i_st.dw_meds.rowscopy(1,i_st.dw_meds.rowcount(),primary!,Dw_canasta,1,primary!)
dw_canasta.resetupdate()
if i_st.otro="carga" then
	boolean reviso_costos
	datetime hoy
	hoy=datetime(today(),now())
	tab_1.tp_1.dw_rias.getchild('desufuncional',idw_ufun)
	tab_1.tp_1.dw_rias.getchild('descripcion',idw_cc)
	idw_ufun.settransobject(sqlca)
	idw_cc.settransobject(sqlca)
	tab_1.tp_1.dw_rias.settransobject(SQLCA)
	for j=1 to i_st.dw_procs.rowcount()
		k=dw_trae.insertrow(0)
		dw_trae.setitem(k,'contador',i_st.dw_procs.getitemnumber(j,'contador'))
		dw_trae.setitem(k,'clugar',i_st.dw_procs.getitemstring(j,'clugar'))
		dw_trae.setitem(k,'nsolicitud',i_st.dw_procs.getitemnumber(j,'nsolicitud'))
		dw_trae.setitem(k,'item',i_st.dw_procs.getitemnumber(j,'item'))
		dw_trae.setitem(k,'solicitada',i_st.dw_procs.getitemnumber(j,'solicitada'))
		dw_trae.setitem(k,'suministrada',i_st.dw_procs.getitemnumber(j,'suministrada'))	
		dw_trae.setitem(k,'estado',i_st.dw_procs.getitemstring(j,'estado'))
		dw_trae.setitem(k,'facturar',i_st.dw_procs.getitemnumber(j,'facturar'))
		if isnull(i_st.dw_procs.getitemnumber(j,'secuencia')) then //proc
			dw_trae.setitem(k,"asumin",dw_trae.getitemnumber(k,"solicitada")-dw_trae.getitemnumber(k,"suministrada"))
			dw_trae.setitem(k,'descripcion',i_st.dw_procs.getitemstring(j,'descripcion'))
			dw_trae.setitem(k,'rip_proc',i_st.dw_procs.getitemstring(j,'rips'))
			dw_trae.setitem(k,'codproced',i_st.dw_procs.getitemstring(j,'codproced'))
		else//es un insumo y se debe revisar el proced de costos(que exista en serviciosingreso)
			if not reviso_costos then
				SELECT Min(ServiciosIngreso.Nservicio) into :i_nserv_cos
				FROM OSCuerpo INNER JOIN ServiciosIngreso ON (OSCuerpo.Item = ServiciosIngreso.item_orden) AND (OSCuerpo.NSolicitud = ServiciosIngreso.norden_serv) AND (OSCuerpo.clugar = ServiciosIngreso.clug_orden) AND (OSCuerpo.Contador = ServiciosIngreso.conta_orden)
				WHERE OSCuerpo.estado='C' AND ServiciosIngreso.Contador=:i_st.numero AND ServiciosIngreso.CLugar=:i_st.lugar;
				if isnull(i_nserv_cos) then
					select max(nservicio) into :i_nserv_cos from serviciosingreso where
					ServiciosIngreso.Contador=:i_st.numero AND ServiciosIngreso.CLugar=:i_st.lugar;
					if isnull(i_nserv_cos) then i_nserv_cos=0
					i_nserv_cos ++
					long norden,itemord
					norden=i_st.dw_procs.getitemnumber(j,'nsolicitud')
					itemord=i_st.dw_procs.getitemnumber(j,'item')
					insert into serviciosingreso(cantidad,contador,clugar,nservicio,conta_orden,clug_orden,norden_serv,item_orden,cemp,ccontrato,rips,estria,tipo_servicio,cproced,cprof,fecha)
					values(0,:i_st.numero,:i_st.lugar,:i_nserv_cos,:i_st.numero,:i_st.lugar,:norden,:itemord,:i_cemp,:i_ccont,'7','1','C',:i_st.proc_costos,:i_st.profe,:hoy);
					if sqlca.sqlcode=-1 then
						err=sqlca.sqlerrtext
						rollback;
						messagebox('Error insertando en ServiciosIngreso el proc. de costos',err)
						close(this)
						return
					else
						commit;
					end if
				end if
				tab_1.tp_1.dw_rias.retrieve(i_st.numero,i_nserv_cos,i_st.lugar)
				reviso_costos=true
			end if
			
			dw_trae.setitem(k,'c_medica',i_st.dw_procs.getitemstring(j,'c_medica'))
			dw_trae.setitem(k,'rip_med',i_st.dw_procs.getitemstring(j,'rips'))
			dw_trae.setitem(k,'medicamento',i_st.dw_procs.getitemstring(j,'descripcion'))
			dw_trae.setitem(k,'entregada',i_st.dw_procs.getitemnumber(j,'entregada'))
			dw_trae.setitem(k,'secuencia',i_st.dw_procs.getitemnumber(j,'secuencia'))
			//dw_trae.setitem(k,'del_kit',i_st.dw_procs.getitemstring(j,'del_kit'))no es necesario siempre va a ser cero
			dw_trae.setitem(k,"asumin",dw_trae.getitemnumber(k,"entregada")-dw_trae.getitemnumber(k,"suministrada"))
		end if
	next
	dw_trae.resetupdate()
else//revisa
	cb_registra.enabled=false
	tab_1.tp_1.dw_rias.dataobject="dw_rips_os_todos"
	tab_1.tp_1.dw_rias.getchild('desufuncional',idw_ufun)
	tab_1.tp_1.dw_rias.getchild('descripcion',idw_cc)
	idw_ufun.settransobject(sqlca)
	idw_ufun.insertrow(1)
	idw_cc.settransobject(sqlca)
	idw_cc.insertrow(1)
	tab_1.tp_1.dw_rias.settransobject(sqlca)
	if i_st.dw_procs.rowcount()=0 then
		dw_trae.retrieve(i_st.numero,i_st.lugar,i_norden)
		tab_1.tp_2.dw_insumo.retrieve(i_st.numero,i_st.lugar,i_norden)
		tab_1.tp_1.dw_rias.retrieve(i_st.numero,i_st.lugar,i_norden)
	else
		dw_trae.retrieve(i_st.numero,i_st.lugar,i_st.dw_procs.getitemnumber(1,'nsolicitud'))
		tab_1.tp_2.dw_insumo.retrieve(i_st.numero,i_st.lugar,i_st.dw_procs.getitemnumber(1,'nsolicitud'))
		tab_1.tp_1.dw_rias.retrieve(i_st.numero,i_st.lugar,i_st.dw_procs.getitemnumber(1,'nsolicitud'))
	end if
end if
string temp
setnull(i_ccalm)
i_ufalm=i_ccalm
tab_1.tp_1.dw_rias.getchild('desesp',idw_espe)
idw_espe.settransobject(sqlca)
if tab_1.tp_1.dw_rias.rowcount()>0 then idw_espe.retrieve(tab_1.tp_1.dw_rias.getitemstring(1,'cprof'))
choose case i_st.tingres
	case '2'
		if ls_pro=32 THEN	 RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_URG", Regstring!, temp  )
		if ls_pro=64 THEN	 RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_URG", Regstring!, temp  )	
	case '3'
		if ls_pro=32 THEN	 RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_HOSP", Regstring!, temp  )
		if ls_pro=64 THEN	 RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_HOSP", Regstring!, temp  )	
	case '4'
		if ls_pro=32 THEN	 RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_AMB", Regstring!, temp  )
		if ls_pro=64 THEN	 RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_AMB", Regstring!, temp  )	
end choose
select codufun,codcencosto into :i_ccalm,:i_ufalm from sumalmacen where codalmacen=:temp;
dw_trae.triggerevent(rowfocuschanged!)

end event

event close;closewithreturn(this,i_cambio)
end event

type st_4 from statictext within w_estad_ria_os_cos
integer x = 32
integer y = 472
integer width = 608
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Insumos del Procedimiento:"
boolean focusrectangle = false
end type

type dw_canasta from datawindow within w_estad_ria_os_cos
integer x = 23
integer y = 528
integer width = 3241
integer height = 472
integer taborder = 160
string title = "none"
string dataobject = "dw_oscuerpo_canasta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
object.escog.visible=0
object.cod_insumo.visible=0
object.devuelta.visible=0
object.observaciones.visible=0
object.estado.visible=0
object.asumin.visible=1
object.solicitada.edit.displayonly=true
object.CONVERSION.edit.displayonly=true
object.umed.edit.displayonly=true
object.entregada_t.color=0
end event

type st_desdiag from statictext within w_estad_ria_os_cos
integer x = 544
integer y = 1172
integer width = 2866
integer height = 68
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

type st_cdiaging from statictext within w_estad_ria_os_cos
integer x = 357
integer y = 1172
integer width = 174
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_estad_ria_os_cos
integer x = 27
integer y = 1176
integer width = 315
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Diag. Ingreso:"
boolean focusrectangle = false
end type

type dw_trae_varias from datawindow within w_estad_ria_os_cos
string tag = "xa hacer luego el retrieve "
boolean visible = false
integer x = 2976
integer y = 448
integer width = 151
integer height = 72
integer taborder = 170
boolean enabled = false
string title = "none"
string dataobject = "dw_trae_varias"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_registra from picturebutton within w_estad_ria_os_cos
event mousemove pbm_mousemove
integer x = 3278
integer y = 524
integer width = 142
integer height = 124
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &"
string picturename = "llevar.GIF"
string disabledname = "d_llevar.GIF"
alignment htextalign = left!
string powertiptext = "Registrar Procedimientos [Alt+R]"
end type

event clicked;string ambito,finali,coduf,codcc,crips,uf,cc,cemp,ccont
long j,donde,nserv,k,l,z,tt,busca,j_insum,ninsum
dw_trae.accepttext()
cemp=i_cemp
ccont=i_ccont
if dw_trae.find('asumin=0',1,dw_trae.rowcount())>0 then
	if messagebox("Atención","Hay procedimientos que no van a ser atendidos (ASumin = cero), desea continuar aún así ?",question!,yesno!,1)=2 then return
end if
dw_cont_det.retrieve(i_cemp,i_ccont,i_st.tingres)
if dw_cont_det.rowcount()=0 then
	messagebox("Error","El contrato de este paciente no tiene planes de servicios, adicionele planes para poder continuar")
	return
end if
string tipo_afil,des_cont,plan,codproc

boolean yapaso=false
dw_empac.retrieve(i_cemp,i_ccont,tipdoc,docu)
if dw_empac.rowcount()=0 then
	messagebox("Atención","El paciente no tiene asignada la empresa de ese ingreso, revise el responsable de ese ingreso")
	return
end if
tipo_afil=dw_empac.getitemstring(1,"codta")
dw_segrespon.retrieve(i_cemp,i_ccont,tipo_afil)
select max(nservicio) into :nserv from serviciosingreso where contador=:i_st.numero and clugar=:i_st.lugar;
if isnull(nserv) then nserv=0
select max(nro_insumo) into :ninsum from serving_insumo where contador=:i_st.numero and clugar=:i_st.lugar and nservicio=:i_nserv_cos;
if isnull(ninsum) then ninsum=0
nserv ++
setnull(codcc)
setnull(coduf)
//if w_atiende_os.tipo_ingres='3' then
SELECT Camas.CUfuncional, Camas.CCcosto into :coduf,:codcc
FROM Camas 
WHERE ningreso=:i_nh AND clugar_ing=:i_clug_hadm;
i_st.dw_meds.setfilter('')
i_st.dw_meds.filter()
for j=1 to dw_trae.rowcount()
	if dw_trae.getitemnumber(j,"asumin")>0 then
		codproc=dw_trae.getitemstring(j,"codproced")
		long cant=1
		if not isnull(codproc) then
			crips=dw_trae.getitemstring(j,"rip_proc")
			///////*********
			DO // pa poder revisar en todos los responsables
				if dw_segrespon.rowcount()>0 then des_cont=dw_segrespon.getitemstring(1,"descontrato")
				if dw_cont_det.rowcount()=0 then 
					messagebox("Error de Configuración","El contrato "+dw_segrespon.getitemstring(1,"descontrato")+" de la empresa "+dw_segrespon.getitemstring(1,"desemp")+" no tiene planes")
					return
				end if	
				/// viene lo duro	
				for z=1 to dw_cont_det.rowcount() // de aquí tiene que salir cuando encuentre los valores
					plan=dw_cont_det.getitemstring(z,"cplan")
					if f_proc_plan(codproc,plan) then goto salio
				next
			/// fin de viene lo duro
				if yapaso then 
					messagebox("Error en configuración de contratos","No se puede encontrar responsable de este procedimiento, revise incluso la empresa Particular")
					return
				end if
				if dw_segrespon.getitemstring(1,"segrespon")<>"" and dw_segrespon.getitemstring(1,"contsegrespon")<>"" then
					cemp=dw_segrespon.getitemstring(1,"segrespon")
					ccont=dw_segrespon.getitemstring(1,"contsegrespon")
					dw_segrespon.retrieve(cemp,ccont,tipo_afil)
				else
					cemp='0'
					ccont='1'
					yapaso=true
				end if
				dw_cont_det.retrieve(cemp,ccont,i_st.tingres/*tipoingreso*/)
			LOOP WHILE true
			salio:
			///// fin revisa a quien le van a cargar esto
			setnull(plan)
			/////*******
			long hasta,cantidad
			if crips='6' or crips='7' then// medicamento y otros
				hasta=1
				cantidad=dw_trae.getitemnumber(j,"asumin")
			else// los procs se deben registrar uno a uno
				cantidad=1
				hasta=dw_trae.getitemnumber(j,"asumin")
			end if
			for k=1 to hasta
				donde=dw_trae_varias.insertrow(0)
				dw_trae_varias.setitem(donde,"nservicio",nserv)
				if idw_ufun.rowcount()=0 then idw_ufun.insertrow(1)
				if idw_cc.rowcount()=0 then idw_cc.insertrow(1)
				donde=tab_1.tp_1.dw_rias.insertrow(0)
				tab_1.tp_1.dw_rias.setitem(donde,"cproced",codproc)
				tab_1.tp_1.dw_rias.setitem(donde,"usuario",usuario)
				select tipoproc into :finali from proced where codproced=:codproc;
				if isnull(finali) then finali='10'
				tab_1.tp_1.dw_rias.setitem(donde,"rips_descripcion",crips)
				tab_1.tp_1.dw_rias.setitem(donde,"rips",crips)
				tab_1.tp_1.dw_rias.setitem(donde,"facturar",dw_trae.getitemnumber(j,"facturar"))
				tab_1.tp_1.dw_rias.setitem(donde,"nautoriza",i_nautoriza)
				
				tab_1.tp_1.dw_rias.setitem(donde,"s_fecha",datetime(today(),time(string(now()))))
				tab_1.tp_1.dw_rias.setitem(donde,"s_cantidad",cantidad)
				tab_1.tp_1.dw_rias.setitem(donde,"contador",i_st.numero)
				tab_1.tp_1.dw_rias.setitem(donde,"cemp",cemp)
				tab_1.tp_1.dw_rias.setitem(donde,"cplan",plan)
				tab_1.tp_1.dw_rias.setitem(donde,"ccontrato",ccont)
				tab_1.tp_1.dw_rias.setitem(donde,"clugar",i_st.lugar)
				tab_1.tp_1.dw_rias.setitem(donde,"nservicio",nserv)
				choose case crips
					case '1'
						tab_1.tp_1.dw_rias.setitem(donde,"s_causaexterna",i_causaext)
						tab_1.tp_1.dw_rias.setitem(donde,"s_diagprin_",st_cdiaging.text)
						tab_1.tp_1.dw_rias.setitem(donde,"s_diagprin",i_cdiaging)
					case '2'
						tab_1.tp_1.dw_rias.setitem(donde,"s_diagprin_",st_cdiaging.text)
						tab_1.tp_1.dw_rias.setitem(donde,"s_diagprin",i_cdiaging)
						tab_1.tp_1.dw_rias.setitem(donde,"s_finalidadproced",finali)
					case '8'
						tab_1.tp_1.dw_rias.setitem(donde,"s_causaexterna",i_causaext)	
						tab_1.tp_1.dw_rias.setitem(donde,"s_diagprin_",st_cdiaging.text)
						tab_1.tp_1.dw_rias.setitem(donde,"s_diagprin",i_cdiaging)
					case '9'
						tab_1.tp_1.dw_rias.setitem(donde,"s_finalidadproced",finali)
				end choose
				setnull(cc)
				uf=cc
				if idw_ufun.retrieve(codproc,i_st.tingres)> 0 then
					if idw_ufun.rowcount()=1 then 
						uf=idw_ufun.getitemstring(1,'coduf')
					else
						busca=idw_ufun.find("coduf='"+coduf+"'",1,idw_ufun.rowcount())
						if busca<>0 then uf=coduf//debe dejar el de la cama
					end if
					if idw_cc.retrieve(codproc,i_st.tingres,uf)>0 then
						if idw_cc.rowcount()=1 then
							cc=idw_cc.getitemstring(1,'codcc')
						else
							busca=idw_cc.find("codcc='"+codcc+"'",1,idw_cc.rowcount())
							if busca<>0 then cc=codcc
						end if
					end if
					if isnull(uf) or isnull(cc) then//porque a veces uno de los dos no es null
						setnull(uf)
						setnull(cc)
					end if
				end if
				tab_1.tp_1.dw_rias.setitem(donde,"cufuncional",uf)
				tab_1.tp_1.dw_rias.setitem(donde,"cccosto",cc)
				
				tab_1.tp_1.dw_rias.setitem(donde,"tipo_orden",'H')
				choose case i_st.tingres
					case '2' 
						ambito='3'
					case '1'
						ambito='1'
					case '3','4','7'
						ambito='2'
				end choose
				tab_1.tp_1.dw_rias.setitem(donde,"s_ambitoproced",ambito)
				tab_1.tp_1.dw_rias.setitem(donde,"cprof",i_st.profe)
				if idw_espe.retrieve(i_st.profe)=1 then
					tab_1.tp_1.dw_rias.setitem(donde,"s_codespecialidad",idw_espe.getitemstring(1,'cesp'))
				end if
				tab_1.tp_1.dw_rias.setitem(donde,"conta_orden",i_st.numero)
				tab_1.tp_1.dw_rias.setitem(donde,"clug_orden",i_st.lugar)
				tab_1.tp_1.dw_rias.setitem(donde,"norden_serv",i_norden)
				tab_1.tp_1.dw_rias.setitem(donde,"item_orden",dw_trae.getitemnumber(j,"item"))
				/////////// insumos
				dw_canasta.setfilter('item='+string(dw_trae.getitemnumber(j,"item"))+' and entregada - devuelta > suministrada')
				dw_canasta.filter()
				dw_canasta.sort()
				for j_insum=1 to dw_canasta.rowcount()
					tab_1.tp_2.dw_insumo.insertrow(j_insum)
					tab_1.tp_2.dw_insumo.setitem(j_insum,'contador',i_st.numero)
					tab_1.tp_2.dw_insumo.setitem(j_insum,'clugar',i_st.lugar)
					tab_1.tp_2.dw_insumo.setitem(j_insum,'nservicio',nserv)
					tab_1.tp_2.dw_insumo.setitem(j_insum,'nro_insumo',j_insum)
					tab_1.tp_2.dw_insumo.setitem(j_insum,'del_kit',dw_canasta.getitemstring(j_insum,'del_kit'))
					tab_1.tp_2.dw_insumo.setitem(j_insum,'cod_insumo',dw_canasta.getitemstring(j_insum,'cod_insumo'))
					tab_1.tp_2.dw_insumo.setitem(j_insum,'codgenerico',dw_canasta.getitemstring(j_insum,'codgenerico'))
//					tab_1.tp_2.dw_insumo.setitem(j_insum,'codarticulo',i_st.dw_meds.getitemstring(j_insum,'codarticulo'))
					tab_1.tp_2.dw_insumo.setitem(j_insum,'umed',dw_canasta.getitemstring(j_insum,'umed'))
					tab_1.tp_2.dw_insumo.setitem(j_insum,'conversion',dw_canasta.getitemnumber(j_insum,'conversion'))
					tab_1.tp_2.dw_insumo.setitem(j_insum,'cantidad',dw_canasta.getitemnumber(j_insum,'asumin'))
					tab_1.tp_2.dw_insumo.setitem(j_insum,'contador_os',i_st.numero)
					tab_1.tp_2.dw_insumo.setitem(j_insum,'clugar_os',i_st.lugar)
					tab_1.tp_2.dw_insumo.setitem(j_insum,'nsolicitud',dw_canasta.getitemnumber(j_insum,'nsolicitud'))
					tab_1.tp_2.dw_insumo.setitem(j_insum,'item_os',dw_canasta.getitemnumber(j_insum,'item'))
					tab_1.tp_2.dw_insumo.setitem(j_insum,'secuencia_os',dw_canasta.getitemnumber(j_insum,'secuencia'))
					tab_1.tp_2.dw_insumo.setitem(j_insum,'facturar',dw_canasta.getitemnumber(j_insum,'facturar'))
					dw_canasta.setitem(j_insum,'suministrada',dw_canasta.getitemnumber(j_insum,'suministrada')+dw_canasta.getitemnumber(j_insum,'asumin'))
					dw_canasta.setitem(j_insum,'asumin',0)
					if dw_canasta.getitemnumber(j_insum,"suministrada") >= dw_canasta.getitemnumber(j_insum,"solicitada") then dw_canasta.setitem(j_insum,"estado","2")
				next
				/////////// fin insumos
				nserv ++
			next
			tt=dw_trae.getitemnumber(j,"suministrada")
			dw_trae.setitem(j,"suministrada",dw_trae.getitemnumber(j,"asumin")+tt)
			if dw_trae.getitemnumber(j,"suministrada") >= dw_trae.getitemnumber(j,"solicitada")then 
				dw_trae.setitem(j,"estado","2")
			end if
			dw_trae.setitem(j,"asumin",0)
		else  // M E D I C A M E N T O S//////////////////////
			donde=dw_trae_varias.insertrow(0)
			ninsum++
			dw_trae_varias.setitem(donde,'nro_insumo',ninsum)
			donde=tab_1.tp_2.dw_insumo.insertrow(0)
			j_insum=i_st.dw_meds.find("item="+string(dw_trae.getitemnumber(j,"item"))+" and secuencia="+string(dw_trae.getitemnumber(j,"secuencia")),1,i_st.dw_meds.rowcount())
			tab_1.tp_2.dw_insumo.setitem(donde,'contador',i_st.numero)
			tab_1.tp_2.dw_insumo.setitem(donde,'clugar',i_st.lugar)
			tab_1.tp_2.dw_insumo.setitem(donde,'nservicio',i_nserv_cos)
			tab_1.tp_2.dw_insumo.setitem(donde,'nro_insumo',ninsum)
			tab_1.tp_2.dw_insumo.setitem(donde,'del_kit','0')
			tab_1.tp_2.dw_insumo.setitem(donde,'cod_insumo',i_st.dw_meds.getitemstring(j_insum,'cod_insumo'))
			tab_1.tp_2.dw_insumo.setitem(donde,'codgenerico',i_st.dw_meds.getitemstring(j_insum,'codgenerico'))
			tab_1.tp_2.dw_insumo.setitem(donde,'umed',i_st.dw_meds.getitemstring(j_insum,'umed'))
			tab_1.tp_2.dw_insumo.setitem(donde,'conversion',i_st.dw_meds.getitemnumber(j_insum,'conversion'))
			tab_1.tp_2.dw_insumo.setitem(donde,'cantidad',dw_trae.getitemnumber(j,'asumin'))
			tab_1.tp_2.dw_insumo.setitem(donde,'vtotal',i_st.dw_meds.getitemnumber(j_insum,'vunit')*dw_trae.getitemnumber(j,'asumin'))
			tab_1.tp_2.dw_insumo.setitem(donde,'contador_os',i_st.numero)
			tab_1.tp_2.dw_insumo.setitem(donde,'clugar_os',i_st.lugar)
			tab_1.tp_2.dw_insumo.setitem(donde,'nsolicitud',i_st.dw_meds.getitemnumber(j_insum,'nsolicitud'))
			tab_1.tp_2.dw_insumo.setitem(donde,'item_os',i_st.dw_meds.getitemnumber(j_insum,'item'))
			tab_1.tp_2.dw_insumo.setitem(donde,'secuencia_os',i_st.dw_meds.getitemnumber(j_insum,'secuencia'))
			tab_1.tp_2.dw_insumo.setitem(donde,'facturar',i_st.dw_meds.getitemnumber(j_insum,'facturar'))
			i_st.dw_meds.setitem(j_insum,'suministrada',i_st.dw_meds.getitemnumber(j_insum,'suministrada')+dw_trae.getitemnumber(j,'asumin'))
			if i_st.dw_meds.getitemnumber(j_insum,"suministrada") >= i_st.dw_meds.getitemnumber(j_insum,"solicitada") then i_st.dw_meds.setitem(j_insum,"estado","2")
			dw_trae.setitem(j,"asumin",0)
		end if
	end if
next
if dw_trae_varias.rowcount()=0 then return
if tab_1.tp_1.dw_rias.update()=-1 then
	rollback;
	return
end if
if tab_1.tp_2.dw_insumo.update()=-1 then
	rollback;
	return
end if
if i_st.dw_meds.update()=-1 then
	rollback;
	return
end if
if dw_canasta.update()=-1 then
	rollback;
	return
end if
if dw_trae.update()=-1 then
	rollback;
	return
end if

string torden

SELECT Count(oscuerpo.Item) into :j
FROM oscuerpo
WHERE (((oscuerpo.Contador)=:i_st.numero) AND ((oscuerpo.clugar)=:i_st.lugar) 
AND ((oscuerpo.NSolicitud)=:i_norden) AND ((oscuerpo.estado)='1'));
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo oscuerpo",sqlca.sqlerrtext)
	rollback;
	return
end if
SELECT OSCabeza.tipo_orden into :torden
FROM OSCabeza
WHERE OSCabeza.Contador=:i_st.numero AND OSCabeza.clugar=:i_st.lugar AND OSCabeza.NSolicitud=:i_norden;
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo oscabeza",sqlca.sqlerrtext)
	rollback;
	return
end if
if j=0 and torden<>'C' then 
	update oscabeza set estado='2' 
	where contador=:i_st.numero and clugar=:i_st.lugar and nsolicitud=:i_norden;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando estado de orden de servicio",sqlca.sqlerrtext)
		rollback;
		return
	end if
end if
commit;
i_cambio='Y'
tab_1.tp_1.dw_rias.reset()
boolean trajo_costo
for j=1 to dw_trae_varias.rowcount()
	if isnull(dw_trae_varias.getitemnumber(j,"nservicio")) then 
		if not trajo_costo then
			tab_1.tp_1.dw_rias.retrieve(i_st.numero,i_nserv_cos,i_st.lugar)
			trajo_costo=true
		end if
		continue
	end if
	if idw_ufun.rowcount()=0 then idw_ufun.insertrow(1)
	if idw_cc.rowcount()=0 then idw_cc.insertrow(1)
	tab_1.tp_1.dw_rias.retrieve(i_st.numero,dw_trae_varias.getitemnumber(j,"nservicio"),i_st.lugar)
next
tab_1.tp_1.dw_rias.triggerevent(rowfocuschanged!)
dw_trae_varias.reset()

end event

type dw_trae from datawindow within w_estad_ria_os_cos
integer x = 23
integer y = 132
integer width = 3387
integer height = 340
integer taborder = 190
string title = "none"
string dataobject = "dw_ord_serv_pa_rips"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event retrievestart;return 2
end event

event itemchanged;if getcolumnname()="facturar" then
	accepttext()
	return
end if
if isnull(getitemstring(getrow(),"codproced")) then //es medicamento?
	if long(data)+getitemnumber(getrow(),"suministrada")>getitemnumber(getrow(),"entregada") then
		settext('0')
		setitem(getrow(),"asumin",0)
		return 1
	end if
else
	if long(data)+getitemnumber(getrow(),"suministrada")>getitemnumber(getrow(),"solicitada") then
		settext('0')
		setitem(getrow(),"asumin",0)
		return 1
	end if
end if
accepttext()			
end event

event clicked;if row>0 and getrow()<>row then scrolltorow(row)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event rowfocuschanged;if getrow()<1 then return
if getitemstring(getrow(),'compute_3')='Procedim.' and not isnull(getitemnumber(getrow(),"item")) then
	dw_canasta.setfilter('item='+string(getitemnumber(getrow(),"item"))+' and entregada - devuelta > suministrada')
else
	dw_canasta.setfilter('isnull(item)')
end if
dw_canasta.filter()
end event

type dw_empac from datawindow within w_estad_ria_os_cos
boolean visible = false
integer x = 3182
integer y = 440
integer width = 64
integer height = 68
integer taborder = 180
boolean enabled = false
string title = "none"
string dataobject = "dw_emp_pac"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_cont_det from datawindow within w_estad_ria_os_cos
boolean visible = false
integer x = 3072
integer y = 348
integer width = 82
integer height = 72
integer taborder = 150
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_cont_deta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_segrespon from datawindow within w_estad_ria_os_cos
boolean visible = false
integer x = 2962
integer y = 348
integer width = 87
integer height = 52
integer taborder = 160
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_segrespon"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type sle_5 from singlelineedit within w_estad_ria_os_cos
integer x = 2560
integer y = 1076
integer width = 338
integer height = 68
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 15780518
string text = "No obligatorio"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_3 from singlelineedit within w_estad_ria_os_cos
integer x = 2190
integer y = 1076
integer width = 338
integer height = 68
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
string text = "Obligatorio"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_estad_ria_os_cos
integer x = 1714
integer y = 1072
integer width = 283
integer height = 68
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
string text = "Completo"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_estad_ria_os_cos
integer x = 1376
integer y = 1072
integer width = 283
integer height = 68
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 16777215
string text = "Incompleto"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type gb_4 from groupbox within w_estad_ria_os_cos
integer x = 2126
integer y = 1016
integer width = 1225
integer height = 144
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Obligatoriedad de campos"
end type

type gb_3 from groupbox within w_estad_ria_os_cos
integer x = 1353
integer y = 1016
integer width = 677
integer height = 144
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Estado Rips"
end type

type cb_cancel from picturebutton within w_estad_ria_os_cos
event mousemove pbm_mousemove
integer x = 1778
integer y = 2232
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &c"
boolean originalsize = true
string picturename = "puerta.gif"
string disabledname = "d_puerta.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type cb_guarda from picturebutton within w_estad_ria_os_cos
event mousemove pbm_mousemove
integer x = 1632
integer y = 2232
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &g"
boolean default = true
boolean originalsize = true
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
string powertiptext = "Guardar [Alt+G]"
end type

event clicked;tab_1.tp_1.dw_rias.accepttext()
if tab_1.tp_1.dw_rias.update() = 1 then 
	commit;
end if
end event

type rb_anul from radiobutton within w_estad_ria_os_cos
integer x = 599
integer y = 1076
integer width = 302
integer height = 68
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Anulados"
end type

event clicked;tab_1.tp_1.dw_rias.setfilter("estado='Anulado'")
tab_1.tp_1.dw_rias.filter()
end event

type rb_incomp from radiobutton within w_estad_ria_os_cos
integer x = 901
integer y = 1076
integer width = 347
integer height = 68
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Incompletos"
end type

event clicked;tab_1.tp_1.dw_rias.setfilter("estado='Incompleto'")
tab_1.tp_1.dw_rias.filter()
end event

type rb_comp from radiobutton within w_estad_ria_os_cos
integer x = 274
integer y = 1076
integer width = 325
integer height = 68
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Completos"
end type

event clicked;tab_1.tp_1.dw_rias.setfilter("estado='Completo'")
tab_1.tp_1.dw_rias.filter()
end event

type rb_tod from radiobutton within w_estad_ria_os_cos
integer x = 32
integer y = 1076
integer width = 242
integer height = 68
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos"
boolean checked = true
end type

event clicked;tab_1.tp_1.dw_rias.setfilter("")
tab_1.tp_1.dw_rias.filter()
end event

type sle_4 from singlelineedit within w_estad_ria_os_cos
integer x = 2930
integer y = 1076
integer width = 338
integer height = 68
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 12632256
string text = "No Requerido"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_estad_ria_os_cos
integer x = 23
integer y = 1016
integer width = 1266
integer height = 144
integer taborder = 20
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Estado Rips"
end type

type dw_inf from datawindow within w_estad_ria_os_cos
integer x = 9
integer width = 3442
integer height = 132
string title = "none"
string dataobject = "dw_inf_emp_cama"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
end event

event retrieveend;do while this.rowcount()> 1
	this.deleterow(2)
loop
end event

type tab_1 from tab within w_estad_ria_os_cos
event create ( )
event destroy ( )
integer x = 14
integer y = 1248
integer width = 3433
integer height = 1128
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
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3397
integer height = 1000
long backcolor = 67108864
string text = "Procedimientos"
long tabtextcolor = 33554432
string picturename = "control.ico"
long picturemaskcolor = 536870912
cb_del cb_del
st_desproc st_desproc
dw_rias dw_rias
st_1 st_1
cbx_replica cbx_replica
st_2 st_2
end type

on tp_1.create
this.cb_del=create cb_del
this.st_desproc=create st_desproc
this.dw_rias=create dw_rias
this.st_1=create st_1
this.cbx_replica=create cbx_replica
this.st_2=create st_2
this.Control[]={this.cb_del,&
this.st_desproc,&
this.dw_rias,&
this.st_1,&
this.cbx_replica,&
this.st_2}
end on

on tp_1.destroy
destroy(this.cb_del)
destroy(this.st_desproc)
destroy(this.dw_rias)
destroy(this.st_1)
destroy(this.cbx_replica)
destroy(this.st_2)
end on

type cb_del from picturebutton within tp_1
event mousemove pbm_mousemove
integer x = 1449
integer y = 872
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            "
boolean originalsize = true
string picturename = "bisturi x.GIF"
string disabledname = "d_bisturi x.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Procedimiento"
end type

event clicked;long fila,donde,nservic,nulo
fila=tab_1.tp_1.dw_rias.getrow()
if fila<1 then return
if not isnull(tab_1.tp_1.dw_rias.getitemnumber(fila,"nfactura")) then
	messagebox("Atención","Este procedimiento ya se encuentra facturado, no lo puede borrar")
	return
end if
string snulo
if i_st.tipo_orden='B' then
	Messagebox("Atención","No se puede borrar procedimientos ya que son de un banco de fluidos")
	return
end if
if i_est_hadm<>"1" then
	Messagebox("Atención","No se puede borrar procedimientos ya que la admisión no está activa")
	return
end if
if tab_1.tp_1.dw_rias.getitemstring(fila,"tipo_servicio")='C' then
	messagebox("Atención","Este procedimiento es de costos, no lo puede borrar")
	return
end if
nservic=tab_1.tp_1.dw_rias.getitemnumber(fila,"nservicio")
string codigo,estado
setnull(nulo)
setnull(snulo)
donde=dw_trae.find('contador='+string(i_st.numero)+' and clugar="'+i_st.lugar+'" and nsolicitud='+string(i_norden)+' and item='+string(tab_1.tp_1.dw_rias.getitemnumber(fila,"item_orden")),1,dw_trae.rowcount())
if donde=0 then 
	messagebox("No se puede encontrar este procedimiento","Es posible que sea un procedimiento atendido en apoyo diagnóstico y no se puede borrar desde aqui")
	return
end if
dw_trae.setitem(donde,"suministrada",dw_trae.getitemnumber(donde,"suministrada") -tab_1.tp_1.dw_rias.getitemnumber(fila,"s_cantidad"))
if dw_trae.getitemnumber(donde,"suministrada") < dw_trae.getitemnumber(donde,"solicitada")then dw_trae.setitem(donde,"estado","1")
long j
select count(item) into :j from oscuerpo where contador=:i_st.numero and clugar=:i_st.lugar and nsolicitud=:i_norden and estado='1';
if j=0 then
	estado='2'
else
	estado='1'
end if
update oscabeza set estado='1' where contador=:i_st.numero and clugar=:i_st.lugar and nsolicitud=:i_norden;
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando estado de orden de servicio (oscab)",sqlca.sqlerrtext)
	rollback;
	return
end if
delete from qxcpacto where contador=:i_st.numero and  clugar_ser=:i_st.lugar and nservicio=:nservic;
if sqlca.sqlcode=-1 then
	messagebox("Error borrando de QxCpActo",sqlca.sqlerrtext)
	rollback;
	return
end if
tab_1.tp_1.dw_rias.deleterow(fila)
i_st.dw_meds.setfilter('')
i_st.dw_meds.filter()
do while tab_1.tp_2.dw_insumo.rowcount()>0
	donde=i_st.dw_meds.find("item="+string(tab_1.tp_2.dw_insumo.getitemnumber(1,'item_os'))+" and secuencia="+string(tab_1.tp_2.dw_insumo.getitemnumber(1,'secuencia_os')),1,i_st.dw_meds.rowcount())
	i_st.dw_meds.setitem(donde,"suministrada",i_st.dw_meds.getitemnumber(donde,"suministrada") -tab_1.tp_2.dw_insumo.getitemnumber(1,'cantidad'))
	if i_st.dw_meds.getitemnumber(donde,'suministrada')=0 then
		i_st.dw_meds.setitem(donde,'estado','1')
	end if
	tab_1.tp_2.dw_insumo.deleterow(1)
loop
if tab_1.tp_2.dw_insumo.update()=-1 then return
if tab_1.tp_1.dw_rias.update()=-1 then return
if dw_trae.update()=-1 then return
if i_st.dw_meds.update()=-1 then return
commit;
i_cambio='Y'

end event

type st_desproc from statictext within tp_1
integer x = 5
integer y = 796
integer width = 3383
integer height = 68
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

type dw_rias from datawindow within tp_1
integer x = 5
integer y = 108
integer width = 3383
integer height = 684
integer taborder = 200
string dragicon = "none!"
string dataobject = "dw_rips_os"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;string colu,carreta,resu,cual,temp
colu= dwo.name
cual="r_" + mid(colu,3)
if right(cual,1)='_' then cual=left(cual,len(cual)-1)
if describe(cual+".id")="!" then return
carreta="evaluate ('if ("+ cual +'="0", 1, 0 )'+"'," +string(row) +")"
resu=describe(carreta)
if resu="1" then return
if colu="s_diagprin_" or colu="s_diagrel1_" or colu="s_diagrel2_" or colu="s_diagrel3_" or colu="s_diagcompli_" then
	st_edadsexo st_es
	st_diag st_d
	st_es.sexo=w_principal.dw_1.getitemstring(1,"sexo")
	st_es.edad=w_principal.dw_1.getitemnumber(1,"dias")
	st_es.antece='0'	
	if getitemstring(getrow(),'rips')='1' then
		st_es.proced='0'
	else
		st_es.proced='1'
	end if	
	openwithparm(w_busca_diag,st_es)
	st_d=message.powerobjectparm
	if not isValid(st_d) then return
	if not isNull(st_d.codrip) then
		setitem(row,colu,st_d.codrip)
		setitem(row,left(colu,len(colu)-1),st_d.codgeral)
		st_1.text=st_d.descripcion
	end if
end if
if colu="s_codespecialidad" then
	retorna_busqueda=""
	open (w_busca_espe)
	if retorna_busqueda<>"" then
		dw_rias.setitem(dw_rias.getrow(),"s_codespecialidad",retorna_busqueda)
		st_1.text=retorna_des_busqueda
	end if
end if




end event

event itemchanged;accepttext()
string cod,col,este='',nulo
st_return_diags st

setnull(nulo)
long colum,i
colum=getcolumn()
col=getcolumnname()
if colum=13 then
	select desesp into :st_1.text from especialidades where codesp= :data;
	if st_1.text="" then return 1
end if
choose case colum
	case 58 //desufuncional
		accepttext()
		setitem(row,56,idw_ufun.getitemstring(idw_ufun.getrow(),"coduf"))
		setitem(row,57,"")
		setitem(row,59,"")
		idw_cc.retrieve(getitemstring(row,"cproced"),i_st.tingres,idw_ufun.getitemstring(idw_ufun.getrow(),"coduf"))
	case 59 //descripcion :cc
		accepttext()
		setitem(row,57,idw_cc.getitemstring(idw_cc.getrow(),"codcc"))
	case 13, 15, 17, 33, 35, 37
		if cbx_replica.checked then
			for i=1 to rowcount()
				if i<>row and not isnull(getitemstring(i,"r_"+mid(dwo.name,3))) then 
					if isnull(getitemstring(i,string(dwo.name))) then setitem(i,dwo.name,data)
				end if
			next
		end if
end choose
if col='s_diagprin_' or col='s_diagrel1_' or col='s_diagrel2_' or col='s_diagrel3_' or col='s_diagcompli' then
	if data<>"" then
		st=f_check_diag(data,w_principal.dw_1.getitemstring(1,"sexo"),w_principal.dw_1.getitemnumber(1,"dias"),este,'0',this.getitemstring(row,'rips'),'0')
		if st.descrip_diag="" then
			setitem(row,colum,"")
			setitem(row,left(col,len(col)-1),nulo)
			return 1
		end if
		st_1.text=st.descrip_diag
		setitem(row,left(col,len(col)-1),este)
	else
		st_1.text=''
		setitem(row,left(col,len(col)-1),nulo)
	end if
end if
if col='desesp' then
	setitem(row,'s_codespecialidad',idw_espe.getitemstring(idw_espe.getrow(),'cesp'))
end if
if col='cprof' then
	setitem(row,'s_codespecialidad',nulo)
	setitem(row,'desesp',nulo)
	if idw_espe.retrieve(data)=1 then
		setitem(row,'s_codespecialidad',idw_espe.getitemstring(1,'cesp'))
		setitem(row,'desesp',idw_espe.getitemstring(1,'desesp'))
	end if
end if
end event

event itemfocuschanged;accepttext()
string cod,ojo,col
long colum
st_return_diags st

colum=getcolumn()
col=getcolumnname()
choose case colum
	case 13
		ojo=getitemstring(row,colum)
		if ojo<>"" then
			select desesp into :st_1.text from especialidades where codesp= :ojo;
		end if
end choose
if col='s_diagprin_' or col='s_diagrel1_' or col='s_diagrel2_' or col='s_diagrel3_' or col='s_diagcompli' then
	if getitemstring(row,colum)<>"" then
		string este
		este=getitemstring(row,left(col,len(col)-1))
		st=f_check_diag(getitemstring(row,colum),w_principal.dw_1.getitemstring(1,"sexo"),w_principal.dw_1.getitemnumber(1,"dias"),este,'0',this.getitemstring(row,'rips'),'0')
		if st.descrip_diag="" then
			setitem(row,colum,"")
			return 1
		end if
		st_1.text=st.descrip_diag
	else
		st_1.text=""
	end if
end if
end event

event retrieveend;if this.update() = 1 then 
	commit;
end if

end event

event retrievestart;sexo_paci=w_principal.dw_1.getitemstring(1,"sexo")
return 2
end event

event rowfocuschanged;long fila
string este
fila=getrow()
tab_1.tp_2.pb_del_insumo.enabled=false
if fila<1 then return
if tab_1.tp_1.dw_rias.getitemstring(fila,"tipo_servicio")='C' then tab_1.tp_2.pb_del_insumo.enabled=true
idw_ufun.retrieve(getitemstring(fila,"cproced"),i_st.tingres)
idw_cc.reset()
if getitemstring(fila,"desufuncional")<>"" then
	idw_cc.retrieve(getitemstring(fila,"cproced"),i_st.tingres,getitemstring(fila,56))
end if
idw_espe.retrieve(getitemstring(fila,'cprof'))
if not isnull(getitemstring(fila,"cproced")) and getitemstring(fila,"cproced")<>'' then
	este=getitemstring(fila,"cproced")
	select descripcion into :st_desproc.text from proced where codproced=:este;
else
	este=getitemstring(fila,"c_medica")
	select medicamento into :st_desproc.text from medicamentos where c_medica=:este;
end if
if isnull(getitemnumber(getrow(),'nservicio')) then
	tab_1.tp_2.dw_insumo.setfilter("isnull(nservicio)")
else
	tab_1.tp_2.dw_insumo.setfilter("nservicio="+string(getitemnumber(getrow(),'nservicio')))
end if
tab_1.tp_2.dw_insumo.filter()
end event

event updatestart;long i , filas
string nv_est,estr
filas=rowcount()
for i=1 to filas
	nv_est=getitemstring(i,'estado')
	if nv_est<>"Anulado" then 
		choose case nv_est
			case "Completo"
				estr="1"
			case "Incompleto"
				estr="2"
		end choose
		setitem(i,"estria",estr)
	end if
next
end event

event constructor;settransobject(sqlca)
getchild('s_fin_consulta',idw_fincon)
idw_fincon.settransobject(sqlca)
getchild('s_finalidadproced',idw_finproc)
idw_finproc.settransobject(SQLCA)
getchild('s_causaexterna',idw_causaex)
idw_causaex.settransobject(sqlca)
getchild('s_ambitoproced',idw_ambproc)
idw_ambproc.settransobject(sqlca)

idw_fincon.retrieve('1')
idw_finproc.retrieve('1')
idw_causaex.retrieve('1')
idw_ambproc.retrieve('1')
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event clicked;if row>0 and row<>getrow() then setrow(row)
end event

type st_1 from statictext within tp_1
integer x = 553
integer y = 16
integer width = 2830
integer height = 76
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_replica from checkbox within tp_1
integer x = 9
integer width = 73
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
boolean checked = true
end type

type st_2 from statictext within tp_1
integer x = 91
integer y = 4
integer width = 448
integer height = 104
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "Replicar cambios en todas las filas"
boolean focusrectangle = false
end type

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3397
integer height = 1000
long backcolor = 67108864
string text = "Insumos"
long tabtextcolor = 33554432
string picturename = "entrega_med.ico"
long picturemaskcolor = 536870912
pb_del_insumo pb_del_insumo
dw_insumo dw_insumo
end type

on tp_2.create
this.pb_del_insumo=create pb_del_insumo
this.dw_insumo=create dw_insumo
this.Control[]={this.pb_del_insumo,&
this.dw_insumo}
end on

on tp_2.destroy
destroy(this.pb_del_insumo)
destroy(this.dw_insumo)
end on

type pb_del_insumo from picturebutton within tp_2
integer x = 1445
integer y = 876
integer width = 142
integer height = 124
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "jeringa x.gif"
string disabledname = "d_jeringa x.gif"
string powertiptext = "Borrar insumo"
end type

event clicked;if dw_insumo.rowcount()=0 then return
long donde
i_st.dw_meds.setfilter('')
i_st.dw_meds.filter()
donde=i_st.dw_meds.find("item="+string(dw_insumo.getitemnumber(dw_insumo.getrow(),'item_os'))+" and secuencia="+string(dw_insumo.getitemnumber(dw_insumo.getrow(),'secuencia_os')),1,i_st.dw_meds.rowcount())
i_st.dw_meds.setitem(donde,"suministrada",i_st.dw_meds.getitemnumber(donde,"suministrada") -dw_insumo.getitemnumber(dw_insumo.getrow(),'cantidad'))
donde=dw_trae.find("item="+string(dw_insumo.getitemnumber(dw_insumo.getrow(),'item_os'))+" and secuencia="+string(dw_insumo.getitemnumber(dw_insumo.getrow(),'secuencia_os')),1,dw_trae.rowcount())
if donde>0 then
	long item,secu
	dw_trae.setitem(donde,"suministrada",dw_trae.getitemnumber(donde,"suministrada") -dw_insumo.getitemnumber(dw_insumo.getrow(),"cantidad"))
	if dw_trae.getitemnumber(donde,"suministrada") < dw_trae.getitemnumber(donde,"solicitada")then 
		item=dw_trae.getitemnumber(donde,"item")
		secu=dw_trae.getitemnumber(donde,"secuencia")
		update oscuerpo_kit set estado='1' where contador=:i_st.numero and clugar=:i_st.lugar
		and nsolicitud=:i_norden and item=:item and secuencia=:secu;
		if sqlca.sqlcode=-1 then
			messagebox('Error actualizando oscuerpo_kit.estado',sqlca.sqlerrtext)
			rollback;
			return
		end if
	end if
end if
dw_insumo.deleterow(0)
if dw_insumo.update()=-1 then return
if i_st.dw_meds.update()=-1 then return
commit;
i_cambio='Y'


end event

type dw_insumo from datawindow within tp_2
integer x = 14
integer y = 40
integer width = 3351
integer height = 824
integer taborder = 10
string title = "none"
string dataobject = "dw_insum_hosp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event constructor;settransobject(sqlca)
end event

