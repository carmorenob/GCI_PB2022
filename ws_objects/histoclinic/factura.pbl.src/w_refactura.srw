$PBExportHeader$w_refactura.srw
forward
global type w_refactura from w_factura_base
end type
type dw_serv_nofactu from datawindow within w_refactura
end type
type pb_1 from picturebutton within w_refactura
end type
type pb_3 from picturebutton within w_refactura
end type
type st_6 from statictext within w_refactura
end type
type st_7 from statictext within w_refactura
end type
type pb_2 from picturebutton within w_refactura
end type
type dw_fact_cab from datawindow within w_refactura
end type
type dw_fact_cpo from datawindow within w_refactura
end type
type dw_fact_subcpo from datawindow within w_refactura
end type
type dw_news from datawindow within w_refactura
end type
end forward

global type w_refactura from w_factura_base
integer width = 5829
integer height = 2488
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
boolean center = true
string i_cdoc = "FC"
dw_serv_nofactu dw_serv_nofactu
pb_1 pb_1
pb_3 pb_3
st_6 st_6
st_7 st_7
pb_2 pb_2
dw_fact_cab dw_fact_cab
dw_fact_cpo dw_fact_cpo
dw_fact_subcpo dw_fact_subcpo
dw_news dw_news
end type
global w_refactura w_refactura

type variables
datawindow i_dw
end variables

forward prototypes
public function long factura ()
public subroutine blanquea ()
end prototypes

public function long factura ();long j,donde,k,l,facturas[],npagare,nitem_fc,actualiza,abonos
string ya_recibo,proeq,manu,pla,cempres,ccontrat,tipo_fac[]
ya_recibo="no"
if f_catastrofe()=-1 then return -1
if i_tipoingreso='1' and i_pideprof='1' and (i_profe='' or i_tipo_prof<>'2') then
	openwithparm(w_escog_profe,'fac')
	i_profe=message.stringparm
	if i_profe='' or isnull(i_profe) then return -1
end if
long nh,factus
string clug_adm,ctipo_fac

dec lleva,hasta,mas
for k=1 to dw_resumen.rowcount()
	cempres=dw_resumen.getitemstring(k,"cemp")
	ccontrat=dw_resumen.getitemstring(k,"ccont")
	ctipo_fac=dw_resumen.getitemstring(k,"tipo_fac")
	select monto_hasta,acumulado into :hasta,:lleva from contratos 
	where codemp =:cempres and codcontrato=:ccontrat;
	if sqlca.sqlcode=-1 then
		Messagebox("Error leyendo Contratos para actualizar Montos",sqlca.sqlerrtext)
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
			Messagebox("Error Actualizando los montos de Contratos",sqlca.sqlerrtext)
			blanquea()
			return -1
		end if
	end if
	dw_factura.setfilter("cemp='"+cempres+"'and ccontrato='"+ccontrat+"'")
	dw_factura.filter()
	dw_fact_cab.insertrow(1)
	dw_fact_cab.setitem(1,"fecha",datetime(today()))
	dw_fact_cab.setitem(1,"hora",datetime(today(),time(string(now()))))
	dw_fact_cab.setitem(1,"numeropoliza",sle_poliza.text)
	dw_fact_cab.setitem(1,"cemp",cempres)
	dw_fact_cab.setitem(1,"ccontrato",ccontrat)
	if isnull(i_profe) or i_profe='' then setnull(i_profe)	
	dw_fact_cab.setitem(1,"codprof",i_profe)
	if isnull(i_profe_ord) or i_profe_ord='' then setnull(i_profe_ord)
	dw_fact_cab.setitem(1,"cprof_ordena",i_profe_ord)
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
	dw_fact_cab.setitem(1,"tproced",dw_resumen.getitemnumber(k,"tcant"))  //listo fact_cab
	dw_fact_cab.setitem(1,"tipo",ctipo_fac)
	if ctipo_fac='C' then i_cdoc='FC'
	if ctipo_fac='F' then  i_cdoc='FV'
	ist_nfactura=f_trae_factura(i_cdoc,clugar,'Factura')
	if ist_nfactura.ndoc=-1 then 
		blanquea()
		return -1
	end if

	dw_fact_cab.setitem(1,"nfact",ist_nfactura.ndoc)
	dw_fact_cab.setitem(1,"c_aut",ist_nfactura.c_aut)
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
		dw_fact_cpo.setitem(donde,"nrcaj",dw_factura.getitemnumber(j,"nrcaj"))
		dw_fact_cpo.setitem(donde,"clugar_rec",dw_factura.getitemstring(j,"clugar_rec"))
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
	actualiza=dw_fact_cpo.update()
	if actualiza=-1 or isnull(actualiza) then
		blanquea()
		return -1
	end if
	//// NUEVO
	actualiza=dw_his_acu.update()
	if actualiza=-1 or isnull(actualiza) then 
		dw_his_acu.deleterow(1)
		dw_his_acu.resetupdate()
		blanquea()
		return -1
	end if
	
	actualiza=dw_fact_subcpo.update()
	if isnull(actualiza) or actualiza=-1 then
		blanquea()
		return -1
	end if
	facturas[k]=ist_nfactura.ndoc
	tipo_fac[k]=ctipo_fac
