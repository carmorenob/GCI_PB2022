$PBExportHeader$w_anula_fac.srw
forward
global type w_anula_fac from window
end type
type dw_electronica from uo_datawindow within w_anula_fac
end type
type dw_anul from datawindow within w_anula_fac
end type
type cbx_1 from checkbox within w_anula_fac
end type
type dw_anula from datawindow within w_anula_fac
end type
type st_1 from statictext within w_anula_fac
end type
type pb_2 from picturebutton within w_anula_fac
end type
type pb_1 from picturebutton within w_anula_fac
end type
type mle_1 from multilineedit within w_anula_fac
end type
type dw_1 from datawindow within w_anula_fac
end type
type gb_1 from groupbox within w_anula_fac
end type
type gb_2 from groupbox within w_anula_fac
end type
end forward

global type w_anula_fac from window
integer width = 3465
integer height = 1400
boolean titlebar = true
string title = "Anulación de facturas"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Warning!"
boolean clientedge = true
boolean center = true
dw_electronica dw_electronica
dw_anul dw_anul
cbx_1 cbx_1
dw_anula dw_anula
st_1 st_1
pb_2 pb_2
pb_1 pb_1
mle_1 mle_1
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_anula_fac w_anula_fac

type variables
st_anula anular
st_xa_anular st_anulacion
datawindowchild idw_tipofac
end variables

forward prototypes
public function integer lf_anu_rec (long nreci, string clug_rec)
public function integer lf_anu_fac (long nfact, string clug_fac, string tipo_fac, string tip_ingres, boolean borrar, long nfact_ref, string clug_ref, string tipo_ref)
end prototypes

public function integer lf_anu_rec (long nreci, string clug_rec);uo_datastore anula
anula=create uo_datastore
anula.dataobject='dw_anula_rec'
anula.settransobject(sqlca)
long j,rec,npagare=0
string clug,clug_pag
datetime ahora
datetime(today(),time(string(now())))
anula.retrieve(nreci,clug_rec)
for j=1 to anula.rowcount()
	if anula.getitemnumber(1,'narq')>0 then
		messagebox("Atención",'Hay recibos involucrados a los que ya se les hizo arqueo, no puede anular')
		return -1
	end if
	if not isnull(anula.getitemnumber(j,'npagare')) and anula.getitemnumber(j,'npagare')<>npagare then
		npagare=anula.getitemnumber(j,'npagare')
		clug_pag=anula.getitemstring(j,'clugar_pag')
		update tesopagarecab set estado='2', fecha_anula=:ahora where npagare=:npagare and clugar=:clug_pag;
		if sqlca.sqlcode<>0 then
			messagebox("Error actualizando estado de Pagare",sqlca.sqlerrtext)
			return -1
		end if
	end if
	rec=anula.getitemnumber(j,'nrcaj')
	clug=anula.getitemstring(j,'clugar')
	update serviciosingreso set nrcaj = null,clugar_rec=null where nrcaj=:rec and clugar_rec=:clug;
	if sqlca.sqlcode<>0 then
		messagebox("Error actualizando en Servicios Ingreso estado de recibo",sqlca.sqlerrtext)
		return -1
	end if
	
	anula.setitem(j,'estado',usuario)
	anula.setitem(j,'fecha_anula',ahora)
next
if anula.update()=-1 then return -1
return 1
end function

public function integer lf_anu_fac (long nfact, string clug_fac, string tipo_fac, string tip_ingres, boolean borrar, long nfact_ref, string clug_ref, string tipo_ref);long ciclo
datetime fecha
fecha=datetime(today(),now())
string contabil_entre
SELECT Min(sum_mvto_cab.contabil) into :contabil_entre
FROM sum_mvto_cab INNER JOIN sum_mvto_cpo ON (sum_mvto_cab.numdoc = sum_mvto_cpo.numdoc) AND (sum_mvto_cab.clugar = sum_mvto_cpo.clugar) AND (sum_mvto_cab.coddoc = sum_mvto_cpo.coddoc)
WHERE (((sum_mvto_cpo.clug_fac)=:clug_fac) AND ((sum_mvto_cpo.nfact)=:nfact) AND ((sum_mvto_cpo.TIPO_FAC)=:tipo_fac));
if sqlca.sqlcode=-1 then
	messagebox("Error revisando sum_mvto_cab para ver si ya fue contabilizada Linea 9",sqlca.sqlerrtext)
	return -1
