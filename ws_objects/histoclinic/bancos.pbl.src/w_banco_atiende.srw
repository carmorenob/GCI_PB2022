$PBExportHeader$w_banco_atiende.srw
forward
global type w_banco_atiende from window
end type
type tab_1 from tab within w_banco_atiende
end type
type tp_1 from userobject within tab_1
end type
type cb_registra from picturebutton within tp_1
end type
type dw_reser from datawindow within tp_1
end type
type tp_1 from userobject within tab_1
cb_registra cb_registra
dw_reser dw_reser
end type
type tp_2 from userobject within tab_1
end type
type st_desproc from statictext within tp_2
end type
type cb_guarda from picturebutton within tp_2
end type
type cb_del from picturebutton within tp_2
end type
type sle_4 from singlelineedit within tp_2
end type
type sle_5 from singlelineedit within tp_2
end type
type sle_3 from singlelineedit within tp_2
end type
type sle_2 from singlelineedit within tp_2
end type
type sle_1 from singlelineedit within tp_2
end type
type rb_incomp from radiobutton within tp_2
end type
type rb_anul from radiobutton within tp_2
end type
type rb_tod from radiobutton within tp_2
end type
type rb_comp from radiobutton within tp_2
end type
type dw_rias from datawindow within tp_2
end type
type st_desdiag from statictext within tp_2
end type
type st_cdiaging from statictext within tp_2
end type
type st_3 from statictext within tp_2
end type
type st_1 from statictext within tp_2
end type
type cbx_replica from checkbox within tp_2
end type
type st_2 from statictext within tp_2
end type
type gb_1 from groupbox within tp_2
end type
type gb_3 from groupbox within tp_2
end type
type gb_4 from groupbox within tp_2
end type
type tp_2 from userobject within tab_1
st_desproc st_desproc
cb_guarda cb_guarda
cb_del cb_del
sle_4 sle_4
sle_5 sle_5
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
rb_incomp rb_incomp
rb_anul rb_anul
rb_tod rb_tod
rb_comp rb_comp
dw_rias dw_rias
st_desdiag st_desdiag
st_cdiaging st_cdiaging
st_3 st_3
st_1 st_1
cbx_replica cbx_replica
st_2 st_2
gb_1 gb_1
gb_3 gb_3
gb_4 gb_4
end type
type tab_1 from tab within w_banco_atiende
tp_1 tp_1
tp_2 tp_2
end type
type dw_inf from datawindow within w_banco_atiende
end type
type dw_trae from datawindow within w_banco_atiende
end type
type cb_cancel from picturebutton within w_banco_atiende
end type
type dw_segrespon from datawindow within w_banco_atiende
end type
type dw_cont_det from datawindow within w_banco_atiende
end type
type dw_trae_varias from datawindow within w_banco_atiende
end type
type dw_empac from datawindow within w_banco_atiende
end type
end forward

global type w_banco_atiende from window
integer width = 4498
integer height = 1996
boolean titlebar = true
string title = "Atender Procedimientos / Estado de Rips"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "rips.ico"
string pointer = "Arrow!"
boolean clientedge = true
boolean center = true
tab_1 tab_1
dw_inf dw_inf
dw_trae dw_trae
cb_cancel cb_cancel
dw_segrespon dw_segrespon
dw_cont_det dw_cont_det
dw_trae_varias dw_trae_varias
dw_empac dw_empac
end type
global w_banco_atiende w_banco_atiende

