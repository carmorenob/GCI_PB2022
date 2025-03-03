$PBExportHeader$uo_orden_formula_new.sru
$PBExportComments$Se utiliza todavía en las ventanas de las ordenes anteriores como las de consulta externa odonto,etc
forward
global type uo_orden_formula_new from userobject
end type
type dw_llevar from datawindow within uo_orden_formula_new
end type
type cbx_banco from checkbox within uo_orden_formula_new
end type
type dw_primerorden from datawindow within uo_orden_formula_new
end type
type gb_1 from groupbox within uo_orden_formula_new
end type
type pb_rn from picturebutton within uo_orden_formula_new
end type
type pb_rip from picturebutton within uo_orden_formula_new
end type
type pb_evol from picturebutton within uo_orden_formula_new
end type
type pb_new from picturebutton within uo_orden_formula_new
end type
type dw_profe_atiende from datawindow within uo_orden_formula_new
end type
type st_5 from statictext within uo_orden_formula_new
end type
type st_respon from statictext within uo_orden_formula_new
end type
type st_6 from statictext within uo_orden_formula_new
end type
type pb_2 from picturebutton within uo_orden_formula_new
end type
type tab_1 from tab within uo_orden_formula_new
end type
type tp_1 from userobject within tab_1
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
type sle_2 from singlelineedit within tp_2
end type
type tp_2 from userobject within tab_1
pb_for pb_for
dw_formula dw_formula
cb_10 cb_10
cb_adic cb_adic
cb_borra_med cb_borra_med
st_19 st_19
sle_2 sle_2
end type
type tp_3 from userobject within tab_1
end type
type st_3 from statictext within tp_3
end type
type pb_1 from picturebutton within tp_3
end type
type st_1 from statictext within tp_3
end type
type sle_3 from singlelineedit within tp_3
end type
type pb_insert_insumo from picturebutton within tp_3
end type
type pb_del_insumo from picturebutton within tp_3
end type
type dw_combo from datawindow within tp_3
end type
type dw_canasta from datawindow within tp_3
end type
type tp_3 from userobject within tab_1
st_3 st_3
pb_1 pb_1
st_1 st_1
sle_3 sle_3
pb_insert_insumo pb_insert_insumo
pb_del_insumo pb_del_insumo
dw_combo dw_combo
dw_canasta dw_canasta
end type
type tab_1 from tab within uo_orden_formula_new
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
end type
type dw_oscab from datawindow within uo_orden_formula_new
end type
type dw_profe from datawindow within uo_orden_formula_new
end type
type st_2 from statictext within uo_orden_formula_new
end type
type cb_bus_diag from picturebutton within uo_orden_formula_new
end type
type cb_nvorden from picturebutton within uo_orden_formula_new
end type
type cb_borrorden from picturebutton within uo_orden_formula_new
end type
type pb_abre from picturebutton within uo_orden_formula_new
end type
type pb_ordenes from picturebutton within uo_orden_formula_new
end type
end forward

global type uo_orden_formula_new from userobject
integer width = 3511
integer height = 1628
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_llevar dw_llevar
cbx_banco cbx_banco
dw_primerorden dw_primerorden
gb_1 gb_1
pb_rn pb_rn
pb_rip pb_rip
pb_evol pb_evol
pb_new pb_new
dw_profe_atiende dw_profe_atiende
st_5 st_5
st_respon st_respon
st_6 st_6
pb_2 pb_2
tab_1 tab_1
dw_oscab dw_oscab
dw_profe dw_profe
st_2 st_2
cb_bus_diag cb_bus_diag
cb_nvorden cb_nvorden
cb_borrorden cb_borrorden
pb_abre pb_abre
pb_ordenes pb_ordenes
end type
global uo_orden_formula_new uo_orden_formula_new

type variables
string i_codrep_formula , i_codrep_orden , i_coddiag , i_desdiag , i_codrips
boolean repord_dialogo , repfor_dialogo , repord_vprelim , repfor_vprelim , i_observacion
private long i_contador=-1 , i_norden , i_nh , i_nqx , i_consec_qx
private string i_clug_his , i_profe , i_indapdx , i_clug_hadm , i_est_hadm , i_cemp , i_ccont , i_tingre , i_clug_qx
datawindowchild idw_procs , idw_genericos , idw_insumo


end variables

forward prototypes
public function integer reset ()
public function long insert_proc (string p_codigo, integer p_cant)
public function long insert_med (string p_codigo, integer p_cant)
public function long insert_proc (string p_codigo, integer p_cant, long p_ntrat, string p_clug_tto, integer p_item_tto)
public subroutine cambia_diags (string p_cdiag)
public function integer init (string p_indapdx)
public function integer rn ()
public function integer retrieve (long contador, string clugar_his, string p_profe, long p_nh, string p_clug_hadm, string p_tingre, long p_nqx, string p_clug_qx, long p_consec_qx)
public subroutine revi_est_ord ()
public function long insert_proc_banco (string p_codigo, integer p_cant, string p_banco, string p_ctipoemp, string p_desc_tipo)
end prototypes

public function integer reset ();if dw_oscab.accepttexT()=-1 then return -1
if tab_1.tp_1.dw_oscuerpo.accepttexT()=-1 then return -1
if tab_1.tp_2.dw_formula.accepttexT()=-1 then return -1
dw_oscab.reset()
tab_1.tp_1.dw_oscuerpo.reset()
tab_1.tp_2.dw_formula.reset()
i_contador=-1
return 1
end function

public function long insert_proc (string p_codigo, integer p_cant);if i_contador = -1 then return -1
long fila,nserv1,j
string err
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
		if p_cant>1 then tab_1.tp_1.dw_oscuerpo.setitem(fila,'solicitada',p_cant)
		if tab_1.tp_1.dw_oscuerpo.update()=-1 then
			tab_1.tp_1.dw_oscuerpo.deleterow(fila)
			return -1
		end if
		tab_1.tp_1.dw_oscuerpo.setcolumn('solicitada')
	case '2','3','4','7'
		string estado,areaadx
		if i_est_hadm<>"1" then
			Messagebox("Atención","No se puede agregar procedimientos ya que la admisión no está activa")
			return -1
		end if
		if dw_oscab.rowcount()=0 then return -1
		estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
		if (estado="2" or estado="3") /*and dw_oscab.getitemstring(dw_oscab.getrow(),"tipo_orden")<>'C'*/ then
			Messagebox("Atención","Esta orden de servicio ya está completa o anulada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
			return -1
		end if
		string plan,emp,contrato,agrup,banco,revisa
		long nserv,cuantos
		str_proc str
		str=f_busca_cups(p_codigo,w_principal.dw_1.getitemstring(1,'sexo'),w_principal.dw_1.getitemnumber(1,'dias'),'1')
		if isnull(str.descripcion) then return -1
		if str.agrupser='04' and i_indapdx='Q' then
			messagebox('Atención','Este es un procedimiento quirúrgico, no lo puede cargar por orden de servicio')
			return -1
		end if
		if not isnull(dw_oscab.getitemstring(dw_oscab.getrow(),'cod_banco')) then
			banco=dw_oscab.getitemstring(dw_oscab.getrow(),'cod_banco')
			SELECT Min(cod_empaque) into :revisa
			FROM banco_producto
			WHERE banco_producto.cod_banco=:banco AND banco_producto.codproced=:p_codigo;
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
		/////////////////////////////canastas
		if isnull(dw_oscab.getitemstring(dw_oscab.getrow(),'cod_banco')) and isnull(str.codadx) /*and str.agrupser<>'04'*/ then
			st_xa_canastas st
			st.cproc=p_codigo
			st.sexo=w_principal.dw_1.getitemstring(1,'sexo')
			st.edad_dias=w_principal.dw_1.getitemnumber(1,'dias')
			st.dw_canasta=tab_1.tp_3.dw_canasta
			st.contador=i_contador
			st.clugar=i_clug_his
			st.norden=i_norden
			st.item=nserv
			openwithparm(w_canastas,st)
			if message.stringparm<>'ok' then 
				tab_1.tp_1.dw_oscuerpo.deleterow(fila)	
				return -1
			END IF
		end if
		/////////////////////////////fin canastas
		
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"codproced",str.cproc)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"descripcion",str.descripcion)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"codaadx",str.codadx)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"rips",str.rips)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"agrupser",str.agrupser)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"item",nserv)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"contador",i_contador)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"clugar",i_clug_his)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"nsolicitud",i_norden)
		
		long cant
		cant=p_cant
		if p_cant>1 and str.agrupser='04' then cant=1
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"solicitada",cant)
		if tab_1.tp_1.dw_oscuerpo.update(true,false)<1 then
			tab_1.tp_1.dw_oscuerpo.deleterow(fila)	
		end if
		if tab_1.tp_3.dw_canasta.update(true,false)=-1 then
			tab_1.tp_1.dw_oscuerpo.deleterow(fila)	
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
		tab_1.tp_1.dw_oscuerpo.event rowfocuschanged(fila)
		tab_1.tp_1.dw_oscuerpo.setcolumn("solicitada")
		tab_1.tp_1.dw_oscuerpo.setfocus()
		tab_1.tp_1.dw_oscuerpo.resetupdate()
		tab_1.tp_3.dw_canasta.resetupdate()
