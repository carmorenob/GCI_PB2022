$PBExportHeader$uo_orden_formula_cost.sru
forward
global type uo_orden_formula_cost from userobject
end type
type sle_plant from singlelineedit within uo_orden_formula_cost
end type
type sle_kits from singlelineedit within uo_orden_formula_cost
end type
type sle_tiporep from singlelineedit within uo_orden_formula_cost
end type
type dw_obs from datawindow within uo_orden_formula_cost
end type
type sle_obs from singlelineedit within uo_orden_formula_cost
end type
type pb_banco from picturebutton within uo_orden_formula_cost
end type
type sle_otros from singlelineedit within uo_orden_formula_cost
end type
type dw_mvto_cpo from datawindow within uo_orden_formula_cost
end type
type dw_lote from datawindow within uo_orden_formula_cost
end type
type dw_sum_cab from datawindow within uo_orden_formula_cost
end type
type pb_np from picturebutton within uo_orden_formula_cost
end type
type pb_enf from picturebutton within uo_orden_formula_cost
end type
type dw_llevar from datawindow within uo_orden_formula_cost
end type
type cbx_banco from checkbox within uo_orden_formula_cost
end type
type dw_primerorden from datawindow within uo_orden_formula_cost
end type
type gb_1 from groupbox within uo_orden_formula_cost
end type
type pb_rn from picturebutton within uo_orden_formula_cost
end type
type pb_rip from picturebutton within uo_orden_formula_cost
end type
type pb_evol from picturebutton within uo_orden_formula_cost
end type
type dw_profe_atiende from datawindow within uo_orden_formula_cost
end type
type st_5 from statictext within uo_orden_formula_cost
end type
type st_respon from statictext within uo_orden_formula_cost
end type
type st_6 from statictext within uo_orden_formula_cost
end type
type pb_2 from picturebutton within uo_orden_formula_cost
end type
type dw_profe from datawindow within uo_orden_formula_cost
end type
type st_2 from statictext within uo_orden_formula_cost
end type
type cb_bus_diag from picturebutton within uo_orden_formula_cost
end type
type cb_borrorden from picturebutton within uo_orden_formula_cost
end type
type pb_abre from picturebutton within uo_orden_formula_cost
end type
type pb_ordenes from picturebutton within uo_orden_formula_cost
end type
type pb_new from picturebutton within uo_orden_formula_cost
end type
type dw_oscab from datawindow within uo_orden_formula_cost
end type
type tab_1 from tab within uo_orden_formula_cost
end type
type tp_1 from userobject within tab_1
end type
type pb_save_insumo from picturebutton within tp_1
end type
type st_1 from statictext within tp_1
end type
type pb_del_insumo from picturebutton within tp_1
end type
type pb_insert_insumo from picturebutton within tp_1
end type
type pb_1 from picturebutton within tp_1
end type
type sle_3 from singlelineedit within tp_1
end type
type dw_canasta from datawindow within tp_1
end type
type pb_ord from pb_report within tp_1
end type
type dw_oscuerpo from datawindow within tp_1
end type
type cb_12 from picturebutton within tp_1
end type
type cb_delserv from picturebutton within tp_1
end type
type cb_nvserv from picturebutton within tp_1
end type
type sle_1 from singlelineedit within tp_1
end type
type st_18 from statictext within tp_1
end type
type tp_1 from userobject within tab_1
pb_save_insumo pb_save_insumo
st_1 st_1
pb_del_insumo pb_del_insumo
pb_insert_insumo pb_insert_insumo
pb_1 pb_1
sle_3 sle_3
dw_canasta dw_canasta
pb_ord pb_ord
dw_oscuerpo dw_oscuerpo
cb_12 cb_12
cb_delserv cb_delserv
cb_nvserv cb_nvserv
sle_1 sle_1
st_18 st_18
end type
type tp_2 from userobject within tab_1
end type
type pb_for from pb_report within tp_2
end type
type dw_formula from datawindow within tp_2
end type
type cb_10 from picturebutton within tp_2
end type
type cb_adic from picturebutton within tp_2
end type
type cb_borra_med from picturebutton within tp_2
end type
type st_19 from statictext within tp_2
end type
type pb_med_ag from picturebutton within tp_2
end type
type sle_2 from singlelineedit within tp_2
end type
type tp_2 from userobject within tab_1
pb_for pb_for
dw_formula dw_formula
cb_10 cb_10
cb_adic cb_adic
cb_borra_med cb_borra_med
st_19 st_19
pb_med_ag pb_med_ag
sle_2 sle_2
end type
type tab_1 from tab within uo_orden_formula_cost
tp_1 tp_1
tp_2 tp_2
end type
type cb_nvorden from picturebutton within uo_orden_formula_cost
end type
end forward

global type uo_orden_formula_cost from userobject
integer width = 6971
integer height = 2528
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
sle_plant sle_plant
sle_kits sle_kits
sle_tiporep sle_tiporep
dw_obs dw_obs
sle_obs sle_obs
pb_banco pb_banco
sle_otros sle_otros
dw_mvto_cpo dw_mvto_cpo
dw_lote dw_lote
dw_sum_cab dw_sum_cab
pb_np pb_np
pb_enf pb_enf
dw_llevar dw_llevar
cbx_banco cbx_banco
dw_primerorden dw_primerorden
gb_1 gb_1
pb_rn pb_rn
pb_rip pb_rip
pb_evol pb_evol
dw_profe_atiende dw_profe_atiende
st_5 st_5
st_respon st_respon
st_6 st_6
pb_2 pb_2
dw_profe dw_profe
st_2 st_2
cb_bus_diag cb_bus_diag
cb_borrorden cb_borrorden
pb_abre pb_abre
pb_ordenes pb_ordenes
pb_new pb_new
dw_oscab dw_oscab
tab_1 tab_1
cb_nvorden cb_nvorden
end type
global uo_orden_formula_cost uo_orden_formula_cost

type variables
string i_codrep_formula , i_codrep_orden , i_coddiag , i_desdiag , i_codrips,i_triage_cla,l_tiporep
int ord_ser_item=0,l_temp_ord
boolean repord_dialogo , repfor_dialogo , repord_vprelim , repfor_vprelim , i_observacion,i_cambio_insumo
private long i_contador=-1 , i_norden , i_nh , i_nqx , i_consec_qx
private string i_clug_his , i_profe , i_indapdx , i_clug_hadm , i_est_hadm , i_cemp , i_ccont , i_tingre , i_clug_qx,i_alm,i_cdoc_cons='SC', s_esp
private string l_evo,l_usu,l_tpu, ori,profesi,l_enfe,ls_aordarea
datawindowchild idw_procs , idw_genericos , idw_insumo, idw_finproc,idw_profe,idw_profeat
end variables
forward prototypes
public function integer reset ()
public function long insert_proc (string p_codigo, integer p_cant)
public function long insert_proc (string p_codigo, integer p_cant, long p_ntrat, string p_clug_tto, integer p_item_tto)
public subroutine cambia_diags (string p_cdiag)
public function integer init (string p_indapdx)
public function integer rn ()
public subroutine revi_est_ord ()
public function long insert_proc_banco (string p_codigo, integer p_cant, string p_banco, string p_ctipoemp, string p_desc_tipo)
public function long insert_insum (string p_codigo, integer p_cant)
protected function long insert_med (string p_codigo, integer p_cant)
public function integer retrieve (long contador, string clugar_his, string p_profe, long p_nh, string p_clug_hadm, string p_tingre, long p_nqx, string p_clug_qx, long p_consec_qx, string p_cesp)
end prototypes

public function integer reset ();if dw_oscab.accepttexT()=-1 then return -1
if tab_1.tp_1.dw_oscuerpo.accepttexT()=-1 then return -1
if tab_1.tp_2.dw_formula.accepttexT()=-1 then return -1
dw_oscab.reset()
tab_1.tp_1.dw_oscuerpo.reset()
tab_1.tp_2.dw_formula.reset()
i_contador=-1
setnull(s_esp )
return 1
end function

public function long insert_proc (string p_codigo, integer p_cant);if i_contador = -1 then return -1
long filac,fila,nserv1,j
string err,l_ori
choose case i_tingre
	case '1'
		if dw_oscab.rowcount()=0 then
			filac=dw_oscab.insertrow(0)
			dw_oscab.setitem(filac,"contador",i_contador)
			dw_oscab.setitem(filac,"clugar",i_clug_his)
			dw_oscab.setitem(filac,"usuario",usuario)
			dw_oscab.setitem(filac,"codprof",i_profe)
			SELECT Max(NSolicitud) into :nserv1
			FROM OSCabeza
			WHERE OSCabeza.Contador=:i_contador and clugar=:i_clug_his;
			if sqlca.sqlcode=-1 then return -1
			if isnull(nserv1) then nserv1=0
			nserv1++
			i_norden=nserv1
			dw_oscab.setitem(filac,"nsolicitud",nserv1)
			sqlca.autocommit=true
			if dw_oscab.update()<1 then
				sqlca.autocommit=false
				dw_oscab.deleterow(filac)
				return -1
			end if
			sqlca.autocommit=false
		end if
		str_proc stp
		stp=f_busca_cups(p_codigo,w_principal.dw_1.getitemstring(1,'sexo'),w_principal.dw_1.getitemnumber(1,'dias'),'1')
		if isnull(stp.descripcion) then 
			text=''
			return -1
		end if
		long cuenta,i
		fila=tab_1.tp_1.dw_oscuerpo.insertrow(0)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"contador",i_contador)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"clugar",i_clug_his)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"nsolicitud",i_norden)
		SELECT Max(item) into :i FROM oscuerpo WHERE contador=:i_contador and clugar=:i_clug_his and nsolicitud=:i_norden;
		if isnull(i) then i=0
		i++
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"item",i)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,'examen',stp.descripcion)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,'codproced',stp.cproc)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,'cod_cups',stp.cups)
		if p_cant>1 then tab_1.tp_1.dw_oscuerpo.setitem(fila,'solicitada',p_cant)
		if tab_1.tp_1.dw_oscuerpo.update()=-1 then
			tab_1.tp_1.dw_oscuerpo.deleterow(fila)
			return -1
		end if
		tab_1.tp_1.dw_oscuerpo.setcolumn('solicitada')
		if not isnull(stp.cod_tsubempaq) then
			tab_1.tp_1.dw_oscuerpo.setitem(fila,'cod_tsubempaq',stp.cod_tsubempaq)	
			tab_1.tp_1.dw_oscuerpo.setitem(fila,'cod_banco',stp.cod_banco)	
			tab_1.tp_1.dw_oscuerpo.setitem(fila,'descrip_tipo',stp.descrip_tipo)	
			dw_oscab.setitem(filac,"fecha_reserva",datetime(today(),now()))
		end if
				
	case '2','3','4','7'
		string estado,areaadx
		if i_est_hadm<>"1" and i_est_hadm<>'R' then
			Messagebox("Atención","No se puede agregar procedimientos ya que la admisión no está activa")
			return -1
		end if
		if dw_oscab.rowcount()=0 then return -1
		l_ori=dw_oscab.getitemstring(dw_oscab.getrow(),"origen")
		estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
		if (estado="2" or estado="3" or estado="4") /*and dw_oscab.getitemstring(dw_oscab.getrow(),"tipo_orden")<>'C'*/ then
			Messagebox("Atención","Esta orden de servicio ya está completa o anulada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
			return -1
		end if
		string plan,emp,contrato,agrup,banco,revisa,xl_profe
		long nserv,cuantos,l_nsol1,l_item1
		str_proc str
		
		if isnull(l_tpu) or l_tpu='' then
			xl_profe=dw_oscab.getitemstring(dw_oscab.getrow(),'codprof')
			
			select profe.usuario,evoluciona,tipo,profe.enfermero into :l_usu,:l_evo,:l_tpu,:l_enfe FROM profe left join usuarios ON profe.usuario= usuarios.usuario where codprof=:xl_profe;
		end if
		
		str=f_busca_cups(p_codigo,w_principal.dw_1.getitemstring(1,'sexo'),w_principal.dw_1.getitemnumber(1,'dias'),'1')
		if isnull(str.descripcion) then return -1
		
		select oscabeza.nsolicitud, oscuerpo.item into :l_nsol1,:l_item1
		FROM (oscabeza INNER JOIN oscuerpo ON (oscabeza.contador = oscuerpo.contador) AND (oscabeza.clugar = oscuerpo.clugar) AND (oscabeza.nsolicitud = oscuerpo.nsolicitud)) INNER JOIN proced ON oscuerpo.codproced = proced.codproced
		where (((oscabeza.contador)=:i_contador) and ((oscabeza.clugar)=:i_clug_his) and ((oscuerpo.estado) in ('1','2')) and ((proced.urg)='1') AND ((proced.codproced)=:str.cproc) );
		if l_nsol1>0 then
			messagebox('Atención','Este procedimiento ya fue cargado en la Orden '+string(l_nsol1)+' item '+string(l_item1))
			return -1
		end if
		
		if str.agrupser='04' and i_indapdx='Q' then
			messagebox('Atención','Este es un procedimiento quirúrgico, no lo puede cargar por orden de servicio')
			return -1
		end if
		
		 if l_tpu<>'F' then  
			if l_evo='0'  and  not isvalid(w_evolucion_new) then
				if l_tpu='U' then
					Messagebox("Atención","El profesional que eligió no tiene permiso agregar procedimientos a la orden debe hacerlo desde evoluciones")
					return -1
				end if
			end if
			
			if (str.agrupser<>'14' and str.agrupser<>'06') and l_tpu='A'  then
				Messagebox("Atención","Esta eligiendo productos que no tiene permiso agregar a la orden debe hacerlo desde evoluciones")
				return -1
			end if
		end if
		if not isnull(dw_oscab.getitemstring(dw_oscab.getrow(),'cod_banco')) then
			banco=dw_oscab.getitemstring(dw_oscab.getrow(),'cod_banco')
			SELECT Min(cod_empaque) into :revisa
			FROM banco_producto
			WHERE banco_producto.cod_banco=:banco AND banco_producto.codproced=:str.cproc;
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox('Error leyendo banco_producto',err)
				return -1
			end if
			if isnull(revisa) or revisa='' then
				messagebox('Atención','Este procedimiento no se encuentra configurado para este banco')
				return -1
			end if
		end if
		if isnull(str.rips) then str.rips="10"
		setnull(nserv)
		SELECT count(item) into :nserv FROM oscuerpo 
		WHERE contador=:i_contador and clugar=:i_clug_his and nsolicitud=:i_norden and codproced=:str.cproc;
		if nserv>0 then
			rollback;
			messagebox('Atención',' Ya cargo este producto en esta orden favor verifique')
			return -1	
		end if
		setnull(nserv)
		SELECT Max(item) into :nserv FROM oscuerpo 
		WHERE contador=:i_contador and clugar=:i_clug_his and nsolicitud=:i_norden;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox('Error leyendo oscuerpo',err)
			return -1
		end if
		if isnull(nserv) then nserv=0
		nserv++
		fila=tab_1.tp_1.dw_oscuerpo.insertrow(0)
		tab_1.tp_1.dw_oscuerpo.scrolltorow(fila)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"codproced",str.cproc)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"cod_cups",str.cups)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"descripcion",str.descripcion)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"codaadx",str.codadx)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"rips",str.rips)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"agrupser",str.agrupser)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"item",nserv)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"contador",i_contador)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"clugar",i_clug_his)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"nsolicitud",i_norden)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,'observaciones',sle_otros.text)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"tiempo_cirugia",str.tiempoqx)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"origen",l_ori)
		if not isnull(str.cod_tsubempaq) then
			tab_1.tp_1.dw_oscuerpo.setitem(fila,'cod_tsubempaq',str.cod_tsubempaq)	
			tab_1.tp_1.dw_oscuerpo.setitem(fila,'cod_banco',str.cod_banco)	
			tab_1.tp_1.dw_oscuerpo.setitem(fila,'descrip_tipo',stp.descrip_tipo)	
			dw_oscab.setitem(dw_oscab.getrow(),"fecha_reserva",datetime(today(),now()))
		end if
	
		if str.especial='1' then
			string i_cespex
			if isnull(str.codesp) or str.codesp='' then
				if not isnull(sle_otros.tag) and  sle_otros.tag <>'' then 
					select sla into : i_cespex from especialidades where codesp=:sle_otros.tag;
					if  i_cespex='1' then 
						i_cespex=sle_otros.tag
						sle_otros.tag =''
					else		
						setnull(i_cespex)
						openwithparm(w_escog_especialidad_pro,i_cespex)
						i_cespex=message.stringparm
					end if
				else
					setnull(i_cespex)
					openwithparm(w_escog_especialidad_pro,i_cespex)
					i_cespex=message.stringparm
				end if
			else
				i_cespex=str.codesp
			end if
			tab_1.tp_1.dw_oscuerpo.setitem(fila,'cesp',i_cespex)
		end if
		
		long cant
		cant=p_cant
		if p_cant>1 and str.agrupser='04' then cant=1
		if str.agrupser='04' then
			openwithparm(w_orden_qx,tab_1.tp_1.dw_oscuerpo)
		end if
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"solicitada",cant)
		if tab_1.tp_1.dw_oscuerpo.update(true,false)<1 then
			tab_1.tp_1.dw_oscuerpo.deleterow(fila)	
		end if
		if dw_oscab.update(true,false)<1 then
			dw_oscab.deleterow(fila)
			return -1
		end if
		commit;
		j=idw_procs.insertrow(0)
		idw_procs.setitem(j,'contador',i_contador)		
		idw_procs.setitem(j,'clugar',i_clug_his)
		idw_procs.setitem(j,'nsolicitud',i_norden)
		idw_procs.setitem(j,'item',nserv)
		idw_procs.setitem(j,'codproced',str.cproc)
		idw_procs.setitem(j,'descripcion',str.descripcion)
		idw_procs.setitem(j,'agrupser',str.agrupser)
		idw_procs.setitem(j,'especial',str.especial)
		
		if str.pos='0' then 
			string l_nopos
		
			SELECT cadena into :l_nopos
			FROM parametros_gen
			WHERE (((codigo_para)=42));
			if sqlca.sqlnrows=0 then
				messagebox('Atencíon','No hay parametro 42')
				return -1
			end if
			
			Inet linet
			GetContextService("Internet", linet)
			linet.HyperlinkToURL(l_nopos)
		end if		
		
		tab_1.tp_1.dw_oscuerpo.event rowfocuschanged(fila)
		tab_1.tp_1.dw_oscuerpo.setcolumn("solicitada")
		tab_1.tp_1.dw_oscuerpo.setfocus()
		tab_1.tp_1.dw_oscuerpo.resetupdate()
		tab_1.tp_1.dw_canasta.resetupdate()
