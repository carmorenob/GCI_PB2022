$PBExportHeader$uo_orden_formula.sru
$PBExportComments$Se utiliza todavía en las ventanas de las ordenes anteriores como las de consulta externa odonto,etc
forward
global type uo_orden_formula from userobject
end type
type rte_1 from richtextedit within uo_orden_formula
end type
type dw_formato from datawindow within uo_orden_formula
end type
type dw_cond from datawindow within uo_orden_formula
end type
type l_archivos from dropdownlistbox within uo_orden_formula
end type
type cbx_banco from checkbox within uo_orden_formula
end type
type dw_primerorden from datawindow within uo_orden_formula
end type
type gb_1 from groupbox within uo_orden_formula
end type
type pb_rn from picturebutton within uo_orden_formula
end type
type pb_rip from picturebutton within uo_orden_formula
end type
type pb_evol from picturebutton within uo_orden_formula
end type
type pb_new from picturebutton within uo_orden_formula
end type
type dw_profe_atiende from datawindow within uo_orden_formula
end type
type st_5 from statictext within uo_orden_formula
end type
type st_respon from statictext within uo_orden_formula
end type
type st_6 from statictext within uo_orden_formula
end type
type pb_2 from picturebutton within uo_orden_formula
end type
type tab_1 from tab within uo_orden_formula
end type
type tp_1 from userobject within tab_1
end type
type pb_ci from picturebutton within tp_1
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
type pb_remi from picturebutton within tp_1
end type
type pb_ord from pb_report within tp_1
end type
type tp_1 from userobject within tab_1
pb_ci pb_ci
dw_oscuerpo dw_oscuerpo
cb_12 cb_12
cb_delserv cb_delserv
cb_nvserv cb_nvserv
sle_1 sle_1
st_18 st_18
pb_remi pb_remi
pb_ord pb_ord
end type
type tp_2 from userobject within tab_1
end type
type pb_copy from picturebutton within tp_2
end type
type pb_np from picturebutton within tp_2
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
pb_copy pb_copy
pb_np pb_np
pb_for pb_for
dw_formula dw_formula
cb_10 cb_10
cb_adic cb_adic
cb_borra_med cb_borra_med
st_19 st_19
sle_2 sle_2
end type
type tab_1 from tab within uo_orden_formula
tp_1 tp_1
tp_2 tp_2
end type
type dw_oscab from datawindow within uo_orden_formula
end type
type dw_profe from datawindow within uo_orden_formula
end type
type st_2 from statictext within uo_orden_formula
end type
type cb_anul_ord from picturebutton within uo_orden_formula
end type
type cb_borrorden from picturebutton within uo_orden_formula
end type
type cb_nvorden from picturebutton within uo_orden_formula
end type
type mle_1 from multilineedit within uo_orden_formula
end type
type pb_ordenes from picturebutton within uo_orden_formula
end type
type pb_abre from picturebutton within uo_orden_formula
end type
end forward

global type uo_orden_formula from userobject
integer width = 6071
integer height = 1612
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
rte_1 rte_1
dw_formato dw_formato
dw_cond dw_cond
l_archivos l_archivos
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
cb_anul_ord cb_anul_ord
cb_borrorden cb_borrorden
cb_nvorden cb_nvorden
mle_1 mle_1
pb_ordenes pb_ordenes
pb_abre pb_abre
end type
global uo_orden_formula uo_orden_formula

type variables
string i_codrep_formula,i_codrep_orden,i_coddiag,i_desdiag,i_codrips,is_202
boolean repord_dialogo,repfor_dialogo,repord_vprelim,repfor_vprelim
private long i_contador=-1,i_norden,i_nh,i_nqx,i_consec_qx,l_nsalida
private string i_clug_his,i_profe,i_indapdx,i_clug_hadm,i_est_hadm,i_cemp,i_ccont,i_tingre,i_clug_qx,l_rips,l_temp_ord,i_esp
private int cant_serv
private datetime fec,l_fechaingreso
private string is_path="c:\windows\temp\",cod_fina
datawindowchild i_dw_tmp,i_dw_frec



end variables
forward prototypes
public function integer reset ()
public function long insert_proc (string p_codigo, integer p_cant)
public function long insert_med (string p_codigo, integer p_cant)
public function long insert_proc (string p_codigo, integer p_cant, long p_ntrat, string p_clug_tto, integer p_item_tto)
public subroutine cambia_diags (string p_cdiag)
public function integer init (string p_indapdx)
public function integer rn ()
public subroutine revi_est_ord ()
public function long insert_proc_banco (string p_codigo, integer p_cant, string p_banco, string p_ctipoemp, string p_desc_tipo)
public function integer f_estado_hadm (string as_estado_hadm)
public function integer retrieve (long contador, string clugar_his, string p_profe, long p_nh, string p_clug_hadm, string p_tingre, long p_nqx, string p_clug_qx, long p_consec_qx, string p_cesp)
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
long filac,nserv1,fila
string err
choose case i_tingre
	case '1'		
		str_proc stp		
		stp=f_busca_cups(p_codigo,w_principal.dw_1.getitemstring(1,'sexo'),w_principal.dw_1.getitemnumber(1,'dias'),'1')
		if isnull(stp.descripcion) then 
			text=''
			return -1
		end if		
		
		if dw_oscab.rowcount()=0 then
			filac=dw_oscab.insertrow(0)
			dw_oscab.setitem(filac,"contador",i_contador)
			dw_oscab.setitem(filac,"clugar",i_clug_his)
			dw_oscab.setitem(filac,"usuario",usuario)
			dw_oscab.setitem(filac,"codprof",i_profe)
			SELECT Max(NSolicitud),max(impreso) into :nserv1
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
				dw_oscab.deleterow(fila)
				return -1
			end if
			sqlca.autocommit=false
		else
			filac=dw_oscab.getrow()
		end if

		long cuenta,i
		
		fila=tab_1.tp_1.dw_oscuerpo.insertrow(0)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"contador",i_contador)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"clugar",i_clug_his)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"nsolicitud",i_norden)
		SELECT Max(item) into :i FROM oscuerpo WHERE contador=:i_contador and clugar=:i_clug_his and nsolicitud=:i_norden;
		if isnull(i) then i=0
		i++
		if dw_oscab.getitemstring(filac,'tipo_orden')='R' and i>1 then
			messagebox('Atención','Orden Tipo Remision solo puede tener producto de remisión')
			tab_1.tp_1.dw_oscuerpo.deleterow(fila)
			tab_1.tp_1.sle_1.text=''
			return -1
		else
			if stp.remision='1' then
				if f_hay_contrato(i_contador,i_clug_his,stp.cproc,i_tingre) then
					dw_oscab.setitem(filac,"tipo_orden",'N')
				else
					dw_oscab.setitem(filac,"tipo_orden",'R')
				end if
				
				if i>1  then 
					messagebox('Atención','Producto para Remision se debe agregar en orden separada')
					tab_1.tp_1.dw_oscuerpo.deleterow(fila)	
					tab_1.tp_1.sle_1.text=''
					return -1
				end if

				if dw_oscab.update()<1 then
					sqlca.autocommit=false
					tab_1.tp_1.dw_oscuerpo.deleterow(fila)
					return -1
				end if						
				dw_oscab.triggerevent(itemchanged!)
			end if		
		end if
		
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"item",i)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,'examen',stp.descripcion)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,'codproced',stp.cproc)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,'cod_cups',stp.cups)
		tab_1.tp_1.dw_oscuerpo.setitem(fila,'agrupser',stp.agrupser)
		
		if not isnull(stp.cod_tsubempaq) then
			tab_1.tp_1.dw_oscuerpo.setitem(fila,'cod_tsubempaq',stp.cod_tsubempaq)	
			tab_1.tp_1.dw_oscuerpo.setitem(fila,'cod_banco',stp.cod_banco)	
			tab_1.tp_1.dw_oscuerpo.setitem(fila,'descrip_tipo',stp.descrip_tipo)	
			dw_oscab.setitem(filac,"fecha_reserva",datetime(today(),now()))
		end if

				
		if stp.agrupser='04' then 
			tab_1.tp_1.dw_oscuerpo.setitem(fila,'tipo_cirugia','0')
			tab_1.tp_1.dw_oscuerpo.setitem(fila,'tiempo_cirugia',stp.tiempoqx)
		end if
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
		if estado="2" or estado="3" then
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
		/////////////////////////////canastas
		st_xa_canastas st
		st.cproc=p_codigo
		st.sexo=w_principal.dw_1.getitemstring(1,'sexo')
		st.edad_dias=w_principal.dw_1.getitemnumber(1,'dias')
		openwithparm(w_canastas,st)
		st=message.powerobjectparm
		if not isvalid(st) then return -1
		/////////////////////////////fin canastas
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
		long cant
		cant=p_cant
		if p_cant>1 and str.agrupser='04' then cant=1
		tab_1.tp_1.dw_oscuerpo.setitem(fila,"solicitada",cant)
		if tab_1.tp_1.dw_oscuerpo.update(true,false)<1 then
			tab_1.tp_1.dw_oscuerpo.deleterow(fila)	
			rollback;
		end if
		
		commit;
		tab_1.tp_1.dw_oscuerpo.scrolltorow(fila)
		tab_1.tp_1.dw_oscuerpo.setcolumn("solicitada")
		tab_1.tp_1.dw_oscuerpo.setfocus()
		tab_1.tp_1.dw_oscuerpo.resetupdate()
end choose
if dw_oscab.getitemstring(dw_oscab.getrow(),"tipo_orden")='R' then
	tab_1.tp_1.pb_remi.visible=true
	tab_1.tp_1.pb_ord.visible=false