end if

if contabil_entre='C' then 
	messagebox("Atención",'Una entrega de Medicamentos ya fue contabilizada no puede anular la factura')
	return -1
end if
update factcpo set contador=null,clugar_ser=null , nservicio=null 
WHERE (((factcpo.nfact)=:nfact) AND ((factcpo.clugar)=:clug_fac) AND ((factcpo.TIPO)=:tipo_fac));
if sqlca.sqlcode<>0 then
	messagebox("Error actualizando FactCpo",sqlca.sqlerrtext)
	return -1
end if
long j
if tip_ingres<>"1" then
	dw_anula.dataobject='dw_admis_defact'
	dw_anula.settransobject(sqlca)
	dw_anula.retrieve(nfact,clug_fac,tipo_fac)
	for j=1 to dw_anula.rowcount()
		dw_anula.setitem(j,'estado','2')
	next
	if dw_anula.update()=-1 then return -1
	delete from factadm where nfact=:nfact and clugar=:clug_fac and tipo=:tipo_fac;
	if sqlca.sqlcode<>0 then
		messagebox("Error Borrando de tabla FactAdm Linea 34",sqlca.sqlerrtext)
		return -1
	end if
end if
dw_anula.dataobject='dw_dismin_cont'
dw_anula.settransobject(sqlca)
if dw_anula.retrieve(nfact,clug_fac,tipo_fac)>0 then
	dw_anula.setitem(1,'acumulado',dw_anula.getitemnumber(1,'acumulado_ori') - dw_anula.getitemnumber(1,'vtemp'))
	if dw_anula.update()=-1 then return -1
end if
if not borrar then  // es factura global y debe actualizar recibos
	UPDATE tesorecajcpo SET nfact = Null, clugar_fac = Null, tipo_fac=null
	WHERE nfact=:nfact AND clugar_fac=:clug_fac AND tipo_fac=:tipo_fac;
	if sqlca.sqlcode<>0 then
		messagebox("Error actualizando la tabla Tesorecajcpo",sqlca.sqlerrtext)
		return -1
	end if
end if
real valor
long cons_soat,cuantos
string clug_soat
setnull(valor)
select valor,consecutivo,clugar into :valor,:cons_soat,:clug_soat from acumdeta where nfact=:nfact and clugar_fac=:clug_fac and tipo_fac=:tipo_fac;
if valor>0 then
	update acumcab set valor=valor -:valor,estado='1' where consecutivo=:cons_soat and clugar=:clug_soat;
	if sqlca.sqlcode<>0 then
		messagebox("Error actualizando AcumCab Linea 60",sqlca.sqlerrtext)
		return -1
	end if
	update acumdeta set estado='1' where nfact=:nfact and clugar_fac=:clug_fac and tipo_fac=:tipo_fac;
	if sqlca.sqlcode<>0 then
		messagebox("Error actualizando AcumDeta Linea 65",sqlca.sqlerrtext)
		return -1
	end if
