$PBExportHeader$w_rec_caja.srw
forward
global type w_rec_caja from w_factura_base
end type
type dw_tesodeta from datawindow within w_rec_caja
end type
type dw_tesosubcpo from datawindow within w_rec_caja
end type
end forward

global type w_rec_caja from w_factura_base
integer width = 5778
integer height = 2060
string title = "Generación de Recibos de Caja"
string icon = "rec_caja.ico"
string i_cdoc = "RC"
dw_tesodeta dw_tesodeta
dw_tesosubcpo dw_tesosubcpo
end type
global w_rec_caja w_rec_caja

forward prototypes
public subroutine blanquea ()
public function long factura ()
end prototypes

public subroutine blanquea ();dw_tesosubcpo.reset()
dw_tesodeta.reset()
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
resumen('')
end subroutine

public function long factura ();long j,donde,k,l,nitem_rec,npagare,recibos[]
string ya_recibo,naut,clugar_fac,mens_err
ya_recibo="no"
if is_pideprof='1' and (is_profe='' or is_tipo_prof<>'2') then
	openwithparm(w_escog_profe,'rec')
	is_profe=message.stringparm
	if is_profe='' or isnull(is_profe) then return -1
end if
setnull(ist_nfactura.ndoc)
setnull(ist_nfactura.c_aut)
setnull(clugar_fac)
dw_reccaj_cpo.reset()
for k=1 to dw_resumen.rowcount()
	dw_factura.setfilter("cemp='"+dw_resumen.getitemstring(k,"cemp")+"'and ccontrato='"+dw_resumen.getitemstring(k,"ccont")+"'")
	dw_factura.filter()
	for j=1 to dw_factura.rowcount()
		donde=dw_tesodeta.insertrow(0)
		dw_tesodeta.setitem(donde,"items",k)
		dw_factura.setitem(j,'items',k)
		dw_tesodeta.setitem(donde,"clugar",clugar)
		dw_tesodeta.setitem(donde,"nitem",j)
		dw_factura.setitem(j,"nitem_rec",j)
		dw_tesodeta.setitem(donde,"cantidad",dw_factura.getitemnumber(j,"cantidad"))
		dw_tesodeta.setitem(donde,"codaadx",dw_factura.getitemstring(j,"areaadx"))
		dw_tesodeta.setitem(donde,"v_paga",dw_factura.getitemnumber(j,"vt_pac") +dw_factura.getitemnumber(j,"v_part"))
		dw_tesodeta.setitem(donde,"vproced",dw_factura.getitemnumber(j,"vt_proc"))
		if dw_factura.getitemstring(j,"es_medica")="1" then
			dw_tesodeta.setitem(donde,"c_medica",dw_factura.getitemstring(j,"cproc"))
			dw_tesodeta.setitem(donde,"articulo",dw_factura.getitemstring(j,"articulo"))
		else
			dw_tesodeta.setitem(donde,"proccups",dw_factura.getitemstring(j,"proccups"))
			dw_tesodeta.setitem(donde,"cproced",dw_factura.getitemstring(j,"cproc"))
		end if
		dw_tesodeta.setitem(donde,"cmanual",dw_factura.getitemstring(j,"cod_manual"))
		dw_tesodeta.setitem(donde,"plan",dw_factura.getitemstring(j,"plan"))
		dw_tesodeta.setitem(donde,"iva_crm",dw_factura.getitemnumber(j,"iva_crm"))
		naut=dw_factura.getitemstring(j,"autoriza")
		if trim(naut)="" or naut="0" then setnull(naut)
		dw_tesodeta.setitem(donde,"autorizacion",naut)
		dw_tesodeta.setitem(donde,"iva",dw_factura.getitemdecimal(j,"iva"))
		dw_tesodeta.setitem(donde,"cufuncional",dw_factura.getitemstring(j,"coduf"))
		dw_tesodeta.setitem(donde,"cccosto",dw_factura.getitemstring(j,"codcc"))
		dw_tesodeta.setitem(donde,"contador",dw_factura.getitemnumber(j,"contador"))
		dw_tesodeta.setitem(donde,"clugar_his",dw_factura.getitemstring(j,"clugar_his"))
		//
		dw_factura_cpo.setfilter("num_padre="+string(dw_factura.getitemnumber(j,"numero")))
		dw_factura_cpo.filter()
		for l=1 to dw_factura_cpo.rowcount()
			dw_tesosubcpo.insertrow(1)
			dw_tesosubcpo.setitem(1,"clugar",clugar)
			dw_tesosubcpo.setitem(1,"items",k)
			dw_tesosubcpo.setitem(1,"nitem",j)
			dw_tesosubcpo.setitem(1,"nsubitem",l)
			dw_tesosubcpo.setitem(1,"tipoproc",dw_factura_cpo.getitemstring(l,"tipo_proc"))			
			dw_tesosubcpo.setitem(1,"cproced",dw_factura_cpo.getitemstring(l,"cproced"))
			//dw_tesosubcpo.setitem(1,"proccups",dw_fact_cpo.getitemstring(l,"proccups"))
			dw_tesosubcpo.setitem(1,"codmanual",dw_factura.getitemstring(j,"cod_manual"))
			dw_tesosubcpo.setitem(1,"vproced",dw_factura_cpo.getitemnumber(l,"valor"))
			dw_tesosubcpo.setitem(1,"cantidad",dw_factura_cpo.getitemnumber(l,"cantidad"))
		next
	next
	if dw_rec_caj_cab.rowcount()=0 then 
		dw_rec_caj_cab.insertrow(1)
		dw_rec_caj_cab.setitem(1,"no_reci",'0')
		dw_rec_caj_cab.setitem(1,"clugar",CLUGAR)
		dw_rec_caj_cab.setitem(1,"tipodoc",tipdoc)
		dw_rec_caj_cab.setitem(1,"documento",docu)
		dw_rec_caj_cab.setitem(1,"trecibo",0)
		dw_rec_caj_cab.setitem(1,"tpago",0) //t saldo es lo da por pagares
		dw_rec_caj_cab.setitem(1,"fpago",dw_forma_pago.getitemstring(1,1))
	end if
	dw_rec_caj_cab.setitem(1,"codprof",is_profe)
	dw_rec_caj_cab.setitem(1,"cprof_ordena",is_profe_ord)
	if dw_rec_caj_cab.rowcount()=1 and ya_recibo='no' then
		i_nrecibo=f_trae_ndoc(i_cdoc,clugar,'Recibo de Caja')
		if i_nrecibo=-1 then
			blanquea()
			return -1
		end if
		dw_rec_caj_cab.setitem(1,"nrcaj",i_nrecibo)
		dw_rec_caj_cab.setitem(1,"usuario",usuario)
		dw_rec_caj_cab.setitem(1,"fecha",datetime(today()))
		dw_rec_caj_cab.setitem(1,"hora",datetime(today(),time(string(now()))))
		if dw_rec_caj_cab.update()=-1 then 
			blanquea()
			return -1
		else
			ya_recibo='si'
			if dw_rec_caj_cab.getitemnumber(1,'tsaldo')>0 then
				npagare=f_pagare(dw_rec_caj_cab.getitemdecimal(1,'tsaldo'),i_nrecibo,clugar)
				if npagare=-1 then
					blanquea()
					return -1
				else
					dw_rec_caj_cab.setitem(1,"npagare",npagare)
					dw_rec_caj_cab.setitem(1,"clugar_pag",clugar)
					if dw_rec_caj_cab.update()=-1 then
						
						blanquea()
						return -1
					end if
					if dw_rec_caj_cab.getitemstring(1,'imp_pag')='1' then 
						any parp[2]
						parp[1]=npagare
						parp[2]=clugar
						pb_pagare.imprimir(parp,'','0')
					end if
				end if
			end if
		end if
	end if
	//l=dw_reccaj_cpo.find("cemp='"+dw_resumen.getitemstring(k,"cemp")+"' and ccont='"+dw_resumen.getitemstring(k,"ccont")+"'",1,dw_reccaj_cpo.rowcount())
	dw_reccaj_cpo.insertrow(k)
	dw_reccaj_cpo.setitem(k,"items",k)
	dw_reccaj_cpo.setitem(k,"titemrcaja",dw_resumen.getitemnumber(k,"vtcancel"))
	dw_reccaj_cpo.setitem(k,"titemdescuento",dw_resumen.getitemnumber(k,"vtdesc"))
	dw_reccaj_cpo.setitem(k,"titempagare",dw_resumen.getitemnumber(k,"vtpac")-dw_resumen.getitemnumber(k,"vtcancel")-dw_resumen.getitemnumber(k,"vtdesc"))
	dw_reccaj_cpo.setitem(k,"cemp",dw_resumen.getitemstring(k,"cemp"))
	dw_reccaj_cpo.setitem(k,"ccont",dw_resumen.getitemstring(k,"ccont"))
	dw_reccaj_cpo.setitem(k,"t_iva",dw_resumen.getitemdecimal(k,"vtiva"))
	dw_reccaj_cpo.setitem(k,"nfact",ist_nfactura.ndoc)
	dw_reccaj_cpo.setitem(k,"clugar_fac",clugar_fac)
	dw_reccaj_cpo.setitem(k,"nrcaj",i_nrecibo)
	dw_reccaj_cpo.setitem(k,"clugar",clugar)
	recibos[K]=i_nrecibo
	if ya_recibo="si" and k=dw_resumen.rowcount() then
		if dw_reccaj_cpo.update()=-1 then
			blanquea()
			return -1
		else
			for l=1 to dw_tesodeta.rowcount()	
				dw_tesodeta.setitem(l,"nrcaj",i_nrecibo)
				dw_tesodeta.setitem(l,"clugar",clugar)
			next
			if dw_tesodeta.update()= -1 then
				blanquea()
				return -1
			else
				for l=1 to dw_tesosubcpo.rowcount()
					dw_tesosubcpo.setitem(l,"nrcaj",i_nrecibo)
				next
				if dw_tesosubcpo.update()=-1 then
					
					blanquea()
					return -1
				end if
			end if
		end if
	end if