else
	tab_1.tp_1.pb_remi.visible=false
	tab_1.tp_1.pb_ord.visible=true	
end if

return fila
end function

public function long insert_med (string p_codigo, integer p_cant);if i_contador = -1 then return -1
long fila,nserv1,i,filac
string estado
choose case i_tingre
	case '1'
		string profe_ant,medic_ant,un_med
		date fecha_ant
		int soli_ant
		/// inicio ocntrol medicamentos  solicitadps
		if g_motor='postgres' then
			SELECT 
				OSCabeza.fecha, 
				profe.nombre1|| case when profe.nombre2  is null then ' ' else  '  '||profe.nombre2 end ||' '|| profe.apellido1|| case when profe.apellido2 is null then ' ' else  '  '||profe.apellido2 end as desprof,
				OSCuerpo.solicitada, 	Medicamentos.Medicamento, MedUMedida.UnidadMed
				into :fecha_ant,:profe_ant,:soli_ant,:medic_ant,:un_med
				FROM 
					(((Historial INNER JOIN (OSCabeza INNER JOIN OSCuerpo ON (OSCabeza.NSolicitud = OSCuerpo.NSolicitud) AND 
					(OSCabeza.clugar = OSCuerpo.clugar) AND (OSCabeza.Contador = OSCuerpo.Contador)) ON 
					(Historial.clugar = OSCabeza.clugar) AND (Historial.Contador = OSCabeza.Contador)) INNER JOIN Medicamentos ON 
					OSCuerpo.c_medica = Medicamentos.c_medica) INNER JOIN Profe ON OSCabeza.CodProf = Profe.CodProf) INNER JOIN MedUMedida ON 
					Medicamentos.CodUM = MedUMedida.CodUMeddca
					  WHERE 
						(((OSCabeza.fecha)= (SELECT Max(OSCabeza.fecha ) AS mayor
							FROM 
							  Historial INNER JOIN (OSCabeza INNER JOIN OSCuerpo ON (OSCabeza.NSolicitud = OSCuerpo.NSolicitud) AND 
							  (OSCabeza.clugar = OSCuerpo.clugar) AND (OSCabeza.Contador = OSCuerpo.Contador)) ON (Historial.clugar = OSCabeza.clugar) AND 
							  (Historial.Contador = OSCabeza.Contador)
						  WHERE 
							  (((Historial.TipoDoc)=:tipdoc) AND ((Historial.Documento)=:docu) AND ((OSCuerpo.c_medica)=:p_codigo) AND
							((OSCabeza.tipo_orden)='N' Or (OSCabeza.tipo_orden)='S') AND ((OSCabeza.estado)<>'3'))
					)) AND ((Historial.TipoDoc)=:tipdoc) AND ((Historial.Documento)=:docu) AND 
					((OSCuerpo.c_medica)=:p_codigo) AND ((OSCabeza.tipo_orden)='N' Or (OSCabeza.tipo_orden)='S') AND ((OSCabeza.estado)<>'3'));
		else
			SELECT 
				OSCabeza.fecha, 
				profe.nombre1+ case when profe.nombre2  is null then ' ' else  '  '+profe.nombre2 end +' '+ profe.apellido1+ case when profe.apellido2 is null then ' ' else  '  '+profe.apellido2 end as desprof,
				OSCuerpo.solicitada, 	Medicamentos.Medicamento, MedUMedida.UnidadMed
				into :fecha_ant,:profe_ant,:soli_ant,:medic_ant,:un_med
				FROM 
					(((Historial INNER JOIN (OSCabeza INNER JOIN OSCuerpo ON (OSCabeza.NSolicitud = OSCuerpo.NSolicitud) AND 
					(OSCabeza.clugar = OSCuerpo.clugar) AND (OSCabeza.Contador = OSCuerpo.Contador)) ON 
					(Historial.clugar = OSCabeza.clugar) AND (Historial.Contador = OSCabeza.Contador)) INNER JOIN Medicamentos ON 
					OSCuerpo.c_medica = Medicamentos.c_medica) INNER JOIN Profe ON OSCabeza.CodProf = Profe.CodProf) INNER JOIN MedUMedida ON 
					Medicamentos.CodUM = MedUMedida.CodUMeddca
					  WHERE 
						(((OSCabeza.fecha)= (SELECT Max(OSCabeza.fecha ) AS mayor
							FROM 
							  Historial INNER JOIN (OSCabeza INNER JOIN OSCuerpo ON (OSCabeza.NSolicitud = OSCuerpo.NSolicitud) AND 
							  (OSCabeza.clugar = OSCuerpo.clugar) AND (OSCabeza.Contador = OSCuerpo.Contador)) ON (Historial.clugar = OSCabeza.clugar) AND 
							  (Historial.Contador = OSCabeza.Contador)
						  WHERE 
							  (((Historial.TipoDoc)=:tipdoc) AND ((Historial.Documento)=:docu) AND ((OSCuerpo.c_medica)=:p_codigo) AND
							((OSCabeza.tipo_orden)='N' Or (OSCabeza.tipo_orden)='S') AND ((OSCabeza.estado)<>'3'))
					)) AND ((Historial.TipoDoc)=:tipdoc) AND ((Historial.Documento)=:docu) AND 
					((OSCuerpo.c_medica)=:p_codigo) AND ((OSCabeza.tipo_orden)='N' Or (OSCabeza.tipo_orden)='S') AND ((OSCabeza.estado)<>'3'));

			end if
	     if sqlca.sqlcode=0 then 
			if DaysAfter(fecha_ant, today())<30 then 
				
				If Messagebox("Atención","Esta solicitando "+medic_ant+&
				" se hizo prescripcion de "+string (soli_ant)+" "+un_med+"  el día " +string(fecha_ant,'dd/mm/yyyy') + " por Profesional "+profe_ant + ".  Desea hacerlo aún así?",question!,yesno!,1)=2 then
					return -1
				end if
			end if
		end if
	/// fin control medicamentos  solicitadps

		if dw_oscab.rowcount()=0 then
			filac=dw_oscab.insertrow(0)
			dw_oscab.setitem(filac,"contador",i_contador)
			dw_oscab.setitem(filac,"clugar",i_clug_his)
			dw_oscab.setitem(filac,"usuario",usuario)
			dw_oscab.setitem(filac,"codprof",i_profe)
			SELECT Max(NSolicitud),max(impreso) into :nserv1
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
		else
			filac=dw_oscab.getrow()
		end if

		st_med stm
		stm=f_busca_med(p_codigo)
		if isnull(stm.medicamento) then return -1
		
		string destipo,desaler	
		setnull(destipo)
		setnull(desaler)
		SELECT 
			TIPO_ALERGIA.DESP_TIPO, PM_ALERGIAS.DESP_ALERGIA into  :destipo,:desaler	
		FROM 
			(((PACIENTES_ALERGIAS INNER JOIN PM_ALERGIAS ON (PACIENTES_ALERGIAS.cod_tipoa = PM_ALERGIAS.cod_tipoa) 
			AND (PACIENTES_ALERGIAS.cod_tipo = PM_ALERGIAS.cod_tipo) AND (PACIENTES_ALERGIAS.cod_alergia = PM_ALERGIAS.cod_alergia)) 
			INNER JOIN TIPO_ALERGIA ON (PM_ALERGIAS.cod_tipoa = TIPO_ALERGIA.cod_tipoa) 
			AND (PM_ALERGIAS.cod_tipo = TIPO_ALERGIA.cod_tipo)) 
			INNER JOIN pm_alergias_medica ON (PM_ALERGIAS.cod_alergia = pm_alergias_medica.cod_alergia) 
			AND (PM_ALERGIAS.cod_tipo = pm_alergias_medica.cod_tipo) 
			AND (PM_ALERGIAS.cod_tipoa = pm_alergias_medica.cod_tipoa)) 
			INNER JOIN MEDICAMENTOS ON pm_alergias_medica.cod_atc = MEDICAMENTOS.codmedica
		WHERE 
			(((MEDICAMENTOS.C_MEDICA)=:p_codigo) AND ((TIPO_ALERGIA.ESTADO)='1') 
			AND ((PM_ALERGIAS.ESTADO)='1') AND ((PACIENTES_ALERGIAS.TIPODOC)=:tipdoc) 
			AND ((PACIENTES_ALERGIAS.DOCUMENTO)=:docu) AND ((TIPO_ALERGIA.MEDICA)='1'));
		if sqlca.sqlcode=-1 then 
			 MessageBox("SQL error " + String(SQLCA.SQLDBCode), SQLCA.SQLErrText )
			return -1
		end if
		if not isnull(destipo) then 
			if Messagebox("Atención","Paciente refiere Alergia a "+UPPER(desaler)+". Desea utilizarlo aún así?",question!,yesno!,2)=2 then return -1
		end if
		fila=tab_1.tp_2.dw_formula.insertrow(0)
		tab_1.tp_2.dw_formula.setitem(fila,"contador",i_contador)
		tab_1.tp_2.dw_formula.setitem(fila,"clugar",i_clug_his)
		tab_1.tp_2.dw_formula.setitem(fila,"nsolicitud",i_norden)
		SELECT Max(item) into :i FROM oscuerpo WHERE contador=:i_contador and clugar=:i_clug_his and nsolicitud=:i_norden;
		if isnull(i) then i=0
		i++
		if dw_oscab.getitemstring(filac,'tipo_orden')='R' and i>1 then
			messagebox('Atención','Orden Tipo Remision solo puede tener producto de remisión')
			tab_1.tp_2.dw_formula.deleterow(fila)			
			return -1
		end if		
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
		estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
		if estado="2" or estado="3" then
			Messagebox("Atención","Esta orden de servicio ya está completa o anulada, debe agregar una nueva orden de servicios para poder agregar procedimientos")
			return -1
		end if
		string codproc,desproc,rips,tipoproc,plan,emp,contrato,pos
		long nserv
		SELECT c_medica, medicamento,rips,pos
		into :codproc, :desproc ,:rips,:pos
		FROM medicamentos where c_medica= :p_codigo and medicamentos.estado='1';
		if isnull(codproc) or codproc="" then 
			messagebox("Atención","Medicamento no existe o no está activo en uo_orden_formula")
			return -1
		else
			fila=tab_1.tp_2.dw_formula.insertrow(0)
			tab_1.tp_2.dw_formula.setitem(fila,"c_medica",codproc)
			tab_1.tp_2.dw_formula.setitem(fila,"medicamento",desproc)
			tab_1.tp_2.dw_formula.setitem(fila,"pos",pos)
			SELECT Max(item) into :nserv FROM oscuerpo WHERE contador=:i_contador and clugar=:i_clug_his and nsolicitud=:i_norden;
			if isnull(nserv) then nserv=0
			nserv++
			tab_1.tp_2.dw_formula.setitem(fila,"item",nserv)
			tab_1.tp_2.dw_formula.setitem(fila,"nsolicitud",i_norden)
			tab_1.tp_2.dw_formula.setitem(fila,"contador",i_contador)
			tab_1.tp_2.dw_formula.setitem(fila,"clugar",i_clug_his)
			tab_1.tp_2.dw_formula.setitem(fila,"solicitada",p_cant)
			if tab_1.tp_2.dw_formula.update()<1 then
				tab_1.tp_2.dw_formula.deleterow(fila)	
				rollback;
				return -1
			else
				commit;
				tab_1.tp_2.dw_formula.scrolltorow(fila)
				tab_1.tp_2.dw_formula.setcolumn("solicitada")
				tab_1.tp_2.dw_formula.setfocus()
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
if p_indapdx='S' then i_indapdx='1' //como si fuera de consulta externa
choose case p_indapdx
	case '0' //consultorio
		gb_1.x=4
		gb_1.resize(6121,492)
		gb_1.text='Ordenes de Servicios de la Atención'
		st_2.visible=false
		dw_profe.visible=false
		pb_abre.visible=false
		pb_ordenes.visible=false
		dw_oscab.move(24,52)
		dw_oscab.resize(5792,410)		
		cb_nvorden.move(5842,40)
		cb_nvorden.resize(146,128)
		cb_borrorden.move(5842,180)
		cb_borrorden.resize(146,128)
		cb_anul_ord.move(5842,320)
		cb_anul_ord.resize(146,128)
		st_6.visible=false
		st_respon.visible=false
		st_5.visible=false
		dw_profe_atiende.visible=false
		pb_new.visible=false
		pb_evol.visible=false
		pb_rip.visible=false
		tab_1.resize(6121,1220)
		tab_1.tp_2.dw_formula.resize(tab_1.width - 100 ,tab_1.height - 300)
		tab_1.tp_1.dw_oscuerpo.resize(tab_1.width - 100 ,tab_1.height - 300)		
		tab_1.tp_2.pb_np.visible=false
		f_titulos_dw_gb(dw_profe,'COEX',gb_1)	
	case '1' //apdx
	case '2', '3' , '4','7'
		cbx_banco.visible=true
		tab_1.tp_1.cb_nvserv.enabled=false
		tab_1.tp_2.cb_adic.enabled=false
		gb_1.text='Ordenes de Servicios de la Admisión'
		dw_oscab.dataobject='dw_oscab_hadm'
		dw_oscab.settransobject(sqlca)
		tab_1.tp_1.dw_oscuerpo.dataobject='dw_oscpo_hadm'
		tab_1.tp_1.dw_oscuerpo.settransobject(sqlca)
		tab_1.tp_2.dw_formula.dataobject='dw_oscpo_form_hadm'
		tab_1.tp_2.dw_formula.settransobject(sqlca)
		cb_anul_ord.visible=false
		tab_1.move(5,668)
		tab_1.height+=90
		tab_1.tp_1.dw_oscuerpo.height+=90
		tab_1.tp_2.dw_formula.height+=90
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
		cbx_banco.visible=true
		dw_oscab.dataobject='dw_oscab_qx'
		dw_oscab.settransobject(sqlca)
		tab_1.tp_1.dw_oscuerpo.dataobject='dw_oscpo_hadm'
		tab_1.tp_1.dw_oscuerpo.settransobject(sqlca)
		tab_1.tp_2.dw_formula.dataobject='dw_oscpo_form_hadm'
		tab_1.tp_2.dw_formula.settransobject(sqlca)
		cb_anul_ord.visible=false
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
	case 'S' //salida de Hosp y Urg
		dw_oscab.dataobject='dw_oscabeza_sale_hosp'
		dw_oscab.settransobject(sqlca)
		gb_1.text='Ordenes de Salida'
		gb_1.x=4
		gb_1.resize(4297,492)
		st_2.visible=false
		dw_oscab.move(24,52)
		dw_oscab.resize(4046,410)		
		cb_nvorden.move(4110,40)
		cb_nvorden.resize(146,128)
		cb_borrorden.move(4110,180)
		cb_borrorden.resize(146,128)
		cb_anul_ord.move(4110,320)
		cb_anul_ord.resize(146,128)
		cb_anul_ord.originalsize=true
		cb_borrorden.originalsize=true
		cb_nvorden.originalsize=true
		st_2.visible=false
		dw_profe.visible=false
		pb_abre.visible=false
		pb_ordenes.visible=false
		st_6.visible=false
		tab_1.tp_2.pb_np.visible=false
		st_respon.visible=false
		st_5.visible=false
		dw_profe_atiende.visible=false
		pb_new.visible=false
		pb_evol.visible=false
		pb_rip.visible=false
		tab_1.tp_2.pb_np.visible=false
		//tab_1.tp_1.pb_ord.x -=280
		//tab_1.tp_2.pb_for.x -=280
	//	f_titulos_dw_gb(dw_profe,'COEX',gb_1)	