end if
select count(contador) into :cuantos from serviciosingreso where nfactura=:nfact and clugar_fac=:clug_fac and tipo_fac=:tipo_fac;
if cuantos>0 and tip_ingres='1' and borrar and (nfact_ref=0 OR isnull(nfact_ref)) then
	if messagebox("Atención",'La factura '+string(nfact)+' ya fue atendida, desea borrar los servicios relacionados ?',question!,yesno!,2)=1 then
		setnull(cuantos)
		select count(ningreso)  into :cuantos from serviciosadx  where nfact=:nfact and clugar_fac=:clug_fac and tipo_fac=:tipo_fac;
		If cuantos>0 then 
			messagebox("Atención",'No puede  borrar los servicios relacionados atención de area de Apoyo Dx')
			return -1
		end if
		update serciosturno set contador=null, clugar_ser=null, nservicio_ingreso=null where nfact=:nfact and clugar_fac=:clug_fac;
		if sqlca.sqlcode=-1 then 
			messagebox("Error actualizando estado de Serciosturno Linea 80",sqlca.sqlerrtext)
			return -1
		end if
		long nnulo
		string snulo
		setnull(nnulo)
		setnull(snulo)
		dw_anula.dataobject='dw_anula_rescpo'
		dw_anula.settransobject(sqlca)
		if dw_anula.retrieve(nfact,clug_fac,tipo_fac)>0 then
			for j=1 to dw_anula.rowcount()
				dw_anula.setitem(j,'contador',nnulo)
				dw_anula.setitem(j,'clugar_ser',snulo)
				dw_anula.setitem(j,'nservicio',nnulo)
			next
			if dw_anula.update()=-1 then
				return -1
			end if
		end if
		update serviciosadx set estado='6' where nfact=:nfact and clugar_fac=:clug_fac and tipo_fac=:tipo_fac;
		if sqlca.sqlcode=-1 then 
			messagebox("Error Actualizando ServiciosAdx  Linea 101",sqlca.sqlerrtext)
			return -1
		end if
		delete from serving_insumo where nfactura=:nfact and clugar_fac=:clug_fac and tipo_fac=:tipo_fac;
		if sqlca.sqlcode=-1 then 
			messagebox("Error Borrando ServIng_Insumo Linea 106",sqlca.sqlerrtext)
			return -1
		end if
		//actualiza tratamiento para borrar servicios ingresp
		UPDATE odontratacpo SET contador = Null, clugar_his = Null, nservicio = Null,realizado = '0'
		FROM serviciosingreso INNER JOIN odontratacpo as odontratacpo_1   ON (serviciosingreso.Nservicio = odontratacpo_1.nservicio) AND (serviciosingreso.CLugar = odontratacpo_1.clugar_his) AND (serviciosingreso.Contador = odontratacpo_1.contador) 
		WHERE (((serviciosingreso.nfactura)=:nfact) AND ((serviciosingreso.clugar_fac)=:clug_fac) AND ((serviciosingreso.tipo_fac)=:tipo_fac));
		if sqlca.sqlcode=-1 then 
			messagebox("Error Actualizando Tratamiento logico desde borrar servicios linea 114",sqlca.sqlerrtext)
			return -1
		end if
		//actualiza vacunas para borrar servicios ingresp
		UPDATE VacunaDosis SET contador = Null, clugar_his = Null, nservicio = Null, realizado = '0'
		FROM ServiciosIngreso INNER JOIN VacunaDosis as VacunaDosis_1 ON (ServiciosIngreso.Nservicio = VacunaDosis_1.nservicio) AND (ServiciosIngreso.CLugar = VacunaDosis_1.clugar_his) AND (ServiciosIngreso.Contador = VacunaDosis_1.contador) 
		WHERE (((serviciosingreso.nfactura)=:nfact) AND ((serviciosingreso.clugar_fac)=:clug_fac) AND ((serviciosingreso.tipo_fac)=:tipo_fac));
		if sqlca.sqlcode=-1 then 
			messagebox("Error Actualizando Vacunas desde borrar servicios Linea 122",sqlca.sqlerrtext)
			return -1
		end if
		delete from serviciosingreso where nfactura=:nfact and clugar_fac=:clug_fac and tipo_fac=:tipo_fac;
	else
		update serving_insumo set nfactura = null,clugar_fac=null,tipo_fac=null,nitem_fac=null where nfactura=:nfact and clugar_fac=:clug_fac and tipo_fac=:tipo_fac;
		if sqlca.sqlcode=-1 then 
			messagebox("Error Actualizando ServIng_Insumo Linea 129",sqlca.sqlerrtext)
			return -1
		end if
		if tip_ingres='1' then 
			update serviciosingreso set nfactura = null,clugar_fac=null,tipo_fac=null,nitem_fac=null, cemp=null ,ccontrato=null  where nfactura=:nfact and clugar_fac=:clug_fac and tipo_fac=:tipo_fac;
		else
			update serviciosingreso set nfactura = null,clugar_fac=null,tipo_fac=null,nitem_fac=null  where nfactura=:nfact and clugar_fac=:clug_fac and tipo_fac=:tipo_fac;
		end if
	end if
