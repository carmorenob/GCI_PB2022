﻿$PBExportHeader$nvo_rips_json.sru
forward
global type nvo_rips_json from nonvisualobject
end type
end forward

global type nvo_rips_json from nonvisualobject
end type
global nvo_rips_json nvo_rips_json

type variables
Integer  ii_puerto_email
string is_clave_firma,is_ruta_firma,is_ruta_facturas='' , is_cuenta_email , is_cuenta_email1
string is_server_email, is_clave_email,is_nombre_lugar//ruta en donde se guardan los zips y los pdf's
string is_ssl, is_tls
end variables

forward prototypes
public function st_ret_dian emite_json_evento (decimal al_nro_fact, string as_clug_fact, string as_tipo_fac, string as_tipo_docu, string as_coddoc, string as_ruta)
public function st_ret_dian emite_json_capita (decimal al_nro_fact, string as_clug_fact, string as_tipo_fac, string as_tipo_docu, string as_coddoc, string as_ruta, string as_capita0)
end prototypes

public function st_ret_dian emite_json_evento (decimal al_nro_fact, string as_clug_fact, string as_tipo_fac, string as_tipo_docu, string as_coddoc, string as_ruta);//as_tipo_docu = f:factura de venta ; a: nota credito de anulacion , c:nota credito , d:nota debito
string 	ls_texto,	ls_nulo
int 		li_rc,					li_ret,					li_res,					li_donde,					li_file
//jsonpackage ripse_json
uo_datastore lds_fact,lds_rips

JSONGenerator ripse_json
integer li_root
integer li_fac,li_usu,li_serv,li_con,li_pro,li_ci,li_fusu,li_fcon

string ls_json
lds_fact=create uo_datastore
lds_rips=create uo_datastore