next
dw_factura.setfilter("")
dw_factura.filter()
//////////////// mover kardex  ////////////////////////////////////////////////////////////////
if is_mueve_kardex='1' then
	dw_lote_mov.setfilter('')
	dw_lote_mov.filter()
	long fil_fact
	for k=1 to dw_lote_mov.rowcount()
		fil_fact=dw_factura.find('numero='+string(dw_lote_mov.getitemnumber(k,'item')),1,dw_factura.rowcount())
		if fil_fact=0 then
			Messagebox('Error','No se puede hallar el numero de factura que se le asignó al producto: '+dw_lote_mov.getitemstring(k,'codarticulo'))
			blanquea()
			return -1
		end if
		dw_lote_mov.setitem(k,'nfact',i_nrecibo)
		dw_lote_mov.setitem(k,'item_fc',dw_factura.getitemnumber(fil_fact,'nitem_rec'))
		dw_lote_mov.setitem(k,'item_rec',dw_factura.getitemnumber(fil_fact,'items'))
	next
	if f_crea_entrega()=-1 then
		blanquea()
		return -1
	end if
end if
// fin mover kardex
long contador_aqui,nserv_aqui,ncita,sec_cant_cita,nserv_cita
string l_clug_cita
for j=1 to dw_factura.rowcount()
	contador_aqui=dw_factura.getitemnumber(j,"contador")
	nserv_aqui=dw_factura.getitemnumber(j,"nserv")
	nserv_cita=dw_factura.getitemnumber(j,"nserv_cita")
	ncita=dw_factura.getitemnumber(j,"ncita")
	sec_cant_cita=dw_factura.getitemnumber(j,"sec_cant_cita")
	l_clug_cita=dw_factura.getitemstring(j,"clug_cita")
	if not isnull(nserv_cita) and not isnull(ncita) then // a la cita se le hizo recibo de caja
		nitem_rec=dw_factura.getitemnumber(j,"nitem_rec")
		if isnull(sec_cant_cita) then
			update serciosturno set nrcaj=:i_nrecibo ,clugar_rec=:clugar,items=:j ,nitem_rec=:nitem_rec 
			where serciosturno.ncita=:ncita and  serciosturno.clugar=:l_clug_cita and serciosturno.nservicio=:nserv_cita and serciosturno.nfact is null and serciosturno.nitem is null;//and serciosturno.fecha=:fecha_cita and serciosturno.hora = :hora_cita ;
		else
			update serciosturno set nrcaj=:i_nrecibo ,clugar_rec=:clugar,items=:j ,nitem_rec=:nitem_rec 
			where serciosturno.ncita=:ncita and  serciosturno.clugar=:l_clug_cita and serciosturno.nservicio=:nserv_cita and serciosturno.nfact is null and serciosturno.nitem is null and serciosturno.sec_cant=:sec_cant_cita;
		end if		
		if sqlca.sqlcode=-1 then
			messagebox("Error en la interface con Servicios Turno,intente nuevamente",sqlca.sqlerrtext)
				blanquea()
			return -1
		end if
	end if