end choose
return fila
end function

public function long insert_med (string p_codigo, integer p_cant);if i_contador = -1 then return -1
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
		tab_1.tp_2.dw_formula.setitem(fila,"via",stm.via)
		if p_cant>1 then tab_1.tp_2.dw_formula.setitem(fila,'solicitada',p_cant)
		if tab_1.tp_2.dw_formula.update()=-1 then
			tab_1.tp_2.dw_formula.deleterow(fila)
			return -1
		else
			tab_1.tp_2.dw_formula.setcolumn('solicitada')
			return fila
		end if
	case '2','3','4','7'
			
		if i_est_hadm<>"1" then
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
		if (estado="2" or estado="3") /*and dw_oscab.getitemstring(dw_oscab.getrow(),"tipo_orden")<>'C'*/ then
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
			fila=tab_1.tp_3.dw_canasta.insertrow(0)
			tab_1.tp_3.dw_canasta.setitem(fila,"codgenerico",codproc)
			tab_1.tp_3.dw_canasta.setitem(fila,"descripcion",desproc)
			tab_1.tp_3.dw_canasta.setitem(fila,"pos",pos)
			tab_1.tp_3.dw_canasta.setitem(fila,"item",tab_1.tp_1.dw_oscuerpo.getitemnumber(tab_1.tp_1.dw_oscuerpo.getrow(),'item'))
			for k=fila to 1 step -1
				if tab_1.tp_3.dw_canasta.find('secuencia='+string(k),1,tab_1.tp_3.dw_canasta.rowcount())=0 then exit
			next
			tab_1.tp_3.dw_canasta.setitem(fila,'secuencia',k)

			tab_1.tp_3.dw_canasta.setitem(fila,"nsolicitud",i_norden)
			tab_1.tp_3.dw_canasta.setitem(fila,"contador",i_contador)
			tab_1.tp_3.dw_canasta.setitem(fila,"clugar",i_clug_his)
			tab_1.tp_3.dw_canasta.setitem(fila,"solicitada",p_cant)
			if tab_1.tp_2.dw_formula.update()<1 then
				tab_1.tp_2.dw_formula.deleterow(fila)	
				rollback;
				return -1
			else
				commit;
				tab_1.tp_3.dw_canasta.scrolltorow(fila)
				tab_1.tp_3.dw_canasta.setcolumn("solicitada")
				tab_1.tp_3.dw_canasta.setfocus()
			end if
			return fila
		end if
end choose

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
		tab_1.tp_2.dw_formula.dataobject='dw_oscpo_form_cext_new'
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
		f_titulos_dw_gb(dw_profe,'COEX',gb_1)	
	case '1' //apdx
	case '2', '3' , '4','7'
		tab_1.tp_2.visible=false
		tab_1.tp_2.enabled=false
		cbx_banco.visible=true
		tab_1.tp_1.cb_nvserv.enabled=false
		tab_1.tp_2.cb_adic.enabled=false
		dw_oscab.dataobject='dw_oscab_hadm'
		dw_oscab.settransobject(sqlca)
		tab_1.tp_1.dw_oscuerpo.dataobject='dw_oscpo_hadm'
		tab_1.tp_1.dw_oscuerpo.settransobject(sqlca)
		tab_1.tp_2.dw_formula.dataobject='dw_oscpo_form_hadm'
		tab_1.tp_2.dw_formula.settransobject(sqlca)
		cb_bus_diag.visible=false
		tab_1.move(5,668)
		tab_1.height+=90
		tab_1.tp_1.dw_oscuerpo.height+=90
		tab_1.tp_2.dw_formula.height+=90
		tab_1.tp_3.dw_canasta.height+=90
		pb_2.y+=228
		st_6.y+=228
		st_respon.y+=228
		st_5.y+=228
		dw_profe_atiende.y+=228
		pb_new.y+=228
		pb_evol.y+=228
		pb_rip.y+=228
		pb_rn.y+=228
		dw_oscab.resize(1815,472)
		dw_oscab.move(1613,166)
		f_titulos_dw_gb(dw_profe,'ATOS',gb_1)
		gb_1.resize(1870,658)
		gb_1.move(1590,0)
	case '5' //odonto
	case '6' //pyp
	case 'Q' //qx
		tab_1.tp_2.visible=false
		tab_1.tp_2.enabled=false
		cbx_banco.visible=true
		dw_oscab.dataobject='dw_oscab_qx'
		dw_oscab.settransobject(sqlca)
		tab_1.tp_1.dw_oscuerpo.dataobject='dw_oscpo_hadm'
		tab_1.tp_1.dw_oscuerpo.settransobject(sqlca)
		tab_1.tp_2.dw_formula.dataobject='dw_oscpo_form_hadm'
		tab_1.tp_2.dw_formula.settransobject(sqlca)
		cb_bus_diag.visible=false
		st_2.move(1738,0)
		cb_nvorden.resize(119,100)
		cb_borrorden.resize(119,100)
		pb_abre.resize(119,100)
		pb_ordenes.resize(119,100)
		cb_nvorden.move(2971,0)
		cb_borrorden.move(3090,0)
		pb_abre.move(3209,0)
		pb_ordenes.move(3328,0)
		dw_profe.resize(651,84)
		dw_profe.move(2050,0)
		cbx_banco.move(2710 , 0)
		gb_1.x=970
		gb_1.resize(2501,480)
		dw_oscab.resize(2455,360)
		dw_oscab.move(987,104)
		pb_2.y -=60
		st_6.y -=60
		st_respon.y -=60
		st_5.y -=60
		dw_profe_atiende.y -=60
		pb_new.y -=60
		pb_evol.y -=60
		tab_1.move(0,380)
		gb_1.text='Ordenes de Servicio del ProcQx.'
		tab_1.tp_1.dw_oscuerpo.height -=140
		tab_1.tp_2.dw_formula.height -=140
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

