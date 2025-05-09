$PBExportHeader$w_factura.srw
forward
global type w_factura from w_factura_base
end type
type dw_fact_subcpo from datawindow within w_factura
end type
type dw_fact_cab from datawindow within w_factura
end type
type dw_fact_cpo from datawindow within w_factura
end type
type dw_rela_abon from datawindow within w_factura
end type
type dw_odo_cita from datawindow within w_factura
end type
type dw_electronica from uo_datawindow within w_factura
end type
type cb_2 from commandbutton within w_factura
end type
end forward

global type w_factura from w_factura_base
integer width = 5783
integer height = 2636
string title = "Facturación de Servicios - MODULO DE FACTURACIÓN  -"
string i_cdoc = "FC"
dw_fact_subcpo dw_fact_subcpo
dw_fact_cab dw_fact_cab
dw_fact_cpo dw_fact_cpo
dw_rela_abon dw_rela_abon
dw_odo_cita dw_odo_cita
dw_electronica dw_electronica
cb_2 cb_2
end type
global w_factura w_factura

forward prototypes
public function long factura ()
public subroutine blanquea ()
public function integer encuestar ()
end prototypes

public function long factura ();long j,donde,k,l,ldb_facturas[],npagare,nitem_fc,actualiza,abonos,ntrata,item_trat,ldb_recibos[]
string ya_recibo,proeq,manu,pla,cempres,ccontrat,clug_trat,ctipo_fac,ls_tipos_fac[],nauto,f_scerr=''

ya_recibo="no"
if f_catastrofe()=-1 then return -1

long nh,factus
string clug_adm