next //k=1 to dw_resumen.rowcount()
dw_factura.setfilter("")
dw_factura.filter()
//////////////// mover kardex  ////////////////////////////////////////////////////////////////
//if i_mueve_kardex='1' then
//	if i_tipoingreso='1' then
//		dw_lote_mov.setfilter('')
//		dw_lote_mov.filter()
//		long nf,fil_fact
//		for k=1 to dw_lote_mov.rowcount()
//			fil_fact=dw_factura.find('numero='+string(dw_lote_mov.getitemnumber(k,'item')),1,dw_factura.rowcount())
//			if fil_fact=0 then
//				Messagebox('Error','No se puede hallar el numero de factura que se le asignó al producto: '+dw_lote_mov.getitemstring(k,'codarticulo'))
//				blanquea()
//				return -1
//			end if
//			nf=dw_factura.getitemnumber(fil_fact,'factu')
//			dw_lote_mov.setitem(k,'nfact',nf)
//			dw_lote_mov.setitem(k,'item_fc',dw_factura.getitemnumber(fil_fact,'nitem_fac'))
//		next
//		if f_crea_entrega()=-1 then
//			blanquea()
//			return -1
//		end if
//	end if
//end if
//// fin mover kardex
long nre,ir,nfr,l_cont,l_nserv,l_sec_can_cit,l_ncita,l_reci,l_item_rec,l_cons_soat,l_nserv_cit,l_nro_insumo,l_norden,l_nitem_ord
string clug_rec,l_clug_his,l_emp,l_codproc,l_proccups,l_clug_rec,l_clug_soat,l_clug_cita
for j=1 to dw_factura.rowcount()//I N T E R F A C E S
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
	manu=dw_factura.getitemstring(j,"cod_manual")
	pla=dw_factura.getitemstring(j,"plan")
	cempres=dw_factura.getitemstring(j,"cemp")
	ccontrat=dw_factura.getitemstring(j,"ccontrato")

	if not isnull(l_cont) and not isnull(l_nserv) and isnull(l_norden) then // el servicio del ingreso se facturó ent cambia de estado
		nitem_fc=dw_factura.getitemnumber(j,"nitem_fac")
		k=dw_factura.getitemnumber(j,"factu")
		l_nro_insumo=dw_factura.getitemnumber(j,"nro_insumo")
		if not isnull(l_nro_insumo) and l_nro_insumo<>0 then
			update serving_insumo
			set nfactura = :k,nitem_fac=:nitem_fc,clugar_fac=:clugar,tipo_fact=:ctipo_fac
			where contador=:l_cont and nservicio=:l_nserv and clugar=:l_clug_his and nro_insumo=:l_nro_insumo and nfactura is null;
		else
			update serviciosingreso 
			set cemp=:cempres , ccontrato=:ccontrat,nfactura = :k,nitem_fac=:nitem_fc,clugar_fac=:clugar,tipo_fac=:ctipo_fac,cprocedeq=:proeq,cmanual=:manu,cplan=:pla 
			where contador=:l_cont and nservicio=:l_nserv and clugar=:l_clug_his ;
		end if
		if sqlca.sqlcode=-1 then
			messagebox("Error en la interface con serviciosingreso,intente nuevamente",sqlca.sqlerrtext)
			blanquea()
			return -1
		end if
		IF SQLCA.sqlnrows=0 then
			messagebox("Atención",'Es posible que algunos o todos lo s servicios de este ingreso ya se hayan facturado en otra estación de trabajo. Intente nuevamente')
			blanquea()
			return -1
		end if
		// aqui falta el otro si nservcita y ncita (la cita esta atendida)
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
			update serciosturno set serciosturno.nfact = :k ,clugar_fac=:clugar,tipo_fac=:ctipo_fac, serciosturno.nitem = :l  
			where serciosturno.ncita=:l_ncita and serciosturno.clugar=:l_clug_cita and serciosturno.nservicio=:l_nserv_cit and serciosturno.nfact is null and serciosturno.nitem is null;// and serciosturno.fecha=:fecha_cita and serciosturno.hora = :hora_cita ;
		else
			update serciosturno set serciosturno.nfact = :k ,clugar_fac=:clugar,tipo_fac=:ctipo_fac, serciosturno.nitem = :l  
			where serciosturno.ncita=:l_ncita and  serciosturno.clugar=:l_clug_cita and serciosturno.nservicio=:l_nserv_cit and serciosturno.nfact is null and serciosturno.nitem is null and serciosturno.sec_cant=:l_sec_can_cit;
		end if
		if sqlca.sqlcode<>0 then
			messagebox("Error en la interface con Servicios Turno,intente nuevamente",sqlca.sqlerrtext)
			blanquea()
			return -1
		end if
	end if // FIN la cita se facturó
	//T R A T A M I E N T O S   O D O N T O L O G I C O S
	if not isnull(dw_factura.getitemnumber(j,'ntrata')) then
		LONG ntrata,item_trat,nabo
		dec val_abon
		string clug_trat,clug_abo
		k=dw_factura.getitemnumber(j,"factu")
		l=dw_factura.getitemnumber(j,"nitem_fac")
		if dw_factura.getitemstring(j,'cproc')<>'ABONOS' then
			ntrata=dw_factura.getitemnumber(j,'ntrata')
			item_trat=dw_factura.getitemnumber(j,'item_trat')
			clug_trat=dw_factura.getitemstring(j,'clug_trat')
			update odontratacpo set nfact=:k,item_fac=:l,clugar_fac=:clugar,tipo_fac=:ctipo_fac where 
			ntratamiento=:ntrata and clugar=:clug_trat and item=:item_trat;
			if sqlca.sqlcode<>0 then
				messagebox("Error en la interface con OdonTrataCpo,intente nuevamente",sqlca.sqlerrtext)
				blanquea()
				return -1
			end if
		else

		end if
	end if //F I N  T R A T A M I E N T O S   O D O N T O L O G I C O S