public function integer retrieve (long contador, string clugar_his, string p_profe, long p_nh, string p_clug_hadm, string p_tingre, long p_nqx, string p_clug_qx, long p_consec_qx);i_profe=p_profe
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
if i_indapdx='Q' then
	dw_oscab.retrieve(i_nqx,i_clug_qx,i_consec_qx)
else
	dw_oscab.retrieve(i_contador,i_clug_his)
end if
dw_oscab.setredraw(true)

if i_tingre='2' or i_tingre='3' or i_tingre='4' or i_tingre='7' then
	string enobs
	long donde
	select estado,cemp,ccontrato,en_observa into :i_est_hadm,:i_cemp,:i_ccont,:enobs from hospadmi where nh=:i_nh and clugar=:i_clug_hadm;
	if sqlca.sqlcode=-1 then
		messagebox('Error leyendo estado de HospAdmi',sqlca.sqlerrtext)
	end if
	if enobs='1' then
		i_observacion=true
	else
		i_observacion=false
	end if
	string respon
	setnull(respon)
	if g_motor='postgres' then
		SELECT 
		 profe.nombre1|| case when profe.nombre2  is null then ' ' else  '  '||profe.nombre2 end ||' '|| 
		 profe.apellido1|| case when profe.apellido2 is null then ' ' else  '  '||profe.apellido2 end as desprof
		into :respon
		FROM HospRespon, Profe
		WHERE HospRespon.CodProf=profe.codprof AND HospRespon.NH=:i_nh and clugar=:i_clug_hadm 
		AND HospRespon.fecha_fin Is Null;
	else
		SELECT 
		 profe.nombre1+ case when profe.nombre2  is null then ' ' else  '  '+profe.nombre2 end +' '+ 
		 profe.apellido1+ case when profe.apellido2 is null then ' ' else  '  '+profe.apellido2 end as desprof
		into :respon
		FROM HospRespon, Profe
		WHERE HospRespon.CodProf=profe.codprof AND HospRespon.NH=:i_nh and clugar=:i_clug_hadm 
		AND HospRespon.fecha_fin Is Null;
	End If
	if isnull(respon) then
		st_respon.text='Ninguno'
	else
		st_respon.text=respon
	end if
	if dw_oscab.find('tipo_orden="C"',1,dw_oscab.rowcount())=0 and i_est_hadm="1" and i_indapdx<>'Q' then
		uo_datastore ds_estancia
		ds_estancia=create uo_datastore
		if i_tingre='2' or i_tingre='4' then
			if (i_tingre='2' and i_observacion) or (i_tingre='4') then
				ds_estancia.dataobject='dw_hospestancia'
				ds_estancia.settransobject(sqlca)
				ds_estancia.retrieve(i_tingre)
				if i_tingre='2' and ds_estancia.rowcount()=0 then
					messagebox('Atención','El paciente está en Observación y no se puede determinar el procedimiento para esta en la tabla Hospestancia. Debe configurar esto para continuar')
					rollback;
					return -1
				end if
			end if
		end if
		if i_tingre='3' or i_tingre='4' or i_tingre='7' then // se vuelve a hacer del 4 porque si tiene cama ese proc gana
			ds_estancia.dataobject='dw_estancia'
			ds_estancia.settransobject(sqlca)
			ds_estancia.retrieve(i_nh,today(),i_clug_his)
			if ds_estancia.rowcount()=0 and (i_tingre='3' or i_tingre='7') then
				messagebox('Atención','La cama donde se encuentra el paciente no tiene configurado procedimiento de estancia. Debe configurarla para continuar')
				rollback;
				return -1
			end if
		end if
		if ds_estancia.rowcount()>0 then
			dw_oscab.insertrow(1)
			dw_oscab.setitem(1,'tipo_orden','C')
			dw_oscab.setitem(1,'nsolicitud',999)
			dw_oscab.setitem(1,'contador',i_contador)
			dw_oscab.setitem(1,'clugar',i_clug_his)
			if dw_oscab.update()=-1 then
				rollback;
			end if
			i_norden=999
			donde=insert_proc(ds_estancia.getitemstring(ds_estancia.rowcount(),'cproced'),0)
			if donde=-1 then
				rollback;
			else
				tab_1.tp_1.dw_oscuerpo.setitem(donde,'estado','C')
				if tab_1.tp_1.dw_oscuerpo.update()=-1 then
					rollback;
				end if
			end if
		end if
		commit;
	end if
end if
return 1
end function

public subroutine revi_est_ord ();long j
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
if j=0 and dw_oscab.getitemstring(dw_oscab.getrow(),'tipo_orden')<>'C' then
	if dw_oscab.getitemstring(dw_oscab.getrow(),'estado')='1' then
		dw_oscab.setitem(dw_oscab.getrow(),'estado','2')//completa
	end if
else
	if dw_oscab.getitemstring(dw_oscab.getrow(),'estado')='2' then
		dw_oscab.setitem(dw_oscab.getrow(),'estado','1')
	end if
end if
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

on uo_orden_formula_new.create
this.dw_llevar=create dw_llevar
this.cbx_banco=create cbx_banco
this.dw_primerorden=create dw_primerorden
this.gb_1=create gb_1
this.pb_rn=create pb_rn
this.pb_rip=create pb_rip
this.pb_evol=create pb_evol
this.pb_new=create pb_new
this.dw_profe_atiende=create dw_profe_atiende
this.st_5=create st_5
this.st_respon=create st_respon
this.st_6=create st_6
this.pb_2=create pb_2
this.tab_1=create tab_1
this.dw_oscab=create dw_oscab
this.dw_profe=create dw_profe
this.st_2=create st_2
this.cb_bus_diag=create cb_bus_diag
this.cb_nvorden=create cb_nvorden
this.cb_borrorden=create cb_borrorden
this.pb_abre=create pb_abre
this.pb_ordenes=create pb_ordenes
this.Control[]={this.dw_llevar,&
this.cbx_banco,&
this.dw_primerorden,&
this.gb_1,&
this.pb_rn,&
this.pb_rip,&
this.pb_evol,&
this.pb_new,&
this.dw_profe_atiende,&
this.st_5,&
this.st_respon,&
this.st_6,&
this.pb_2,&
this.tab_1,&
this.dw_oscab,&
this.dw_profe,&
this.st_2,&
this.cb_bus_diag,&
this.cb_nvorden,&
this.cb_borrorden,&
this.pb_abre,&
this.pb_ordenes}
end on

on uo_orden_formula_new.destroy
destroy(this.dw_llevar)
destroy(this.cbx_banco)
destroy(this.dw_primerorden)
destroy(this.gb_1)
destroy(this.pb_rn)
destroy(this.pb_rip)
destroy(this.pb_evol)
destroy(this.pb_new)
destroy(this.dw_profe_atiende)
destroy(this.st_5)
destroy(this.st_respon)
destroy(this.st_6)
destroy(this.pb_2)
destroy(this.tab_1)
destroy(this.dw_oscab)
destroy(this.dw_profe)
destroy(this.st_2)
destroy(this.cb_bus_diag)
destroy(this.cb_nvorden)
destroy(this.cb_borrorden)
destroy(this.pb_abre)
destroy(this.pb_ordenes)
end on

