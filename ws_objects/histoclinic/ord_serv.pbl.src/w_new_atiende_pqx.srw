$PBExportHeader$w_new_atiende_pqx.srw
forward
global type w_new_atiende_pqx from window
end type
type st_1 from statictext within w_new_atiende_pqx
end type
type st_va from statictext within w_new_atiende_pqx
end type
type pb_2 from picturebutton within w_new_atiende_pqx
end type
type pb_1 from picturebutton within w_new_atiende_pqx
end type
type dw_qxconf from datawindow within w_new_atiende_pqx
end type
type st_cuantos from statictext within w_new_atiende_pqx
end type
type dw_busca from datawindow within w_new_atiende_pqx
end type
type dw_1 from datawindow within w_new_atiende_pqx
end type
type gb_1 from groupbox within w_new_atiende_pqx
end type
type gb_2 from groupbox within w_new_atiende_pqx
end type
end forward

global type w_new_atiende_pqx from window
integer width = 3657
integer height = 1880
boolean titlebar = true
string title = "Datos del Procedimiento Quirúrgico"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "bisturi.ico"
boolean clientedge = true
boolean center = true
st_1 st_1
st_va st_va
pb_2 pb_2
pb_1 pb_1
dw_qxconf dw_qxconf
st_cuantos st_cuantos
dw_busca dw_busca
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_new_atiende_pqx w_new_atiende_pqx

type variables
string nautoriza,confirma_ge,proccups,rips,cod_concep,req_aut,proced,manual,l_sexo,version
datawindowchild i_dw_espe,idw_anes
datastore ids_proces
int va=1
end variables

on w_new_atiende_pqx.create
this.st_1=create st_1
this.st_va=create st_va
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_qxconf=create dw_qxconf
this.st_cuantos=create st_cuantos
this.dw_busca=create dw_busca
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.st_1,&
this.st_va,&
this.pb_2,&
this.pb_1,&
this.dw_qxconf,&
this.st_cuantos,&
this.dw_busca,&
this.dw_1,&
this.gb_1,&
this.gb_2}
end on

on w_new_atiende_pqx.destroy
destroy(this.st_1)
destroy(this.st_va)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_qxconf)
destroy(this.st_cuantos)
destroy(this.dw_busca)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;ids_proces=message.powerobjectparm
string q_sql
datetime ahora

if w_principal.dw_1.getitemstring(1,'sexo')='F' then 
	 l_sexo='2'
else
	l_sexo='1'
end if
ahora=datetime(today())
select cod_version into :version from pm_cups_version where valido_hasta>=:ahora;


q_sql=dw_busca.describe('DataWindow.Table.Select')
if not isvalid(w_atiende_qx) then
//	if dw_busca.retrieve(ids_proces.getitemstring(1,1),l_sexo)=1 then dw_busca.triggerevent(doubleclicked!)
//else
	if not isnull(w_new_sala_qx.l_sql) and w_new_sala_qx.l_sql<>'' then
		q_sql+= ' AND (tarifas. '+w_new_sala_qx.l_sql
		 dw_busca.Object.DataWindow.Table.Select =q_sql  
	end if
end if	
if dw_busca.retrieve(version,ids_proces.getitemstring(1,1),l_sexo)=1 then dw_busca.triggerevent(doubleclicked!)

if not isnull(ids_proces.getitemstring(1,'prof')) then 
	dw_1.setitem(1,'especialista',ids_proces.getitemstring(1,'prof'))
	dw_1.setitem(1,'nautoriza',ids_proces.getitemstring(1,'nautoriza'))
	dw_1.setitem(1,'nautoriza',ids_proces.getitemstring(1,'cesp'))
	dw_1.setcolumn('especialista')
	dw_1.triggerevent( itemchanged!)
end if
st_va.text='Cirugía: 1 de'+string(ids_proces.rowcount())
end event