type variables
string sexo_paci,i_ccalm,i_ufalm,i_est_hadm,i_clug_hadm,i_cemp,i_ccont,i_nautoriza
long i_nh,i_norden
datawindowchild idw_ufun,idw_cc,idw_espe
trae i_st
string i_cambio='n',i_cdiaging,i_causaext
DataWindowChild idw_fincon,idw_finproc,idw_causaex,idw_ambproc
end variables
on w_banco_atiende.create
this.tab_1=create tab_1
this.dw_inf=create dw_inf
this.dw_trae=create dw_trae
this.cb_cancel=create cb_cancel
this.dw_segrespon=create dw_segrespon
this.dw_cont_det=create dw_cont_det
this.dw_trae_varias=create dw_trae_varias
this.dw_empac=create dw_empac
this.Control[]={this.tab_1,&
this.dw_inf,&
this.dw_trae,&
this.cb_cancel,&
this.dw_segrespon,&
this.dw_cont_det,&
this.dw_trae_varias,&
this.dw_empac}
end on

on w_banco_atiende.destroy
destroy(this.tab_1)
destroy(this.dw_inf)
destroy(this.dw_trae)
destroy(this.cb_cancel)
destroy(this.dw_segrespon)
destroy(this.dw_cont_det)
destroy(this.dw_trae_varias)
destroy(this.dw_empac)
end on

event open;i_st=message.powerobjectparm
long j,k
select nh,clugar,estado,cemp,ccontrato,autoriza,causaexterna,diagingre
into :i_nh ,:i_clug_hadm,:i_est_hadm,:i_cemp,:i_ccont,:i_nautoriza,:i_causaext,:i_cdiaging
from hospadmi where contador=:i_st.numero and clugar_his=:i_st.lugar;
dw_inf.retrieve(i_nh,i_clug_hadm,i_st.tingres)
if i_cdiaging<>'' then
	select cod_rips , desdiag into :tab_1.tp_2.st_cdiaging.text,:tab_1.tp_2.st_desdiag.text from diags where codgeral=:i_cdiaging;
end if
if i_st.dw_procs.rowcount()>0 then
	i_norden=i_st.dw_procs.getitemnumber(1,'nsolicitud')
else
	i_norden=i_st.dw_meds.getitemnumber(1,'nsolicitud')
end if
tab_1.tp_1.dw_reser.retrieve(i_st.numero,i_st.lugar,i_norden)
if tab_1.tp_1.dw_reser.rowcount()=0 then
	messagebox('Atención','No hay reserva entregada con esta orden')
	w_banco_atiende.event close()
	return
end if
if i_st.otro="carga" then
	tab_1.tp_2.dw_rias.getchild('desufuncional',idw_ufun)
	tab_1.tp_2.dw_rias.getchild('descripcion',idw_cc)
	idw_ufun.settransobject(sqlca)
	idw_cc.settransobject(sqlca)
	tab_1.tp_2.dw_rias.settransobject(SQLCA)
	for j=1 to i_st.dw_procs.rowcount()
		if i_st.dw_procs.getitemstring(j,"escog")="1" then
			k=dw_trae.insertrow(0)
			dw_trae.setitem(k,'contador',i_st.dw_procs.getitemnumber(j,'contador'))
			dw_trae.setitem(k,'clugar',i_st.dw_procs.getitemstring(j,'clugar'))
			dw_trae.setitem(k,'nsolicitud',i_st.dw_procs.getitemnumber(j,'nsolicitud'))
			dw_trae.setitem(k,'item',i_st.dw_procs.getitemnumber(j,'item'))
			dw_trae.setitem(k,'codproced',i_st.dw_procs.getitemstring(j,'codproced'))
			dw_trae.setitem(k,'solicitada',i_st.dw_procs.getitemnumber(j,'solicitada'))
			dw_trae.setitem(k,'entregada',i_st.dw_procs.getitemnumber(j,'entregada'))
			dw_trae.setitem(k,'suministrada',i_st.dw_procs.getitemnumber(j,'suministrada'))
			dw_trae.setitem(k,'rip_proc',i_st.dw_procs.getitemstring(j,'rips'))
			dw_trae.setitem(k,'estado',i_st.dw_procs.getitemstring(j,'estado'))
			dw_trae.setitem(k,'facturar',i_st.dw_procs.getitemnumber(j,'facturar'))
			dw_trae.setitem(k,'descripcion',i_st.dw_procs.getitemstring(j,'descripcion'))
			dw_trae.setitem(k,"asumin",0)
		end if
	next
	dw_trae.resetupdate()
	dw_trae.event rowfocuschanged(dw_trae.getrow())