next
if i_tipoingreso<>"1" then
	boolean pedir
	string cemp,ccont,tcontra,tingre,c_acti,ctipol
	dw_factadm.reset()
	for j=1 to dw_admis.rowcount()
		setnull(c_acti)
		nh=dw_admis.getitemnumber(j,'nh')
		clug_adm=dw_admis.getitemstring(j,'clugar_ingre')
		tingre=dw_admis.getitemstring(j,'codtingre')
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
				messagebox("Error leyendo de Contratos",sqlca.sqlerrtext)
				blanquea()
				return -1
			end if
			if tcontra='3' then pedir=true
		next
		if pedir then //para lo de actividades finales de la secre de bogota
			if tingre='2' then
				openwithparm(w_cual_tot,'U')
			elseif tingre='3' then
				openwithparm(w_cual_tot,'E')
			end if
			if message.stringparm<>'' then c_acti=message.stringparm
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
		ctipo_fac=dw_fact_cab.getitemstring(k,"tipo")
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
		insert into acumdeta (consecutivo,clugar,item,nfact,clugar_fac,tipo_fac,fechafact,valor) values (:cons_soat,:clug_soat,:item,:fac,:clug_fac,:ctipo_fac,:fech,:vem);
		if sqlca.sqlcode<>0 then
			messagebox("Error insertando en AcumDeta",sqlca.sqlerrtext)
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
dw_news.retrieve(i_dw.getitemnumber(i_dw.getrow(),'num_radicacion'),i_dw.getitemstring(i_dw.getrow(),'clugar'),i_dw.getitemstring(i_dw.getrow(),'tipo'),i_dw.getitemnumber(i_dw.getrow(),'item'))
for j=1 to dw_fact_cab.rowcount()
	dw_news.insertrow(1)
	for k=dw_news.rowcount() to 1 step -1
		if dw_news.find('subitem='+string(k),1,dw_news.rowcount())=0 then exit
	next
	dw_news.setitem(1,'num_radicacion',i_dw.getitemnumber(i_dw.getrow(),'num_radicacion'))
	dw_news.setitem(1,'clugar',i_dw.getitemstring(i_dw.getrow(),'clugar'))
	dw_news.setitem(1,'tipo',i_dw.getitemstring(i_dw.getrow(),'tipo'))
	dw_news.setitem(1,'item',i_dw.getitemnumber(i_dw.getrow(),'item'))
	dw_news.setitem(1,'subitem',k)
	dw_news.setitem(1,'nfact',dw_fact_cab.getitemnumber (j,'nfact'))
	dw_news.setitem(1,'clugar_fact',clugar)
	dw_news.setitem(1,'tipo_fact',ctipo_fac)
	dw_news.setitem(1,'fecha',datetime(today(),now()))
next
if dw_news.update()=-1 then 
	blanquea()
	return -1