lds_fact.dataobject='dw_json_transaccion'
lds_fact.settransobject(sqlca)
///FACTURA
if lds_fact.retrieve(al_nro_fact,as_clug_fact,as_tipo_fac)>0 then
	ripse_json  = create JSONGenerator
	li_root = ripse_json.CreateJsonObject()
	
	ripse_json.AddItemString(li_root,"numDocumentoIdObligado",lds_fact.getitemstring(1,'documento'))
	if isnull(lds_fact.getitemstring(1,'prefijo')) or lds_fact.getitemstring(1,'prefijo')='' then
		ripse_json.AddItemString(li_root,"numFactura",string(lds_fact.getitemnumber(1,'nfact')))		
	else
		ripse_json.AddItemString(li_root,"numFactura",lds_fact.getitemstring(1,'prefijo')+string(lds_fact.getitemnumber(1,'nfact')))
	end if
	ripse_json.AddItemNull(li_root,"numNota")
	ripse_json.AddItemNull(li_root,"tipoNota")
	li_usu = ripse_json.AddItemArray(li_root,"usuarios")	
	li_fusu = ripse_json.AddItemObject(li_usu)

	lds_rips.dataobject='dw_json_usuario'
	lds_rips.settransobject(sqlca)
	//USUARIO
	if lds_rips.retrieve(al_nro_fact,as_clug_fact,as_tipo_fac)>0 then
		ripse_json.AddItemString(li_fusu,"tipoDocumentoIdentificacion",lds_rips.getitemstring(1,"tipodoc"))
		ripse_json.AddItemString(li_fusu,"numDocumentoIdentificacion",lds_rips.getitemstring(1,"documento"))
		ripse_json.AddItemString(li_fusu,"tipoUsuario",lds_rips.getitemstring(1,"tipousuario"))
		ripse_json.AddItemString(li_fusu,"fechaNacimiento",string(lds_rips.getitemdatetime(1,"fnacimiento"),'yyyy-mm-dd'))
		ripse_json.AddItemString(li_fusu,"codSexo",lds_rips.getitemstring(1,"sexo"))
		ripse_json.AddItemString(li_fusu,"codPaisResidencia",lds_rips.getitemstring(1,"pais"))
		ripse_json.AddItemString(li_fusu,"codMunicipioResidencia",lds_rips.getitemstring(1,"coddepar") +lds_rips.getitemstring(1,"codciudad"))
		ripse_json.AddItemString(li_fusu,"codZonaTerritorialResidencia",lds_rips.getitemstring(1,"zonar"))
		if isnull(lds_rips.getitemstring(1,"incapacidad")) or lds_rips.getitemstring(1,"incapacidad")='' then
			ripse_json.AddItemString(li_fusu,"incapacidad",'NO')
		else
			ripse_json.AddItemString(li_fusu,"incapacidad",'SI')
		end if
		ripse_json.AddItemNumber(li_fusu,"consecutivo",lds_rips.getitemnumber(1,"orde"))	
		if isnull(lds_rips.getitemstring(1,"paisorg")) or lds_rips.getitemstring(1,"paisorg")='' then
			ripse_json.AddItemString(li_fusu,"codPaisOrigen",lds_rips.getitemstring(1,"pais"))
		else
			ripse_json.AddItemString(li_fusu,"codPaisOrigen",lds_rips.getitemstring(1,"paisorg"))
		end if
		
		li_serv = ripse_json.AddItemObject(li_fusu, "servicios")

		lds_rips.dataobject='dw_json_consulta'
		lds_rips.settransobject(sqlca)
		if lds_rips.retrieve(al_nro_fact,as_clug_fact,as_tipo_fac)>0 then
			li_con= ripse_json.AddItemArray(li_serv,"consultas")
			for li_ci=1 to lds_rips.rowcount()
				li_fcon = ripse_json.AddItemObject(li_con)				
				ripse_json.AddItemString(li_fcon,"codPrestador",lds_rips.getitemstring(li_ci,'c_supersalud'))
				ripse_json.AddItemString(li_fcon,"fechaInicioAtencion",string(lds_rips.getitemdatetime(1,"fecha"),'yyyy-mm-dd hh:mm'))
				if isnull(lds_rips.getitemstring(li_ci,'nautoriza')) or lds_rips.getitemstring(li_ci,'nautoriza')='' then
					ripse_json.AddItemNull(li_fcon,"numAutorizacion")
				else
					ripse_json.AddItemString(li_fcon,"numAutorizacion",lds_rips.getitemstring(li_ci,'nautoriza'))
				end if
				ripse_json.AddItemString(li_fcon,"codConsulta",lds_rips.getitemstring(li_ci,'cod_cups'))
				if isnull(lds_rips.getitemstring(li_ci,'cod_modrel')) then
					ripse_json.AddItemNull(li_fcon,"modalidadGrupoServicioTecSal")
				else
					ripse_json.AddItemString(li_fcon,"modalidadGrupoServicioTecSal",lds_rips.getitemstring(li_ci,'cod_modrel'))
				end if
				ripse_json.AddItemString(li_fcon,"grupoServicios",lds_rips.getitemstring(li_ci,'cod_grpserv'))
				ripse_json.AddItemNumber(li_fcon,"codServicio",double(lds_rips.getitemstring(li_ci,'cod_serv')))
				ripse_json.AddItemString(li_fcon,"finalidadTecnologiaSalud",lds_rips.getitemstring(li_ci,'fin_consulta'))
				ripse_json.AddItemString(li_fcon,"causaMotivoAtencion",lds_rips.getitemstring(li_ci,'causaexterna'))
				ripse_json.AddItemString(li_fcon,"codDiagnosticoPrincipal",lds_rips.getitemstring(li_ci,'cod_rips'))
				
				if isnull(lds_rips.getitemstring(li_ci,'cod_rips_1')) then
					ripse_json.AddItemNull(li_fcon,"codDiagnosticoRelacionado1")
				else
					ripse_json.AddItemString(li_fcon,"codDiagnosticoRelacionado1",lds_rips.getitemstring(li_ci,'cod_rips_1'))
				end if
				
				if isnull(lds_rips.getitemstring(li_ci,'cod_rips_2')) then
					ripse_json.AddItemNull(li_fcon,"codDiagnosticoRelacionado2")
				else
					ripse_json.AddItemString(li_fcon,"codDiagnosticoRelacionado2",lds_rips.getitemstring(li_ci,'cod_rips_2'))
				end if
				
				if isnull(lds_rips.getitemstring(li_ci,'cod_rips_3') ) then
					ripse_json.AddItemNull(li_fcon,"codDiagnosticoRelacionado3")
				else
					ripse_json.AddItemString(li_fcon,"codDiagnosticoRelacionado3",lds_rips.getitemstring(li_ci,'cod_rips_3'))
				end if
				
				ripse_json.AddItemString(li_fcon,"tipoDiagnosticoPrincipal",lds_rips.getitemstring(li_ci,'tipodiagprin'))
				ripse_json.AddItemString(li_fcon,"tipoDocumentoIdentificacion",lds_rips.getitemstring(li_ci,'tdoc'))
				ripse_json.AddItemString(li_fcon,"numDocumentoIdentificacion",lds_rips.getitemstring(li_ci,'documento'))
				ripse_json.AddItemNumber(li_fcon,"vrServicio",lds_rips.getitemnumber(li_ci,'vproced'))
				ripse_json.AddItemString(li_fcon,"conceptoRecaudo",lds_rips.getitemstring(li_ci,'vtmd'))
				ripse_json.AddItemNumber(li_fcon,"valorPagoModerador",lds_rips.getitemnumber(li_ci,'vpm'))
				if isnull(lds_rips.getitemstring(li_ci,'pref_rc')) or lds_rips.getitemstring(li_ci,'pref_rc')='' then
					if lds_rips.getitemnumber(li_ci,'nrcaj')<>0 or  not isnull(lds_rips.getitemnumber(li_ci,'nrcaj')) then
						ripse_json.AddItemString(li_fcon,"numFEVPagoModerador",string(lds_rips.getitemnumber(li_ci,'nrcaj')))	
					else
						ripse_json.AddItemNull(li_fcon,"numFEVPagoModerador")
					end if
				else
					if lds_rips.getitemnumber(li_ci,'nrcaj')<>0 or not isnull(lds_rips.getitemnumber(li_ci,'nrcaj')) then 
						ripse_json.AddItemString(li_fcon,"numFEVPagoModerador",lds_rips.getitemstring(li_ci,'pref_rc')+string(lds_rips.getitemnumber(li_ci,'nrcaj')))	
					else
						ripse_json.AddItemNull(li_fcon,"numFEVPagoModerador")
					end if
				
				end if		
				ripse_json.AddItemnumber(li_fcon,"consecutivo",lds_rips.getitemnumber(li_ci,'orde'))		
			next
		end if
		

		lds_rips.dataobject='dw_json_procedimiento'
		lds_rips.settransobject(sqlca)
		if lds_rips.retrieve(al_nro_fact,as_clug_fact,as_tipo_fac)>0 then
			li_con= ripse_json.AddItemArray(li_serv,"procedimientos")
			for li_ci=1 to lds_rips.rowcount()
				li_fcon = ripse_json.AddItemObject(li_con)
				ripse_json.AddItemString(li_fcon,"codPrestador",lds_rips.getitemstring(li_ci,'c_supersalud'))
				ripse_json.AddItemString(li_fcon,"fechaInicioAtencion",string(lds_rips.getitemdatetime(li_ci,"fecha"),'yyyy-mm-dd hh:mm'))
				if isnull(lds_rips.getitemstring(li_ci,'idmipres')) or lds_rips.getitemstring(li_ci,'idmipres')='' then
					ripse_json.AddItemNull(li_fcon,"idMIPRES")
				else
					ripse_json.AddItemString(li_fcon,"idMIPRES",lds_rips.getitemstring(li_ci,'idmipres'))
				end if
				if isnull(lds_rips.getitemstring(li_ci,'nautoriza')) then
					ripse_json.AddItemNull(li_fcon,"numAutorizacion")
				else		
					ripse_json.AddItemString(li_fcon,"numAutorizacion",lds_rips.getitemstring(li_ci,'nautoriza'))
				end if
				ripse_json.AddItemString(li_fcon,"codProcedimiento",lds_rips.getitemstring(li_ci,'cod_cups'))
				ripse_json.AddItemString(li_fcon,"viaIngresoServicioSalud",lds_rips.getitemstring(li_ci,'viaing'))
				if isnull(lds_rips.getitemstring(li_ci,'cod_modrel')) then
					ripse_json.AddItemNull(li_fcon,"modalidadGrupoServicioTecSal")
				else
					ripse_json.AddItemString(li_fcon,"modalidadGrupoServicioTecSal",lds_rips.getitemstring(li_ci,'cod_modrel'))
				end if
				ripse_json.AddItemString(li_fcon,"grupoServicios",lds_rips.getitemstring(li_ci,'cod_grpserv'))
				ripse_json.AddItemNumber(li_fcon,"codServicio",double(lds_rips.getitemstring(li_ci,'cod_serv')))
				ripse_json.AddItemString(li_fcon,"finalidadTecnologiaSalud",lds_rips.getitemstring(li_ci,'finalidadproced'))
				ripse_json.AddItemString(li_fcon,"tipoDocumentoIdentificacion",lds_rips.getitemstring(li_ci,'tdoc'))
				ripse_json.AddItemString(li_fcon,"numDocumentoIdentificacion",lds_rips.getitemstring(li_ci,'documento'))
				if isnull(lds_rips.getitemstring(li_ci,'cod_rips')) then
					ripse_json.AddItemNull(li_fcon,"codDiagnosticoPrincipal")
				else
					ripse_json.AddItemString(li_fcon,"codDiagnosticoPrincipal",lds_rips.getitemstring(li_ci,'cod_rips'))
				end if
				if isnull(lds_rips.getitemstring(li_ci,'cod_rips_1')	) then 
					ripse_json.AddItemNull(li_fcon,"codDiagnosticoRelacionado")
				else
					ripse_json.AddItemString(li_fcon,"codDiagnosticoRelacionado",lds_rips.getitemstring(li_ci,'cod_rips_1'))
				end if
				if isnull(lds_rips.getitemstring(li_ci,'cod_rips_2')) then
					ripse_json.AddItemNull(li_fcon,"codComplicacion")
				else
					ripse_json.AddItemString(li_fcon,"codComplicacion",lds_rips.getitemstring(li_ci,'cod_rips_2'))
				end if
				ripse_json.AddItemNumber(li_fcon,"vrServicio",lds_rips.getitemnumber(li_ci,'vproced'))
				ripse_json.AddItemString(li_fcon,"conceptoRecaudo",lds_rips.getitemstring(li_ci,'vtmd'))
				ripse_json.AddItemNumber(li_fcon,"valorPagoModerador",lds_rips.getitemnumber(li_ci,'vpm'))
				if isnull(lds_rips.getitemstring(li_ci,'pref_rc')) or lds_rips.getitemstring(li_ci,'pref_rc')='' then
					if lds_rips.getitemnumber(li_ci,'nrcaj')<>0 or  not isnull(lds_rips.getitemnumber(li_ci,'nrcaj')) then
						ripse_json.AddItemString(li_fcon,"numFEVPagoModerador",string(lds_rips.getitemnumber(li_ci,'nrcaj')))	
					else
						ripse_json.AddItemNull(li_fcon,"numFEVPagoModerador")
					end if
				else
					if lds_rips.getitemnumber(li_ci,'nrcaj')<>0 or not isnull(lds_rips.getitemnumber(li_ci,'nrcaj')) then 
						ripse_json.AddItemString(li_fcon,"numFEVPagoModerador",lds_rips.getitemstring(li_ci,'pref_rc')+string(lds_rips.getitemnumber(li_ci,'nrcaj')))	
					else
						ripse_json.AddItemNull(li_fcon,"numFEVPagoModerador")
					end if
				
				end if		
				ripse_json.AddItemNumber(li_fcon,"consecutivo",lds_rips.getitemnumber(li_ci,'orde'))
			next
		end if	
		

		lds_rips.dataobject='dw_json_urgencia'
		lds_rips.settransobject(sqlca)
		li_ci=1
		if lds_rips.retrieve(al_nro_fact,as_clug_fact,as_tipo_fac)>0 then
			li_con= ripse_json.AddItemArray(li_serv,"urgencias")
			for li_ci=1 to lds_rips.rowcount()
				li_fcon = ripse_json.AddItemObject(li_con)
				ripse_json.AddItemString(li_fcon,"codPrestador",lds_rips.getitemstring(li_ci,'c_supersalud'))
				ripse_json.AddItemString(li_fcon,"fechaInicioAtencion",string(datetime(date(lds_rips.getitemdatetime(li_ci,'fechaingreso')),time(lds_rips.getitemdatetime(li_ci,'horaingreso'))),'yyyy-mm-dd hh:mm'))
				ripse_json.AddItemString(li_fcon,"causaMotivoAtencion",lds_rips.getitemstring(li_ci,'causaexterna'))
				ripse_json.AddItemString(li_fcon,"codDiagnosticoPrincipal",lds_rips.getitemstring(li_ci,'cod_rips'))
				ripse_json.AddItemString(li_fcon,"codDiagnosticoPrincipaIE",lds_rips.getitemstring(li_ci,'cod_rips_1'))
				if isnull(lds_rips.getitemstring(li_ci,'cod_rips_2')) then
					ripse_json.AddItemNull(li_fcon,"codDiagnosticoRelacionadoE1")
				else
					ripse_json.AddItemString(li_fcon,"codDiagnosticoRelacionadoE1",lds_rips.getitemstring(li_ci,'cod_rips_2'))
				end if
				if isnull(lds_rips.getitemstring(li_ci,'cod_rips_3')) then
					ripse_json.AddItemNull(li_fcon,"codDiagnosticoRelacionadoE2")
				else
					ripse_json.AddItemString(li_fcon,"codDiagnosticoRelacionadoE2",lds_rips.getitemstring(li_ci,'cod_rips_3'))
				end if
				if isnull(lds_rips.getitemstring(li_ci,'cod_rips_4')) then
					ripse_json.AddItemNull(li_fcon,"codDiagnosticoRelacionadoE3")
				else
					ripse_json.AddItemString(li_fcon,"codDiagnosticoRelacionadoE3",lds_rips.getitemstring(li_ci,'cod_rips_4'))
				end if
				
				ripse_json.AddItemString(li_fcon,"condicionDestinoUsuarioEgreso",lds_rips.getitemstring(li_ci,'conductaurg'))
				
				if isnull(lds_rips.getitemstring(li_ci,'cod_rips_5')) then
					ripse_json.AddItemNull(li_fcon,"codDiagnosticoCausaMuerte")
				else
					ripse_json.AddItemString(li_fcon,"codDiagnosticoCausaMuerte",lds_rips.getitemstring(li_ci,'cod_rips_5'))
				end if
				ripse_json.AddItemString(li_fcon,"fechaEgreso",string(datetime(date(lds_rips.getitemdatetime(li_ci,'fechaegreso')),time(lds_rips.getitemdatetime(li_ci,'horaegreso'))),'yyyy-mm-dd hh:mm'))
				ripse_json.AddItemNumber(li_fcon,"consecutivo",lds_rips.getitemnumber(li_ci,'orde'))
			next
		end if	
		

		lds_rips.dataobject='dw_json_hospitaliza'
		lds_rips.settransobject(sqlca)
		li_ci=1
		if lds_rips.retrieve(al_nro_fact,as_clug_fact,as_tipo_fac)>0 then
			li_con= ripse_json.AddItemArray(li_serv,"hospitalizacion")			
			for li_ci=1 to lds_rips.rowcount()
				li_fcon = ripse_json.AddItemObject(li_con)
				ripse_json.AddItemString(li_fcon,"codPrestador",lds_rips.getitemstring(li_ci,'c_supersalud'))
				ripse_json.AddItemString(li_fcon,"fechalnicioAtencion",string(datetime(date(lds_rips.getitemdatetime(li_ci,'fechaingreso')),time(lds_rips.getitemdatetime(li_ci,'horaingreso'))),'yyyy-mm-dd hh:mm'))
				ripse_json.AddItemString(li_fcon,"causaMotivoAtencion",lds_rips.getitemstring(li_ci,'causaexterna'))
				ripse_json.AddItemString(li_fcon,"codDiagnosticoPrincipal",lds_rips.getitemstring(li_ci,'cod_rips'))
				ripse_json.AddItemString(li_fcon,"codDiagnosticoPrincipaIE",lds_rips.getitemstring(li_ci,'cod_rips_1'))
				if isnull(lds_rips.getitemstring(li_ci,'cod_rips_2')) then
					ripse_json.AddItemNull(li_fcon,"codDiagnosticoRelacionadoE1")
				else
					ripse_json.AddItemString(li_fcon,"codDiagnosticoRelacionadoE1",lds_rips.getitemstring(li_ci,'cod_rips_2'))
				end if
				if isnull(lds_rips.getitemstring(li_ci,'cod_rips_3')) then
					ripse_json.AddItemNull(li_fcon,"codDiagnosticoRelacionadoE2")
				else
					ripse_json.AddItemString(li_fcon,"codDiagnosticoRelacionadoE2",lds_rips.getitemstring(li_ci,'cod_rips_3'))
				end if
				if isnull(lds_rips.getitemstring(li_ci,'cod_rips_4')) then
					ripse_json.AddItemNull(li_fcon,"codDiagnosticoRelacionadoE3")
				else
					ripse_json.AddItemString(li_fcon,"codDiagnosticoRelacionadoE3",lds_rips.getitemstring(li_ci,'cod_rips_4'))
				end if
				if isnull(lds_rips.getitemstring(li_ci,'cod_rips_6')) then
					ripse_json.AddItemNull(li_fcon,"codComplicacion")
				else
					ripse_json.AddItemString(li_fcon,"codComplicacion",lds_rips.getitemstring(li_ci,'cod_rips_6'))
				end if
				
				ripse_json.AddItemString(li_fcon,"condicionDestinoUsuarioEgreso",lds_rips.getitemstring(li_ci,'conductaurg'))
				
				if isnull(lds_rips.getitemstring(li_ci,'cod_rips_5')) then
					ripse_json.AddItemNull(li_fcon,"codDiagnosticoCausaMuerte")
				else
					ripse_json.AddItemString(li_fcon,"codDiagnosticoCausaMuerte",lds_rips.getitemstring(li_ci,'cod_rips_5'))
				end if
				ripse_json.AddItemString(li_fcon,"fechaEgreso",string(datetime(date(lds_rips.getitemdatetime(li_ci,'fechaegreso')),time(lds_rips.getitemdatetime(li_ci,'horaegreso'))),'yyyy-mm-dd hh:mm'))
				ripse_json.AddItemNumber(li_fcon,"consecutivo",lds_rips.getitemnumber(li_ci,'orde'))
			next
		end if		
				

		lds_rips.dataobject='dw_json_recienn'
		lds_rips.settransobject(sqlca)
		li_ci=1
		if lds_rips.retrieve(al_nro_fact,as_clug_fact,as_tipo_fac)>0 then
			li_con= ripse_json.AddItemArray(li_serv,"recienNacidos")			
			for li_ci=1 to lds_rips.rowcount()
				li_fcon = ripse_json.AddItemObject(li_con)
				ripse_json.AddItemString(li_fcon,"codPrestado",lds_rips.getitemstring(li_ci,'c_supersalud'))
				ripse_json.AddItemString(li_fcon,"tipoDocumentoIdentificacion",lds_rips.getitemstring(li_ci,'td'))
				ripse_json.AddItemString(li_fcon,"numDocumentoIdentificacion",lds_rips.getitemstring(li_ci,'documento'))
				ripse_json.AddItemString(li_fcon,"fechaNacimiento",string(lds_rips.getitemdatetime(li_ci,'fechareg'),'yyyy-mm-dd hh:mm'))
				ripse_json.AddItemNumber(li_fcon,"edadGestacional",lds_rips.getitemnumber(li_ci,'edad_gest'))
				ripse_json.AddItemNumber(li_fcon,"numConsultasCPrenatal",lds_rips.getitemnumber(li_ci,'nccp'))
				ripse_json.AddItemString(li_fcon,"codSexoBiologico",lds_rips.getitemstring(li_ci,'sexorn'))	
				ripse_json.AddItemNumber(li_fcon,"peso",lds_rips.getitemnumber(li_ci,'pesorn'))
				ripse_json.AddItemString(li_fcon,"codDiagnosticoPrincipal",lds_rips.getitemstring(li_ci,'cod_rips'))	
				ripse_json.AddItemString(li_fcon,"condicionDestino",lds_rips.getitemstring(li_ci,'estado'))	
				ripse_json.AddItemString(li_fcon,"codDiagnosticoCausaMuerte",lds_rips.getitemstring(li_ci,'cod_rips_1'))	
				if lds_rips.getitemstring(li_ci,'estado')='1' then
					ripse_json.AddItemString(li_fcon,"fecha Egreso",string(lds_rips.getitemdatetime(li_ci,'fechareg'),'yyyy-mm-dd hh:mm'))
				else
					ripse_json.AddItemString(li_fcon,"fecha Egreso",string(lds_rips.getitemdatetime(li_ci,'fechamuertern'),'yyyy-mm-dd hh:mm'))
				end if		
				ripse_json.AddItemNumber(li_fcon,"consecutivo",lds_rips.getitemnumber(li_ci,'orde'))
			next
		end if
		

		lds_rips.dataobject='dw_json_medica'
		lds_rips.settransobject(sqlca)
		if lds_rips.retrieve(al_nro_fact,as_clug_fact,as_tipo_fac)>0 then
			li_con= ripse_json.AddItemArray(li_serv,"medicamentos")			
			for li_ci=1 to lds_rips.rowcount()
				li_fcon = ripse_json.AddItemObject(li_con)
				ripse_json.AddItemString(li_fcon,"codPrestador",lds_rips.getitemstring(li_ci,'c_supersalud'))
				ripse_json.AddItemString(li_fcon,"numAutorizacion",lds_rips.getitemstring(li_ci,'autorizacion'))
				if isnull(lds_rips.getitemstring(li_ci,'idmipres')) or lds_rips.getitemstring(li_ci,'idmipres')='' then
					ripse_json.AddItemNull(li_fcon,"idMIPRES")
				else
					ripse_json.AddItemString(li_fcon,"idMIPRES",lds_rips.getitemstring(li_ci,'idmipres'))
				end if				
				ripse_json.AddItemString(li_fcon,"fechaDispensAdmon",string(lds_rips.getitemdatetime(li_ci,'fecha'),'yyyy-mm-dd HH:mm'))
				ripse_json.AddItemString(li_fcon,"codDiagnosticoPrincipal",lds_rips.getitemstring(li_ci,'dx1'))
				ripse_json.AddItemString(li_fcon,"codDiagnosticoRelacionado",lds_rips.getitemstring(li_ci,'dxr1'))
				ripse_json.AddItemString(li_fcon,"tipoMedicamento",lds_rips.getitemstring(li_ci,'cod_tmedica'))
				
				if isnull(lds_rips.getitemstring(li_ci,'ium')) or lds_rips.getitemstring(li_ci,'ium')='' then
					ripse_json.AddItemString(li_fcon,"codTecnologiaSalud",lds_rips.getitemstring(li_ci,'cum'))
				else
					ripse_json.AddItemString(li_fcon,"codTecnologiaSalud",lds_rips.getitemstring(li_ci,'ium'))			
				end if
				
				if lds_rips.getitemstring(li_ci,'cod_tmedica')='03' then
					ripse_json.AddItemString(li_fcon,"nomTecnologiaSalud",lds_rips.getitemstring(li_ci,'medicamento'))
				else
					ripse_json.AddItemNull(li_fcon,"nomTecnologiaSalud")
				end if
				
				if lds_rips.getitemstring(li_ci,'cod_tmedica')='03' then
					ripse_json.AddItemString(li_fcon,"concentracionMedicamento",lds_rips.getitemstring(li_ci,'concentracio'))
				else
					ripse_json.AddItemnumber(li_fcon,"concentracionMedicamento",0)
				end if
				
				if lds_rips.getitemstring(li_ci,'cod_tmedica')='03' then
					ripse_json.AddItemString(li_fcon,"unidadMedida",lds_rips.getitemstring(li_ci,'codigo_uni'))
				else
					ripse_json.AddItemnumber(li_fcon,"unidadMedida",0)
				end if
				
				if lds_rips.getitemstring(li_ci,'cod_tmedica')='03' then
					ripse_json.AddItemString(li_fcon,"formaFarmaceutica",lds_rips.getitemstring(li_ci,'formafarm'))
				else
					ripse_json.AddItemNull(li_fcon,"formaFarmaceutica")
				end if
				
				ripse_json.AddItemnumber(li_fcon,"unidadMinDispensa",integer(lds_rips.getitemstring(li_ci,'umm')))
				
				ripse_json.AddItemnumber(li_fcon,"cantidadMedicamento",lds_rips.getitemnumber(li_ci,'cantidad'))
				ripse_json.AddItemnumber(li_fcon,"diasTratamiento",1)
				ripse_json.AddItemString(li_fcon,"tipoDocumentoIdentificacion",lds_rips.getitemstring(li_ci,'tipodoc'))
				ripse_json.AddItemString(li_fcon,"numDocumentoIdentificacion",lds_rips.getitemstring(li_ci,'documento'))
				ripse_json.AddItemnumber(li_fcon,"vrUnitMedicamento",lds_rips.getitemnumber(li_ci,'vuni'))
				ripse_json.AddItemnumber(li_fcon,"vrServicio",lds_rips.getitemnumber(li_ci,'vproced'))
				ripse_json.AddItemstring(li_fcon,"conceptoRecaudo",lds_rips.getitemstring(li_ci,'vtmd'))
				ripse_json.AddItemnumber(li_fcon,"valorPagoModerador",lds_rips.getitemnumber(li_ci,'vpm'))
				if isnull(lds_rips.getitemstring(li_ci,'pref_rc')) or lds_rips.getitemstring(li_ci,'pref_rc')='' then
					if lds_rips.getitemnumber(li_ci,'nrcaj')<>0 or  not isnull(lds_rips.getitemnumber(li_ci,'nrcaj')) then
						ripse_json.AddItemString(li_fcon,"numFEVPagoModerador",string(lds_rips.getitemnumber(li_ci,'nrcaj')))	
					else
						ripse_json.AddItemNull(li_fcon,"numFEVPagoModerador")
					end if
				else
					if lds_rips.getitemnumber(li_ci,'nrcaj')<>0 or not isnull(lds_rips.getitemnumber(li_ci,'nrcaj')) then 
						ripse_json.AddItemString(li_fcon,"numFEVPagoModerador",lds_rips.getitemstring(li_ci,'pref_rc')+string(lds_rips.getitemnumber(li_ci,'nrcaj')))	
					else
						ripse_json.AddItemNull(li_fcon,"numFEVPagoModerador")
					end if
				
				end if			
				ripse_json.AddItemNumber(li_fcon,"consecutivo",lds_rips.getitemnumber(li_ci,'orde'))
			next
		end if			
		

		lds_rips.dataobject='dw_json_otros'
		lds_rips.settransobject(sqlca)
		if lds_rips.retrieve(al_nro_fact,as_clug_fact,as_tipo_fac)>0 then
			li_con= ripse_json.AddItemArray(li_serv,"otrosServicios")			
			for li_ci=1 to lds_rips.rowcount()
				li_fcon = ripse_json.AddItemObject(li_con)
				ripse_json.AddItemString(li_fcon,"codPrestador",lds_rips.getitemstring(li_ci,'c_supersalud'))
				ripse_json.AddItemString(li_fcon,"numAutorizacion",lds_rips.getitemstring(li_ci,'autorizacion'))
				if isnull(lds_rips.getitemstring(li_ci,'idmipres')) or lds_rips.getitemstring(li_ci,'idmipres')='' then
					ripse_json.AddItemNull(li_fcon,"idMIPRES")
				else
					ripse_json.AddItemString(li_fcon,"idMIPRES",lds_rips.getitemstring(li_ci,'idmipres'))
				end if
				ripse_json.AddItemString(li_fcon,"fechaSuministroTecnologia",string(lds_rips.getitemdatetime(li_ci,'fecha'),'yyyy-mm-dd HH:mm'))
				ripse_json.AddItemString(li_fcon,"tipoOS",lds_rips.getitemstring(li_ci,'tipoos'))
				if (isnull(lds_rips.getitemstring(li_ci,'ium')) or lds_rips.getitemstring(li_ci,'ium')='') and (isnull(lds_rips.getitemstring(li_ci,'cum')) or lds_rips.getitemstring(li_ci,'cum')='') then
					ripse_json.AddItemString(li_fcon,"codTecnologiaSalud",lds_rips.getitemstring(li_ci,'c_medica'))