dec lleva,hasta,mas
for k=1 to dw_resumen.rowcount()
	setnull(ist_nrecibo.ndoc)
	setnull(ist_nrecibo.c_aut)	
	cempres=dw_resumen.getitemstring(k,"cemp")
	ccontrat=dw_resumen.getitemstring(k,"ccont")
	ctipo_fac=dw_resumen.getitemstring(k,"tipo_fac")
	select monto_hasta,acumulado into :hasta,:lleva from contratos 
	where codemp =:cempres and codcontrato=:ccontrat;
	if sqlca.sqlcode=-1 then
		Messagebox("Error leyendo Contratos para actualizar Montos linea 21",sqlca.sqlerrtext)
		blanquea()
		return -1
	end if
	mas=round(dw_resumen.getitemdecimal(k,'vtemp'),2)
	if hasta>0 and mas>0 then
		if mas +lleva > hasta then
			Messagebox("Atención",'El monto del contrato ' +ccontrat+' de la empresa ' +cempres+' ya llegó a su límite, no puede facturar más a este')
			blanquea()
			return -1
		end if
		update contratos set acumulado=acumulado +:mas
		where codemp =:cempres and codcontrato=:ccontrat; 		
		if sqlca.sqlcode=-1 then
			Messagebox("Error Actualizando los montos de Contratos linea 35",sqlca.sqlerrtext)
			blanquea()
			return -1
		end if
	end if
	dw_factura.setfilter("cemp='"+cempres+"'and ccontrato='"+ccontrat+"' and tipo_fac='"+ctipo_fac+"'")
	dw_factura.filter()
	dw_fact_cab.insertrow(1)
	dw_fact_cab.setitem(1,"fecha",datetime(today()))
	dw_fact_cab.setitem(1,"hora",datetime(today(),time(string(now()))))
	dw_fact_cab.setitem(1,"numeropoliza",sle_poliza.text)
	dw_fact_cab.setitem(1,"cemp",cempres)
	dw_fact_cab.setitem(1,"ccontrato",ccontrat)
	dw_fact_cab.setitem(1,"tipo",ctipo_fac)
	//dw_fact_cab.setitem(1,"codprof",i_profe)
	//dw_fact_cab.setitem(1,"cprof_ordena",i_profe_ord)
	dw_fact_cab.setitem(1,"vtiva",dw_resumen.getitemdecimal(k,"vtiva"))
	dw_fact_cab.setitem(1,"vtcopago",dw_resumen.getitemnumber(k,"vtcop"))
	dw_fact_cab.setitem(1,"vtcrec",dw_resumen.getitemnumber(k,"vtcr"))
	dw_fact_cab.setitem(1,"vtcmod",dw_resumen.getitemnumber(k,"vtcm"))
	dw_fact_cab.setitem(1,"vtemp",dw_resumen.getitemnumber(k,"vtemp"))
	dw_fact_cab.setitem(1,"vtpaciente",dw_resumen.getitemnumber(k,"vtpac"))
	dw_fact_cab.setitem(1,"vtdescuentos",dw_resumen.getitemnumber(k,"descuento_e"))
	dw_fact_cab.setitem(1,"ncatastrofe",dw_resumen.getitemnumber(k,"ncatas"))
	dw_fact_cab.setitem(1,"clug_catas",dw_resumen.getitemstring(k,"clug_catas"))
	dw_fact_cab.setitem(1,"vtcancelo",dw_resumen.getitemnumber(k,"vtcancel"))
	dw_fact_cab.setitem(1,"vtabono",dw_resumen.getitemnumber(k,"vtabon"))
	dw_fact_cab.setitem(1,"vtdescpac",dw_resumen.getitemnumber(k,"vtdesc"))
	dw_fact_cab.setitem(1,"vtpagare",dw_resumen.getitemnumber(k,"vtpac") - dw_resumen.getitemnumber(k,"vtcancel") - dw_resumen.getitemnumber(k,"vtdesc")-dw_resumen.getitemnumber(k,"vtabon"))
	if dw_tip_ingres.rowcount()=0 then
		dw_fact_cab.setitem(1,"codtingre",'1')
	else
		dw_fact_cab.setitem(1,"codtingre",dw_tip_ingres.getitemstring(1,1))
	end if
	dw_fact_cab.setitem(1,"vtproced",dw_resumen.getitemnumber(k,"vtotal"))
	dw_fact_cab.setitem(1,"iva_cr",dw_resumen.getitemnumber(k,"iva_cr"))
	dw_fact_cab.setitem(1,"iva_cm",dw_resumen.getitemnumber(k,"iva_cm"))
	dw_fact_cab.setitem(1,"iva_cp",dw_resumen.getitemnumber(k,"iva_cp"))
	dw_fact_cab.setitem(1,"usuario",usuario)
	dw_fact_cab.setitem(1,"clugar",CLUGAR)
	if dw_dx.rowcount()>0 then
		dw_fact_cab.setitem(1,"dxppal",dw_dx.getitemstring(1,"codgeral"))
		dw_fact_cab.setitem(1,"finalidad",dw_dx.getitemstring(1,"finc"))
		dw_fact_cab.setitem(1,"modar",dw_dx.getitemstring(1,"ambp"))
	end if	
	dw_fact_cab.setitem(1,"tproced",dw_resumen.getitemnumber(k,"tcant"))  //listo fact_cab
	if ctipo_fac='C' then i_cdoc='FC'
	if ctipo_fac='F' then  i_cdoc='FV'
	ist_nfactura=f_trae_factura(i_cdoc,clugar,'Factura')
	if ist_nfactura.ndoc=-1 then 
		blanquea()
		return -1
	end if
	dw_fact_cab.setitem(1,"nfact",ist_nfactura.ndoc)
	dw_fact_cab.setitem(1,"c_aut",ist_nfactura.c_aut)
	
	//// para recibo con el fin de seprar recibos por cada factura para electronica
	if dw_factura.getitemnumber(1,"vt_rec")>0 then
		ist_nrecibo=f_trae_factura('RC',clugar,'Recibo de Caja')
		if ist_nrecibo.ndoc=-1 then 
			blanquea()
			return -1
		end if

		dw_rec_caj_cab.setfilter("cemp='"+cempres+"' AND ccont='"+ccontrat+"'")
		dw_rec_caj_cab.filter()
		dw_rec_caj_cab.setitem(1,"nrcaj",ist_nrecibo.ndoc)
		dw_rec_caj_cab.setitem(1,"c_aut",ist_nrecibo.c_aut)		
		dw_rec_caj_cab.setfilter('')
		dw_rec_caj_cab.filter()
		
		dw_reccaj_cpo.setfilter("cemp='"+cempres+"' AND ccont='"+ccontrat+"'")
		dw_reccaj_cpo.filter()
		dw_reccaj_cpo.setitem(1,"nrcaj",ist_nrecibo.ndoc)
		dw_reccaj_cpo.setitem(1,"clugar",clugar)		
		dw_reccaj_cpo.setitem(1,"nfact",ist_nfactura.ndoc)
		dw_reccaj_cpo.setitem(1,"clugar_fac",clugar)		
		dw_reccaj_cpo.setitem(1,"tipo_fac",ctipo_fac)				
		
		ldb_recibos[k]=ist_nrecibo.ndoc
	end if
	//// para recibo con el fin de seprar recibos por cada factura para electronica
	
	for j=1 to dw_factura.rowcount()
		donde=dw_fact_cpo.insertrow(0)
		dw_factura.setitem(j,"factu",ist_nfactura.ndoc)
		dw_fact_cpo.setitem(donde,"nfact",ist_nfactura.ndoc)
		dw_fact_cpo.setitem(donde,"clugar",clugar)
		dw_fact_cpo.setitem(donde,"tipo",ctipo_fac)
		dw_factura.setitem(j,"nitem_fac",j)
		dw_fact_cpo.setitem(donde,"nitem",j)
		dw_fact_cpo.setitem(donde,"cemp",cempres)
		dw_fact_cpo.setitem(donde,"ccontrato",ccontrat)
		f_scerr=dw_factura.getitemstring(j,"fact_scer")
		dw_fact_cpo.setitem(donde,"cplan",dw_factura.getitemstring(j,"plan"))
		dw_fact_cpo.setitem(donde,"cufuncional",dw_factura.getitemstring(j,"coduf"))
		dw_fact_cpo.setitem(donde,"cccosto",dw_factura.getitemstring(j,"codcc"))
		dw_fact_cpo.setitem(donde,"tipodoc",dw_factura.getitemstring(j,"tipodoc"))
		dw_fact_cpo.setitem(donde,"documento",dw_factura.getitemstring(j,"docu"))
		dw_fact_cpo.setitem(donde,"tipoproc",dw_factura.getitemstring(j,"tipo_proc"))
		dw_fact_cpo.setitem(donde,"viva",dw_factura.getitemdecimal(j,"iva"))
		string ls_oxig
		setnull(ls_oxig)		
		if dw_factura.getitemstring(j,"es_medica")="1" then
			dw_fact_cpo.setitem(donde,"c_medica",dw_factura.getitemstring(j,"cproc"))
			dw_fact_cpo.setitem(donde,"codarticulo",dw_factura.getitemstring(j,"articulo"))
			if isnull(dw_factura.getitemstring(j,"cod_oxig")) or dw_factura.getitemstring(j,"cod_oxig")='' then
				dw_fact_cpo.setitem(donde,"cod_oxig",ls_oxig)
			else
				dw_fact_cpo.setitem(donde,"cod_oxig",dw_factura.getitemstring(j,"cod_oxig"))
			end if
		else
			dw_fact_cpo.setitem(donde,"cproced",dw_factura.getitemstring(j,"cproc"))
			dw_fact_cpo.setitem(donde,"proccups",dw_factura.getitemstring(j,"proccups"))
			dw_fact_cpo.setitem(donde,"cod_oxig",ls_oxig)
		end if
		dw_fact_cpo.setitem(donde,"codmanual",dw_factura.getitemstring(j,"cod_manual"))
		dw_fact_cpo.setitem(donde,"vproced",dw_factura.getitemnumber(j,"vt_proc"))
		dw_fact_cpo.setitem(donde,"vemp",dw_factura.getitemnumber(j,"vt_emp"))
		dw_fact_cpo.setitem(donde,"contador",dw_factura.getitemnumber(j,"contador"))
		dw_fact_cpo.setitem(donde,"clugar_ser",dw_factura.getitemstring(j,"clugar_his"))
		dw_fact_cpo.setitem(donde,"nservicio",dw_factura.getitemnumber(j,"nserv"))
		dw_fact_cpo.setitem(donde,"ncita",dw_factura.getitemnumber(j,"ncita"))
		dw_fact_cpo.setitem(donde,"clugar_cita",dw_factura.getitemstring(j,"clug_cita"))
		dw_fact_cpo.setitem(donde,"codaadx",dw_factura.getitemstring(j,"areaadx"))
		//dw_fact_cpo.setitem(donde,"nrcaj",dw_factura.getitemnumber(j,"nrcaj"))
		//dw_fact_cpo.setitem(donde,"clugar_rec",dw_factura.getitemstring(j,"clugar_rec"))
		dw_fact_cpo.setitem(donde,"nrcaj",ist_nrecibo.ndoc)
		dw_fact_cpo.setitem(donde,"clugar_rec",clugar)
		dw_fact_cpo.setitem(donde,"multiple",dw_factura.getitemstring(j,"multiple"))
		dw_fact_cpo.setitem(donde,"tipo_cir",dw_factura.getitemstring(j,"tipo_cir"))
		dw_fact_cpo.setitem(donde,"tingre",dw_factura.getitemstring(j,"tingres"))
		dw_fact_cpo.setitem(donde,"nacto",dw_factura.getitemnumber(j,"nacto"))
		dw_fact_cpo.setitem(donde,"orden_qx",dw_factura.getitemnumber(j,"orden_qx"))
		dw_fact_cpo.setitem(donde,"desc_emp",dw_factura.getitemnumber(j,"desc_emp"))
		choose case dw_factura.getitemstring(j,"que_paga")
			case "Copago"
				dw_fact_cpo.setitem(donde,"vcopago",dw_factura.getitemnumber(j,"vt_pac"))
				dw_fact_cpo.setitem(donde,"iva_cp",dw_factura.getitemnumber(j,"iva_crm"))
			case "Cuota Recu."
				dw_fact_cpo.setitem(donde,"vcr",dw_factura.getitemnumber(j,"vt_pac"))
				dw_fact_cpo.setitem(donde,"iva_cr",dw_factura.getitemnumber(j,"iva_crm"))
			case "Cuota Mode."
				dw_fact_cpo.setitem(donde,"vcm",dw_factura.getitemnumber(j,"vt_pac"))
				dw_fact_cpo.setitem(donde,"iva_cm",dw_factura.getitemnumber(j,"iva_crm"))
			case "particular"
				dw_fact_cpo.setitem(donde,"vpart",dw_factura.getitemnumber(j,"vt_pac"))
		end choose
		dw_fact_cpo.setitem(donde,"vpart",dw_fact_cpo.getitemnumber(donde,"vpart") +dw_factura.getitemnumber(j,"v_part"))
		dw_fact_cpo.setitem(donde,"cantidad",dw_factura.getitemnumber(j,"cantidad"))
		dw_fact_cpo.setitem(donde,"ria",dw_factura.getitemstring(j,"rips"))
		dw_fact_cpo.setitem(donde,"codconcepto",dw_factura.getitemstring(j,"cod_concep"))
		if dw_factura.getitemnumber(j,"nfact_ref")<>0 then
			dw_fact_cpo.setitem(donde,"nfact_ref",dw_factura.getitemnumber(j,"nfact_ref"))
			dw_fact_cpo.setitem(donde,"clugar_ref",dw_factura.getitemstring(j,"clugar_ref"))
			dw_fact_cpo.setitem(donde,"tipo_ref",dw_factura.getitemstring(j,"tipo_fac_ref"))
			dw_fact_cpo.setitem(donde,"nitem_ref",dw_factura.getitemnumber(j,"nitem_fac_ref"))
		end if

		string yy
		yy=dw_factura.getitemstring(j,"autoriza")
		if trim(yy)="" or yy="0" then setnull(yy)
		dw_fact_cpo.setitem(donde,"autorizacion",yy)
		
		yy=dw_factura.getitemstring(j,"siras")
		if trim(yy)="" or yy="0" then setnull(yy)
		dw_fact_cpo.setitem(donde,"siras",yy)
				
		
		//dw_fact_cpo.setitem(donde,"tipoactoqx",dw_factura.getitemnumber(j,""))
		dw_factura_cpo.setfilter("num_padre="+string(dw_factura.getitemnumber(j,"numero")))
		dw_factura_cpo.filter()
		for l=1 to dw_factura_cpo.rowcount()
			donde=dw_fact_subcpo.insertrow(0)
			dw_fact_subcpo.setitem(donde,"cnf",ist_nfactura.ndoc)
			dw_fact_subcpo.setitem(donde,"clugar",clugar)
			dw_fact_subcpo.setitem(donde,"tipo",ctipo_fac)			
			dw_fact_subcpo.setitem(donde,"nitem",j)
			dw_fact_subcpo.setitem(donde,"ndeta",dw_factura_cpo.getitemnumber(l,"numero"))
			dw_fact_subcpo.setitem(donde,"tipoproc",dw_factura_cpo.getitemstring(l,"tipo_proc"))
			dw_fact_subcpo.setitem(donde,"cproced",dw_factura_cpo.getitemstring(l,"cproced"))
			dw_fact_subcpo.setitem(donde,"vproced",dw_factura_cpo.getitemnumber(l,"valor"))
			dw_fact_subcpo.setitem(donde,"cantidad",dw_factura_cpo.getitemnumber(l,"cantidad"))
			dw_fact_subcpo.setitem(donde,"codmanual",dw_factura_cpo.getitemstring(l,"cod_manual"))
		next //l dw_fact_subcpo
	next //j dw_factura

	actualiza=dw_fact_cab.update()
	if actualiza=-1 or isnull(actualiza) then 
		blanquea()
		return -1
	end if
	actualiza=dw_his_acu.update()
	if actualiza=-1 or isnull(actualiza) then 
		dw_his_acu.deleterow(1)
		dw_his_acu.resetupdate()
		blanquea()
		return -1
	end if
	actualiza=dw_fact_cpo.update()
	if actualiza=-1 or isnull(actualiza) then
		blanquea()
		return -1
	end if
	actualiza=dw_fact_subcpo.update()
	if isnull(actualiza) or actualiza=-1 then
		blanquea()
		return -1
	end if

	if dw_rec_caj_cab.rowcount()>0 then
		actualiza=dw_rec_caj_cab.update()
		if isnull(actualiza) or actualiza=-1 then
			blanquea()
			return -1
		end if
	
		if dw_rec_caj_cab.getitemnumber(1,'tsaldo')>0 then
			npagare=f_pagare(dw_rec_caj_cab.getitemdecimal(1,'tsaldo'),ist_nrecibo.ndoc,clugar)
			if npagare=-1 then
				blanquea()
				return -1
			end if
			dw_rec_caj_cab.setitem(1,"npagare",npagare)
			dw_rec_caj_cab.setitem(1,"clugar_pag",clugar)
			if dw_rec_caj_cab.update()=-1 then
				blanquea()
				return -1
			end if
			if dw_rec_caj_cab.getitemstring(1,'imp_pag')='1' then
				any parg[2]
				parg[1]=npagare
				parg[2]=clugar
				pb_pagare.imprimir(parg,'','0')
			end if
		end if

		actualiza=dw_reccaj_cpo.update()
		if isnull(actualiza) or actualiza=-1 then
			blanquea()
			return -1
		end if
		
		update factcpo set nrcaj=:ist_nrecibo.ndoc , clugar_rec=:clugar where nfact=:ist_nfactura.ndoc and clugar=:clugar and tipo=:ctipo_fac;
		if sqlca.sqlcode<>0 then
			messagebox("Error actualizando Factcpo linea 280",sqlca.sqlerrtext)
			blanquea()
			return -1
		end if
	end if

	ldb_facturas[k]=ist_nfactura.ndoc
	ls_tipos_fac[K]=ctipo_fac
	
	////////ELECTRONICA	
	if /*(ctipo_fac='F' and ls_elec='1') or*/ (ctipo_fac='F'  and cempres='0' and (ls_elec='1' or ls_elec='2')) then 
		nvo_factura_electronica u_elec
		st_ret_dian    lst_lle
		string ls_fver
		datetime ldt_iniciafevs,ldt_ff
		
		SELECT fecha into :ldt_iniciafevs
		FROM parametros_gen
		WHERE (((codigo_para)=79));
		if sqlca.sqlnrows=0 then
			messagebox('Atencíon','No hay parametro 79')
			return -1
		end if

		ldt_ff=datetime(today())
		SELECT cod_version INTO :ls_fver
		FROM pm_versionfe_dian
		WHERE 
			(((:ldt_ff) between valido_inicio And valido_hasta));
		
		if sqlca.sqlnrows=0 then
			messagebox('Atencíon','No hay version Facturacion Electronica Linea 306')
			return -1
		end if
				
		if ldt_ff>ldt_iniciafevs then
			if g_motor='postgres' then
				dw_electronica.dataobject="dw_factura_electronica_postgres19"
			else
				dw_electronica.dataobject="dw_factura_electronica"
			end if
		else
			if g_motor='postgres' then
				dw_electronica.dataobject="dw_factura_electronica_postgres"
			else
				dw_electronica.dataobject="dw_factura_electronica"
			end if
			
		end if
		dw_electronica.settransobject(sqlca)		

		u_elec=create nvo_factura_electronica
		lst_lle=u_elec.sign_chilkat(dw_electronica,ist_nfactura.ndoc,clugar,ctipo_fac,0,'f','FV')
	end if
	////////ELECTRONICA		