end if
//if dw_serv_nofactu.retrieve(i_dw.getitemnumber(i_dw.getrow(),'nfact'),i_dw.getitemstring(i_dw.getrow(),'clugar_fact'))=0 then
if dw_serv_nofactu.retrieve(i_dw.getitemnumber(i_dw.getrow(),'nfact'),i_dw.getitemstring(i_dw.getrow(),'clugar_fact'),i_dw.getitemstring(i_dw.getrow(),'tipo_fact'))=0 then
	i_dw.setitem(i_dw.getrow(),'estado','R')
	if i_dw.update(true,false)=-1 then
		i_dw.setitem(i_dw.getrow(),'estado','S')
		blanquea()
		return -1
	end if
	i_dw.resetupdate()
end if
commit;
if cbx_1.checked then
	for k=1 to dw_resumen.rowcount()
		any parf[4]
		parf[1]=facturas[k]
		parf[2]=dw_resumen.getitemstring(k,"imp_cita")
		parf[3]=clugar
		parf[4]=tipo_fac[K]
		pb_factu.imprimir(parf,'','0')
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
i_profe=''
i_tipo_prof=''
i_profe_ord=''
if w_principal.dw_1.getitemstring(1,1)<>tipdoc or w_principal.dw_1.getitemstring(1,2)<>docu then 
	w_principal.dw_1.setcolumn(2)
	w_principal.dw_1.triggerevent(itemchanged!)
end if
i_comprobo=0
i_confirma_ge="si"  //para lo de confirmar grupo etareo

return 1
end function

public subroutine blanquea ();dw_news.reset()
dw_fact_cab.reset()
dw_fact_cpo.reset()
dw_fact_subcpo.reset()
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
resumen('')
end subroutine

on w_refactura.create
int iCurrent
call super::create
this.dw_serv_nofactu=create dw_serv_nofactu
this.pb_1=create pb_1
this.pb_3=create pb_3
this.st_6=create st_6
this.st_7=create st_7
this.pb_2=create pb_2
this.dw_fact_cab=create dw_fact_cab
this.dw_fact_cpo=create dw_fact_cpo
this.dw_fact_subcpo=create dw_fact_subcpo
this.dw_news=create dw_news
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_serv_nofactu
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.pb_3
this.Control[iCurrent+4]=this.st_6
this.Control[iCurrent+5]=this.st_7
this.Control[iCurrent+6]=this.pb_2
this.Control[iCurrent+7]=this.dw_fact_cab
this.Control[iCurrent+8]=this.dw_fact_cpo
this.Control[iCurrent+9]=this.dw_fact_subcpo
this.Control[iCurrent+10]=this.dw_news
end on

on w_refactura.destroy
call super::destroy
destroy(this.dw_serv_nofactu)
destroy(this.pb_1)
destroy(this.pb_3)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.pb_2)
destroy(this.dw_fact_cab)
destroy(this.dw_fact_cpo)
destroy(this.dw_fact_subcpo)
destroy(this.dw_news)
end on

event open;call super::open;i_dw=message.powerobjectparm
dw_serv_nofactu.retrieve(i_dw.getitemnumber(i_dw.getrow(),'nfact'),i_dw.getitemstring(i_dw.getrow(),'clugar_fact'),i_dw.getitemstring(i_dw.getrow(),'tipo_fact'))
dw_emppac.retrieve(i_dw.getitemnumber(i_dw.getrow(),'nfact'),i_dw.getitemstring(i_dw.getrow(),'clugar_fact'),i_dw.getitemstring(i_dw.getrow(),'tipo_fact'))
if dw_admis.retrieve(i_dw.getitemnumber(i_dw.getrow(),'nfact'),i_dw.getitemstring(i_dw.getrow(),'clugar_fact'),i_dw.getitemstring(i_dw.getrow(),'tipo_fact'))>0 then
	i_tipoingreso=dw_admis.getitemstring(1,'codtingre')
	dw_tip_ingres.setitem(1,1,i_tipoingreso)
end if
i_mueve_kardex='0'
end event

type sle_siras from w_factura_base`sle_siras within w_refactura
boolean visible = false
integer x = 4050
integer y = 388
end type

type ddlb_archivos from w_factura_base`ddlb_archivos within w_refactura
end type

type dw_his_acu from w_factura_base`dw_his_acu within w_refactura
integer width = 165
integer height = 48
boolean enabled = false
end type

type pb_aut_cc from w_factura_base`pb_aut_cc within w_refactura
end type

type dw_kardexdeta from w_factura_base`dw_kardexdeta within w_refactura
integer x = 3589
integer y = 676
integer width = 55
integer height = 44
end type

type dw_lote_mov from w_factura_base`dw_lote_mov within w_refactura
integer x = 3579
integer y = 452
integer width = 64
integer height = 52
end type