//					ripse_json.AddItemNull(li_fcon,"codTecnologiaSalud")
				else
					if isnull(lds_rips.getitemstring(li_ci,'ium')) or lds_rips.getitemstring(li_ci,'ium')=''  then
						ripse_json.AddItemString(li_fcon,"codTecnologiaSalud",lds_rips.getitemstring(li_ci,'cum'))
					else
						ripse_json.AddItemString(li_fcon,"codTecnologiaSalud",lds_rips.getitemstring(li_ci,'ium'))			
					end if
				end if
				
				if lds_rips.getitemstring(li_ci,'tipoos')='01' then
					ripse_json.AddItemString(li_fcon,"nomTecnologiaSalud",lds_rips.getitemstring(li_ci,'medicamento'))
				else
					ripse_json.AddItemNull(li_fcon,"nomTecnologiaSalud")
				end if
				
				ripse_json.AddItemNumber(li_fcon,"cantidadOS",lds_rips.getitemnumber(li_ci,'cantidad'))
				ripse_json.AddItemString(li_fcon,"tipoDocumentoIdentificacion",lds_rips.getitemstring(li_ci,'tdoc'))
				ripse_json.AddItemString(li_fcon,"numDocumentoIdentificacion",lds_rips.getitemstring(li_ci,'documento'))
				ripse_json.AddItemNumber(li_fcon,"vrUnitOS",lds_rips.getitemnumber(li_ci,'vuni'))
				ripse_json.AddItemNumber(li_fcon,"vrServicio",lds_rips.getitemnumber(li_ci,'vproced'))
				ripse_json.AddItemString(li_fcon,"conceptoRecaudo",lds_rips.getitemstring(li_ci,'vtmd'))
				ripse_json.AddItemNumber(li_fcon,"valorPagoModerador",lds_rips.getitemnumber(li_ci,'vpm'))
				if isnull(lds_rips.getitemstring(li_ci,'pref_rc')) or lds_rips.getitemstring(li_ci,'pref_rc')='' then
					if lds_rips.getitemnumber(li_ci,'nrcaj')<>0 or  not isnull(lds_rips.getitemnumber(li_ci,'nrcaj')) then
						ripse_json.AddItemString(li_fcon,"numFEVPagoModerador",string(lds_rips.getitemnumber(li_ci,'nrcaj')))	
					else
						ripse_json.AddItemNull(li_fcon,"numFEVPagoModerador")
					end if
				else
					if lds_rips.getitemnumber(li_ci,'nrcaj')<>0 or not isnull(lds_rips.getitemnumber(li_ci,'nrcaj')) then 
						ripse_json.AddItemString(li_fcon,"numFEVPagoModerador",lds_rips.getitemstring(li_ci,'pref_rc')+string(lds_rips.getitemnumber(li_ci,'nrcaj')))	
					else
						ripse_json.AddItemNull(li_fcon,"numFEVPagoModerador")
					end if
				
				end if		
				ripse_json.AddItemNumber(li_fcon,"consecutivo",lds_rips.getitemnumber(li_ci,'orde'))
			next
		end if				
	end if // USUARIO