event constructor;tab_1.tp_1.pb_ord.cod_rep=i_codrep_orden
tab_1.tp_1.pb_ord.dialogo=repord_dialogo
tab_1.tp_1.pb_ord.v_preliminar=repord_vprelim
tab_1.tp_2.pb_for.cod_rep=i_codrep_formula
tab_1.tp_2.pb_for.dialogo=repfor_dialogo
tab_1.tp_2.pb_for.v_preliminar=repfor_vprelim

end event

type dw_llevar from datawindow within uo_orden_formula_new
boolean visible = false
integer x = 315
integer y = 316
integer width = 626
integer height = 92
integer taborder = 30
string title = "none"
string dataobject = "dw_lleva_procs_atender"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_banco from checkbox within uo_orden_formula_new
boolean visible = false
integer x = 2624
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
end type

type dw_primerorden from datawindow within uo_orden_formula_new
boolean visible = false
integer x = 82
integer y = 180
integer width = 361
integer height = 100
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "dw_primer_orden"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type gb_1 from groupbox within uo_orden_formula_new
integer x = 1074
integer width = 2386
integer height = 536
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

type pb_rn from picturebutton within uo_orden_formula_new
event mousemove pbm_mousemove
boolean visible = false
integer x = 3246
integer y = 1100
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
boolean enabled = false
boolean originalsize = true
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

type pb_rip from picturebutton within uo_orden_formula_new
event mousemove pbm_mousemove
integer x = 3246
integer y = 964
integer width = 142
integer height = 124
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "             &i"
string picturename = "rips.GIF"
string disabledname = "d_rips.GIF"
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
st.dw_meds=tab_1.tp_3.dw_canasta
st.tingres=i_tingre
st.profe=dw_profe_atiende.getitemstring(1,1)
st.tipo_orden=dw_oscab.getitemstring(dw_oscab.getrow(),'tipo_orden')
openwithparm(w_estad_ria_os_cos,st)
if message.stringparm='Y' then 
	revi_est_ord()
	dw_oscab.event rowfocuschanged(dw_oscab.getrow())
end if
end event

event constructor;f_inicia_boton(this,'ATOS')
end event

type pb_evol from picturebutton within uo_orden_formula_new
event mousemove pbm_mousemove
integer x = 3040
integer y = 556
integer width = 142
integer height = 124
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &v"
string picturename = "editar.GIF"
string disabledname = "d_editar.GIF"
alignment htextalign = left!
string powertiptext = "Evolución del Paciente [Alt+V]"
end type

event clicked;if i_contador=-1 then return
if i_est_hadm='6' then return
string estado,profesi,usu,evolu
long j,cuantos
cuantos=0
profesi=dw_profe_atiende.getitemstring(1,1)
if isnull(profesi) then
	messagebox("Atención","Elija un profesional para poder atender los servicios")
	return
end if
select usuario,evoluciona into :usu,:evolu from profe where codprof=:profesi;
if isnull(usu) or evolu='0' then
	Messagebox("Atención","El profesional que eligió no tiene relación con Usuarios o no tiene permiso para realizar evoluciones")
	return
end if
openwithparm(w_conecta_evol,profesi)
if message.stringparm='!' then return

st_pa_evolucion str
str.sle_proc=tab_1.tp_1.sle_1
str.dw_proc=tab_1.tp_1.dw_oscuerpo
str.campo_cant_proc='solicitada'
str.sle_med=tab_1.tp_2.sle_2
str.dw_med=tab_1.tp_3.dw_canasta
str.campo_cant_med='solicitada'
str.ventana=f_vent_padre(this)
str.contador=i_contador
str.clugar_his=i_clug_his
str.nh=i_nh
str.clug_hadm=i_clug_hadm
str.tingres=i_tingre
str.profes=profesi
str.nvorden=cb_nvorden
if str.ventana.classname()='w_new_sala_qx' then
	str.mostrar=true
else
	str.mostrar=false
end if
str.emp=i_cemp
str.cont=i_cemp
string respon,espe
datetime fentra,hentra
setnull(respon)
if g_motor='postgres' then
	SELECT  profe.nombre1|| case when profe.nombre2  is null then ' ' else  '  '||profe.nombre2 end ||' '|| 
	 profe.apellido1|| case when profe.apellido2 is null then ' ' else  '  '||profe.apellido2 end as desprof into :respon
	FROM HospRespon, Profe
	WHERE HospRespon.CodProf=profe.codprof AND HospRespon.NH=:str.nh and clugar=:str.clug_hadm AND HospRespon.CodTIngre=:str.tingres AND HospRespon.fecha_fin Is Null;
else
	SELECT  profe.nombre1+ case when profe.nombre2  is null then ' ' else  '  '+profe.nombre2 end +' '+ 
	 profe.apellido1+ case when profe.apellido2 is null then ' ' else  '  '+profe.apellido2 end as desprof into :respon
	FROM HospRespon, Profe
	WHERE HospRespon.CodProf=profe.codprof AND HospRespon.NH=:str.nh and clugar=:str.clug_hadm AND HospRespon.CodTIngre=:str.tingres AND HospRespon.fecha_fin Is Null;
end if
if sqlca.sqlcode=-1 then
	messagebox("Error Consultando responsable actual",sqlca.sqlerrtext)
	return
end if
if isnull(respon) then
	fentra=datetime(today())
	hentra=datetime(today(),time(string(now())))
	int cuantas
	select count(cesp) into :cuantas from espprof where codprof=:profesi and estado='1';
	choose case cuantas
		case 0 
			messagebox("Atención","El profesional no tiene asignadas especialidades en la tabla EspProf, dede adicionarle una especialidad para poder continuar")
			return
		case 1
			select cesp into :espe from espprof where codprof=:profesi and estado='1';
			if sqlca.sqlcode=-1 then
				messagebox("Error consultando EspProf",sqlca.sqlerrtext)
				return
			end if
			INSERT INTO HospRespon ( NH,clugar, CodTIngre, nitem, CodProf, CEsp, fecha_ini, hora_ini)
			values (:str.nh,:str.clug_hadm,:str.tingres,1,:str.profes,:espe,:fentra,:hentra);
			if sqlca.sqlcode=-1 then
				messagebox("Error insertando fila en HospRespon",sqlca.sqlerrtext)
				rollback;
				return
			else
				commit;
				if g_motor='postgres' then
					select 
					 profe.nombre1|| case when profe.nombre2  is null then ' ' else  '  '||profe.nombre2 end ||' '|| 
					 profe.apellido1|| case when profe.apellido2 is null then ' ' else  '  '||profe.apellido2 end as desprof
					into :st_respon.text from profe where codprof=:profesi;
				else
					select 
					 profe.nombre1+ case when profe.nombre2  is null then ' ' else  '  '+profe.nombre2 end +' '+ 
					 profe.apellido1+ case when profe.apellido2 is null then ' ' else  '  '+profe.apellido2 end as desprof
					into :st_respon.text from profe where codprof=:profesi;		
				end if
			end if
		case else
			openwithparm(w_escog_espe,str)
	end choose
end if
openwithparm(w_evolucion_new,str)
end event

event constructor;f_inicia_boton(this,'ATOS')
end event