else//revisa
	tab_1.tp_1.cb_registra.enabled=false
	tab_1.tp_2.dw_rias.dataobject="dw_rips_os_todos"
	tab_1.tp_2.dw_rias.getchild('desufuncional',idw_ufun)
	tab_1.tp_2.dw_rias.getchild('descripcion',idw_cc)
	idw_ufun.settransobject(sqlca)
	idw_ufun.insertrow(1)
	idw_cc.settransobject(sqlca)
	idw_cc.insertrow(1)
	tab_1.tp_2.dw_rias.settransobject(sqlca)
	if i_st.dw_procs.rowcount()=0 then
		dw_trae.retrieve(i_st.numero,i_st.lugar,i_st.dw_meds.getitemnumber(1,'nsolicitud'))
		tab_1.tp_2.dw_rias.retrieve(i_st.numero,i_st.lugar,i_st.dw_meds.getitemnumber(1,'nsolicitud'))
	else
		dw_trae.retrieve(i_st.numero,i_st.lugar,i_st.dw_procs.getitemnumber(1,'nsolicitud'))
		tab_1.tp_2.dw_rias.retrieve(i_st.numero,i_st.lugar,i_st.dw_procs.getitemnumber(1,'nsolicitud'))
	end if
end if
string temp
setnull(i_ccalm)
i_ufalm=i_ccalm
tab_1.tp_2.dw_rias.getchild('desesp',idw_espe)
idw_espe.settransobject(sqlca)

tab_1.tp_2.dw_rias.getchild('s_fin_consulta',idw_fincon)
idw_fincon.settransobject(sqlca)
tab_1.tp_2.dw_rias.getchild('s_finalidadproced',idw_finproc)
idw_finproc.settransobject(SQLCA)
tab_1.tp_2.dw_rias.getchild('s_causaexterna',idw_causaex)
idw_causaex.settransobject(sqlca)
tab_1.tp_2.dw_rias.getchild('s_ambitoproced',idw_ambproc)
idw_ambproc.settransobject(sqlca)

idw_fincon.retrieve('1')
idw_finproc.retrieve('1')
idw_causaex.retrieve('1')
idw_ambproc.retrieve('1')

if tab_1.tp_2.dw_rias.rowcount()>0 then idw_espe.retrieve(tab_1.tp_2.dw_rias.getitemstring(1,'cprof'))
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
end event

event close;closewithreturn(this,i_cambio)
end event

type tab_1 from tab within w_banco_atiende
event create ( )
event destroy ( )
integer y = 592
integer width = 4421
integer height = 1280
integer taborder = 150
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
integer width = 4384
integer height = 1152
long backcolor = 67108864
string text = "Reservas"
long tabtextcolor = 33554432
string picturename = "reserva.ico"
long picturemaskcolor = 536870912
string powertiptext = "Reservas hechas a la solicitud"
cb_registra cb_registra
dw_reser dw_reser
end type

on tp_1.create
this.cb_registra=create cb_registra
this.dw_reser=create dw_reser
this.Control[]={this.cb_registra,&
this.dw_reser}
end on

on tp_1.destroy
destroy(this.cb_registra)
destroy(this.dw_reser)
end on

type cb_registra from picturebutton within tp_1
event mousemove pbm_mousemove
integer x = 2373
integer y = 1020
integer width = 142
integer height = 124
integer taborder = 150
boolean bringtotop = true
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