end if	 ///FIN FACTURA

ripse_json.SaveToFile(as_ruta)
st_ret_dian lst_ret_dian
destroy ripse_json
destroy lds_fact

return lst_ret_dian
end function

public function st_ret_dian emite_json_capita (decimal al_nro_fact, string as_clug_fact, string as_tipo_fac, string as_tipo_docu, string as_coddoc, string as_ruta, string as_capita0);//as_tipo_docu = f:factura de venta ; a: nota credito de anulacion , c:nota credito , d:nota debito
string 	ls_texto,	ls_nulo
uo_datastore lds_fact,lds_usu,lds_ripsc,lds_ripsp,lds_ripsu
uo_datastore lds_ripsh,lds_ripsrc,lds_ripsme,lds_ripsot
JSONGenerator ripse_json
integer li_root
double ldb_cu,ldb_usu,ldb_serv,ldb_cin,ldb_ci,ldb_fusu,ldb_fcon
string ls_json,ls_ltd,ls_jdoc,ls_jtf,ls_jlf


lds_fact=create uo_datastore
lds_usu=create uo_datastore
lds_ripsc=create uo_datastore
lds_ripsp=create uo_datastore
lds_ripsu=create uo_datastore
lds_ripsh=create uo_datastore
lds_ripsrc=create uo_datastore
lds_ripsme=create uo_datastore
lds_ripsot=create uo_datastore