next


if not isnull(contador_aqui) then 
	int j1,j2
	for l=1 to dw_tesodeta.rowcount()	
		j1=dw_tesodeta.getitemnumber(l,"items")
		j2=dw_tesodeta.getitemnumber(l,"nitem")
		update serviciosingreso 
		set  nrcaj=:i_nrecibo,clugar_rec=:clugar,items=:j1, 
		nitem_rec=:j2
		where contador=:contador_aqui and nservicio=:nserv_aqui and clugar=:clugar and nrcaj is null;
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
		next
End If
commit;
Messagebox("Recibo generado con éxito","Número de recibo: "+string(i_nrecibo))
if cbx_1.checked then
	any parr[3]
	parr[1]=i_nrecibo
	parr[2]=clugar
	parr[3]='1'
	pb_factu.imprimir(parr,'','0')
end if
setnull(contador_aqui)
setnull(nserv_aqui)
setnull(nserv_cita)
setnull(sec_cant_cita)
setnull(ncita)
sle_autoriza.text=""

string captu_rip
if ls_pro=32 THEN	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "RIPS_AL_FACTURAR", Regstring!, captu_rip)
if ls_pro=64 THEN	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "RIPS_AL_FACTURAR", Regstring!, captu_rip)
if i_tipoingreso='1' and captu_rip='1' then
	st_factus st
	st.desde=recibos[1]
	st.hasta=recibos[dw_resumen.rowcount()]
	openwithparm(w_captur_rip_rec_caj,st)