event clicked;string ambito,finali,coduf,codcc,crips,uf,cc,cemp,ccont,err
long j,donde,nserv,k,l,z,tt,busca
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
nserv ++
setnull(codcc)
setnull(coduf)
//if w_atiende_os.tipo_ingres='3' then
SELECT Camas.CUfuncional, Camas.CCcosto into :coduf,:codcc
FROM Camas 
WHERE ningreso=:i_nh AND clugar_ing=:i_clug_hadm;
for j=1 to dw_trae.rowcount()
	if dw_trae.getitemnumber(j,"asumin")>0 then
		codproc=dw_trae.getitemstring(j,"codproced")
		long cant=1
		if not isnull(codproc) then
			crips=dw_trae.getitemstring(j,"rip_proc")
			setnull(plan)
			long hasta,cantidad
			if crips='6' or crips='7' then
				hasta=1
				cantidad=dw_trae.getitemnumber(j,"asumin")
			else
				cantidad=1
				hasta=dw_trae.getitemnumber(j,"asumin")
			end if
			for k=1 to hasta
				donde=dw_trae_varias.insertrow(0)
				dw_trae_varias.setitem(donde,"nservicio",nserv)
				if idw_ufun.rowcount()=0 then idw_ufun.insertrow(1)
				if idw_cc.rowcount()=0 then idw_cc.insertrow(1)
				donde=tab_1.tp_2.dw_rias.insertrow(0)
				tab_1.tp_2.dw_rias.setitem(donde,"cproced",codproc)
				tab_1.tp_2.dw_rias.setitem(donde,"usuario",usuario)
				select tipoproc into :finali from proced where codproced=:codproc;
				if isnull(finali) then finali='10'
				tab_1.tp_2.dw_rias.setitem(donde,"rips_descripcion",crips)
				tab_1.tp_2.dw_rias.setitem(donde,"rips",crips)
				tab_1.tp_2.dw_rias.setitem(donde,"facturar",dw_trae.getitemnumber(j,"facturar"))
				tab_1.tp_2.dw_rias.setitem(donde,"nautoriza",i_nautoriza)
				
				tab_1.tp_2.dw_rias.setitem(donde,"s_fecha",datetime(today(),time(string(now()))))
				tab_1.tp_2.dw_rias.setitem(donde,"s_cantidad",cantidad)
				tab_1.tp_2.dw_rias.setitem(donde,"contador",i_st.numero)
				tab_1.tp_2.dw_rias.setitem(donde,"cemp",cemp)
				tab_1.tp_2.dw_rias.setitem(donde,"cplan",plan)
				tab_1.tp_2.dw_rias.setitem(donde,"ccontrato",ccont)
				tab_1.tp_2.dw_rias.setitem(donde,"clugar",i_st.lugar)
				tab_1.tp_2.dw_rias.setitem(donde,"nservicio",nserv)
				tab_1.tp_2.dw_rias.setitem(donde,'clugar_dona',tab_1.tp_1.dw_reser.getitemstring(k,'clugar'))
				tab_1.tp_2.dw_rias.setitem(donde,'nro_donacion',tab_1.tp_1.dw_reser.getitemnumber(k,'nro_donacion'))
				tab_1.tp_2.dw_rias.setitem(donde,'nro_bolsa',tab_1.tp_1.dw_reser.getitemnumber(k,'nro_bolsa'))
				choose case crips
					case '1'
						tab_1.tp_2.dw_rias.setitem(donde,"s_causaexterna",i_causaext)
						tab_1.tp_2.dw_rias.setitem(donde,"s_diagprin_",tab_1.tp_2.st_cdiaging.text)
						tab_1.tp_2.dw_rias.setitem(donde,"s_diagprin",i_cdiaging)
					case '2'
						tab_1.tp_2.dw_rias.setitem(donde,"s_diagprin_",tab_1.tp_2.st_cdiaging.text)
						tab_1.tp_2.dw_rias.setitem(donde,"s_diagprin",i_cdiaging)
						tab_1.tp_2.dw_rias.setitem(donde,"s_finalidadproced",finali)
					case '8'
						tab_1.tp_2.dw_rias.setitem(donde,"s_causaexterna",i_causaext)	
						tab_1.tp_2.dw_rias.setitem(donde,"s_diagprin_",tab_1.tp_2.st_cdiaging.text)
						tab_1.tp_2.dw_rias.setitem(donde,"s_diagprin",i_cdiaging)
					case '9'
						tab_1.tp_2.dw_rias.setitem(donde,"s_finalidadproced",finali)
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
				tab_1.tp_2.dw_rias.setitem(donde,"cufuncional",uf)
				tab_1.tp_2.dw_rias.setitem(donde,"cccosto",cc)
				
				tab_1.tp_2.dw_rias.setitem(donde,"tipo_orden",'H')
				choose case i_st.tingres
					case '2' 
						ambito='3'
					case '1'
						ambito='1'
					case '3','4','7'
						ambito='2'
				end choose
				tab_1.tp_2.dw_rias.setitem(donde,"s_ambitoproced",ambito)
				tab_1.tp_2.dw_rias.setitem(donde,"cprof",i_st.profe)
				if idw_espe.retrieve(i_st.profe)=1 then
					tab_1.tp_2.dw_rias.setitem(donde,"s_codespecialidad",idw_espe.getitemstring(1,'cesp'))
				end if
				tab_1.tp_2.dw_rias.setitem(donde,"conta_orden",i_st.numero)
				tab_1.tp_2.dw_rias.setitem(donde,"clug_orden",i_st.lugar)
				tab_1.tp_2.dw_rias.setitem(donde,"norden_serv",i_norden)
				tab_1.tp_2.dw_rias.setitem(donde,"item_orden",dw_trae.getitemnumber(j,"item"))
				nserv ++
			next
			tt=dw_trae.getitemnumber(j,"suministrada")
			dw_trae.setitem(j,"suministrada",dw_trae.getitemnumber(j,"asumin")+tt)
			if dw_trae.getitemnumber(j,"suministrada") >= dw_trae.getitemnumber(j,"solicitada")then 
				dw_trae.setitem(j,"estado","2")
			end if
			dw_trae.setitem(j,"asumin",0)
		
		end if
	end if