lds_fact.dataobject='dw_json_transaccion_cap'
lds_fact.settransobject(sqlca)
///FACTURA
if lds_fact.retrieve(al_nro_fact,as_clug_fact,as_tipo_fac)>0 then
	ripse_json  = create JSONGenerator
	li_root = ripse_json.CreateJsonObject()
	
	ripse_json.AddItemString(li_root,"numDocumentoIdObligado",lds_fact.getitemstring(1,'documento'))
	if isnull(lds_fact.getitemstring(1,'prefijo')) or lds_fact.getitemstring(1,'prefijo')='' then
		ripse_json.AddItemString(li_root,"numFactura",string(lds_fact.getitemnumber(1,'nfact')))		
	else
		ripse_json.AddItemString(li_root,"numFactura",lds_fact.getitemstring(1,'prefijo')+string(lds_fact.getitemnumber(1,'nfact')))
	end if
	ripse_json.AddItemNull(li_root,"numNota")
	ripse_json.AddItemNull(li_root,"tipoNota")
	ldb_usu = ripse_json.AddItemArray(li_root,"usuarios")	
	lds_usu.dataobject='dw_json_usuario_cap'
	lds_usu.settransobject(sqlca)
	//USUARIO
	if lds_usu.retrieve(al_nro_fact,as_clug_fact,as_tipo_fac)>0 then
		
		///retrieves
		lds_ripsc.dataobject='dw_json_consulta_cap'
		lds_ripsc.settransobject(sqlca)
		lds_ripsc.retrieve(al_nro_fact,as_clug_fact,as_tipo_fac)
		
		lds_ripsp.dataobject='dw_json_procedimiento_cap'
		lds_ripsp.settransobject(sqlca)
		lds_ripsp.retrieve(al_nro_fact,as_clug_fact,as_tipo_fac)
		
		lds_ripsu.dataobject='dw_json_urgencia_cap'
		lds_ripsu.settransobject(sqlca)
		lds_ripsu.retrieve(al_nro_fact,as_clug_fact,as_tipo_fac)
		
		lds_ripsh.dataobject='dw_json_hospitaliza_cap'
		lds_ripsh.settransobject(sqlca)
		lds_ripsh.retrieve(al_nro_fact,as_clug_fact,as_tipo_fac)
		
		lds_ripsrc.dataobject='dw_json_recienn_cap'
		lds_ripsrc.settransobject(sqlca)
		lds_ripsrc.retrieve(al_nro_fact,as_clug_fact,as_tipo_fac)
		
		lds_ripsme.dataobject='dw_json_medica_cap'
		lds_ripsme.settransobject(sqlca)
		lds_ripsme.retrieve(al_nro_fact,as_clug_fact,as_tipo_fac)
		
		lds_ripsot.dataobject='dw_json_otros_cap'
		lds_ripsot.settransobject(sqlca)
		lds_ripsot.retrieve(al_nro_fact,as_clug_fact,as_tipo_fac)
		
		///CICLO USUARIO
		for ldb_cu=1 to lds_usu.rowcount()
		
			ldb_ci = ripse_json.AddItemObject(ldb_usu)	
			/////SACA DATOS PARA FILTRO
			ls_ltd=lds_usu.getitemstring(ldb_cu,"tipodoc")
			ls_jdoc=lds_usu.getitemstring(ldb_cu,"documento")
			ripse_json.AddItemString(ldb_ci,"tipoDocumentoIdentificacion",ls_ltd)
			ripse_json.AddItemString(ldb_ci,"numDocumentoIdentificacion",ls_jdoc)
			ripse_json.AddItemString(ldb_ci,"tipoUsuario",lds_usu.getitemstring(ldb_cu,"tipousuario"))
			ripse_json.AddItemString(ldb_ci,"fechaNacimiento",string(lds_usu.getitemdatetime(ldb_cu,"fnacimiento"),'yyyy-mm-dd'))
			ripse_json.AddItemString(ldb_ci,"codSexo",lds_usu.getitemstring(ldb_cu,"sexo"))
			ripse_json.AddItemString(ldb_ci,"codPaisResidencia",lds_usu.getitemstring(ldb_cu,"pais"))
			ripse_json.AddItemString(ldb_ci,"codMunicipioResidencia",lds_usu.getitemstring(ldb_cu,"coddepar") +lds_usu.getitemstring(ldb_cu,"codciudad"))
			ripse_json.AddItemString(ldb_ci,"codZonaTerritorialResidencia",lds_usu.getitemstring(ldb_cu,"zonar"))
			if isnull(lds_usu.getitemstring(ldb_cu,"incapacidad")) or lds_usu.getitemstring(ldb_cu,"incapacidad")='' then
				ripse_json.AddItemString(ldb_ci,"incapacidad",'NO')
			else
				ripse_json.AddItemString(ldb_ci,"incapacidad",'SI')
			end if
			
			ripse_json.AddItemNumber(ldb_ci,"consecutivo",lds_usu.getitemnumber(ldb_cu,"orde"))	
			
			if isnull(lds_usu.getitemstring(1,"paisorg")) or lds_usu.getitemstring(1,"paisorg")='' then
				ripse_json.AddItemString(ldb_ci,"codPaisOrigen",lds_usu.getitemstring(ldb_cu,"pais"))
			else
				ripse_json.AddItemString(ldb_ci,"codPaisOrigen",lds_usu.getitemstring(ldb_cu,"paisorg"))
			end if
			
			ldb_serv = ripse_json.AddItemObject(ldb_ci, "servicios")
		
			///CONSULTA
			lds_ripsc.setfilter("tdpac='"+ls_ltd+"' and  docpac='"+ls_jdoc+"'")
			lds_ripsc.filter()
			if lds_ripsc.rowcount()>0 then
				ldb_cin= ripse_json.AddItemArray(ldb_serv,"consultas")	
				for ldb_ci=1 to lds_ripsc.rowcount()
					ldb_fcon = ripse_json.AddItemObject(ldb_cin)		
					ripse_json.AddItemString(ldb_fcon,"codPrestador",lds_ripsc.getitemstring(ldb_ci,'c_supersalud'))
					ripse_json.AddItemString(ldb_fcon,"fechaInicioAtencion",string(lds_ripsc.getitemdatetime(ldb_ci,"fecha"),'yyyy-mm-dd hh:mm'))
					if isnull(lds_ripsc.getitemstring(ldb_ci,'nautoriza')) or lds_ripsc.getitemstring(ldb_ci,'nautoriza')='' then
						ripse_json.AddItemNull(ldb_fcon,"numAutorizacion")
					else
						ripse_json.AddItemString(ldb_fcon,"numAutorizacion",lds_ripsc.getitemstring(ldb_ci,'nautoriza'))
					end if
					ripse_json.AddItemString(ldb_fcon,"codConsulta",lds_ripsc.getitemstring(ldb_ci,'cod_cups'))
					
					
					if isnull(lds_ripsc.getitemstring(ldb_ci,'cod_modrel')) then
						ripse_json.AddItemNull(ldb_fcon,"modalidadGrupoServicioTecSal")
					else
						ripse_json.AddItemString(ldb_fcon,"modalidadGrupoServicioTecSal",lds_ripsc.getitemstring(ldb_ci,'cod_modrel'))
					end if
	
					ripse_json.AddItemString(ldb_fcon,"grupoServicios",lds_ripsc.getitemstring(ldb_ci,'cod_grpserv'))
					ripse_json.AddItemNumber(ldb_fcon,"codServicio",double(lds_ripsc.getitemstring(ldb_ci,'cod_serv')))
					ripse_json.AddItemString(ldb_fcon,"finalidadTecnologiaSalud",lds_ripsc.getitemstring(ldb_ci,'fin_consulta'))
					ripse_json.AddItemString(ldb_fcon,"causaMotivoAtencion",lds_ripsc.getitemstring(ldb_ci,'causaexterna'))
					ripse_json.AddItemString(ldb_fcon,"codDiagnosticoPrincipal",lds_ripsc.getitemstring(ldb_ci,'dxppal'))
					if isnull(lds_ripsc.getitemstring(ldb_ci,'dxr1')) then
						ripse_json.AddItemNull(ldb_fcon,"codDiagnosticoRelacionado1")
					else
						ripse_json.AddItemString(ldb_fcon,"codDiagnosticoRelacionado1",lds_ripsc.getitemstring(ldb_ci,'dxr1'))
					end if
					
					if isnull(lds_ripsc.getitemstring(ldb_ci,'dxr2')) then
						ripse_json.AddItemNull(ldb_fcon,"codDiagnosticoRelacionado2")
					else
						ripse_json.AddItemString(ldb_fcon,"codDiagnosticoRelacionado2",lds_ripsc.getitemstring(ldb_ci,'dxr2'))
					end if
					
					if isnull(lds_ripsc.getitemstring(ldb_ci,'dxr3') ) then
						ripse_json.AddItemNull(ldb_fcon,"codDiagnosticoRelacionado3")
					else
						ripse_json.AddItemString(ldb_fcon,"codDiagnosticoRelacionado3",lds_ripsc.getitemstring(ldb_ci,'dxr3'))
					end if
					
					ripse_json.AddItemString(ldb_fcon,"tipoDiagnosticoPrincipal",lds_ripsc.getitemstring(ldb_ci,'tipodiagprin'))
					ripse_json.AddItemString(ldb_fcon,"tipoDocumentoIdentificacion",lds_ripsc.getitemstring(ldb_ci,'tdoc'))
					ripse_json.AddItemString(ldb_fcon,"numDocumentoIdentificacion",lds_ripsc.getitemstring(ldb_ci,'documento'))
					if as_capita0='1' then
						ripse_json.AddItemnumber(ldb_fcon,"vrServicio",lds_ripsc.getitemnumber(ldb_ci,'vproced'))
						ripse_json.AddItemString(ldb_fcon,"conceptoRecaudo",lds_ripsc.getitemstring(ldb_ci,'vtmd'))
					else
						ripse_json.AddItemnumber(ldb_fcon,"vrServicio",0)
						ripse_json.AddItemString(ldb_fcon,"conceptoRecaudo",lds_ripsc.getitemstring(ldb_ci,'vtmd'))
					end if
					ripse_json.AddItemnumber(ldb_fcon,"valorPagoModerador",lds_ripsc.getitemnumber(ldb_ci,'vpm'))