type st_1 from statictext within w_new_atiende_pqx
integer x = 1381
integer y = 8
integer width = 2231
integer height = 124
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Elija una equivalencia del manual con doble click para ser atendida, y luego digite los datos propios de la cirugía"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_va from statictext within w_new_atiende_pqx
integer x = 37
integer y = 8
integer width = 1321
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_new_atiende_pqx
integer x = 1847
integer y = 1624
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
string picturename = "aceptar.gif"
string powertiptext = "Aceptar"
end type

event clicked;if dw_1.rowcount()=0 then return
dw_1.accepttext()
if isnull(dw_1.getitemstring(1,"cvia")) then
	messagebox("Atención","La vía de ingreso es obligatoria")
	dw_1.setcolumn("cvia")
	dw_1.setfocus()
	return
end if
if dw_1.getitemstring(1,"anest")='1' and isnull(dw_1.getitemstring(1,"tipoanestecia"))then
	messagebox("Atención","El tipo de anestecia es requerido para este procedimeitno")
	dw_1.setcolumn("tipoanestecia")
	return
end if
if isnull(dw_1.getitemstring(1,"especialista")) or isnull(dw_1.getitemstring(1,"cesp")) or dw_1.getitemstring(1,"cesp")=''then
	messagebox("Atención","El especialista y su especialidad es obligatorio")
	dw_1.setcolumn("especialista")
	dw_1.setfocus()
	return
end if
if isnull(dw_1.getitemstring(1,"anestesiologo")) and (dw_1.getitemstring(1,"anest")='1' or(dw_1.getitemstring(1,"anest")='0' and dw_1.describe('anestesiologo.visible')='1' ))then
	messagebox("Atención","El anestesiologo es requerido para este procedimiento")
	dw_1.setcolumn("anestesiologo")
	dw_1.setfocus()
	return
end if
if dw_1.getitemstring(1,"auxi")='1' and isnull(dw_1.getitemstring(1,"auxiliarqx")) then
	messagebox("Atención","El auxiliar es requerido para este procedimiento")
	dw_1.setcolumn("auxiliarqx")
	dw_1.setfocus()
	return
end if

if req_aut='si' and (trim(dw_1.getitemstring(1,"nautoriza"))='' or isnull(dw_1.getitemstring(1,"nautoriza")))then
	messagebox("Atención","Este procedimiento requiere autorización para poder continuar")
	dw_1.setcolumn("nautoriza")
	dw_1.setfocus()
	return
end if
long donde,contad
datawindow dw
if isvalid(w_atiende_qx) then
	dw=w_atiende_qx.tab_servicios.tabpage_1.dw_serv_ing
	contad=w_atiende_qx.dw_admi.getitemnumber(1,'contador')
else
	dw=w_new_sala_qx.tab_servicios.tabpage_1.dw_serv_ing
	contad=w_new_sala_qx.dw_historial.getitemnumber(w_new_sala_qx.dw_historial.getrow(),"contador")
end if
long consec,nserv
datetime hoy
string nautor,cproced,cprocedeq,cmanual,cemp,ccontrato,cplan,crips,cprof,ambito,cesp
cproced=dw_1.getitemstring(1,"proccups")
cprocedeq=dw_1.getitemstring(1,"cproced")
cmanual=dw_1.getitemstring(1,"cmanual")
cemp=dw_1.getitemstring(1,"cemp")
ccontrato=dw_1.getitemstring(1,"ccontrato")
cplan=dw_1.getitemstring(1,"cplan")
crips=dw_1.getitemstring(1,"crias")
cprof=dw_1.getitemstring(1,"especialista")
nautor=dw_1.getitemstring(1,"nautoriza")
cesp=dw_1.getitemstring(1,"cesp")