end choose

string ls_mad,ls_pad

SELECT cadena into :ls_mad
FROM parametros_gen
WHERE (((codigo_para)=71));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 71')
	return -1
end if

if ls_mad='0' then
	tab_1.tp_2.cb_adic.enabled=false
end if


SELECT cadena into :ls_pad
FROM parametros_gen
WHERE (((codigo_para)=72));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 72')
	return -1
end if
if ls_pad='0' then
	tab_1.tp_1.cb_nvserv.enabled=false
end if

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
select count(item) into :j from oscuerpo 
where contador=:i_contador and clugar=:i_clug_his and nsolicitud=:i_norden
and estado='1';//sin atender
if j>0 then 
	if dw_oscab.getitemstring(dw_oscab.getrow(),'estado')='2' then
		dw_oscab.setitem(dw_oscab.getrow(),'estado','1')
	end if
else
	if dw_oscab.getitemstring(dw_oscab.getrow(),'estado')='1' then
		dw_oscab.setitem(dw_oscab.getrow(),'estado','2')
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

public function integer f_estado_hadm (string as_estado_hadm);i_est_hadm=as_estado_hadm
return 1
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
i_esp=p_cesp
SELECT Count(ServiciosIngreso.Contador) INTO :cant_serv
FROM ServiciosIngreso
WHERE (((ServiciosIngreso.Contador)=:i_contador) AND ((ServiciosIngreso.CLugar)=:i_clug_his));
IF SQLCA.SQLCODE=-1 THEN 
	messagebox("Error leyendo Servicios1",sqlca.sqlerrtext)
	return -1
end if

if i_indapdx='Q' then
	dw_oscab.retrieve(i_nqx,i_clug_qx,i_consec_qx)
else
	dw_oscab.retrieve(i_contador,i_clug_his)
end if
dw_oscab.setredraw(true)
if i_tingre='2' or i_tingre='3' or i_tingre='4'  or i_tingre='7' then
	SELECT entero into :l_temp_ord
	FROM parametros_gen
	WHERE (((codigo_para)=9));
	if sqlca.sqlnrows=0 then
		messagebox('Atencíon','No hay parametro 9')
	end if
	
	
	select estado,cemp,ccontrato into :i_est_hadm,:i_cemp,:i_ccont from hospadmi where nh=:i_nh and clugar=:i_clug_hadm;
	if sqlca.sqlcode=-1 then
		messagebox('Error leyendo estado de HospAdmi',sqlca.sqlerrtext)
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
	end If
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
		return -1
	end if
end if

SELECT cadena into :is_202
FROM parametros_gen
WHERE (((codigo_para)=81));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 81')
	return -1
end if
return 1
end function

on uo_orden_formula.create
this.rte_1=create rte_1
this.dw_formato=create dw_formato
this.dw_cond=create dw_cond
this.l_archivos=create l_archivos
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
this.cb_anul_ord=create cb_anul_ord
this.cb_borrorden=create cb_borrorden
this.cb_nvorden=create cb_nvorden
this.mle_1=create mle_1
this.pb_ordenes=create pb_ordenes
this.pb_abre=create pb_abre
this.Control[]={this.rte_1,&
this.dw_formato,&
this.dw_cond,&
this.l_archivos,&
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
this.cb_anul_ord,&
this.cb_borrorden,&
this.cb_nvorden,&
this.mle_1,&
this.pb_ordenes,&
this.pb_abre}
end on