type pb_reci from w_factura_base`pb_reci within w_refactura
boolean visible = false
integer x = 3666
integer y = 1372
integer width = 59
integer height = 48
boolean enabled = false
end type

type pb_factu from w_factura_base`pb_factu within w_refactura
integer x = 2391
integer y = 492
end type

type dw_factadm from w_factura_base`dw_factadm within w_refactura
integer x = 3671
integer y = 1084
integer width = 55
integer height = 36
end type

type dw_admis from w_factura_base`dw_admis within w_refactura
integer x = 3671
integer y = 1040
integer width = 55
integer height = 36
end type

type st_ayuda from w_factura_base`st_ayuda within w_refactura
boolean visible = true
integer x = 329
integer y = 2056
integer width = 1349
end type

type pb_kit from w_factura_base`pb_kit within w_refactura
boolean visible = false
integer x = 3671
integer y = 1812
boolean enabled = false
end type

type cbx_equiv from w_factura_base`cbx_equiv within w_refactura
integer x = 1618
integer y = 884
end type

type cbx_3 from w_factura_base`cbx_3 within w_refactura
integer x = 791
integer y = 884
end type

type st_cuant from w_factura_base`st_cuant within w_refactura
integer x = 3045
integer y = 936
end type

type cbx_2 from w_factura_base`cbx_2 within w_refactura
boolean visible = false
integer x = 3662
integer y = 1304
integer width = 69
boolean enabled = false
end type

type cbx_1 from w_factura_base`cbx_1 within w_refactura
integer x = 2327
integer y = 484
end type

type pb_req_cont from w_factura_base`pb_req_cont within w_refactura
boolean visible = false
integer x = 3671
integer y = 1680
boolean enabled = false
end type

type dw_segrespon from w_factura_base`dw_segrespon within w_refactura
integer x = 3575
integer y = 568
integer width = 69
integer height = 44
end type

type sle_proc from w_factura_base`sle_proc within w_refactura
boolean visible = false
integer x = 3671
integer y = 1856
integer width = 50
integer height = 36
boolean enabled = false
end type

type gb_8 from w_factura_base`gb_8 within w_refactura
boolean visible = false
integer x = 3666
integer y = 1536
integer width = 59
integer height = 48
end type

type gb_7 from w_factura_base`gb_7 within w_refactura
boolean visible = false
integer x = 3666
integer y = 1580
integer width = 59
integer height = 48
end type

type gb_5 from w_factura_base`gb_5 within w_refactura
boolean visible = false
integer x = 3648
integer y = 372
integer width = 59
integer height = 52
boolean enabled = false
end type

type st_4 from w_factura_base`st_4 within w_refactura
integer x = 105
integer y = 936
end type

type st_3 from w_factura_base`st_3 within w_refactura
boolean visible = false
integer x = 3671
integer y = 988
integer width = 55
integer height = 44
boolean enabled = false
end type

type sle_autoriza from w_factura_base`sle_autoriza within w_refactura
boolean visible = false
integer x = 3589
integer y = 728
integer width = 55
integer height = 44
boolean enabled = false
end type

type pb_borra from w_factura_base`pb_borra within w_refactura
boolean visible = false
integer x = 3671
integer y = 1768
boolean enabled = false
end type

type dw_getareo from w_factura_base`dw_getareo within w_refactura
integer x = 3589
integer y = 12
integer width = 55
integer height = 36
end type

type dw_equiv from w_factura_base`dw_equiv within w_refactura
integer x = 3589
integer y = 144
integer width = 55
integer height = 36
end type

type st_2 from w_factura_base`st_2 within w_refactura
boolean visible = false
integer x = 3671
integer y = 936
integer width = 55
integer height = 44
boolean enabled = false
end type

type st_1 from w_factura_base`st_1 within w_refactura
boolean visible = false
integer x = 3671
integer y = 884
integer width = 55
integer height = 44
boolean enabled = false
end type

type sle_poliza from w_factura_base`sle_poliza within w_refactura
boolean visible = false
integer x = 3589
integer y = 780
integer width = 55
integer height = 44
boolean enabled = false
end type

type dw_tarifas from w_factura_base`dw_tarifas within w_refactura
integer x = 3589
integer y = 100
integer width = 55
integer height = 36
end type

type dw_cont_det from w_factura_base`dw_cont_det within w_refactura
integer x = 3589
integer y = 56
integer width = 55
integer height = 36
end type