end choose
return fila
end function

public function long insert_proc (string p_codigo, integer p_cant, long p_ntrat, string p_clug_tto, integer p_item_tto);long fila
fila=insert_proc(p_codigo,p_cant)
if fila=-1 then return -1
tab_1.tp_1.dw_oscuerpo.setitem(fila,'ntratamiento',p_ntrat)
tab_1.tp_1.dw_oscuerpo.setitem(fila,'clugar_tto',p_clug_tto)
tab_1.tp_1.dw_oscuerpo.setitem(fila,'item_tto',p_item_tto)
if tab_1.tp_1.dw_oscuerpo.update()=-1 then
	tab_1.tp_1.dw_oscuerpo.deleterow(fila)
	return -1
else
	return fila
end if

end function

public subroutine cambia_diags (string p_cdiag);i_coddiag=p_cdiag
long j
select desdiag,cod_rips into :i_desdiag,:i_codrips
from diags where codgeral=:i_coddiag;
for j=1 to dw_oscab.rowcount()
	dw_oscab.setitem(j,'diagnostico',i_desdiag)
	dw_oscab.setitem(j,'cod_rips',i_codrips)
	dw_oscab.setitem(j,'codgeral',i_coddiag)
next
dw_oscab.update()
commit;
end subroutine

public function integer init (string p_indapdx);i_indapdx=p_indapdx
choose case p_indapdx
	case '0' //consultorio
		tab_1.tp_2.dw_formula.dataobject='dw_oscpo_form_cext'
		tab_1.tp_2.dw_formula.settransobject(sqlca)
		dw_oscab.dataobject='dw_oscabeza'
		dw_oscab.settransobject(sqlca)
		tab_1.tp_1.dw_oscuerpo.dataobject='dw_oscpo_cext'
		tab_1.tp_1.dw_oscuerpo.settransobject(sqlca)
		gb_1.x=4
		gb_1.resize(3461,424)
		st_2.visible=false
		dw_profe.visible=false
		pb_abre.visible=false
		pb_ordenes.visible=false
		dw_oscab.move(24,52)
		dw_oscab.resize(3200,352)
		cb_nvorden.move(3310,40)
		cb_nvorden.originalsize=true
		cb_borrorden.move(3310,164)
		cb_borrorden.originalsize=true
		cb_bus_diag.move(3310,288)
		cb_bus_diag.originalsize=true
		st_6.visible=false
		st_respon.visible=false
		st_5.visible=false
		dw_profe_atiende.visible=false
		pb_new.visible=false
		pb_evol.visible=false
		pb_rip.visible=false
		pb_enf.visible=false
		f_titulos_dw_gb(dw_profe,'COEX',gb_1)	
	case '1' //apdx
	case '2', '3' , '4','7'
		SELECT cadena into :ls_aordarea
		FROM parametros_gen
		WHERE (((codigo_para)=80));
		if sqlca.sqlnrows=0 then
			ls_aordarea='0'
		end if
		//cbx_banco.visible=true
		tab_1.tp_1.cb_nvserv.enabled=false
		tab_1.tp_2.cb_adic.enabled=false
		dw_oscab.dataobject='dw_oscab_hadm'
		dw_oscab.settransobject(sqlca)
		tab_1.tp_1.dw_oscuerpo.dataobject='dw_oscpo_hadm'
		tab_1.tp_1.dw_oscuerpo.settransobject(sqlca)
		tab_1.tp_2.dw_formula.dataobject='dw_oscpo_form_hadm'
		tab_1.tp_2.dw_formula.settransobject(sqlca)
		cb_bus_diag.visible=false
		tab_1.move(5,740)
		dw_oscab.resize(3817,504)
		dw_oscab.move(3063,184)
		f_titulos_dw_gb(dw_profe,'ATOS',gb_1)
		gb_1.resize(3886,720)
		gb_1.move(3031,4)
		st_2.move(3054,80)
		dw_profe.move(3365,68)
	case '5' //odonto
	case '6' //pyp
	case 'Q' //qx
	//	cbx_banco.visible=true
		dw_oscab.dataobject='dw_oscab_qx'
		dw_oscab.settransobject(sqlca)
		tab_1.tp_1.dw_oscuerpo.dataobject='dw_oscpo_hadm'
		tab_1.tp_1.dw_oscuerpo.settransobject(sqlca)
		tab_1.tp_2.dw_formula.dataobject='dw_oscpo_form_hadm'
		tab_1.tp_2.dw_formula.settransobject(sqlca)
		cb_bus_diag.visible=false
		st_2.move(1738,0)
		cb_nvorden.move(4300,30)
		cb_borrorden.move(4300,155)		
		pb_abre.visible=false	
		pb_ordenes.visible=false
		dw_profe.resize(1545,84)
		dw_profe.move(2050,0)
		cbx_banco.move(3643, 0)	
		gb_1.x=970
		gb_1.resize(3278,480)
		dw_oscab.resize(3186,360)
		dw_oscab.move(987,104)
		pb_2.y -=230
		st_6.y -=230
		st_respon.y -=230
		st_5.y -=230
		dw_profe_atiende.y -=230
		pb_new.y -=230
		pb_evol.y -=230
		pb_enf.y -=230
		tab_1.move(0,380)
		gb_1.text='Ordenes de Servicio del ProcQx.'
		tab_1.tp_1.dw_oscuerpo.height -=140
		tab_1.tp_2.dw_formula.height -=140
		tab_1.tp_1.pb_insert_insumo.y -=140
		tab_1.tp_1.pb_save_insumo.y -=140
		tab_1.tp_1.st_1.y -=140
		tab_1.tp_1.sle_3.y -=140
		tab_1.tp_1.pb_1.y -=140
		tab_1.tp_1.pb_del_insumo.y -=140
		tab_1.tp_1.dw_canasta.y -=140
end choose
return 1
end function

public function integer rn ();string esparto
setnull(esparto)
SELECT Max(proced.parto)  INTO :esparto
FROM ServiciosIngreso INNER JOIN Proced ON ServiciosIngreso.cproced = Proced.CodProced
WHERE ServiciosIngreso.Contador=:i_contador AND ServiciosIngreso.CLugar=:i_clug_his;
IF SQLCA.SQLCODE=-1 THEN 
	messagebox("Error leyendo proced",sqlca.sqlerrtext)
	return -1
end if
if not isnull(esparto) and esparto='1' and w_principal.dw_1.getitemstring(1,"sexo")='F' then
	pb_rn.visible=true
	pb_rn.enabled=true
else
	pb_rn.visible=false
	pb_rn.enabled=false
end if
return 1
end function

public subroutine revi_est_ord ();long j
int esta=0,esta1=0 

//string torden
//SELECT OSCabeza.tipo_orden into :torden
//FROM OSCabeza
//WHERE OSCabeza.Contador=:i_contador AND OSCabeza.clugar=:i_clug_his
//AND OSCabeza.NSolicitud=:i_norden;
//if sqlca.sqlcode=-1 then
//	messagebox("Error leyendo oscabeza",sqlca.sqlerrtext)
//	rollback;
//	return
//end if

select count(item) into :j from oscuerpo 
where contador=:i_contador and clugar=:i_clug_his and nsolicitud=:i_norden
and estado='1';//sin atender

if j=0  then
	if dw_oscab.getitemstring(dw_oscab.getrow(),'estado')='1' and (tab_1.tp_1.dw_oscuerpo.rowcount()>0 or tab_1.tp_2.dw_formula.rowcount()>0) then
		dw_oscab.setitem(dw_oscab.getrow(),'estado','2')//completa
	end if
else
	if dw_oscab.getitemstring(dw_oscab.getrow(),'estado')='2'  or dw_oscab.getitemstring(dw_oscab.getrow(),'estado')='4' then
		dw_oscab.setitem(dw_oscab.getrow(),'estado','1')
	end if
end if

for j=1 to tab_1.tp_1.dw_oscuerpo.rowcount()
   	if (tab_1.tp_1.dw_oscuerpo.getitemnumber(j,"solicitada")- tab_1.tp_1.dw_oscuerpo.getitemnumber(j,"suministrada"))<>0 then 
			if  tab_1.tp_1.dw_oscuerpo.getitemstring(j,"estado")='4' then esta++
	end if
next

//select sum(oscuerpo.entregada- oscuerpo.suministrada-oscuerpo.DEVUELTA) into :j from oscuerpo 
//where contador=:i_contador and clugar=:i_clug_his and nsolicitud=:i_norden
//AND c_medica Is Not Null;//medicamentos
//if j=0 or isnull(j) then	esta1=1
//if esta>0 and esta1=1 then
//	dw_oscab.setitem(dw_oscab.getrow(),'estado','4')//completa
//end if

for j=1 to tab_1.tp_2.dw_formula.rowcount()
//   	if (tab_1.tp_2.dw_formula.getitemnumber(j,"solicitada")- tab_1.tp_2.dw_formula.getitemnumber(j,"suministrada"))<>0 then 
   	if (tab_1.tp_2.dw_formula.getitemnumber(j,"devuelta"))<>0 then 
			//if  tab_1.tp_1.dw_oscuerpo.getitemstring(j,"estado")='4' then esta++
			dw_oscab.setitem(dw_oscab.getrow(),'estado','4')
	end if
next

sqlca.autocommit=true
if dw_oscab.update()=-1 then 
	rollback;
else
	commit;
end if
sqlca.autocommit=false
end subroutine

public function long insert_proc_banco (string p_codigo, integer p_cant, string p_banco, string p_ctipoemp, string p_desc_tipo);long fila
fila=insert_proc(p_codigo,p_cant)
if fila=-1 then return -1
tab_1.tp_1.dw_oscuerpo.setitem(fila,'cod_tsubempaq',p_ctipoemp)
tab_1.tp_1.dw_oscuerpo.setitem(fila,'cod_banco',p_banco)
tab_1.tp_1.dw_oscuerpo.setitem(fila,'descrip_tipo',p_desc_tipo)
if tab_1.tp_1.dw_oscuerpo.update()=-1 then
	tab_1.tp_1.dw_oscuerpo.deleterow(fila)
	return -1
else
	return fila
end if

end function