next //k=1 to dw_resumen.rowcount()

dw_factura.setfilter("")
dw_factura.filter()
//////////////// mover kardex  ////////////////////////////////////////////////////////////////
if i_mueve_kardex='1' then
	if i_tipoingreso='1' then
		dw_lote_mov.setfilter('')
		dw_lote_mov.filter()
		long nf,fil_fact
		for k=1 to dw_lote_mov.rowcount()
			fil_fact=dw_factura.find('numero='+string(dw_lote_mov.getitemnumber(k,'item')),1,dw_factura.rowcount())
			if fil_fact=0 then
				Messagebox('Error','No se puede hallar el numero de factura que se le asignó al producto linea 310: '+dw_lote_mov.getitemstring(k,'codarticulo'))
				blanquea()
				return -1
			end if
			nf=dw_factura.getitemnumber(fil_fact,'factu')
			dw_lote_mov.setitem(k,'nfact',nf)
			dw_lote_mov.setitem(k,'item_fc',dw_factura.getitemnumber(fil_fact,'nitem_fac'))
			dw_lote_mov.setitem(k,'tipo_fc',dw_factura.getitemstring(fil_fact,'tipo_fac'))
		next
		if f_crea_entrega()=-1 then
			blanquea()
			return -1
		end if
	end if