next
if dw_trae_varias.rowcount()=0 then return
tab_1.tp_1.dw_reser.setfilter('')
tab_1.tp_1.dw_reser.filter()
string clug_bolsa
long ndona,nbolsa
for j=1 to tab_1.tp_1.dw_reser.rowcount()
	if tab_1.tp_1.dw_reser.getitemnumber(j,'esco')=0 then continue
	tab_1.tp_1.dw_reser.setitem(j,'esco',0)
	tab_1.tp_1.dw_reser.setitem(j,'estado_reserva','U')
	clug_bolsa=tab_1.tp_1.dw_reser.getitemstring(j,'clugar')
	ndona=tab_1.tp_1.dw_reser.getitemnumber(j,'nro_donacion')
	nbolsa=tab_1.tp_1.dw_reser.getitemnumber(j,'nro_bolsa')
	update banco_bolsa set estado='U' where clugar=:clug_bolsa and nro_donacion=:ndona and
	nro_bolsa=:nbolsa and estado in ('D','R');
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error actualizando banco_bolsa',err)
	end if
	if sqlca.sqlnrows=0 then
		rollback;
		messagebox('Atención','Es posible que una de las bolsas ya se haya utilizado en otro paciente')
		return
	end if
next
if tab_1.tp_1.dw_reser.update(true,false)=-1 then
	rollback;
	return
end if

if tab_1.tp_2.dw_rias.update()=-1 then
	rollback;
	return
end if
if dw_trae.update()=-1 then
	rollback;
	return
end if
select count(item) into :j from oscuerpo
where contador=:i_st.numero and clugar=:i_st.lugar and nsolicitud=:i_norden and estado='1';
if j=0 then 
	update oscabeza set estado='2' 
	where contador=:i_st.numero and clugar=:i_st.lugar and nsolicitud=:i_norden;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando estado de orden de servicio",sqlca.sqlerrtext)
		rollback;
		return
	end if