public function long insert_insum (string p_codigo, integer p_cant);if i_contador = -1 then return -1
long fila,nserv1,i,k
string estado
choose case i_tingre
	case '1'
		if dw_oscab.rowcount()=0 then
			fila=dw_oscab.insertrow(0)
			dw_oscab.setitem(fila,"contador",i_contador)
			dw_oscab.setitem(fila,"clugar",i_clug_his)
			dw_oscab.setitem(fila,"usuario",usuario)
			dw_oscab.setitem(fila,"codprof",i_profe)
			SELECT Max(NSolicitud) into :nserv1
			FROM OSCabeza
			WHERE OSCabeza.Contador=:i_contador and clugar=:i_clug_his;
			if sqlca.sqlcode=-1 then return -1
			if isnull(nserv1) then nserv1=0
			nserv1++
			i_norden=nserv1
			dw_oscab.setitem(fila,"nsolicitud",nserv1)
			sqlca.autocommit=true
			if dw_oscab.update()<1 then
				sqlca.autocommit=false
				dw_oscab.deleterow(fila)
				return -1
			end if
			sqlca.autocommit=false
		end if
		
		st_med stm
		stm=f_busca_med(p_codigo)
		if isnull(stm.medicamento) then return -1
		
		fila=tab_1.tp_2.dw_formula.insertrow(0)
		tab_1.tp_2.dw_formula.setitem(fila,"contador",i_contador)
		tab_1.tp_2.dw_formula.setitem(fila,"clugar",i_clug_his)
		tab_1.tp_2.dw_formula.setitem(fila,"nsolicitud",i_norden)
		SELECT Max(item) into :i FROM oscuerpo WHERE contador=:i_contador and clugar=:i_clug_his and nsolicitud=:i_norden;
		if isnull(i) then i=0
		i++
		tab_1.tp_2.dw_formula.setitem(fila,"item",i)
		tab_1.tp_2.dw_formula.setitem(fila,"c_medica",stm.cmedica)
		tab_1.tp_2.dw_formula.setitem(fila,"medicamento",stm.medicamento)
		tab_1.tp_2.dw_formula.setitem(fila,"presentacion",stm.formaf)
		tab_1.tp_2.dw_formula.setitem(fila,"pos",stm.pos)
		if p_cant>1 then tab_1.tp_2.dw_formula.setitem(fila,'solicitada',p_cant)
		if tab_1.tp_2.dw_formula.update()=-1 then
			tab_1.tp_2.dw_formula.deleterow(fila)
			return -1
		else
			tab_1.tp_2.dw_formula.setcolumn('solicitada')
			return fila
		end if
	case '2','3','4','7'
		if i_est_hadm<>"1" and i_est_hadm<>'R' then
			Messagebox("Atención","No se puede agregar medicamentos ya que la admisión no está activa")
			return -1
		end if
		if dw_oscab.rowcount()=0 then return -1
		if dw_oscab.getitemstring(dw_oscab.getrow(),"tipo_orden")<>'C' then
			dw_oscab.scrolltorow(dw_oscab.find('tipo_orden="C"',1,dw_oscab.rowcount()))
		end if
		if tab_1.tp_1.dw_oscuerpo.getitemstring(tab_1.tp_1.dw_oscuerpo.getrow(),'estado')<>'C' then
			tab_1.tp_1.dw_oscuerpo.scrolltorow(tab_1.tp_1.dw_oscuerpo.find('estado="C"',1,tab_1.tp_1.dw_oscuerpo.rowcount()))
		end if
		estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
		if (estado="2" or estado="3" or estado="4") /*and dw_oscab.getitemstring(dw_oscab.getrow(),"tipo_orden")<>'C'*/ then
			Messagebox("Atención","Esta orden de servicio ya está completa o anulada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
			return -1
		end if
		string codproc,desproc,rips,tipoproc,plan,emp,contrato,pos
		long nserv
		
		SELECT SUMGENERICO.codgenerico, SUMGENERICO.descripcion, medicamentos.RIPS, SUMGENERICO.POS
		into :codproc, :desproc ,:rips,:pos
		FROM medicamentos INNER JOIN SUMGENERICO ON medicamentos.c_medica = SUMGENERICO.c_medica
		WHERE (((SUMGENERICO.codgenerico)=:p_codigo) AND ((SUMGENERICO.MEDICAMENTO)='1'));
		
		if isnull(codproc) or codproc="" then 
			messagebox("Atención","Medicamento no existe o no está activo")
			return -1
		else
			if l_tpu<>'F' then  
				if not isvalid(w_evolucion_new) then return 0
			end if
			fila=tab_1.tp_1.dw_canasta.insertrow(0)
			tab_1.tp_1.dw_canasta.setitem(fila,"codgenerico",codproc)
			tab_1.tp_1.dw_canasta.setitem(fila,"descripcion",desproc)
			tab_1.tp_1.dw_canasta.setitem(fila,"pos",pos)
			tab_1.tp_1.dw_canasta.setitem(fila,"item",tab_1.tp_1.dw_oscuerpo.getitemnumber(tab_1.tp_1.dw_oscuerpo.getrow(),'item'))
			for k=fila to 1 step -1
				if tab_1.tp_1.dw_canasta.find('secuencia='+string(k),1,tab_1.tp_1.dw_canasta.rowcount())=0 then exit
			next
			tab_1.tp_1.dw_canasta.setitem(fila,'secuencia',k)
			tab_1.tp_1.dw_canasta.setitem(fila,"nsolicitud",i_norden)
			tab_1.tp_1.dw_canasta.setitem(fila,"contador",i_contador)
			tab_1.tp_1.dw_canasta.setitem(fila,"clugar",i_clug_his)
			tab_1.tp_1.dw_canasta.setitem(fila,"solicitada",p_cant)
			if tab_1.tp_2.dw_formula.update()<1 then
				tab_1.tp_2.dw_formula.deleterow(fila)	
				rollback;
				return -1
			else
				commit;
				tab_1.tp_1.dw_canasta.scrolltorow(fila)
				tab_1.tp_1.dw_canasta.setcolumn("solicitada")
				tab_1.tp_1.dw_canasta.setfocus()
			end if
			return fila
		end if
end choose

end function

protected function long insert_med (string p_codigo, integer p_cant);if i_contador = -1 then return -1
long fila,nserv1,i,k
string estado,l_tipoo,l_ori

choose case i_tingre
	case '1'
		if dw_oscab.rowcount()=0 then
			fila=dw_oscab.insertrow(0)
			dw_oscab.setitem(fila,"contador",i_contador)
			dw_oscab.setitem(fila,"clugar",i_clug_his)
			dw_oscab.setitem(fila,"usuario",usuario)
			dw_oscab.setitem(fila,"codprof",i_profe)
			SELECT Max(NSolicitud) into :nserv1
			FROM OSCabeza
			WHERE OSCabeza.Contador=:i_contador and clugar=:i_clug_his;
			if sqlca.sqlcode=-1 then return -1
			if isnull(nserv1) then nserv1=0
			nserv1++
			i_norden=nserv1
			dw_oscab.setitem(fila,"nsolicitud",nserv1)
			sqlca.autocommit=true
			if dw_oscab.update()<1 then
				sqlca.autocommit=false
				dw_oscab.deleterow(fila)
				return -1
			end if
			sqlca.autocommit=false
		end if
		
		st_med stm
		stm=f_busca_med(p_codigo)
		if isnull(stm.medicamento) then return -1
		fila=tab_1.tp_2.dw_formula.insertrow(0)
		tab_1.tp_2.dw_formula.setitem(fila,"contador",i_contador)
		tab_1.tp_2.dw_formula.setitem(fila,"clugar",i_clug_his)
		tab_1.tp_2.dw_formula.setitem(fila,"nsolicitud",i_norden)
		SELECT Max(item) into :i FROM oscuerpo WHERE contador=:i_contador and clugar=:i_clug_his and nsolicitud=:i_norden;
		if isnull(i) then i=0
		i++ 
		tab_1.tp_2.dw_formula.setitem(fila,"item",i)
		tab_1.tp_2.dw_formula.setitem(fila,"c_medica",stm.cmedica)
		tab_1.tp_2.dw_formula.setitem(fila,"medicamento",stm.medicamento)
		tab_1.tp_2.dw_formula.setitem(fila,"presentacion",stm.formaf)
		tab_1.tp_2.dw_formula.setitem(fila,"pos",stm.pos)
		if p_cant>1 then tab_1.tp_2.dw_formula.setitem(fila,'solicitada',p_cant)
		if tab_1.tp_2.dw_formula.update()=-1 then
			tab_1.tp_2.dw_formula.deleterow(fila)
			return -1
		else
			tab_1.tp_2.dw_formula.setcolumn('solicitada')
			return fila
		end if
	case '2','3','4','7'
		if i_est_hadm<>"1" and i_est_hadm<>'R' then
			Messagebox("Atención","No se puede agregar medicamentos ya que la admisión no está activa")
			return -1
		end if
		if l_tpu='A' then return -1
		if dw_oscab.rowcount()=0 then return -1
		estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
		l_tipoo=dw_oscab.getitemstring(dw_oscab.getrow(),"tipo_orden")
		l_ori=dw_oscab.getitemstring(dw_oscab.getrow(),"origen")
		if estado="2" or estado="3" or estado="4" then
			Messagebox("Atención","Esta orden de servicio ya está completa o anulada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
			return -1
		end if
		string codproc,desproc,rips,tipoproc,plan,emp,contrato,pos,via,s_tiempo,l_conce,ump,umv,oxi
		long nserv,l_tiempo,l_dosis_dia,l_soli,peso,volu
		date l_fecha
		datetime f_bus1,f_bus2
		
		setnull(f_bus1)
		setnull(f_bus2)
		f_bus1=datetime(today())
		f_bus2=datetime(today(),Now())
		SELECT 
			medicamentos.c_medica, medicamentos.medicamento, medicamentos.rips, medicamentos.pos, 
			medicamentos.via, medicamentos.concentracion, medicamentos.max_dosis_dia, medumedida.unidadmed, 
			medumedida_1.unidadmed,medicamentos.peso,medicamentos.volumen,medicamentos.oxi
		INTO 
			:codproc, :desproc ,:rips,:pos,:via,:l_conce,:l_dosis_dia,:ump,:umv,:peso,:volu,:oxi
		FROM 
			(medicamentos left join medumedida on medicamentos.cum_pes = medumedida.codumeddca) 
			left join medumedida as medumedida_1 on medicamentos.cum_vol = medumedida_1.codumeddca
		WHERE 
			c_medica= :p_codigo and medicamentos.estado='1';
		if isnull(codproc) or codproc="" then 
			messagebox("Atención","Medicamento no existe o no está activo")
			return -1
		else
			if l_dosis_dia<>0 then
				select  
					sum(oscuerpo.solicitada)  into :l_soli  
				from 
					oscabeza inner join oscuerpo on (oscabeza.nsolicitud = oscuerpo.nsolicitud) and (oscabeza.clugar = oscuerpo.clugar)
					and (oscabeza.contador = oscuerpo.contador)
				where 
					(((oscabeza.contador)=:i_contador) and ((oscabeza.clugar)=:i_clug_his) and ((oscuerpo.c_medica)=:p_codigo) 
					and ((oscuerpo.estado)<>'4') and ((oscabeza.fecha) between :f_bus1 and :f_bus2));
					if isnull(l_soli ) then l_soli  =0
				if l_soli  >l_dosis_dia then 
					messagebox("Atención","Supera la dosis maxima por dia"+desproc+" que es de ["+string(l_dosis_dia)+"]")
					return -1
				end if
			end if
		
			if l_tpu<>'F' then  
				if not isvalid(w_evolucion_new) and l_tipoo<>'X'  and rips='6' then return 0
			end if
			fila=tab_1.tp_2.dw_formula.insertrow(0)
			tab_1.tp_2.dw_formula.setitem(fila,"c_medica",codproc)
			tab_1.tp_2.dw_formula.setitem(fila,"medicamento",desproc)
			tab_1.tp_2.dw_formula.setitem(fila,"pos",pos)
			tab_1.tp_2.dw_formula.setitem(fila,"solicitada",p_cant)
			tab_1.tp_2.dw_formula.setitem(fila,"estado",'1')
			tab_1.tp_2.dw_formula.setitem(fila,"origen",l_ori)
			if not isnull(ump) then
				if not isnull(umv) then
					tab_1.tp_2.dw_formula.setitem(fila,"um",ump+'/'+umv)
				else
					tab_1.tp_2.dw_formula.setitem(fila,"um",ump)
				end if
				
			end if
			if not isnull(sle_tiporep.tag) and len(sle_tiporep.tag)<>0 then
				via=sle_tiporep.tag
				tab_1.tp_2.dw_formula.setitem(fila,"via",sle_tiporep.tag)
			else
				if not isnull(via) and len(via)<>0 then
					tab_1.tp_2.dw_formula.setitem(fila,"via",via)				
				else
					string nullos
					setnull(nullos)
					tab_1.tp_2.dw_formula.setitem(fila,"via",nullos)				
				end if				
			end if
			tab_1.tp_2.dw_formula.setitem(fila,"administracion",sle_otros.tag)
			if sle_otros.text='' or isnull(sle_otros.text) then
				setnull(sle_otros.text)
				tab_1.tp_2.dw_formula.setitem(fila,"frecuen",sle_otros.text)
			else
				tab_1.tp_2.dw_formula.setitem(fila,"frecuen",sle_otros.text)
				SELECT 
					desc_frec 
				into
					:sle_otros.text
				FROM 
					pm_frecuencia_medica
				WHERE 
					(((estado)='1') AND ((cod_frec)=:sle_otros.text));
				if SQLCA.SQLCode = 100 then
					MessageBox('Error','El frecuencia no existe')
					Return -1
				end if			
			end if
			
			tab_1.tp_2.dw_formula.setitem(fila,"concentracion",string(peso))
			tab_1.tp_2.dw_formula.setitem(fila,"cantk",double(sle_kits.text))
			tab_1.tp_2.dw_formula.setitem(fila,"dosis",double(sle_kits.tag))
			SELECT Max(item) into :nserv FROM oscuerpo WHERE contador=:i_contador and clugar=:i_clug_his and nsolicitud=:i_norden;
			if isnull(nserv) then nserv=0
			nserv++
			tab_1.tp_2.dw_formula.setitem(fila,"item",nserv)
			ord_ser_item=nserv
			tab_1.tp_2.dw_formula.setitem(fila,"nsolicitud",i_norden)
			tab_1.tp_2.dw_formula.setitem(fila,"contador",i_contador)
			tab_1.tp_2.dw_formula.setitem(fila,"clugar",i_clug_his)
			tab_1.tp_2.dw_formula.setfocus()
			tab_1.tp_2.dw_formula.scrolltorow(fila)
			tab_1.tp_2.dw_formula.setrow(fila)
			
			///Agrega para controlar formulacion
			if rips='6' and g_formula = true  and oxi<>'1' then 
				//if  isnull(sle_otros.text) or sle_otros.text='' then 
					openwithparm(w_formulacion,tab_1.tp_2.dw_formula)
				//else
					string l_des
					if not isnull(via) then
						SELECT descripcion into :l_des FROM formula_via where formula_via.codigo=:via;
						texto_np='  ADMINISTRACION Via: '+l_des+' Dosificación: ' +sle_otros.tag+' Frecuencia: '+sle_otros.text
					end if
					if isnull(texto_np) then texto_np=' '
				//end if
			end if
			
			///Agrega para controlar formulacion oxigeno
			if g_formula = true and oxi='1' then 
				openwithparm(w_formulacion_oxigeno,tab_1.tp_2.dw_formula)
			end if
			
			g_formula=true
			setnull(sle_otros.text)
			setnull(sle_otros.tag)
			setnull(sle_kits.text)
			setnull(sle_kits.tag)
			////////////////////////////////////////
			if tab_1.tp_2.dw_formula.update()<1 then
				tab_1.tp_2.dw_formula.deleterow(fila)	
				rollback;
				return -1
			else
				commit;
				tab_1.tp_2.dw_formula.scrolltorow(fila)
				tab_1.tp_2.dw_formula.setcolumn("solicitada")
				tab_1.tp_2.dw_formula.setfocus()
	
				//Agrega para o pos
				if rips='6'  and pos='2' then 
					SELECT OSCABEZA.fecha, OSCUERPO.TIEMPO into :l_fecha,:s_tiempo
					FROM 
						OSCABEZA INNER JOIN OSCUERPO ON (OSCABEZA.CONTADOR = OSCUERPO.CONTADOR) AND 
						(OSCABEZA.CLUGAR = OSCUERPO.CLUGAR) AND (OSCABEZA.NSOLICITUD = OSCUERPO.NSOLICITUD)
					WHERE
						(((OSCUERPO.C_MEDICA)=:codproc) AND ((OSCABEZA.CONTADOR)=:i_contador) AND ((OSCABEZA.CLUGAR)=:i_clug_his) AND
						((OSCABEZA.NSOLICITUD)=(SELECT Max(OSCUERPO.NSOLICITUD)  FROM OSCUERPO 
															WHERE 
															(((OSCUERPO.CONTADOR)=:i_contador) AND ((OSCUERPO.CLUGAR)=:i_clug_his) AND 
															((OSCUERPO.C_MEDICA)=:codproc) AND ((OSCUERPO.TIEMPO) Is Not Null)))));
					if 	isnull(s_tiempo) or s_tiempo='' then
						pb_np.event clicked()
					else
						l_tiempo=Pos ( s_tiempo, ' ' ,1 )
						l_tiempo=double(left(s_tiempo,l_tiempo - 1))
						if today() >RelativeDate(l_fecha, l_tiempo) then
							pb_np.event clicked()
						end if
					end if
				end if
			end if
			return fila
	end if
end choose

end function

public function integer retrieve (long contador, string clugar_his, string p_profe, long p_nh, string p_clug_hadm, string p_tingre, long p_nqx, string p_clug_qx, long p_consec_qx, string p_cesp);i_profe=p_profe
dw_oscab.setredraw(false)
dw_oscab.reset()
i_contador=contador
i_clug_his=clugar_his
i_nh=p_nh
i_clug_hadm=p_clug_hadm
i_tingre=p_tingre
i_nqx=p_nqx
i_clug_qx=p_clug_qx
i_consec_qx=p_consec_qx
s_esp =p_cesp
sle_tiporep.text='O'

if i_indapdx='Q' then
	dw_oscab.retrieve(i_nqx,i_clug_qx,i_consec_qx)
else
	dw_oscab.retrieve(i_contador,i_clug_his)
end if
dw_oscab.setredraw(true)
if i_tingre='2' or i_tingre='3' or i_tingre='4' or i_tingre='7' then	
	SELECT entero into :l_temp_ord
	FROM parametros_gen
	WHERE (((codigo_para)=9));
	if sqlca.sqlnrows=0 then
		messagebox('Atencíon','No hay parametro 9')
	end if
	
	select estado,cemp,ccontrato,clasif into :i_est_hadm,:i_cemp,:i_ccont,:i_triage_cla from hospadmi where nh=:i_nh and clugar=:i_clug_hadm and codtingre=: i_tingre;
	if sqlca.sqlcode=-1 then
		messagebox('Error leyendo estado de HospAdmi',sqlca.sqlerrtext)
	end if
	string respon
	setnull(respon)
	if g_motor='postgres' then
		SELECT 
		 profe.nombre1|| case when profe.nombre2  is null then ' ' else  '  '||profe.nombre2 end ||' '|| 
		profe.apellido1|| case when profe.apellido2 is null then ' ' else  '  '||profe.apellido2 end as desprof into :respon
		FROM HospRespon, Profe
		WHERE HospRespon.CodProf=profe.codprof AND HospRespon.NH=:i_nh and clugar=:i_clug_hadm 
		AND HospRespon.fecha_fin Is Null;
	else
		SELECT 
		 profe.nombre1+ case when profe.nombre2  is null then ' ' else  '  '+profe.nombre2 end +' '+ 
		profe.apellido1+ case when profe.apellido2 is null then ' ' else  '  '+profe.apellido2 end as desprof into :respon
		FROM HospRespon, Profe
		WHERE HospRespon.CodProf=profe.codprof AND HospRespon.NH=:i_nh and clugar=:i_clug_hadm 
		AND HospRespon.fecha_fin Is Null;
	end if
	
	if isnull(respon) then
		st_respon.text='Ninguno'
	else
		st_respon.text=respon
	end if
else
	SELECT entero into :l_temp_ord
	FROM parametros_gen
	WHERE (((codigo_para)=12));
	if sqlca.sqlnrows=0 then
		messagebox('Atencíon','No hay parametro 12')
	end if
end if
return 1
end function

on uo_orden_formula_cost.create
this.sle_plant=create sle_plant
this.sle_kits=create sle_kits
this.sle_tiporep=create sle_tiporep
this.dw_obs=create dw_obs
this.sle_obs=create sle_obs
this.pb_banco=create pb_banco
this.sle_otros=create sle_otros
this.dw_mvto_cpo=create dw_mvto_cpo
this.dw_lote=create dw_lote
this.dw_sum_cab=create dw_sum_cab
this.pb_np=create pb_np
this.pb_enf=create pb_enf
this.dw_llevar=create dw_llevar
this.cbx_banco=create cbx_banco
this.dw_primerorden=create dw_primerorden
this.gb_1=create gb_1
this.pb_rn=create pb_rn
this.pb_rip=create pb_rip
this.pb_evol=create pb_evol
this.dw_profe_atiende=create dw_profe_atiende
this.st_5=create st_5
this.st_respon=create st_respon
this.st_6=create st_6
this.pb_2=create pb_2
this.dw_profe=create dw_profe
this.st_2=create st_2
this.cb_bus_diag=create cb_bus_diag
this.cb_borrorden=create cb_borrorden
this.pb_abre=create pb_abre
this.pb_ordenes=create pb_ordenes
this.pb_new=create pb_new
this.dw_oscab=create dw_oscab
this.tab_1=create tab_1
this.cb_nvorden=create cb_nvorden
this.Control[]={this.sle_plant,&
this.sle_kits,&
this.sle_tiporep,&
this.dw_obs,&
this.sle_obs,&
this.pb_banco,&
this.sle_otros,&
this.dw_mvto_cpo,&
this.dw_lote,&
this.dw_sum_cab,&
this.pb_np,&
this.pb_enf,&
this.dw_llevar,&
this.cbx_banco,&
this.dw_primerorden,&
this.gb_1,&
this.pb_rn,&
this.pb_rip,&
this.pb_evol,&
this.dw_profe_atiende,&
this.st_5,&
this.st_respon,&
this.st_6,&
this.pb_2,&
this.dw_profe,&
this.st_2,&
this.cb_bus_diag,&
this.cb_borrorden,&
this.pb_abre,&
this.pb_ordenes,&
this.pb_new,&
this.dw_oscab,&
this.tab_1,&
this.cb_nvorden}
end on

on uo_orden_formula_cost.destroy
destroy(this.sle_plant)
destroy(this.sle_kits)
destroy(this.sle_tiporep)
destroy(this.dw_obs)
destroy(this.sle_obs)
destroy(this.pb_banco)
destroy(this.sle_otros)
destroy(this.dw_mvto_cpo)
destroy(this.dw_lote)
destroy(this.dw_sum_cab)
destroy(this.pb_np)
destroy(this.pb_enf)
destroy(this.dw_llevar)
destroy(this.cbx_banco)
destroy(this.dw_primerorden)
destroy(this.gb_1)
destroy(this.pb_rn)
destroy(this.pb_rip)
destroy(this.pb_evol)
destroy(this.dw_profe_atiende)
destroy(this.st_5)
destroy(this.st_respon)
destroy(this.st_6)
destroy(this.pb_2)
destroy(this.dw_profe)
destroy(this.st_2)
destroy(this.cb_bus_diag)
destroy(this.cb_borrorden)
destroy(this.pb_abre)
destroy(this.pb_ordenes)
destroy(this.pb_new)
destroy(this.dw_oscab)
destroy(this.tab_1)
destroy(this.cb_nvorden)
end on

event constructor;tab_1.tp_1.pb_ord.cod_rep=i_codrep_orden
tab_1.tp_1.pb_ord.dialogo=repord_dialogo
tab_1.tp_1.pb_ord.v_preliminar=repord_vprelim
tab_1.tp_2.pb_for.cod_rep=i_codrep_formula
tab_1.tp_2.pb_for.dialogo=repfor_dialogo
tab_1.tp_2.pb_for.v_preliminar=repfor_vprelim

end event

type sle_plant from singlelineedit within uo_orden_formula_cost
boolean visible = false
integer x = 1010
integer y = 20
integer width = 343
integer height = 64
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

type sle_kits from singlelineedit within uo_orden_formula_cost
boolean visible = false
integer x = 1001
integer y = 460
integer width = 343
integer height = 56
integer taborder = 270
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

type sle_tiporep from singlelineedit within uo_orden_formula_cost
boolean visible = false
integer x = 1001
integer y = 344
integer width = 347
integer height = 80
integer taborder = 260
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

type dw_obs from datawindow within uo_orden_formula_cost
boolean visible = false
integer x = 1623
integer y = 2524
integer width = 133
integer height = 48
integer taborder = 220
string title = "none"
string dataobject = "dw_hospestancia"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type sle_obs from singlelineedit within uo_orden_formula_cost
boolean visible = false
integer x = 1001
integer y = 240
integer width = 347
integer height = 84
integer taborder = 280
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = " "
borderstyle borderstyle = stylelowered!
end type

type pb_banco from picturebutton within uo_orden_formula_cost
event mousemove pbm_mousemove
boolean visible = false
integer x = 3758
integer y = 36
integer width = 55
integer height = 52
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &n"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Nueva Orden [Alt+N]"
end type

event clicked;if f_permiso_boton(this,'ATOS')=0 then return -1

end event

event constructor;f_inicia_boton(this,'ATOS')


end event

type sle_otros from singlelineedit within uo_orden_formula_cost
boolean visible = false
integer x = 1001
integer y = 136
integer width = 347
integer height = 80
integer taborder = 230
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

type dw_mvto_cpo from datawindow within uo_orden_formula_cost
string tag = "tabla: sum_mvto_cpo"
boolean visible = false
integer x = 1774
integer y = 2520
integer width = 50
integer height = 52
integer taborder = 240
string title = "none"
string dataobject = "dw_sum_mvto_cpo_costos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_lote from datawindow within uo_orden_formula_cost
string tag = "tabla: sum_lote_mov"
boolean visible = false
integer x = 1897
integer y = 2520
integer width = 50
integer height = 52
integer taborder = 290
string title = "none"
string dataobject = "dw_mov_lote_item"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_sum_cab from datawindow within uo_orden_formula_cost
string tag = "tabla: sum_mvto_cab"
boolean visible = false
integer x = 1838
integer y = 2528
integer width = 50
integer height = 52
integer taborder = 170
string title = "none"
string dataobject = "dw_sum_mvto_cab_insumos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_np from picturebutton within uo_orden_formula_cost
event mousemove pbm_mousemove
integer x = 6725
integer y = 1020
integer width = 146
integer height = 128
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "nopos.gif"
string disabledname = "d_nopos.gif"
alignment htextalign = left!
string powertiptext = "Registrar datos de No Pos"
end type

event clicked;if tag='1' then
	if f_permiso_boton(this,'ATOS')=0 then return
end if
//trae_ord trae2_ord
//trae2_ord.contador=i_contador
//trae2_ord.lugar=i_clug_his
//trae2_ord.solicitud=i_norden
//trae2_ord.item=ord_ser_item
//trae2_ord.profe=dw_oscab.getitemstring(dw_oscab.getrow(),'codprof')
//openwithparm(w_nopos,trae2_ord)
string l_nopos

SELECT cadena into :l_nopos
FROM parametros_gen
WHERE (((codigo_para)=42));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 42')
	return 
end if

Inet linet
GetContextService("Internet", linet)
linet.HyperlinkToURL(l_nopos)
end event

event constructor;f_inicia_boton(this,'ATOS')
end event

type pb_enf from picturebutton within uo_orden_formula_cost
event mousemove pbm_mousemove
integer x = 3877
integer y = 856
integer width = 146
integer height = 128
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "enfermera.jpg"
string disabledname = "d_enfermera.jpg"
alignment htextalign = left!
string powertiptext = "Estación de Enfermería (Alt+E)"
end type

event clicked;st_ordenes st_p
if i_est_hadm='N' then return
if i_tingre='2'  and (isnull(i_triage_cla) or i_triage_cla='') then 
	messagebox("Atención","Debe definir Triagge")
	return
end if
open(w_conecta_enf)
st_p = Message.PowerObjectParm
if st_p.cprof = '!' then return
if st_p.cesp = '!' then return

st_p.contador = i_contador
st_p.clugar = i_clug_his
st_p.norden = i_norden
st_p.dw_ord = tab_1.tp_2.dw_formula
st_p.i_est_hadm=i_est_hadm
openwithparm(w_estacion_enf,st_p)
tab_1.tp_1.dw_oscuerpo.retrieve(i_contador,i_clug_his,i_norden,ori)
tab_1.tp_2.dw_formula.retrieve(i_contador,i_clug_his,i_norden,ori)
revi_est_ord()

end event

type dw_llevar from datawindow within uo_orden_formula_cost
boolean visible = false
integer x = 608
integer y = 48
integer width = 329
integer height = 60
integer taborder = 190
string title = "none"
string dataobject = "dw_lleva_procs_atender"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_banco from checkbox within uo_orden_formula_cost
boolean visible = false
integer x = 4997
integer y = 68
integer width = 233
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Banco"
boolean automatic = false
end type

event clicked;If  pb_banco.Event clicked() = 0 then
	If cbx_banco.checked then
		cbx_banco.checked =false
	else
		cbx_banco.checked =true
	end if
end if	


end event

type dw_primerorden from datawindow within uo_orden_formula_cost
boolean visible = false
integer x = 82
integer y = 180
integer width = 782
integer height = 332
integer taborder = 90
boolean enabled = false
string title = "none"
string dataobject = "dw_primer_orden"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type gb_1 from groupbox within uo_orden_formula_cost
integer x = 3031
integer y = 4
integer width = 3886
integer height = 720
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ordenes de Servicios de la Admisión "
borderstyle borderstyle = styleraised!
end type

type pb_rn from picturebutton within uo_orden_formula_cost
event mousemove pbm_mousemove
boolean visible = false
integer x = 6729
integer y = 1148
integer width = 146
integer height = 128
integer taborder = 200
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string picturename = "rn.gif"
string disabledname = "d_rn.gif"
alignment htextalign = left!
string powertiptext = "Registrar datos de Recien Nacido"
end type

event clicked;if tag='1' then
	if f_permiso_boton(this,'ATOS')=0 then return
end if
trae trae2
trae2.numero=i_nh
trae2.lugar=i_clug_hadm
trae2.otro=i_tingre
openwithparm(w_rn,trae2)
end event

event constructor;f_inicia_boton(this,'ATOS')
end event

type pb_rip from picturebutton within uo_orden_formula_cost
event mousemove pbm_mousemove
integer x = 6729
integer y = 1020
integer width = 146
integer height = 128
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "             &i"
boolean originalsize = true
string picturename = "rips.gif"
string disabledname = "d_rips.gif"
alignment htextalign = left!
string powertiptext = "Revisar estado de RIPS [Alt+I]"
end type

event clicked;if i_contador=-1 then return
if tag='1' then
	if f_permiso_boton(this,'ATOS')=0 then return
end if
trae st
st.numero=i_contador
st.lugar=i_clug_his
st.otro='revisa'
st.dw_procs=tab_1.tp_1.dw_oscuerpo
st.dw_meds=tab_1.tp_2.dw_formula
st.tingres=i_tingre
st.profe=dw_profe_atiende.getitemstring(1,1)
st.fecha_ord=dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")
st.tipo_orden=dw_oscab.getitemstring(dw_oscab.getrow(),'tipo_orden')
openwithparm(w_new_estad_ria_os,st)
if message.stringparm='Y' then 
	revi_est_ord()
	dw_oscab.event rowfocuschanged(dw_oscab.getrow())
end if
end event

event constructor;f_inicia_boton(this,'ATOS')
end event

type pb_evol from picturebutton within uo_orden_formula_cost
event mousemove pbm_mousemove
integer x = 3721
integer y = 856
integer width = 146
integer height = 128
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &v"
boolean originalsize = true
string picturename = "evoluciona.jpg"
string disabledname = "d_evoluciona.jpg"
alignment htextalign = left!
string powertiptext = "Evolución del Paciente [Alt+V]"
end type

event clicked;if i_contador=-1 then return
if i_est_hadm='6' then return
if i_est_hadm='5' then return
if i_est_hadm='2' then 
	Messagebox("Atención","Esta atención se encuentra cerrada las evoluciones que haga no se podran guardar")
end if
if i_est_hadm='N' then return
if i_est_hadm='7' then return
if i_tingre='2' and (isnull(i_triage_cla) or i_triage_cla='') then 
	messagebox("Atención","Debe definir Triagge")
	return
end if
string estado,usu,evolu
long j,cuantos
cuantos=0

if isnull(profesi) or profesi='' then
	select codprof,evoluciona into :profesi,:evolu from profe where usuario=:usuario;
	usu=usuario
else
	select usuario,evoluciona into :usu,:evolu from profe where codprof=:profesi;
end if
if isnull(evolu) or evolu='0' then
	Messagebox("Atención","El profesional que eligió no tiene permiso para realizar evoluciones")
	return
end if
if isnull(usu) or usu='' then
	Messagebox("Atención","El profesional que eligió no tiene relación con Usuarios")
	return
end if
st_usuarios st_ux
st_ux.usuario=profesi
st_ux.destino='evol'
openwithparm(w_conecta_evol,st_ux)
st_ordenes st_p
st_p = Message.PowerObjectParm
if st_p.cprof= '!' then return
if st_p.cesp= '!' then return
if st_p.clugar= '!' then return
if st_p.usu= '!' then return

s_esp=st_p.cesp
profesi= st_p.cprof

st_pa_evolucion str

str.sle_proc=tab_1.tp_1.sle_1
str.dw_proc=tab_1.tp_1.dw_oscuerpo
str.campo_cant_proc='solicitada'
str.sle_med=tab_1.tp_2.sle_2
str.dw_med=tab_1.tp_1.dw_canasta
str.campo_cant_med='solicitada'
str.ventana=f_vent_padre(this)
str.contador=i_contador
str.clugar_his=i_clug_his
str.nh=i_nh
str.clug_hadm=i_clug_hadm
str.tingres=i_tingre
str.profes=profesi
str.cesp=st_p.cesp
str.nvorden=cb_nvorden
str.dw_cab=dw_oscab
str.sle_otros=sle_otros
str.sle_tiporep=sle_tiporep
str.sle_kits=sle_kits
str.i_control='1'
if str.ventana.classname()='w_new_sala_qx' then
	str.mostrar=true
else
	str.mostrar=false
end if
str.emp=i_cemp
str.cont=i_ccont
string respon,espe
datetime fentra,hentra
setnull(respon)
if g_motor='postgres' then
	SELECT 
	 profe.nombre1|| case when profe.nombre2  is null then ' ' else  '  '||profe.nombre2 end ||' '|| 
	 profe.apellido1|| case when profe.apellido2 is null then ' ' else  '  '||profe.apellido2 end as desprof
	into :respon
	FROM HospRespon INNER JOIN Profe ON HospRespon.codprof = Profe.codprof
	WHERE HospRespon.NH=:str.nh and clugar=:str.clug_hadm AND HospRespon.CodTIngre=:str.tingres AND HospRespon.fecha_fin Is Null;
else
	SELECT 
	 profe.nombre1+ case when profe.nombre2  is null then ' ' else  '  '+profe.nombre2 end +' '+ 
	 profe.apellido1+ case when profe.apellido2 is null then ' ' else  '  '+profe.apellido2 end as desprof
	into :respon
	FROM HospRespon INNER JOIN Profe ON HospRespon.codprof = Profe.codprof
	WHERE HospRespon.NH=:str.nh and clugar=:str.clug_hadm AND HospRespon.CodTIngre=:str.tingres AND HospRespon.fecha_fin Is Null;
end if
if sqlca.sqlcode=-1 then
	messagebox("Error Consultando responsable actual",sqlca.sqlerrtext)
	return
end if
if isnull(respon) then
	fentra=datetime(today())
	hentra=datetime(today(),time(string(now())))
	INSERT INTO HospRespon ( NH,clugar, CodTIngre, nitem, CodProf, CEsp, fecha_ini, hora_ini)
	values (:str.nh,:str.clug_hadm,:str.tingres,1,:str.profes,:str.cesp,:fentra,:hentra);
	if sqlca.sqlcode=-1 then
		messagebox("Error insertando fila en HospRespon",sqlca.sqlerrtext)
		rollback;
		return
	else
		commit;
	End If
End If
openwithparm(w_evolucion_new,str)
if i_tingre='2'  then 
	long l_nsol
	int l_item,l_cant
	string pro
	
	select oscabeza.nsolicitud, oscuerpo.item,oscuerpo.solicitada,oscuerpo.codproced into :l_nsol,:l_item,:l_cant,:pro
	from ((oscabeza inner join oscuerpo on (oscabeza.nsolicitud = oscuerpo.nsolicitud) and (oscabeza.clugar = oscuerpo.clugar) and (oscabeza.contador = oscuerpo.contador)) inner join hclin_registro on (oscabeza.clugar = hclin_registro.clugar) and (oscabeza.contador = hclin_registro.contador)) inner join proced on oscuerpo.codproced = proced.codproced
	where (((oscabeza.contador)=:i_contador) and ((oscabeza.clugar)=:i_clug_his) and ((oscuerpo.estado)='1') and ((proced.urg)='1'));
	if (not isnull(l_nsol)) and (l_nsol<>0) then
		l_item=f_atender_proc(pro,i_contador,i_clug_his,l_cant, i_tingre, l_nsol,l_item,str.profes,str.cesp)
		tab_1.tp_1.dw_oscuerpo.retrieve(i_contador,i_clug_his,l_nsol,ori)
	end if
end if
revi_est_ord()
end event

event constructor;f_inicia_boton(this,'ATOS')
end event

type dw_profe_atiende from datawindow within uo_orden_formula_cost
integer x = 1993
integer y = 896
integer width = 1527
integer height = 84
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_profe"
boolean border = false
boolean livescroll = true
end type

event constructor;reset()
settransobject(sqlca)
dw_profe_atiende.retrieve(clugar)
getchild('codprof',idw_profeat)
idw_profeat.settransobject(sqlca)
idw_profeat.retrieve(clugar)
modify('codprof.accelerator="l"')
insertrow(1)
f_titulos_dw_st(this,'ATOS',st_5)
end event

event itemchanged;accepttext()
end event

type st_5 from statictext within uo_orden_formula_cost
integer x = 1998
integer y = 844
integer width = 599
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Profesiona&L que atiende:"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_respon from statictext within uo_orden_formula_cost
integer x = 1115
integer y = 904
integer width = 873
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388736
long backcolor = 15793151
string text = "Ninguno"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within uo_orden_formula_cost
integer x = 1106
integer y = 848
integer width = 466
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Responsable Actual:"
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_2 from picturebutton within uo_orden_formula_cost
event mousemove pbm_mousemove
integer x = 946
integer y = 856
integer width = 146
integer height = 128
integer taborder = 250
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &k"
boolean originalsize = true
string picturename = "kits.gif"
string disabledname = "d_kits.gif"
alignment htextalign = left!
string powertiptext = "Cargar de Procedimientos Comunes [Alt+K]"
end type

event clicked;if dw_oscab.rowcount() = 0 then 
	if cb_nvorden.event clicked()=-1 then return -1
end if

choose case i_tingre
	case '2','3','4','7'
		datetime l_fecha_ord
		l_fecha_ord=dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")
		if daysAfter(date(l_fecha_ord),date(now())) >0 then
			Messagebox("Atención","Esta orden de servicio ya está cerrada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
			return -1
		else
			if  SecondsAfter(time(l_fecha_ord),time(now())) > (integer(l_temp_ord)*60) then 
				Messagebox("Atención","Esta orden de servicio ya está cerrada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
				return -1
			end if
		end if
		if not isnull(dw_oscab.getitemstring(dw_oscab.getrow(),'cod_banco')) then return
end choose
if dw_oscab.getitemstring(dw_oscab.getrow(),"origen")='1'  and not isvalid(w_evolucion_new)  then 
	Messagebox("Atención","No se puede agregar procedimientos ya que la orden es de Evolución")
	return
end if
st_proc_comun st_pc
st_pc.sle_proc=tab_1.tp_1.sle_1
st_pc.dw_procs=tab_1.tp_1.dw_oscuerpo
st_pc.col_cant_proc='solicitada'

st_pc.sle_med=tab_1.tp_2.sle_2
st_pc.dw_meds=tab_1.tp_2.dw_formula
st_pc.col_cant_med='solicitada'
st_pc.frecuen='frecuen'
st_pc.administracion='administracion'
//openwithparm(w_kit_viejo,st_pc)
openwithparm(w_kit_new,st_pc)
end event

type dw_profe from datawindow within uo_orden_formula_cost
integer x = 3365
integer y = 68
integer width = 1545
integer height = 80
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_profe"
boolean border = false
boolean livescroll = true
end type

event constructor;reset()
settransobject(sqlca)
dw_profe.retrieve(clugar)
getchild('codprof',idw_profe)
idw_profe.settransobject( sqlca)
modify('codprof.accelerator="q"')
idw_profe.retrieve(clugar)
idw_profe.setfilter("evoluciona ='1'")
idw_profe.filter()
insertrow(1)

end event

event itemchanged;accepttext()
//if isnull(profesi) or profesi='' then
//	select codprof into :profesi from profe where usuario=:usuario;
////	usu=usuario
//else
//	select usuario into :usu from profe where codprof=:profesi;
//end if
//				
end event

type st_2 from statictext within uo_orden_formula_cost
integer x = 3054
integer y = 80
integer width = 311
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Quien Solicita:"
boolean focusrectangle = false
end type

type cb_bus_diag from picturebutton within uo_orden_formula_cost
event mousemove pbm_mousemove
integer x = 5911
integer y = 44
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &d"
boolean originalsize = true
string picturename = "diagnosticar.GIF"
string disabledname = "d_diagnosticar.GIF"
alignment htextalign = left!
string powertiptext = "Buscar Diagnóstico [Alt+D]"
end type

event clicked;if i_contador= -1 then return
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
	long filasfor,filasord,i
	filasord=dw_oscab.rowcount()
	if filasord= 0 then 
		cb_nvorden.triggerevent(clicked!)
		filasord=1
	end if
	for i=1 to filasord
		dw_oscab.setitem(i,'codgeral',st_d.codgeral)
		dw_oscab.setitem(i,'cod_rips',st_d.codrip)
		dw_oscab.setitem(i,'diagnostico',st_d.descripcion)
	next	
	dw_oscab.setfocus()
end if
sqlca.autocommit=true
dw_oscab.update()
sqlca.autocommit=false
commit;
end event

type cb_borrorden from picturebutton within uo_orden_formula_cost
event mousemove pbm_mousemove
integer x = 5413
integer y = 44
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
string text = "        &e"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Eliminar Orden [Alt+E]"
end type

event clicked;if dw_oscab.rowcount()=0 then return
if tag='1' then
if f_permiso_boton(this,'ATOS')=0 then return
end if
if tab_1.tp_1.dw_oscuerpo.rowcount()>0 then return
if tab_1.tp_2.dw_formula.rowcount()>0 then return
if dw_oscab.getitemstring(dw_oscab.getrow(),'tipo_orden')='C' then
	Messagebox('Atención','Esta orden de servicio se utiliza para calcular los costos de Observación y/o Estancia.~r~nNo la puede borrar')
	return
end if
dw_oscab.deleterow(0)
if dw_oscab.update()=-1 then
	rollback;
	//PILAS
	parent.retrieve(i_contador,i_clug_his,i_profe,i_nh,i_clug_hadm,i_tingre,i_nqx,i_clug_qx,i_consec_qx, s_esp )
else
	commit;
	dw_oscab.triggerevent(rowfocuschanged!)
end if
end event

type pb_abre from picturebutton within uo_orden_formula_cost
event mousemove pbm_mousemove
integer x = 5568
integer y = 44
integer width = 146
integer height = 128
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &a"
boolean originalsize = true
string picturename = "ocupar.GIF"
string disabledname = "d_ocupar.GIF"
alignment htextalign = left!
string powertiptext = "Abrir Orden de Servicio [Alt+A]"
end type

event clicked;if dw_oscab.rowcount()=0 then return
if tag='1' then
	if f_permiso_boton(this,'ATOS')=0 then return
end if

if i_est_hadm<>"1" then
	Messagebox("Atención","No se puede cambiar el estado a esta orden ya que la admisión está cerrada")
	return
end if
choose case dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
	case "1"
		messagebox("Atención","Esta orden de servcio está abierta, no es necesario abrirla")
	case "2" 
		if messagebox("Atención","Está seguro que desea abrir esta orden de servicio ?",question!,yesno!,2)=2 then return
		dw_oscab.setitem(dw_oscab.getrow(),"estado","1")
		sqlca.autocommit=true
		if dw_oscab.update()=-1 then
			sqlca.autocommit=false
			rollback;
			//PILAS
			parent.retrieve(i_contador,i_clug_his,i_profe,i_nh,i_clug_hadm,i_tingre,i_nqx,i_clug_qx,i_consec_qx, s_esp )
		else
			sqlca.autocommit=false
			commit;
			dw_oscab.triggerevent(rowfocuschanged!)
		end if
end choose
		
end event

event constructor;f_inicia_boton(this,'ATOS')
end event

type pb_ordenes from picturebutton within uo_orden_formula_cost
event mousemove pbm_mousemove
integer x = 5719
integer y = 44
integer width = 146
integer height = 128
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &m"
boolean originalsize = true
string picturename = "orden_med.gif"
string disabledname = "d_orden_med.gif"
alignment htextalign = left!
string powertiptext = "Ver Solicitudes Médicas [Alt+M]"
end type

event clicked;if i_contador=-1 then return
if tag='1' then
	if f_permiso_boton(this,'ATOS')=0 then return
end if
trae st
st.numero=i_contador
st.lugar=i_clug_his
openwithparm(w_solicita,st)
end event

event constructor;f_inicia_boton(this,'ATOS')
end event

type pb_new from picturebutton within uo_orden_formula_cost
event mousemove pbm_mousemove
integer x = 3566
integer y = 856
integer width = 146
integer height = 128
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &t"
boolean originalsize = true
string picturename = "jeringa.gif"
string disabledname = "d_jeringa.gif"
alignment htextalign = left!
string powertiptext = "Atender Procedimientos [Alt+T]"
end type

event clicked;if i_contador=-1 or dw_oscab.rowcount()=0 then return
if tag='1' then
	if f_permiso_boton(this,'ATOS')=0 then return
end if
string estado
long j,ctos_pro,ctos_med,k
boolean sino=false
if i_est_hadm<>"1" then
	Messagebox("Atención","No se puede modificar esta admisión")
	return
end if
estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
if estado="2" or estado="3" then
	Messagebox("Atención","Esta orden de servicio ya está completa o anulada, no se pueden borrar procedimientos")
	return
end if
//cuantos=0
ctos_pro=0
uo_datastore qx
qx=create uo_datastore
qx.dataobject='dw_at_qx'
for j=1 to tab_1.tp_1.dw_oscuerpo.rowcount()
	if tab_1.tp_1.dw_oscuerpo.getitemstring(j,"escog")="1" then
		if tab_1.tp_1.dw_oscuerpo.getitemstring(j,"agrupser")="04" then
			for k=1 to tab_1.tp_1.dw_oscuerpo.getitemnumber(j,"solicitada")
				qx.insertrow(1)
				qx.setitem(1,1,tab_1.tp_1.dw_oscuerpo.getitemstring(j,"codproced"))
				qx.setitem(1,'norden',i_norden)
				qx.setitem(1,'nitem',tab_1.tp_1.dw_oscuerpo.getitemnumber(j,"item"))
				qx.setitem(1,'facturar',tab_1.tp_1.dw_oscuerpo.getitemnumber(j,"facturar"))
				qx.setitem(1,'prof',dw_profe_atiende.getitemstring(1,1))
				qx.setitem(1,'nh',i_nh)
				qx.setitem(1,'clug_hadm',i_clug_hadm)
				qx.setitem(1,'tingre',i_tingre)
				qx.setitem(1,'contador',i_contador)
				qx.setitem(1,'clug_his',i_clug_his)
				tab_1.tp_1.dw_oscuerpo.setitem(j,"escog",'0')
			next
		else
			ctos_pro++
		end if
	end if
next
ctos_med=0
for j=1 to tab_1.tp_2.dw_formula.rowcount()
	if tab_1.tp_2.dw_formula.getitemstring(j,"escog")="1" then ctos_med ++
next
if (ctos_pro=0  and ctos_med=0) and qx.rowcount()=0 then 
	messagebox("Atención","No ha seleccionado ningún procedimiento o medicamento en la casilla Atender")
	return
end if

if ctos_pro>0  or ctos_med>0 then
	if isnull(dw_profe_atiende.getitemstring(1,1)) then
		messagebox("Atención","Elija un profesional para poder atender los servicios")
		return
	end if
	
	trae st
	st.numero=i_contador
	st.lugar=i_clug_his
	st.dx_ord=dw_oscab.getitemstring(dw_oscab.getrow(),"codgeral")
	st.otro='carga'
	st.dw_procs=tab_1.tp_1.dw_oscuerpo
	st.dw_meds=tab_1.tp_2.dw_formula
	st.tingres=i_tingre
	st.fecha_ord=dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")
	st.profe=dw_profe_atiende.getitemstring(1,1)
	If ctos_pro>0  then
		if tab_1.tp_1.dw_oscuerpo.getitemstring(tab_1.tp_1.dw_oscuerpo.getrow(),"agrupser")="10" then
			openwithparm(w_banco_atiende,st)
		else
			openwithparm(w_new_estad_ria_os,st)
		end if
	else
		openwithparm(w_new_estad_ria_os,st)
	end if
	if message.stringparm='Y' then dw_oscab.event rowfocuschanged(dw_oscab.getrow())
end if
if qx.rowcount()>0 then
	openwithparm(w_atiende_qx,qx)//popup
	openwithparm(w_new_atiende_pqx,qx)//response
	dw_oscab.event rowfocuschanged(dw_oscab.getrow())
end if
revi_est_ord()

end event

event constructor;f_inicia_boton(this,'ATOS')
end event

type dw_oscab from datawindow within uo_orden_formula_cost
event keypress pbm_dwnkey
event pe_changed ( )
integer x = 3063
integer y = 184
integer width = 3817
integer height = 504
integer taborder = 70
string dragicon = "none!"
boolean bringtotop = true
string dataobject = "dw_oscab_hadm"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event pe_changed();accepttext()
sqlca.autocommit=true
if update()=-1 then
	rollback;
else
	commit;
end if
sqlca.autocommit=false
end event

event constructor;settransobject(sqlca)

end event

event itemchanged;long fila
fila=getrow()
if fila<1 then return
//ord_ser_item=getitemnumber(row,'item')
string nulo
setnull(nulo)
choose case getcolumnname()
	case 'cod_rips'
		if (trim(data)<>"" or (trim(this.getitemstring(fila,'cod_rips'))<>"" and not isnull(this.getitemstring(fila,'cod_rips'))))then
			string diag,este=''
			st_return_diags st
			
			st=f_check_diag(trim(gettext()),w_principal.dw_1.getitemstring(1,"sexo"),w_principal.dw_1.getitemnumber(1,"dias"),este,'0',this.getitemstring(fila,'rips'),'0')
			if st.descrip_diag<>"" then
				setitem(fila,"diagnostico",st.descrip_diag)
				setitem(fila,"codgeral",este)
				this.accepttext()
			else
				setitem(row,'codgeral',nulo)
				setitem(row,'cod_rips',nulo)
				return 1
			end if
		else
			setitem(row,'codgeral',nulo)
			setitem(row,'cod_rips',nulo)
		end if
	case 'diagnostico'
		setitem(row,'codgeral',nulo)
		setitem(row,'cod_rips',nulo)
	case 'cod_banco'
		if tab_1.tp_1.dw_oscuerpo.rowcount()> 0 then
			settext(getitemstring(getrow(),'cod_banco'))
			setitem(getrow(),'cod_banco',getitemstring(getrow(),'cod_banco'))
			return 1
		end if
end choose
accepttext()
post event pe_changed()
end event

event rowfocuschanged;tab_1.tp_1.dw_oscuerpo.reset()
tab_1.tp_2.dw_formula.reset()
idw_procs.reset()
tab_1.tp_1.dw_canasta.reset()
i_norden=-1
string l_profe
setnull(l_tiporep)
if getrow()<1 then return
i_norden=getitemnumber(getrow(),"nsolicitud")
ori=getitemstring(getrow(),"origen")
idw_procs.retrieve(i_contador,i_clug_his,i_norden)
tab_1.tp_1.dw_oscuerpo.retrieve(i_contador,i_clug_his,i_norden,ori)
tab_1.tp_2.dw_formula.retrieve(i_contador,i_clug_his,i_norden,ori)
tab_1.tp_1.dw_canasta.setfilter('')
tab_1.tp_1.dw_canasta.filter()
tab_1.tp_1.dw_canasta.retrieve(i_contador,i_clug_his,i_norden)
l_profe=getitemstring(getrow(),"codprof")
select profe.usuario,evoluciona,tipo into :l_usu,:l_evo,:l_tpu FROM profe left join usuarios ON profe.usuario= usuarios.usuario where codprof=:l_profe;
revi_est_ord()
end event

type tab_1 from tab within uo_orden_formula_cost
event create ( )
event destroy ( )
integer x = 18
integer y = 740
integer width = 6903
integer height = 1772
integer taborder = 210
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
integer width = 6866
integer height = 1644
long backcolor = 67108864
string text = "Procedimientos"
long tabtextcolor = 33554432
string picturename = "ap_dx.ico"
long picturemaskcolor = 536870912
string powertiptext = "Ordenar Servicios de Apoyo Diagnostico"
pb_save_insumo pb_save_insumo
st_1 st_1
pb_del_insumo pb_del_insumo
pb_insert_insumo pb_insert_insumo
pb_1 pb_1
sle_3 sle_3
dw_canasta dw_canasta
pb_ord pb_ord
dw_oscuerpo dw_oscuerpo
cb_12 cb_12
cb_delserv cb_delserv
cb_nvserv cb_nvserv
sle_1 sle_1
st_18 st_18
end type

on tp_1.create
this.pb_save_insumo=create pb_save_insumo
this.st_1=create st_1
this.pb_del_insumo=create pb_del_insumo
this.pb_insert_insumo=create pb_insert_insumo
this.pb_1=create pb_1
this.sle_3=create sle_3
this.dw_canasta=create dw_canasta
this.pb_ord=create pb_ord
this.dw_oscuerpo=create dw_oscuerpo
this.cb_12=create cb_12
this.cb_delserv=create cb_delserv
this.cb_nvserv=create cb_nvserv
this.sle_1=create sle_1
this.st_18=create st_18
this.Control[]={this.pb_save_insumo,&
this.st_1,&
this.pb_del_insumo,&
this.pb_insert_insumo,&
this.pb_1,&
this.sle_3,&
this.dw_canasta,&
this.pb_ord,&
this.dw_oscuerpo,&
this.cb_12,&
this.cb_delserv,&
this.cb_nvserv,&
this.sle_1,&
this.st_18}
end on

on tp_1.destroy
destroy(this.pb_save_insumo)
destroy(this.st_1)
destroy(this.pb_del_insumo)
destroy(this.pb_insert_insumo)
destroy(this.pb_1)
destroy(this.sle_3)
destroy(this.dw_canasta)
destroy(this.pb_ord)
destroy(this.dw_oscuerpo)
destroy(this.cb_12)
destroy(this.cb_delserv)
destroy(this.cb_nvserv)
destroy(this.sle_1)
destroy(this.st_18)
end on

type pb_save_insumo from picturebutton within tp_1
integer x = 914
integer y = 928
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
string powertiptext = "Guarda Canasta"
end type

event clicked;if messageBox('Atención','Va a guardar el consumo de insumos para todos los productos de la muestra. Desea Continuar?',QUESTION!,YESNO!) = 2 then return
if f_guarda_insumos(dw_sum_cab,tab_1.tp_1.dw_canasta,dw_mvto_cpo,dw_lote,i_cdoc_cons,i_clug_his,i_alm,i_contador)=-1 then
	rollback;
else
	commit;
	i_cambio_insumo=false
	tab_1.tp_1.pb_save_insumo.enabled=false
	tab_1.tp_1.pb_insert_insumo.enabled=false
	tab_1.tp_1.pb_1.enabled=false
	tab_1.tp_1.pb_del_insumo.enabled=false
	dw_sum_cab.resetupdate()
	tab_1.tp_1.dw_canasta.resetupdate()
	dw_mvto_cpo.resetupdate()
	dw_lote.resetupdate()
end if



end event

type st_1 from statictext within tp_1
integer x = 210
integer y = 920
integer width = 389
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cód med/Insumo:"
boolean focusrectangle = false
end type

type pb_del_insumo from picturebutton within tp_1
integer x = 759
integer y = 928
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "capsula X.GIF"
string disabledname = "d_capsula X.GIF"
string powertiptext = "Borrar Insumo"
end type

event clicked;if dw_oscab.rowcount()=0 or dw_canasta.rowcount()=0 then return 0
string estado
if i_est_hadm<>"1" then
	Messagebox("Atención","No se puede borrar Insumos ya que la admisión no está activa")
	return -1
end if
estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
if estado="2" or estado="3" then
	Messagebox("Atención","Esta orden de servicio ya está completa o anulada, no se pueden borrar Insumos")
	return -1
end if
if dw_canasta.getitemnumber(dw_canasta.getrow(),"entregada")>0 then 
	messagebox("Atención","Este Insumo no se puede eliminar, porque ya fue atendido total o parcialmente")
	return -1
end if
if dw_canasta.getitemstring(dw_canasta.getrow(),"estado")<>"1" then
	messagebox("Atención","Este Insumo no se puede eliminar, porque su estado es diferente a 'Sin realizar'")
	return -1
end if
dw_canasta.deleterow(0)
if dw_canasta.update()=1 then
	commit;
else
	return -1
end if
revi_est_ord()
return 1
end event

type pb_insert_insumo from picturebutton within tp_1
integer x = 50
integer y = 928
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "capsula.GIF"
string disabledname = "d_capsula.GIF"
end type

event clicked;if tab_1.tp_1.dw_oscuerpo.rowcount()=0 then return -1
if i_est_hadm<>"1" then
	Messagebox("Atención","No se puede agregar procedimientos ya que la admisión no está activa")
	return -1
end if
if dw_oscab.rowcount()=0 then return -1
string estado
estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
if estado="2" or estado="3" then
	Messagebox("Atención","Esta orden de servicio ya está completa o anulada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
	return -1
end if
if not isnull(tab_1.tp_1.dw_oscuerpo.getitemstring(tab_1.tp_1.dw_oscuerpo.getrow(),'codaadx')) then
	Messagebox('Atención','El procedimiento es de Apoyo Diagnóstico , no le puede agregar insumos')
	return -1
end if
if tab_1.tp_1.dw_oscuerpo.getitemstring(tab_1.tp_1.dw_oscuerpo.getrow(),'agrupser')='04' then
	Messagebox('Atención','El procedimiento es Quirúrgico , no le puede agregar insumos')
	return -1
end if
long j,k
j=dw_canasta.insertrow(0)
dw_canasta.setitem(j,'contador',i_contador)
dw_canasta.setitem(j,'clugar',i_clug_his)
dw_canasta.setitem(j,'nsolicitud',i_norden)
dw_canasta.setitem(j,'item',tab_1.tp_1.dw_oscuerpo.getitemnumber(tab_1.tp_1.dw_oscuerpo.getrow(),'item'))
dw_canasta.setitem(j,'estad_cpo',tab_1.tp_1.dw_oscuerpo.getitemstring(tab_1.tp_1.dw_oscuerpo.getrow(),'estado'))
for k=j to 1 step -1
	if dw_canasta.find('secuencia='+string(k),1,dw_canasta.rowcount())=0 then exit
next
dw_canasta.setitem(j,'secuencia',k)
i_cambio_insumo=TRUE
return j


end event

type pb_1 from picturebutton within tp_1
integer x = 608
integer y = 928
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "capsula busca.GIF"
string disabledname = "d_capsula busca.GIF"
string powertiptext = "Buscar Insumos"
end type

event clicked;if tab_1.tp_1.dw_oscuerpo.rowcount()=0 then return -1
if i_est_hadm<>"1" then
	Messagebox("Atención","No se puede agregar procedimientos ya que la admisión no está activa")
	return -1
end if
if dw_oscab.rowcount()=0 then return -1
string estado
estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
if estado="2" or estado="3" then
	Messagebox("Atención","Esta orden de servicio ya está completa o anulada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
	return -1
end if
if not isnull(tab_1.tp_1.dw_oscuerpo.getitemstring(tab_1.tp_1.dw_oscuerpo.getrow(),'codaadx')) then
	Messagebox('Atención','El procedimiento es de Apoyo Diagnóstico , no le puede agregar insumos')
	return -1
end if
if tab_1.tp_1.dw_oscuerpo.getitemstring(tab_1.tp_1.dw_oscuerpo.getrow(),'agrupser')='04' then
	Messagebox('Atención','El procedimiento es Quirúrgico , no le puede agregar insumos')
	return -1
end if
openwithparm(w_busca_gener,sle_3)
end event

type sle_3 from singlelineedit within tp_1
integer x = 206
integer y = 972
integer width = 384
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;string codigo,a,b//,c//,d,e
long j
codigo=text

SELECT Medicamentos.Medicamento,  SUMGENERICO.cod_insumo
into :a,:b
FROM Medicamentos INNER JOIN (cos_insumo INNER JOIN SUMGENERICO ON cos_insumo.cod_insumo = SUMGENERICO.cod_insumo) ON Medicamentos.c_medica = SUMGENERICO.c_medica
WHERE (((Medicamentos.c_medica)=:codigo));

if sqlca.sqlcode=-1 then
	messagebox('Error leyendo medicamentos-sumgenerico',sqlca.sqlerrtext)
	return
end if
if sqlca.sqlnrows=0 then
	messagebox('Atención','Esté medicamento no existe, o no está configurao como un insumo')
	return
end if
j=pb_insert_insumo.event clicked()
if j=-1 then return
dw_canasta.setrow(j)
dw_canasta.setitem(j,'cod_insumo',b)
dw_canasta.event itemchanged(j,dw_canasta.object.cod_insumo,b)
dw_canasta.setitem(j,'c_medica',codigo)
dw_canasta.setitem(j,'medicamento',a)
dw_canasta.event itemchanged(j,dw_canasta.object.medicamento,a)
text=''
setfocus(dw_canasta)
end event

type dw_canasta from datawindow within tp_1
event p_itemchanged ( )
event key pbm_dwnkey
integer x = 37
integer y = 1064
integer width = 6816
integer height = 552
integer taborder = 30
string title = "none"
string dataobject = "dw_insum_hosp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged();accepttext()
accepttext()
update()
commit;
end event

event key;if key=keydelete! then
	if getrow()<1 then return
	if getcolumnname()='cod_insumo' then
		string nulo
		setnull(nulo)
		setitem(getrow(),'cod_insumo',nulo)
		setitem(getrow(),'codgenerico',nulo)
		setitem(getrow(),'descripcion',nulo)
		idw_genericos.reset()
	end if
end if
end event

event buttonclicked;long j
for j=1 to rowcount()
	if dwo.text='Escoger' then
		if describe("evaluate('if ( estad_cpo<>~~'C~~' , 1 , if ( estado<>~~'1~~' or  entregada - suministrada<=0,  1 ,0))',"+string(j)+")")='0' then setitem(j,'escog','1')
	else
		setitem(j,'escog','0')
	end if
next
if dwo.text='Escoger' then
	modify(string(dwo.name)+'.text="No Escog."')
else
	modify(string(dwo.name)+'.text="Escoger"')
end if


end event

event constructor;settransobject(sqlca)
getchild('medicamento',idw_genericos)
idw_genericos.settransobject( sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,dataobject)
end event

event doubleclicked;if dwo.name='c_medica' then
	if row<1 then return
	if row<>getrow() then setrow(row)
	if describe("evaluate('if ( entregada>0 , 1 , 0 )',"+string(row)+")")='1' then return
	if not isnull(getitemstring(getrow(),'cod_insumo')) then
		openwithparm(w_escoge_gener,getitemstring(getrow(),'cod_insumo'))
		if message.stringparm<>'' then
			setitem(getrow(),'c_medica',message.stringparm)
			event itemchanged(getrow(),object.c_medica,message.stringparm)
		end if
	else
		openwithparm(w_busca_gener,this)
	end if
end if
end event

event itemchanged;choose case dwo.name
	case 'cod_insumo'
		if idw_genericos.retrieve(data )>0 then
			setitem(getrow(),'c_medica',idw_genericos.getitemstring( 1, 'c_medica'))
			setitem(getrow(),'medicamento',idw_genericos.getitemstring( 1, 'medicamento'))
		end if
	case 'medicamento'
		long cual
		cual=idw_genericos.find('medicamento="'+data+'"',1,idw_genericos.rowcount())
		if cual>0 then
			setitem(getrow(),'c_medica',idw_genericos.getitemstring( cual, 'c_medica'))
		end if
	case 'c_medica'
		long donde
		string nulo
		setnull(nulo)
		donde=idw_genericos.find( 'c_medica="'+trim(data)+'"', 1, idw_genericos.rowcount())
		if donde=0 then
			settext('')
			setitem(getrow( ),'c_medica',nulo)
			setitem(getrow( ),'medicamento',' ')
			return 1
		else
			setitem(getrow( ),'medicamento',idw_genericos.getitemstring(donde,'medicamento'))
		end if
end choose
post event p_itemchanged()
end event

event rowfocuschanged;idw_genericos.reset()
if getrow()<1 then return
idw_genericos.retrieve(getitemstring(getrow(),'cod_insumo'))
end event

type pb_ord from pb_report within tp_1
integer x = 6688
integer y = 8
integer taborder = 40
string text = "          &o"
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
string powertiptext = "Imprimir Orden de Servicio [Alt+O]"
string nombre_rep = "Orden de Servicio"
string tipo_rep = "interno!"
boolean dialogo = true
end type

event clicked;call super::clicked;any par[3]
par[1]=i_contador
par[2]=i_norden
par[3]=i_clug_his
imprimir(par,'','0')

end event

type dw_oscuerpo from datawindow within tp_1
event keypress pbm_dwnkey
event p_itemchanged ( )
integer x = 27
integer y = 156
integer width = 6638
integer height = 712
integer taborder = 20
string dragicon = "none!"
string dataobject = "dw_oscpo_hadm"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged();accepttext()
update()
commit;
end event

event constructor;settransobject(sqlca)
end event

event itemchanged;if DaysAfter ( date(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")), date(now()) )> 0 then
	return
else
	if  SecondsAfter(time(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")),time(now())) > (integer(l_temp_ord)*60) then 
		return
	end if
end if
if isvalid(dwo) then
	long j,actual
	
	if dwo.name='examen' then
		string nulo
		setnull(nulo)
		setitem(getrow(),'codproced',nulo)
	end if
	if dwo.name='solicitada' and i_indapdx<>'0' then
		actual=getitemnumber(row,'solicitada')
		if long(gettext())>1 and getitemstring(getrow(),'agrupser')='04' then 
			settext('1')
			setitem(getrow(),'solicitada',1)
			return 1
		end if
		if tab_1.tp_1.dw_canasta.rowcount()>0 then 
			if tab_1.tp_1.dw_canasta.find('entregada>0',1,tab_1.tp_1.dw_canasta.rowcount())>0 then
				settext(string(actual))
				setitem(row,'solicitada',actual)
				messagebox('Atención','Ya se han entregado suministros para este procedimiento no puede cambiar la cantidad, Solicítelo como un nuevo procedimiento o cree una nueva orden')
				return 2
			end if
		end if
		if long(data)>99 then
			if messagebox('Atención','La cantidad es superior a 99 desea continuar aún así?',question!,yesno!,2)=2 then
				settext(string(actual))
				setitem(row,'solicitada',actual)
				return 2
			end if
		end if
		for j=1 to tab_1.tp_1.dw_canasta.rowcount()
			tab_1.tp_1.dw_canasta.setitem(j,'solicitada',tab_1.tp_1.dw_canasta.getitemnumber(j,'cant_orig')*long(data))
		next
		tab_1.tp_1.dw_canasta.event p_itemchanged()
	end if
	if dataobject='dw_oscpo_hadm' then
			if dwo.name='escog' then
			if not isnull(dw_oscab.getitemstring(dw_oscab.getrow(),'cod_banco')) then
				if getitemnumber(getrow(),'entregada')=0 and data='1' then
					settext('0')
					setitem(getrow(),'escog','0')
					return 1
				end if
			end if
			if not isnull(getitemstring(j,'codaadx')) and data='1' and ls_aordarea='1' then
				settext('0')
				setitem(getrow(),'escog','0')
				return 1
			end if
		end if
	end if
end if
if dw_oscab.getitemstring(dw_oscab.getrow(),'estado')='2' then return 2
if tab_1.tp_1.dw_oscuerpo.getitemstring(row,"estado")='2' then return 2
post event p_itemchanged()
end event

event buttonclicked;long j
string p_codigo

for j=1 to rowcount()
	if dwo.text='Escoger' then
		setrow(j)
		if tab_1.tp_1.dw_canasta.find("cantidad >0",1,tab_1.tp_1.dw_canasta.rowcount())>0 then continue
		if not isnull(getitemstring(j,'codaadx')) and ls_aordarea='1' then continue
		if getitemstring(j,'estado')='1' then setitem(j,'escog','1')
	else
		setitem(j,'escog','0')
	end if
next
if dwo.name<>'b_2' then 
	if dwo.text='Escoger' then modify(string(dwo.name)+'.text="No Escog."') else 	modify(string(dwo.name)+'.text="Escoger"')
end if

////////////////////////////canastas
if dwo.name='b_2' then 
	string i_profe_at,p_coduf,p_codcc,i_espe
	int nser
	st_pa_evolucion i_stde
	st_xa_canastas st
	setnull(i_alm)
	if tab_1.tp_1.dw_canasta.rowcount()>0 then
		return 
	else	
		tab_1.tp_1.pb_save_insumo.enabled=false
		tab_1.tp_1.pb_insert_insumo.enabled=false
		tab_1.tp_1.pb_1.enabled=false
		tab_1.tp_1.pb_del_insumo.enabled=false
	end  if
	st.cproc=tab_1.tp_1.dw_oscuerpo.getitemstring(getrow(),"codproced")
	st.sexo=w_principal.dw_1.getitemstring(1,'sexo')
	st.edad_dias=w_principal.dw_1.getitemnumber(1,'dias')
	st.dw_canasta=tab_1.tp_1.dw_canasta
	st.contador=i_contador
	st.clugar=i_clug_his
	st.norden=i_norden
	st.hosp_urg='1'
	st.dw_lote=dw_lote
	st.control='1'
	st.item=tab_1.tp_1.dw_oscuerpo.getitemnumber(getrow(),"item")
	nser=tab_1.tp_1.dw_oscuerpo.getitemnumber(getrow(),"item")

	if isnull(dw_oscab.getitemstring(dw_oscab.getrow(),'cod_banco')) and isnull(tab_1.tp_1.dw_oscuerpo.getitemstring(getrow(),"codaadx"))  /*and str.agrupser<>'04'*/ then
		//saco el profesional que atendio de rips
		SELECT CProf,CodEspecialidad,nservicio into :i_profe_at,:i_espe,:nser
		FROM ServiciosIngreso
		WHERE 
			(((ServiciosIngreso.conta_orden)=:i_contador) AND ((ServiciosIngreso.clug_orden)=:i_clug_his) AND 
			((ServiciosIngreso.norden_serv)=:i_norden) AND ((ServiciosIngreso.item_orden)=:nser));
		if sqlca.sqlcode=-1 then 
			messagebox("Error leyendo Servicios Ingreso",sqlca.sqlerrtext)
			return -1
		end if
		i_stde.profes=i_profe_at
		st.nserv=nser
		
		//para saber el alamcen donde cargo la canasta
		if isnull(i_espe) or i_espe='' then 
			int cuantas
			select count(cesp) into :cuantas from espprof where codprof=:i_profe_at and estado='1';
			if cuantas=0 or cuantas>1 then
				openwithparm(w_escog_especialidad,i_stde.profes)
				i_espe=message.stringparm
			else
				select cesp into :i_espe from espprof where codprof=:i_profe_at and estado='1';
				if sqlca.sqlcode=-1 then
					messagebox("Error consultando EspProf",sqlca.sqlerrtext)
					return
				end if
			end if
		end if
	
		if isnull(p_coduf) or p_coduf='' then
			setnull(p_coduf)
			setnull(p_codcc)
			select cufuncional , cccosto into :p_coduf,:p_codcc from espprof where codprof=:i_profe_at and cesp=:i_espe and estado='1';
			if sqlca.sqlcode=-1 then 
				messagebox("Error leyendo Ufuncional y Centro costo de EspProf",sqlca.sqlerrtext)
				return -1
			end if
			if isnull(p_coduf) or isnull(p_codcc) then
				messagebox('Atención','El profesional no tiene Centro de costo ni unidad funcional en la tabla espprof')
				return -1
			end if
		end if
		if isnull(i_alm) or i_alm='' then
			i_alm=f_alm_de_cc(p_coduf,p_codcc)
			if i_alm='' then return -1
		end if
		st.alm= i_alm
		openwithparm(w_canasta_articulo,st)
		if message.stringparm='ok' then
			i_cambio_insumo=TRUE
			tab_1.tp_1.pb_save_insumo.enabled=true
			tab_1.tp_1.pb_insert_insumo.enabled=true
			tab_1.tp_1.pb_1.enabled=true
			tab_1.tp_1.pb_del_insumo.enabled=true
		end if
	end if
end if
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,dataobject)
end event

event rowfocuschanged;if getrow()<1 then 
	tab_1.tp_1.dw_canasta.setfilter('isnull(item_os)')
	tab_1.tp_1.dw_canasta.filter()
	return
end if
if isnull(getitemnumber(getrow(),'item')) then
	tab_1.tp_1.dw_canasta.setfilter('isnull(item_os)')
else
	tab_1.tp_1.dw_canasta.setfilter('item_os='+string(getitemnumber(getrow(),'item')))
end if
tab_1.tp_1.dw_canasta.filter()
tab_1.tp_1.dw_canasta.sort()
end event

type cb_12 from picturebutton within tp_1
event mousemove pbm_mousemove
integer x = 581
integer y = 4
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &p"
boolean originalsize = true
string picturename = "jeringa busca.gif"
string disabledname = "d_jeringa busca.gif"
alignment htextalign = left!
string powertiptext = "Buscar Procedimiento [Alt+P]"
end type

event clicked;st_pa_proc str_proc
str_proc.t_ingreso=i_tingre
choose case i_tingre
	case '1'
		if i_contador<> -1 then 
			if dw_oscab.rowcount() = 0 then 
				if cb_nvorden.event clicked()=-1 then return -1
			end if
			str_proc.sle=sle_1
			if dw_oscab.getitemstring(dw_oscab.getrow(),'tipo_orden')='N' then
				str_proc.p_qx=false
			else
				str_proc.p_qx=true
			end if
			openwithparm(w_busca_proc,str_proc)
			dw_oscuerpo.setfocus()
		end if
	case '2','3','4','7'
		if dw_oscab.rowcount()=0 then return
		if tag='1' then
			if f_permiso_boton(this,'ATOS')=0 then return
		end if
		if dw_oscab.getitemstring(dw_oscab.getrow(),"origen")='1'  and not isvalid(w_evolucion_new)  then 
			Messagebox("Atención","No se puede agregar procedimientos ya que la orden es de Evolución")
			return
		end if
		if i_est_hadm<>"1" then
			Messagebox("Atención","No se puede agregar procedimientos ya que la admisión no está activa")
			return
		end if
		string estado
		datetime l_fecha_ord
		l_fecha_ord=dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")
		if daysAfter(date(l_fecha_ord),date(now())) >0 then
			Messagebox("Atención","Esta orden de servicio ya está cerrada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
			return 
		else
			if  SecondsAfter(time(l_fecha_ord),time(now())) > (integer(l_temp_ord)*60) then 
				Messagebox("Atención","Esta orden de servicio ya está cerrada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
				return 
			end if
		end if
		estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
		if estado="2" or estado="3" then
			Messagebox("Atención","Esta orden de servicio ya está completa o anulada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
			return -1
		end if
		str_proc.sle=sle_1
		str_proc.emp=i_cemp
		str_proc.cont=i_ccont
		str_proc.t_ingreso= i_tingre
		
		if not isnull(dw_oscab.getitemstring(dw_oscab.getrow(),'cod_banco')) then 
			str_proc.dw=dw_oscuerpo
			str_proc.banco=dw_oscab.getitemstring(dw_oscab.getrow(),'cod_banco')
			string pr
			str_proc.objeto=dw_primerorden.getparent()
			pr=string(str_proc.objeto)
			openwithparm(w_procs_bancos,str_proc)
		else
			openwithparm(w_busca_proc,str_proc)
		end if
end choose
end event

type cb_delserv from picturebutton within tp_1
event mousemove pbm_mousemove
integer x = 736
integer y = 4
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &b"
boolean originalsize = true
string picturename = "jeringa x.gif"
string disabledname = "d_jeringa x.gif"
alignment htextalign = left!
string powertiptext = "Borrar Servicio [Alt+B]"
end type

event clicked;choose case i_tingre
	case '1'
		dw_oscuerpo.deleterow(0)
		if dw_oscuerpo.update()=-1 then
			rollback;
			return -1
		else
			commit;
		end if
		dw_oscuerpo.setfocus()
		return 1
	case '2','3','4','7'
		if dw_oscab.rowcount()=0 or dw_oscuerpo.rowcount()=0 then return
		if tag='1' then
			if f_permiso_boton(this,'ATOS')=0 then return
		end if
		string estado
		long cual
//		if dw_oscab.getitemstring(dw_oscab.getrow(),"origen")='1'  and not isvalid(w_evolucion_new)  then 
//			Messagebox("Atención","No se puede eliminar procedimientos ya que la orden es de Evolución")
//			return
//		end if
		
		if i_est_hadm<>"1" then
			Messagebox("Atención","No se puede borrar procedimientos ya que la admisión no está activa")
			return
		end if
		datetime l_fecha_ord
		l_fecha_ord=dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")
		if daysAfter(date(l_fecha_ord),date(now())) >0 then
			Messagebox("Atención","Esta orden de servicio ya está cerrada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
			return
		else
			if  SecondsAfter(time(l_fecha_ord),time(now())) > (integer(l_temp_ord)*60) then 
				Messagebox("Atención","Esta orden de servicio ya está cerrada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
				return
			end if
		end if		

		estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
		if estado="2" or estado="3" then
			Messagebox("Atención","Esta orden de servicio ya está completa o anulada, no se pueden borrar procedimientos")
			return
		end if
		if dw_oscuerpo.getitemstring(dw_oscuerpo.getrow(),"estado")='C' then 
			messagebox("Atención","Este procedimiento no se puede eliminar, porque es de Costos")
			return
		end if
		if dw_oscuerpo.getitemnumber(dw_oscuerpo.getrow(),"suministrada")>0 then 
			messagebox("Atención","Este procedimiento no se puede eliminar, porque ya fue atendido total o parcialmente")
			return
		end if
		if dw_oscuerpo.getitemnumber(dw_oscuerpo.getrow(),"entregada")>0 then 
			messagebox("Atención","Este procedimiento no se puede eliminar, porque ya tiene una reserva en el respectivo Banco")
			return
		end if
		if dw_oscuerpo.getitemstring(dw_oscuerpo.getrow(),"estado")<>"1" then
			messagebox("Atención","Este procedimiento no se puede eliminar, porque su estado es diferente a 'Sin realizar'")
			return
		end if
		do while tab_1.tp_1.dw_canasta.rowcount()>0
			if tab_1.tp_1.pb_del_insumo.event clicked()=-1 then return
		loop
		cual=dw_oscuerpo.getitemnumber(dw_oscuerpo.getrow(),'item')
		double l_norden_os,l_conta_os
		string l_clug_os, l_err
		l_norden_os=dw_oscuerpo.getitemnumber(dw_oscuerpo.getrow(),'nsolicitud')
		l_conta_os=dw_oscuerpo.getitemnumber(dw_oscuerpo.getrow(),'contador')
		l_clug_os=dw_oscuerpo.getitemstring(dw_oscuerpo.getrow(),'clugar')
		delete from oscpo_adx where contador=:l_conta_os and clugar=:l_clug_os 
		and nsolicitud=:l_norden_os and item=:cual;
		if sqlca.sqlcode=-1 then
			l_err=sqlca.sqlerrtext
			rollback;
			messagebox('Error actualizando oscpo_adx',l_err)
			return
		end if
			
		dw_oscuerpo.deleterow(0)
		if dw_oscuerpo.update()=-1 then
			rollback;
		else
			commit;
			dw_oscuerpo.event rowfocuschanged(dw_oscuerpo.getrow())
			rn()
		end if
		idw_procs.deleterow(idw_procs.find('item='+string(cual),1,idw_procs.rowcount()))
		revi_est_ord()
end choose
end event

type cb_nvserv from picturebutton within tp_1
event mousemove pbm_mousemove
integer x = 37
integer y = 4
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &n"
boolean originalsize = true
string picturename = "jeringa flecha.gif"
string disabledname = "d_jeringa flecha.gif"
alignment htextalign = left!
string powertiptext = "Nuevo Servicio [Alt+N]"
end type

event clicked;if DaysAfter ( date(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")), date(now()) )> 0 then
	return -1
else
	if  SecondsAfter(time(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")),time(now())) > (integer(l_temp_ord)*60) then 
		return -1
	end if
end if
if dw_oscab.rowcount() = 0 then 
	if cb_nvorden.event clicked()=-1 then return -1
end if
long fila,cuenta,i
fila=dw_oscuerpo.insertrow(0)
dw_oscuerpo.setitem(fila,"contador",i_contador)
dw_oscuerpo.setitem(fila,"clugar",i_clug_his)
dw_oscuerpo.setitem(fila,"nsolicitud",i_norden)
SELECT Max(item) into :i FROM oscuerpo WHERE contador=:i_contador and clugar=:i_clug_his and nsolicitud=:i_norden;
if isnull(i) then i=0
i++
dw_oscuerpo.setitem(fila,"item",i)
dw_oscuerpo.scrolltorow(FILA)
dw_oscuerpo.setfocus()
if dw_oscuerpo.update()=-1 then
	dw_oscuerpo.deleterow(fila)
	rollback;
	return -1
else
	commit;
end if
return fila

end event

type sle_1 from singlelineedit within tp_1
integer x = 201
integer y = 48
integer width = 347
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

event modified;if trim(text)='' then return -1
if dw_oscab.rowcount()=0 then return -1
datetime l_fecha_ord
l_fecha_ord=dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")
if daysAfter(date(l_fecha_ord),date(now())) >= 1 then
	Messagebox("Atención","Esta orden de servicio ya está cerrada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
	return 
else
	if  SecondsAfter(time(l_fecha_ord),time(now())) > (integer(l_temp_ord)*60) then 
		Messagebox("Atención","Esta orden de servicio ya está cerrada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
		return 
	end if
end if
if dw_oscab.getitemstring(dw_oscab.getrow(),"origen")='1'  and not isvalid(w_evolucion_new)  then 
	Messagebox("Atención","No se puede agregar procedimientos ya que la orden es de Evolución")
	return
end if
choose case i_tingre
	case '2','3','4','7'
		if dw_oscab.getitemstring(dw_oscab.getrow(),'tipo_orden')='B' then return -1
end choose
long fila
fila=insert_proc(text,1)
if fila=-1 then
	rollback;
	tag=''
	text=''
	return -1
else
	commit;
	text=''
	dw_oscuerpo.scrolltorow(fila)
	dw_oscuerpo.event rowfocuschanged(fila)
	dw_oscuerpo.setfocus()
	if long(tag)>1 then //viene del objeto de hc
		dw_oscuerpo.setitem(fila,'solicitada',long(tag))
		dw_oscuerpo.event itemchanged(fila,dw_oscuerpo.object.solicitada,tag)
		tag=''
	end if
end if
end event

type st_18 from statictext within tp_1
integer x = 210
integer width = 288
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Código Proc:"
boolean focusrectangle = false
end type

type tp_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 6866
integer height = 1644
long backcolor = 67108864
string text = "Medicamentos"
long tabtextcolor = 33554432
string picturename = "entrega_med.ico"
long picturemaskcolor = 536870912
string powertiptext = "Realizar la Fórmula Médica"
pb_for pb_for
dw_formula dw_formula
cb_10 cb_10
cb_adic cb_adic
cb_borra_med cb_borra_med
st_19 st_19
pb_med_ag pb_med_ag
sle_2 sle_2
end type

on tp_2.create
this.pb_for=create pb_for
this.dw_formula=create dw_formula
this.cb_10=create cb_10
this.cb_adic=create cb_adic
this.cb_borra_med=create cb_borra_med
this.st_19=create st_19
this.pb_med_ag=create pb_med_ag
this.sle_2=create sle_2
this.Control[]={this.pb_for,&
this.dw_formula,&
this.cb_10,&
this.cb_adic,&
this.cb_borra_med,&
this.st_19,&
this.pb_med_ag,&
this.sle_2}
end on

on tp_2.destroy
destroy(this.pb_for)
destroy(this.dw_formula)
destroy(this.cb_10)
destroy(this.cb_adic)
destroy(this.cb_borra_med)
destroy(this.st_19)
destroy(this.pb_med_ag)
destroy(this.sle_2)
end on

type pb_for from pb_report within tp_2
integer x = 6683
integer y = 20
integer taborder = 40
string text = "      &F"
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
string powertiptext = "Imprimir Fórmula Médica [Alt+F]"
string nombre_rep = "Fórmula Médica"
string tipo_rep = "interno!"
boolean dialogo = true
end type

event clicked;call super::clicked;any par[3]
par[1]=i_contador
par[2]=i_norden
par[3]=i_clug_his
imprimir(par,'','0')

end event

type dw_formula from datawindow within tp_2
event keypress pbm_dwnkey
event p_itemchanged ( )
integer x = 32
integer y = 148
integer width = 6624
integer height = 1480
integer taborder = 46
string dragicon = "none!"
string dataobject = "dw_oscpo_form_hadm"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged();accepttext()
accepttext()
update()
commit;
end event

event constructor;settransobject(sqlca)
end event

event itemchanged;long solic,existe,devuelt,l_control,l_con
string articulo,l_lug

if DaysAfter ( date(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")), date(now()) )> 0 then
	return
else
	if  SecondsAfter(time(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")),time(now())) > (integer(l_temp_ord)*60) then 
		return
	end if
end if

if isvalid(dwo) then
	if dwo.name='medicamento' then
		string nulo
		setnull(nulo)
		setitem(getrow(),'c_medica',nulo)
	else
		if dwo.name='solicitada' then
			l_con=dw_formula.getitemnumber(getrow(),'contador')
			l_lug=dw_formula.getitemstring(getrow(),'clugar')
			solic=dw_formula.getitemnumber(getrow(),'nsolicitud')
			existe=dw_formula.getitemnumber(getrow(),'item')
			
			SELECT OSCuerpo.entregada into :l_control
			FROM OSCuerpo
			WHERE (((OSCuerpo.Contador)=:l_con) AND ((OSCuerpo.clugar)=:l_lug) AND ((OSCuerpo.NSolicitud)=:solic) AND ((OSCuerpo.Item)=:existe));
			if sqlca.sqlcode=-1 then
				messagebox("Error leyendo Oscuerpo para verificar control",sqlca.sqlerrtext)
				return 1
			end if
			
			if l_control > 0 then
				messagebox("Leyendo Control",'Error ya entregado')
				dw_oscab.triggerevent(rowfocuschanged!)
				return -1
			end if				
			
			long actual
			actual=getitemnumber(row,'solicitada')
			if long(data)>99 then
				if messagebox('Atención','La cantidad es superior a 99 desea continuar aún así?',question!,yesno!,2)=2 then
					settext(string(actual))
					setitem(row,'solicitada',actual)
					return 2
				end if
			end if
		end if
	End if
end if
post event p_itemchanged()
end event

event buttonclicked;long j
for j=1 to rowcount()
	if dwo.text='Escoger' then
		if getitemstring(j,'estado')='1' and (getitemnumber(j,'entregada') - getitemnumber(j,'devuelta') >getitemnumber(j,'suministrada') and (getitemstring(j,'enfermeria')='0' or isnull(getitemstring(j,'enfermeria')) )) then setitem(j,'escog','1')
	else
		setitem(j,'escog','0')
	end if
next
if dwo.text='Escoger' then
	modify(string(dwo.name)+'.text="No Escog."')
else
	modify(string(dwo.name)+'.text="Escoger"')
end if


end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,dataobject)
end event

event rowfocuschanged;if getrow()<1 then 
	return
end if
if getitemstring(getrow(),'pos')='2' then
	pb_np.enabled=true
else
	pb_np.enabled=false
end if

if isnull(getitemnumber(getrow(),'item')) then
	ord_ser_item=0
else
	ord_ser_item=getitemnumber(getrow(),'item')
end if

end event

type cb_10 from picturebutton within tp_2
event mousemove pbm_mousemove
integer x = 585
integer y = 4
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &b"
boolean originalsize = true
string picturename = "capsula busca.GIF"
string disabledname = "d_capsula busca.GIF"
alignment htextalign = left!
string powertiptext = "Buscar Medicamento [Alt+B]"
end type

event clicked;choose case i_tingre
	case '1'
		if dw_oscab.rowcount() = 0 then 
			if cb_nvorden.event clicked()=-1 then return -1
		end if
		st_pa_medica st_m
		st_m.sle=sle_2
		st_m.origen= i_tingre
		openwithparm(w_busca_med,st_m)
	case '2','3','4','7'
		if dw_oscab.rowcount()=0 then return
		if not isnull(dw_oscab.getitemstring(dw_oscab.getrow(),'cod_banco')) then return
		if tag='1' then
			if f_permiso_boton(this,'ATOS')=0 then return
		end if
		string estado
		if dw_oscab.getitemstring(dw_oscab.getrow(),"origen")='1'  and not isvalid(w_evolucion_new)  then 
			Messagebox("Atención","No se puede agregar medicamentos ya que la orden es de Evolución")
			return
		end if
		if i_est_hadm<>"1" then
			Messagebox("Atención","No se puede agregar medicamentos ya que la admisión no está activa")
			return
		end if
		datetime l_fecha_ord
		l_fecha_ord=dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")
		if daysAfter(date(l_fecha_ord),date(now())) >0 then
			Messagebox("Atención","Esta orden de servicio ya está cerrada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
			return
		else
			if  SecondsAfter(time(l_fecha_ord),time(now())) > (integer(l_temp_ord)*60) then 
				Messagebox("Atención","Esta orden de servicio ya está cerrada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
				return
			end if
		end if
		estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
		if estado="2" or estado="3" then
			Messagebox("Atención","Esta orden de servicio ya está completa o anulada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
			return
		end if
		string  l_i_alm_urg,l_i_alm_hosp ,l_i_alm_amb 
		if ls_pro=32 THEN	
			RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_URG", Regstring!, l_i_alm_urg )
			RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_HOSP", Regstring!, l_i_alm_hosp )
			RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_AMB", Regstring!, l_i_alm_amb )
		end if
		if ls_pro=64 THEN	
			 RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_URG", Regstring!, l_i_alm_urg )
			RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_HOSP", Regstring!, l_i_alm_hosp )
			RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_AMB", Regstring!, l_i_alm_amb )
		end if
		st_pa_medica st_med
		st_med.sle=sle_2
		st_med.origen= i_tingre
		if i_tingre='2' then  
			 st_med.alm_cext=l_i_alm_urg
	    else
			 if i_tingre='3' or i_tingre='7' then  
				 st_med.alm_cext=l_i_alm_hosp
		      else  
			     st_med.alm_cext= l_i_alm_amb
			end if
		end if
		openwithparm(w_busca_med,st_med)
end choose
end event

type cb_adic from picturebutton within tp_2
event mousemove pbm_mousemove
integer x = 37
integer y = 4
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &a"
boolean originalsize = true
string picturename = "capsula.GIF"
string disabledname = "d_capsula.GIF"
alignment htextalign = left!
string powertiptext = "Adicionar Medicamento [Alt+A]"
end type

event clicked;if DaysAfter ( date(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")), date(now()) )> 0 then
	return -1
else
	if  SecondsAfter(time(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")),time(now())) > (integer(l_temp_ord)*60) then 
		return -1
	end if
end if
if dw_oscab.rowcount() = 0 then 
	if cb_nvorden.event clicked()=-1 then return -1
end if
long fila,cuenta,i
fila=dw_formula.insertrow(0)
dw_formula.setitem(fila,"contador",i_contador)
dw_formula.setitem(fila,"clugar",i_clug_his)
dw_formula.setitem(fila,"nsolicitud",i_norden)
SELECT Max(item) into :i FROM oscuerpo WHERE contador=:i_contador and clugar=:i_clug_his and nsolicitud=:i_norden;
if isnull(i) then i=0
i++
dw_formula.setitem(fila,"item",i)
dw_formula.scrolltorow(FILA)
dw_formula.setfocus()
if dw_formula.update()=-1 then
	rollback;
	dw_formula.deleterow(fila)
	return -1
else
	commit;
end if
return fila
end event

type cb_borra_med from picturebutton within tp_2
event mousemove pbm_mousemove
integer x = 736
integer y = 4
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
string picturename = "capsula X.GIF"
string disabledname = "d_capsula X.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Medicamento [Alt+B]"
end type

event clicked;choose case i_tingre
	case '1'
		dw_formula.deleterow(0)
		if dw_formula.update()=-1 then
			rollback;
			return -1
		else
			commit;
		end if
		dw_formula.setfocus()
		return 1
	case '2','3','4','7'
		if dw_oscab.rowcount()=0 or dw_formula.rowcount()=0 then return
		string estado
		if i_est_hadm<>"1" then
			Messagebox("Atención","No se puede borrar medicamentos ya que la admisión no está activa")
			return
		end if
//		if dw_oscab.getitemstring(dw_oscab.getrow(),"origen")='1'  and not isvalid(w_evolucion_new)  then 
//			Messagebox("Atención","No se puede borrar medicamentos ya que la orden es de Evolución")
//			return
//		end if
		datetime l_fecha_ord
		l_fecha_ord=dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")
		if daysAfter(date(l_fecha_ord),date(now())) > 0 then
			Messagebox("Atención","Esta orden de servicio ya está cerrada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
			return
		else
			if  SecondsAfter(time(l_fecha_ord),time(now())) > (integer(l_temp_ord)*60) then 
				Messagebox("Atención","Esta orden de servicio ya está cerrada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
				return
			end if
		end if		

		estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
		if estado="2" or estado="3" then
			Messagebox("Atención","Esta orden de servicio ya está completa o anulada, no se pueden borrar procedimientos")
			return
		end if
		if dw_formula.getitemnumber(dw_formula.getrow(),"entregada")>0 then 
			messagebox("Atención","Este procedimiento no se puede eliminar, porque ya fue atendido total o parcialmente")
			return
		end if
		if dw_formula.getitemstring(dw_formula.getrow(),"estado")<>"1" then
			messagebox("Atención","Este medicamento no se puede eliminar, porque su estado es diferente a 'Sin realizar'")
			return
		end if
		dw_formula.deleterow(0)
		if dw_formula.update()=-1 then
			rollback;
		else
			commit;
		end if
		revi_est_ord()
		return 1
end choose
end event

type st_19 from statictext within tp_2
integer x = 210
integer width = 288
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Código Med:"
boolean focusrectangle = false
end type

type pb_med_ag from picturebutton within tp_2
boolean visible = false
integer x = 6693
integer y = 596
integer width = 142
integer height = 124
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "med_agrupa.gif"
string disabledname = "med_agrupa_d.gif"
alignment htextalign = left!
end type

event clicked;//if tag='1' then
//	if f_permiso_boton(this,'ATOS')=0 then return
//end if
//trae_ord trae2_ord
//trae2_ord.contador=i_contador
//trae2_ord.lugar=i_clug_his
//trae2_ord.solicitud=i_norden
//trae2_ord.item=ord_ser_item
//openwithparm(w_nopos,trae2_ord)
//
//
end event

type sle_2 from singlelineedit within tp_2
integer x = 197
integer y = 56
integer width = 347
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

event modified;if trim(text)='' then return
if dw_oscab.rowcount()=0 then return
if l_tiporep="E" then
	Messagebox("Atención","No se puede ingresar medicamentos ya que la orden es de Evolución")
	return
end if
		
datetime l_fecha_ord
l_fecha_ord=dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")
if daysAfter(date(l_fecha_ord),date(now())) >= 1 then
	Messagebox("Atención","Esta orden de servicio ya está cerrada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
	return
else
	if  SecondsAfter(time(l_fecha_ord),time(now())) > (integer(l_temp_ord)*60) then 
		Messagebox("Atención","Esta orden de servicio ya está cerrada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
		return
	end if
end if
if dw_oscab.getitemstring(dw_oscab.getrow(),"origen")='1'  and not isvalid(w_evolucion_new)  then 
	Messagebox("Atención","No se puede agregar medicamentos ya que la orden es de Evolución")
	return
end if
choose case i_tingre
	case '2','3','4','7'
		if not isnull(dw_oscab.getitemstring(dw_oscab.getrow(),'cod_banco')) then return
end choose
long fila
int l_cant
l_cant=integer(tag)
if l_cant>0 and  dw_oscab.getitemstring(dw_oscab.getrow(),"origen")='0' then l_cant=1
if l_cant=0 or isnull(l_cant) then l_cant=1
fila=insert_med(text,l_cant)
if fila=-1 then
	rollback;
	return -1
else
	if fila=0 then return
	commit;
	text=''
	dw_formula.scrolltorow(fila)
	dw_formula.setfocus()
	if l_cant>=1 then//viene del objeto de hc
		l_cant=dw_formula.getitemnumber(fila,'solicitada')
		tag=string(dw_formula.getitemnumber(fila,'solicitada'))
		dw_formula.event itemchanged(fila,dw_formula.object.solicitada,string(l_cant))
	end if
end if

end event

type cb_nvorden from picturebutton within uo_orden_formula_cost
event mousemove pbm_mousemove
string tag = "c"
integer x = 5257
integer y = 44
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &n"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Nueva Orden [Alt+N]"
end type

event clicked;if i_contador = -1 then return -1
long fila,nserv1,primer
st_ordenes st_llega
string cplan,origen='0',l_profe,usu
st_usuarios st_ux

choose case i_tingre
	case '2','3','4','7'
		if i_contador=-1 then return
		if i_tingre='2'  and (isnull(i_triage_cla) or i_triage_cla='') then 
			messagebox("Atención","Debe definir Triagge")
			return -1
		end if
		//para validar usuario puede o no crear  
		if isvalid(w_evolucion_new) then
			cplan=this.tag
			origen='1'
			this.tag='c'
			dw_profe.setitem(1,1,profesi)
			l_profe=profesi
		else
			setnull(profesi)
			if isnull(dw_profe.getitemstring(1,1)) then
				messagebox("Atención","Elija un profesional para poder adicionar una orden de servicio")
				return -1
			else
				if isnull(profesi) or profesi='' then 	
					l_profe=dw_profe.getitemstring(1,1)
				else
					l_profe=profesi
				end if
			end if
		end if	
		select profe.usuario,evoluciona,tipo,profe.enfermero into :l_usu,:l_evo,:l_tpu,:l_enfe FROM profe left join usuarios ON profe.usuario= usuarios.usuario where codprof=:l_profe;
		if isnull(l_usu) then
			messagebox("Atención",'Este profesional no tiene relación con usuarios, no puede Continuar')
			return -1
		else
			usu=usuario
			usuario=l_usu
		end if
		
		if tag='1' then		
			if f_permiso_boton(this,'ATOS')=0 then return -1
		end if

		if i_est_hadm<>"1" and i_est_hadm<>'R' then
			Messagebox("Atención","No se pueden agregar más ordenes de servicio a esta admisión")
			return -1
		end if
		
		if l_tpu<>'F' then
			if l_evo='1'  and  not isvalid(w_evolucion_new) then
				Messagebox("Atención","El profesional que eligió no tiene permiso para crear ordenes debe hacerlo desde evoluciones")
				return -1
			end if
			if not isvalid(w_evolucion_new) then
				if l_tpu<>'S' or l_tpu='U' then
					st_ux.usuario=l_profe
					st_ux.destino='ATOS'
					openwithparm(w_conecta_evol,st_ux)
					st_llega= Message.PowerObjectParm
					if st_llega.clugar='!' then 
						return -1
					end if
					s_esp=st_llega.cesp
				end if
			end if
		else
			if not isvalid(w_evolucion_new) then
				st_ux.usuario=l_profe
				st_ux.destino='ATOS'				
				openwithparm(w_conecta_evol,st_ux)
				st_llega= Message.PowerObjectParm
				if st_llega.clugar='!' then 
					return -1
				end if
				s_esp=st_llega.cesp
			end if
		end if
		
		/////Para crear orden			
		long j
		
		select max(nsolicitud) into :j from oscabeza 
		where contador=:i_contador and clugar=:i_clug_his and tipo_orden <>'C';
		if sqlca.sqlcode=-1 then
			messagebox('Error leyendo el máximo oscabeza.nsolicitud',sqlca.sqlerrtext)
			return -1
		end if
		if isnull(j) then j=0
		j++
		
		///Para DX y Finalidad
		st_x_ordenext st_ord
		setnull(st_ord.dx)
		setnull(st_ord.descp)
		setnull(st_ord.finc)
		setnull(st_ord.ambp)
		setnull(st_ord.codgeral)
		st_ord.cual='ord'
		st_ord.serv=i_tingre		
		if isvalid(w_evolucion_new) and j<>1 then 
			openwithparm(w_escog_profe,st_ord)
			st_ord=message.powerobjectparm
			if st_ord.ambp='' or isnull(st_ord.ambp) then return -1
		end if
		//////		

		dw_oscab.insertrow(1)
		dw_oscab.scrolltorow(1)
		dw_oscab.setitem(1,"contador",i_contador)
		dw_oscab.setitem(1,"clugar",i_clug_his)
		dw_oscab.setitem(1,"usuario",usuario)
		usuario=usu		
		dw_oscab.setitem(1,"tipo_orden",'H')
		dw_oscab.setitem(1,"nsolicitud",j)
		dw_oscab.setitem(1,"fecha",datetime(today(),now()))
		dw_oscab.setitem(1,"codprof",dw_profe.getitemstring(1,1))
		dw_oscab.setitem(1,"cesp",s_esp)
		dw_oscab.setitem(1,"origen",origen)
		dw_oscab.setitem(1,'cod_rips',st_ord.dx)
		dw_oscab.setitem(1,'cod_fina',st_ord.finc)
		dw_oscab.setitem(1,'codgeral',st_ord.codgeral)			
			
		if i_indapdx='Q' then
			dw_oscab.setitem(1,"nro_qx",i_nqx)
			dw_oscab.setitem(1,"clugar_qx",i_clug_qx)
			dw_oscab.setitem(1,"consec_qx",i_consec_qx)
			dw_oscab.setitem(1,"tipo_orden",'X')
		end if
		if cbx_banco.checked then dw_oscab.setitem(1,"tipo_orden",'B')
		sqlca.autocommit=true
		if dw_oscab.update()= -1 then
			sqlca.autocommit=false
			rollback;
			//PILAS
			parent.retrieve(i_contador,i_clug_his,i_profe,i_nh,i_clug_hadm,i_tingre,i_nqx,i_clug_qx,i_consec_qx,s_esp )
			return -1
		else
			sqlca.autocommit=false
			commit;
			dw_oscab.triggerevent(rowfocuschanged!)
			if sle_obs.text='obs' then
				dw_obs.retrieve(i_tingre)
				for primer=1 to dw_obs.rowcount()
					insert_proc(dw_obs.getitemstring(primer,'cproced'),1)
				next
				 setnull(sle_obs.text)
			end if
			if dw_oscab.dataobject<>'dw_oscab_qx' then 
				if  dw_oscab.getitemnumber(1,'ordenes')=1 then
					dw_primerorden.retrieve(i_tingre)
					if cplan='c' or isnull(cplan) then 			
						SELECT cadena into :cplan
						FROM parametros_gen
						WHERE (((codigo_para)=48));
						if sqlca.sqlnrows=0 then
							messagebox('Atencíon','No hay parametro 42')
							return 
						end if
					end if
					dw_primerorden.setfilter("codplantilla like '"+cplan+"'")
					dw_primerorden.filter()
					//hacer filtro por servicio
					for primer=1 to dw_primerorden.rowcount()
						if dw_primerorden.getitemstring(primer,'tipo')='P' then
							if dw_primerorden.getitemstring(primer,'agrupser')='04' and i_indapdx='Q' then continue
							if dw_primerorden.getitemstring(primer,'agrupser')<>'04' then
								insert_proc(dw_primerorden.getitemstring(primer,'proced'),dw_primerorden.getitemnumber(primer,'cantidad'))
							else
								for j=1 to dw_primerorden.getitemnumber(primer,'cantidad')
									insert_proc(dw_primerorden.getitemstring(primer,'proced'),1)
								next
							end if
						else
							insert_med(dw_primerorden.getitemstring(primer,'proced'),dw_primerorden.getitemnumber(primer,'cantidad'))
						end if
					next
					dw_primerorden.setfilter("")
					dw_primerorden.filter()
				end if
			end if
		end if
		
		
		return 1
	///////////////////////////////////////////////////////	
	case '1'
		fila=dw_oscab.insertrow(0)
		dw_oscab.setitem(fila,"contador",i_contador)
		dw_oscab.setitem(fila,"clugar",i_clug_his)
		dw_oscab.setitem(fila,"usuario",usuario)
		dw_oscab.setitem(fila,"codprof",i_profe)
		dw_oscab.setitem(fila,"cesp",s_esp)
		dw_oscab.setitem(fila,"origen",origen)
		if i_desdiag='' then setnull(i_desdiag)
		dw_oscab.setitem(fila,'diagnostico',i_desdiag)
		dw_oscab.setitem(fila,'cod_rips',i_codrips)
		if i_coddiag='' then setnull(i_coddiag)
		dw_oscab.setitem(fila,'codgeral',i_coddiag)
		dw_oscab.setitem(fila,"fecha",datetime(today(),now()))
		SELECT Max(NSolicitud) into :nserv1
		FROM OSCabeza
		WHERE OSCabeza.Contador=:i_contador and clugar=:i_clug_his;
		if sqlca.sqlcode=-1 then return -1
		if isnull(nserv1) then nserv1=0
		nserv1++
		i_norden=nserv1
		dw_oscab.setitem(fila,"nsolicitud",nserv1)
		sqlca.autocommit=true
		if dw_oscab.update()<1 then
			sqlca.autocommit=false
			rollback;
			dw_oscab.deleterow(fila)
			return -1
		else
			sqlca.autocommit=false
			commit;
			dw_oscab.scrolltorow(fila)
			dw_oscab.setfocus()
		end if
		return 1
end choose
end event

event constructor;f_inicia_boton(this,'ATOS')
end event