end if
// fin mover kardex
long nre,ir,nfr,l_cont,l_nserv,l_sec_can_cit,l_ncita,l_reci,l_item_rec,l_cons_soat,l_nserv_cit,l_nro_insumo,l_norden,l_nitem_ord,l_cantidad
string clug_rec,l_clug_his,l_emp,l_codproc,l_proccups,l_clug_rec,l_clug_soat,l_clug_cita,l_tf
for j=1 to dw_factura.rowcount()//I N T E R F A C E S
	//actualizar nunfact en recibos si este campo (nfact) es nulo :Esto pasa cuando solo se ha hecho un recibo y no se ha facturado
	nre=dw_factura.getitemnumber(j,"nrcaj")
	l_tf=dw_factura.getitemstring(j,"tipo_fac")
	ir=dw_factura.getitemnumber(j,"items")
	clug_rec=dw_factura.getitemstring(j,"clugar_rec")
	if not isnull(nre) and not isnull(ir) then
		setnull(nfr)
		select nfact into :nfr from tesorecajcpo where nrcaj=:nre and clugar=:clug_rec and items=:ir;
		if isnull(nfr) then
			update tesorecajcpo set nfact=:ist_nfactura.ndoc ,clugar_fac=:clugar,tipo_fac=:l_tf where nrcaj=:nre and clugar=:clug_rec and items=:ir;
			if sqlca.sqlcode<>0 then 
				Messagebox("Error en interfaz con recibos de caja linea 340",sqlca.sqlerrtext)
				blanquea()
				return -1
			end if
		end if
	end if
	//fin actualizar nunfact en recibos si este campo (nfact) es nulo
/////////////////////////////	
///////////////////////////////
	l_norden=dw_factura.getitemnumber(j,"norden")
	l_nitem_ord=dw_factura.getitemnumber(j,"nitem_ord")
	l_cont=dw_factura.getitemnumber(j,"contador")
	l_clug_his=dw_factura.getitemstring(j,"clugar_his")
	l_nserv=dw_factura.getitemnumber(j,"nserv")
	l_nserv_cit=dw_factura.getitemnumber(j,"nserv_cita")
	l_sec_can_cit=dw_factura.getitemnumber(j,"sec_cant_cita")
	l_ncita=dw_factura.getitemnumber(j,"ncita")
	l_clug_cita=dw_factura.getitemstring(j,"clug_cita")
	proeq=dw_factura.getitemstring(j,"cproc")
	l_tf=dw_factura.getitemstring(j,"tipo_fac")
	manu=dw_factura.getitemstring(j,"cod_manual")
	pla=dw_factura.getitemstring(j,"plan")
	cempres=dw_factura.getitemstring(j,"cemp")
	ccontrat=dw_factura.getitemstring(j,"ccontrato")
	if not isnull(l_norden) then //se facturo la orden de servicio de Cons. Externa
		nitem_fc=dw_factura.getitemnumber(j,"nitem_fac")
		l_cantidad=dw_factura.getitemnumber(j,"cantidad")
		k=dw_factura.getitemnumber(j,"factu")
		update factcpo set contador=null,clugar_ser=null
		where nitem=:nitem_fc and nfact=:k and tipo=:l_tf;
		if sqlca.sqlcode=-1 then
			messagebox("Error en la interfase con ordenes de Servicio contador linea 371",sqlca.sqlerrtext)
			blanquea()
			return -1
		end if