//					if isnull(lds_ripsc.getitemstring(ldb_ci,'prefijo')) or lds_ripsc.getitemstring(ldb_ci,'prefijo')='' then
//						ripse_json.AddItemString(ldb_ci,"numFactura",string(lds_fact.getitemnumber(1,'nfact')))		
//					else
//						ripse_json.AddItemString(ldb_fcon,"numFactura",lds_fact.getitemstring(1,'prefijo')+string(lds_fact.getitemnumber(1,'nfact')))
//					end if
					ripse_json.AddItemNull(ldb_fcon,"numFEVPagoModerador")
					ripse_json.AddItemnumber(ldb_fcon,"consecutivo",ldb_ci)		
				next
			end if			
				
			////PROCED
			lds_ripsp.setfilter("tdpac='"+ls_ltd+"' and  docpac='"+ls_jdoc+"'")
			lds_ripsp.filter()
			if lds_ripsp.rowcount()>0 then
				ldb_cin= ripse_json.AddItemArray(ldb_serv,"procedimientos")
				for ldb_ci=1 to lds_ripsp.rowcount()
					ldb_fcon = ripse_json.AddItemObject(ldb_cin)
					ripse_json.AddItemString(ldb_fcon,"codPrestador",lds_ripsp.getitemstring(ldb_ci,'c_supersalud'))
					ripse_json.AddItemString(ldb_fcon,"fechaInicioAtencion",string(lds_ripsp.getitemdatetime(ldb_ci,"fecha"),'yyyy-mm-dd hh:mm'))		
					if isnull(lds_ripsp.getitemstring(ldb_ci,'idmipres')) then
						ripse_json.AddItemNull(ldb_fcon,"idMIPRES")
					else
						ripse_json.AddItemString(ldb_fcon,"idMIPRES",lds_ripsp.getitemstring(ldb_ci,'idmipres'))
					end if
					if isnull(lds_ripsp.getitemstring(ldb_ci,'nautoriza')) then
						ripse_json.AddItemNull(ldb_fcon,"numAutorizacion")
					else		
						ripse_json.AddItemString(ldb_fcon,"numAutorizacion",lds_ripsp.getitemstring(ldb_ci,'nautoriza'))
					end if
					ripse_json.AddItemString(ldb_fcon,"codProcedimiento",lds_ripsp.getitemstring(ldb_ci,'cod_cups'))
					ripse_json.AddItemString(ldb_fcon,"viaIngresoServicioSalud",lds_ripsp.getitemstring(ldb_ci,'viaing'))
					if isnull(lds_ripsp.getitemstring(ldb_ci,'cod_modrel')) then
						ripse_json.AddItemNull(ldb_fcon,"modalidadGrupoServicioTecSal")
					else
						ripse_json.AddItemString(ldb_fcon,"modalidadGrupoServicioTecSal",lds_ripsp.getitemstring(ldb_ci,'cod_modrel'))
					end if
					ripse_json.AddItemString(ldb_fcon,"grupoServicios",lds_ripsp.getitemstring(ldb_ci,'cod_grpserv'))
					ripse_json.AddItemNumber(ldb_fcon,"codServicio",double(lds_ripsp.getitemstring(ldb_ci,'cod_serv')))
					ripse_json.AddItemString(ldb_fcon,"finalidadTecnologiaSalud",lds_ripsp.getitemstring(ldb_ci,'finalidadproced'))
					ripse_json.AddItemString(ldb_fcon,"tipoDocumentoIdentificacion",lds_ripsp.getitemstring(ldb_ci,'tdoc'))
					ripse_json.AddItemString(ldb_fcon,"numDocumentoIdentificacion",lds_ripsp.getitemstring(ldb_ci,'documento'))
					ripse_json.AddItemString(ldb_fcon,"codDiagnosticoPrincipal",lds_ripsp.getitemstring(ldb_ci,'cod_rips'))
					if isnull(lds_ripsp.getitemstring(ldb_ci,'cod_rips_1')) then 
						ripse_json.AddItemNull(ldb_fcon,"codDiagnosticoRelacionado")
					else
						ripse_json.AddItemString(ldb_fcon,"codDiagnosticoRelacionado",lds_ripsp.getitemstring(ldb_ci,'cod_rips_1'))
					end if
					if isnull(lds_ripsp.getitemstring(ldb_ci,'cod_rips_2')) then
						ripse_json.AddItemNull(ldb_fcon,"codComplicacion")
					else
						ripse_json.AddItemString(ldb_fcon,"codComplicacion",lds_ripsp.getitemstring(ldb_ci,'cod_rips_2'))
					end if
					if as_capita0='1' then
						ripse_json.AddItemnumber(ldb_fcon,"vrServicio",lds_ripsp.getitemnumber(ldb_ci,'vproced'))
						ripse_json.AddItemString(ldb_fcon,"conceptoRecaudo",lds_ripsp.getitemstring(ldb_ci,'vtmd'))						
					else
						ripse_json.AddItemnumber(ldb_fcon,"vrServicio",0)
						ripse_json.AddItemString(ldb_fcon,"conceptoRecaudo",lds_ripsp.getitemstring(ldb_ci,'vtmd'))		
					end if
					ripse_json.AddItemnumber(ldb_fcon,"valorPagoModerador",lds_ripsp.getitemnumber(ldb_ci,'vpm'))