type pb_new from picturebutton within uo_orden_formula_new
event mousemove pbm_mousemove
integer x = 2885
integer y = 556
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
string text = "         &t"
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
long j,cuantos,k,donde
trae st
if i_est_hadm<>"1" then
	Messagebox("Atención","No se puede modificar esta admisión")
	return
end if
estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
if estado="2" or estado="3" then
	Messagebox("Atención","Esta orden de servicio ya está completa o anulada, no se pueden borrar procedimientos")
	return
end if
cuantos=0
uo_datastore qx
qx=create uo_datastore
qx.dataobject='dw_at_qx'
dw_llevar.reset()
for j=1 to tab_1.tp_1.dw_oscuerpo.rowcount()
	if tab_1.tp_1.dw_oscuerpo.getitemstring(j,"escog")="1" then
		if tab_1.tp_1.dw_oscuerpo.getitemstring(j,"agrupser")="04" then//son qx
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
			donde=dw_llevar.insertrow(0)
			dw_llevar.setitem(donde,'contador',tab_1.tp_1.dw_oscuerpo.getitemnumber(j,'contador'))
			dw_llevar.setitem(donde,'clugar',tab_1.tp_1.dw_oscuerpo.getitemstring(j,'clugar'))
			dw_llevar.setitem(donde,'nsolicitud',tab_1.tp_1.dw_oscuerpo.getitemnumber(j,'nsolicitud'))
			dw_llevar.setitem(donde,'item',tab_1.tp_1.dw_oscuerpo.getitemnumber(j,'item'))
			dw_llevar.setitem(donde,'codproced',tab_1.tp_1.dw_oscuerpo.getitemstring(j,'codproced'))
			dw_llevar.setitem(donde,'solicitada',tab_1.tp_1.dw_oscuerpo.getitemnumber(j,'solicitada'))
			dw_llevar.setitem(donde,'suministrada',tab_1.tp_1.dw_oscuerpo.getitemnumber(j,'suministrada'))
			dw_llevar.setitem(donde,'rips',tab_1.tp_1.dw_oscuerpo.getitemstring(j,'rips'))
			dw_llevar.setitem(donde,'estado',tab_1.tp_1.dw_oscuerpo.getitemstring(j,'estado'))
			dw_llevar.setitem(donde,'facturar',tab_1.tp_1.dw_oscuerpo.getitemnumber(j,'facturar'))
			dw_llevar.setitem(donde,'descripcion',tab_1.tp_1.dw_oscuerpo.getitemstring(j,'descripcion'))
			cuantos ++
		end if
	else//if tab_1.tp_1.dw_oscuerpo.getitemstring(j,"estado")="C" then//la de costos
		tab_1.tp_1.dw_oscuerpo.setrow(j)
		for k=1 to tab_1.tp_3.dw_canasta.rowcount()
			if tab_1.tp_3.dw_canasta.getitemstring(k,'escog')='1'then 
				st.proc_costos=tab_1.tp_1.dw_oscuerpo.getitemstring(j,'codproced')
				donde=dw_llevar.insertrow(0)
				dw_llevar.setitem(donde,'contador',tab_1.tp_3.dw_canasta.getitemnumber(k,'contador'))
				dw_llevar.setitem(donde,'clugar',tab_1.tp_3.dw_canasta.getitemstring(k,'clugar'))
				dw_llevar.setitem(donde,'nsolicitud',tab_1.tp_3.dw_canasta.getitemnumber(k,'nsolicitud'))
				dw_llevar.setitem(donde,'item',tab_1.tp_3.dw_canasta.getitemnumber(k,'item'))
				dw_llevar.setitem(donde,'solicitada',tab_1.tp_3.dw_canasta.getitemnumber(k,'solicitada'))
				dw_llevar.setitem(donde,'suministrada',tab_1.tp_3.dw_canasta.getitemnumber(k,'suministrada'))
				dw_llevar.setitem(donde,'rips',tab_1.tp_3.dw_canasta.getitemstring(k,'rips'))
				dw_llevar.setitem(donde,'estado',tab_1.tp_3.dw_canasta.getitemstring(k,'estado'))
				dw_llevar.setitem(donde,'facturar',tab_1.tp_3.dw_canasta.getitemnumber(k,'facturar'))
				dw_llevar.setitem(donde,'descripcion',tab_1.tp_3.dw_canasta.getitemstring(k,'descripcion'))
				dw_llevar.setitem(donde,'c_medica',tab_1.tp_3.dw_canasta.getitemstring(k,'codgenerico'))
				dw_llevar.setitem(donde,'secuencia',tab_1.tp_3.dw_canasta.getitemnumber(k,'secuencia'))
				dw_llevar.setitem(donde,'entregada',tab_1.tp_3.dw_canasta.getitemnumber(k,'entregada'))
				cuantos++
			end if
		next
	end if
next

if cuantos=0 and qx.rowcount()=0 then 
	messagebox("Atención","No ha seleccionado ningún procedimiento o medicamento en la casilla Atender")
	return
end if

if cuantos>0 then
	if isnull(dw_profe_atiende.getitemstring(1,1)) then
		messagebox("Atención","Elija un profesional para poder atender los servicios")
		return
	end if
	
	st.numero=i_contador
	st.lugar=i_clug_his
	st.otro='carga'
	st.dw_procs=dw_llevar
	st.dw_meds=tab_1.tp_3.dw_canasta
	st.tingres=i_tingre
	st.profe=dw_profe_atiende.getitemstring(1,1)
	if dw_oscab.getitemstring(dw_oscab.getrow(),'tipo_orden')='B' then
		openwithparm(w_banco_atiende,st)
	else
		openwithparm(w_estad_ria_os_cos,st)
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

type dw_profe_atiende from datawindow within uo_orden_formula_new
integer x = 2043
integer y = 600
integer width = 827
integer height = 84
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_profe"
boolean border = false
boolean livescroll = true
end type

event constructor;reset()
settransobject(sqlca)
modify('codprof.accelerator="l"')
insertrow(1)
f_titulos_dw_st(this,'ATOS',st_5)
end event

event itemchanged;accepttext()
end event

type st_5 from statictext within uo_orden_formula_new
integer x = 2039
integer y = 548
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

type st_respon from statictext within uo_orden_formula_new
integer x = 1129
integer y = 604
integer width = 873
integer height = 76
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

type st_6 from statictext within uo_orden_formula_new
integer x = 1125
integer y = 552
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

type pb_2 from picturebutton within uo_orden_formula_new
event mousemove pbm_mousemove
integer x = 974
integer y = 556
integer width = 142
integer height = 124
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &k"
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
	if not isnull(dw_oscab.getitemstring(dw_oscab.getrow(),'cod_banco')) then return
end choose
st_proc_comun st_pc
st_pc.sle_proc=tab_1.tp_1.sle_1
st_pc.col_cant_proc='solicitada'
st_pc.sle_med=tab_1.tp_2.sle_2
st_pc.dw_meds=tab_1.tp_2.dw_formula
st_pc.col_cant_med='solicitada'
st_pc.frecuen='frecuen'
st_pc.administracion='administracion'
//openwithparm(w_kit_viejo,st_pc)
openwithparm(w_kit_new,st_pc)
end event

type tab_1 from tab within uo_orden_formula_new
event create ( )
event destroy ( )
integer y = 440
integer width = 3461
integer height = 828
integer taborder = 30
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
tp_3 tp_3
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.tp_3=create tp_3
this.Control[]={this.tp_1,&
this.tp_2,&
this.tp_3}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
destroy(this.tp_3)
end on