donde=dw.insertrow(0)
dw.setitem(donde,'cproced',cprocedeq)
dw.setitem(donde,'proced_descripcion',dw_1.getitemstring(1,'descripcion'))
dw.setitem(donde,'nautoriza',dw_1.getitemstring(1,'nautoriza'))//
dw.setitem(donde,'cvia',dw_1.getitemstring(1,'cvia'))
dw.setitem(donde,'incruento',dw_1.getitemstring(1,'incruento'))
dw.setitem(donde,'bilateral',dw_1.getitemstring(1,'bilateral'))
dw.setitem(donde,'paquetizado',dw_1.getitemstring(1,'qxcpacto_paquetizado'))
dw.setitem(donde,'cantidad',1)
dw.setitem(donde,'proccups',cproced)
dw.setitem(donde,'estria','2')//incompleto
dw.setitem(donde,'especialista',cprof)
dw.setitem(donde,'cesp',cesp)
dw.setitem(donde,'anestesiologo',dw_1.getitemstring(1,'anestesiologo'))
dw.setitem(donde,'tipoanestecia',dw_1.getitemstring(1,'tipoanestecia'))
dw.setitem(donde,'auxiliarqx',dw_1.getitemstring(1,'auxiliarqx'))
dw.setitem(donde,'circulante',dw_1.getitemstring(1,'circulante'))
dw.setitem(donde,'instrumenta',dw_1.getitemstring(1,'instrumenta'))
dw.setitem(donde,'des_esp',i_dw_espe.getitemstring(i_dw_espe.getrow(),'desesp'))
dw.setitem(donde,'cemp',cemp)
dw.setitem(donde,'ccontrato',ccontrato)
dw.setitem(donde,'cplan',cplan)
dw.setitem(donde,'cmanual',cmanual)
dw.setitem(donde,'crias',crips)
if not isvalid(w_atiende_qx) then
	hoy=ids_proces.getitemdatetime(va,'fecha')
	dw.setitem(donde,'numero',w_new_sala_qx.n_ingres)
	dw.setitem(donde,'clugar',w_new_sala_qx.clugar_acto)
	select max(consecutivo) into :consec from qxcpacto where numero= :w_new_sala_qx.n_ingres and clugar=:w_new_sala_qx.clugar_acto;
	if isnull(consec) then consec=0;
	consec++
	dw.setitem(donde,"consecutivo",consec)
	select max(nservicio) into :nserv from serviciosingreso where contador=:w_new_sala_qx.contador and clugar=:w_new_sala_qx.i_clugar_his;
	if isnull(nserv) then nserv=0
	nserv++
	ambito='1'
	long facturar=1
	insert into serviciosingreso (contador,clugar,nservicio,cproced,cprocedeq,cmanual,cemp,ccontrato,cplan,rips,cprof,fecha,cantidad,nautoriza,estria,ambitoproced,CodEspecialidad,usuario,persoatiende,facturar) values
	(:contad,:w_new_sala_qx.i_clugar_his,:nserv,:cproced,:cprocedeq,:cmanual,:cemp,:ccontrato,:cplan,:crips,:cprof,:hoy,1,:nautor,'2',:ambito,:cesp,:usuario,'1',:facturar);
	if sqlca.sqlcode<0 then
		messagebox("Error insertando registro en ServiciosIngreso",sqlca.sqlerrtext)
		rollback;
		return
	end if
	dw.setitem(donde,"contador",contad)
	dw.setitem(donde,"nservicio",nserv)
	dw.setitem(donde,"clugar",w_new_sala_qx.clugar_acto)
	dw.setitem(donde,"clugar_ser",w_new_sala_qx.i_clugar_his)
	if dw.update()=-1 then 
		rollback;
		return
	end if
end if
va++
if va>ids_proces.rowcount() then
	if isvalid(w_new_sala_qx) then 
		w_new_sala_qx.dw_historial.triggerevent(rowfocuschanged!)
		commit;
	end if
	close (parent)
	return
end if
dw_1.reset()
if isvalid(w_atiende_qx) then
	if dw_busca.retrieve(version,ids_proces.getitemstring(va,1),l_sexo)=1 then dw_busca.triggerevent(doubleclicked!)
else
	if dw_busca.retrieve(version,ids_proces.getitemstring(va,1),l_sexo)=1 then dw_busca.triggerevent(doubleclicked!)