end if
////////
blanquea()
dw_rec_caj_cab.visible=false
dw_forma_pago.visible=false
pb_pagares.visible=false
pb_pagares.enabled=false
pb_calcula.visible=false
pb_calcula.enabled=false
pb_paci.enabled=true
is_profe=''
is_profe_ord=''
if w_principal.dw_1.getitemstring(1,1)<>tipdoc or w_principal.dw_1.getitemstring(1,2)<>docu then 
	w_principal.dw_1.setcolumn(2)
	w_principal.dw_1.triggerevent(itemchanged!)
end if
i_confirma_ge="si"  //para lo de confirmar grupo etareo

return 1
end function

on w_rec_caja.create
int iCurrent
call super::create
this.dw_tesodeta=create dw_tesodeta
this.dw_tesosubcpo=create dw_tesosubcpo
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_tesodeta
this.Control[iCurrent+2]=this.dw_tesosubcpo
end on

on w_rec_caja.destroy
call super::destroy
destroy(this.dw_tesodeta)
destroy(this.dw_tesosubcpo)
end on

type dw_dx from w_factura_base`dw_dx within w_rec_caja
end type

type pb_dx from w_factura_base`pb_dx within w_rec_caja
end type

type sle_siras from w_factura_base`sle_siras within w_rec_caja
end type

type ddlb_archivos from w_factura_base`ddlb_archivos within w_rec_caja
end type

type dw_his_acu from w_factura_base`dw_his_acu within w_rec_caja
end type

type pb_aut_cc from w_factura_base`pb_aut_cc within w_rec_caja
end type

type dw_kardexdeta from w_factura_base`dw_kardexdeta within w_rec_caja
end type

type dw_lote_mov from w_factura_base`dw_lote_mov within w_rec_caja
end type

type pb_reci from w_factura_base`pb_reci within w_rec_caja
boolean visible = false
integer y = 320
integer width = 69
integer height = 56
boolean enabled = false
string disabledname = ""
end type

type pb_factu from w_factura_base`pb_factu within w_rec_caja
string powertiptext = "Opciones de Impresión del Recibo"
string cod_rep = "RC"
end type

type dw_factadm from w_factura_base`dw_factadm within w_rec_caja
end type

type dw_admis from w_factura_base`dw_admis within w_rec_caja
end type

type st_ayuda from w_factura_base`st_ayuda within w_rec_caja
end type

type pb_kit from w_factura_base`pb_kit within w_rec_caja
end type

type cbx_equiv from w_factura_base`cbx_equiv within w_rec_caja
end type

type cbx_3 from w_factura_base`cbx_3 within w_rec_caja
end type

type st_cuant from w_factura_base`st_cuant within w_rec_caja
end type

type cbx_2 from w_factura_base`cbx_2 within w_rec_caja
boolean visible = false
boolean enabled = false
end type

type cbx_1 from w_factura_base`cbx_1 within w_rec_caja
string text = "    Imprimir Recibo"
end type

type pb_req_cont from w_factura_base`pb_req_cont within w_rec_caja
integer x = 1134
end type

type dw_segrespon from w_factura_base`dw_segrespon within w_rec_caja
end type

type sle_proc from w_factura_base`sle_proc within w_rec_caja
end type

type gb_5 from w_factura_base`gb_5 within w_rec_caja
integer width = 489
end type

type st_4 from w_factura_base`st_4 within w_rec_caja
end type