type pb_buscar from w_factura_base`pb_buscar within w_refactura
boolean visible = false
integer x = 3671
integer y = 1724
boolean enabled = false
end type

type dw_tip_ingres from w_factura_base`dw_tip_ingres within w_refactura
boolean visible = false
integer x = 3671
integer y = 832
integer width = 55
integer height = 44
boolean enabled = false
end type

type dw_resumen from w_factura_base`dw_resumen within w_refactura
integer x = 101
integer y = 1660
integer width = 5344
integer height = 504
boolean resizable = false
borderstyle borderstyle = stylelowered!
end type

type dw_forma_pago from w_factura_base`dw_forma_pago within w_refactura
integer x = 3561
integer y = 232
integer width = 105
integer height = 52
end type

type pb_soat from w_factura_base`pb_soat within w_refactura
integer x = 3113
integer y = 572
end type

type gb_1 from w_factura_base`gb_1 within w_refactura
boolean visible = false
integer y = 1480
integer width = 64
integer height = 60
boolean enabled = false
end type

type gb_2 from w_factura_base`gb_2 within w_refactura
boolean visible = false
integer x = 3662
integer y = 1428
integer width = 64
integer height = 56
boolean enabled = false
end type

type gb_3 from w_factura_base`gb_3 within w_refactura
boolean visible = false
integer x = 3666
integer y = 1628
integer width = 59
integer height = 48
boolean enabled = false
end type

type pb_facturar from w_factura_base`pb_facturar within w_refactura
integer x = 3118
integer y = 712
end type

type pb_paci from w_factura_base`pb_paci within w_refactura
boolean visible = false
integer x = 3666
integer y = 1128
boolean enabled = false
end type

type pb_emp from w_factura_base`pb_emp within w_refactura
boolean visible = false
integer x = 3666
integer y = 1188
boolean enabled = false
end type

type pb_reimprimir from w_factura_base`pb_reimprimir within w_refactura
boolean visible = false
integer x = 3666
integer y = 1248
boolean enabled = false
end type

type pb_calcula from w_factura_base`pb_calcula within w_refactura
integer x = 3278
integer y = 712
end type

type dw_factura_cpo from w_factura_base`dw_factura_cpo within w_refactura
integer x = 3589
integer y = 188
integer width = 55
integer height = 36
end type

type p_1 from w_factura_base`p_1 within w_refactura
boolean visible = false
integer x = 3552
integer width = 174
boolean enabled = false
boolean originalsize = false
end type

type st_5 from w_factura_base`st_5 within w_refactura
integer x = 494
integer y = 936
end type

type dw_rec_caj_cab from w_factura_base`dw_rec_caj_cab within w_refactura
integer x = 3529
integer y = 404
integer width = 114
integer height = 40
boolean enabled = false
end type

type pb_pagare from w_factura_base`pb_pagare within w_refactura
integer x = 3589
integer y = 292
boolean enabled = false
end type

type pb_parcial from w_factura_base`pb_parcial within w_refactura
integer x = 101
integer y = 1728
end type

type dw_memory from w_factura_base`dw_memory within w_refactura
integer x = 3584
integer y = 620
integer width = 59
integer height = 48
end type

type dw_acum_soat from w_factura_base`dw_acum_soat within w_refactura
boolean visible = false
integer x = 3584
integer y = 512
integer width = 59
integer height = 48
end type

type dw_factura from w_factura_base`dw_factura within w_refactura
integer x = 101
integer y = 1016
integer width = 5339
integer height = 656
boolean resizable = false
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type gb_4 from w_factura_base`gb_4 within w_refactura
integer x = 101
integer y = 868
integer width = 5422
integer height = 1200
end type

type pb_faccon from w_factura_base`pb_faccon within w_refactura
end type

type dw_emppac from w_factura_base`dw_emppac within w_refactura
integer x = 119
integer y = 556
integer width = 2802
string dataobject = "dw_empac_refact"
end type

type gb_6 from w_factura_base`gb_6 within w_refactura
boolean visible = false
integer x = 3643
integer y = 96
integer width = 50
integer height = 48
boolean enabled = false
end type

type st_siras from w_factura_base`st_siras within w_refactura
end type

type cbx_4 from w_factura_base`cbx_4 within w_refactura
end type

type pb_pagares from w_factura_base`pb_pagares within w_refactura
integer x = 4078
integer y = 208
boolean originalsize = false
end type

type dw_reccaj_cpo from w_factura_base`dw_reccaj_cpo within w_refactura
integer x = 151
end type

type dw_serv_nofactu from datawindow within w_refactura
integer x = 123
integer y = 52
integer width = 3895
integer height = 424
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_serv_nofactu_refact"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_1 from picturebutton within w_refactura
integer x = 9
integer y = 104
integer width = 101
integer height = 88
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean flatstyle = true
string picturename = "OutputPrevious!"
alignment htextalign = left!
string powertiptext = "Subir una Fila"
end type