end if	
st_va.text='Cirugía: '+string(va)+' de'+string(ids_proces.rowcount())
end event

type pb_1 from picturebutton within w_new_atiende_pqx
integer x = 2021
integer y = 1624
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
string picturename = "cancelar.gif"
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
close(w_atiende_qx)
end event

type dw_qxconf from datawindow within w_new_atiende_pqx
boolean visible = false
integer x = 3730
integer y = 24
integer width = 128
integer height = 128
boolean enabled = false
string title = "none"
string dataobject = "dw_qxconf"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;this.settransobject(sqlca)
end event

type st_cuantos from statictext within w_new_atiende_pqx
integer x = 398
integer y = 128
integer width = 489
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_busca from datawindow within w_new_atiende_pqx
integer x = 73
integer y = 196
integer width = 3515
integer height = 484
integer taborder = 30
string title = "none"
string dataobject = "dw_busca_procqx_xcups"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)

end event

event doubleclicked;long fila
string qx_sql
fila=this.getrow()
if fila<1 then return
proced=this.getitemstring(fila,"codservicio")
proccups=this.getitemstring(fila,"codproced")
rips=this.getitemstring(fila,"rips")
string manu,parto
string conf
string temp
long ulti,fget
st_cargar_a stc
parto=this.getitemstring(fila,"parto")
if isvalid(w_atiende_qx) then
	manu=w_atiende_qx.manual
else
	qx_sql=dw_qxconf.describe('DataWindow.Table.Select')
	qx_sql+= ' AND ( '+w_new_sala_qx.l_sql
	dw_qxconf.Object.DataWindow.Table.Select =qx_sql  
end if
if dw_qxconf.retrieve(proced)>0 then
	string sex_pa
	sex_pa=w_principal.dw_1.getitemstring(1,"sexo")
	if parto='1' and sex_pa='M' then
		messagebox("Atención","Este procedimiento es unicamente para sexo Femenino")
		return
	end if
	choose case dw_qxconf.getitemstring(1,"sexo")
		case "M"
			if sex_pa="F" then
				messagebox("Atención","Este procedimiento es unicamente para sexo masculino")
				return
			end if
		case "F"
			if sex_pa="M" then
				messagebox("Atención","Este procedimiento es unicamente para sexo femenino")
				return
			end if
		case "A"
	end choose
