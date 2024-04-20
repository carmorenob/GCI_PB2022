$PBExportHeader$w_nuevo_proc_qx.srw
forward
global type w_nuevo_proc_qx from window
end type
type dw_2 from datawindow within w_nuevo_proc_qx
end type
type f_espe from checkbox within w_nuevo_proc_qx
end type
type dw_espe from datawindow within w_nuevo_proc_qx
end type
type pb_2 from picturebutton within w_nuevo_proc_qx
end type
type pb_1 from picturebutton within w_nuevo_proc_qx
end type
type ddlb_1 from dropdownlistbox within w_nuevo_proc_qx
end type
type dw_qxconf from datawindow within w_nuevo_proc_qx
end type
type st_cuantos from statictext within w_nuevo_proc_qx
end type
type st_3 from statictext within w_nuevo_proc_qx
end type
type st_2 from statictext within w_nuevo_proc_qx
end type
type dw_busca from datawindow within w_nuevo_proc_qx
end type
type st_1 from statictext within w_nuevo_proc_qx
end type
type sle_proced from singlelineedit within w_nuevo_proc_qx
end type
type dw_1 from datawindow within w_nuevo_proc_qx
end type
type gb_1 from groupbox within w_nuevo_proc_qx
end type
type gb_2 from groupbox within w_nuevo_proc_qx
end type
type sle_1 from singlelineedit within w_nuevo_proc_qx
end type
end forward

global type w_nuevo_proc_qx from window
integer width = 3881
integer height = 2244
boolean titlebar = true
string title = "Datos del Procedimiento Quirúrgico"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "bisturi.ico"
boolean clientedge = true
boolean center = true
dw_2 dw_2
f_espe f_espe
dw_espe dw_espe
pb_2 pb_2
pb_1 pb_1
ddlb_1 ddlb_1
dw_qxconf dw_qxconf
st_cuantos st_cuantos
st_3 st_3
st_2 st_2
dw_busca dw_busca
st_1 st_1
sle_proced sle_proced
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
sle_1 sle_1
end type
global w_nuevo_proc_qx w_nuevo_proc_qx

type variables
string nautoriza,proccups,rips,cod_concep,req_aut,proced,manual,confirma_ge,l_sex_pa
datawindowchild i_dw_espe,idw_anes
st_hosposd st
end variables

forward prototypes
public subroutine filtrar ()
end prototypes

public subroutine filtrar ();string campo
choose case ddlb_1.text
	case 'Descrip. CUPS'
		campo='descripcion_cups'
	case 'Cód. CUPS'
		campo='codproced'
	case 'Cód. Manual'
		campo='codservicio'
	case 'Descrip. Manual'
		campo='descripcion_servi'
end choose
if f_espe.checked then
	if not isnull(dw_espe.getitemstring(1,1)) then
		dw_busca.setfilter("(lower("+campo+") like '"+lower(trim(sle_1.text))+"%') and (cesp='"+dw_espe.getitemstring(1,1)+"')")
	else
		dw_busca.setfilter("lower("+campo+") like '"+lower(trim(sle_1.text))+"%'")
	end if
else
	dw_busca.setfilter("lower("+campo+") like '"+lower(trim(sle_1.text))+"%'")
end if
dw_busca.filter()
dw_busca.sort()
st_cuantos.text=string(dw_busca.rowcount())+' Registros'
end subroutine

on w_nuevo_proc_qx.create
this.dw_2=create dw_2
this.f_espe=create f_espe
this.dw_espe=create dw_espe
this.pb_2=create pb_2
this.pb_1=create pb_1
this.ddlb_1=create ddlb_1
this.dw_qxconf=create dw_qxconf
this.st_cuantos=create st_cuantos
this.st_3=create st_3
this.st_2=create st_2
this.dw_busca=create dw_busca
this.st_1=create st_1
this.sle_proced=create sle_proced
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.sle_1=create sle_1
this.Control[]={this.dw_2,&
this.f_espe,&
this.dw_espe,&
this.pb_2,&
this.pb_1,&
this.ddlb_1,&
this.dw_qxconf,&
this.st_cuantos,&
this.st_3,&
this.st_2,&
this.dw_busca,&
this.st_1,&
this.sle_proced,&
this.dw_1,&
this.gb_1,&
this.gb_2,&
this.sle_1}
end on