//					if isnull(lds_ripsp.getitemstring(ldb_ci,'prefijo')) or lds_ripsp.getitemstring(ldb_ci,'prefijo')='' then
//						ripse_json.AddItemString(ldb_ci,"numFactura",string(lds_fact.getitemnumber(1,'nfact')))		
//					else
//						ripse_json.AddItemString(ldb_fcon,"numFactura",lds_fact.getitemstring(1,'prefijo')+string(lds_fact.getitemnumber(1,'nfact')))
//					end if
					ripse_json.AddItemNull(ldb_fcon,"numFEVPagoModerador")					
					ripse_json.AddItemnumber(ldb_fcon,"consecutivo", ldb_ci)
				next
			end if		
				
			///URGENCIAS 
			lds_ripsu.setfilter("tdpac='"+ls_ltd+"' and  docpac='"+ls_jdoc+"'")
			lds_ripsu.filter()
			if lds_ripsu.rowcount()>0 then
				ldb_cin= ripse_json.AddItemArray(ldb_serv,"urgencias")
				for ldb_ci=1 to lds_ripsu.rowcount()
					ldb_fcon = ripse_json.AddItemObject(ldb_cin)
					ripse_json.AddItemString(ldb_fcon,"codPrestador",lds_ripsu.getitemstring(ldb_ci,'c_supersalud'))
					ripse_json.AddItemString(ldb_fcon,"fechaInicioAtencion",string(datetime(date(lds_ripsu.getitemdatetime(ldb_ci,'fechaingreso')),time(lds_ripsu.getitemdatetime(ldb_ci,'horaingreso'))),'yyyy-mm-dd hh:mm'))
					ripse_json.AddItemString(ldb_fcon,"causaMotivoAtencion",lds_ripsu.getitemstring(ldb_ci,'causaexterna'))
					ripse_json.AddItemString(ldb_fcon,"codDiagnosticoPrincipal",lds_ripsu.getitemstring(ldb_ci,'cod_rips'))
					if isnull(lds_ripsu.getitemstring(ldb_ci,'cod_rips_2')) then
						ripse_json.AddItemNull(ldb_fcon,"codDiagnosticoRelacionadoE1")
					else
						ripse_json.AddItemString(ldb_fcon,"codDiagnosticoRelacionadoE1",lds_ripsu.getitemstring(ldb_ci,'cod_rips_2'))
					end if
					if isnull(lds_ripsu.getitemstring(ldb_ci,'cod_rips_3')) then
						ripse_json.AddItemNull(ldb_fcon,"codDiagnosticoRelacionadoE2")
					else
						ripse_json.AddItemString(ldb_fcon,"codDiagnosticoRelacionadoE2",lds_ripsu.getitemstring(ldb_ci,'cod_rips_3'))
					end if
					if isnull(lds_ripsu.getitemstring(ldb_ci,'cod_rips_4')) then
						ripse_json.AddItemNull(ldb_fcon,"codDiagnosticoRelacionadoE3")
					else
						ripse_json.AddItemString(ldb_fcon,"codDiagnosticoRelacionadoE3",lds_ripsu.getitemstring(ldb_ci,'cod_rips_4'))
					end if
					ripse_json.AddItemString(ldb_fcon,"fechaEgreso",string(datetime(date(lds_ripsu.getitemdatetime(ldb_ci,'fechaegreso')),time(lds_ripsu.getitemdatetime(ldb_ci,'horaegreso'))),'yyyy-mm-dd hh:mm'))
					ripse_json.AddItemString(ldb_fcon,"consecutivo",string( ldb_ci))			
				next
			end if
			
			//HOSPITALIZA
			lds_ripsh.setfilter("tdpac='"+ls_ltd+"' and  docpac='"+ls_jdoc+"'")
			lds_ripsh.filter()	
			if lds_ripsh.rowcount()>0 then
				ldb_cin= ripse_json.AddItemArray(ldb_serv,"hospitalizacion")
				for ldb_ci=1 to lds_ripsh.rowcount()
					ldb_fcon = ripse_json.AddItemObject(ldb_cin)
					ripse_json.AddItemString(ldb_fcon,"codPrestador",lds_ripsh.getitemstring(ldb_ci,'c_supersalud'))
					ripse_json.AddItemString(ldb_fcon,"fechaInicioAtencion",string(datetime(date(lds_ripsh.getitemdatetime(ldb_ci,'fechaingreso')),time(lds_ripsh.getitemdatetime(ldb_ci,'horaingreso'))),'yyyy-mm-dd hh:mm'))
					ripse_json.AddItemString(ldb_fcon,"causaMotivoAtencion",lds_ripsh.getitemstring(ldb_ci,'causaexterna'))
					ripse_json.AddItemString(ldb_fcon,"codDiagnosticoPrincipal",lds_ripsh.getitemstring(ldb_ci,'cod_rips'))
					ripse_json.AddItemString(ldb_fcon,"codDiagnosticoPrincipaIE",lds_ripsh.getitemstring(ldb_ci,'cod_rips_1'))
					if isnull(lds_ripsh.getitemstring(ldb_ci,'cod_rips_2')) then
						ripse_json.AddItemNull(ldb_fcon,"codDiagnosticoRelacionadoE1")
					else
						ripse_json.AddItemString(ldb_fcon,"codDiagnosticoRelacionadoE1",lds_ripsh.getitemstring(ldb_ci,'cod_rips_2'))
					end if
					if isnull(lds_ripsh.getitemstring(ldb_ci,'cod_rips_3')) then
						ripse_json.AddItemNull(ldb_fcon,"codDiagnosticoRelacionadoE2")
					else
						ripse_json.AddItemString(ldb_fcon,"codDiagnosticoRelacionadoE2",lds_ripsh.getitemstring(ldb_ci,'cod_rips_3'))
					end if
					if isnull(lds_ripsh.getitemstring(ldb_ci,'cod_rips_4')) then
						ripse_json.AddItemNull(ldb_fcon,"codDiagnosticoRelacionadoE3")
					else
						ripse_json.AddItemString(ldb_fcon,"codDiagnosticoRelacionadoE3",lds_ripsh.getitemstring(ldb_ci,'cod_rips_4'))
					end if
					if isnull(lds_ripsh.getitemstring(ldb_ci,'cod_rips_6')) then
						ripse_json.AddItemNull(ldb_fcon,"codComplicacion")
					else
						ripse_json.AddItemString(ldb_fcon,"codComplicacion",lds_ripsh.getitemstring(ldb_ci,'cod_rips_6'))
					end if
					
					ripse_json.AddItemString(ldb_fcon,"condicionDestinoUsuarioEgreso",lds_ripsh.getitemstring(ldb_ci,'conductaurg'))
					
					if isnull(lds_ripsh.getitemstring(ldb_ci,'cod_rips_5')) then
						ripse_json.AddItemNull(ldb_fcon,"codDiagnosticoCausaMuerte")
					else
						ripse_json.AddItemString(ldb_fcon,"codDiagnosticoCausaMuerte",lds_ripsh.getitemstring(ldb_ci,'cod_rips_5'))
					end if
					ripse_json.AddItemString(ldb_fcon,"fechaEgreso",string(datetime(date(lds_ripsh.getitemdatetime(ldb_ci,'fechaegreso')),time(lds_ripsh.getitemdatetime(ldb_ci,'horaegreso'))),'yyyy-mm-dd hh:mm'))
					ripse_json.AddItemString(ldb_fcon,"consecutivo",string(ldb_ci))			
				next
			end if
				
			//RECIEN NACIDO
			lds_ripsrc.setfilter("tdpac='"+ls_ltd+"' and  docpac='"+ls_jdoc+"'")
			lds_ripsrc.filter()
			if lds_ripsrc.rowcount()>0 then
				ldb_cin= ripse_json.AddItemArray(ldb_serv,"recienNacidos")
				for ldb_ci=1 to lds_ripsrc.rowcount()
					ldb_fcon = ripse_json.AddItemObject(ldb_cin)
					ripse_json.AddItemString(ldb_fcon,"codPrestado",lds_ripsrc.getitemstring(ldb_ci,'c_supersalud'))
					ripse_json.AddItemString(ldb_fcon,"tipoDocumentoIdentificacion",ls_ltd)
					ripse_json.AddItemString(ldb_fcon,"numDocumentoIdentificacion",ls_jdoc)	
					ripse_json.AddItemString(ldb_fcon,"fechaNacimiento",string(lds_ripsrc.getitemdatetime(ldb_ci,'fechareg'),'yyyy-mm-dd hh:mm'))
					ripse_json.AddItemString(ldb_fcon,"edadGestacional",string(lds_ripsrc.getitemnumber(ldb_ci,'edad_gest')))
					ripse_json.AddItemString(ldb_fcon,"numConsultasCPrenatal",string(lds_ripsrc.getitemnumber(ldb_ci,'nccp')))
					ripse_json.AddItemString(ldb_fcon,"codSexoBiologico",lds_ripsrc.getitemstring(ldb_ci,'sexorn'))	
					ripse_json.AddItemString(ldb_fcon,"peso",string(lds_ripsrc.getitemnumber(ldb_ci,'pesorn')))
					ripse_json.AddItemString(ldb_fcon,"codDiagnosticoPrincipal",lds_ripsrc.getitemstring(ldb_ci,'cod_rips'))	
					ripse_json.AddItemString(ldb_fcon,"condicionDestino",lds_ripsrc.getitemstring(ldb_ci,'estado'))	
					ripse_json.AddItemString(ldb_fcon,"codDiagnosticoCausaMuerte",lds_ripsrc.getitemstring(ldb_ci,'cod_rips_1'))	
					if lds_ripsrc.getitemstring(ldb_ci,'estado')='1' then
						ripse_json.AddItemString(ldb_fcon,"fecha Egreso",string(lds_ripsrc.getitemdatetime(ldb_ci,'fechareg'),'yyyy-mm-dd hh:mm'))
					else
						ripse_json.AddItemString(ldb_fcon,"fecha Egreso",string(lds_ripsrc.getitemdatetime(ldb_ci,'fechamuertern'),'yyyy-mm-dd hh:mm'))
					end if		
					ripse_json.AddItemString(ldb_fcon,"consecutivo",string( ldb_ci))		
				next
			end if
			
			//MEDICAMENTOS
			lds_ripsme.setfilter("tdpac='"+ls_ltd+"' and  docpac='"+ls_jdoc+"'")
			lds_ripsme.filter()		
			if lds_ripsme.rowcount()>0 then
				ldb_cin= ripse_json.AddItemArray(ldb_serv,"medicamentos")
				for ldb_ci=1 to lds_ripsme.rowcount()
					ldb_fcon = ripse_json.AddItemObject(ldb_cin)
					ripse_json.AddItemString(ldb_fcon,"codPrestador",lds_ripsme.getitemstring(ldb_ci,'c_supersalud'))
					ripse_json.AddItemString(ldb_fcon,"numAutorizacion",lds_ripsme.getitemstring(ldb_ci,'autorizacion'))
					ripse_json.AddItemString(ldb_fcon,"idMIPRES",lds_ripsme.getitemstring(ldb_ci,'idmipres'))
					ripse_json.AddItemString(ldb_fcon,"fechaDispensAdmon",string(lds_ripsme.getitemdatetime(ldb_ci,'fecha'),'yyyy-mm-dd HH:mm'))
					ripse_json.AddItemString(ldb_fcon,"codDiagnosticoPrincipal",lds_ripsme.getitemstring(ldb_ci,'dx1'))
					if isnull(lds_ripsme.getitemstring(ldb_ci,'dxr1')) or lds_ripsme.getitemstring(ldb_ci,'dxr1')='' then
						ripse_json.AddItemNull(ldb_fcon,"codDiagnosticoRelacionado")	
					else
						ripse_json.AddItemString(ldb_fcon,"codDiagnosticoRelacionado",lds_ripsme.getitemstring(ldb_ci,'dxr1'))
					end if
					ripse_json.AddItemString(ldb_fcon,"tipoMedicamento",lds_ripsme.getitemstring(ldb_ci,'cod_tmedica'))
					
					
					if isnull(lds_ripsme.getitemstring(ldb_ci,'ium')) or lds_ripsme.getitemstring(ldb_ci,'ium')='' then
						ripse_json.AddItemString(ldb_fcon,"codTecnologiaSalud",lds_ripsme.getitemstring(ldb_ci,'cum'))
					else
						ripse_json.AddItemString(ldb_fcon,"codTecnologiaSalud",lds_ripsme.getitemstring(ldb_ci,'ium'))			
					end if
					
					
					if lds_ripsme.getitemstring(ldb_ci,'cod_tmedica')='03' then
						ripse_json.AddItemString(ldb_fcon,"nomTecnologiaSalud",lds_ripsme.getitemstring(ldb_ci,'medicamento'))
					else
						ripse_json.AddItemString(ldb_fcon,"nomTecnologiaSalud",'')
					end if
					
					if lds_ripsme.getitemstring(ldb_ci,'cod_tmedica')='03' then
						ripse_json.AddItemString(ldb_fcon,"concentracionMedicamento",lds_ripsme.getitemstring(ldb_ci,'concentracio'))
					else
						ripse_json.AddItemnumber(ldb_fcon,"concentracionMedicamento",0)
					end if

					if lds_ripsme.getitemstring(ldb_ci,'cod_tmedica')='03' then
						ripse_json.AddItemString(ldb_fcon,"unidadMedida",lds_ripsme.getitemstring(ldb_ci,'codigo_uni'))
					else
						ripse_json.AddItemnumber(ldb_fcon,"unidadMedida",0)
					end if
					
					if lds_ripsme.getitemstring(ldb_ci,'cod_tmedica')='03' then
						ripse_json.AddItemString(ldb_fcon,"formaFarmaceutica",lds_ripsme.getitemstring(ldb_ci,'formafarm'))
					else
						ripse_json.AddItemNull(ldb_fcon,"formaFarmaceutica")
					end if					
					
					ripse_json.AddItemnumber(ldb_fcon,"unidadMinDispensa",integer(lds_ripsme.getitemstring(ldb_ci,'umm')))

					ripse_json.AddItemnumber(ldb_fcon,"cantidadMedicamento",lds_ripsme.getitemnumber(ldb_ci,'cantidad'))
					ripse_json.AddItemnumber(ldb_fcon,"diasTratamiento",1)
					ripse_json.AddItemString(ldb_fcon,"tipoDocumentoIdentificacion",lds_ripsme.getitemstring(ldb_ci,'tdoc'))
					ripse_json.AddItemString(ldb_fcon,"numDocumentoIdentificacion",lds_ripsme.getitemstring(ldb_ci,'documento'))
					if as_capita0='1' then
						ripse_json.AddItemnumber(ldb_fcon,"vrUnitMedicamento",lds_ripsme.getitemnumber(ldb_ci,'vuni'))					
						ripse_json.AddItemnumber(ldb_fcon,"vrServicio",lds_ripsme.getitemnumber(ldb_ci,'vproced'))
					else
						ripse_json.AddItemnumber(ldb_fcon,"vrUnitMedicamento",0)					
						ripse_json.AddItemnumber(ldb_fcon,"vrServicio",0)						
					end if
					
					ripse_json.AddItemString(ldb_fcon,"conceptoRecaudo",lds_ripsme.getitemstring(ldb_ci,'vtmd'))
					ripse_json.AddItemnumber(ldb_fcon,"valorPagoModerador",lds_ripsme.getitemnumber(ldb_ci,'vpm'))