end if
commit;
tab_1.tp_1.dw_reser.resetupdate()
i_cambio='Y'
tab_1.tp_2.dw_rias.reset()
for j=1 to dw_trae_varias.rowcount()
	if idw_ufun.rowcount()=0 then idw_ufun.insertrow(1)
	if idw_cc.rowcount()=0 then idw_cc.insertrow(1)
	tab_1.tp_2.dw_rias.retrieve(i_st.numero,dw_trae_varias.getitemnumber(j,"nservicio"),i_st.lugar)
next
tab_1.tp_2.dw_rias.triggerevent(rowfocuschanged!)
dw_trae_varias.reset()
dw_trae.event rowfocuschanged(dw_trae.getrow())
tab_1.selectedtab=2
end event

type dw_reser from datawindow within tp_1
integer y = 32
integer width = 4343
integer height = 968
integer taborder = 10
string title = "none"
string dataobject = "dw_reservas_x_norden"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;long nulo
setnull(nulo)
choose case dwo.name
	case 'esco'
		if data='1' then
			dw_trae.setitem(dw_trae.getrow(),'asumin',dw_trae.getitemnumber(dw_trae.getrow(),'asumin')+1)
			setitem(getrow(),'cantidad',getitemnumber(getrow(),'capacidad'))
			setitem(getrow(),'hora_inicio',datetime(today(),now()))
			setitem(getrow(),'hora_fin',datetime(today(),now()))
		else
			setitem(getrow(),'cantidad',nulo)
			dw_trae.setitem(dw_trae.getrow(),'asumin',dw_trae.getitemnumber(dw_trae.getrow(),'asumin')-1)
		end if
end choose
end event

type tp_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4384
integer height = 1152
long backcolor = 67108864
string text = "RIPS"
long tabtextcolor = 33554432
string picturename = "rips.ico"
long picturemaskcolor = 536870912
st_desproc st_desproc
cb_guarda cb_guarda
cb_del cb_del
sle_4 sle_4
sle_5 sle_5
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
rb_incomp rb_incomp
rb_anul rb_anul
rb_tod rb_tod
rb_comp rb_comp
dw_rias dw_rias
st_desdiag st_desdiag
st_cdiaging st_cdiaging
st_3 st_3
st_1 st_1
cbx_replica cbx_replica
st_2 st_2
gb_1 gb_1
gb_3 gb_3
gb_4 gb_4
end type

on tp_2.create
this.st_desproc=create st_desproc
this.cb_guarda=create cb_guarda
this.cb_del=create cb_del
this.sle_4=create sle_4
this.sle_5=create sle_5
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.rb_incomp=create rb_incomp
this.rb_anul=create rb_anul
this.rb_tod=create rb_tod
this.rb_comp=create rb_comp
this.dw_rias=create dw_rias
this.st_desdiag=create st_desdiag
this.st_cdiaging=create st_cdiaging
this.st_3=create st_3
this.st_1=create st_1
this.cbx_replica=create cbx_replica
this.st_2=create st_2
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_4=create gb_4
this.Control[]={this.st_desproc,&
this.cb_guarda,&
this.cb_del,&
this.sle_4,&
this.sle_5,&
this.sle_3,&
this.sle_2,&
this.sle_1,&
this.rb_incomp,&
this.rb_anul,&
this.rb_tod,&
this.rb_comp,&
this.dw_rias,&
this.st_desdiag,&
this.st_cdiaging,&
this.st_3,&
this.st_1,&
this.cbx_replica,&
this.st_2,&
this.gb_1,&
this.gb_3,&
this.gb_4}
end on