on w_nuevo_proc_qx.destroy
destroy(this.dw_2)
destroy(this.f_espe)
destroy(this.dw_espe)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.ddlb_1)
destroy(this.dw_qxconf)
destroy(this.st_cuantos)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_busca)
destroy(this.st_1)
destroy(this.sle_proced)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.sle_1)
end on

event open;st=message.powerobjectparm
string x_sql
datetime ahora
string version

if w_principal.dw_1.getitemstring(1,"sexo")='F' then l_sex_pa='2'
if w_principal.dw_1.getitemstring(1,"sexo")='M' then l_sex_pa='1'

ahora=datetime(today())
select cod_version into :version from pm_cups_version where valido_hasta>=:ahora;
if isnull(version) then 
	messagebox("Atención","No existe una versión de Cups activa")
else
	dw_2.setitem(1,1,version)
	//dw_2.triggerevent(itemchanged!)
end if

if isvalid(st) then //viene desde la interfaz con hosposd
	dw_busca.dataobject='dw_busca_procqx_xcups'
	dw_busca.settransobject(sqlca)
	x_sql= dw_busca.Object.DataWindow.Table.Select
	x_sql=x_sql+'  and (serviciosman.'+w_new_sala_qx.l_sql
	dw_busca.Object.DataWindow.Table.Select =x_sql
	string jaer
	jaer=dw_2.getitemstring(1,1)
	if dw_busca.retrieve(dw_2.getitemstring(1,1),st.cproc,l_sex_pa)=1 then dw_busca.triggerevent(doubleclicked!)
	st_1.visible=false
	sle_proced.visible=false
	st_3.visible=false
else
	if isvalid(w_new_sala_qx) then
		x_sql= dw_busca.Object.DataWindow.Table.Select
		x_sql=x_sql+'  and (serviciosman.'+w_new_sala_qx.l_sql
		dw_busca.Object.DataWindow.Table.Select =x_sql
	else
		x_sql=x_sql+w_new_sala_qx.l_sql
		if dw_busca.setsqlselect(w_new_sala_qx.l_sql)=-1 then
			w_new_sala_qx.l_sql=dw_busca.describe('DataWindow.Table.Select')
		end if
	end if
	dw_busca.retrieve(dw_2.getitemstring(1,1),l_sex_pa)
end if
end event

type dw_2 from datawindow within w_nuevo_proc_qx
integer x = 59
integer y = 44
integer width = 1111
integer height = 164
integer taborder = 30
string dataobject = "dw_combo_vcups"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
this.insertrow(1)
end event

event itemchanged;accepttext()
dw_busca.retrieve(dw_2.getitemstring(1,1),l_sex_pa)
filtrar()
end event

type f_espe from checkbox within w_nuevo_proc_qx
integer x = 82
integer y = 212
integer width = 603
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar por Especialidad"
end type

event clicked;filtrar()
end event

type dw_espe from datawindow within w_nuevo_proc_qx
integer x = 699
integer y = 204
integer width = 1353
integer height = 96
integer taborder = 40
string title = "none"
string dataobject = "dw_combo_espe"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
this.insertrow(1)
end event

event itemchanged;this.accepttext()
filtrar()
end event

type pb_2 from picturebutton within w_nuevo_proc_qx
integer x = 2025
integer y = 1984
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
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_nuevo_proc_qx
integer x = 1769
integer y = 1984
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
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
	messagebox("Atención","El tipo de anestesia es requerido para este procedimeitno")
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
long consec,nserv,contad
datetime hoy
string nautor,cproced,cprocedeq,cmanual,cemp,ccontrato,cplan,crips,cprof,ambito,cesp