on uo_orden_formula.destroy
destroy(this.rte_1)
destroy(this.dw_formato)
destroy(this.dw_cond)
destroy(this.l_archivos)
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
destroy(this.cb_anul_ord)
destroy(this.cb_borrorden)
destroy(this.cb_nvorden)
destroy(this.mle_1)
destroy(this.pb_ordenes)
destroy(this.pb_abre)
end on

event constructor;tab_1.tp_1.pb_ord.cod_rep=i_codrep_orden
tab_1.tp_1.pb_ord.dialogo=repord_dialogo
tab_1.tp_1.pb_ord.v_preliminar=repord_vprelim
tab_1.tp_2.pb_for.cod_rep=i_codrep_formula
tab_1.tp_2.pb_for.dialogo=repfor_dialogo
tab_1.tp_2.pb_for.v_preliminar=repfor_vprelim
end event

type rte_1 from richtextedit within uo_orden_formula
boolean visible = false
integer x = 5682
integer y = 208
integer width = 165
integer height = 108
integer taborder = 40
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean border = false
end type

type dw_formato from datawindow within uo_orden_formula
boolean visible = false
integer x = 5682
integer y = 340
integer width = 187
integer height = 112
integer taborder = 40
string title = "none"
string dataobject = "asis_int_anexo9"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_cond from datawindow within uo_orden_formula
boolean visible = false
integer x = 5568
integer y = 8
integer width = 215
integer height = 76
integer taborder = 30
string title = "none"
string dataobject = "dw_hcliin_conducta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type l_archivos from dropdownlistbox within uo_orden_formula
boolean visible = false
integer x = 5609
integer y = 80
integer width = 219
integer height = 104
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type cbx_banco from checkbox within uo_orden_formula
boolean visible = false
integer x = 2766
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

type dw_primerorden from datawindow within uo_orden_formula
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

type gb_1 from groupbox within uo_orden_formula
integer x = 5
integer width = 6021
integer height = 492
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

type pb_rn from picturebutton within uo_orden_formula
event mousemove pbm_mousemove
boolean visible = false
integer x = 5833
integer y = 924
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
string picturename = "arb_lapiz.bmp"
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

type pb_rip from picturebutton within uo_orden_formula
event mousemove pbm_mousemove
integer x = 5833
integer y = 784
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "             &i"
boolean originalsize = true
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
st.dw_meds=tab_1.tp_2.dw_formula
st.tingres=i_tingre
st.profe=dw_profe_atiende.getitemstring(1,1)
st.tipo_orden=dw_oscab.getitemstring(dw_oscab.getrow(),'tipo_orden')
openwithparm(w_new_estad_ria_os,st)
if message.stringparm='Y' then 
	revi_est_ord()
	dw_oscab.event rowfocuschanged(dw_oscab.getrow())
end if
end event

event constructor;f_inicia_boton(this,'ATOS')
end event

type pb_evol from picturebutton within uo_orden_formula
event mousemove pbm_mousemove
integer x = 4137
integer y = 624
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &v"
boolean originalsize = true
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
str.dw_med=tab_1.tp_2.dw_formula
str.campo_cant_med='solicitada'
str.ventana=f_vent_padre(this)
str.contador=i_contador
str.clugar_his=i_clug_his
str.nh=i_nh
str.clug_hadm=i_clug_hadm
str.tingres=i_tingre
str.profes=profesi
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
					select  profe.nombre1|| case when profe.nombre2  is null then ' ' else  '  '||profe.nombre2 end ||' '|| 
	 				profe.apellido1|| case when profe.apellido2 is null then ' ' else  '  '||profe.apellido2 end as desprof into :st_respon.text from profe where codprof=:profesi;
				else
					select  profe.nombre1+ case when profe.nombre2  is null then ' ' else  '  '+profe.nombre2 end +' '+ 
	 				profe.apellido1+ case when profe.apellido2 is null then ' ' else  '  '+profe.apellido2 end as desprof into :st_respon.text from profe where codprof=:profesi;
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

type pb_new from picturebutton within uo_orden_formula
event mousemove pbm_mousemove
integer x = 3982
integer y = 628
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
long j,cuantos,k
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
			cuantos ++
		end if
	end if
next
for j=1 to tab_1.tp_2.dw_formula.rowcount()
	if tab_1.tp_2.dw_formula.getitemstring(j,"escog")="1" then cuantos ++
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
	trae st
	st.numero=i_contador
	st.lugar=i_clug_his
	st.otro='carga'
	st.dw_procs=tab_1.tp_1.dw_oscuerpo
	st.dw_meds=tab_1.tp_2.dw_formula
	st.tingres=i_tingre
	st.profe=dw_profe_atiende.getitemstring(1,1)
	if dw_oscab.getitemstring(dw_oscab.getrow(),'tipo_orden')='B' then
		openwithparm(w_banco_atiende,st)
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

type dw_profe_atiende from datawindow within uo_orden_formula
integer x = 2299
integer y = 668
integer width = 1531
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

type st_5 from statictext within uo_orden_formula
integer x = 2039
integer y = 616
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
string text = "Profesiona&l que atiende:"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_respon from statictext within uo_orden_formula
integer x = 1385
integer y = 672
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

type st_6 from statictext within uo_orden_formula
integer x = 1381
integer y = 616
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

type pb_2 from picturebutton within uo_orden_formula
event mousemove pbm_mousemove
integer x = 914
integer y = 616
integer width = 146
integer height = 128
integer taborder = 40
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

event clicked;if dw_oscab.dataobject='dw_oscabeza_sale_hosp' and dw_oscab.getitemstring(dw_oscab.getrow(),"tipo_orden")='I' then
	return 
End if
if dw_oscab.rowcount() = 0 then 
	if cb_nvorden.event clicked()=-1 then return -1