event clicked;if dw_serv_nofactu.rowcount()=0 or dw_serv_nofactu.getrow()=1 then return
long donde
donde=dw_serv_nofactu.getrow()
dw_serv_nofactu.setredraw(false)
dw_serv_nofactu.rowscopy(donde  ,donde ,primary!,dw_serv_nofactu,donde -1,primary!)
dw_serv_nofactu.deleterow(donde+1)
dw_serv_nofactu.scrolltorow(donde -1)
dw_serv_nofactu.setredraw(true)
end event

type pb_3 from picturebutton within w_refactura
integer x = 9
integer y = 196
integer width = 101
integer height = 88
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean flatstyle = true
string picturename = "OutputNext!"
alignment htextalign = left!
string powertiptext = "Bajar una Fila"
end type

event clicked;if dw_serv_nofactu.rowcount()=0 or dw_serv_nofactu.getrow()=dw_serv_nofactu.rowcount() then return
long donde
donde=dw_serv_nofactu.getrow()
dw_serv_nofactu.setredraw(false)
dw_serv_nofactu.rowscopy(donde +1  ,donde +1,primary!,dw_serv_nofactu,donde  ,primary!)
dw_serv_nofactu.deleterow(donde +2)
dw_serv_nofactu.scrolltorow(donde +1)
dw_serv_nofactu.setredraw(true)
end event

type st_6 from statictext within w_refactura
integer x = 123
integer width = 498
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
string text = "Servicios a refacturar:"
boolean focusrectangle = false
end type

type st_7 from statictext within w_refactura
integer x = 110
integer y = 496
integer width = 1376
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
string text = "Seleccione la empresa a la que va a generar la nueva factura:"
boolean focusrectangle = false
end type

type pb_2 from picturebutton within w_refactura
integer x = 4082
integer y = 60
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
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Facturar los procedimientos seleccionados"
end type

event clicked;long j,va,contador,canti,nserv,facturar,fila,cons_soat,cuantos,edad,acto,nfact_ref,item_ref
string cod,desproc,clug_his,autoriza,emp,cont,codta,clug_soat,tingres,uf,cc,tipo,via,siras
string tipo_cir,prof_cir,espe_cir,sexo,estrato,tdoc,doc,l_articulo,tipo_fac,clugar_ref,tipo_fac_ref
string ls_coxig
edad=dw_emppac.getitemnumber(dw_emppac.getrow(),'dias')
sexo=dw_emppac.getitemstring(dw_emppac.getrow(),'sexo')
estrato=dw_emppac.getitemstring(dw_emppac.getrow(),'estrato')