select max(consecutivo) into :consec from qxcpacto where numero= :w_new_sala_qx.n_ingres and clugar=:w_new_sala_qx.clugar_acto;
if isnull(consec) then consec=0;
consec++
dw_1.setitem(1,"consecutivo",consec)
cproced=dw_1.getitemstring(1,"proccups")
cprocedeq=dw_1.getitemstring(1,"cproced")
cmanual=dw_1.getitemstring(1,"cmanual")
cemp=dw_1.getitemstring(1,"cemp")
ccontrato=dw_1.getitemstring(1,"ccontrato")
cplan=dw_1.getitemstring(1,"cplan")
crips=dw_1.getitemstring(1,"crias")
cprof=dw_1.getitemstring(1,"especialista")
nautor=dw_1.getitemstring(1,"nautoriza")
hoy=datetime(today(),time(string(now())))
cesp=dw_1.getitemstring(1,"cesp")
contad=w_new_sala_qx.contador
select max(nservicio) into :nserv from serviciosingreso where contador=:w_new_sala_qx.contador and clugar=:w_new_sala_qx.i_clugar_his;
if isnull(nserv) then nserv=0
nserv++

choose case w_new_sala_qx.tipo_ingres
	case '2'//urg
		ambito='3'
	case '3'//hosp
		ambito='2'
	case '4'//amb
		ambito='1'
end choose
long facturar=1,norden,conta_os,item_os
string tipoorden,clug_os
setnull(norden)
setnull(tipoorden)
setnull(conta_os)
setnull(item_os)
setnull(clug_os)
if isvalid(st) then
	norden=st.norden
	tipoorden='H'
	conta_os=st.conta_os
	item_os=st.nitem
	clug_os=st.clug_os
	facturar=st.facturar
end if
insert into serviciosingreso (contador,clugar,nservicio,cproced,cprocedeq,cmanual,cemp,ccontrato,cplan,rips,cprof,fecha,cantidad,nautoriza,estria,ambitoproced,CodEspecialidad,usuario,persoatiende,facturar,conta_orden,clug_orden,norden_serv,item_orden) values
(:contad,:w_new_sala_qx.i_clugar_his,:nserv,:cproced,:cprocedeq,:cmanual,:cemp,:ccontrato,:cplan,:crips,:cprof,:hoy,1,:nautor,'2',:ambito,:cesp,:usuario,'1',:facturar,:conta_os,:clug_os,:norden,:item_os);
if sqlca.sqlcode<0 then
	messagebox("Error insertando registro en ServiciosIngreso",sqlca.sqlerrtext)
	rollback;
	return
end if

dw_1.setitem(1,"contador",contad)
dw_1.setitem(1,"nservicio",nserv)
dw_1.setitem(1,"cod_cups",dw_1.getitemstring(1,"cod_cups"))
dw_1.setitem(1,"clugar",w_new_sala_qx.clugar_acto)
dw_1.setitem(1,"clugar_ser",w_new_sala_qx.i_clugar_his)
if dw_1.update()=-1 then 
	rollback;
else
if isvalid(st) then
	update oscuerpo set suministrada=1,estado='2',nro_qx= :w_new_sala_qx.n_ingres,clugar_qx=:w_new_sala_qx.clugar_acto,consec_qx=:consec	
	where contador=:st.conta_os and clugar=:st.clug_os and nsolicitud=:st.norden and item=:st.nitem;
	if sqlca.sqlcode<0 then
		messagebox("Error Actualizando Oscuerpo",sqlca.sqlerrtext)
		rollback;
		return
		end if
	end if
	commit;
	w_new_sala_qx.dw_historial.triggerevent(rowfocuschanged!)
	close(parent)
end if


end event

type ddlb_1 from dropdownlistbox within w_nuevo_proc_qx
integer x = 1189
integer y = 104
integer width = 590
integer height = 352
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Cód. CUPS","Descrip. CUPS","Cód. Manual","Descrip. Manual"}
borderstyle borderstyle = stylelowered!
end type

event constructor;this.text='Descrip. CUPS'
end event