end if
string tipo_afil,des_cont,emp,contrato,plan
long j
boolean yapaso=false
window wpr
if isvalid(w_atiende_qx) then
	tipo_afil=w_atiende_qx.dw_admi.getitemstring(1,"codta")
	emp=w_atiende_qx.dw_admi.getitemstring(1,"cemp")
	contrato=w_atiende_qx.dw_admi.getitemstring(1,"ccontrato")
	w_atiende_qx.dw_segrespon.retrieve(emp,contrato,tipo_afil)
	DO // pa poder revisar en todos los responsables
		if w_atiende_qx.dw_segrespon.rowcount()>0 then des_cont=w_atiende_qx.dw_segrespon.getitemstring(1,"descontrato")
		if w_atiende_qx.dw_cont_det.rowcount()=0 then 
			messagebox("Error de Configuración","El contrato "+w_atiende_qx.dw_segrespon.getitemstring(1,"descontrato")+" de la empresa "+w_atiende_qx.dw_segrespon.getitemstring(1,"desemp")+" no tiene planes")
			return
		end if	
		/// viene lo duro	
		for j=1 to w_atiende_qx.dw_cont_det.rowcount() // de aquí tiene que salir cuando encuentre los valores
			manual=w_atiende_qx.dw_cont_det.getitemstring(j,"codmanual")
			plan=w_atiende_qx.dw_cont_det.getitemstring(j,"cplan")
			if f_proc_plan(proccups,plan) then
				if w_atiende_qx.dw_cont_det.getitemstring(j,"autorizacion")="1" then
					req_aut='si'
				else
					req_aut='no'
				end if
				if w_atiende_qx.dw_cont_det.getitemstring(j,"tipo")<>"2" then goto salio
				edad_busca=w_principal.dw_1.getitemnumber(1,"anyos")
				sex_busca=w_principal.dw_1.getitemstring(1,"sexo_t")
				w_atiende_qx.dw_getareo.retrieve(edad_busca,sex_busca,emp,contrato,plan,"1" /*tipoingreso*/,"2" /*tipo de plan 2:getareo*/)
				if w_atiende_qx.dw_getareo.rowcount()>0 then
					if w_atiende_qx.dw_getareo.rowcount()>1 then 
						stc.emp=emp
						stc.cont=contrato
						stc.tipoingreso=w_atiende_qx.i_tipo_ingres
						openwithparm(w_escoge_getareo,stc)
					end if
					fget=message.doubleparm
					if fget>0 then
						conf=w_atiende_qx.dw_getareo.getitemstring(fget,"confirma")
						if conf="1" and confirma_ge="si" then  ///confirma ge es una variable instance para no seguir preguntando en caso de que si
							if messagebox("Atención","Está seguro que el paciente con documento: "+tipdoc+" "+docu+" con edad de :"+string(edad_busca)+" año(s) y sexo: "+sex_busca+" cumple con los requisitos de este grupo etareo ?",question!,yesno!,1)=2 then goto otro_plan
							confirma_ge="no"
							goto salio
						end if
					end if
				end if
			end if
			otro_plan:
		next
		/// fin de viene lo duro
		if yapaso then 
			messagebox("Error en configuración de contratos","No se puede encontrar responsable de este procedimiento, revise incluso la empresa Particular")
			setnull(plan)
			return
		end if
		if w_atiende_qx.dw_segrespon.getitemstring(1,"segrespon")<>"" and w_atiende_qx.dw_segrespon.getitemstring(1,"contsegrespon")<>"" then
			emp=w_atiende_qx.dw_segrespon.getitemstring(1,"segrespon")
			contrato=w_atiende_qx.dw_segrespon.getitemstring(1,"contsegrespon")
			w_atiende_qx.dw_segrespon.retrieve(emp,contrato,tipo_afil)
		else
			if messagebox("Atención","Este procedimiento no es cubierto por la empresa, desea cargarlo como particular ?",question!,yesno!,1)=2 then return
			emp='0'
			contrato='1'
			yapaso=true
		end if
		w_atiende_qx.dw_cont_det.retrieve(emp,contrato,w_atiende_qx.i_tipo_ingres)
	LOOP WHILE true
	salio:
	dw_1.reset()
	dw_1.insertrow(1)
	If dw_qxconf.rowcount()>0 then
		setnull(temp)
		select proced into :temp from qxconfiguracion where codmanual=:manual and proced=:proced;
		if isnull(temp) then
			dw_1.setitem(1,"anest",'0')
			dw_1.setitem(1,"auxi",'0')
		else
			setnull(temp)
			select obligatorio into :temp from qxconfiguradetalle where codmanual=:manual and proced=:proced and codigocobro='2';
			dw_1.setitem(1,"anest",temp)
			setnull(temp)
			select obligatorio into :temp from qxconfiguradetalle where codmanual=:manual and proced=:proced and codigocobro='3';
			dw_1.setitem(1,"auxi",temp)
		end if	
		if dw_qxconf.getitemstring(1,"incruento")='1' then 
			dw_1.setitem(1,"incruento",'1')
			dw_1.modify("incruento.protect=1")	
		end if
		if dw_qxconf.getitemstring(1,"bilateral")='0' then dw_1.modify("bilateral.protect=1")	
	end if
	dw_1.setitem(1,"cproced",proced)
	dw_1.setitem(1,"proccups",proccups)
	dw_1.setitem(1,"cmanual",manual)
	dw_1.setitem(1,"cemp",emp)
	dw_1.setitem(1,"ccontrato",contrato)
	dw_1.setitem(1,"crias",rips)
	dw_1.setitem(1,"cplan",plan)
	dw_1.setitem(1,"descripcion",this.getitemstring(fila,"descripcion_servi"))
	ulti=w_atiende_qx.tab_servicios.tabpage_1.dw_serv_ing.rowcount()
	if ulti>0 then
		dw_1.setitem(1,'tipoanestecia',w_atiende_qx.tab_servicios.tabpage_1.dw_serv_ing.getitemstring(ulti,'tipoanestecia'))
		dw_1.setcolumn('tipoanestecia')
		dw_1.triggerevent(itemchanged!)
		dw_1.setitem(1,'especialista',w_atiende_qx.tab_servicios.tabpage_1.dw_serv_ing.getitemstring(ulti,'especialista'))
		dw_1.setitem(1,'cesp',w_atiende_qx.tab_servicios.tabpage_1.dw_serv_ing.getitemstring(ulti,'cesp'))
		dw_1.setitem(1,'anestesiologo',w_atiende_qx.tab_servicios.tabpage_1.dw_serv_ing.getitemstring(ulti,'anestesiologo'))
		dw_1.setitem(1,'auxiliarqx',w_atiende_qx.tab_servicios.tabpage_1.dw_serv_ing.getitemstring(ulti,'auxiliarqx'))
		dw_1.setitem(1,'circulante',w_atiende_qx.tab_servicios.tabpage_1.dw_serv_ing.getitemstring(ulti,'circulante'))
		dw_1.setitem(1,'instrumenta',w_atiende_qx.tab_servicios.tabpage_1.dw_serv_ing.getitemstring(ulti,'instrumenta'))
		dw_1.setcolumn('especialista')
		dw_1.triggerevent(itemchanged!)
	end if