else
	update serving_insumo set nfactura = null,clugar_fac=null,tipo_fac=null,nitem_fac=null where nfactura=:nfact and clugar_fac=:clug_fac and tipo_fac=:tipo_fac;
	if sqlca.sqlcode=-1 then 
		messagebox("Error Actualizando ServIng_Insumo Linea 141",sqlca.sqlerrtext)
		return -1
	end if
	 if nfact_ref=0 OR isnull(nfact_ref) then 
		if tip_ingres='1' then 
			update serviciosingreso set nfactura = null,clugar_fac=null,tipo_fac=null,nitem_fac=null, cemp=null ,ccontrato=null   where nfactura=:nfact and clugar_fac=:clug_fac and tipo_fac=:tipo_fac;
		else
			update serviciosingreso set nfactura = null,clugar_fac=null,tipo_fac=null,nitem_fac=null where nfactura=:nfact and clugar_fac=:clug_fac and tipo_fac=:tipo_fac;
		end if
	end if
end if
if sqlca.sqlcode<>0 then 
	messagebox("Error actualizando Servicios Ingreso Linea 153",sqlca.sqlerrtext)
	return -1
end if
//refacturar
if nfact_ref<>0 then
	if g_motor='postgres' then
		UPDATE SERVICIOSINGRESO SET NFACTURA = FACTCPO_1.NFACT, CLUGAR_FAC = FACTCPO_1.CLUGAR, TIPO_FAC = FACTCPO_1.TIPO, NITEM_FAC = FACTCPO_1.NITEM
		FROM FACTCPO  INNER JOIN FACTCPO AS FACTCPO_1 ON (FACTCPO.NITEM_REF = FACTCPO_1.NITEM) AND (FACTCPO.TIPO_REF = FACTCPO_1.TIPO) AND (FACTCPO.CLUGAR_REF = FACTCPO_1.CLUGAR) AND (FACTCPO.NFACT_REF = FACTCPO_1.NFACT) 
		WHERE (((FACTCPO.NFACT)=:nfact  ) AND ((FACTCPO.CLUGAR)=:clug_fac) AND ((FACTCPO.TIPO)=:tipo_fac))
		AND ((SERVICIOSINGRESO.NITEM_FAC = FACTCPO.NITEM) AND (SERVICIOSINGRESO.TIPO_FAC = FACTCPO.TIPO) AND (SERVICIOSINGRESO.CLUGAR_FAC = FACTCPO.CLUGAR) AND (SERVICIOSINGRESO.NFACTURA = FACTCPO.NFACT));
	else
		UPDATE SERVICIOSINGRESO SET NFACTURA = FACTCPO_1.NFACT, CLUGAR_FAC = FACTCPO_1.CLUGAR, TIPO_FAC = FACTCPO_1.TIPO, NITEM_FAC = FACTCPO_1.NITEM
		FROM (SERVICIOSINGRESO INNER JOIN FACTCPO ON (SERVICIOSINGRESO.NITEM_FAC = FACTCPO.NITEM) AND (SERVICIOSINGRESO.TIPO_FAC = FACTCPO.TIPO) AND (SERVICIOSINGRESO.CLUGAR_FAC = FACTCPO.CLUGAR) AND (SERVICIOSINGRESO.NFACTURA = FACTCPO.NFACT)) INNER JOIN FACTCPO AS FACTCPO_1 ON (FACTCPO.NITEM_REF = FACTCPO_1.NITEM) AND (FACTCPO.TIPO_REF = FACTCPO_1.TIPO) AND (FACTCPO.CLUGAR_REF = FACTCPO_1.CLUGAR) AND (FACTCPO.NFACT_REF = FACTCPO_1.NFACT) 
		WHERE (((FACTCPO.NFACT)=:nfact ) AND ((FACTCPO.CLUGAR)=:clug_fac) AND ((FACTCPO.TIPO)=:tipo_fac));
	end if
	if sqlca.sqlcode<>0 then
		messagebox("Error actualizando Refacturar Servicios Ingreso Linea 169",sqlca.sqlerrtext)
		return -1
	end if
	
	UPDATE RIPSRADICA_RESTA SET ESTADO = 'S'
	WHERE (((RIPSRADICA_RESTA.NFACT)=:nfact_ref) AND ((RIPSRADICA_RESTA.CLUGAR_FACT)=:clug_ref) AND ((RIPSRADICA_RESTA.TIPO_FACT)=:tipo_ref));
	if sqlca.sqlcode<>0 then
		messagebox("Error actualizando ripsradica_resta Linea 176",sqlca.sqlerrtext)
		return -1
	end if