on tp_2.destroy
destroy(this.st_desproc)
destroy(this.cb_guarda)
destroy(this.cb_del)
destroy(this.sle_4)
destroy(this.sle_5)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.rb_incomp)
destroy(this.rb_anul)
destroy(this.rb_tod)
destroy(this.rb_comp)
destroy(this.dw_rias)
destroy(this.st_desdiag)
destroy(this.st_cdiaging)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.cbx_replica)
destroy(this.st_2)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_4)
end on

type st_desproc from statictext within tp_2
integer x = 5
integer y = 172
integer width = 4338
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

type cb_guarda from picturebutton within tp_2
event mousemove pbm_mousemove
integer x = 4000
integer y = 1020
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &g"
boolean default = true
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
string powertiptext = "Guardar [Alt+G]"
end type

event clicked;dw_rias.accepttext()
if dw_rias.update() = 1 then 
	commit;
end if
end event

type cb_del from picturebutton within tp_2
event mousemove pbm_mousemove
boolean visible = false
integer x = 3840
integer y = 1024
integer width = 142
integer height = 124
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "            "
string picturename = "borrador.GIF"
string disabledname = "d_borrador.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Procedimiento"
end type

event clicked;long fila,donde,nservic,nulo
fila=dw_rias.getrow()
if fila<1 then return
if not isnull(dw_rias.getitemnumber(fila,"nfactura")) then
	messagebox("Atención","Este procedimiento ya se encuentra facturado, no lo puede borrar")
	return
end if
string snulo

if i_est_hadm<>"1" then
	Messagebox("Atención","No se puede borrar procedimientos ya que la admisión no está activa")
	return
end if
nservic=dw_rias.getitemnumber(fila,"nservicio")
string codigo,estado
setnull(nulo)
setnull(snulo)
donde=dw_trae.find('contador='+string(i_st.numero)+' and clugar="'+i_st.lugar+'" and nsolicitud='+string(i_norden)+' and item='+string(dw_rias.getitemnumber(fila,"item_orden")),1,dw_trae.rowcount())
if donde=0 then 
	messagebox("No se puede encontrar este procedimiento","Es posible que sea un procedimiento atendido en apoyo diagnóstico y no se puede borrar desde aqui")
	return
end if
dw_trae.setitem(donde,"suministrada",dw_trae.getitemnumber(donde,"suministrada") -dw_rias.getitemnumber(fila,"s_cantidad"))
if dw_trae.getitemnumber(donde,"suministrada") < dw_trae.getitemnumber(donde,"solicitada")then dw_trae.setitem(donde,"estado","1")
long j
select count(item) into :j from oscuerpo where contador=:i_st.numero and clugar=:i_st.lugar and nsolicitud=:i_norden and estado='1';
if j=0 then
	estado='2'
else
	estado='1'
end if
update oscabeza set estado=:estado where contador=:i_st.numero and clugar=:i_st.lugar and nsolicitud=:i_norden;
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
dw_rias.deleterow(fila)
if dw_rias.update()=-1 then
	rollback;
	return
end if
if dw_trae.update()=-1 then
	rollback;
else
	commit;
	i_cambio='Y'
end if

end event

type sle_4 from singlelineedit within tp_2
integer x = 2528
integer y = 1052
integer width = 320
integer height = 68
integer taborder = 140
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
borderstyle borderstyle = stylelowered!
end type

type sle_5 from singlelineedit within tp_2
integer x = 2190
integer y = 1052
integer width = 325
integer height = 68
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 15780518
string text = "No obligatorio"
borderstyle borderstyle = stylelowered!
end type

event constructor;backcolor=rgb(255,255,200)
end event

type sle_3 from singlelineedit within tp_2
integer x = 1902
integer y = 1052
integer width = 274
integer height = 68
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
string text = "Obligatorio"
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within tp_2
integer x = 1618
integer y = 1052
integer width = 247
integer height = 68
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
string text = "Completo"
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within tp_2
integer x = 1339
integer y = 1052
integer width = 265
integer height = 68
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 16777215
string text = "Incompleto"
borderstyle borderstyle = stylelowered!
end type