else //va pa salaqxn cuando lo hacen desde interface de programadas
	tipo_afil=w_new_sala_qx.dw_admi.getitemstring(w_new_sala_qx.dw_admi.getrow(),"codta")
	emp=w_new_sala_qx.dw_admi.getitemstring(w_new_sala_qx.dw_admi.getrow(),"cemp")
	contrato=w_new_sala_qx.dw_admi.getitemstring(w_new_sala_qx.dw_admi.getrow(),"ccontrato")
	w_new_sala_qx.dw_segrespon.retrieve(emp,contrato,tipo_afil)
	DO // pa poder revisar en todos los responsables
		if w_new_sala_qx.dw_segrespon.rowcount()>0 then des_cont=w_new_sala_qx.dw_segrespon.getitemstring(1,"descontrato")
		if w_new_sala_qx.dw_cont_det.rowcount()=0 then 
			messagebox("Error de Configuración","El contrato "+w_new_sala_qx.dw_segrespon.getitemstring(1,"descontrato")+" de la empresa "+w_new_sala_qx.dw_segrespon.getitemstring(1,"desemp")+" no tiene planes")
			return
		end if	
		/// viene lo duro	
		for j=1 to w_new_sala_qx.dw_cont_det.rowcount() // de aquí tiene que salir cuando encuentre los valores
			manual=w_new_sala_qx.dw_cont_det.getitemstring(j,"codmanual")
			plan=w_new_sala_qx.dw_cont_det.getitemstring(j,"cplan")
			if f_proc_plan(proccups,plan) then
				if w_new_sala_qx.dw_cont_det.getitemstring(j,"autorizacion")="1" then
					req_aut='si'
				else
					req_aut='no'
				end if
				if w_new_sala_qx.dw_cont_det.getitemstring(j,"tipo")<>"2" then goto salio2
				edad_busca=w_principal.dw_1.getitemnumber(1,"anyos")
				sex_busca=w_principal.dw_1.getitemstring(1,"sexo_t")
				w_new_sala_qx.dw_getareo.retrieve(edad_busca,sex_busca,emp,contrato,plan,"1" /*tipoingreso*/,"2" /*tipo de plan 2:getareo*/)
				if w_new_sala_qx.dw_getareo.rowcount()>0 then
					if w_new_sala_qx.dw_getareo.rowcount()>1 then
						stc.emp=emp
						stc.cont=contrato
						stc.tipoingreso=w_new_sala_qx.tipo_ingres
						openwithparm(w_escoge_getareo,stc)
					end if
					fget=message.doubleparm
					if fget>0 then
						conf=w_new_sala_qx.dw_getareo.getitemstring(fget,"confirma")
						if conf="1" and confirma_ge="si" then  ///confirma ge es una variable instance para no seguir preguntando en caso de que si
							if messagebox("Atención","Está seguro que el paciente con documento: "+tipdoc+" "+docu+" con edad de :"+string(edad_busca)+" año(s) y sexo: "+sex_busca+" cumple con los requisitos de este grupo etareo ?",question!,yesno!,1)=2 then goto otro_plan2
							confirma_ge="no"
							goto salio2
						end if
					end if
				end if
			end if
			otro_plan2:
		next
		/// fin de viene lo duro
		if yapaso then 
			messagebox("Error en configuración de contratos","No se puede encontrar responsable de este procedimiento, revise incluso la empresa Particular")
			setnull(plan)
			return
		end if
		if w_new_sala_qx.dw_segrespon.getitemstring(1,"segrespon")<>"" and w_new_sala_qx.dw_segrespon.getitemstring(1,"contsegrespon")<>"" then
			emp=w_new_sala_qx.dw_segrespon.getitemstring(1,"segrespon")
			contrato=w_new_sala_qx.dw_segrespon.getitemstring(1,"contsegrespon")
			w_new_sala_qx.dw_segrespon.retrieve(emp,contrato,tipo_afil)
		else
			if messagebox("Atención","Este procedimiento no es cubierto por la empresa, desea cargarlo como particular ?",question!,yesno!,1)=2 then return
			emp='0'
			contrato='1'
			yapaso=true
		end if
		w_new_sala_qx.dw_cont_det.retrieve(emp,contrato,w_new_sala_qx.tipo_ingres)
	LOOP WHILE true
	salio2:
	dw_1.reset()
	dw_1.insertrow(1)
	If dw_qxconf.rowcount()>0 then
		setnull(temp)
		select proced into :temp from qxconfiguracion where codmanual=:manual and proced=:proced;
		if isnull(temp) then
			dw_1.setitem(1,"anest",'0')
			dw_1.setitem(1,"auxi",'0')
		else
			setnull(temp)
			select obligatorio into :temp from qxconfiguradetalle where codmanual=:manual and proced=:proced and codigocobro='2';
			dw_1.setitem(1,"anest",temp)
			setnull(temp)
			select obligatorio into :temp from qxconfiguradetalle where codmanual=:manual and proced=:proced and codigocobro='3';
			dw_1.setitem(1,"auxi",temp)
		end if	
		if dw_qxconf.getitemstring(1,"incruento")='1' then 
			dw_1.setitem(1,"incruento",'1')
			dw_1.modify("incruento.protect=1")	
		end if
		if dw_qxconf.getitemstring(1,"bilateral")='0' then dw_1.modify("bilateral.protect=1")	
	end if
	dw_1.setitem(1,"cproced",proced)
	dw_1.setitem(1,"proccups",proccups)
	dw_1.setitem(1,"cmanual",manual)
	dw_1.setitem(1,"cemp",emp)
	dw_1.setitem(1,"ccontrato",contrato)
	dw_1.setitem(1,"crias",rips)
	dw_1.setitem(1,"cplan",plan)
	dw_1.setitem(1,"descripcion",this.getitemstring(fila,"descripcion_servi"))
	dw_1.setitem(1,'tipoanestecia',ids_proces.getitemstring(va,'tipoane'))
	dw_1.setcolumn('tipoanestecia')
	dw_1.triggerevent(itemchanged!)
	dw_1.setitem(1,'especialista',ids_proces.getitemstring(va,'prof'))
	dw_1.setcolumn('especialista')
	dw_1.triggerevent(itemchanged!)
	dw_1.setitem(1,'cesp',ids_proces.getitemstring(va,'cesp'))
	dw_1.setitem(1,'anestesiologo',ids_proces.getitemstring(va,'ane'))
	ulti=w_new_sala_qx.tab_servicios.tabpage_1.dw_serv_ing.rowcount()
	if ulti>0 then
		dw_1.setitem(1,'auxiliarqx',w_new_sala_qx.tab_servicios.tabpage_1.dw_serv_ing.getitemstring(ulti,'auxiliarqx'))
		dw_1.setitem(1,'circulante',w_new_sala_qx.tab_servicios.tabpage_1.dw_serv_ing.getitemstring(ulti,'circulante'))
		dw_1.setitem(1,'instrumenta',w_new_sala_qx.tab_servicios.tabpage_1.dw_serv_ing.getitemstring(ulti,'instrumenta'))
	end if
	if not isnull(ids_proces.getitemstring(1,'prof')) then 
	dw_1.setitem(1,'especialista',ids_proces.getitemstring(1,'prof'))
	dw_1.setitem(1,'nautoriza',ids_proces.getitemstring(1,'nautoriza'))
	dw_1.setcolumn('especialista')
	//dw_1.triggerevent( itemchanged!)