////  aca verificar
		//update oscuerpo set nfact=:k , clugar_fact=:clugar,tipo_fact=:l_tf,nitem_fact=:nitem_fc,entregada=:l_cantidad
		update oscuerpo set entregada=entregada + :l_cantidad
		where contador=:l_cont and clugar=:l_clug_his and nsolicitud =:l_norden and item=:l_nitem_ord;
		if sqlca.sqlcode=-1 then
			messagebox("Error en la interfase con ordenes de Servicio linea 380",sqlca.sqlerrtext)
			blanquea()
			return -1
		end if
		
		update factcpo set contador_os=:l_cont, clugar_os=:l_clug_his, nsolicitud_os =:l_norden, item_os=:l_nitem_ord
		where nfact=:k and clugar=:clugar and tipo=:l_tf and nitem=:nitem_fc;
		if sqlca.sqlcode=-1 then
			messagebox("Error en la interfase con ordenes de Servicio linea 388",sqlca.sqlerrtext)
			blanquea()
			return -1
		end if
	end if
	if not isnull(l_cont) and not isnull(l_nserv) and isnull(l_norden) then // el servicio del ingreso se facturó ent cambia de estado
		nitem_fc=dw_factura.getitemnumber(j,"nitem_fac")
		k=dw_factura.getitemnumber(j,"factu")
		l_nro_insumo=dw_factura.getitemnumber(j,"nro_insumo")
		setnull(nauto)
		if dw_tip_ingres.getitemstring(1,1)='1' then
			nauto=sle_autoriza.text
		else
			nauto=dw_factura.getitemstring(j,"autoriza")
		end if
		if trim(nauto)="" or nauto="0" then setnull(nauto)
		if not isnull(l_nro_insumo) and l_nro_insumo<>0 then
			update serving_insumo
			set nfactura = :k,nitem_fac=:nitem_fc,clugar_fac=:clugar,tipo_fac=:l_tf
			where contador=:l_cont and nservicio=:l_nserv and clugar=:l_clug_his and nro_insumo=:l_nro_insumo and nfactura is null;
		else
			update serviciosadx 
			set cemp=:cempres, ccontrato=:ccontrat,nfact=:k,nitem=:nitem_fc, clugar_fac = :clugar, tipo_fac = :l_tf, cprocedeq = :proeq, cmanual = :manu, cplan = :pla, autorizacion = :nauto
			from resultadoscpo,serviciosingreso  
			where 
			(((serviciosingreso.contador)=:l_cont) and ((serviciosingreso.nservicio)=:l_nserv) and ((serviciosingreso.clugar)=:l_clug_his) and ((serviciosingreso.nfactura) is null)
				and ((serviciosadx.item = resultadoscpo.item) and (serviciosadx.nrepor = resultadoscpo.nrepor) and (serviciosadx.clugar_res = resultadoscpo.clugar) and (serviciosadx.coddoc = resultadoscpo.coddoc))
				and ((resultadoscpo.nservicio = serviciosingreso.nservicio) and (resultadoscpo.clugar_ser = serviciosingreso.clugar) and (resultadoscpo.contador = serviciosingreso.contador)));
			if sqlca.sqlcode=-1 then
				messagebox("Error en la interfase con servociosadx linea 417",sqlca.sqlerrtext)
				blanquea()
				return -1
			end if
						
			update serviciosingreso 
			set cemp=:cempres , ccontrato=:ccontrat,nfactura = :k,nitem_fac=:nitem_fc,clugar_fac=:clugar,tipo_fac=:l_tf,cprocedeq=:proeq,cmanual=:manu,cplan=:pla ,nautoriza=:nauto
			where contador=:l_cont and nservicio=:l_nserv and clugar=:l_clug_his and nfactura is null;				
		end if
		if sqlca.sqlcode=-1 then
			messagebox("Error en la interfase con serviciosingreso,intente nuevamente linea 427",sqlca.sqlerrtext)
			blanquea()
			return -1
		end if
		IF SQLCA.sqlnrows=0 then
			messagebox("Atención",'Es posible que algunos o todos lo s servicios de este ingreso ya se hayan facturado en otra estación de trabajo. Intente nuevamente')
			blanquea()
			return -1
		end if
		// aqui falta el otro si nservcita y ncita (la cita esta atendida)
		
		// Se actualiza  vacunadosis
		UPDATE VacunaDosis SET Realizado = '2', Nfact = :k, Clugar_Fac =:clugar, Item_fact =:nitem_fc,tipo_fac=:l_tf
		WHERE (((VacunaDosis.contador)=:l_cont ) AND ((VacunaDosis.clugar_his)=:l_clug_his) AND ((VacunaDosis.nservicio)=:l_nserv)) and (VacunaDosis.Nfact Is Null);
		if sqlca.sqlcode=-1 then
			messagebox("Error en la interfase con Vacunadosis,intente nuevamente linea 442",sqlca.sqlerrtext)
			blanquea()
			return -1
		end if

	end if
	if not isnull(l_nserv_cit) and not isnull(l_ncita) then // la cita se facturó
		k=dw_factura.getitemnumber(j,"factu")
		l=dw_factura.getitemnumber(j,"nitem_fac")
		long item_r
		if isnull(i_nrecibo) then
			setnull(item_r)
		else
			item_r=j
		end if
		if dw_rec_caj_cab.rowcount()=0 then 
			setnull(i_nrecibo) //para que si se debe actualizar serciosturno, serciosturno.nrcaj=null
			setnull(clug_rec)
		else
			clug_rec=clugar
		end if
		if isnull(l_sec_can_cit) then
			//esto ya no va porque cuando se hace un recibo en facturacion no llena tesoredetalle
			//, serciosturno.nrcaj=:i_nrecibo ,clugar_rec=:clug_rec,serciosturno.items=:item_r
			update serciosturno set nfact = :k ,clugar_fac=:clugar, nitem = :l  ,tipo_fac=:l_tf
			where serciosturno.ncita=:l_ncita and serciosturno.clugar=:l_clug_cita and serciosturno.nservicio=:l_nserv_cit and serciosturno.nfact is null and serciosturno.nitem is null;// and serciosturno.fecha=:fecha_cita and serciosturno.hora = :hora_cita ;
		else
			update serciosturno set nfact = :k ,clugar_fac=:clugar, nitem = :l  ,tipo_fac=:l_tf
			where serciosturno.ncita=:l_ncita and  serciosturno.clugar=:l_clug_cita and serciosturno.nservicio=:l_nserv_cit and serciosturno.nfact is null and serciosturno.nitem is null and serciosturno.sec_cant=:l_sec_can_cit;
		end if
		if sqlca.sqlcode<>0 then
			messagebox("Error en la interfase con Servicios Turno,intente nuevamente linea 473",sqlca.sqlerrtext)
			blanquea()
			return -1
		end if
		cempres=dw_factura.getitemstring(j,"cemp")
		ccontrat=dw_factura.getitemstring(j,"ccontrato")
		
		update citasasig set codemp=:cempres,ccontrato=:ccontrat
		from serciosturno 
		where 
			((serciosturno.ncita=:l_ncita) and  (serciosturno.clugar=:l_clug_cita) 
			and (citasasig.CLUGAR = serciosturno.CLUGAR) AND (citasasig.NCITA = serciosturno.NCITA)
			and citasasig.codemp<>:cempres);
		if sqlca.sqlcode<>0 then
			messagebox("Error en la interfase con citasasig,intente nuevamente linea 487",sqlca.sqlerrtext)
			blanquea()
			return -1
		end if
		
		int ki=0
		dw_odo_cita.retrieve(l_ncita,l_clug_cita,l_nserv_cit)
		if dw_odo_cita.rowcount()>0 then
			for ki=1 to dw_odo_cita.rowcount()
				ntrata=dw_odo_cita.getitemnumber(ki,'ntratamiento')
				clug_trat=dw_odo_cita.getitemstring(ki,'clugar_tto')
				item_trat=dw_odo_cita.getitemnumber(ki,'item_tto')
				UPDATE odontratacpo SET Nfact = :k , Clugar_Fac = :clugar, Item_fac =  :l , tipo_fac=:l_tf
				WHERE (((odontratacpo.ntratamiento)=:ntrata) AND ((odontratacpo.clugar)=:clug_trat) AND ((odontratacpo.item)=:item_trat));
				if sqlca.sqlcode<>0 then
					messagebox("Error en la interfase con Odontotratamiento,intente nuevamente linea 502",sqlca.sqlerrtext)
					blanquea()
					return -1
				end if
			next
		end if
	end if // FIN la cita se facturó
	//T R A T A M I E N T O S   O D O N T O L O G I C O S
	if not isnull(dw_factura.getitemnumber(j,'ntrata')) then
		long nabo
		dec val_abon
		string clug_abo
		k=dw_factura.getitemnumber(j,"factu")
		l=dw_factura.getitemnumber(j,"nitem_fac")
		if dw_factura.getitemstring(j,'cproc')<>'ABONOS' then
			ntrata=dw_factura.getitemnumber(j,'ntrata')
			item_trat=dw_factura.getitemnumber(j,'item_trat')
			clug_trat=dw_factura.getitemstring(j,'clug_trat')
			update odontratacpo set nfact=:k,item_fac=:l,clugar_fac=:clugar, tipo_fac=:l_tf where 
			ntratamiento=:ntrata and clugar=:clug_trat and item=:item_trat;
			if sqlca.sqlcode<>0 then
				messagebox("Error en la interfase con OdonTrataCpo,intente nuevamente linea 523",sqlca.sqlerrtext)
				blanquea()
				return -1
			end if
			UPDATE SerciosTurno SET NFact = :k, clugar_fac =:clugar, NItem = :l ,tipo_fac=:l_tf
			WHERE (((SerciosTurno.ntratamiento)=:ntrata) AND ((SerciosTurno.clugar_tto)=:clug_trat) AND ((SerciosTurno.item_tto)=:item_trat));
			if sqlca.sqlcode<>0 then
				messagebox("Error en la interfase con SerciosTurno Odontologia,intente nuevamente linea 530",sqlca.sqlerrtext)
				blanquea()
				return -1
			end if
		else
			nabo=dw_factura.getitemnumber(j,"item_trat")		//aqui quedó el dato del nro abono
			clug_abo=dw_factura.getitemstring(j,"clug_trat")//aqui quedó el dato del clug abono
			val_abon=-dw_factura.getitemnumber(j,"vt_proc")
			update tesoabono set gastado=gastado + :val_abon where 
			nabono=:nabo and clugar=:clug_abo;
			if sqlca.sqlcode<>0 then
				messagebox("Error en la interfase con TesoAbono,intente nuevamente linea 541",sqlca.sqlerrtext)
				blanquea()
				return -1
			end if
			for k=1 to dw_resumen.rowcount()
				if dw_resumen.getitemnumber(k,'lleva_abon')>=dw_resumen.getitemnumber(k,'vtabon') then continue
				dw_rela_abon.insertrow(1)
				dw_rela_abon.setitem(1,'nabono',nabo)
				dw_rela_abon.setitem(1,'clugar_abo',clug_abo)
				dw_rela_abon.setitem(1,'nfact',ldb_facturas[k])
				dw_rela_abon.setitem(1,'clugar_fact',clugar)
				dw_rela_abon.setitem(1,'tipo_fact',ls_tipos_fac[k])
				if dw_resumen.getitemnumber(k,'vtabon')>=val_abon then
					dw_rela_abon.setitem(1,'valor',val_abon)
					dw_resumen.setitem(k,'lleva_abon',dw_resumen.getitemnumber(k,'lleva_abon') + val_abon)
					exit
				else
					dw_rela_abon.setitem(1,'valor',dw_resumen.getitemnumber(k,'vtabon'))
					dw_resumen.setitem(k,'lleva_abon',dw_resumen.getitemnumber(k,'lleva_abon') + dw_resumen.getitemnumber(k,'vtabon'))
					val_abon -= dw_resumen.getitemnumber(k,'vtabon')
				end if
			next
		end if
	end if //F I N  T R A T A M I E N T O S   O D O N T O L O G I C O S
next
if dw_rela_abon.update()=-1 then
	blanquea()
	return -1