for j=1 to dw_serv_nofactu.rowcount()
	if dw_serv_nofactu.getitemnumber(j,'selecc')=0 then continue
	va=j
	tdoc=dw_serv_nofactu.getitemstring(j,"tipodoc")
	doc=dw_serv_nofactu.getitemstring(j,"documento")
	tipdoc=tdoc
	docu=doc
	/////
	cod=dw_serv_nofactu.getitemstring(j,"cproced")
	desproc=dw_serv_nofactu.getitemstring(j,"descripcion")
	contador=dw_serv_nofactu.getitemnumber(j,"contador")
	canti=dw_serv_nofactu.getitemnumber(j,"cantidad")
	clug_his=dw_serv_nofactu.getitemstring(j,"clugar")
	nserv=dw_serv_nofactu.getitemnumber(j,"nservicio")
	autoriza=dw_serv_nofactu.getitemstring(j,"nautoriza")
	facturar=dw_serv_nofactu.getitemnumber(j,"facturar")
	l_articulo=dw_serv_nofactu.getitemstring(j,"articulo")
	ls_coxig=dw_serv_nofactu.getitemstring(j,"cod_oxig")
	fila=dw_serv_nofactu.getitemnumber(j,'fila')
	emp=dw_emppac.getitemstring(dw_emppac.getrow(),'codemp')
	cont=dw_emppac.getitemstring(dw_emppac.getrow(),'codcontrato')
	tipo_fac=dw_emppac.getitemstring(dw_emppac.getrow(),'tipo')
	codta=dw_emppac.getitemstring(dw_emppac.getrow(),'codta')
	if dw_emppac.getitemstring(dw_emppac.getrow(),'soat')='1' then
		cons_soat=dw_serv_nofactu.getitemnumber(j,"consec_soat")
		clug_soat=dw_serv_nofactu.getitemstring(j,"clugar_soat")
	else
		setnull(cons_soat)
		setnull(clug_soat)
	end if
	nfact_ref=dw_serv_nofactu.getitemnumber(j,"nfactura")
	clugar_ref=dw_serv_nofactu.getitemstring(j,"clugar_fac")
	tipo_fac_ref=dw_serv_nofactu.getitemstring(j,"tipo_fac")
	item_ref=dw_serv_nofactu.getitemnumber(j,"nitem_fac")
	tingres=dw_serv_nofactu.getitemstring(j,'tipoing')
	if isnull(tingres) then
		if dw_admis.rowcount()>0 then
			tingres=dw_admis.getitemstring(1,'codtingre')
		else
			tingres='1'
		end if
	end if
	uf=dw_serv_nofactu.getitemstring(j,"cufuncional")
	cc=dw_serv_nofactu.getitemstring(j,"cccosto")
	tipo=dw_serv_nofactu.getitemstring(j,"tipo")
	if tipo='C' or isnull(tipo) then // 'C' es de cups (procedimiento)
		if not isnull(dw_serv_nofactu.getitemnumber(j,"acto")) then
			acto=dw_serv_nofactu.getitemnumber(j,"acto")
			via=dw_serv_nofactu.getitemstring(j,"cvia")
			if dw_serv_nofactu.getitemstring(j,"incruento")='1' then
				tipo_cir='i'
			else
				tipo_cir='n'
			end if
			if dw_serv_nofactu.getitemstring(j,"bilateral")='1' then 
				tipo_cir+='b'
			end if
			prof_cir=dw_serv_nofactu.getitemstring(j,"especialista")
			espe_cir=dw_serv_nofactu.getitemstring(j,"cesp")
		else
			acto=0
			via=''
			tipo_cir=''
			prof_cir=''
			espe_cir=''
		end if
		//36 parametros ( p_codigo,  p_cantidad,  p_tipo,  p_tipoing,  p_autoriza,  p_cemp,  p_cont,  p_cons_soat, 
		//  p_clug_soat,  p_tdoc,  p_docu,  p_edad,  p_sexo,  p_codta, p_estrato, p_uf,  p_cc,  p_desde,  p_facturar,  p_contador, 
		//  p_clug_his,  p_nserv,  p_prof_cir,  p_espe_cir,  p_via,  p_acto,  p_tipo_cir,  p_ncita, p_clug_cita, p_nserv_cita, 
		//  p_sec_cant_cita,  p_nreci,  p_clug_rec,  p_item_rec,  p_ntrat, p_clug_trat, p_item_trat)
		if lf_cargar_a(cod,desproc,canti,'C',tingres,autoriza,emp,cont,cons_soat, &
		  clug_soat,tdoc,doc,edad,sexo,codta,estrato,uf,cc,'H',facturar,contador, &
		  clug_his,nserv,prof_cir,espe_cir,via,acto,tipo_cir,0,'',0,&
		  0,0,'',0,0,'',0,dw_serv_nofactu.getitemstring(j,"anestesiologo"),dw_serv_nofactu.getitemstring(j,"auxiliarqx"),0,0,0,l_articulo,tipo_fac,nfact_ref,clugar_ref,tipo_fac_ref,item_ref,'0',siras,ls_coxig)=-1 then
			blanquea()
			close(parent)
			return
		end if
	else //es 'M' de medicamentos
		if lf_cargar_a(cod,desproc,canti,'M',tingres,autoriza,emp,cont,cons_soat, &
		  clug_soat,tdoc,doc,edad,sexo,codta,estrato,uf,cc,'H',facturar,contador, &
		  clug_his,nserv,'','','',0,'',0,'',0,&
		  0,0,'',0,0,'',0,'','!',dw_serv_nofactu.getitemnumber(j,"nro_insumo"),0,0,l_articulo,tipo_fac,nfact_ref,clugar_ref,tipo_fac_ref,item_ref,'0',siras,ls_coxig)=-1 then
			blanquea()
			close(parent)
			return
		end if
	end if
	cuantos ++
next
resumen('H')
pb_2.enabled=false
end event

type dw_fact_cab from datawindow within w_refactura
boolean visible = false
integer x = 1993
integer y = 2252
integer width = 366
integer height = 92
integer taborder = 260
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

type dw_fact_cpo from datawindow within w_refactura
boolean visible = false
integer x = 2400
integer y = 2268
integer width = 402
integer height = 96
integer taborder = 270
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

type dw_fact_subcpo from datawindow within w_refactura
boolean visible = false
integer x = 1431
integer y = 2256
integer width = 489
integer height = 96
integer taborder = 250
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

type dw_news from datawindow within w_refactura
boolean visible = false
integer x = 41
integer y = 2260
integer width = 1303
integer height = 104
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_new_facts"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