end if
end if
setnull(proccups)
dw_busca.setfilter("")
dw_busca.filter()
end event

type dw_1 from datawindow within w_new_atiende_pqx
event key pbm_dwnkey
integer x = 91
integer y = 756
integer width = 3506
integer height = 836
integer taborder = 40
string title = "none"
string dataobject = "dw_nueva_cirugia"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event key;if key=keydelete! then
	string nulo
	setnull(nulo)
	choose case this.getcolumnname()
		case 'tipoanestecia'
			if this.getitemstring(1,'anest')='1' then return
			this.setitem(this.getrow(),this.getcolumnname(),nulo)
			this.setitem(this.getrow(),'anestesiologo',nulo)
		case 'anestesiologo','auxiliarqx','instrumenta' ,'circulante'
			this.setitem(this.getrow(),this.getcolumnname(),nulo)
	end choose
end if
end event

event itemchanged;accepttext()
if getcolumnname()="especialista" then
	i_dw_espe.retrieve(getitemstring(1,'especialista'))
	setitem(1,"cesp","")
end if
if getcolumnname()="tipoanestecia" then
	string nulo
	setnull(nulo)
	if getitemstring(1,'anest')='0' then
		if idw_anes.getitemstring(idw_anes.getrow(),'anestesiologo')='1' then
			modify("anestesiologo.visible='1'")
		else
			modify("anestesiologo.visible='0'")
			setitem(1,'anestesiologo',nulo)
		end if
	end if