end if
if i_tipoingreso<>"1" then
	boolean pedir
	string cemp,ccont,tcontra,tingre,c_acti,ls_estado
	dw_factadm.reset()
	for j=1 to dw_admis.rowcount()
		setnull(c_acti)
		nh=dw_admis.getitemnumber(j,'nh')
		clug_adm=dw_admis.getitemstring(j,'clugar_ingre')
		tingre=dw_admis.getitemstring(j,'codtingre')
		ls_estado=dw_admis.getitemstring(j,'estado')
		pedir=false
		for k=1 to dw_fact_cab.rowcount()
			dw_factadm.insertrow(1)
			dw_factadm.setitem(1,'nfact',dw_fact_cab.getitemnumber(k,"nfact"))
			dw_factadm.setitem(1,'clugar',dw_fact_cab.getitemstring(k,"clugar"))
			dw_factadm.setitem(1,'tipo',dw_fact_cab.getitemstring(k,"tipo"))		
			dw_factadm.setitem(1,'nh',nh)
			dw_factadm.setitem(1,'clugar_ingre',clug_adm)
			dw_factadm.setitem(1,'codtingre',dw_admis.getitemstring(j,'codtingre'))
			cemp=dw_fact_cab.getitemstring(k,'cemp')
			ccont=dw_fact_cab.getitemstring(k,'ccontrato')
			select ctcontra into :tcontra from contratos where codemp =:cemp and codcontrato=:ccont;
			if sqlca.sqlcode=-1 then
				messagebox("Error leyendo de Contratos linea 593",sqlca.sqlerrtext)
				blanquea()
				return -1
			end if
			if tcontra='3' then pedir=true
		next
		if pedir then
			if tingre='2' then
				openwithparm(w_cual_tot,'U')
			elseif tingre='3' then
				openwithparm(w_cual_tot,'E')
			end if
			if message.stringparm<>'' then c_acti=message.stringparm
		end if
		///aca
		
		if ((f_scerr='0' or f_scerr='1')  and ls_estado='2') then
			update hospadmi set estado='3',cod_activid=:c_acti where nh=:nh and clugar=:clug_adm;
			if sqlca.sqlcode<>0 then
				messagebox("Error actualizando estado de Admisión linea 612",sqlca.sqlerrtext)
				blanquea()
				return -1
			end if
		end if
	next
	if dw_factadm.update()=-1 then
		blanquea()
		return -1
	end if
	dw_tip_ingres.setitem(1,1,"1")
	dw_tip_ingres.accepttext()
	i_tipoingreso="1"
end if
string em,ct,clug_soat,clug_fac
long cons_soat,fac,vem
datetime fech
for j=1 to dw_acum_soat.rowcount()
	l_emp=dw_acum_soat.getitemstring(j,"emp")
	ct=dw_acum_soat.getitemstring(j,"cont")
	clug_soat=dw_acum_soat.getitemstring(j,"clug_soat")
	cons_soat=dw_acum_soat.getitemnumber(j,"consec")
	k=dw_fact_cab.find("cemp='"+l_emp+"' and ccontrato='"+ct+"'",1,dw_fact_cab.rowcount())
	if k<>0 then
		dw_acum_soat.setitem(j,"acum",dw_acum_soat.getitemnumber(j,"acum")+dw_acum_soat.getitemnumber(j,"lleva"))
		fac=dw_fact_cab.getitemnumber(k,"nfact")
		clug_fac=dw_fact_cab.getitemstring(k,"clugar")
		l_tf=dw_fact_cab.getitemstring(k,"tipo")
		vem=dw_fact_cab.getitemnumber(k,"vtemp")
		fech=dw_fact_cab.getitemdatetime(k,"fecha")
		long item=0
		select max(item) into :item from acumdeta where consecutivo=:cons_soat and clugar=:clug_soat;
		if sqlca.sqlcode<>0 then
			messagebox("Error leyendo de acumdeta",sqlca.sqlerrtext)
			blanquea()
			return -1
		end if
		if isnull(item) then item=0
		item++
		insert into acumdeta (consecutivo,clugar,item,nfact,clugar_fac,tipo_fac,fechafact,valor) values (:cons_soat,:clug_soat,:item,:fac,:clug_fac,:l_tf,:fech,:vem);
		if sqlca.sqlcode<>0 then
			messagebox("Error insertando en AcumDeta linea 653",sqlca.sqlerrtext)
			blanquea()
			return -1
		end if
	end if
next
actualiza=dw_acum_soat.update()
if isnull(actualiza) or actualiza=-1 then
	blanquea()
	return -1
end if
commit;

if cbx_1.checked then
	any parf[4]
	for k=1 to dw_resumen.rowcount()
		parf[1]=ldb_facturas[k]
		parf[2]=dw_resumen.getitemstring(k,"imp_cita")
		parf[3]=clugar
		parf[4]=dw_resumen.getitemstring(k,"tipo_fac")
		if parf[4]='F' then 
			pb_factu.imprimir(parf,'','0')
		end if
		if parf[4]='C' then 
			pb_faccon.imprimir(parf,'','0')
		end if
	next
end if

if cbx_2.checked then
  	any parr[3]
	for k=1 to dw_resumen.rowcount()	
		if UpperBound(ldb_recibos)>0 then
			if ldb_recibos[k]=0 then continue
			parr[1]=ldb_recibos[k]
			parr[2]=clugar
			parr[3]='1'
			pb_reci.imprimir(parr,'','0')
			Messagebox("Recibo generado con éxito","Número de Recibo: "+string(ldb_recibos[k]))
		end if
	next
end if
if dw_resumen.rowcount()=1 then
	Messagebox("Factura generada con éxito","Número de factura: "+string(ist_nfactura.ndoc))
else
	messagebox("Se generaron varias facturas","Número de facturas: "+string(dw_resumen.rowcount()))
end if
string captu_rip
if ls_pro=32 THEN	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "RIPS_AL_FACTURAR", Regstring!, captu_rip)
if ls_pro=64 THEN	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "RIPS_AL_FACTURAR", Regstring!, captu_rip)
if i_tipoingreso='1' and captu_rip='1' then
	st_factus st
	int li_lk
	
	st.desde=ldb_facturas[1]
	st.tipo1=ls_tipos_fac[1]
	for li_lk=1 to UpperBound(ls_tipos_fac)
		if st.tipo1<>ls_tipos_fac[li_lk] then
			st.tipo2=ls_tipos_fac[li_lk]
		else
			st.tipo2=st.tipo1
		end if
	next
	st.hasta=ldb_facturas[dw_resumen.rowcount()]
	openwithparm(w_captur_rip_fac,st)
end if
sle_autoriza.text=""
blanquea()
i_reviso_multiples=false
dw_rec_caj_cab.visible=false
dw_forma_pago.visible=false
pb_pagares.visible=false
pb_pagares.enabled=false
pb_calcula.visible=false
pb_calcula.enabled=false
pb_paci.enabled=true
pb_emp.enabled=true
setnull(i_profe)
i_tipo_prof=''
setnull(i_profe_ord)
if w_principal.dw_1.getitemstring(1,1)<>tipdoc or w_principal.dw_1.getitemstring(1,2)<>docu then 
	w_principal.dw_1.setcolumn(2)
	w_principal.dw_1.triggerevent(itemchanged!)
end if
i_comprobo=0
i_confirma_ge="si"  //para lo de confirmar grupo etareo
if isvalid(w_admision) then w_admision.dw_tingres.triggerevent(itemchanged!)
if isvalid(w_new_at_os) then w_new_at_os.dw_historial.triggerevent(rowfocuschanged!)
if isvalid(w_entrega_med) then w_entrega_med.dw_historial.triggerevent(rowfocuschanged!)
return 1
end function