type dw_qxconf from datawindow within w_nuevo_proc_qx
boolean visible = false
integer x = 3131
integer y = 24
integer width = 82
integer height = 72
boolean enabled = false
string title = "none"
string dataobject = "dw_qxconf"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;this.settransobject(sqlca)
end event

type st_cuantos from statictext within w_nuevo_proc_qx
integer x = 3264
integer y = 212
integer width = 489
integer height = 72
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

type st_3 from statictext within w_nuevo_proc_qx
integer x = 1202
integer y = 940
integer width = 2610
integer height = 132
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Si sabe el código digitelo directamente, de lo contrario filtrelo por descripción y luego de doble click sobre el escogido."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_nuevo_proc_qx
integer x = 1189
integer y = 48
integer width = 1074
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar por:                     (Caracter % es comodín)"
boolean focusrectangle = false
end type

type dw_busca from datawindow within w_nuevo_proc_qx
integer x = 82
integer y = 296
integer width = 3680
integer height = 584
integer taborder = 30
string title = "none"
string dataobject = "dw_busca_procqx"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)

end event

event doubleclicked;long fila
fila=this.getrow()
if fila<1 then return
proced=this.getitemstring(fila,"codservicio")
proccups=this.getitemstring(fila,"codproced")
rips=this.getitemstring(fila,"rips")
string manu,parto
parto=this.getitemstring(fila,"parto")
manu=w_new_sala_qx.manual
if dw_qxconf.retrieve(manu,proced)>0 then
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
			if w_new_sala_qx.dw_cont_det.getitemstring(j,"tipo")<>"2" then goto salio
			edad_busca=w_principal.dw_1.getitemnumber(1,"anyos")
			sex_busca=w_principal.dw_1.getitemstring(1,"sexo_t")
			w_new_sala_qx.dw_getareo.retrieve(edad_busca,sex_busca,emp,contrato,plan,"1" /*tipoingreso*/,"2" /*tipo de plan 2:getareo*/)
			if w_new_sala_qx.dw_getareo.rowcount()>0 then
				string conf
				if w_new_sala_qx.dw_getareo.rowcount()>1 then 
					st_cargar_a stc
					stc.emp=emp
					stc.cont=contrato
					stc.tipoingreso=w_new_sala_qx.tipo_ingres
					openwithparm(w_escoge_getareo,stc)
				end if
				long fget
				fget=message.doubleparm
				if fget>0 then
					conf=w_new_sala_qx.dw_getareo.getitemstring(fget,"confirma")
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
salio:
dw_1.reset()
dw_1.insertrow(1)
string temp
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
	end if
	dw_1.modify("incruento.protect=1")	
	if dw_qxconf.getitemstring(1,"bilateral")='0' then dw_1.modify("bilateral.protect=1")	
end if
dw_1.setitem(1,"numero",w_new_sala_qx.n_ingres)
dw_1.setitem(1,"cproced",proced)
dw_1.setitem(1,"proccups",proccups)
dw_1.setitem(1,"cmanual",manual)
dw_1.setitem(1,"cemp",emp)
dw_1.setitem(1,"ccontrato",contrato)
dw_1.setitem(1,"crias",rips)
dw_1.setitem(1,"cplan",plan)
dw_1.setitem(1,"descripcion",this.getitemstring(fila,"descripcion_servi"))
long ulti
ulti=w_new_sala_qx.tab_servicios.tabpage_1.dw_serv_ing.rowcount()
if ulti>0 then
	dw_1.setitem(1,'tipoanestecia',w_new_sala_qx.tab_servicios.tabpage_1.dw_serv_ing.getitemstring(ulti,'tipoanestecia'))
	dw_1.setcolumn('tipoanestecia')
	dw_1.triggerevent(itemchanged!)
	dw_1.setitem(1,'especialista',w_new_sala_qx.tab_servicios.tabpage_1.dw_serv_ing.getitemstring(ulti,'especialista'))
	dw_1.setitem(1,'cesp',w_new_sala_qx.tab_servicios.tabpage_1.dw_serv_ing.getitemstring(ulti,'cesp'))
	dw_1.setitem(1,'anestesiologo',w_new_sala_qx.tab_servicios.tabpage_1.dw_serv_ing.getitemstring(ulti,'anestesiologo'))
	dw_1.setitem(1,'auxiliarqx',w_new_sala_qx.tab_servicios.tabpage_1.dw_serv_ing.getitemstring(ulti,'auxiliarqx'))
	dw_1.setitem(1,'circulante',w_new_sala_qx.tab_servicios.tabpage_1.dw_serv_ing.getitemstring(ulti,'circulante'))
	dw_1.setitem(1,'instrumenta',w_new_sala_qx.tab_servicios.tabpage_1.dw_serv_ing.getitemstring(ulti,'instrumenta'))
	dw_1.setcolumn('especialista')
	dw_1.triggerevent(itemchanged!)