//	if idw_anes.getitemstring(idw_anes.getrow(),'auxqx')='1' then
//		setitem(1,"auxi",'1')
//	else
//		setitem(1,"auxi",'0')
//		setitem(1,'auxiliarqx',nulo)
//	end if
//	if idw_anes.getitemstring(idw_anes.getrow(),'instrumenta')='1' then
//		modify("instrumenta.visible='1'")
//	else
//		modify("instrumenta.visible='0'")
//		setitem(1,'instrumenta',nulo)
//	end if
//	if idw_anes.getitemstring(idw_anes.getrow(),'circulante')='1' then
//		modify("circulante.visible='1'")
//	else
//		modify("circulante.visible='0'")
//		setitem(1,'circulante',nulo)
//	end if
end if
end event

event constructor;this.settransobject(sqlca)
this.getchild("cesp",i_dw_espe)
this.getchild('tipoanestecia',idw_anes)
idw_anes.settransobject(sqlca)
i_dw_espe.settransobject(sqlca)
i_dw_espe.insertrow(1)
end event

type gb_1 from groupbox within w_new_atiende_pqx
integer x = 41
integer y = 704
integer width = 3575
integer height = 896
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Equivalencia Elegida:"
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within w_new_atiende_pqx
integer x = 37
integer y = 136
integer width = 3579
integer height = 568
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Equivalencias:"
borderstyle borderstyle = styleraised!
end type