public subroutine blanquea ();dw_fact_cab.reset()
dw_fact_cpo.reset()
dw_fact_subcpo.reset()
dw_reccaj_cpo.reset()
dw_factura.setfilter("")
dw_factura.filter()
dw_factura.setredraw(true)
dw_factura.reset()
dw_factura_cpo.reset()
dw_resumen.reset()
dw_rec_caj_cab.reset()
dw_acum_soat.reset()
dw_factadm.reset()
dw_admis.reset()
dw_memory.reset()
dw_lote_mov.reset()
dw_kardexdeta.reset()
dw_rela_abon.reset()
dw_dx.reset()
resumen('')
cbx_4.checked=false
cbx_4.visible=false
pb_pagare.visible=false
dw_dx.visible=false
end subroutine

public function integer encuestar ();uo_datastore dw_ti
st_anula st_p
long f, acum
dw_ti = Create uo_datastore
dw_ti.DataObject = 'dw_plant_tingre'
dw_ti.SetTransObject(SQLCA)

dw_ti.Retrieve()
f = dw_ti.Find("codtingre='"+i_tipoingreso+"' and clugar='"+clugar+"'",1,dw_ti.RowCount())
if f > 0 then
	acum = dw_ti.GetItemNumber(f,'acumulado')
	if isNull(acum) then acum = 0
	dw_ti.SetItem(f,'acumulado', acum + 1)
	if dw_ti.GetItemNumber(f,'a_cuantos') = dw_ti.GetItemNumber(f,'acumulado') then
		dw_ti.SetItem(f,'acumulado', 0)
		st_p.de_donde = dw_ti.GetItemString(f,'codplantilla')
		st_p.nfact = ist_nfactura.ndoc
		st_p.clugar_fac = clugar
		openwithparm(w_tabulacion_encuentas,st_p)
	end if
	if dw_ti.Update() = -1 then
		Rollback;
		MessageBox('Error','No fué posible guardar el conteo para emitir encuestas')
		Return -1
	end if
	commit;
end if
Return 0

end function

on w_factura.create
int iCurrent
call super::create
this.dw_fact_subcpo=create dw_fact_subcpo
this.dw_fact_cab=create dw_fact_cab
this.dw_fact_cpo=create dw_fact_cpo
this.dw_rela_abon=create dw_rela_abon
this.dw_odo_cita=create dw_odo_cita
this.dw_electronica=create dw_electronica
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_fact_subcpo
this.Control[iCurrent+2]=this.dw_fact_cab
this.Control[iCurrent+3]=this.dw_fact_cpo
this.Control[iCurrent+4]=this.dw_rela_abon
this.Control[iCurrent+5]=this.dw_odo_cita
this.Control[iCurrent+6]=this.dw_electronica
this.Control[iCurrent+7]=this.cb_2
end on

on w_factura.destroy
call super::destroy
destroy(this.dw_fact_subcpo)
destroy(this.dw_fact_cab)
destroy(this.dw_fact_cpo)
destroy(this.dw_rela_abon)
destroy(this.dw_odo_cita)
destroy(this.dw_electronica)
destroy(this.cb_2)
end on

type dw_dx from w_factura_base`dw_dx within w_factura
integer x = 2999
integer y = 664
integer height = 164
string title = ""
end type

type pb_dx from w_factura_base`pb_dx within w_factura
end type

type sle_siras from w_factura_base`sle_siras within w_factura
integer x = 4398
integer y = 320
end type

type ddlb_archivos from w_factura_base`ddlb_archivos within w_factura
integer y = 192
end type

type dw_his_acu from w_factura_base`dw_his_acu within w_factura
integer x = 5513
integer y = 192
end type

type pb_aut_cc from w_factura_base`pb_aut_cc within w_factura
integer y = 596
end type

type dw_kardexdeta from w_factura_base`dw_kardexdeta within w_factura
integer x = 5682
integer y = 416
end type

type dw_lote_mov from w_factura_base`dw_lote_mov within w_factura
integer y = 392
end type

type pb_reci from w_factura_base`pb_reci within w_factura
integer y = 492
end type

type pb_factu from w_factura_base`pb_factu within w_factura
integer x = 4128
string cod_rep = "FV"
end type

type dw_factadm from w_factura_base`dw_factadm within w_factura
integer x = 5481
integer y = 424
end type

type dw_admis from w_factura_base`dw_admis within w_factura
integer x = 5376
integer y = 472
end type

type st_ayuda from w_factura_base`st_ayuda within w_factura
end type

type pb_kit from w_factura_base`pb_kit within w_factura
integer y = 472
end type

type cbx_equiv from w_factura_base`cbx_equiv within w_factura
integer y = 660
integer height = 56
end type

type cbx_3 from w_factura_base`cbx_3 within w_factura
integer y = 660
end type

type st_cuant from w_factura_base`st_cuant within w_factura
integer x = 2587
integer y = 732
integer width = 384
end type

type cbx_2 from w_factura_base`cbx_2 within w_factura
integer y = 484
integer height = 68
end type

type cbx_1 from w_factura_base`cbx_1 within w_factura
end type

type pb_req_cont from w_factura_base`pb_req_cont within w_factura
end type

type dw_segrespon from w_factura_base`dw_segrespon within w_factura
integer x = 5979
integer y = 324
end type

type sle_proc from w_factura_base`sle_proc within w_factura
end type

type gb_5 from w_factura_base`gb_5 within w_factura
integer x = 891
integer width = 1051
end type

type st_4 from w_factura_base`st_4 within w_factura
integer y = 732
end type

type st_3 from w_factura_base`st_3 within w_factura
integer x = 4087
integer y = 244
integer width = 306
end type

type sle_autoriza from w_factura_base`sle_autoriza within w_factura
integer x = 4398
integer y = 236
integer width = 1015
end type

type pb_borra from w_factura_base`pb_borra within w_factura
integer y = 472
end type

type dw_getareo from w_factura_base`dw_getareo within w_factura
integer x = 5687
integer y = 360
end type

type dw_equiv from w_factura_base`dw_equiv within w_factura
integer x = 5394
integer y = 228
end type

type st_2 from w_factura_base`st_2 within w_factura
integer x = 4087
integer y = 160
integer width = 306
end type

type st_1 from w_factura_base`st_1 within w_factura
integer x = 4087
integer y = 80
end type

type sle_poliza from w_factura_base`sle_poliza within w_factura
integer x = 4398
integer y = 152
integer width = 1015
end type

type dw_tarifas from w_factura_base`dw_tarifas within w_factura
integer x = 5390
integer y = 160
end type

type dw_cont_det from w_factura_base`dw_cont_det within w_factura
integer x = 2981
integer y = 2392
integer width = 82
integer height = 112
boolean hscrollbar = true
boolean vscrollbar = true
end type

type pb_buscar from w_factura_base`pb_buscar within w_factura
integer y = 472
end type

type dw_tip_ingres from w_factura_base`dw_tip_ingres within w_factura
integer x = 4389
integer y = 72
end type

type dw_resumen from w_factura_base`dw_resumen within w_factura
integer y = 1896
integer width = 5618
integer height = 412
end type

type dw_forma_pago from w_factura_base`dw_forma_pago within w_factura
integer x = 2190
integer y = 476
integer width = 594
integer height = 132
end type

type pb_soat from w_factura_base`pb_soat within w_factura
integer x = 3767
integer y = 44
end type

type gb_1 from w_factura_base`gb_1 within w_factura
integer x = 4059
integer y = 20
integer width = 1417
integer height = 400
string text = "Generalidades Modulo de Facturación"
end type

type gb_2 from w_factura_base`gb_2 within w_factura
integer x = 1961
integer width = 2066
end type

type gb_3 from w_factura_base`gb_3 within w_factura
integer width = 855
end type

type pb_facturar from w_factura_base`pb_facturar within w_factura
integer x = 1641
boolean originalsize = false
end type

event pb_facturar::clicked;call super::clicked;Super::EVENT Clicked()
long f
f = AncestorReturnValue
if f = 0 then
	encuestar()
end if

end event

type pb_paci from w_factura_base`pb_paci within w_factura
end type