type st_3 from w_factura_base`st_3 within w_rec_caja
end type

type sle_autoriza from w_factura_base`sle_autoriza within w_rec_caja
end type

type pb_borra from w_factura_base`pb_borra within w_rec_caja
end type

type dw_getareo from w_factura_base`dw_getareo within w_rec_caja
end type

type dw_equiv from w_factura_base`dw_equiv within w_rec_caja
end type

type st_2 from w_factura_base`st_2 within w_rec_caja
end type

type st_1 from w_factura_base`st_1 within w_rec_caja
end type

type sle_poliza from w_factura_base`sle_poliza within w_rec_caja
end type

type dw_tarifas from w_factura_base`dw_tarifas within w_rec_caja
end type

type dw_cont_det from w_factura_base`dw_cont_det within w_rec_caja
end type

type pb_buscar from w_factura_base`pb_buscar within w_rec_caja
end type

type dw_tip_ingres from w_factura_base`dw_tip_ingres within w_rec_caja
boolean enabled = false
end type

type dw_resumen from w_factura_base`dw_resumen within w_rec_caja
end type

type dw_forma_pago from w_factura_base`dw_forma_pago within w_rec_caja
end type

type pb_soat from w_factura_base`pb_soat within w_rec_caja
end type

type gb_1 from w_factura_base`gb_1 within w_rec_caja
string text = "Generalidades Recibo de Caja"
end type

type gb_2 from w_factura_base`gb_2 within w_rec_caja
end type

type gb_3 from w_factura_base`gb_3 within w_rec_caja
end type

type pb_facturar from w_factura_base`pb_facturar within w_rec_caja
integer x = 1312
string text = "          &f"
string powertiptext = "Guardar y generar Recibo de Caja [Alt+F]"
end type

type pb_paci from w_factura_base`pb_paci within w_rec_caja
string text = "       &t"
string powertiptext = "Traer Procedimientos de Citas [Alt+T]"
end type

event pb_paci::clicked;call super::clicked;f_abrir_pendientes()
end event

type pb_emp from w_factura_base`pb_emp within w_rec_caja
boolean visible = false
integer x = 1079
integer y = 360
boolean enabled = false
end type

type pb_reimprimir from w_factura_base`pb_reimprimir within w_rec_caja
integer x = 992
end type

type pb_calcula from w_factura_base`pb_calcula within w_rec_caja
integer x = 1481
integer y = 420
end type

type dw_factura_cpo from w_factura_base`dw_factura_cpo within w_rec_caja
integer x = 3497
integer y = 256
integer width = 78
integer height = 124
end type

type st_5 from w_factura_base`st_5 within w_rec_caja
end type

type dw_rec_caj_cab from w_factura_base`dw_rec_caj_cab within w_rec_caja
end type

type pb_pagare from w_factura_base`pb_pagare within w_rec_caja
end type

type pb_parcial from w_factura_base`pb_parcial within w_rec_caja
end type

type dw_memory from w_factura_base`dw_memory within w_rec_caja
end type

type dw_acum_soat from w_factura_base`dw_acum_soat within w_rec_caja
boolean visible = false
end type

type dw_factura from w_factura_base`dw_factura within w_rec_caja
end type

type pb_faccon from w_factura_base`pb_faccon within w_rec_caja
end type

type dw_emppac from w_factura_base`dw_emppac within w_rec_caja
end type

type gb_6 from w_factura_base`gb_6 within w_rec_caja
end type

type st_siras from w_factura_base`st_siras within w_rec_caja
end type

type cbx_4 from w_factura_base`cbx_4 within w_rec_caja
end type

type pb_pagares from w_factura_base`pb_pagares within w_rec_caja
end type

type dw_reccaj_cpo from w_factura_base`dw_reccaj_cpo within w_rec_caja
end type

type gb_4 from w_factura_base`gb_4 within w_rec_caja
end type

type dw_tesodeta from datawindow within w_rec_caja
boolean visible = false
integer x = 704
integer y = 1864
integer width = 544
integer height = 100
integer taborder = 250
boolean bringtotop = true
boolean enabled = false
boolean titlebar = true
string title = "dw_tesodeta"
string dataobject = "dw_rec_caj_detalle"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_tesosubcpo from datawindow within w_rec_caja
boolean visible = false
integer x = 1257
integer y = 1864
integer width = 466
integer height = 100
integer taborder = 200
boolean bringtotop = true
boolean enabled = false
boolean titlebar = true
string title = "dw_tesosubcpo"
string dataobject = "dw_tesosubcpo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