type rb_incomp from radiobutton within tp_2
integer x = 928
integer y = 1052
integer width = 347
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
string text = "Incompletos"
end type

event clicked;dw_rias.setfilter("estado='Incompleto'")
dw_rias.filter()
end event

type rb_anul from radiobutton within tp_2
integer x = 613
integer y = 1052
integer width = 302
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
string text = "Anulados"
end type

event clicked;dw_rias.setfilter("estado='Anulado'")
dw_rias.filter()
end event

type rb_tod from radiobutton within tp_2
integer x = 352
integer y = 1052
integer width = 242
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
string text = "Todos"
boolean checked = true
end type

event clicked;dw_rias.setfilter("")
dw_rias.filter()
end event

type rb_comp from radiobutton within tp_2
integer x = 23
integer y = 1052
integer width = 325
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
string text = "Completos"
end type

event clicked;dw_rias.setfilter("estado='Completo'")
dw_rias.filter()
end event

type dw_rias from datawindow within tp_2
integer y = 252
integer width = 4357
integer height = 656
integer taborder = 20
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
if fila<1 then return
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

type st_desdiag from statictext within tp_2
integer x = 530
integer y = 924
integer width = 2839
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

type st_cdiaging from statictext within tp_2
integer x = 343
integer y = 924
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

type st_3 from statictext within tp_2
integer x = 14
integer y = 928
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

type st_1 from statictext within tp_2
integer x = 603
integer y = 84
integer width = 3735
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

type cbx_replica from checkbox within tp_2
integer x = 9
integer y = 68
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

type st_2 from statictext within tp_2
integer x = 101
integer y = 68
integer width = 448
integer height = 96
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

type gb_1 from groupbox within tp_2
integer y = 996
integer width = 1326
integer height = 148
integer taborder = 30
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
string text = "Mostrar Rips:"
end type

type gb_3 from groupbox within tp_2
integer x = 1317
integer y = 996
integer width = 576
integer height = 148
integer taborder = 40
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

type gb_4 from groupbox within tp_2
integer x = 1883
integer y = 996
integer width = 983
integer height = 148
integer taborder = 50
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

type dw_inf from datawindow within w_banco_atiende
integer x = 9
integer width = 4471
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

type dw_trae from datawindow within w_banco_atiende
integer x = 9
integer y = 132
integer width = 4421
integer height = 448
integer taborder = 190
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ord_serv_banco_x_rips"
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

event rowfocuschanged;if getrow()<1 then return
if isnull(getitemnumber(getrow(),'item')) then 
	tab_1.tp_1.dw_reser.setfilter('isnull(item)')
else
	tab_1.tp_1.dw_reser.setfilter('item='+string(getitemnumber(getrow(),'item')))
end if
tab_1.tp_1.dw_reser.filter()
end event

type cb_cancel from picturebutton within w_banco_atiende
event mousemove pbm_mousemove
integer x = 4169
integer y = 1720
integer width = 142
integer height = 124
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &c"
boolean cancel = true
string picturename = "puerta.gif"
string disabledname = "d_puerta.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type dw_segrespon from datawindow within w_banco_atiende
boolean visible = false
integer x = 3301
integer y = 616
integer width = 64
integer height = 56
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

type dw_cont_det from datawindow within w_banco_atiende
boolean visible = false
integer x = 3374
integer y = 616
integer width = 64
integer height = 56
integer taborder = 150
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_cont_deta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_trae_varias from datawindow within w_banco_atiende
boolean visible = false
integer x = 3566
integer y = 604
integer width = 133
integer height = 48
integer taborder = 170
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_trae_varias"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_empac from datawindow within w_banco_atiende
boolean visible = false
integer x = 3447
integer y = 608
integer width = 64
integer height = 56
integer taborder = 180
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_emp_pac"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