event pb_paci::clicked;call super::clicked;f_abrir_pendientes()
end event

type pb_emp from w_factura_base`pb_emp within w_factura
end type

type pb_reimprimir from w_factura_base`pb_reimprimir within w_factura
end type

event pb_reimprimir::clicked;call super::clicked;openwithparm(w_busca_fact,'factu')
end event

type pb_calcula from w_factura_base`pb_calcula within w_factura
integer x = 1787
boolean originalsize = false
end type

type dw_factura_cpo from w_factura_base`dw_factura_cpo within w_factura
integer x = 5755
integer y = 624
end type

type st_5 from w_factura_base`st_5 within w_factura
integer y = 732
integer width = 2153
end type

type dw_rec_caj_cab from w_factura_base`dw_rec_caj_cab within w_factura
integer height = 128
end type

type pb_pagare from w_factura_base`pb_pagare within w_factura
integer x = 4133
integer y = 564
end type

type pb_parcial from w_factura_base`pb_parcial within w_factura
integer x = 41
integer y = 1928
end type

type dw_memory from w_factura_base`dw_memory within w_factura
integer y = 32
end type

type dw_acum_soat from w_factura_base`dw_acum_soat within w_factura
boolean visible = false
integer x = 5513
integer y = 60
boolean enabled = false
end type

type dw_factura from w_factura_base`dw_factura within w_factura
integer y = 836
integer height = 1048
end type

type pb_faccon from w_factura_base`pb_faccon within w_factura
boolean visible = false
integer x = 4215
integer y = 344
end type

type dw_emppac from w_factura_base`dw_emppac within w_factura
integer width = 3680
end type

type gb_6 from w_factura_base`gb_6 within w_factura
integer width = 3744
integer height = 416
end type

type st_siras from w_factura_base`st_siras within w_factura
integer x = 4087
integer y = 324
integer width = 306
end type

type cbx_4 from w_factura_base`cbx_4 within w_factura
integer y = 556
end type

type pb_pagares from w_factura_base`pb_pagares within w_factura
end type

type dw_reccaj_cpo from w_factura_base`dw_reccaj_cpo within w_factura
end type

type gb_4 from w_factura_base`gb_4 within w_factura
end type

type dw_fact_subcpo from datawindow within w_factura
boolean visible = false
integer x = 265
integer y = 2380
integer width = 489
integer height = 96
integer taborder = 240
boolean bringtotop = true
boolean enabled = false
boolean titlebar = true
string title = "dw_fact_subcpo"
string dataobject = "dw_fact_subcpo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_fact_cab from datawindow within w_factura
boolean visible = false
integer x = 759
integer y = 2384
integer width = 366
integer height = 92
integer taborder = 250
boolean bringtotop = true
boolean enabled = false
boolean titlebar = true
string title = "dw_factcab"
string dataobject = "dw_factcab"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_fact_cpo from datawindow within w_factura
boolean visible = false
integer x = 1129
integer y = 2388
integer width = 402
integer height = 96
integer taborder = 260
boolean bringtotop = true
boolean enabled = false
boolean titlebar = true
string title = "dw_fact_cpo"
string dataobject = "dw_fact_cpo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_rela_abon from datawindow within w_factura
boolean visible = false
integer x = 1545
integer y = 2388
integer width = 686
integer height = 96
integer taborder = 270
boolean bringtotop = true
boolean titlebar = true
string title = "dw_rela_abon"
string dataobject = "dw_rela_abons"
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

type dw_odo_cita from datawindow within w_factura
boolean visible = false
integer x = 2258
integer y = 2384
integer width = 686
integer height = 96
integer taborder = 270
boolean bringtotop = true
boolean titlebar = true
string title = "dw_rela_abon"
string dataobject = "dw_citas_odon_tto"
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

type dw_electronica from uo_datawindow within w_factura
boolean visible = false
integer x = 5531
integer y = 288
integer width = 201
integer height = 84
integer taborder = 90
boolean bringtotop = true
string dataobject = "dw_factura_electronica_postgres"
end type

type cb_2 from commandbutton within w_factura
boolean visible = false
integer x = 4507
integer y = 380
integer width = 233
integer height = 92
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "none"
end type

event clicked;nvo_mipres u_mipres
string r_token
u_mipres= create nvo_mipres

r_token=u_mipres.get_token_mipres('800193989','04E96D14-3646-4D44-AD14-5D7EFCCB9D33')


integer li_rc
oleobject loo_Rest
integer li_Success
integer li_BTls
integer li_Port
integer li_BAutoReconnect
oleobject loo_SbResponseBody
oleobject loo_JsonResponse
integer li_RespStatusCode

loo_Rest = create oleobject
li_rc = loo_Rest.ConnectToNewObject("Chilkat_9_5_0.Rest")
if li_rc < 0 then
    destroy loo_Rest
    MessageBox("Error","Connecting to COM object failed")
    return
end if

li_BTls = 1
li_Port = 443
li_BAutoReconnect = 1
li_Success = loo_Rest.Connect("wsmipres.sispro.gov.co",li_Port,li_BTls,li_BAutoReconnect)
if li_Success <> 1 then
//    Write-Debug "ConnectFailReason: " + string(loo_Rest.ConnectFailReason)
//    Write-Debug loo_Rest.LastErrorText
    destroy loo_Rest
    return
end if

loo_Rest.AddHeader("Accept","application/json")
loo_SbResponseBody = create oleobject
li_rc = loo_SbResponseBody.ConnectToNewObject("Chilkat_9_5_0.StringBuilder")

li_Success = loo_Rest.FullRequestNoBodySb("GET","/WSMIPRESNOPBS/api/Prescripcion/800193989/2021-05-15/962DFF96-E565-4601-8A7A-E9CCA6DD8092",loo_SbResponseBody)
if li_Success <> 1 then
//    Write-Debug loo_Rest.LastErrorText
    destroy loo_Rest
    destroy loo_SbResponseBody
    return
end if

li_RespStatusCode = loo_Rest.ResponseStatusCode
messagebox("response status code = ",string(li_RespStatusCode))
if li_RespStatusCode >= 400 then
//    Write-Debug "Response Status Code = " + string(li_RespStatusCode)
//    Write-Debug "Response Header:"
//    Write-Debug loo_Rest.ResponseHeader
//    Write-Debug "Response Body:"
//    Write-Debug loo_SbResponseBody.GetAsString()
    destroy loo_Rest
    destroy loo_SbResponseBody
    return
end if

loo_JsonResponse = create oleobject
li_rc = loo_JsonResponse.ConnectToNewObject("Chilkat_9_5_0.JsonObject")
loo_JsonResponse.LoadSb(loo_SbResponseBody)

loo_JsonResponse.EmitCompact = 0
messagebox('', string(loo_JsonResponse.Emit()))



// ls_result = json.loadstring( ls_string )  
// ll_root = json.getrootitem( )  
// ll_count = json.getchildcount( ll_root )  
// dw_1.Reset()  
// for ll_index = 1 to ll_count  
//     ll_row = dw_1.InsertRow(0)  
//     ll_child = json.getchilditem( ll_root, ll_index )  
//     ll_id = json.getitemnumber( ll_child, "id" )  
//     dw_1.setItem(ll_row, "id", ll_id)  
//     ll_userid = json.getitemnumber( ll_child, "userid" )  
//     dw_1.setItem(ll_row, "userid", ll_userid)  
//     ls_title = json.getitemstring( ll_child, "title")  
//     dw_1.setItem(ll_row, "title", ls_title)  
//     ls_body = json.getitemstring( ll_child, "body")  
//     dw_1.setItem(ll_row, "body", ls_body)  
// next  
//

destroy loo_Rest
destroy loo_SbResponseBody
destroy loo_JsonResponse
end event