end if
///
update serciosturno set nfact=null , clugar_fac=null,tipo_fac=null,nitem=null where nfact=:nfact and clugar_fac=:clug_fac and tipo_fac=:tipo_fac;
if sqlca.sqlcode<>0 then
	messagebox("Error actualizando SerciosTurno Linea 183",sqlca.sqlerrtext)
	return -1
end if
update serviciosadx set nfact=null,clugar_fac=null ,tipo_fac=null, nitem=null, cemp=null,ccontrato=null, cplan=null where nfact=:nfact and clugar_fac=:clug_fac and tipo_fac=:tipo_fac;
if sqlca.sqlcode<>0 then
	messagebox("Error actualizando Servicios ADX",sqlca.sqlerrtext)
	return -1
end if

UPDATE oscuerpo SET entregada = entregada - factcpo.cantidad
from factcpo 
WHERE 
	(((factcpo.nfact)=:nfact) AND ((factcpo.clugar)=:clug_fac) AND ((factcpo.tipo)=:tipo_fac) 
	AND ((oscuerpo.item = factcpo.item_os) AND (oscuerpo.nsolicitud = factcpo.nsolicitud_os) AND (oscuerpo.clugar = factcpo.clugar_os) 
	AND (oscuerpo.contador = factcpo.contador_os) )	);
if sqlca.sqlcode<>0 then
	messagebox("Error actualizando oscuerpo Linea 196",sqlca.sqlerrtext)
	return -1
end if

//update oscuerpo set nfact=null,clugar_fact=null,tipo_fact=null,nitem_fact=null where nfact=:nfact and clugar_fact=:clug_fac and tipo_fact=:tipo_fac;

update odontratacpo set nfact=null,clugar_fac=null,tipo_fac=null,item_fac=null 
where nfact=:nfact and clugar_fac=:clug_fac and tipo_fac=:tipo_fac ;
if sqlca.sqlcode<>0 then
	messagebox("Error actualizando OdontrataCpo Linea 208",sqlca.sqlerrtext)
	return -1
end if
UPDATE VacunaDosis SET realizado = '1', Nfact = Null, Clugar_Fac = Null,tipo_fac=null, Item_fact = Null
WHERE (((VacunaDosis.Nfact)=:nfact) AND ((VacunaDosis.Clugar_Fac)=:clug_fac) AND ((VacunaDosis.tipo_Fac)=:tipo_fac));
if sqlca.sqlcode<>0 then
	messagebox("Error actualizando Vacunadosis Linea 214",sqlca.sqlerrtext)
	return -1
end if

uo_datastore ds_dev_abono
ds_dev_abono=create uo_datastore
ds_dev_abono.dataobject='dw_devuelve_abonos'
ds_dev_abono.settransobject(sqlca)
if ds_dev_abono.retrieve(nfact,clug_fac,tipo_fac)>0 then
	ds_dev_abono.object.gastado.primary=ds_dev_abono.object.nuevo.primary
	if ds_dev_abono.update()=-1 then return -1
end if
commit; ////agrege
return 1
end function

on w_anula_fac.create
this.dw_electronica=create dw_electronica
this.dw_anul=create dw_anul
this.cbx_1=create cbx_1
this.dw_anula=create dw_anula
this.st_1=create st_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.mle_1=create mle_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.dw_electronica,&
this.dw_anul,&
this.cbx_1,&
this.dw_anula,&
this.st_1,&
this.pb_2,&
this.pb_1,&
this.mle_1,&
this.dw_1,&
this.gb_1,&
this.gb_2}
end on