type tp_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3424
integer height = 700
long backcolor = 67108864
string text = "Procedimientos"
long tabtextcolor = 33554432
string picturename = "ap_dx.ico"
long picturemaskcolor = 536870912
string powertiptext = "Ordenar Servicios de Apoyo Diagnostico"
pb_ord pb_ord
dw_oscuerpo dw_oscuerpo
cb_12 cb_12
cb_delserv cb_delserv
cb_nvserv cb_nvserv
sle_1 sle_1
st_18 st_18
end type

on tp_1.create
this.pb_ord=create pb_ord
this.dw_oscuerpo=create dw_oscuerpo
this.cb_12=create cb_12
this.cb_delserv=create cb_delserv
this.cb_nvserv=create cb_nvserv
this.sle_1=create sle_1
this.st_18=create st_18
this.Control[]={this.pb_ord,&
this.dw_oscuerpo,&
this.cb_12,&
this.cb_delserv,&
this.cb_nvserv,&
this.sle_1,&
this.st_18}
end on

on tp_1.destroy
destroy(this.pb_ord)
destroy(this.dw_oscuerpo)
destroy(this.cb_12)
destroy(this.cb_delserv)
destroy(this.cb_nvserv)
destroy(this.sle_1)
destroy(this.st_18)
end on

type pb_ord from pb_report within tp_1
integer x = 3227
integer y = 4
integer taborder = 40
string text = "          &o"
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
integer y = 136
integer width = 3150
integer height = 548
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

event itemchanged;if isvalid(dwo) then
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
		if tab_1.tp_3.dw_canasta.find('entregada>0',1,tab_1.tp_3.dw_canasta.rowcount())>0 then
			settext(string(actual))
			setitem(row,'solicitada',actual)
			messagebox('Atención','Ya se han entregado suministros para este procedimiento no puede cambiar la cantidad, Solicítelo como un nuevo procedimiento o cree una nueva orden')
			return 2
		end if
		for j=1 to tab_1.tp_3.dw_canasta.rowcount()
			tab_1.tp_3.dw_canasta.setitem(j,'solicitada',tab_1.tp_3.dw_canasta.getitemnumber(j,'solicitada')*long(data))
		next
		tab_1.tp_3.dw_canasta.event p_itemchanged()
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
			if tab_1.tp_3.dw_canasta.find("solicitada - entregada - devuelta >0",1,tab_1.tp_3.dw_canasta.rowcount())>0 then
				if messagebox('Atención','No se han entregado todos los Insumos requeridos para este procedimiento. Desea continuar aún así?',question!,yesno!,1)=2 then
					settext('0')
					setitem(getrow(),'escog','0')
					return 2
				end if
			end if
		end if
	end if
end if
post event p_itemchanged()
end event

event buttonclicked;long j
for j=1 to rowcount()
	if dwo.text='Escoger' then
		setrow(j)
		if tab_1.tp_3.dw_canasta.find("solicitada - entregada - devuelta >0",1,tab_1.tp_3.dw_canasta.rowcount())>0 then continue
		if getitemstring(j,'estado')='1' then setitem(j,'escog','1')
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
	tab_1.tp_3.dw_canasta.setfilter('isnull(item)')
	tab_1.tp_3.dw_canasta.filter()
	return
end if
if isnull(getitemnumber(getrow(),'item')) then
	tab_1.tp_3.dw_canasta.setfilter('isnull(item)')
else
	tab_1.tp_3.dw_canasta.setfilter('item='+string(getitemnumber(getrow(),'item')))
end if
tab_1.tp_3.dw_combo.setitem(1,1,getitemnumber(getrow(),'item'))
tab_1.tp_3.dw_canasta.filter()
tab_1.tp_3.dw_canasta.sort()
end event