//					if isnull(lds_ripsme.getitemstring(ldb_ci,'prefijo')) or lds_ripsme.getitemstring(ldb_ci,'prefijo')='' then
//						ripse_json.AddItemString(ldb_ci,"numFactura",string(lds_fact.getitemnumber(1,'nfact')))		
//					else
//						ripse_json.AddItemString(ldb_fcon,"numFactura",lds_fact.getitemstring(1,'prefijo')+string(lds_fact.getitemnumber(1,'nfact')))
//					end if
					ripse_json.AddItemNull(ldb_fcon,"numFEVPagoModerador")	
					ripse_json.AddItemnumber(ldb_fcon,"consecutivo",ldb_ci)
				next
			end if
				
			//OTROS
			lds_ripsot.setfilter("tdpac='"+ls_ltd+"' and  docpac='"+ls_jdoc+"'")
			lds_ripsot.filter()
			if lds_ripsot.rowcount()>1 then 
				ldb_cin= ripse_json.AddItemArray(ldb_serv,"otrosServicios")
				for ldb_ci=1 to lds_ripsot.rowcount()
					ldb_fcon = ripse_json.AddItemObject(ldb_cin)
					ripse_json.AddItemString(ldb_fcon,"codPrestador",lds_ripsot.getitemstring(ldb_ci,'c_supersalud'))
					ripse_json.AddItemString(ldb_fcon,"numAutorizacion",lds_ripsot.getitemstring(ldb_ci,'autorizacion'))
					ripse_json.AddItemString(ldb_fcon,"idMIPRES",lds_ripsot.getitemstring(ldb_ci,'idmipres'))
					ripse_json.AddItemString(ldb_fcon,"fechaSuministroTecnologia",string(lds_ripsot.getitemdatetime(ldb_ci,'fecha'),'yyyy-mm-dd HH:mm'))
					ripse_json.AddItemString(ldb_fcon,"tipoOS",lds_ripsot.getitemstring(ldb_ci,'tipoos'))
					
					if (isnull(lds_ripsot.getitemstring(ldb_ci,'ium')) or lds_ripsot.getitemstring(ldb_ci,'ium')='') and ( isnull(lds_ripsot.getitemstring(ldb_ci,'cum')) or lds_ripsot.getitemstring(ldb_ci,'cum')='') then
//						ripse_json.AddItemNull(ldb_fcon,"codTecnologiaSalud")
						ripse_json.AddItemString(ldb_fcon,"codTecnologiaSalud",lds_ripsot.getitemstring(ldb_ci,'c_medica'))
					else
						if isnull(lds_ripsot.getitemstring(ldb_ci,'ium')) or lds_ripsot.getitemstring(ldb_ci,'ium')=''  then
							ripse_json.AddItemString(ldb_fcon,"codTecnologiaSalud",lds_ripsot.getitemstring(ldb_ci,'cum'))
						else
							ripse_json.AddItemString(ldb_fcon,"codTecnologiaSalud",lds_ripsot.getitemstring(ldb_ci,'ium'))			
						end if
					end if	
									
					if lds_ripsot.getitemstring(ldb_ci,'tipoos')='01' then
						ripse_json.AddItemString(ldb_fcon,"nomTecnologiaSalud",lds_ripsot.getitemstring(ldb_ci,'medicamento'))
					else
						ripse_json.AddItemString(ldb_fcon,"nomTecnologiaSalud",'')
					end if
					
					ripse_json.AddItemnumber(ldb_fcon,"cantidadOS",lds_ripsot.getitemnumber(ldb_ci,'cantidad'))
					ripse_json.AddItemString(ldb_fcon,"tipoDocumentoIdentificacion",ls_ltd)
					ripse_json.AddItemString(ldb_fcon,"numDocumentoIdentificacion",ls_jdoc)
					ripse_json.AddItemnumber(ldb_fcon,"vrUnitOS",lds_ripsot.getitemnumber(ldb_ci,'vuni'))
					ripse_json.AddItemnumber(ldb_fcon,"vrServicio",lds_ripsot.getitemnumber(ldb_ci,'vproced'))
					ripse_json.AddItemString(ldb_fcon,"conceptoRecaudo",lds_ripsot.getitemstring(ldb_ci,'vtmd'))
					ripse_json.AddItemnumber(ldb_fcon,"valorPagoModerador",lds_ripsot.getitemnumber(ldb_ci,'vpm'))
//					if isnull(lds_ripsot.getitemstring(ldb_ci,'prefijo')) or lds_ripsot.getitemstring(ldb_ci,'prefijo')='' then
//						ripse_json.AddItemString(ldb_ci,"numFactura",string(lds_fact.getitemnumber(1,'nfact')))		
//					else
//						ripse_json.AddItemString(ldb_fcon,"numFactura",lds_fact.getitemstring(1,'prefijo')+string(lds_fact.getitemnumber(1,'nfact')))
//					end if
					ripse_json.AddItemNull(ldb_fcon,"numFEVPagoModerador")			
					ripse_json.AddItemnumber(ldb_fcon,"consecutivo",ldb_ci)
				next
			end if
		next  //CICLO USUARIO
	end if // USUARIO
end if	 ///FIN FACTURA

ripse_json.SaveToFile(as_ruta)

st_ret_dian lst_ret_dian

destroy ripse_json
destroy lds_fact
destroy lds_usu

return lst_ret_dian
end function

on nvo_rips_json.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_rips_json.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