on w_anula_fac.destroy
destroy(this.dw_electronica)
destroy(this.dw_anul)
destroy(this.cbx_1)
destroy(this.dw_anula)
destroy(this.st_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.mle_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;anular=message.powerobjectparm
dw_1.retrieve(anular.nfact,anular.clugar_fac,anular.tipo_fac)
end event

type dw_electronica from uo_datawindow within w_anula_fac
boolean visible = false
integer x = 1911
integer y = 516
integer width = 1317
integer height = 52
integer taborder = 40
boolean enabled = false
string dataobject = "dw_factura_electronica_postgres_anula"
end type

type dw_anul from datawindow within w_anula_fac
integer x = 23
integer y = 72
integer width = 1696
integer height = 84
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_anula"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
getchild('cod_anula',idw_tipofac)
idw_tipofac.settransobject(sqlca)
idw_tipofac.retrieve('FC')
dw_anul.insertrow(1)

end event

type cbx_1 from checkbox within w_anula_fac
integer x = 37
integer y = 556
integer width = 1079
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Anular solo una factura (La seleccionada)"
end type

event constructor;string l_anula
//RegistryGet ("HKEY_LOCAL_MACHINE\software\GCI", "anula_unafac", Regstring!, ojo)
SELECT cadena into :l_anula
FROM parametros_gen
WHERE (((codigo_para)=33));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 33')
end if


if l_anula="1" then
	checked=true
else
	checked=false
	visible=false
end if
end event

type dw_anula from datawindow within w_anula_fac
string tag = "se utiliza para x ejem anular de rescpo y/o hospadmi"
boolean visible = false
integer x = 59
integer y = 1296
integer width = 238
integer height = 56
integer taborder = 40
boolean enabled = false
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_anula_fac
integer x = 1874
integer y = 28
integer width = 1522
integer height = 316
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Se pueden anular varias facturas al tiempo si estas corresponden a la facturación de un mismo ingreso como ocurre en Hospitalización, en cuyo caso también se anulará el respectivo recibo.  Si es una factura global, unicamente se anulará la factura y no los recibos que puedan estar relacionados."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_anula_fac
integer x = 2030
integer y = 364
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_anula_fac
integer x = 1870
integer y = 360
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;if mle_1.text='' then
	messagebox("Atención","El motivo de la anulación no puede ser nulo")
	return
end if
long nfact,nreci,j,hasta,desde=1,nfact_ref
datetime ahora
string clug_fac,clug_rec,tipo_fac, clug_ref,tipo_ref
boolean anu_reci
if trim(dw_anul.getitemstring(dw_anul.getrow(),'cod_anula'))='' or isnull(dw_anul.getitemstring(dw_anul.getrow(),'cod_anula')) then 
	messagebox('Atención','Campo Motivo Obligatorio')
	return
end if
if dw_1.rowcount()=0 then return
if cbx_1.checked then
	if dw_1.getitemstring(dw_1.getrow(),'contabil')='C' then
		messagebox("Atención",'La facturas ya se encuentra contabilizad, no la puede anular')
		return
	end if
	if not isnull(dw_1.getitemnumber(dw_1.getrow(),'nradica')) then
		messagebox("Atención",'La factura ya se encuentra radicada, no la puede anular')
		return
	end if
	if not isnull(dw_1.getitemnumber(dw_1.getrow(),'estado_revisa')) and anular.de_donde='busca_fact' then
		messagebox('Atención','La factura ya fue revisada, no la puede anular desde aquí')
		return
	end if
else
	if upper(dw_1.getitemstring(1,'min_contabil'))='C' then
		messagebox("Atención",'Una o varias de las facturas ya se encuentran contabilizadas, no las puede anular')
		return
	end if
	if dw_1.getitemnumber(1,'max_nradica')>0 then
		messagebox("Atención",'Una o varias de las facturas ya se encuentran radicadas, no las puede anular')
		return
	end if
	if dw_1.getitemnumber(1,'max_est_revisa')>0 and anular.de_donde='busca_fact' then
		messagebox('Atención','Una o varias facturas ya fueron revisadas, no las puede anular desde aquí')
		return
	end if
end if

if dw_1.getitemnumber(1,'min_fac')=dw_1.getitemnumber(1,'max_fac') and dw_1.rowcount()>1 then 
	//factura global
	hasta=1
	setnull(nreci)
	setnull(clug_rec)
	anu_reci=false
else //una o varias facturas y puede tener un recibo
	anu_reci=true
	hasta=dw_1.rowcount()
	if not cbx_1.checked then
		if dw_1.getitemnumber(1,'max_arqueo')>0 then
			messagebox("Atención",'El recibo de caja ya se encuentra registrado en un arqueo, no se puede anular la(s) factura(s) ni el recibo')
			return
		end if
	else
		if not isnull(dw_1.getitemnumber(dw_1.getrow(),'narqueo')) then
			messagebox("Atención",'El recibo de caja ya se encuentra registrado en un arqueo, no se puede anular la(s) factura(s) ni el recibo')
			return
		end if
	end if
	nreci=dw_1.getitemnumber(1,'nrcaj')
	clug_rec=dw_1.getitemstring(1,'clugar_rec')
end if
if cbx_1.checked then
	desde=dw_1.getrow()
	hasta=desde
end if

for j=desde to hasta
	ahora=datetime(today(),time(string(now())))
	nfact=dw_1.getitemnumber(j,'nfact')
	clug_fac=dw_1.getitemstring(j,'clugar')
	tipo_fac=dw_1.getitemstring(j,'tipo')	
	nfact_ref=dw_1.getitemnumber(j,'nfact_ref')
	clug_ref=dw_1.getitemstring(j,'clugar_ref')
	tipo_ref=dw_1.getitemstring(j,'tipo_ref')	
	dw_1.setitem(j,'estado',usuario)
	dw_1.setitem(j,'fecha_anula',ahora)
	dw_1.setitem(j,'motivo_anula',mle_1.text)
	dw_1.setitem(j,'cod_anula',dw_anul.getitemstring(dw_anul.getrow(),'cod_anula'))
	if lf_anu_fac(nfact,clug_fac,tipo_fac,dw_1.getitemstring(1,'codtingre'),anu_reci,nfact_ref,clug_ref,tipo_ref)=-1 then
		rollback;
		return
	end if
	if j=1 and not isnull(nreci) and anu_reci then //anular recibo
		if lf_anu_rec(nreci,clug_rec)=-1 then
			rollback;
			return
		end if
	end if
	if f_anula_mov_kardex('FC',clug_fac,tipo_fac,nfact)=-1 then //solo anula movimientos si es de cons. externa
		rollback;												//porque una factura de Hosp/urg no mueve kardex
		return
	end if
	if dw_1.update()=-1 then
		rollback;
		return
	end if
	commit;

	
	nvo_factura_electronica u_elec
	st_ret_dian    lst_lle
	u_elec=create nvo_factura_electronica
	
	nfact=dw_1.getitemnumber(j,'nfact')
	clug_fac=dw_1.getitemstring(j,'clugar')
	tipo_fac=dw_1.getitemstring(j,'tipo')	
	string ls_j
	ls_j=dw_1.getitemstring(j,'estado_dian')
	ls_j=dw_1.getitemstring(j,'estado_dian_anul')
	if tipo_fac='F' and dw_1.getitemstring(j,'estado_dian')='1' and  isnull(dw_1.getitemstring(j,'estado_dian_anul')) then
		lst_lle=u_elec.sign_chilkat(dw_electronica,nfact,clug_fac,tipo_fac,0,'a','FV')
		if lst_lle.as_estado<>'1' then
			string ls_null
			datetime dtm_null
			
			setnull(ls_null)
			setnull(dtm_null)
			dw_1.setitem(j,'estado',ls_null)
			dw_1.setitem(j,'fecha_anula',dtm_null)
			dw_1.setitem(j,'motivo_anula',ls_null)
			dw_1.setitem(j,'cod_anula',ls_null)
		end if	
	end if
	
next

if dw_1.update()=-1 then
	rollback;
	return
end if
commit;

if isvalid(w_apoyo_diag2) then w_apoyo_diag2.dw_hist.event p_rowfocuschanged()
if isvalid(w_admision) then w_admision.dw_tingres.triggerevent(itemchanged!)
IF ISVALID(w_factura) then setnull(w_factura.i_nrecibo)
messagebox("Atención",'Factura(s) anulada(s)')
closewithreturn(parent,'1')
end event

type mle_1 from multilineedit within w_anula_fac
integer x = 27
integer y = 180
integer width = 1746
integer height = 300
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
boolean vscrollbar = true
boolean autovscroll = true
integer limit = 255
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type dw_1 from datawindow within w_anula_fac
integer x = 23
integer y = 620
integer width = 3333
integer height = 620
integer taborder = 40
string title = "none"
string dataobject = "dw_xa_anularfac"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type gb_1 from groupbox within w_anula_fac
integer y = 564
integer width = 3392
integer height = 704
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Las Siguientes Facturas y Recibo serán anulados:"
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within w_anula_fac
integer width = 1829
integer height = 520
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Motivo de la Anulación:"
borderstyle borderstyle = styleraised!
end type