type cb_12 from picturebutton within tp_1
event mousemove pbm_mousemove
integer x = 585
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
string text = "        &p"
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
		if i_est_hadm<>"1" then
			Messagebox("Atención","No se puede agregar procedimientos ya que la admisión no está activa")
			return
		end if
		string estado
		estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
		if estado="2" or estado="3" then
			Messagebox("Atención","Esta orden de servicio ya está completa o anulada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
			return
		end if
		str_proc.sle=sle_1
		str_proc.emp=i_cemp
		str_proc.cont=i_ccont
		
		if not isnull(dw_oscab.getitemstring(dw_oscab.getrow(),'cod_banco')) then 
			str_proc.dw=dw_oscuerpo
			str_proc.banco=dw_oscab.getitemstring(dw_oscab.getrow(),'cod_banco')
			str_proc.objeto=dw_primerorden.getparent()
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
		
		if i_est_hadm<>"1" then
			Messagebox("Atención","No se puede borrar procedimientos ya que la admisión no está activa")
			return
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
		do while tab_1.tp_3.dw_canasta.rowcount()>0
			if tab_1.tp_3.pb_del_insumo.event clicked()=-1 then return
		loop
		cual=dw_oscuerpo.getitemnumber(dw_oscuerpo.getrow(),'item')
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
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &n"
string picturename = "jeringa flecha.gif"
string disabledname = "d_jeringa flecha.gif"
alignment htextalign = left!
string powertiptext = "Nuevo Servicio [Alt+N]"
end type

event clicked;if dw_oscab.rowcount() = 0 then 
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
integer y = 52
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
choose case i_tingre
	case '2','3','4','7'
		if dw_oscab.getitemstring(dw_oscab.getrow(),'tipo_orden')='B' then return -1
end choose
long fila
fila=insert_proc(text,1)
if fila=-1 then
	rollback;
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
integer width = 3424
integer height = 700
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
sle_2 sle_2
end type

on tp_2.create
this.pb_for=create pb_for
this.dw_formula=create dw_formula
this.cb_10=create cb_10
this.cb_adic=create cb_adic
this.cb_borra_med=create cb_borra_med
this.st_19=create st_19
this.sle_2=create sle_2
this.Control[]={this.pb_for,&
this.dw_formula,&
this.cb_10,&
this.cb_adic,&
this.cb_borra_med,&
this.st_19,&
this.sle_2}
end on

on tp_2.destroy
destroy(this.pb_for)
destroy(this.dw_formula)
destroy(this.cb_10)
destroy(this.cb_adic)
destroy(this.cb_borra_med)
destroy(this.st_19)
destroy(this.sle_2)
end on

type pb_for from pb_report within tp_2
integer x = 3227
integer y = 4
integer taborder = 40
string text = "      &F"
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
integer y = 136
integer width = 3163
integer height = 552
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

event itemchanged;if isvalid(dwo) then
	if dwo.name='medicamento' then
		string nulo
		setnull(nulo)
		setitem(getrow(),'c_medica',nulo)
	end if
end if
post event p_itemchanged()
end event

event buttonclicked;long j
for j=1 to rowcount()
	if dwo.text='Escoger' then
		if getitemstring(j,'estado')='1' and getitemnumber(j,'entregada')>getitemnumber(j,'suministrada') then setitem(j,'escog','1')
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

type cb_10 from picturebutton within tp_2
event mousemove pbm_mousemove
integer x = 585
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
	    openwithparm(w_busca_med,st_m)
	case '2','3','4','7'
		if dw_oscab.rowcount()=0 then return
		if not isnull(dw_oscab.getitemstring(dw_oscab.getrow(),'cod_banco')) then return
		if tag='1' then
			if f_permiso_boton(this,'ATOS')=0 then return
		end if
		string estado
		if i_est_hadm<>"1" then
			Messagebox("Atención","No se puede agregar medicamentos ya que la admisión no está activa")
			return
		end if
		estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
		if estado="2" or estado="3" then
			Messagebox("Atención","Esta orden de servicio ya está completa o anulada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
			return
		end if
		st_pa_medica st_med
		st_med.sle=sle_2
		openwithparm(w_busca_med_x_gen,st_med)
end choose
end event

type cb_adic from picturebutton within tp_2
event mousemove pbm_mousemove
integer x = 37
integer y = 4
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &a"
string picturename = "capsula.GIF"
string disabledname = "d_capsula.GIF"
alignment htextalign = left!
string powertiptext = "Adicionar Medicamento [Alt+A]"
end type

event clicked;if dw_oscab.rowcount() = 0 then 
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
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &b"
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
	case '2','3','4'
		if dw_oscab.rowcount()=0 or dw_formula.rowcount()=0 then return
		string estado
		if i_est_hadm<>"1" then
			Messagebox("Atención","No se puede borrar procedimientos ya que la admisión no está activa")
			return
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
			messagebox("Atención","Este procedimiento no se puede eliminar, porque su estado es diferente a 'Sin realizar'")
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

type sle_2 from singlelineedit within tp_2
integer x = 201
integer y = 52
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
choose case i_tingre
	case '2','3','4','7'
	if not isnull(dw_oscab.getitemstring(dw_oscab.getrow(),'cod_banco')) then return
end choose
long fila
fila=insert_med(text,1)
if fila=-1 then
	rollback;
else
	commit;
	text=''
	dw_formula.scrolltorow(fila)
	dw_formula.setfocus()
	if long(tag)>1 then//viene del objeto de hc
		dw_formula.setitem(fila,'solicitada',long(tag))
		dw_formula.event itemchanged(fila,dw_formula.object.solicitada,tag)
		tag=''
	end if
end if

end event

type tp_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3424
integer height = 700
long backcolor = 67108864
string text = "Insumos"
long tabtextcolor = 33554432
string picturename = "det_med.ico"
long picturemaskcolor = 536870912
string powertiptext = "Insumos del Procedimiento"
st_3 st_3
pb_1 pb_1
st_1 st_1
sle_3 sle_3
pb_insert_insumo pb_insert_insumo
pb_del_insumo pb_del_insumo
dw_combo dw_combo
dw_canasta dw_canasta
end type

on tp_3.create
this.st_3=create st_3
this.pb_1=create pb_1
this.st_1=create st_1
this.sle_3=create sle_3
this.pb_insert_insumo=create pb_insert_insumo
this.pb_del_insumo=create pb_del_insumo
this.dw_combo=create dw_combo
this.dw_canasta=create dw_canasta
this.Control[]={this.st_3,&
this.pb_1,&
this.st_1,&
this.sle_3,&
this.pb_insert_insumo,&
this.pb_del_insumo,&
this.dw_combo,&
this.dw_canasta}
end on

on tp_3.destroy
destroy(this.st_3)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.sle_3)
destroy(this.pb_insert_insumo)
destroy(this.pb_del_insumo)
destroy(this.dw_combo)
destroy(this.dw_canasta)
end on

type st_3 from statictext within tp_3
integer x = 18
integer y = 32
integer width = 123
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Proc:"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within tp_3
integer x = 768
integer y = 84
integer width = 119
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "buscar.gif"
string powertiptext = "Buscar genéricos"
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

type st_1 from statictext within tp_3
integer x = 18
integer y = 108
integer width = 334
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Código Genér.:"
boolean focusrectangle = false
end type

type sle_3 from singlelineedit within tp_3
integer x = 366
integer y = 96
integer width = 384
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;string codigo,a,b,c,d,e
long j
codigo=text
SELECT  SUMGENERICO.descripcion,  SUMGENERICO.cod_insumo
into :a,:b
FROM SUMGENERICO INNER JOIN cos_insumo ON SUMGENERICO.cod_insumo = cos_insumo.cod_insumo
WHERE (((SUMGENERICO.codgenerico)=:codigo) AND ((SUMGENERICO.c_medica) Is Not Null));
if sqlca.sqlcode=-1 then
	messagebox('Error leyendo sumgenerico',sqlca.sqlerrtext)
	return
end if
if sqlca.sqlnrows=0 then
	messagebox('Atención','Esté genérico no existe')
	return
end if
j=pb_insert_insumo.event clicked()
if j=-1 then return
dw_canasta.setrow(j)
dw_canasta.setitem(j,'cod_insumo',b)
dw_canasta.event itemchanged(j,dw_canasta.object.cod_insumo,b)
dw_canasta.setitem(j,'codgenerico',codigo)
dw_canasta.setitem(j,'descripcion',a)
dw_canasta.event itemchanged(j,dw_canasta.object.descripcion,a)
text=''
setfocus(dw_canasta)
end event

type pb_insert_insumo from picturebutton within tp_3
integer x = 3227
integer y = 148
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
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
return j
end event

type pb_del_insumo from picturebutton within tp_3
integer x = 3227
integer y = 280
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
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

type dw_combo from datawindow within tp_3
integer x = 137
integer width = 768
integer height = 80
integer taborder = 50
string title = "none"
string dataobject = "dw_combo_proceds"
boolean border = false
boolean livescroll = true
end type

event constructor;insertrow(1)
getchild('item',idw_procs)
idw_procs.settransobject(sqlca)
object.datawindow.header.height=0
end event

event itemchanged;long donde
donde=tab_1.tp_1.dw_oscuerpo.find('item='+data,1,tab_1.tp_1.dw_oscuerpo.rowcount())
accepttext()
tab_1.tp_1.dw_oscuerpo.post scrolltorow(donde)
tab_1.tp_1.dw_oscuerpo.post event rowfocuschanged(donde)
end event

type dw_canasta from datawindow within tp_3
event p_itemchanged ( )
event key pbm_dwnkey
integer x = 9
integer y = 184
integer width = 3195
integer height = 508
integer taborder = 20
string title = "none"
string dataobject = "dw_oscuerpo_canasta"
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

event constructor;settransobject(sqlca)
getchild('descripcion',idw_genericos)
idw_genericos.settransobject( sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,dataobject)
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

event rowfocuschanged;idw_genericos.reset()
if getrow()<1 then return
idw_genericos.retrieve(getitemstring(getrow(),'cod_insumo'))
end event

event itemchanged;choose case dwo.name
	case 'cod_insumo'
		if idw_genericos.retrieve(data )>0 then
			setitem(getrow(),'codgenerico',idw_genericos.getitemstring( 1, 'codgenerico'))
			setitem(getrow(),'descripcion',idw_genericos.getitemstring( 1, 'descrip_generico'))
		end if
	case 'descripcion'
		long cual
		cual=idw_genericos.find('descrip_generico="'+data+'"',1,idw_genericos.rowcount())
		if cual>0 then
			setitem(getrow(),'codgenerico',idw_genericos.getitemstring( cual, 'codgenerico'))
		end if
	case 'codgenerico'
		long donde
		string nulo
		setnull(nulo)
		donde=idw_genericos.find( 'codgenerico="'+trim(data)+'"', 1, idw_genericos.rowcount())
		if donde=0 then
			settext('')
			setitem(getrow( ),'codgenerico',nulo)
			setitem(getrow( ),'descripcion',' ')
			return 1
		else
			setitem(getrow( ),'descripcion',idw_genericos.getitemstring(donde,'descrip_generico'))
		end if
end choose
post event p_itemchanged()
end event

event doubleclicked;if dwo.name='codgenerico' then
	if row<1 then return
	if row<>getrow() then setrow(row)
	if describe("evaluate('if ( entregada>0 , 1 , 0 )',"+string(row)+")")='1' then return
	if not isnull(getitemstring(getrow(),'cod_insumo')) then
		openwithparm(w_escoge_gener,getitemstring(getrow(),'cod_insumo'))
		if message.stringparm<>'' then
			setitem(getrow(),'codgenerico',message.stringparm)
			event itemchanged(getrow(),object.codgenerico,message.stringparm)
		end if
	else
		openwithparm(w_busca_gener,this)
	end if
end if
end event

type dw_oscab from datawindow within uo_orden_formula_new
event keypress pbm_dwnkey
event pe_changed ( )
integer x = 1102
integer y = 156
integer width = 2336
integer height = 360
integer taborder = 10
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
tab_1.tp_3.dw_combo.reset()
tab_1.tp_3.dw_combo.insertrow(1)
tab_1.tp_3.dw_canasta.reset()
i_norden=-1
if getrow()<1 then return
i_norden=getitemnumber(getrow(),"nsolicitud")
idw_procs.retrieve(i_contador,i_clug_his,i_norden)
tab_1.tp_1.dw_oscuerpo.retrieve(i_contador,i_clug_his,i_norden)
tab_1.tp_2.dw_formula.retrieve(i_contador,i_clug_his,i_norden)
tab_1.tp_3.dw_canasta.retrieve(i_contador,i_clug_his,i_norden)
revi_est_ord()
end event

type dw_profe from datawindow within uo_orden_formula_new
integer x = 1925
integer y = 52
integer width = 654
integer height = 84
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_profe"
boolean border = false
boolean livescroll = true
end type

event constructor;reset()
settransobject(sqlca)
modify('codprof.accelerator="q"')
modify('codprof.width=631')
insertrow(1)

end event

type st_2 from statictext within uo_orden_formula_new
integer x = 1618
integer y = 64
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

type cb_bus_diag from picturebutton within uo_orden_formula_new
event mousemove pbm_mousemove
integer x = 3314
integer y = 96
integer width = 133
integer height = 112
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &d"
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

type cb_nvorden from picturebutton within uo_orden_formula_new
event mousemove pbm_mousemove
integer x = 2862
integer y = 36
integer width = 142
integer height = 124
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &n"
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Nueva Orden [Alt+N]"
end type

event clicked;if i_contador = -1 then return -1
long fila,nserv1

choose case i_tingre
	case '2','3','4','7'
		if i_contador=-1 then return
		if tag='1' then
			if f_permiso_boton(this,'ATOS')=0 then return -1
		end if
		if i_est_hadm<>"1" then
			Messagebox("Atención","No se pueden agregar más ordenes de servicio a esta admisión")
			return -1
		end if
		if isnull(dw_profe.getitemstring(1,1)) then
			if isvalid(w_evolucion_new) then
				dw_profe.setitem(1,1,dw_profe_atiende.getitemstring(1,1))
			else
				messagebox("Atención","Elija un profesional para poder adicionar una orden de servicio")
				return -1
			end if
		end if
		long j
		select max(nsolicitud) into :j from oscabeza 
		where contador=:i_contador and clugar=:i_clug_his and tipo_orden <>'C';
		if sqlca.sqlcode=-1 then
			messagebox('Error leyendo el máximo oscabeza.nsolicitud',sqlca.sqlerrtext)
			return -1
		end if
		if isnull(j) then j=0
		j++
		dw_oscab.insertrow(1)
		dw_oscab.scrolltorow(1)
		dw_oscab.setitem(1,"contador",i_contador)
		dw_oscab.setitem(1,"clugar",i_clug_his)
		dw_oscab.setitem(1,"usuario",usuario)
		dw_oscab.setitem(1,"tipo_orden",'H')
		dw_oscab.setitem(1,"nsolicitud",j)
		dw_oscab.setitem(1,"fecha",datetime(today(),now()))
		dw_oscab.setitem(1,"codprof",dw_profe.getitemstring(1,1))
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
			parent.retrieve(i_contador,i_clug_his,i_profe,i_nh,i_clug_hadm,i_tingre,i_nqx,i_clug_qx,i_consec_qx)
			return -1
		else
			sqlca.autocommit=false
			commit;
			dw_oscab.triggerevent(rowfocuschanged!)
			//if  dw_oscab.getitemnumber(1,'ordenes')=1 and not isvalid(w_evolucion_new) then
			if  dw_oscab.getitemnumber(1,'ordenes')=1 then
				dw_primerorden.retrieve(i_tingre)
				long primer
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
			end if
		end if
		return 1
	case '1'
		fila=dw_oscab.insertrow(0)
		dw_oscab.setitem(fila,"contador",i_contador)
		dw_oscab.setitem(fila,"clugar",i_clug_his)
		dw_oscab.setitem(fila,"usuario",usuario)
		dw_oscab.setitem(fila,"codprof",i_profe)
		if i_desdiag='' then setnull(i_desdiag)
		dw_oscab.setitem(fila,'diagnostico',i_desdiag)
		dw_oscab.setitem(fila,'cod_rips',i_codrips)
		if i_coddiag='' then setnull(i_coddiag)
		dw_oscab.setitem(fila,'codgeral',i_coddiag)
		dw_oscab.setitem(fila,'fecha',datetime(today()))
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

type cb_borrorden from picturebutton within uo_orden_formula_new
event mousemove pbm_mousemove
integer x = 3003
integer y = 36
integer width = 142
integer height = 124
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &e"
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Eliminar Orden [Alt+E]"
end type

event clicked;
if dw_oscab.rowcount()=0 then return
if tag='1' then
	if f_permiso_boton(this,'ATOS')=0 then return
end if
if dw_oscab.getitemstring(dw_oscab.getrow(),'tipo_orden')='C' then
	Messagebox('Atención','Esta orden de servicio se utiliza para calcular los costos de Observación y/o Estancia.~r~nNo la puede borrar')
	return
end if
dw_oscab.deleterow(0)
if dw_oscab.update()=-1 then
	rollback;
	parent.retrieve(i_contador,i_clug_his,i_profe,i_nh,i_clug_hadm,i_tingre,i_nqx,i_clug_qx,i_consec_qx)
else
	commit;
	dw_oscab.triggerevent(rowfocuschanged!)
end if
end event

type pb_abre from picturebutton within uo_orden_formula_new
event mousemove pbm_mousemove
integer x = 3145
integer y = 36
integer width = 142
integer height = 124
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &a"
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
			parent.retrieve(i_contador,i_clug_his,i_profe,i_nh,i_clug_hadm,i_tingre,i_nqx,i_clug_qx,i_consec_qx)
		else
			sqlca.autocommit=false
			commit;
			dw_oscab.triggerevent(rowfocuschanged!)
		end if
end choose
		
end event

event constructor;f_inicia_boton(this,'ATOS')
end event

type pb_ordenes from picturebutton within uo_orden_formula_new
event mousemove pbm_mousemove
integer x = 3287
integer y = 36
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
string text = "       &m"
string picturename = "carpeta hoja.gif"
string disabledname = "d_carpeta hoja.gif"
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