end if
setnull(proccups)
dw_busca.setfilter("")
dw_busca.filter()

end event

event retrieveend;st_cuantos.text=string(dw_busca.rowcount())+' Registros'
end event

type st_1 from statictext within w_nuevo_proc_qx
integer x = 78
integer y = 932
integer width = 553
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Digite el código CUPS:"
boolean focusrectangle = false
end type

type sle_proced from singlelineedit within w_nuevo_proc_qx
integer x = 73
integer y = 988
integer width = 539
integer height = 84
integer taborder = 10
string dragicon = "none!"
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "ibeam!"
long textcolor = 33554432
integer accelerator = 100
borderstyle borderstyle = stylelowered!
end type

event modified;long cual
proccups=trim(this.text)
if proccups="" then return
if w_new_sala_qx.dw_cont_det.rowcount()=0 then
	messagebox("Error","Este contrato no tiene planes de servicios, adicionele planes para poder continuar")
	this.text=""
	return
end if
dw_busca.setfilter("codproced='"+proccups+"'")
dw_busca.filter()
if dw_busca.rowcount()=0 then
	messagebox("Atención","Este procedimiento no es quirúrgico, no está activo o no existe")
	this.text=""
	return
end if
if dw_busca.rowcount()>1 then
	messagebox("Atención","Existe más de una equivalencia con este procedimiento en el manual, elija la que desea haciendo doble click sobre la malla de arriba")
	return
end if
dw_busca.triggerevent(doubleclicked!)

end event

type dw_1 from datawindow within w_nuevo_proc_qx
event key pbm_dwnkey
integer x = 91
integer y = 1112
integer width = 3561
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

event itemchanged;this.accepttext()
if this.getcolumnname()="especialista" then
	string yy
	long ojo
	yy=this.getitemstring(1,'especialista')
	ojo=i_dw_espe.retrieve(yy)
	this.setitem(1,"cesp","")
end if
if this.getcolumnname()="tipoanestecia" then
	string nulo
	setnull(nulo)
	if this.getitemstring(1,'anest')='0' then
		if idw_anes.getitemstring(idw_anes.getrow(),'anestesiologo')='1' then
			this.modify("anestesiologo.visible='1'")
		else
			this.modify("anestesiologo.visible='0'")
			this.setitem(1,'anestesiologo',nulo)
		end if
	end if
end if
end event

event constructor;this.settransobject(sqlca)
this.getchild("cesp",i_dw_espe)
this.getchild('tipoanestecia',idw_anes)
idw_anes.settransobject(sqlca)
i_dw_espe.settransobject(sqlca)
i_dw_espe.insertrow(1)
end event

type gb_1 from groupbox within w_nuevo_proc_qx
integer x = 41
integer y = 1060
integer width = 3758
integer height = 896
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within w_nuevo_proc_qx
integer x = 37
integer y = 4
integer width = 3785
integer height = 900
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = styleraised!
end type

type sle_1 from singlelineedit within w_nuevo_proc_qx
event teclear pbm_keyup
integer x = 1810
integer y = 100
integer width = 1938
integer height = 88
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event teclear;filtrar()
end event