end if
if DaysAfter ( date(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")), date(now()) )> 0 then
	return 
else
	if  SecondsAfter(time(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")),time(now())) > (integer(l_temp_ord)*60) then 
		return 
	end if
end if
choose case i_tingre
	case '1'
		string estado
		if dw_oscab.rowcount()>0 then
			estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
			if estado='2' or estado='3'  or estado='4' then
				Messagebox("Atención","Esta orden de servicio ya está completa o anulada, no se pueden borrar procedimientos")
				return
			end if
		end if
	case '2','3','4','7'
	if not isnull(dw_oscab.getitemstring(dw_oscab.getrow(),'cod_banco')) then return
end choose
st_proc_comun st_pc
st_pc.sle_proc=tab_1.tp_1.sle_1
st_pc.dw_procs=tab_1.tp_1.dw_oscuerpo
st_pc.col_cant_proc='solicitada'

st_pc.sle_med=tab_1.tp_2.sle_2
st_pc.dw_meds=tab_1.tp_2.dw_formula
st_pc.col_cant_med='solicitada'
st_pc.frecuen='frecuen'
st_pc.administracion='administracion'
st_pc.veren='2'

//openwithparm(w_kit_viejo,st_pc)
openwithparm(w_kit_new,st_pc)
end event

type tab_1 from tab within uo_orden_formula
event create ( )
event destroy ( )
integer y = 500
integer width = 6021
integer height = 1092
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

event selectionchanged;//if tag='1' then
//	if f_permiso_boton(this,'ATOS')=0 then return
//end if
end event

type tp_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5984
integer height = 964
long backcolor = 67108864
string text = "Procedimientos"
long tabtextcolor = 33554432
string picturename = "ap_dx.ico"
long picturemaskcolor = 536870912
string powertiptext = "Ordenar Servicios de Apoyo Diagnostico"
pb_ci pb_ci
dw_oscuerpo dw_oscuerpo
cb_12 cb_12
cb_delserv cb_delserv
cb_nvserv cb_nvserv
sle_1 sle_1
st_18 st_18
pb_remi pb_remi
pb_ord pb_ord
end type

on tp_1.create
this.pb_ci=create pb_ci
this.dw_oscuerpo=create dw_oscuerpo
this.cb_12=create cb_12
this.cb_delserv=create cb_delserv
this.cb_nvserv=create cb_nvserv
this.sle_1=create sle_1
this.st_18=create st_18
this.pb_remi=create pb_remi
this.pb_ord=create pb_ord
this.Control[]={this.pb_ci,&
this.dw_oscuerpo,&
this.cb_12,&
this.cb_delserv,&
this.cb_nvserv,&
this.sle_1,&
this.st_18,&
this.pb_remi,&
this.pb_ord}
end on

on tp_1.destroy
destroy(this.pb_ci)
destroy(this.dw_oscuerpo)
destroy(this.cb_12)
destroy(this.cb_delserv)
destroy(this.cb_nvserv)
destroy(this.sle_1)
destroy(this.st_18)
destroy(this.pb_remi)
destroy(this.pb_ord)
end on

type pb_ci from picturebutton within tp_1
boolean visible = false
integer x = 5824
integer y = 452
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean default = true
boolean originalsize = true
string picturename = "PatientFile.png"
string disabledname = "d_PatientFile.png"
alignment htextalign = left!
string powertiptext = "Imprimir Consetimiento Informado Qx"
end type

event clicked;//if tag='1' then
//	if f_permiso_boton(this,'ATOS')=0 then return
//end if

IF dw_oscuerpo.rowcount()=0 then return

uo_report li_rep
li_rep=create uo_report
li_rep.cod_rep=dw_oscuerpo.getitemstring(dw_oscuerpo.getrow(),"codproced")
li_rep.v_preliminar=true
li_rep.dialogo=false
li_rep.tipo_rep='consenti!'
any par[3]
par[1]=tipdoc
par[2]=docu
par[3]=dw_oscuerpo.getitemstring(dw_oscuerpo.getrow(),"codproced")
li_rep.imprimir(par,'','0')


end event

type dw_oscuerpo from datawindow within tp_1
event keypress pbm_dwnkey
event p_itemchanged ( )
integer x = 27
integer y = 156
integer width = 5760
integer height = 808
integer taborder = 20
string dragicon = "none!"
string dataobject = "dw_oscpo_cext"
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
	string nulo
	int dias
	date ffinal

	if dwo.name='solicitada' and getitemstring(getrow(),'prioridad')='I' then
		ffinal=RelativeDate(date(getitemdatetime(getrow(),'Ifecha_ini')), double(data) -1) 
		setitem(getrow(),'ifecha_fin',ffinal)
	end if
	if dwo.name='ifecha_fin' then
		if date(getitemdatetime(getrow(),'Ifecha_ini'))<date(data) then
			dias=daysafter(date(getitemdatetime(getrow(),'Ifecha_ini')),date(data))+1
			settext('1')
			setitem(getrow(),'solicitada',dias)
		else
			messagebox('Atencion','Fecha No puede ser inferior a Fecha Inicial')
		end if
	end if
	if dwo.name='rta' then
		setnull(nulo)
		setitem(getrow(),'codproced',nulo)
	end if	
	if dwo.name='examen' then
		setnull(nulo)
		setitem(getrow(),'codproced',nulo)
	end if
	if dwo.name='solicitada' and i_indapdx<>'0' then
		if long(gettext())>1 and getitemstring(getrow(),'agrupser')='04' then 
			settext('1')
			setitem(getrow(),'solicitada',1)
			return 1
		end if
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
		end if
	end if
end if
post event p_itemchanged()
end event

event buttonclicked;long j
for j=1 to rowcount()
	if dwo.text='Escoger' then
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

type cb_12 from picturebutton within tp_1
event mousemove pbm_mousemove
integer x = 585
integer y = 8
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
string estado
str_proc.t_ingreso=i_tingre
if dw_oscab.dataobject='dw_oscabeza_sale_hosp' and dw_oscab.getitemstring(dw_oscab.getrow(),"tipo_orden")='I' then
	return 
End if
if dw_oscab.rowcount() = 0 then 
	if cb_nvorden.event clicked()=-1 then return -1
end if
choose case i_tingre
	case '1'
		if DaysAfter ( date(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")), date(now()) )> 0 then
			return 
		else
			if  SecondsAfter(time(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")),time(now())) > (integer(l_temp_ord)*60) then 
				return 
			end if
		end if
		if i_contador<> -1 then 
			if dw_oscab.rowcount() = 0 then 
				if cb_nvorden.event clicked()=-1 then return -1
			end if
			estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
			if estado='2' or estado='3'  or estado='4' then
				Messagebox("Atención","Esta orden de servicio ya está completa o anulada, no se pueden borrar procedimientos")
			return
			end if
			str_proc.sle=sle_1
			if dw_oscab.getitemstring(dw_oscab.getrow(),'tipo_orden')='N' then
				str_proc.p_qx=false
			else
				str_proc.p_qx=true
			end if
			str_proc.norden=true
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
		estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
		if estado="2" or estado="3" or estado='4'  then
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
integer y = 8
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

event clicked;string estado
if dw_oscab.rowcount()>0 then estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
if DaysAfter ( date(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")), date(now()) )> 0 then
	return 
else
	if  SecondsAfter(time(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")),time(now())) > (integer(l_temp_ord)*60) then 
		return 
	end if
end if

choose case i_tingre
	case '1'
		if estado="2" or estado="3"  or estado='4' then
			Messagebox("Atención","Esta orden de servicio ya está completa o anulada, no se pueden borrar procedimientos")
			return
		end if
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
		
		if i_est_hadm<>"1" then
			Messagebox("Atención","No se puede borrar procedimientos ya que la admisión no está activa")
			return
		end if
		
		if estado="2" or estado="3" or estado='4' then
			Messagebox("Atención","Esta orden de servicio ya está completa o anulada, no se pueden borrar procedimientos")
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
		dw_oscuerpo.deleterow(0)
		if dw_oscuerpo.update()=-1 then
			rollback;
		else
			commit;
			rn()
		end if
		revi_est_ord()
end choose
end event

type cb_nvserv from picturebutton within tp_1
event mousemove pbm_mousemove
integer x = 37
integer y = 8
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

event clicked;string estado,ls_tipoo

if dw_oscab.rowcount() = 0 then 
	if cb_nvorden.event clicked()=-1 then return -1
end if
if DaysAfter ( date(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")), date(now()) )> 0 then
	return 
else
	if  SecondsAfter(time(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")),time(now())) > (integer(l_temp_ord)*60) then 
		return 
	end if
end if
if i_tingre='1' then
	if dw_oscab.rowcount()>0 then
		estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
		if estado='2' or estado='3' then
			Messagebox("Atención","Esta orden de servicio ya está completa o anulada, no se pueden borrar procedimientos")
			return
		end if
	end if
end if
ls_tipoo=dw_oscab.getitemstring(dw_oscab.getrow(),"tipo_orden")
if dw_oscab.rowcount() = 0 then 
	if cb_nvorden.event clicked()=-1 then return -1
end if
long fila,cuenta,i
if (dw_oscuerpo.rowcount() = 1 and (ls_tipoo='SI'  or ls_tipoo='I')) then
	return
end if

fila=dw_oscuerpo.insertrow(0)
dw_oscuerpo.setitem(fila,"contador",i_contador)
dw_oscuerpo.setitem(fila,"clugar",i_clug_his)
dw_oscuerpo.setitem(fila,"nsolicitud",i_norden)
if (dw_oscab.dataobject='dw_oscabeza_sale_hosp' and ls_tipoo='I') then
	dw_oscuerpo.setitem(fila,"prioridad",'I')
	dw_oscuerpo.setitem(fila,"examen",'SE GENERA INCAPACIDAD DESDE')
	dw_oscuerpo.setitem(fila,"ifecha_ini",l_fechaingreso)
end if

if (dw_oscab.dataobject='dw_oscabeza' and ls_tipoo='I') then
	dw_oscuerpo.setitem(fila,"prioridad",'I')	
	dw_oscuerpo.setitem(fila,"examen",'SE GENERA INCAPACIDAD DESDE')
	dw_oscuerpo.setitem(fila,"ifecha_ini",today())
end if

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
if dw_oscab.rowcount()=0 then return
if dw_oscab.dataobject='dw_oscabeza_sale_hosp' and dw_oscab.getitemstring(dw_oscab.getrow(),"tipo_orden")='I' then
	return 
End if
string estado
choose case i_tingre
	case '1'
		if dw_oscab.rowcount()>0 then
			estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
			if estado='2' or estado='3' then
				Messagebox("Atención","Esta orden de servicio ya está completa o anulada, no se pueden borrar procedimientos")
				return
			end if
		end if
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
	dw_oscuerpo.setfocus()
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

type pb_remi from picturebutton within tp_1
integer x = 5815
integer y = 16
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
alignment htextalign = left!
string powertiptext = "Imprime Remisión"
end type

event clicked;if f_permiso_boton(this,'ATOS')=0 then return -1
if dw_oscab.getitemstring(dw_oscab.getrow(),"estado")='3' then return
any par[3]

par[1]=i_contador
par[2]=i_norden
par[3]=i_clug_his

//para firma
int  li_FileNum
string dir_tmp, err, stx, ret, des_nivel,ls_cod,ls_archivo
blob b_firma

ls_cod=dw_oscab.getitemstring(dw_oscab.getrow(),"codprof")

selectblob firma into :b_firma from profe
where codprof=:ls_cod;
if SQLCA.SQLCode <> 0 then
	MessageBox("SQL error",SQLCA.SQLErrText,Information!)
	return -1
end if

dir_tmp = is_path +ls_cod+string(today(),'yymmddhhmm') +".jpg"
li_FileNum = FileOpen(dir_tmp , StreamMode!, Write!, LockWrite!, Replace!)
if isNull(li_FileNum) or li_FileNum < 1 then
	MessageBox('Atención','Error creando archivo temporal de imágen')
	Return -1
end if
FileWriteEx ( li_FileNum, b_firma)
FileClose(li_FileNum)
if dw_formato.retrieve(i_contador,i_norden,i_clug_his)>0 then 
	ret =  dw_formato.Modify("p_firma.Filename = '" +dir_tmp +"'")
	if ret <> '' then 
		MessageBox('Error','Insertando Firma Digital')
		ret =  dw_formato.Modify("p_firma.Filename=''")
	end if
	///para firma
	
	mle_1=f_remision(i_contador,i_clug_his ,rte_1,mle_1)
	dw_formato.SetItem(1,'dato_relevante',mle_1.text)
	mle_1.Text = ''
	
	ls_archivo = 'remision_'+string(i_contador)+'_'+string(i_norden)+'_'+string(datetime(today(),now()),'yyyymmddhhmmss')
	ls_archivo=  is_path+ ls_archivo+'.pdf'
	dw_formato.Object.DataWindow.Export.PDF.Method = NativePDF!
	dw_formato.Object.DataWindow.Export.PDF.NativePDF.Restrictions = 'nomodify!,nocopy!'
	if dw_formato.saveas(ls_archivo,PDF!, true)=-1 then 
		return 0 
	end if
	
	string ls_exec
	ls_exec =gs_pdf+ls_archivo
	run(ls_exec)
	
	if i_tingre='1' then //ap dx
		dw_oscab.setitem(dw_oscab.getrow(),'estado','2')
		
		dw_oscab.setitem(dw_oscab.getrow(),'impreso','1')

		if dw_oscab.update(true,false)=-1 then
			rollback;
		else
			commit;
			UPDATE OSCuerpo SET estado = '2'
			WHERE 
				(((Contador)=:i_contador) AND 
				((clugar)=:i_clug_his) AND ((NSolicitud)=:i_norden));
			if dw_oscab.update(true,false)=-1 then
				rollback;
			else
				commit;
			end if
			dw_oscab.resetupdate()
			dw_oscab.event rowfocuschanged(dw_oscab.getrow())
		end if
	end if
end if
end event

type pb_ord from pb_report within tp_1
integer x = 5815
integer y = 16
integer taborder = 40
string text = "          &o"
boolean originalsize = false
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
string powertiptext = "Imprimir Orden de Servicio [Alt+O]"
string nombre_rep = "Orden de Servicio"
string tipo_rep = "interno!"
boolean dialogo = true
end type

event clicked;call super::clicked;if f_permiso_boton(this,'ATOS')=0 then return -1

if dw_oscab.getitemstring(dw_oscab.getrow(),"estado")='3' then return
any par[3]

par[1]=i_contador
par[2]=i_norden
par[3]=i_clug_his

Integer index,ls_impreso
string ls_tiporep
l_archivos.DirList ("C:\windows\temp\*.png",0)
For index=1 To l_archivos.totalItems ( )
     FileDelete ( l_archivos.text(index))
Next

if imprimir(par,dw_oscab.getitemstring(dw_oscab.getrow(),'codprof'),'1')=1 then
	if i_tingre='1' then //ap dx
		ls_tiporep=dw_oscab.getitemstring(dw_oscab.getrow(),'cont_imp')
		if isnull(ls_tiporep) then ls_tiporep='N'
		
		dw_oscab.setitem(dw_oscab.getrow(),'estado','2')
		
		select 
			count(tipo) as ctos,max(impreso) into :index,:ls_impreso
		from
		(
			select distinct oscabeza.impreso,oscuerpo.tipo
			from oscabeza inner join oscuerpo on (oscabeza.nsolicitud = oscuerpo.nsolicitud) and (oscabeza.clugar = oscuerpo.clugar) and (oscabeza.contador = oscuerpo.contador)
			where (((oscabeza.contador)=:i_contador) and ((oscabeza.clugar)=:i_clug_his) and ((oscabeza.nsolicitud)=:i_norden))
		) as todos;
		
		if isnull(ls_impreso) or ls_impreso=0  then 
			if index >1 and ls_tiporep='N' then
				ls_impreso=0
				dw_oscab.setitem(dw_oscab.getrow(),'cont_imp','P')
			else
				ls_impreso=1
			end if
		else
			if index >1 and ls_tiporep='N'  then
				ls_impreso=2
				dw_oscab.setitem(dw_oscab.getrow(),'cont_imp','1')
			else
				if ls_tiporep='P' then 
					ls_impreso++		
				end if
			end if
		end if
		dw_oscab.setitem(dw_oscab.getrow(),'impreso',ls_impreso)
	
		if dw_oscab.update(true,false)=-1 then
			rollback;
		else
			commit;
			UPDATE OSCuerpo SET estado = '2'
			WHERE 
				(((Contador)=:i_contador) AND 
				((clugar)=:i_clug_his) AND ((NSolicitud)=:i_norden));
			if dw_oscab.update(true,false)=-1 then
				rollback;
			else
				commit;
			end if
			dw_oscab.resetupdate()
			dw_oscab.event rowfocuschanged(dw_oscab.getrow())
		end if
	end if
end if


end event

type tp_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5984
integer height = 964
long backcolor = 67108864
string text = "Medicamentos"
long tabtextcolor = 33554432
string picturename = "entrega_med.ico"
long picturemaskcolor = 536870912
string powertiptext = "Realizar la Fórmula Médica"
pb_copy pb_copy
pb_np pb_np
pb_for pb_for
dw_formula dw_formula
cb_10 cb_10
cb_adic cb_adic
cb_borra_med cb_borra_med
st_19 st_19
sle_2 sle_2
end type

on tp_2.create
this.pb_copy=create pb_copy
this.pb_np=create pb_np
this.pb_for=create pb_for
this.dw_formula=create dw_formula
this.cb_10=create cb_10
this.cb_adic=create cb_adic
this.cb_borra_med=create cb_borra_med
this.st_19=create st_19
this.sle_2=create sle_2
this.Control[]={this.pb_copy,&
this.pb_np,&
this.pb_for,&
this.dw_formula,&
this.cb_10,&
this.cb_adic,&
this.cb_borra_med,&
this.st_19,&
this.sle_2}
end on

on tp_2.destroy
destroy(this.pb_copy)
destroy(this.pb_np)
destroy(this.pb_for)
destroy(this.dw_formula)
destroy(this.cb_10)
destroy(this.cb_adic)
destroy(this.cb_borra_med)
destroy(this.st_19)
destroy(this.sle_2)
end on

type pb_copy from picturebutton within tp_2
integer x = 1047
integer y = 4
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "copia_orden.gif"
string disabledname = "dcopia_orden.gif"
alignment htextalign = left!
end type

event clicked;if dw_oscab.getitemstring(dw_oscab.getrow(),"estado")='2' or dw_oscab.getitemstring(dw_oscab.getrow(),"estado")='3' then
	Messagebox("Atención","Esta orden de servicio ya está completa o anulada, no se pueden borrar procedimientos")
	return
end if
if dw_oscab.rowcount() = 0 then 
	if cb_nvorden.event clicked()=-1 then return -1
end if
dw_cond.reset()
st_xa_procs_hc st
st.contador=i_contador
st.clug=i_clug_his
//st.cesp=i_cesp
st.cprof=i_profe
st.tingres=i_tingre
st.dw_procs=dw_cond
st.cemp=i_cemp
st.ccont=i_ccont
st.fecha=datetime(today(),now())
openwithparm(w_copiar_orden_cext,st)
st=message.powerobjectparm
if isvalid(st) then
	int l_i
	for l_i=1	 to dw_cond.rowcount()
		dw_cond.setcolumn(2)
		dw_cond.SetRow(l_i)
		sle_2.text=dw_cond.getitemstring(l_i,'cmedica')
		sle_2.triggerevent(modified!)
	next
end if
dw_cond.reset()
dw_cond.insertrow(1)
end event

type pb_np from picturebutton within tp_2
boolean visible = false
integer x = 5815
integer y = 460
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
string picturename = "nopos.gif"
string disabledname = "nopos_d.gif"
alignment htextalign = left!
string powertiptext = "Registrar datos de No Pos"
end type

event clicked;if tag='1' then
	if f_permiso_boton(this,'ATOS')=0 then return
end if
/*trae_ord trae2_ord
trae2_ord.contador=i_contador
trae2_ord.lugar=i_clug_his
trae2_ord.solicitud=i_norden
trae2_ord.item=dw_formula.getitemnumber(dw_formula.getrow(),'item')
openwithparm(w_nopos,trae2_ord)
*/
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

type pb_for from pb_report within tp_2
integer x = 5810
integer y = 16
integer taborder = 40
string text = "      &F"
string powertiptext = "Imprimir Fórmula Médica [Alt+F]"
string nombre_rep = "Fórmula Médica"
string tipo_rep = "interno!"
boolean dialogo = true
end type

event clicked;call super::clicked;if f_permiso_boton(this,'ATOS')=0 then return -1
any par[3]
int index,ls_impreso, l_i
string ls_tiporep,ls_resul

///PARA 202
if is_202='1' then
	for l_i= 1 to tab_1.tp_2.dw_formula.rowcount()
		if not isnull(tab_1.tp_2.dw_formula.getitemstring(l_i,'ririas')) and dw_oscab.getitemstring(dw_oscab.getrow(),'estado')='1' then
			gf_validar_202_medi(	tipdoc,docu,&
				w_principal.dw_1.getitemstring(1,'sexo'),&
				w_principal.dw_1.getitemnumber(1,'dias'),&
				tab_1.tp_2.dw_formula.getitemnumber(l_i,'contador'),&
				tab_1.tp_2.dw_formula.getitemstring(l_i,'clugar'),&
				tab_1.tp_2.dw_formula.getitemstring(l_i,'varia_salud'),&
				tab_1.tp_2.dw_formula.getitemstring(l_i,'codplantilla'),&
				tab_1.tp_2.dw_formula.getitemstring(l_i,'c_medica'),&
				string(dw_oscab.getitemdatetime(dw_oscab.getrow(),'fecha'),'yyyy-mm-dd'))			
		end if
	next
end if

par[1]=i_contador
par[2]=i_norden
par[3]=i_clug_his
if imprimir(par,dw_oscab.getitemstring(dw_oscab.getrow(),'codprof'),'0')=1 then
	if i_tingre='1' then
		ls_tiporep=dw_oscab.getitemstring(dw_oscab.getrow(),'cont_imp')
		if isnull(ls_tiporep) then ls_tiporep='N'
		
		select 
			count(tipo)as ctos,max(impreso) as impreso 
		into 
			:index,:ls_impreso
		from
		(
			select distinct oscabeza.impreso,oscuerpo.tipo
			from oscabeza inner join oscuerpo on (oscabeza.nsolicitud = oscuerpo.nsolicitud) and (oscabeza.clugar = oscuerpo.clugar) and (oscabeza.contador = oscuerpo.contador)
			where (((oscabeza.contador)=:i_contador) and ((oscabeza.clugar)=:i_clug_his) and ((oscabeza.nsolicitud)=:i_norden))
		) as todos;
		
		if isnull(ls_impreso) or ls_impreso=0  then 
			if index >1 and ls_tiporep='N' then
				ls_impreso=0
			else
				ls_impreso=0
			end if
			dw_oscab.setitem(dw_oscab.getrow(),'cont_imp','M')			
		else
			ls_impreso++		
		end if
		dw_oscab.setitem(dw_oscab.getrow(),'impreso',ls_impreso)
		dw_oscab.setitem(dw_oscab.getrow(),'estado','2')
		if dw_oscab.update(true,false)=-1 then
			rollback;
		else
			commit;
			UPDATE OSCuerpo SET estado = '2'
			WHERE 
				(((Contador)=:i_contador) AND 
				((clugar)=:i_clug_his) AND ((NSolicitud)=:i_norden));
			if dw_oscab.update(true,false)=-1 then
				rollback;
			else
				commit;
			end if
			dw_oscab.resetupdate()
			dw_oscab.event rowfocuschanged(dw_oscab.getrow())
		end if
	end if
end if

end event

type dw_formula from datawindow within tp_2
event keypress pbm_dwnkey
event p_itemchanged ( )
integer x = 32
integer y = 148
integer width = 5755
integer height = 808
integer taborder = 46
string dragicon = "none!"
string dataobject = "dw_oscpo_form_cext"
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
getchild("tiempo",i_dw_tmp)
i_dw_tmp.settransobject(sqlca)
i_dw_tmp.retrieve('1')

getchild("frecuen",i_dw_frec)
i_dw_frec.settransobject(sqlca)

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

event rowfocuschanged;if getrow()<1 then 
	return
end if
if getitemstring(getrow(),'pos')='2' then
	pb_np.enabled=true
else
	pb_np.enabled=false
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
string picturename = "capsula busca.GIF"
string disabledname = "d_capsula busca.GIF"
alignment htextalign = left!
string powertiptext = "Buscar Medicamento [Alt+B]"
end type

event clicked;string estado
if dw_oscab.dataobject='dw_oscabeza_sale_hosp' and dw_oscab.getitemstring(dw_oscab.getrow(),"tipo_orden")='I' then
	return 
End if
if dw_oscab.rowcount() = 0 then 
	if cb_nvorden.event clicked()=-1 then return -1
end if
choose case i_tingre
	case '1'
		if DaysAfter ( date(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")), date(now()) )> 0 then
			return 
		else
			if  SecondsAfter(time(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")),time(now())) > (integer(l_temp_ord)*60) then 
				return 
			end if
		end if
		if dw_oscab.rowcount() = 0 then 
			if cb_nvorden.event clicked()=-1 then return -1
		end if
		estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
		if estado='2' or estado='3' or estado='4' then
			Messagebox("Atención","Esta orden de servicio ya está completa o anulada, no se pueden borrar procedimientos")
			return
		end if
		st_pa_medica st_m
		string l_i_alm_cext 
		if ls_pro=32 THEN	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_CEXT", Regstring!, l_i_alm_cext )
		if ls_pro=64 THEN	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_CEXT", Regstring!,l_i_alm_cext)	
	    if isnull( l_i_alm_cext ) then
			setnull(st_m.alm_cext)
		else
			st_m.alm_cext= l_i_alm_cext 
		end if
		st_m.sle=sle_2
		st_m.origen= i_tingre
		openwithparm(w_busca_med,st_m)
	case '2','3','4','7'
		if dw_oscab.rowcount()=0 then return
		if not isnull(dw_oscab.getitemstring(dw_oscab.getrow(),'cod_banco')) then return
		if tag='1' then
			if f_permiso_boton(this,'ATOS')=0 then return
		end if
		if i_est_hadm<>"1" then
			Messagebox("Atención","No se puede agregar medicamentos ya que la admisión no está activa")
			return
		end if
		estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
		if estado="2" or estado="3"or estado='4' then
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
			 st_m.alm_cext=l_i_alm_urg
	    else
			 if i_tingre='3' or i_tingre='7' then  
				 st_m.alm_cext=l_i_alm_hosp
		      else  
			     st_m.alm_cext= l_i_alm_amb
			end if
		end if
		openwithparm(w_busca_med_x_gen,st_med)
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

event clicked;string estado
if dw_oscab.rowcount() = 0 then 
	if cb_nvorden.event clicked()=-1 then return -1
end if
if dw_oscab.dataobject='dw_oscabeza_sale_hosp' and dw_oscab.getitemstring(dw_oscab.getrow(),"tipo_orden")='I' then
	return 
End if
if i_tingre='1' then
	if DaysAfter ( date(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")), date(now()) )> 0 then
		return 
	else
		if  SecondsAfter(time(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")),time(now())) > (integer(l_temp_ord)*60) then 
			return 
		end if
	end if	
	if dw_oscab.rowcount()>0 then
		estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
		if estado='2' or estado='3' then
			Messagebox("Atención","Esta orden de servicio ya está completa o anulada, no se pueden borrar procedimientos")
			return
		end if
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

event clicked;string estado
if dw_oscab.dataobject='dw_oscabeza_sale_hosp' and dw_oscab.getitemstring(dw_oscab.getrow(),"tipo_orden")='I' then
	return 
End if
choose case i_tingre
	case '1'
		if DaysAfter ( date(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")), date(now()) )> 0 then
			return 
		else
			if  SecondsAfter(time(dw_oscab.getitemdatetime(dw_oscab.getrow(),"fecha")),time(now())) > (integer(l_temp_ord)*60) then 
				return 
			end if
		end if
		if dw_oscab.rowcount()>0 then
			estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
			if estado='2' or estado='3' or estado='4' then
				Messagebox("Atención","Esta orden de servicio ya está completa o anulada, no se pueden borrar procedimientos")
				return
			end if
		end if
		
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
		if i_est_hadm<>"1" then
			Messagebox("Atención","No se puede borrar procedimientos ya que la admisión no está activa")
			return
		end if
		estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
		if estado="2" or estado="3"  or estado='4'then
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
integer x = 224
integer width = 320
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
if dw_oscab.dataobject='dw_oscabeza_sale_hosp' and dw_oscab.getitemstring(dw_oscab.getrow(),"tipo_orden")='I' then
	return 
End if
if dw_oscab.rowcount()=0 then return
choose case i_tingre
	case '1'
		string estado
		if dw_oscab.rowcount()>0 then
			estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
			if estado='2' or estado='3' then
				Messagebox("Atención","Esta orden de servicio ya está completa o anulada, no se pueden borrar procedimientos")
				return
			end if
		end if
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
end if

end event

type dw_oscab from datawindow within uo_orden_formula
event keypress pbm_dwnkey
event pe_changed ( )
integer x = 23
integer y = 52
integer width = 5792
integer height = 412
integer taborder = 10
string dragicon = "none!"
boolean bringtotop = true
string dataobject = "dw_oscabeza"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event pe_changed();if dw_oscab.getitemnumber(1,'tincap')>1 then 
	messagebox('Atención','Solo se puede generar una orden de incapacidad por atención')
	dw_oscab.deleterow(getrow())
end if
		
accepttext()
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
st_return_diags st

fila=getrow()
if fila<1 then return
string nulo
setnull(nulo)
choose case getcolumnname()
	case 'cod_rips'
		if (trim(data)<>"" or (trim(this.getitemstring(fila,'cod_rips'))<>"" and not isnull(this.getitemstring(fila,'cod_rips'))))then
			string diag,este=''
			st=f_check_diag(trim(gettext()),w_principal.dw_1.getitemstring(1,"sexo"),w_principal.dw_1.getitemnumber(1,"dias"),este,'0')
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
	case 'tipo_orden'
		if data='I' then
			setitem(row,'comentario','A QUIEN LE PUEDA INTERESAR')
		else
			setitem(row,'comentario',nulo)
		end if	
end choose
accepttext()
post event pe_changed()
end event

event rowfocuschanged;tab_1.tp_1.dw_oscuerpo.reset()
tab_1.tp_2.dw_formula.reset()
i_norden=-1
if getrow()<1 then return
if getitemstring(getrow(),"tipo_orden")='R' then
	tab_1.tp_1.pb_remi.visible=true
	tab_1.tp_1.pb_ord.visible=false
else
	tab_1.tp_1.pb_remi.visible=false
	tab_1.tp_1.pb_ord.visible=true	
end if
i_norden=getitemnumber(getrow(),"nsolicitud")
tab_1.tp_1.dw_oscuerpo.retrieve(i_contador,i_clug_his,i_norden)
tab_1.tp_2.dw_formula.retrieve(i_contador,i_clug_his,i_norden)

end event

event doubleclicked;if i_contador= -1 then return

if  getcolumnname()= 'cod_rips' then 
	st_edadsexo st_es
	st_diag st_d
	st_es.sexo=w_principal.dw_1.getitemstring(1,"sexo")
	st_es.edad=w_principal.dw_1.getitemnumber(1,"dias")
	st_es.antece='0'
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
	//	for i=1 to filasord
	//		dw_oscab.setitem(i,'codgeral',st_d.codgeral)
	//		dw_oscab.setitem(i,'cod_rips',st_d.codrip)
	//		dw_oscab.setitem(i,'diagnostico',st_d.descripcion)
	//	next	
		dw_oscab.setitem(dw_oscab.getrow(),'codgeral',st_d.codgeral)
		dw_oscab.setitem(dw_oscab.getrow(),'cod_rips',st_d.codrip)
		dw_oscab.setitem(dw_oscab.getrow(),'diagnostico',st_d.descripcion)
		dw_oscab.setfocus()
	end if
	sqlca.autocommit=true
	dw_oscab.update()
	sqlca.autocommit=false
	commit;
end if
end event

type dw_profe from datawindow within uo_orden_formula
integer x = 1861
integer y = 52
integer width = 869
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

type st_2 from statictext within uo_orden_formula
integer x = 1545
integer y = 64
integer width = 311
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
string text = "&Quien Solicita:"
boolean focusrectangle = false
end type

type cb_anul_ord from picturebutton within uo_orden_formula
event mousemove pbm_mousemove
integer x = 5842
integer y = 340
integer width = 146
integer height = 128
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &C"
boolean originalsize = true
string picturename = "borrador.GIF"
string disabledname = "d_borrador.GIF"
alignment htextalign = left!
string powertiptext = "Anular Orden [Alt+C]"
end type

event clicked;if i_contador=-1 then return
string l_estado
l_estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
if l_estado='3' then
	Messagebox("Atención","Esta orden de servicio ya anulada")
  	return
end if
if l_estado='2' then
	if MessageBox('Atención','El registro es nuevo. Desea Eliminarlo?',question!,yesno!) = 2 then return 0
end if

if f_permiso_boton(this,'ATOS')=0 then return -1
dw_oscab.setitem(dw_oscab.getrow(),"usu_anula",usuario)
dw_oscab.setitem(dw_oscab.getrow(),"fecha_anula",datetime(today(),now()))
dw_oscab.setitem(dw_oscab.getrow(),"estado",'3')
sqlca.autocommit=true
if dw_oscab.update()<1 then
	sqlca.autocommit=false
	rollback;
//	dw_oscab.deleterow(fila)
	return -1
else
	sqlca.autocommit=false
	commit;
end if
return 1
end event

type cb_borrorden from picturebutton within uo_orden_formula
event mousemove pbm_mousemove
integer x = 5842
integer y = 200
integer width = 146
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &e"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Eliminar Orden [Alt+E]"
end type

event clicked;if dw_oscab.rowcount()=0 then return
if cant_serv =0 then
	return
end If
if tag='1' then
	if f_permiso_boton(this,'ATOS')=0 then return
end if
string l_estado,l_tipo
l_estado=dw_oscab.getitemstring(dw_oscab.getrow(),"estado")
l_tipo=dw_oscab.getitemstring(dw_oscab.getrow(),"tipo_orden")
if tab_1.tp_1.dw_oscuerpo.rowcount()>0 then return
if tab_1.tp_2.dw_formula.rowcount()>0 then return

if l_tipo='I' then
	if messagebox("Atención","Esta orden de servicio va a ser anulada, esta seguro ?",Question!,YesNo! )=2 then return
	dw_oscab.setitem(dw_oscab.getrow(),'estado','3')
else
	if l_estado='2' or l_estado='3'  or l_estado='4' then
		Messagebox("Atención","Esta orden de servicio ya está completa o anulada, no se pueden borrar procedimientos")
		return
	end if
	dw_oscab.deleterow(0)
end if
if dw_oscab.update()=-1 then
	rollback;
else
	commit;
	dw_oscab.triggerevent(rowfocuschanged!)
end if
end event

type cb_nvorden from picturebutton within uo_orden_formula
event mousemove pbm_mousemove
integer x = 5842
integer y = 56
integer width = 146
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &n"
boolean originalsize = true
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
		where contador=:i_contador and clugar=:i_clug_his;
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
		dw_oscab.setitem(1,"cesp",i_esp)
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
			parent.retrieve(i_contador,i_clug_his,i_profe,i_nh,i_clug_hadm,i_tingre,i_nqx,i_clug_qx,i_consec_qx,i_esp)
			return -1
		else
			sqlca.autocommit=false
			commit;
			dw_oscab.triggerevent(rowfocuschanged!)
			if dw_oscab.rowcount()=1 and not isvalid(w_evolucion_new) then
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
		if dw_oscab.dataobject<>'dw_oscabeza_sale_hosp' then
						
				long cuantos				
				select count(*) into :cuantos
				from hclin_registro
				where ((contador=:i_contador) and (clugar=:i_clug_his));
				IF SQLCA.SQLCode = 100 or SQLCA.SQLCode = -1 THEN
					MessageBox('No se puede leer si hay registro si hay', SQLCA.SQLErrText)
					Return 
				END IF
				if cuantos<=0 then
					messagebox("Atención",'No ha creado soporte Clinco')
					return -1
				end if
			
			SELECT Count(1) AS cuantos, Historial.Fecha, ServiciosIngreso.diagprin, ServiciosIngreso.fin_consulta INTO :cant_serv, :fec,:i_coddiag,:cod_fina
			FROM ServiciosIngreso INNER JOIN Historial ON (ServiciosIngreso.CLugar = Historial.clugar) AND (ServiciosIngreso.Contador = Historial.Contador)
			WHERE  (((ServiciosIngreso.Contador)=:i_contador) AND ((ServiciosIngreso.CLugar)=:i_clug_his) AND ((ServiciosIngreso.nservicio)=
			(	SELECT Min(ServiciosIngreso.nservicio) AS MínDenservicio
				FROM ServiciosIngreso INNER JOIN Historial ON (ServiciosIngreso.CLugar = Historial.clugar) AND (ServiciosIngreso.Contador = Historial.Contador)
				WHERE (((ServiciosIngreso.Contador)=:i_contador) AND ((ServiciosIngreso.CLugar)=:i_clug_his))
				)))
			GROUP BY Historial.Fecha, ServiciosIngreso.diagprin, ServiciosIngreso.fin_consulta;
			IF SQLCA.SQLCODE=-1 THEN 
				messagebox("Error leyendo Servicios",sqlca.sqlerrtext)
				return -1
			end if
			select desdiag,cod_rips into :i_desdiag,:i_codrips
			from diags where codgeral=:i_coddiag;

			if cant_serv =0 and dw_oscab.dataobject<>'dw_oscabeza_sale_hosp'  then
				return
			end If
			if f_dif_fecha_minutos(fec,datetime(today(),now())) >(integer(l_temp_ord)*60) and dw_oscab.dataobject<>'dw_oscabeza_sale_hosp'  then 
				 messagebox('Atención','Atención se encuentra cerrada')
				return -1
			end if
		end If
		if dw_oscab.dataobject='dw_oscabeza_sale_hosp' then
			SELECT hospadmi.estado, HospSali.DiagEgreso, HospSali.NSalida,hospadmi.fechaingreso into :i_est_hadm,:i_coddiag,:l_nsalida,:l_fechaingreso
			FROM hospadmi LEFT JOIN HospSali ON (hospadmi.CodTIngre = HospSali.CodTIngre) AND (hospadmi.clugar = HospSali.clugar_hadm) AND (hospadmi.NH = HospSali.NHosp)
			WHERE (((Contador)=:i_contador) AND ((clugar_his)=:i_clug_his));
			if sqlca.sqlcode=-1 then
				messagebox('Error leyendo estado de HospAdmi',sqlca.sqlerrtext)
			end if
			if isnull(l_nsalida) then
				messagebox('Atención','La Atención no se encuentra cerrada')
				return -1
			end if
			if i_est_hadm<>'1' then
				messagebox('Atención','Atención se encuentra Cerrada o Facturada')
				return -1
			end if
			select desdiag,cod_rips into :i_desdiag,:i_codrips
			from diags where codgeral=:i_coddiag;
		end if

		fila=dw_oscab.insertrow(0)
		dw_oscab.setitem(fila,"contador",i_contador)
		dw_oscab.setitem(fila,"clugar",i_clug_his)
		dw_oscab.setitem(fila,"usuario",usuario)
		dw_oscab.setitem(fila,"codprof",i_profe)
		dw_oscab.setitem(fila,"cesp",i_esp)
		if i_desdiag='' then setnull(i_desdiag)
		dw_oscab.setitem(fila,'diagnostico',i_desdiag)
		dw_oscab.setitem(fila,'cod_rips',i_codrips)
		dw_oscab.setitem(fila,'cod_fina',cod_fina)
		if i_coddiag='' then setnull(i_coddiag)
		dw_oscab.setitem(fila,'codgeral',i_coddiag)
		dw_oscab.setitem(fila,'fecha',datetime(today(),now()))
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

type mle_1 from multilineedit within uo_orden_formula
boolean visible = false
integer x = 4987
integer y = 640
integer width = 219
integer height = 68
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long textcolor = 33554432
boolean border = false
boolean hscrollbar = true
boolean vscrollbar = true
end type

type pb_ordenes from picturebutton within uo_orden_formula
event mousemove pbm_mousemove
integer x = 5851
integer y = 212
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &m"
boolean originalsize = true
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

type pb_abre from picturebutton within uo_orden_formula
event mousemove pbm_mousemove
integer x = 5842
integer y = 340
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &a"
boolean originalsize = true
string picturename = "ocupar.gif"
string disabledname = "d_ocupar.gif"
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
			parent.retrieve(i_contador,i_clug_his,i_profe,i_nh,i_clug_hadm,i_tingre,i_nqx,i_clug_qx,i_consec_qx,i_esp)
		else
			sqlca.autocommit=false
			commit;
			dw_oscab.triggerevent(rowfocuschanged!)
		end if
end choose
		
end event

event constructor;f_inicia_boton(this,'ATOS')
end event

