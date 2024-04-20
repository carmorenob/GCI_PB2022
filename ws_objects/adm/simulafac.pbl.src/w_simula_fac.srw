$PBExportHeader$w_simula_fac.srw
forward
global type w_simula_fac from window
end type
type pb_pagares from picturebutton within w_simula_fac
end type
type dw_kardexdeta from datawindow within w_simula_fac
end type
type dw_lote_mov from datawindow within w_simula_fac
end type
type pb_reci from pb_report within w_simula_fac
end type
type pb_factu from pb_report within w_simula_fac
end type
type dw_factadm from datawindow within w_simula_fac
end type
type dw_admis from datawindow within w_simula_fac
end type
type st_ayuda from statictext within w_simula_fac
end type
type pb_kit from picturebutton within w_simula_fac
end type
type cbx_equiv from checkbox within w_simula_fac
end type
type cbx_3 from checkbox within w_simula_fac
end type
type dw_acum_soat from datawindow within w_simula_fac
end type
type st_cuant from statictext within w_simula_fac
end type
type cbx_2 from checkbox within w_simula_fac
end type
type cbx_1 from checkbox within w_simula_fac
end type
type dw_segrespon from datawindow within w_simula_fac
end type
type sle_proc from singlelineedit within w_simula_fac
end type
type st_4 from statictext within w_simula_fac
end type
type st_3 from statictext within w_simula_fac
end type
type sle_autoriza from singlelineedit within w_simula_fac
end type
type pb_borra from picturebutton within w_simula_fac
end type
type dw_getareo from datawindow within w_simula_fac
end type
type dw_equiv from datawindow within w_simula_fac
end type
type st_2 from statictext within w_simula_fac
end type
type st_1 from statictext within w_simula_fac
end type
type sle_poliza from singlelineedit within w_simula_fac
end type
type dw_tarifas from datawindow within w_simula_fac
end type
type dw_cont_det from datawindow within w_simula_fac
end type
type pb_buscar from picturebutton within w_simula_fac
end type
type dw_tip_ingres from datawindow within w_simula_fac
end type
type dw_factura from datawindow within w_simula_fac
end type
type dw_resumen from datawindow within w_simula_fac
end type
type dw_forma_pago from datawindow within w_simula_fac
end type
type pb_soat from picturebutton within w_simula_fac
end type
type gb_1 from groupbox within w_simula_fac
end type
type gb_2 from groupbox within w_simula_fac
end type
type gb_3 from groupbox within w_simula_fac
end type
type gb_4 from groupbox within w_simula_fac
end type
type gb_6 from groupbox within w_simula_fac
end type
type pb_facturar from picturebutton within w_simula_fac
end type
type pb_calcula from picturebutton within w_simula_fac
end type
type dw_factura_cpo from datawindow within w_simula_fac
end type
type st_5 from statictext within w_simula_fac
end type
type dw_emppac from datawindow within w_simula_fac
end type
type dw_rec_caj_cab from datawindow within w_simula_fac
end type
type pb_pagare from pb_report within w_simula_fac
end type
type pb_parcial from pb_report within w_simula_fac
end type
type dw_memory from datawindow within w_simula_fac
end type
end forward

global type w_simula_fac from window
integer width = 3621
integer height = 2044
boolean titlebar = true
string title = "Facturación de Servicios"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "factura.ico"
event add_procs ( )
pb_pagares pb_pagares
dw_kardexdeta dw_kardexdeta
dw_lote_mov dw_lote_mov
pb_reci pb_reci
pb_factu pb_factu
dw_factadm dw_factadm
dw_admis dw_admis
st_ayuda st_ayuda
pb_kit pb_kit
cbx_equiv cbx_equiv
cbx_3 cbx_3
dw_acum_soat dw_acum_soat
st_cuant st_cuant
cbx_2 cbx_2
cbx_1 cbx_1
dw_segrespon dw_segrespon
sle_proc sle_proc
st_4 st_4
st_3 st_3
sle_autoriza sle_autoriza
pb_borra pb_borra
dw_getareo dw_getareo
dw_equiv dw_equiv
st_2 st_2
st_1 st_1
sle_poliza sle_poliza
dw_tarifas dw_tarifas
dw_cont_det dw_cont_det
pb_buscar pb_buscar
dw_tip_ingres dw_tip_ingres
dw_factura dw_factura
dw_resumen dw_resumen
dw_forma_pago dw_forma_pago
pb_soat pb_soat
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
gb_6 gb_6
pb_facturar pb_facturar
pb_calcula pb_calcula
dw_factura_cpo dw_factura_cpo
st_5 st_5
dw_emppac dw_emppac
dw_rec_caj_cab dw_rec_caj_cab
pb_pagare pb_pagare
pb_parcial pb_parcial
dw_memory dw_memory
end type
global w_simula_fac w_simula_fac

type variables
string i_tipoingreso,i_ventana,i_cdoc
string i_confirma_ge
int i_comprobo,i_dec_fact
long xant,yant
long i_nfactura,i_nrecibo
boolean i_otro_resp,i_reviso_multiples=false,i_tiene_base
transaction sqlba
//long i_cant_ant
string i_mueve_kardex,i_alm_cext,i_alm_hosp,i_alm_urg,i_alm_amb //todas son para mover kardex
string i_anterior,i_pideprof,i_tipo_prof ,i_profe,i_profe_ord ,i_orden

st_dws_revisa st_par
string td, doc

end variables

forward prototypes
public subroutine totales ()
public function real f_topes (string campo, string empre, string cont, string est)
public subroutine recalcula_todo ()
public subroutine blanquea ()
public subroutine vt_cancela ()
public function long f_memory (string p_cups, string p_proc_man, string p_cman)
public function integer f_lee_de_tarifas (long p_fila, string p_cproc_man, ref string p_cups, ref decimal p_valor, ref decimal p_por_iva, ref string p_rips, ref string p_cod_concep)
public function integer f_existe_proc (string p_codigo, ref string p_desproc)
public function integer f_lee_de_equiv (long p_fila, string p_cups, ref string p_cproc_man, ref string p_tiposerv, ref string p_grupo, ref long p_puntos, ref decimal p_valor, ref decimal p_por_iva, ref string p_rips, ref string p_cod_concep, ref string p_desproc)
public function integer f_se_paso (long p_fila, integer p_cant)
public function integer f_borra_fila (long p_fila)
public function integer f_abrir_pendientes ()
public subroutine resumen (string p_desde)
public function long f_es_soat (string p_emp, string p_cont, ref long p_cons_soat, ref string p_clug_soat, long p_contador, string p_clug_his, string p_desde)
public function long f_pagare (decimal p_valor, long p_nreci, string p_clug_rec)
public function long factura ()
public function long f_crea_entrega ()
public function long f_catastrofe ()
public function string f_que_paga (long p_fila, ref real p_percent, ref real p_tempo, ref real p_pormin, string p_tipo, ref real p_tope, string p_emp, string p_cont, string p_plan, string p_codta, string p_estrato, ref decimal p_copagofijo, ref decimal p_cuotarfija, ref decimal p_cuotamfija, string p_tipoing, ref decimal p_por_iva_crm)
public function integer f_cambiar_cant (long p_fila, long p_cant, string p_desde)
public function integer lf_cargar_a (string p_codigo, string p_desproc, long p_cantidad, string p_tipo, string p_tipoing, string p_autoriza, string p_cemp, string p_cont, long p_cons_soat, string p_clug_soat, string p_tdoc, string p_docu, long p_edad, string p_sexo, string p_codta, string p_estrato, string p_uf, string p_cc, string p_desde, integer p_facturar, long p_contador, string p_clug_his, long p_nserv, string p_prof_cir, string p_espe_cir, string p_via, integer p_acto, string p_tipo_cir, long p_ncita, string p_clug_cita, long p_nserv_cita, long p_sec_cant_cita, long p_nreci, string p_clug_rec, integer p_item_rec, long p_ntrat, string p_clug_trat, integer p_item_trat, string p_aneste, string p_cod_auxqx, long p_nro_insumo, long p_norden, long p_nitem_ord)
public subroutine f_cc (boolean esmedica, string calmacen, string p_cups, ref string p_uf, ref string p_cc, string p_tipoing)
public function integer f_edad_dias (datetime fnacimiento)
end prototypes

event add_procs();long f, fe
string cemp, ccontra, tingre

f = st_par.dw_proc.Find("selecc=1",1,st_par.dw_proc.RowCount())
//f = st_par.dw_proc.GetRow()
if f > 0 then
	cemp = st_par.dw_proc.GetItemString(f,'cemp')
	ccontra = st_par.dw_proc.GetItemString(f,'ccontrato')
	td = st_par.dw_proc.GetItemString(f,'tipodoc')
	doc= st_par.dw_proc.GetItemString(f,'documento')
	if isNull(st_par.dw_proc.GetItemString(f,'tingre')) then
		tingre = st_par.dw_fac.GetItemString(st_par.dw_fac.GetRow(),'codTingre')
	else
		tingre = st_par.dw_proc.GetItemString(f,'tingre')
	end if
	dw_tip_ingres.SetItem(1,'codtingre',tingre)
	if dw_emppac.retrieve(td,doc)=0 then
		messagebox("Atención","El paciente no tiene empresa asignada, no puede continuar")
		return
	end if	
	fe = dw_emppac.Find("codemp='" +cemp+"' and codcontrato='"+ccontra+"'",1,dw_emppac.RowCount())
	if fe > 0 then
		dw_emppac.ScrolltoRow(fe)
	end if
end if
do while f > 0
	if td = st_par.dw_proc.GetItemString(f,'tipodoc') and doc = st_par.dw_proc.GetItemString(f,'documento') then 
		sle_proc.Text  = st_par.dw_proc.GetItemString(f,'compute_1')
		sle_proc.TriggerEvent(modified!)
		if f = st_par.dw_proc.RowCount() then EXIT
		f = st_par.dw_proc.Find("selecc=1",f + 1,st_par.dw_proc.RowCount())
	end if
loop

end event

public subroutine totales ();if dw_factura.rowcount()=0 then
	dw_rec_caj_cab.reset()
	dw_rec_caj_cab.visible=false
	dw_resumen.reset()
//	pb_emp.enabled=true
//	pb_paci.enabled=true
	return
end if
//if not isvalid(w_factu_serv_emp) then //para no hacer el recibo de caja
	if dw_factura.getitemnumber(1,"vt_rec")>0 then
//		pb_pagares.visible=true
//		pb_pagares.enabled=true
//		dw_forma_pago.enabled=true
//		dw_forma_pago.visible=true
		if dw_rec_caj_cab.rowcount()=0 then dw_rec_caj_cab.insertrow(1)
		dw_rec_caj_cab.setitem(1,"no_reci",'0')
		dw_rec_caj_cab.setitem(1,"clugar",CLUGAR)
		dw_rec_caj_cab.setitem(1,"tipodoc",td)
		dw_rec_caj_cab.setitem(1,"documento",doc)
		dw_rec_caj_cab.setitem(1,"trecibo",round(dw_factura.getitemnumber(1,"vt_rec"),i_dec_fact))
		dw_rec_caj_cab.setitem(1,"tpago",round(dw_rec_caj_cab.getitemnumber(1,"trecibo")-dw_rec_caj_cab.getitemnumber(1,"tsaldo")-dw_rec_caj_cab.getitemnumber(1,"descuento"),i_dec_fact)) //t saldo es lo da por pagares
		dw_rec_caj_cab.setitem(1,"fpago",dw_forma_pago.getitemstring(1,1))
		dw_rec_caj_cab.setitem(1,"vt_iva",round(dw_factura.getitemdecimal(1,"t_iva"),i_dec_fact))
	else
		if dw_rec_caj_cab.rowcount()=1 then dw_rec_caj_cab.deleterow(1)
//		pb_pagares.visible=false
//		pb_pagares.enabled=false
//		dw_forma_pago.enabled=false
//		dw_forma_pago.visible=false
	end if
//end if	
if dw_factura.getitemnumber(1,"grupos")>1 then
	pb_calcula.visible=true
	pb_calcula.enabled=true
else
	pb_calcula.visible=false
	pb_calcula.enabled=false
end if

end subroutine

public function real f_topes (string campo, string empre, string cont, string est);//topecopago o topecuotarecu
long donde
donde=dw_emppac.find("codemp='"+empre+"' and codcontrato='"+cont+"'",1,dw_emppac.rowcount())
real tope
setnull(tope)
if donde=0 then
	string t_tope
	choose case campo
		case 'topecopago'
			select topecopago into :t_tope from contratos where codemp=:empre and codcontrato=:cont;
		case 'topecuotarecu'
			select topecoutarecu into :t_tope from contratos where codemp=:empre and codcontrato=:cont;
	end choose
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo contratos en Ftopes",sqlca.sqlerrtext)
		return -1
	end if
	if t_tope='1' then
		select tope into :tope from contratotest where cemp=:empre and  ccontrato=:cont and cestrato=:est;
		if sqlca.sqlcode=-1 then
			messagebox("Error leyendo contratotest",sqlca.sqlerrtext)
			return -1
		end if
		if sqlca.sqlnrows=0 then
			messagebox("Atención","Indicó que el contrato tiene tope por Copago o Cuota de Recuperación y estrato pero no lo configuró, revise esto en el Asistente de contratación")
			return -1
		end if
		return tope
	else
		return 0
	end if
else
	if dw_emppac.getitemstring(donde,campo)='1' then
		select tope into :tope from contratotest where cemp=:empre and  ccontrato=:cont and cestrato=:est;
		if sqlca.sqlcode=-1 then
			messagebox("Error leyendo contratotest",sqlca.sqlerrtext)
			return -1
		end if
		if sqlca.sqlnrows=0 then
			messagebox("Atención","Indicó que el contrato tiene tope por Copago o Cuota de Recuperación y estrato pero no lo configuró, revise esto en el Asistente de contratación")
			return -1
		end if
		return tope
	else
		return 0
	end if
end if
end function

public subroutine recalcula_todo ();// cuando cambian de responsable toca volver a calcular todo
// los copagos,topes,etc
long j,k,donde
string em,ct
for j= 1 to dw_resumen.rowcount()
	em=dw_resumen.getitemstring(j,"cemp")
	ct=dw_resumen.getitemstring(j,"ccont")
	k=dw_factura.find("cemp='"+em+"' and ccontrato='"+ct+"' and (isnull(nrcaj) or nrcaj=0)",1,dw_factura.rowcount())
	if k=0 then
		resumen('T')
	else
		f_cambiar_cant(k,dw_factura.getitemnumber(k,'cantidad'),'T')
	end if
next

end subroutine

public subroutine blanquea ();
end subroutine

public subroutine vt_cancela ();// rutina para calcular lo de resumen cuando hay descuentos y/o pagares
real tdescu,tapag,tpagare,tabono
long j,k
if dw_rec_caj_cab.rowcount()=1 then
	tapag=dw_resumen.getitemnumber(1,"compute_4")
	tpagare=dw_rec_caj_cab.getitemnumber(1,"tsaldo")
	tdescu=dw_rec_caj_cab.getitemnumber(1,"descuento")
	tabono=dw_resumen.getitemnumber(1,"s_vtabon")
	if dw_resumen.getitemnumber(1,"compute_5") <> tapag - tdescu -tpagare or dw_resumen.getitemnumber(1,"s_vtdesc")<>tdescu then
		for j=1 to dw_resumen.rowcount()
			if tdescu + tpagare +tabono <>0 then
				if dw_resumen.getitemnumber(j,"vtpac") <= tdescu then
					dw_resumen.setitem(j,"vtcancel",0)
					dw_resumen.setitem(j,'vtdesc', round(dw_resumen.getitemnumber(j,"vtpac"),i_dec_fact))
				elseif dw_resumen.getitemnumber(j,"vtpac") <= tdescu + tpagare then
					dw_resumen.setitem(j,"vtcancel",0)
					dw_resumen.setitem(j,'vtdesc',round(tdescu,i_dec_fact) )
				else
					dw_resumen.setitem(j,"vtcancel",round(dw_resumen.getitemnumber(j,"vtpac") - tdescu -tpagare -tabono,i_dec_fact))
					dw_resumen.setitem(j,'vtdesc',round(tdescu,i_dec_fact) )
				end if
				tdescu=tdescu - dw_resumen.getitemnumber(j,"vtdesc")
				tpagare=tpagare - dw_resumen.getitemnumber(j,"vtpac") +dw_resumen.getitemnumber(j,"vtdesc") +dw_resumen.getitemnumber(j,"vtcancel")
			else
				dw_resumen.setitem(j,"vtcancel",round(dw_resumen.getitemnumber(j,"vtpac"),i_dec_fact))
				dw_resumen.setitem(j,"vtdesc",0)
			end if
		next
	end if
end if
end subroutine

public function long f_memory (string p_cups, string p_proc_man, string p_cman);//se utiliza en sle_proc.modified y solo busca en dw_memory y si no lo encuentra => lo inserta
long memory
if p_cups='' then
	memory=dw_memory.find("manual='"+p_cman+"' and cproc='"+p_proc_man+"'",1,dw_memory.rowcount()) //not cbx_equiv.checked then
elseif p_proc_man<>'' then
	memory=dw_memory.find("proccups='"+p_cups+"' and manual='"+p_cman+"' and cproc='"+p_proc_man+"'",1,dw_memory.rowcount())	
else
	memory=dw_memory.find("proccups='"+p_cups+"' and manual='"+p_cman+"'",1,dw_memory.rowcount())
end if
if memory=0 then
	dw_memory.insertrow(1)
	dw_memory.setitem(1,"manual",p_cman)
	dw_memory.setitem(1,"cproc",p_proc_man)
	dw_memory.setitem(1,"proccups",p_cups)
end if
return memory
end function

public function integer f_lee_de_tarifas (long p_fila, string p_cproc_man, ref string p_cups, ref decimal p_valor, ref decimal p_por_iva, ref string p_rips, ref string p_cod_concep);//se utiliza en sle_proc.modified y es solo pa leer estas variables
p_cups=dw_tarifas.getitemstring(p_fila,"codproced")
p_valor=dw_tarifas.getitemdecimal(p_fila,"valor")
p_por_iva=dw_tarifas.getitemdecimal(p_fila,"iva")
if isnull(p_valor) then
	messagebox("Error de Tarifas","No existe valor en Tarifas para el procedimiento: "+p_cproc_man+" ("+p_cups+")")
	return -1
end if
p_rips=dw_tarifas.getitemstring(p_fila,"rips")
p_cod_concep=dw_tarifas.getitemstring(p_fila,"codconcepto")
return 1
end function

public function integer f_existe_proc (string p_codigo, ref string p_desproc);/// se utiliza en el codigo de sle_proc.modified es para saber de que tipo es lo que se digitó
select descripcion into :p_desproc from proced where codproced=:p_codigo and estado='1';
if sqlca.sqlnrows=0 or isnull(p_desproc) then
	select MIN(descripcion) into :p_desproc from serviciosman where codservicio=:p_codigo and estado='1';
	if sqlca.sqlnrows=0 or isnull(p_desproc) then
		select medicamento into:p_desproc from medicamentos where c_medica=:p_codigo and estado='1';
		if sqlca.sqlnrows=0 or isnull(p_desproc) then
			messagebox("Error","Este código no es procedimiento ni medicamento")
			return -1
		else
			return 3//es medicamento
		end if
	else
		return 2//es de manual
	end if
else
	return 1//es cups
end if

end function

public function integer f_lee_de_equiv (long p_fila, string p_cups, ref string p_cproc_man, ref string p_tiposerv, ref string p_grupo, ref long p_puntos, ref decimal p_valor, ref decimal p_por_iva, ref string p_rips, ref string p_cod_concep, ref string p_desproc);//se utiliza en el código de sle_proc.modified es solo para leer estas variables
p_cproc_man=dw_equiv.getitemstring(p_fila,"codservicio")
p_desproc=dw_equiv.getitemstring(p_fila,"descripcion")
p_tiposerv=dw_equiv.getitemstring(p_fila,"tiposervicio")
p_grupo=dw_equiv.getitemstring(p_fila,"grupo")
p_puntos=dw_equiv.getitemnumber(p_fila,"puntos")
p_valor=dw_equiv.getitemdecimal(p_fila,"valor")
p_por_iva=dw_equiv.getitemdecimal(p_fila,"iva")
if isnull(p_valor) then
	messagebox("Error de Tarifas","No existe valor en Tarifas para el procedimiento: "+p_cproc_man+" ("+p_cups+")")
	return -1
end if
p_rips=dw_equiv.getitemstring(p_fila,"rips")
p_cod_concep=dw_equiv.getitemstring(p_fila,"codconcepto")
return 1
end function

public function integer f_se_paso (long p_fila, integer p_cant);string emp,cont,cod,tipo,tingres,autoriza,clug_soat,tdo,docum,sexo,codta,estrato,uf,cc,desproc
string prof_cir,tip_cir,via,esp_cir
long edad,cons_soat,cant_ant,acto
cant_ant=dw_factura.getitemnumber(p_fila,'cantidad')
cod=dw_factura.getitemstring(p_fila,'proccups')
if dw_factura.getitemstring(p_fila,'es_medica')='1' then
	tipo='M'
else
	tipo='C'
end if
tingres = dw_factura.getitemstring(p_fila,'tingres')
autoriza = dw_factura.getitemstring(p_fila,'autoriza')
desproc = dw_factura.getitemstring(p_fila,'descripcion')
emp = dw_factura.getitemstring(p_fila,'cemp')
cont = dw_factura.getitemstring(p_fila,'ccontrato')
tdo = dw_factura.getitemstring(p_fila,'tipodoc')
docum = dw_factura.getitemstring(p_fila,'docu')
//edad = w_principal.dw_1.getitemnumber(1,'dias')
//sexo = w_principal.dw_1.getitemstring(1,'sexo')
codta = dw_factura.getitemstring(p_fila,'codta')
//estrato = w_principal.dw_1.getitemstring(1,'estrato')
uf = dw_factura.getitemstring(p_fila,'coduf')
cc = dw_factura.getitemstring(p_fila,'codcc')
prof_cir = dw_factura.getitemstring(p_fila,'profe')
esp_cir = dw_factura.getitemstring(p_fila,'espe')
via = dw_factura.getitemstring(p_fila,'via')
tip_cir = dw_factura.getitemstring(p_fila,'tipo_cir')
acto = dw_factura.getitemnumber(p_fila,'acto')
//36 parametros ( p_codigo, p_desproc,p_cantidad,  p_tipo,  p_tipoing,  p_autoriza,  p_cemp,  p_cont,  p_cons_soat, 
//  p_clug_soat,  p_tdoc,  p_docu,  p_edad,  p_sexo,  p_codta, p_estrato, p_uf,  p_cc,  p_desde,  p_facturar,  p_contador, 
//  p_clug_his,  p_nserv,  p_prof_cir,  p_espe_cir,  p_via,  p_acto,  p_tipo_cir,  p_ncita,p_clug_cit,  p_nserv_cita, 
//  p_sec_cant_cita,  p_nreci,  p_clug_rec,  p_item_rec,  p_ntrat, p_clug_trat, p_item_trat)
if cant_ant=0 then f_borra_fila(p_fila)
return lf_cargar_a(cod,desproc,p_cant,tipo,tingres,autoriza,emp,cont,cons_soat, &
  clug_soat,tdo,docum,edad,sexo,codta,estrato,uf,cc,'P',1,0, &
  '',0,prof_cir,esp_cir,via,acto,tip_cir,0,'',0,&
  0,0,'',0,0,'',0,dw_factura.getitemstring(p_fila,'aneste'),dw_factura.getitemstring(p_fila,'cod_auxqx'),dw_factura.getitemnumber(p_fila,'nro_insumo'),dw_factura.getitemnumber(p_fila,'norden'),dw_factura.getitemnumber(p_fila,'nitem_ord'))

end function

public function integer f_borra_fila (long p_fila);long j,k
real tope
string empre,contr
if dw_factura.getitemstring(p_fila,"tipo_proc")='Q' or dw_factura.getitemstring(p_fila,"tipo_proc")='P' then i_reviso_multiples=false
if dw_factura.getitemstring(p_fila,"tipo_proc")='Q' then
	dw_factura_cpo.setfilter("num_padre="+string(dw_factura.getitemnumber(p_fila,'numero')))
	dw_factura_cpo.filter()
	j=dw_factura_cpo.rowcount()
	for k=1 to j
		dw_factura_cpo.deleterow(0)
	next
	dw_factura_cpo.setfilter("")
	dw_factura_cpo.filter()
end if
dw_lote_mov.setfilter('item='+string(dw_factura.getitemnumber(p_fila,'numero')))
dw_lote_mov.filter()
do while dw_lote_mov.rowcount()>0
	dw_lote_mov.deleterow(0)
loop
dw_lote_mov.setfilter('')
dw_lote_mov.filter()
tope=dw_factura.getitemnumber(p_fila,"tope")
empre=dw_factura.getitemstring(p_fila,"cemp")
contr=dw_factura.getitemstring(p_fila,"ccontrato")
string l_emp,l_cont
dw_factura.deleterow(p_fila)
for k=p_fila to dw_factura.rowcount()
	long antes
	antes=dw_factura.getitemnumber(k,"numero")
	dw_factura.setitem(k,"numero",k)
	if dw_factura.getitemstring(k,"tipo_proc")="Q" then
		dw_factura_cpo.setfilter("num_padre="+string(antes))
		dw_factura_cpo.filter()
		for j=1 to dw_factura_cpo.rowcount()
			dw_factura_cpo.setitem(j,"num_padre",k)
		next
		dw_factura_cpo.setfilter("")
		dw_factura_cpo.filter()
	end if
next
for k=1 to dw_factura.rowcount()
	long fijo,cuantos,nrc
	real pedazo
	fijo=dw_factura.getitemnumber(k,"cuanto_fijo")
	if fijo>0 then
		string em,ct,pl,l_td,l_doc
		em=dw_factura.getitemstring(k,"cemp")
		ct=dw_factura.getitemstring(k,"ccontrato")
		pl=dw_factura.getitemstring(k,"plan")
		l_td=dw_factura.getitemstring(k,"tipodoc")
		l_doc=dw_factura.getitemstring(k,"docu")
		nrc=dw_factura.getitemnumber(k,"nrcaj")
		if not isnull(nrc) or nrc=0 then
			dw_factura.setfilter("cemp='"+em+"' and ccontrato='"+ct+"' and plan='"+pl+"' and que_paga<>'nada' and nrcaj="+string(nrc)+" and tipodoc='"+l_td+"' and docu='"+l_doc+"'")
		else
			dw_factura.setfilter("cemp='"+em+"' and ccontrato='"+ct+"' and plan='"+pl+"' and que_paga<>'nada' and tipodoc='"+l_td+"' and docu='"+l_doc+"'")
		end if
		dw_factura.filter()
		cuantos=dw_factura.getitemnumber(1,"t_cantidad")
		pedazo=fijo/cuantos
		for j= 1 to dw_factura.rowcount()
			dw_factura.setitem(j,"vt_emp",round((dw_factura.getitemnumber(j,"vp_unit") - pedazo)*dw_factura.getitemnumber(j,"cantidad"),i_dec_fact))
			dw_factura.setitem(j,"vt_pac",round(pedazo*dw_factura.getitemnumber(j,"cantidad"),i_dec_fact))
		next
		dw_factura.setfilter("")
		dw_factura.filter()
	end if
next
if tope>0 then
	real acum=0
	dw_factura.setfilter("cemp='"+empre+"' and ccontrato='"+contr+"'")
	dw_factura.filter()
	for k=1 to dw_factura.rowcount()
		if dw_factura.getitemnumber(k,"cuanto_fijo")>0 then
			dw_factura.setitem(k,"vt_pac",round(dw_factura.getitemnumber(k,"vt_proc") -dw_factura.getitemnumber(k,"cuanto_fijo"),i_dec_fact))
		else
			dw_factura.setitem(k,"vt_pac",round(dw_factura.getitemnumber(k,"vt_proc") * dw_factura.getitemnumber(k,"percent_pac")/100,i_dec_fact))
		end if
		dw_factura.setitem(k,"vt_emp",round(dw_factura.getitemnumber(k,"vt_proc") -dw_factura.getitemnumber(k,"vt_pac") ,i_dec_fact))
		if tope<acum +dw_factura.getitemnumber(k,"vt_pac") then
			dw_factura.setitem(k,"vt_pac", round(tope - acum,i_dec_fact))
			dw_factura.setitem(k,"vt_emp", round(dw_factura.getitemnumber(k,"vt_proc") -dw_factura.getitemnumber(k,"vt_pac"),i_dec_fact))
			acum=tope
		else
			acum+=dw_factura.getitemnumber(k,"vt_pac")
		end if
	next
	dw_factura.setfilter("")
	dw_factura.filter()
end if
resumen('')
dw_factura.sort()
dw_factura.triggerevent(rowfocuschanged!)
return 1
end function

public function integer f_abrir_pendientes ();//if docu='' or isnull(docu) then return 0
//open(w_factu_serv)
return 1
end function

public subroutine resumen (string p_desde);dw_resumen.setredraw(false)
dw_resumen.reset()
long j,donde,k
real tempo,vtpart
string tempo_s
for j=1 to dw_factura.rowcount()
	if not isnull(dw_factura.getitemstring(j,"cemp")) then
		donde=dw_resumen.find("cemp='"+dw_factura.getitemstring(j,"cemp")+"' and ccont='"+dw_factura.getitemstring(j,"ccontrato")+"'",1,dw_resumen.rowcount())
		if donde=0 then donde=dw_resumen.insertrow(0)
		dw_resumen.setitem(donde,"cemp",dw_factura.getitemstring(j,"cemp"))
		dw_resumen.setitem(donde,"ccont",dw_factura.getitemstring(j,"ccontrato"))
		dw_resumen.setitem(donde,"des_cont",dw_factura.getitemstring(j,"des_cont"))
		if p_desde='G' then
			dw_resumen.setitem(donde,"imp_cita",'0')
		else
			dw_resumen.setitem(donde,"imp_cita",'1')
		end if
		tempo=dw_factura.getitemnumber(j,"vt_proc")
		dw_resumen.setitem(donde,"vtotal",round(dw_resumen.getitemnumber(donde,"vtotal")+tempo,i_dec_fact))
		tempo=dw_factura.getitemnumber(j,"vt_emp")
		dw_resumen.setitem(donde,"vtemp",round(dw_resumen.getitemnumber(donde,"vtemp")+tempo,i_dec_fact))
		tempo=dw_factura.getitemnumber(j,"cantidad")
		
		tempo=dw_factura.getitemnumber(j,"iva")
		dw_resumen.setitem(donde,"vtiva",round(dw_resumen.getitemnumber(donde,"vtiva")+tempo,i_dec_fact))
		
		dw_resumen.setitem(donde,"tcant",round(dw_resumen.getitemnumber(donde,"tcant")+dw_factura.getitemnumber(j,'cantidad'),i_dec_fact))
		tempo_s=dw_factura.getitemstring(j,"que_paga")
		tempo=dw_factura.getitemnumber(j,"vt_pac")
		dw_resumen.setitem(donde,"vtpac",round(dw_resumen.getitemnumber(donde,"vtpac")+tempo+dw_factura.getitemnumber(j,"iva_crm"),i_dec_fact))
		dw_resumen.setitem(donde,"vtcancel",round(dw_resumen.getitemnumber(donde,"vtpac"),i_dec_fact))
		choose case tempo_s
			case "Copago"
				dw_resumen.setitem(donde,'iva_cp',round(dw_resumen.getitemnumber(donde,"iva_cp")+dw_factura.getitemnumber(j,"iva_crm"),i_dec_fact))
				dw_resumen.setitem(donde,"vtcop",round(dw_resumen.getitemnumber(donde,"vtcop")+tempo,i_dec_fact))
			case "Cuota Mode."
				dw_resumen.setitem(donde,'iva_cm',round(dw_resumen.getitemnumber(donde,"iva_cm")+dw_factura.getitemnumber(j,"iva_crm"),i_dec_fact))
				dw_resumen.setitem(donde,"vtcm",round(dw_resumen.getitemnumber(donde,"vtcm")+tempo,i_dec_fact))
			case "Cuota Recu."
				dw_resumen.setitem(donde,'iva_cr',round(dw_resumen.getitemnumber(donde,"iva_cr")+dw_factura.getitemnumber(j,"iva_crm"),i_dec_fact))
				dw_resumen.setitem(donde,"vtcr",round(dw_resumen.getitemnumber(donde,"vtcr")+tempo,i_dec_fact))
			case "particular"
				dw_resumen.setitem(donde,"vtpar",round(dw_resumen.getitemnumber(donde,"vtpar")+tempo,i_dec_fact))
		end choose
		vtpart=dw_factura.getitemnumber(j,"v_part")
		if vtpart>0 then
			dw_resumen.setitem(donde,"vtpac",round(dw_resumen.getitemnumber(donde,"vtpac")+vtpart,i_dec_fact))
			dw_resumen.setitem(donde,"vtcancel",round(dw_resumen.getitemnumber(donde,"vtcancel")+vtpart,i_dec_fact))
			dw_resumen.setitem(donde,"vtpar",round(dw_resumen.getitemnumber(donde,"vtpar")+vtpart,i_dec_fact))
		end if
	else //debe ser un abono
		real abono
		abono= - dw_factura.getitemnumber(j,'vt_pac')
		for k	= 1 to dw_resumen.rowcount()
			if dw_resumen.getitemnumber(k,'vtcancel')<abono then
				dw_resumen.setitem(k,'vtabon',round(dw_resumen.getitemnumber(k,'vtabon')+dw_resumen.getitemnumber(k,'vtcancel'),i_dec_fact))
				dw_resumen.setitem(k,'vtcancel',0)
				//dw_resumen.setitem(k,'vtpac',0)
				abono -= dw_resumen.getitemnumber(k,'vtcancel')
			else
				//dw_resumen.setitem(k,'vtpac',round(dw_resumen.getitemnumber(k,'vtpac') /*- abono*/,i_dec_fact))
				dw_resumen.setitem(k,'vtcancel',round(dw_resumen.getitemnumber(k,'vtpac') -abono,i_dec_fact))
				dw_resumen.setitem(k,'vtabon',round(dw_resumen.getitemnumber(k,'vtabon')+abono,i_dec_fact))
				abono=0
			end if
		next
	end if
next
string em,ct
for j=1 to dw_resumen.rowcount()
	em=dw_resumen.getitemstring(j,"cemp")
	ct=dw_resumen.getitemstring(j,"ccont")
	donde=dw_acum_soat.find("emp='"+em+"' and cont='"+ct+"'",1,dw_acum_soat.rowcount())
	if donde<>0 then dw_acum_soat.setitem(donde,'lleva',dw_resumen.getitemnumber(j,'vtemp'))
next
dw_factura.setredraw(true)
dw_resumen.setredraw(true)
totales()//mira si hay que hacer recibo o no
vt_cancela()

end subroutine

public function long f_es_soat (string p_emp, string p_cont, ref long p_cons_soat, ref string p_clug_soat, long p_contador, string p_clug_his, string p_desde);// revisa si la empresa y contrato son de soat, si lo es retorna la fila de dw_acum_soat de la poliza
// si no es de soat retorna 0
// si hay error retorna -1
string soat
if p_desde<>'G' then
	select soat into :soat from contratos where codemp=:p_emp and codcontrato=:p_cont;
	if sqlca.sqlcode=-1 then
		messagebox('Error leyendo Soat',sqlca.sqlerrtext)
		return -1
	end if
else
	soat='0'
end if
long donde
if soat='1' then
	donde=dw_acum_soat.find("emp='"+p_emp+"' and cont='"+p_cont+"'",1,dw_acum_soat.rowcount())
	if donde=0 then
		st_soat st
		if not isnull(p_cons_soat) then
			dw_acum_soat.retrieve(p_cons_soat,p_clug_soat)
			donde=dw_acum_soat.find("emp='"+p_emp+"' and cont='"+p_cont+"'",1,dw_acum_soat.rowcount())
			if donde=0 then
				setnull(st.nsoat)
				setnull(st.clug_soat)
				st.newemp=p_emp
				st.newcont=p_cont
				setnull(st.contador)
				setnull(st.clug_his)
				openwithparm(w_soat,st)
				if message.stringparm="!" or not isvalid(message.powerobjectparm) then return -1
				st=message.powerobjectparm
				p_clug_soat=st.clug_soat
				p_cons_soat=st.nsoat
				dw_acum_soat.retrieve(p_cons_soat,p_clug_soat)
				donde=dw_acum_soat.find("emp='"+p_emp+"' and cont='"+p_cont+"'",1,dw_acum_soat.rowcount())
				message.stringparm=""
			else
				p_clug_soat=dw_acum_soat.getitemstring(donde,'clug_soat')
				p_cons_soat=dw_acum_soat.getitemnumber(donde,'consec')
			end if
		else
			setnull(st.nsoat)
			setnull(st.clug_soat)
			st.newemp=p_emp
			st.newcont=p_cont
			setnull(st.contador)
			setnull(st.clug_his)
			openwithparm(w_soat,st)
			if message.stringparm="!" or not isvalid(message.powerobjectparm) then return -1
			st=message.powerobjectparm
			p_clug_soat=st.clug_soat
			p_cons_soat=st.nsoat
			dw_acum_soat.retrieve(p_cons_soat,p_clug_soat)
			donde=dw_acum_soat.find("emp='"+p_emp+"' and cont='"+p_cont+"'",1,dw_acum_soat.rowcount())
			message.stringparm=""
		end if
	else
		p_clug_soat=dw_acum_soat.getitemstring(donde,'clug_soat')
		p_cons_soat=dw_acum_soat.getitemnumber(donde,'consec')
	end if
	return donde
else
	return 0
end if

end function

public function long f_pagare (decimal p_valor, long p_nreci, string p_clug_rec);long npagare
setnull(npagare)
npagare=f_trae_ndoc('PA',clugar,'Pagarés')
if npagare=-1 then return -1
datetime hoy
hoy=datetime(today())
insert into tesopagarecab (npagare,clugar,fecha,tipodoc,documento,valor,nrecibo,clugar_rec) values
(:npagare,:clugar,:hoy,:td,:doc,:p_valor,:p_nreci,:p_clug_rec);
if sqlca.sqlcode=-1 then
	messagebox("Error insertando pagaré",sqlca.sqlerrtext)
	return -1
end if
return npagare

end function

public function long factura ();if not f_demo('pac') then return -1
end function

public function long f_crea_entrega ();dw_lote_mov.setfilter('')
dw_lote_mov.filter()
dw_lote_mov.setsort('numdoc A')
dw_lote_mov.sort()
long item,j,ndoc,cantidad,ndoc_orig=0,itemref,fila,cants,saldo,cabezas[],lleva=0,k,item_rec
string lug_doc,cdoc,cmedica,articulo
datetime fecha
dec valorprom,valor
int ano,mes

fecha=datetime(today(),now())
select clugar_entre,cod_doc_entre into :lug_doc,:cdoc from sumalmacen where codalmacen=:i_alm_cext;
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo documento de almacen",sqlca.sqlerrtext)
	return -1
end if
for j=1 to dw_lote_mov.rowcount()//se crea una cabeza por cada factura (recibo de caja es solo uno)
	if ndoc_orig<>dw_lote_mov.getitemnumber(j,'nfact') then
		ndoc_orig=dw_lote_mov.getitemnumber(j,'nfact')
		ndoc=f_trae_ndoc(cdoc,lug_doc,'Entrega Interna de farmacia')
		if ndoc=-1 then return -1
		lleva++
		cabezas[lleva]=ndoc
		insert into sum_mvto_cab (coddoc,clugar,numdoc,fecha,codalmacen,estado,usuario) 
		values (:cdoc,:clugar,:ndoc,:fecha,:i_alm_cext,'1',:usuario);
		if sqlca.sqlcode=-1 then
			messagebox("Error Insertando en sum_mvto_cab",sqlca.sqlerrtext)
			return -1
		end if
	end if
	dw_lote_mov.setitem(j,'numdoc',ndoc)
	dw_lote_mov.setitem(j,'coddoc',cdoc)
	dw_lote_mov.setitem(j,'clugar',lug_doc)
next
for k=1 to lleva
	dw_lote_mov.setfilter('numdoc='+string(cabezas[k]))
	dw_lote_mov.filter()
	for j=1 to dw_lote_mov.rowcount()
		dw_lote_mov.setitem(j,'item',j)
		cmedica=dw_lote_mov.getitemstring(j,'cmedica')
		articulo=dw_lote_mov.getitemstring(j,'codarticulo')
		cantidad=dw_lote_mov.getitemnumber(j,'cantidad')
		ndoc=dw_lote_mov.getitemnumber(j,'numdoc')
		
		ndoc_orig=dw_lote_mov.getitemnumber(j,'nfact')
		itemref=dw_lote_mov.getitemnumber(j,'item_fc')
		
		select costoprom into :valorprom from sum_kardex 
		where codalmacen=:i_alm_cext and codarticulo=:articulo;
		if sqlca.sqlcode=-1 then
			messagebox("Error leyendo costo promedio",sqlca.sqlerrtext)
			return -1
		end if
		valorprom=round(valorprom,2)
		dw_lote_mov.setitem(j,'vprom',valorprom)
		if i_cdoc='FC' then
			insert into sum_mvto_cpo (coddoc,clugar,numdoc,item,codarticulo,cantidad,atendido,nfact,clug_fac,nitem_fac,valor_unit)
			values(:cdoc,:clugar,:ndoc,:j,:articulo,:cantidad,0,:ndoc_orig,:clugar,:itemref,:valorprom);
		else
			item_rec=dw_lote_mov.getitemnumber(j,'item_rec')
			insert into sum_mvto_cpo (coddoc,clugar,numdoc,item,codarticulo,cantidad,atendido,nrcaj,clug_rec,items_rec,nitem_rec,valor_unit)
			values(:cdoc,:clugar,:ndoc,:j,:articulo,:cantidad,0,:ndoc_orig,:clugar,:item_rec,:itemref,:valorprom);
		end if
		if sqlca.sqlcode=-1 then
			messagebox("Error Insertando en sum_mvto_cpo",sqlca.sqlerrtext)
			return -1
		end if
	next
next
dw_lote_mov.setfilter('')
dw_lote_mov.filter()
for j=1 to dw_lote_mov.rowcount()
	articulo=dw_lote_mov.getitemstring(j,'codarticulo')
	cantidad=dw_lote_mov.getitemnumber(j,'cantidad')
	ndoc=dw_lote_mov.getitemnumber(j,'numdoc')
	itemref=dw_lote_mov.getitemnumber(j,'item')
	update sum_kardex set sum_kardex.saldoactual = sum_kardex.saldoactual - :cantidad 
	where codalmacen=:i_alm_cext and codarticulo=:articulo and saldoactual>= :cantidad;
	if sqlca.sqlcode=-1 then
		messagebox("Error actualizando sum_kardex",sqlca.sqlerrtext)
		return -1
	end if
	if sqlca.sqlnrows<=0 then
		messagebox("Atención","No hay existencias para el artículo "+articulo)
		return -1
	end if
	
	
	valorprom=round(dw_lote_mov.getitemnumber(j,'vprom'),2)
	
	ano=year(today())
	mes=month(today())
	/////////
	//Actualiza Kardex_Deta
//	fila = dw_kardexdeta.Retrieve(i_alm_cext,articulo,ano,mes)
//	if fila > 0 then
//		cants = dw_kardexdeta.GetItemNumber(fila,'salidascant')
//		if isNull(cants) then cants= 0
//		dw_kardexdeta.SetItem(fila,'salidascant',cants + cantidad)
//		
//		valor = dw_kardexdeta.GetItemNumber(fila,'salidasvalor')
//		if isNull(valor) then valor = 0
//		dw_kardexdeta.SetItem(fila,'salidasvalor',round(valor + cantidad * valorprom,2))
//	else
//		fila = dw_kardexdeta.InsertRow(0)
//		dw_kardexdeta.SetItem(fila,'codalmacen', i_alm_cext)
//		dw_kardexdeta.SetItem(fila,'codarti', articulo)
//		dw_kardexdeta.SetItem(fila,'ano', ano)
//		dw_kardexdeta.SetItem(fila,'mes', mes)
//		dw_kardexdeta.SetItem(fila,'salidascant', cantidad)
//		dw_kardexdeta.SetItem(fila,'salidasvalor', round(cantidad * valorprom,2))
//		dw_kardexdeta.SetItem(fila,'entradascant', 0)
//		dw_kardexdeta.SetItem(fila,'entradasvalor', 0)
//		dw_kardexdeta.SetItem(fila,'costoprom', valorprom)
//		dw_kardexdeta.SetItem(fila,'saldoinicial', saldo+cantidad)
//		dw_kardexdeta.SetItem(fila,'costoprominicial', valorprom)	
//	end if
//	if dw_kardexdeta.Update() = -1 then
//		messagebox('Error actualizando Sum_Kardex_Deta',sqlca.sqlerrtext)
//		Return -1
//	end if
	//
	setnull(item)
	select max(item) into :item from sum_kardex_mov 
	where CODALMACEN=:i_alm_cext and CODARTI=:articulo and ANO=:ano and MES=:mes;
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo item de sum_kardex_mov",sqlca.sqlerrtext)
		return -1
	end if

	fecha=datetime(today())
	if isnull(item) then item =0
	item ++
	INSERT INTO sum_kardex_mov ( CODALMACEN, CODARTI, ANO, MES, ITEM, FECHA, USUARIO, CODDOCREF, CLUGARREF, NUMDOCREF, ITEMREF, ENTRADACANT, SALIDACANT, VALORUNIT, COS_PROM_ANT ) values
	(:i_alm_cext,:articulo,:ano,:mes,:item,:fecha,:usuario,:cdoc,:lug_doc,:ndoc,:itemref,0,:cantidad,:valorprom,:valorprom);
	if sqlca.sqlcode=-1 then
		messagebox("Error insertando en sum_kardex_mov",sqlca.sqlerrtext)
		return -1
	end if
next
//if f_mueve_lote(dw_lote_mov,0)=-1 then
//	blanquea()
//	return -1
//end if
return ndoc
end function

public function long f_catastrofe ();// revisa si la empresa y contrato son de soat, si lo es retorna la fila de dw_acum_soat de la poliza
// si no es de soat retorna 0
// si hay error retorna -1
if i_tipoingreso<>'1' then return 0
long j
string emp,cont,catas
for j=1 to dw_resumen.rowcount()
	if not isnull(dw_resumen.getitemnumber(j,'ncatas')) then continue
	emp=dw_resumen.getitemstring(j,'cemp')
	cont=dw_resumen.getitemstring(j,'ccont')
	select catastrofe into :catas from contratos where codemp=:emp and codcontrato=:cont;
	if sqlca.sqlcode=-1 then
		messagebox('Error leyendo Contratos',sqlca.sqlerrtext)
		return -1
	end if
	if catas='1' then
		openwithparm(w_catastrofes,'nuevo')
		trae trae2
		trae2=message.powerobjectparm
		if isvalid(trae2) then 
			dw_resumen.setitem(j,'ncatas',trae2.numero)
			dw_resumen.setitem(j,'clug_catas',trae2.lugar)
		else
			return -1
		end if
	end if
next
return 1

end function

public function string f_que_paga (long p_fila, ref real p_percent, ref real p_tempo, ref real p_pormin, string p_tipo, ref real p_tope, string p_emp, string p_cont, string p_plan, string p_codta, string p_estrato, ref decimal p_copagofijo, ref decimal p_cuotarfija, ref decimal p_cuotamfija, string p_tipoing, ref decimal p_por_iva_crm);string l_que_paga
if dw_cont_det.getitemstring(p_fila,"copago")='1' then
	l_que_paga="Copago"
	setnull(p_percent)
	SELECT MinimoPor,copagoval,MaximoPor ,por_iva into :p_pormin ,:p_tempo,:p_percent ,:p_por_iva_crm
	FROM ContratoEstC WHERE CEmp=:p_emp AND CContrato=:p_cont AND Cplan=:p_plan AND CodTIngre=:p_tipoing AND Tipo=:p_tipo AND  /* tipo es 2 por getareo*/  CEstrato=:p_estrato;						
	if isnull(p_percent) or sqlca.sqlnrows=0 then
		messagebox("Error de configuración","No se ha configurado valor de copago para este estrato y este contrato")
		dw_emppac.triggerevent(rowfocuschanged!)
		return '!'
	end if
	if isnull(p_por_iva_crm) then p_por_iva_crm=0
	if p_tempo<>0 and p_percent=0 then p_copagofijo=p_tempo
	// TOPES
	p_tope=f_topes('topecopago',p_emp,p_cont,p_estrato)
	if p_tope=-1 then return '!'
	return l_que_paga
end if
if dw_cont_det.getitemstring(p_fila,"cuotamode")='1' then
	l_que_paga="Cuota Mode."
	setnull(p_percent)
	SELECT MinimoPor,CMVal,MaximoPor,por_iva into :p_pormin,:p_tempo,:p_percent ,:p_por_iva_crm
	FROM ContratoEstCM WHERE CEmp=:p_emp AND CContrato=:p_cont AND Cplan=:p_plan AND CodTIngre=:p_tipoing AND Tipo=:p_tipo AND  /*tipo es 1 por general*/ CEstrato=:p_estrato;
	if isnull(p_percent) or sqlca.sqlnrows=0 then
		messagebox("Error de configuración","No se ha configurado valor de Cuota moderadora para este estrato y este contrato")
		dw_emppac.triggerevent(rowfocuschanged!)
		return '!'
	end if
	if isnull(p_por_iva_crm) then p_por_iva_crm=0
	if p_tempo<>0 and p_percent=0 then p_cuotamfija=p_tempo
	return l_que_paga
end if
if dw_cont_det.getitemstring(p_fila,"cuotarecu")='1' then
	l_que_paga="Cuota Recu."
	setnull(p_percent)
	SELECT MinimoPor,CuotaRecVal,MaximoPor,por_iva into :p_pormin,:p_tempo,:p_percent ,:p_por_iva_crm
	FROM ContratoEstCR WHERE CEmp=:p_emp AND CContrato=:p_cont AND Cplan=:p_plan AND CodTIngre=:p_tipoing AND Tipo=:p_tipo AND  /*tipo es 1 por general*/ CEstrato=:p_estrato;
	if isnull(p_percent) or sqlca.sqlnrows=0 then
		messagebox("Error de configuración","No se ha configurado valor de Cuota de Recuperación para este estrato y este contrato")
		dw_emppac.triggerevent(rowfocuschanged!)
		return '!'
	end if
	if isnull(p_por_iva_crm) then p_por_iva_crm=0
	if p_tempo<>0 and p_percent=0 then p_cuotarfija=p_tempo
	// TOPES
	p_tope=f_topes('topecuotarecu',p_emp,p_cont,p_estrato)
	if p_tope=-1 then return '!'
	return l_que_paga
end if
if dw_cont_det.getitemstring(p_fila,"tipoafil")="1" then
	setnull(l_que_paga)
	SELECT ContratoTA.paga, ContratoTA.pormin, ContratoTA.valor,pormaximo ,por_iva
	into :l_que_paga,:p_pormin,:p_tempo,:p_percent,:p_por_iva_crm
	FROM ContratoTA WHERE ContratoTA.CEmp=:p_emp AND ContratoTA.CContrato=:p_cont AND ContratoTA.Cplan=:p_plan AND ContratoTA.CodTIngre=:p_tipoing AND ContratoTA.Tipo=:p_tipo AND ContratoTA.TAfil=:p_codta AND ContratoTA.CEstrato=:p_estrato;
	if isnull(l_que_paga) or sqlca.sqlnrows=0 then
		messagebox("Error de configuración","Se indicó que tiene excepción por Grupo Etareo ,Tipo de afiliado y estrato; pero no se configuró esto, la tabla ContratoTa no tiene los respectivos valores")
		dw_emppac.triggerevent(rowfocuschanged!)
		return '!'
	end if
	if isnull(p_por_iva_crm) then p_por_iva_crm=0
	choose case l_que_paga
		case "1" //copago
			l_que_paga="Copago"
			if p_tempo<>0 and p_percent=0 then p_copagofijo=p_tempo
			// TOPES
			p_tope=f_topes('topecopago',p_emp,p_cont,p_estrato)
			if p_tope=-1 then return '!'
		case "2" //couta mode
			l_que_paga="Cuota Mode."
			if p_tempo<>0 and p_percent=0 then p_cuotamfija=p_tempo
		case "3" //cuota rec
			l_que_paga="Cuota Recu."
			if p_tempo<>0 and p_percent=0 then p_cuotarfija=p_tempo
			// TOPES
			p_tope=f_topes('topecuotarecu',p_emp,p_cont,p_estrato)
			if p_tope=-1 then return '!'
	end choose
	if isnull(p_tempo) and isnull(p_percent) then
		p_tempo=0
		p_percent=0
	end if
	if p_tempo=0 and p_percent=0 then l_que_paga="nada"								
	return l_que_paga
end if
if dw_cont_det.getitemstring(p_fila,"pagopart")="1" then
	p_pormin=100
	p_tope=0
	p_percent =100
	l_que_paga="particular"
	return l_que_paga
end if
if isnull(p_percent) and isnull(p_tempo) then
	p_percent=0
	l_que_paga="nada"
end if
return l_que_paga
end function

public function integer f_cambiar_cant (long p_fila, long p_cant, string p_desde);//p desde es desde donde se le mando la interface
//		'C': Citas
//		'G': Cuenta global por empresa
//		'H': Hosp/Urg
//		'' : Directa desde sle
//		'S': Serv ya prestados/Citas/Odonto
// internos(desde la misma ventana):
//		'P': cuando se pasan los topes de soat
//		'M': Desde la malla.
//		'%': Cuando cambian los porcentajes.
//		'R': Cambio de Responsable
//		'Q': cuando se recalculó un qx
//		'T': Recalcular Todo

long busca,acum,sepasa,k
dec l_copagofijo,l_cuotarfija,l_cuotamfija
sepasa=0
real ctope
string tipoing
dw_factura.setredraw(false)
tipoing=dw_factura.getitemstring(p_fila,'tingres')
if dw_factura.getitemstring(p_fila,"es_medica")='1' then//si es medica debe mover kardex si está configurado
	if i_mueve_kardex='1' then
		if tipoing='1' then
			if not isnull(dw_factura.getitemnumber(p_fila,"nrcaj"))  then
				if p_desde<>'S' and p_desde<>'G' then
					messagebox("Atención","No puede cambiar la cantidad ya que viene de un recibo de caja")
					return -1
				end if
			elseif p_desde='M' then
				long existe
				string articulo
//				articulo=f_check_kardex(dw_factura.getitemstring(p_fila,'cproc'),i_alm_cext,p_cant,dw_lote_mov,dw_factura.getitemnumber(p_fila,'numero'),i_cdoc)
				if articulo="!" then
					messagebox("Atención","No hay existencias de este producto en Bodega")
					return -1
				end if

			end if
		end if
	end if
end if//fin si es medica debe mover kardex si está configurado
//ojo   if i_cant_ant=0 then i_cant_ant=getitemnumber(getrow(),"cantidad")
long sumcuantos,j,nrc,cons_soat,asumar
real vproc,percent,cuantos,pedazo
string em,ct,pl,l_td,l_doc,clug_soat
dec iva
em=dw_factura.getitemstring(p_fila,"cemp")
if isnull(em) then//cuando son abonos
	resumen(p_desde)
	dw_factura.setredraw(true)
	return 0
end if
ct=dw_factura.getitemstring(p_fila,"ccontrato")
pl=dw_factura.getitemstring(p_fila,"plan")
l_td=dw_factura.getitemstring(p_fila,"tipodoc")
l_doc=dw_factura.getitemstring(p_fila,"docu")
cuantos= p_cant
vproc=dw_factura.getitemnumber(p_fila,"vp_unit")
iva=vproc * cuantos* (dw_factura.getitemdecimal(p_fila,'por_iva')/100)
vproc+=iva
dw_factura.setitem(p_fila,'iva',iva)
percent=dw_factura.getitemnumber(p_fila,"percent_pac")
nrc=dw_factura.getitemnumber(p_fila,"nrcaj")
ctope=dw_factura.getitemnumber(p_fila,"tope")
asumar=(vproc * cuantos*(1 - percent/100))
l_copagofijo=0
l_cuotamfija=0
l_cuotarfija=0
choose case dw_factura.getitemstring(p_fila,"que_paga")
	case "Copago"
		l_copagofijo= dw_factura.getitemdecimal(p_fila,"cuanto_fijo")
	case "Cuota Mode."
		l_cuotamfija=dw_factura.getitemdecimal(p_fila,"cuanto_fijo")
	case "Cuota Recu."
		l_cuotarfija=dw_factura.getitemdecimal(p_fila,"cuanto_fijo")
end choose
long l_cant
if p_desde<>'T' then //validar topes soat
	long soat
	soat=f_es_soat(em,ct,cons_soat,clug_soat,dw_factura.getitemnumber(p_fila,'contador'),dw_factura.getitemstring(p_fila,'clugar_his'),p_desde)
	k=0
	sepasa=0
	if soat>0 then
		acum=dw_acum_soat.getitemnumber(soat,"acum")
		if l_copagofijo>0 then asumar=asumar -l_copagofijo
		if l_cuotamfija>0 then asumar=asumar -l_cuotamfija
		if l_cuotarfija>0 then asumar=asumar -l_cuotarfija
		long lleva,vtemp,tope
		tope=dw_acum_soat.getitemdecimal(soat,"vpendiente")
		lleva=dw_acum_soat.getitemnumber(soat,"lleva")
		vtemp=dw_factura.getitemnumber(p_fila,"vt_emp")
		if isnull(vtemp) then vtemp=vproc * (1 - percent/100)
		dw_acum_soat.setitem(soat,"estado",'1')
		if tope<acum +lleva - vtemp + asumar then
			for k=cuantos -1 to 1 step -1
				asumar=(vproc * k*(1 - percent/100))
				if tope>=acum +lleva - vtemp + asumar then exit
			next
			sepasa=cuantos - k
			cuantos=k
			dw_factura.setitem(p_fila,"cantidad",k)
			cuantos=k
			dw_acum_soat.setitem(soat,"estado",'2')
		end if
	end if
	if soat>0 then dw_acum_soat.setitem(soat,"lleva",dw_acum_soat.getitemnumber(soat,"lleva")+asumar -vtemp)
end if //fin validar topes soat
dw_factura.setitem(p_fila,"vt_proc",round(vproc * cuantos,i_dec_fact))
dw_factura.setitem(p_fila,"vt_pac", round(vproc * cuantos*(percent/100),i_dec_fact))
dw_factura.setitem(p_fila,'iva_crm',round(dw_factura.getitemnumber(p_fila,'vt_pac')*dw_factura.getitemnumber(p_fila,'por_iva_crm')/100,i_dec_fact))
if em<>'0' then
	if vproc * cuantos*(1 - percent/100)>=0 then
		dw_factura.setitem(p_fila,"vt_emp", round(vproc * cuantos,i_dec_fact)*(1 - percent/100))
	else
		dw_factura.setitem(p_fila,"vt_emp", 0)
	end if
else//se debe hacer descuento al paciente
	dw_factura.setitem(p_fila,"vt_emp", 0)
end if
//ojoooooooooooo if not isnull(nrc) or nrc=0 then
//	dw_factura.setfilter("cemp='"+em+"' and ccontrato='"+ct+"' and plan='"+pl+"' and que_paga<>'nada' and nrcaj="+string(nrc)+" and tipodoc='"+l_td+"' and docu='"+l_doc+"'")
//else
	dw_factura.setfilter("cemp='"+em+"' and ccontrato='"+ct+"' and plan='"+pl+"' and que_paga<>'nada' and tipodoc='"+l_td+"' and docu='"+l_doc+"' and (isnull(nrcaj) or nrcaj=0)")
//end if
dw_factura.filter()
if dw_factura.rowcount()>0 then sumcuantos=dw_factura.getitemnumber(1,"t_cantidad")
if l_copagofijo<> 0 then
	pedazo=l_copagofijo/sumcuantos
	for j= 1 to dw_factura.rowcount()
		if (dw_factura.getitemnumber(j,"vp_unit") - pedazo -dw_factura.getitemnumber(j,"v_part"))*dw_factura.getitemnumber(j,"cantidad")>=0 then
			dw_factura.setitem(j,"vt_emp",round((dw_factura.getitemnumber(j,"vp_unit") - pedazo -dw_factura.getitemnumber(j,"v_part"))*dw_factura.getitemnumber(j,"cantidad"),i_dec_fact))
		else
			dw_factura.setitem(j,"vt_emp",0)
		end if
		dw_factura.setitem(j,"vt_pac",round(pedazo*dw_factura.getitemnumber(j,"cantidad"),i_dec_fact))
		dw_factura.setitem(j,'iva_crm',round(dw_factura.getitemnumber(j,'vt_pac')*dw_factura.getitemnumber(j,'por_iva_crm')/100,i_dec_fact))
	next
elseif l_cuotamfija<>0 then
	pedazo=l_cuotamfija/sumcuantos
	for j= 1 to dw_factura.rowcount()
		if (dw_factura.getitemnumber(j,"vp_unit") - pedazo -dw_factura.getitemnumber(j,"v_part"))*dw_factura.getitemnumber(j,"cantidad")>=0 then
			dw_factura.setitem(j,"vt_emp",round((dw_factura.getitemnumber(j,"vp_unit") - pedazo -dw_factura.getitemnumber(j,"v_part"))*dw_factura.getitemnumber(j,"cantidad"),i_dec_fact))
		else
			dw_factura.setitem(j,"vt_emp",0)
		end if
		dw_factura.setitem(j,"vt_pac",round(pedazo*dw_factura.getitemnumber(j,"cantidad"),i_dec_fact))
		dw_factura.setitem(j,'iva_crm',round(dw_factura.getitemnumber(j,'vt_pac')*dw_factura.getitemnumber(j,'por_iva_crm')/100,i_dec_fact))
	next
elseif l_cuotarfija<>0 then
	pedazo=l_cuotarfija/sumcuantos
	for j=1 to dw_factura.rowcount()
		if (dw_factura.getitemnumber(j,"vp_unit") - pedazo  -dw_factura.getitemnumber(j,"v_part"))*dw_factura.getitemnumber(j,"cantidad")>=0 then
			dw_factura.setitem(j,"vt_emp",round((dw_factura.getitemnumber(j,"vp_unit") - pedazo  -dw_factura.getitemnumber(j,"v_part"))*dw_factura.getitemnumber(j,"cantidad"),i_dec_fact))
		else
			dw_factura.setitem(j,"vt_emp",0)
		end if
		dw_factura.setitem(j,"vt_pac",round(pedazo*dw_factura.getitemnumber(j,"cantidad"),i_dec_fact))
		dw_factura.setitem(j,'iva_crm',round(dw_factura.getitemnumber(j,'vt_pac')*dw_factura.getitemnumber(j,'por_iva_crm')/100,i_dec_fact))
	next
end if
if ctope>0 then
	dw_factura.setfilter("cemp='"+em+"' and ccontrato='"+ct+"' and (isnull(nrcaj) or nrcaj=0)")
	dw_factura.filter()
	dec cacum=0
	long kk
	dw_factura.accepttext()
	if (l_copagofijo=0 or isnull(l_copagofijo))and (l_cuotamfija=0 or isnull(l_cuotamfija)) and (l_cuotarfija=0 or isnull(l_cuotarfija)) then
		for kk=1 to dw_factura.rowcount()
			cacum+=round((dw_factura.getitemnumber(kk,"vp_unit")+dw_factura.getitemnumber(kk,"iva"))*dw_factura.getitemnumber(kk,"cantidad") * dw_factura.getitemnumber(kk,"percent_pac")/100,i_dec_fact)
			if ctope=0 then
				dw_factura.setitem(kk,"vt_pac",0)
				dw_factura.setitem(kk,"vt_emp",round(dw_factura.getitemnumber(kk,"vt_proc"),i_dec_fact))
				dw_factura.setitem(kk,'iva_crm',round(dw_factura.getitemnumber(kk,'vt_pac')*dw_factura.getitemnumber(kk,'por_iva_crm')/100,i_dec_fact))
			end if
			if cacum>ctope then
				if ctope>0 then
					dw_factura.setitem(kk,"vt_pac",round(ctope - cacum + (dw_factura.getitemnumber(kk,"vp_unit")+dw_factura.getitemnumber(kk,"iva"))*dw_factura.getitemnumber(kk,"cantidad") * dw_factura.getitemnumber(kk,"percent_pac")/100,i_dec_fact))
					dw_factura.setitem(kk,'iva_crm',round(dw_factura.getitemnumber(kk,'vt_pac')*dw_factura.getitemnumber(kk,'por_iva_crm')/100,i_dec_fact))
					if dw_factura.getitemnumber(kk,"vt_proc") -dw_factura.getitemnumber(kk,"vt_pac")>=0 then
						dw_factura.setitem(kk,"vt_emp",round(dw_factura.getitemnumber(kk,"vt_proc") -dw_factura.getitemnumber(kk,"vt_pac") ,i_dec_fact))
					else
						dw_factura.setitem(kk,"vt_emp",0)
					end if
					ctope=0
				end if
			else
				dw_factura.setitem(kk,"vt_pac",round((dw_factura.getitemnumber(kk,"vp_unit")+dw_factura.getitemnumber(kk,"iva"))*dw_factura.getitemnumber(kk,"cantidad") * dw_factura.getitemnumber(kk,"percent_pac")/100,i_dec_fact))
				dw_factura.setitem(kk,'iva_crm',round(dw_factura.getitemnumber(kk,'vt_pac')*dw_factura.getitemnumber(kk,'por_iva_crm')/100,i_dec_fact))
				dw_factura.setitem(kk,'vt_emp',round(dw_factura.getitemnumber(kk,"vt_proc") - dw_factura.getitemnumber(kk,"vt_pac"),i_dec_fact))
			end if
		next
	end if
end if
dw_factura.setfilter("")
dw_factura.filter()
if not (p_desde='S' or p_desde='G' or p_desde='H') then
	dw_factura.sort()
	resumen(p_desde)
end if
if sepasa>0 then f_se_paso(p_fila,sepasa)
return 1
end function

public function integer lf_cargar_a (string p_codigo, string p_desproc, long p_cantidad, string p_tipo, string p_tipoing, string p_autoriza, string p_cemp, string p_cont, long p_cons_soat, string p_clug_soat, string p_tdoc, string p_docu, long p_edad, string p_sexo, string p_codta, string p_estrato, string p_uf, string p_cc, string p_desde, integer p_facturar, long p_contador, string p_clug_his, long p_nserv, string p_prof_cir, string p_espe_cir, string p_via, integer p_acto, string p_tipo_cir, long p_ncita, string p_clug_cita, long p_nserv_cita, long p_sec_cant_cita, long p_nreci, string p_clug_rec, integer p_item_rec, long p_ntrat, string p_clug_trat, integer p_item_trat, string p_aneste, string p_cod_auxqx, long p_nro_insumo, long p_norden, long p_nitem_ord);//37 parametros ( p_codigo,p_desproc,p_cantidad,  p_tipo,  p_tipoing,  p_autoriza,  p_cemp,  p_cont,  p_cons_soat, 
//  p_clug_soat,  p_tdoc,  p_docu,  p_edad,  p_sexo,  p_codta, p_estrato, p_uf,  p_cc,  p_desde,  p_facturar,  p_contador, 
//  p_clug_his,  p_nserv,  p_prof_cir,  p_espe_cir,  p_via,  p_acto,  p_tipo_cir,  p_ncita,  p_nserv_cita, 
//  p_sec_cant_cita, p_nreci,  p_clug_rec,  p_item_rec,  p_ntrat,p_clug_trat, p_item_trat)

//p_tipo puede ser:
//		'C':cups
//		'M':medicamento
//		'' :Debe revisar que es

//p desde es desde donde se le mando la interface
//		'C': Citas
//		'G': Cuenta global por empresa
//		'H': Hosp/Urg
//		'' : Directa
//		'S': Serv ya prestados/Citas/Odonto
//		'P': cuando se pasan los topes de soat
//		'K': desde Kits

//	p_equiv_manual y p_cmanual pa que desde qx 

if p_autoriza='' then setnull(p_autoriza)
if p_cons_soat=0 then setnull(p_cons_soat)
if p_clug_soat='' then setnull(p_clug_soat)
if p_uf='' then setnull(p_uf)
if p_cc='' then setnull(p_cc)
if p_contador=0 then setnull(p_contador)
if p_clug_his='' then setnull(p_clug_his)
if p_nserv=0 then setnull(p_nserv)
if p_prof_cir='' then setnull(p_prof_cir)
if p_espe_cir='' then setnull(p_espe_cir)
if p_via='' then setnull(p_via)
if p_acto=0 then setnull(p_acto)
if p_tipo_cir='' then setnull(p_tipo_cir)
if p_ncita=0 then setnull(p_ncita)
if p_clug_cita='' then setnull(p_clug_cita)
if p_nserv_cita=0 then setnull(p_nserv_cita)
if p_sec_cant_cita=0 then setnull(p_sec_cant_cita)
if p_nreci=0 then setnull(p_nreci)
if p_clug_rec='' then setnull(p_clug_rec)
if p_item_rec=0 then setnull(p_item_rec)
if p_ntrat=0 then setnull(p_ntrat)
if p_clug_trat='' then setnull(p_clug_trat)
if p_item_trat=0 then setnull(p_item_trat)
if p_nro_insumo=0 then setnull(p_nro_insumo)
if p_norden=0 then setnull(p_norden)
if p_nitem_ord=0 then setnull(p_nitem_ord)


long j,donde,memory,l_puntos
real percent,tempo,pormin,tope,l_pormanual
string des_cont,autoriza,tip,conf,otro_cod,iva,l_cproc_man,l_manual,l_plan,l_cod_concep,l_rips,l_tiposerv
string l_grupo,l_que_paga
boolean yapaso,esmedica,segresp=false,volio=false
dec l_valor,l_por_iva,l_copagofijo,l_cuotarfija,l_cuotamfija,por_iva_crm
int l_tipo_proc
choose case p_tipo
	case 'C'//cups
		l_tipo_proc=1
	case 'M'
		l_tipo_proc=3
		esmedica=true
		l_cproc_man=p_codigo
	case ''
		l_tipo_proc=f_existe_proc(p_codigo,p_desproc)
		if l_tipo_proc=-1 then 
			return -1
		elseif l_tipo_proc=3 then
			esmedica=true
			l_cproc_man=p_codigo
		elseif l_tipo_proc=2 then
			l_cproc_man=p_codigo
			p_codigo=''
		end if
end choose
if dw_segrespon.retrieve(p_cemp,p_cont)=0 then return -1
if dw_cont_det.rowcount()>0 then //si tiene filas mirar si los datos son de la empresa pa no traer datos otra vez
	if dw_cont_det.getitemstring(1,'emp')<>p_cemp or dw_cont_det.getitemstring(1,'cont')<>p_cont or dw_cont_det.getitemstring(1,'compute_1')<>p_tipoing then
		if dw_cont_det.retrieve(p_cemp,p_cont,p_tipoing)=0 then
			if p_cemp='0' and p_cont='1' then
				messagebox("Error","El contrato("+p_cemp+") de la Empresa("+p_cont+") no tiene planes de servicios, adicionele planes para poder continuar")
				return -1
			else
				goto se_volio
			end if
		end if
	end if
else
	if dw_cont_det.retrieve(p_cemp,p_cont,p_tipoing)=0 then
		if p_cemp='0' and p_cont='1' then
			messagebox("Error","El contrato("+p_cemp+") de la Empresa("+p_cont+") no tiene planes de servicios, adicionele planes para poder continuar")
			return -1
		else
			goto se_volio
		end if
	end if
end if
yapaso=false
DO // pa poder revisar en todos los responsables
	if dw_cont_det.rowcount()=0 then 
		if p_cemp='0' and p_cont='1' then
			messagebox("Error de Configuración","El contrato "+p_cont+" de la empresa "+p_cemp+" no tiene planes o no existe para este tipo de ingreso")
			return -1
		else
			goto se_volio
		end if
	end if	
	des_cont=dw_segrespon.getitemstring(1,"descontrato")
	iva=dw_segrespon.getitemstring(1,"iva")
	/// viene lo duro
	if esmedica then 
		dw_cont_det.setfilter("es_medica='1'")
	else
		dw_cont_det.setfilter("es_medica='0'")
	end if
	dw_cont_det.filter()
	dw_cont_det.sort()
	for j=1 to dw_cont_det.rowcount() // de aquí tiene que salir cuando encuentre los valores
		l_manual=dw_cont_det.getitemstring(j,"codmanual")
		l_pormanual=dw_cont_det.getitemnumber(j,"pormanual") / 100
		if isnull(l_pormanual) then l_pormanual=1
		l_plan=dw_cont_det.getitemstring(j,"cplan")
		choose case l_tipo_proc
			case 3///////////////// M E D I C A M E N T O S	
				if not f_med_plan(l_plan,p_codigo) then continue
				setnull(l_valor)
				SELECT tarifa_medica.valor, Medicamentos.AGRUPSER, Medicamentos.RIPS,tarifa_medica.iva
				into :l_valor,:l_cod_concep,:l_rips,:l_por_iva
				FROM Medicamentos , tarifa_medica 
				where Medicamentos.c_medica = tarifa_medica.c_medica and tarifa_medica.CodManual=:l_manual AND tarifa_medica.c_medica=:p_codigo;
				if isnull(l_valor) or sqlca.sqlnrows=0 then
					messagebox("Error","No existe tarifa para este medicamento en el manual: "+l_manual)
					return -1
				end if
				l_tiposerv="G"
				goto cubierto2
			case 1 //tiene que ser cups
				dw_equiv.retrieve(p_codigo)
				dw_equiv.setfilter("codmanual='"+l_manual+"'")
				dw_equiv.filter()
				if dw_equiv.rowcount()=0 then 
					messagebox('Atención','El procedimiento '+p_codigo+' no tiene equivalencia en el manual '+l_manual)
					continue
				end if
				if dw_equiv.rowcount()>1 then //escoger el que se ajuste
					if cbx_equiv.checked then
						memory=0
					else
						memory=dw_memory.find("proccups='"+p_codigo+"' and manual='"+l_manual+"'",1,dw_memory.rowcount())
					end if
					if segresp or j>1 then memory=dw_memory.find("proccups='"+p_codigo+"' and manual='"+l_manual+"' and cproc='"+l_cproc_man+"'",1,dw_memory.rowcount())
					if memory =0 then
						st_escoge_equiv st_eq
						st_eq.proccups=p_codigo
						st_eq.manual=l_manual
						st_eq.desproc=p_desproc
						long fill
						openwithparm(w_escoge_equiv,st_eq)
						fill=message.doubleparm
						if fill>0 then
							l_cproc_man=dw_equiv.getitemstring(fill,"codservicio")
							p_desproc=dw_equiv.getitemstring(fill,"descripcion")
							l_tiposerv=dw_equiv.getitemstring(fill,"tiposervicio")
							l_valor=dw_equiv.getitemnumber(fill,"valor")
							l_por_iva=dw_equiv.getitemdecimal(fill,"iva")
							l_grupo=dw_equiv.getitemstring(fill,"grupo")
							l_puntos=dw_equiv.getitemnumber(fill,"puntos")
							l_rips=dw_equiv.getitemstring(fill,"rips")
							l_cod_concep=dw_equiv.getitemstring(fill,"codconcepto")
						else
							return -1
						end if
						if isnull(l_valor) then
							messagebox("Error de Tarifas","No existe valor en Tarifas para el procedimiento: "+l_cproc_man+" ("+p_codigo+")")
							return -1
						end if
						f_memory(p_codigo,l_cproc_man,l_manual)
					else
						l_cproc_man=dw_memory.getitemstring(memory,"cproc")
						memory=dw_equiv.find("codservicio='"+l_cproc_man+"'",1,dw_equiv.rowcount())
						if memory=0 then continue
						if f_lee_de_equiv(memory,p_codigo,l_cproc_man,l_tiposerv,l_grupo,l_puntos,l_valor,l_por_iva,l_rips,l_cod_concep,p_desproc)=-1 then return -1
					end if
				else //solo tiene una equivalencia
					if f_lee_de_equiv(1,p_codigo,l_cproc_man,l_tiposerv,l_grupo,l_puntos,l_valor,l_por_iva,l_rips,l_cod_concep,p_desproc)=-1 then return -1
					f_memory(p_codigo,l_cproc_man,l_manual)
				end if
				//fin de tiene que ser cups
			case 2 //debe pertenecer a un manual
				select descripcion, tiposervicio ,grupo ,puntos into :p_desproc , :l_tiposerv ,:l_grupo , :l_puntos 
				from serviciosman where codmanual = :l_manual and codservicio = :l_cproc_man;
				dw_tarifas.retrieve(l_manual,l_cproc_man)   ////    tiene equivalencias con CUPS y tarifa?
				if dw_tarifas.rowcount()=0 then continue
				if dw_tarifas.rowcount()>1 then
					if cbx_equiv.checked then
						memory=0
					else
						memory=dw_memory.find("manual='"+l_manual+"' and cproc='"+l_cproc_man+"'",1,dw_memory.rowcount())
					end if
					if segresp or j>1 then memory=dw_memory.find("proccups='"+p_codigo+"' and manual='"+l_manual+"' and cproc='"+l_cproc_man+"'",1,dw_memory.rowcount())
					if memory=0 then
						str_proc st_p
						st_p.rips=l_manual//se hizo este machete pa no crear otra estructura ni otro campo
						st_p.cproc=l_cproc_man
						st_p.descripcion=p_desproc
						openwithparm(w_escoge_proc,st_p)
						st_p=message.powerobjectparm
						if st_p.cproc="" then 
							return -1
						end if
						p_codigo=st_p.cproc
						l_valor=st_p.valor
						l_rips=st_p.rips
						l_cod_concep=st_p.agrupser
						l_por_iva=st_p.iva
						if isnull(l_valor) then
							messagebox("Error de Tarifas","No existe valor en Tarifas para el procedimiento: "+l_cproc_man+" ("+p_codigo+")")
							return -1
						end if
						f_memory(p_codigo,l_cproc_man,l_manual)
					else
						p_codigo=dw_memory.getitemstring(memory,"proccups")
						memory=dw_tarifas.find("codproced='"+p_codigo+"'",1,dw_tarifas.rowcount())
						if memory=0 then continue
						if f_lee_de_tarifas(memory,l_cproc_man,p_codigo,l_valor,l_por_iva,l_rips,l_cod_concep)=-1 then return -1
						f_memory(p_codigo,l_cproc_man,l_manual)
					end if
				else//solo tiene una equivalencia
					if f_lee_de_tarifas(1,l_cproc_man,p_codigo,l_valor,l_por_iva,l_rips,l_cod_concep)=-1 then return -1
					f_memory(p_codigo,l_cproc_man,l_manual)
				end if
			// fin pertenece a un manual
		end choose
/////////////////////////// está cubierto ?
		if not f_proc_plan(p_codigo,l_plan) then continue
		// está cubierto por este plan pero debe revisar el resto (es getareo y el paciente cumple?,etc)
cubierto2:		
		autoriza=dw_cont_det.getitemstring(j,"autorizacion")
		if autoriza="1" and trim(p_autoriza)="" and p_cemp<>'0' then
			if messagebox("Atención","Este procedimiento requiere autorización, quiere continuar y cargárselo como particular ?",question!,yesno!,2)=2 then return -1
			continue
		end if
		tip=dw_cont_det.getitemstring(j,"tipo")
/*tipo2*/
		if tip="2" then //tipo 2=grupo etareo
			dw_getareo.retrieve(p_edad,p_sexo,p_cemp,p_cont,l_plan,p_tipoing,tip)
			if dw_getareo.rowcount()>0 then
				long fget=1
				if dw_getareo.rowcount()>1 then 
					st_cargar_a stc
					stc.emp=p_cemp
					stc.cont=p_cont
					stc.tipoingreso=p_tipoing
					fget=0
					openwithparm(w_escoge_getareo,stc)
					fget=message.doubleparm
				end if	
				if fget>0 then
					conf=dw_getareo.getitemstring(fget,"confirma")
					if conf="1" then ///confirma ge es una variable instance para no seguir preguntando en caso de que si
						choose case i_confirma_ge
							case 'si'
								if messagebox("Atención","Está seguro que el paciente con documento: "+p_tdoc+" "+p_docu+" con edad de :"+string(int(p_edad/365))+" año(s) y sexo: "+p_sexo+" cumple con los requisitos del grupo etareo: "+dw_getareo.getitemstring(fget,"desgetareo")+" ?",question!,yesno!,1)=2 then 
									i_confirma_ge='no2'
									continue
								end if
								i_confirma_ge="no"
							case 'no'
							case 'no2'
								continue
						end choose
					end if
					l_que_paga=f_que_paga(j,percent,tempo,pormin,'2',tope,p_cemp,p_cont,l_plan,p_codta,p_estrato,l_copagofijo,l_cuotarfija,l_cuotamfija,p_tipoing,por_iva_crm)
					if l_que_paga='!' then 
						return -1
					else
						goto salio
					end if
				end if
			end if
		end if
/*tipo1*/
		if tip="1" then //tipo 1=general
			setnull(percent)
			setnull(tempo)
			l_que_paga=f_que_paga(j,percent,tempo,pormin,'1',tope,p_cemp,p_cont,l_plan,p_codta,p_estrato,l_copagofijo,l_cuotarfija,l_cuotamfija,p_tipoing,por_iva_crm)
			if l_que_paga='!' then
				return -1
			else
				goto salio
			end if
		end if
//		if tip="3" then //tipo 3=alto costo
		if tip<>'1' and tip<>'2' and tip<>'3' then
			Messagebox("Error","En DetalleCont el contrato tiene mal el tipo")
			return -1
		end if
	next /// fin de viene lo duro
se_volio:
	if yapaso then 
		messagebox("Error en configuración de contratos","No se puede encontrar responsable del procedimiento ("+p_codigo+"), revise incluso la empresa Particular")
		return -1
	end if
	if not isnull(dw_segrespon.getitemstring(1,"segrespon")) and dw_segrespon.getitemstring(1,"segrespon")<>"" and not isnull(dw_segrespon.getitemstring(1,"contsegrespon")) and dw_segrespon.getitemstring(1,"contsegrespon")<>"" then
		if p_cemp=dw_segrespon.getitemstring(1,"segrespon") and p_cont=dw_segrespon.getitemstring(1,"contsegrespon") then
			messagebox('Atención','El segundo responsable de la Empresa '+p_cemp+' y el contrato '+p_cont+' es el mismo contrato, no puede continuar')
			return -1
		end if
		p_cemp=dw_segrespon.getitemstring(1,"segrespon")
		p_cont=dw_segrespon.getitemstring(1,"contsegrespon")
		setnull(p_cons_soat)
		setnull(p_clug_soat)
	else
		p_cemp='0'
		p_cont='1'
		setnull(p_cons_soat)
		setnull(p_clug_soat)
		yapaso=true
	end if
	segresp=true
	dw_segrespon.retrieve(p_cemp,p_cont)
	dw_cont_det.retrieve(p_cemp,p_cont,p_tipoing)
	dw_cont_det.setfilter('')
	dw_cont_det.filter()
LOOP WHILE true
salio: //////////HALAR VALORES DEPENDIENDO TIPO SERVICIO
string tip_liq
long soat ////////////// PA LO DE SOAT PARTE 1
soat=f_es_soat(p_cemp,p_cont,p_cons_soat,p_clug_soat,p_contador,p_clug_his,p_desde)
if soat=-1 then return -1
select ctlqx into :tip_liq from manuales where codmanual=:l_manual;
st_cirugia st_c
choose case l_tiposerv
	case "P",'Q' //paquete , quirurgico
		st_c.tiposerv=l_tiposerv
		st_c.desproc=p_desproc
		st_c.tipo_cir=p_tipo_cir
		st_c.pormanual=l_pormanual
		st_c.via=p_via
		st_c.prof_cir=p_prof_cir
		st_c.espe_cir=p_espe_cir
		st_c.manual=l_manual
		st_c.codproc=l_cproc_man
		st_c.dw_factura=dw_factura
		st_c.dw_factura_cpo=dw_factura_cpo
		st_c.aneste=p_aneste//si se cargó en salaqx, lleva de la tabla qxtipoanest
		st_c.nuevo_edita='nuevo'
		st_c.cod_auxqx=p_cod_auxqx
		st_c.sexo = dw_emppac.GetItemString(dw_emppac.GetRow(),'sexo')
		if volio and l_tiposerv='Q' then
			long num_padre
			num_padre=dw_factura.rowcount()+1
			dw_factura_cpo.setfilter("num_padre="+string(num_padre))
			dw_factura_cpo.filter()
			do while dw_factura_cpo.rowcount()>0
				dw_factura_cpo.deleterow(0)
			loop
			st_c.dw_factura_cpo.setfilter("")
			st_c.dw_factura_cpo.filter()
		end if
		choose case tip_liq
			case "1" // SOAT
				st_c.grupo=l_grupo
				openwithparm(w_cirugias,st_c)
			case "2" // ISS
				st_c.puntos=l_puntos
				openwithparm(w_cirugias_uvr,st_c)
		end choose
		st_c=message.powerobjectparm
		l_valor=st_c.valor
		if l_valor=0 then return -1
		p_via=st_c.via
		p_prof_cir=st_c.prof_cir
		p_espe_cir=st_c.espe_cir
		p_tipo_cir=st_c.tipo_cir		
	case "G" //general comun // ya no tiene que hallar valores VIENE DE ARRIBA
	case "D",'M','I' //derechos de grupo qx
		messagebox("Error","Este procedimiento pertenece a un grupo quirúrgico, no lo puede facturar individualmente")
		return -1
	case else
		messagebox("Error","El campo tiposervicio en la tabla serviciosman no es válido")
		return -1
end choose /// FIN HALLAR VALORES 
string areaadx
setnull(areaadx)
SELECT GClinico.CodAADX into :areaadx
FROM GClinico, ProcGClinico
WHERE ProcGClinico.CodProced=:p_codigo AND GClinico.CodGC=procgclinico.codgc;
////////////// PA SOAT PARTE DOS
if soat>0 then
	long asumar
	asumar=(l_valor * l_pormanual * p_facturar)
	if l_copagofijo<>0 then asumar=asumar -l_copagofijo
	if l_cuotamfija<>0 then asumar=asumar -l_cuotamfija
	if l_cuotarfija<>0 then asumar=asumar -l_cuotarfija
	if dw_acum_soat.getitemdecimal(soat,"vpendiente")<dw_acum_soat.getitemnumber(soat,"acum")+dw_acum_soat.getitemnumber(soat,"lleva")+asumar then
		//se volió y debe pasar a la otra empresa
		setnull(p_cons_soat)
		setnull(p_clug_soat)
		dw_acum_soat.setitem(soat,"estado",'2')
		l_copagofijo=0
		l_cuotamfija=0
		l_cuotarfija=0
		volio=true
		goto se_volio
	else
		dw_acum_soat.setitem(soat,"lleva",dw_acum_soat.getitemnumber(soat,"lleva")+(asumar * (1 -percent/100)))
	end if	
end if
////////////// FIN PA SOAT PARTE DOS
//////////////////////// C E N T R O    D E    C O S T O S
choose case p_tipoing
	case '1'
		f_cc(esmedica,i_alm_cext,p_codigo,p_uf,p_cc,p_tipoing) 
	case '2'//urg
		f_cc(esmedica,i_alm_urg,p_codigo,p_uf,p_cc,p_tipoing) 
	case '3'//hosp
		f_cc(esmedica,i_alm_hosp,p_codigo,p_uf,p_cc,p_tipoing) 
	case '4'
		f_cc(esmedica,i_alm_amb,p_codigo,p_uf,p_cc,p_tipoing) 
end choose
////////////////////// fin C E N T R O    D E    C O S T O S
string temp
temp=p_tipoing
donde=dw_factura.insertrow(0)
p_tipoing=temp
if esmedica then dw_factura.setitem(donde,"es_medica","1")
dw_factura.setitem(donde,"cproc",l_cproc_man)
dw_factura.setitem(donde,"descripcion",p_desproc)
dw_factura.setitem(donde,"vp_unit",l_valor * l_pormanual * p_facturar)
dw_factura.setitem(donde,"percent_pac",percent)
dw_factura.setitem(donde,"coduf",p_uf)
dw_factura.setitem(donde,"codcc",p_cc)
dw_factura.setitem(donde,"pormin",pormin)
dw_factura.setitem(donde,"pormax",percent)
dw_factura.setitem(donde,"proccups",p_codigo)
dw_factura.setitem(donde,"numero",donde)
if iva='1' then dw_factura.setitem(donde,"por_iva",l_por_iva)
dw_factura.setitem(donde,"tipo_proc",l_tiposerv)
if l_tiposerv='P' or l_tiposerv='Q' then i_reviso_multiples=false
dw_factura.setitem(donde,"plan",l_plan)
dw_factura.setitem(donde,"rips",l_rips)
dw_factura.setitem(donde,"por_manual",l_pormanual)
dw_factura.setitem(donde,"cod_concep",l_cod_concep)
dw_factura.setitem(donde,"cod_manual",l_manual)
dw_factura.setitem(donde,"cemp",p_cemp)
dw_factura.setitem(donde,"ccontrato",p_cont)
dw_factura.setitem(donde,"que_paga",l_que_paga)
dw_factura.setitem(donde,"tipodoc",p_tdoc)
dw_factura.setitem(donde,"docu",p_docu)
dw_factura.setitem(donde,"des_cont",des_cont)
dw_factura.setitem(donde,"contador",p_contador)
dw_factura.setitem(donde,"clugar_his",p_clug_his)
dw_factura.setitem(donde,"nserv",p_nserv)
dw_factura.setitem(donde,"nro_insumo",p_nro_insumo)
dw_factura.setitem(donde,"nserv_cita",p_nserv_cita)
dw_factura.setitem(donde,"ncita",p_ncita)
dw_factura.setitem(donde,"clug_cita",p_clug_cita)
dw_factura.setitem(donde,"sec_cant_cita",p_sec_cant_cita)
dw_factura.setitem(donde,"areaadx",areaadx)
dw_factura.setitem(donde,"tingres",p_tipoing)
dw_factura.setitem(donde,"desde",p_desde)
dw_factura.setitem(donde,"aneste",p_aneste)
dw_factura.setitem(donde,"norden",p_norden)
dw_factura.setitem(donde,"nitem_ord",p_nitem_ord)
dw_factura.setitem(donde,"cod_auxqx",p_cod_auxqx)
if soat>0 then 
	dw_factura.setitem(donde,"consec_soat",p_cons_soat)
	dw_factura.setitem(donde,"clugar_soat",p_clug_soat)
end if
dw_factura.setitem(donde,"nrcaj",p_nreci)
dw_factura.setitem(donde,"clugar_rec",p_clug_rec)
dw_factura.setitem(donde,"items",p_item_rec)
dw_factura.setitem(donde,"ntrata",p_ntrat)
dw_factura.setitem(donde,"clug_trat",p_clug_trat)
dw_factura.setitem(donde,"item_trat",p_item_trat)
dw_factura.setitem(donde,"tope",tope)
dw_factura.setitem(donde,"codta",p_codta)
dw_factura.setitem(donde,'por_iva_crm',por_iva_crm)
if l_copagofijo<>0 then dw_factura.setitem(donde,"cuanto_fijo",l_copagofijo)
if l_cuotamfija<>0 then dw_factura.setitem(donde,"cuanto_fijo",l_cuotamfija)
if l_cuotarfija<>0 then dw_factura.setitem(donde,"cuanto_fijo",l_cuotarfija)
dw_factura.setitem(donde,"tipo_cir",p_tipo_cir) //si es normal,incruenta (bilateral o no)
if l_tiposerv="Q" or l_tiposerv="P" then
	dw_factura.setitem(donde,"profe",p_prof_cir)
	dw_factura.setitem(donde,"espe",p_espe_cir)
	dw_factura.setitem(donde,"via",p_via)
	if not isnull(p_acto) then dw_factura.setitem(donde,"acto",p_acto)
end if
if tip_liq="1" then
	dw_factura.setitem(donde,"grupo",l_grupo)	
else
	dw_factura.setitem(donde,"puntos",l_puntos)
end if
dw_factura.scrolltorow(donde)
dw_cont_det.setfilter("")
dw_cont_det.filter()
if p_autoriza<>"" then dw_factura.setitem(donde,"autoriza",p_autoriza)
//i_cant_ant=dw_factura.getitemnumber(dw_factura.getrow(),"cantidad")
dw_factura.setitem(dw_factura.getrow(),"cantidad",p_cantidad)
if l_tiposerv ="G" and p_desde='' then openwithparm(w_cantidad,dw_factura)
dw_factura.setcolumn("cantidad")
if esmedica then
	if i_mueve_kardex='1' then
		if p_tipoing='1' then
			if isnull(p_nreci) and isnull(dw_factura.getitemnumber(donde,'nro_insumo')) then
				string articulo
//				articulo=f_check_kardex(p_codigo,i_alm_cext,dw_factura.getitemnumber(donde,'cantidad'),dw_lote_mov,donde,i_cdoc)
				if articulo="!" then
					messagebox("Atención","No hay existencias de este producto en Bodega")
					dw_factura.deleterow(donde)
					goto bb
				end if
			end if
		else
			if p_desde<>'H' then
				messagebox("Atención","Estos medicamentos no pueden ser facturados directamente, ya que alteraría el Kardex del Almacen de este tipo de ingreso, deben ser asignados en el módulo de Hospitalización ")
				dw_factura.deleterow(donde)
				goto bb
			end if
		end if 
	end if
end if
if f_cambiar_cant(donde,dw_factura.getitemnumber(donde,'cantidad'),p_desde)=-1 then return -1
dw_factura.scrolltorow(donde)
bb:
return 1

end function

public subroutine f_cc (boolean esmedica, string calmacen, string p_cups, ref string p_uf, ref string p_cc, string p_tipoing);if isnull(p_uf) or p_uf='' then
	if not esmedica then
		if dw_factura.rowcount()>0 then
			long cc
			cc=dw_factura.find("proccups='"+p_cups+"'",1,dw_factura.rowcount())
			if cc=0 then
				openwithparm(w_cc,p_cups+"-"+p_tipoing)
				if message.stringparm="" then
					setnull(p_uf)
					setnull(p_cc)
				else
					p_uf=left(message.stringparm,pos(message.stringparm,"-",1) -1)
					p_cc=right(message.stringparm,len(message.stringparm) - pos(message.stringparm,"-",1) )
				end if
			else
				p_uf=dw_factura.getitemstring(cc,"coduf")
				p_cc=dw_factura.getitemstring(cc,"codcc")
			end if
		else
			openwithparm(w_cc,p_cups+"-"+p_tipoing)
			if message.stringparm="" then
				setnull(p_uf)
				setnull(p_cc)
			else
				p_uf=left(message.stringparm,pos(message.stringparm,"-",1) -1)
				p_cc=right(message.stringparm,len(message.stringparm) - pos(message.stringparm,"-",1) )
			end if
		end if
	else
		select codufun,codcencosto into :p_uf,:p_cc from sumalmacen where codalmacen=:calmacen;
	end if
end if
end subroutine

public function integer f_edad_dias (datetime fnacimiento);integer edad

edad = daysafter( date(fnacimiento),today())
if edad< 0 then edad = 0
Return edad

end function

on w_simula_fac.create
this.pb_pagares=create pb_pagares
this.dw_kardexdeta=create dw_kardexdeta
this.dw_lote_mov=create dw_lote_mov
this.pb_reci=create pb_reci
this.pb_factu=create pb_factu
this.dw_factadm=create dw_factadm
this.dw_admis=create dw_admis
this.st_ayuda=create st_ayuda
this.pb_kit=create pb_kit
this.cbx_equiv=create cbx_equiv
this.cbx_3=create cbx_3
this.dw_acum_soat=create dw_acum_soat
this.st_cuant=create st_cuant
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.dw_segrespon=create dw_segrespon
this.sle_proc=create sle_proc
this.st_4=create st_4
this.st_3=create st_3
this.sle_autoriza=create sle_autoriza
this.pb_borra=create pb_borra
this.dw_getareo=create dw_getareo
this.dw_equiv=create dw_equiv
this.st_2=create st_2
this.st_1=create st_1
this.sle_poliza=create sle_poliza
this.dw_tarifas=create dw_tarifas
this.dw_cont_det=create dw_cont_det
this.pb_buscar=create pb_buscar
this.dw_tip_ingres=create dw_tip_ingres
this.dw_factura=create dw_factura
this.dw_resumen=create dw_resumen
this.dw_forma_pago=create dw_forma_pago
this.pb_soat=create pb_soat
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_6=create gb_6
this.pb_facturar=create pb_facturar
this.pb_calcula=create pb_calcula
this.dw_factura_cpo=create dw_factura_cpo
this.st_5=create st_5
this.dw_emppac=create dw_emppac
this.dw_rec_caj_cab=create dw_rec_caj_cab
this.pb_pagare=create pb_pagare
this.pb_parcial=create pb_parcial
this.dw_memory=create dw_memory
this.Control[]={this.pb_pagares,&
this.dw_kardexdeta,&
this.dw_lote_mov,&
this.pb_reci,&
this.pb_factu,&
this.dw_factadm,&
this.dw_admis,&
this.st_ayuda,&
this.pb_kit,&
this.cbx_equiv,&
this.cbx_3,&
this.dw_acum_soat,&
this.st_cuant,&
this.cbx_2,&
this.cbx_1,&
this.dw_segrespon,&
this.sle_proc,&
this.st_4,&
this.st_3,&
this.sle_autoriza,&
this.pb_borra,&
this.dw_getareo,&
this.dw_equiv,&
this.st_2,&
this.st_1,&
this.sle_poliza,&
this.dw_tarifas,&
this.dw_cont_det,&
this.pb_buscar,&
this.dw_tip_ingres,&
this.dw_factura,&
this.dw_resumen,&
this.dw_forma_pago,&
this.pb_soat,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.gb_4,&
this.gb_6,&
this.pb_facturar,&
this.pb_calcula,&
this.dw_factura_cpo,&
this.st_5,&
this.dw_emppac,&
this.dw_rec_caj_cab,&
this.pb_pagare,&
this.pb_parcial,&
this.dw_memory}
end on

on w_simula_fac.destroy
destroy(this.pb_pagares)
destroy(this.dw_kardexdeta)
destroy(this.dw_lote_mov)
destroy(this.pb_reci)
destroy(this.pb_factu)
destroy(this.dw_factadm)
destroy(this.dw_admis)
destroy(this.st_ayuda)
destroy(this.pb_kit)
destroy(this.cbx_equiv)
destroy(this.cbx_3)
destroy(this.dw_acum_soat)
destroy(this.st_cuant)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.dw_segrespon)
destroy(this.sle_proc)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.sle_autoriza)
destroy(this.pb_borra)
destroy(this.dw_getareo)
destroy(this.dw_equiv)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_poliza)
destroy(this.dw_tarifas)
destroy(this.dw_cont_det)
destroy(this.pb_buscar)
destroy(this.dw_tip_ingres)
destroy(this.dw_factura)
destroy(this.dw_resumen)
destroy(this.dw_forma_pago)
destroy(this.pb_soat)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_6)
destroy(this.pb_facturar)
destroy(this.pb_calcula)
destroy(this.dw_factura_cpo)
destroy(this.st_5)
destroy(this.dw_emppac)
destroy(this.dw_rec_caj_cab)
destroy(this.pb_pagare)
destroy(this.pb_parcial)
destroy(this.dw_memory)
end on

event open;timer(5)
string temp
i_mueve_kardex = '0'
if ls_pro=32 THEN	
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "MUEVE_KARDEX", Regstring!, i_mueve_kardex)
	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "PIDEPROF", Regstring!, i_pideprof)
end if
if ls_pro=64 THEN	
	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "MUEVE_KARDEX", Regstring!, i_mueve_kardex)
	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "PIDEPROF", Regstring!, i_pideprof)
end if
//RegistryGet ("HKEY_LOCAL_MACHINE\software\GCI", "dec_fact", Regstring!, temp)
//i_dec_fact=integer(temp)
SELECT ENTERO into :i_dec_fact
FROM parametros_gen
WHERE (((codigo_para)=17));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 17')
	return 
end if

i_profe=''
i_tipo_prof=''
i_profe_ord=''
if i_mueve_kardex='1' then
	if ls_pro=32 THEN
		RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_CEXT", Regstring!, i_alm_cext )
		RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_URG", Regstring!, i_alm_urg )
		RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_HOSP", Regstring!, i_alm_hosp )
		RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "ALM_AMB", Regstring!, i_alm_amb )
	end if		
	if ls_pro=64 THEN	
		RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_CEXT", Regstring!, i_alm_cext )
		RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_URG", Regstring!, i_alm_urg )
		RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_HOSP", Regstring!, i_alm_hosp )
		RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "ALM_AMB", Regstring!, i_alm_amb )
	end if		
	if i_alm_cext='' or i_alm_urg='' or i_alm_hosp='' or i_alm_amb='' then
		messagebox("Atención","Esta máquina se encuentra configurada para manejar Kardex pero no tiene los códigos de los almacenes para esto") 
		close(this)
		return
	end if
end if
blanquea()
i_comprobo=0
i_tipoingreso="1"
dw_tip_ingres.setitem(1,1,i_tipoingreso)
i_confirma_ge='si'
dw_emppac.reset()

sle_proc.setfocus()

st_par = Message.PowerObjectParm
PostEvent("add_procs")

end event

event timer;st_ayuda.visible=false
end event

event close;if isvalid(sqlba) then 
	disconnect using sqlba;
end if
end event

type pb_pagares from picturebutton within w_simula_fac
event mousemove pbm_mousemove
boolean visible = false
integer x = 1801
integer y = 408
integer width = 142
integer height = 124
integer taborder = 190
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "          &p"
string picturename = "pesos.GIF"
string disabledname = "d_pesos.GIF"
alignment htextalign = left!
string powertiptext = "Elaboración de Pagarés [Alt+P]"
end type

event clicked;//if tag='1' then
//	if f_permiso_boton(this,'FC')=0 then return
//end if
//openwithparm(w_pagares,dw_rec_caj_cab)
//vt_cancela()
end event

event constructor;//f_inicia_boton(this,'FC')
end event

type dw_kardexdeta from datawindow within w_simula_fac
boolean visible = false
integer x = 2331
integer width = 78
integer height = 164
integer taborder = 10
string title = "none"
string dataobject = "dw_kardexdeta"
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_lote_mov from datawindow within w_simula_fac
boolean visible = false
integer x = 2263
integer y = 328
integer width = 142
integer height = 72
integer taborder = 170
string title = "none"
string dataobject = "dw_lote_mov"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_reci from pb_report within w_simula_fac
boolean visible = false
integer x = 3136
integer y = 324
integer width = 64
integer height = 52
integer taborder = 140
boolean enabled = false
boolean originalsize = false
string picturename = ""
string powertiptext = "Opciones del Recibo de Caja"
string cod_rep = "RC"
string nombre_rep = "Recibo de Caja"
string tipo_rep = "documento!"
end type

event clicked;call super::clicked;if report.dw_rep.describe('datawindow.syntax')='' then 
	if inicia()=-1 then return
end if
openwithparm(w_conf_pag,this.report)
end event

type pb_factu from pb_report within w_simula_fac
boolean visible = false
integer x = 2519
integer y = 324
integer width = 64
integer height = 52
integer taborder = 120
boolean enabled = false
boolean originalsize = false
string picturename = ""
string powertiptext = "Opciones de Impresión de factura"
string cod_rep = "FC"
string nombre_rep = "Factura de Venta"
string tipo_rep = "documento!"
end type

event clicked;call super::clicked;if report.dw_rep.describe('datawindow.syntax')='' then 
	if inicia()=-1 then return
end if
openwithparm(w_conf_pag,this.report)
end event

type dw_factadm from datawindow within w_simula_fac
boolean visible = false
integer x = 2459
integer y = 72
integer width = 64
integer height = 108
integer taborder = 30
boolean enabled = false
string title = "none"
string dataobject = "dw_factadm"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_admis from datawindow within w_simula_fac
string tag = "Las admisiones que se van a cerrar"
boolean visible = false
integer x = 2450
integer y = 212
integer width = 69
integer height = 88
integer taborder = 70
boolean enabled = false
string title = "none"
string dataobject = "dw_factadm"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_ayuda from statictext within w_simula_fac
boolean visible = false
integer x = 841
integer y = 1804
integer width = 343
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type pb_kit from picturebutton within w_simula_fac
event mousemove pbm_mousemove
integer x = 640
integer y = 416
integer width = 151
integer height = 132
integer taborder = 210
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "            &k"
boolean originalsize = true
string picturename = "kits.GIF"
string disabledname = "d_kits.GIF"
alignment htextalign = left!
string powertiptext = "Cargar de Procedimientos Comunes [Alt+K]"
end type

event clicked;if i_tipoingreso<>'1' then
	messagebox("Atención","No puede Facturar desde esta parte para este tipo de servicio")
	this.text=''
	return -1
end if
if dw_emppac.rowcount()=0 then return -1
if dw_emppac.getitemstring(dw_emppac.getrow(),"estado")='0' then
	messagebox('Atención','Este contrato no está activo, no se le puede facturar')
	return -1
end if
//if not pb_paci.enabled then
//	messagebox("Atención","Ya tiene servicios desde una interface, no puede adicionar más")
//	this.text=''
//	return -1
//end if
if tag='1' then
	if f_permiso_boton(this,'FC')=0 then return
end if
st_proc_comun st_pc
st_pc.sle_proc=sle_proc
st_pc.dw_procs=dw_factura
st_pc.col_cant_proc='cantidad'
st_pc.sle_med=sle_proc
st_pc.dw_meds=dw_factura
st_pc.col_cant_med='cantidad'
//openwithparm(w_proc_comun,st_pc)

end event

event constructor;//f_inicia_boton(this,'RC')
end event

type cbx_equiv from checkbox within w_simula_fac
integer x = 1536
integer y = 556
integer width = 626
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Preguntar equivalencias"
boolean checked = true
end type

type cbx_3 from checkbox within w_simula_fac
integer x = 709
integer y = 556
integer width = 809
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Replicar Cambios de Porcentajes"
boolean checked = true
end type

type dw_acum_soat from datawindow within w_simula_fac
boolean visible = false
integer x = 2263
integer y = 236
integer width = 142
integer height = 96
integer taborder = 90
boolean enabled = false
string title = "none"
string dataobject = "dw_acum_soat"
boolean resizable = true
borderstyle borderstyle = stylelowered!
end type

event retrievestart;return 2
end event

event constructor;settransobject(sqlca)
end event

type st_cuant from statictext within w_simula_fac
integer x = 2962
integer y = 608
integer width = 544
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_2 from checkbox within w_simula_fac
boolean visible = false
integer x = 3072
integer y = 316
integer width = 471
integer height = 64
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "    Imprimir Recibo"
boolean checked = true
end type

event clicked;pb_reci.visible=checked
end event

type cbx_1 from checkbox within w_simula_fac
boolean visible = false
integer x = 2455
integer y = 316
integer width = 507
integer height = 64
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "    Imprimir Factura"
boolean checked = true
end type

event clicked;pb_factu.visible=checked
end event

type dw_segrespon from datawindow within w_simula_fac
boolean visible = false
integer x = 2281
integer y = 40
integer width = 133
integer height = 100
boolean enabled = false
string title = "none"
string dataobject = "dw_segrespon"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type sle_proc from singlelineedit within w_simula_fac
integer x = 27
integer y = 432
integer width = 320
integer height = 84
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
integer accelerator = 110
borderstyle borderstyle = stylelowered!
end type

event modified;if this.text="" then return -1
if i_tipoingreso<>'1' then
	messagebox("Atención","No puede Facturar desde esta parte para este tipo de servicio")
	this.text=''
	return -1
end if
//if i_tipoingreso='1' and dw_factura.rowcount()=0 then
//	open(w_alerta_deuda)
//	if message.stringparm='!' then
//		this.text=''
//		return -1
//	end if
//end if
if dw_emppac.rowcount()=0 then return -1
if dw_emppac.getitemstring(dw_emppac.getrow(),"estado")='0' then
	messagebox('Atención','Este contrato no está activo, no se le puede facturar')
	return -1
end if
//if not pb_paci.enabled then
//	messagebox("Atención","Ya tiene servicios desde una interface, no puede adicionar más")
//	this.text=''
//	return -1
//end if

//37 parametros ( p_codigo,p_desproc, p_cantidad,  p_tipo,  p_tipoing,  p_autoriza,  p_cemp,  p_cont,  p_cons_soat, 
//  p_clug_soat,  p_tdoc,  p_docu,  p_edad,  p_sexo,  p_codta, p_estrato, p_uf,  p_cc,  p_desde,  p_facturar,  p_contador, 
//  p_clug_his,  p_nserv,  p_prof_cir,  p_espe_cir,  p_via,  p_acto,  p_tipo_cir,  p_ncita, p_clug_cita, p_nserv_cita, 
//  p_sec_cant_cita,  p_nreci,  p_clug_rec,  p_item_rec,  p_ntrat, p_clug_trat, p_item_trat)
string emp,cont,sexo,codta,estrato
long edad
int ret
emp = dw_emppac.getitemstring(dw_emppac.getrow(),'codemp')
cont = dw_emppac.getitemstring(dw_emppac.getrow(),'codcontrato')
edad = f_edad_dias(dw_emppac.GetItemDateTime(dw_emppac.GetRow(),'fnacimiento'))
sexo = dw_emppac.GetItemString(dw_emppac.GetRow(),'sexo')
codta = dw_emppac.getitemstring(dw_emppac.getrow(),'codta')
estrato = dw_emppac.GetItemString(dw_emppac.GetRow(),'estrato')
ret = lf_cargar_a(text,'',1,'','1',sle_autoriza.text,emp,cont,0, &
  '',td,doc,edad,sexo,codta,estrato,'','','',1,0, &
  '',0,'','','',0,'',0,'',0,&
  0,0,'',0,0,'',0,'','!',0,0,0)
text=''
return ret

end event

type st_4 from statictext within w_simula_fac
integer x = 23
integer y = 608
integer width = 375
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_simula_fac
integer x = 2560
integer y = 228
integer width = 338
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Autorización:"
boolean focusrectangle = false
end type

type sle_autoriza from singlelineedit within w_simula_fac
integer x = 2926
integer y = 220
integer width = 489
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
integer limit = 15
borderstyle borderstyle = stylelowered!
end type

event modified;long j
if trim(this.text)="" then return
for j=1 to dw_factura.rowcount()
	dw_factura.setitem(j,"autoriza",this.text)
next
end event

type pb_borra from picturebutton within w_simula_fac
event mousemove pbm_mousemove
integer x = 498
integer y = 416
integer width = 151
integer height = 132
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &r"
boolean originalsize = true
string picturename = "bisturi X.GIF"
string disabledname = "d_bisturi X.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Procedimiento [Alt+R]"
end type

event clicked;long donde,j,k,busca
real tope
string empre,contr
donde=dw_factura.getrow()
if donde<1 then return
if tag='1' then
	if f_permiso_boton(this,'FC')=0 then return
end if
if dw_factura.getitemstring(donde,'cproc')='ABONOS' then return

if i_tipoingreso<>'1' then 
	messagebox("Atención",'En este tipo de ingreso no puede borrar procedimientos, lo que puede hacer es: Con click contrario indicar que no lo va a cobrar')
	return
end if
f_borra_fila(donde)
sle_proc.setfocus()
end event

event constructor;//f_inicia_boton(this,'FC')
end event

type dw_getareo from datawindow within w_simula_fac
boolean visible = false
integer x = 3493
integer y = 4
integer width = 82
integer height = 72
boolean enabled = false
string title = "none"
string dataobject = "dw_getareo_cumple"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_equiv from datawindow within w_simula_fac
boolean visible = false
integer x = 3497
integer y = 184
integer width = 82
integer height = 72
boolean enabled = false
string title = "none"
string dataobject = "dw_busca_equiv"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;this.settransobject(sqlca)
end event

type st_2 from statictext within w_simula_fac
integer x = 2560
integer y = 140
integer width = 302
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nro Póliza:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_simula_fac
integer x = 2551
integer y = 48
integer width = 361
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo &Ingreso:"
boolean focusrectangle = false
end type

type sle_poliza from singlelineedit within w_simula_fac
integer x = 2926
integer y = 132
integer width = 489
integer height = 80
integer taborder = 60
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

type dw_tarifas from datawindow within w_simula_fac
boolean visible = false
integer x = 3493
integer y = 116
integer width = 82
integer height = 72
boolean enabled = false
string title = "none"
string dataobject = "dw_tarifas"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_cont_det from datawindow within w_simula_fac
boolean visible = false
integer x = 3488
integer y = 68
integer width = 105
integer height = 64
boolean enabled = false
string title = "none"
string dataobject = "dw_cont_deta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_buscar from picturebutton within w_simula_fac
event mousemove pbm_mousemove
integer x = 357
integer y = 416
integer width = 146
integer height = 128
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &b"
boolean originalsize = true
string picturename = "bisturi busca.GIF"
string disabledname = "d_bisturi busca.GIF"
alignment htextalign = left!
string powertiptext = "Buscar Procedimiento [Alt+B]"
end type

event clicked;if i_tipoingreso<>'1' then
	messagebox("Atención","No puede Facturar desde esta parte para este tipo de servicio")
	this.text=''
	return -1
end if
if dw_emppac.rowcount()=0 then return -1
if dw_emppac.getitemstring(dw_emppac.getrow(),"estado")='0' then
	messagebox('Atención','Este contrato no está activo, no se le puede facturar')
	return -1
end if
//if not pb_paci.enabled then
//	messagebox("Atención","Ya tiene servicios desde una interface, no puede adicionar más")
//	this.text=''
//	return -1
//end if
if tag='1' then
	if f_permiso_boton(this,'FC')=0 then return
end if
st_cargar_a st
if dw_emppac.rowcount()>0 then
	st.emp = dw_emppac.getitemstring(dw_emppac.getrow(),'codemp')
	st.cont = dw_emppac.getitemstring(dw_emppac.getrow(),'codcontrato')
	st.sexo = dw_emppac.getitemstring(dw_emppac.getrow(),'sexo')
	st.edad = f_edad_dias(dw_emppac.getitemDateTime(dw_emppac.getrow(),'fnacimiento'))
	st.estrato = dw_emppac.GetItemString(dw_emppac.GetRow(),'estrato')
end if
st.sle=sle_proc
openwithparm(w_busca_serv,st)

end event

event constructor;//f_inicia_boton(this,'FC')
end event

type dw_tip_ingres from datawindow within w_simula_fac
integer x = 2921
integer y = 40
integer width = 494
integer height = 132
integer taborder = 50
string title = "none"
string dataobject = "dw_tip_ingres_drop"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
//f_titulos_dw(this,'FC')
if not visible then 
	gb_1.visible=false
	st_1.visible=false
	st_2.visible=false
	st_3.visible=false
	sle_poliza.visible=false
	sle_autoriza.visible=false
end if
end event

event itemchanged;i_tipoingreso=gettext()
blanquea()
dw_rec_caj_cab.visible=false
//dw_forma_pago.visible=false
//pb_pagares.visible=false
//pb_pagares.enabled=false
pb_calcula.visible=false
pb_calcula.enabled=false
//pb_paci.enabled=true
////pb_emp.enabled=true
pb_facturar.enabled=true
i_confirma_ge='si'

this.accepttext()

end event

type dw_factura from datawindow within w_simula_fac
event mousemove pbm_mousemove
event keypres pbm_dwnkey
integer x = 18
integer y = 680
integer width = 3493
integer height = 728
integer taborder = 260
boolean bringtotop = true
string title = "none"
string dataobject = "dw_factura"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean border = false
boolean livescroll = true
end type

event keypres;if key=keydelete! and this.getcolumnname()<>"cantidad" and this.getcolumnname()<>"autoriza" then pb_borra.triggerevent(clicked!)
end event

event itemchanged;long cual,busca,acum,sepasa,k
dec l_copagofijo,l_cuotarfija,l_cuotamfija
cual=getrow()
sepasa=0
real ctope
string tipoing,desde
if getcolumnname()="cantidad" then
	desde=getitemstring(cual,'desde')
	tipoing=getitemstring(cual,'tingres')
	if tipoing<>'1' then
		messagebox("Atención","No puede cambiar la cantidad en este tipo de ingreso")
		setitem(cual,"cantidad",getitemnumber(cual,"cantidad"))
		settext(string(getitemnumber(cual,"cantidad")))
		return 1
	end if
	if desde='G' or desde='S' or desde='C' then
		messagebox("Atención","Este servicio es de una cita o tiene un recibo o es de un servicio ya prestado, por lo tanto no puede cambiar la cantidad")
		setitem(cual,"cantidad",getitemnumber(cual,"cantidad"))
		settext(string(getitemnumber(cual,"cantidad")))
		return 1
	end if
	if getitemnumber(cual,"v_part")>0 then
		messagebox("Atención","Cambió el monto por el cual responde la empresa,no puede cambiar la cantidad")
		setitem(cual,"cantidad",getitemnumber(cual,"cantidad"))
		return 1
	end if
	if (getitemstring(cual,"tipo_proc")="Q" or getitemstring(cual,"tipo_proc")="P") and long(gettext())>1 then
		 setitem(getrow(),"cantidad",1)
		 settext('1')
		 return 1
	end if
	if f_cambiar_cant(cual,integer(gettext()),'M')=-1 then
		setitem(cual,"cantidad",getitemnumber(cual,"cantidad"))
		settext(string(getitemnumber(cual,"cantidad")))
		dw_factura.setredraw(true)
		return 1
	end if
	return 0
end if
if getcolumnname()="percent_pac" then
	if real(data)<getitemnumber(cual,"pormin") or real(data)>getitemnumber(cual,"pormax") then 
		setitem(cual,"percent_pac",getitemnumber(cual,"pormax"))
		accepttext()
		f_cambiar_cant(row,getitemnumber(row,'cantidad'),'%')
		return 1
	end if
	accepttext()
	if cbx_3.checked then
		long changes,estoy
		real porcent
		string empr,contr
		estoy=getrow()
		porcent=getitemnumber(estoy,'percent_pac')
		empr=getitemstring(estoy,'cemp')
		contr=getitemstring(estoy,'ccontrato')
		for changes=1 to rowcount()
			if getitemstring(changes,'cemp')=empr and getitemstring(changes,'ccontrato')=contr and isnull(getitemnumber(changes,'nrcaj'))then
				setitem(changes,'percent_pac',porcent)
				f_cambiar_cant(changes,getitemnumber(changes,'cantidad'),'%')
			end if
		next
		scrolltorow(estoy)
	else
		f_cambiar_cant(row,getitemnumber(row,'cantidad'),'%')
		dw_factura.setredraw(true)
	end if
end if
return 0
end event

event doubleclicked;long cual,l_puntos
STRING TLIQ,l_tiposerv,l_codproc,l_grupo,l_manual
cual=getrow()
if cual<1 or cual>rowcount() then return
l_tiposerv=getitemstring(cual,"tipo_proc")
l_codproc=getitemstring(cual,"cproc")
l_grupo=getitemstring(cual,"grupo")
l_puntos=getitemnumber(cual,"puntos")
l_manual=getitemstring(cual,"cod_manual")
select ctlqx into :tliq from manuales where codmanual=:l_manual;
if l_tiposerv="Q" or l_tiposerv="P" then
	st_cirugia st_c
	st_c.tiposerv=l_tiposerv
	st_c.manual=l_manual
	st_c.codproc=l_codproc
	st_c.dw_factura=dw_factura
	st_c.dw_factura_cpo=dw_factura_cpo
	st_c.nuevo_edita='edita'
	st_c.aneste=getitemstring(cual,"aneste")
	st_c.cod_auxqx=getitemstring(cual,"cod_auxqx")
	if tliq="1" then
		st_c.grupo=l_grupo
		openwithparm(w_cirugias,st_c)
	else
		st_c.puntos=l_puntos
		openwithparm(w_cirugias_uvr,st_c)
	end if
	st_c=message.powerobjectparm
	if st_c.valor<>0 then 
		i_reviso_multiples=false
		f_cambiar_cant(cual,1,'Q')
	end if
	setnull(l_manual)
end if
end event

event rowfocuschanged;if this.getrow()<1 then 
	st_4.text=""
	st_5.text=""
	st_cuant.text=""
	return
end if
choose case this.getitemstring(this.getrow(),"tipo_proc")
	case "P"
		st_4.text="Paquete"
	case "G"
		st_4.text="General"
	case "Q"
		st_4.text="Quirúrgico"
end choose
st_5.text=this.getitemstring(this.getrow(),"descripcion")
st_cuant.text="Reg. "+string(this.getrow())+" de "+string(this.rowcount())
end event

event constructor;settransobject(sqlca)
//f_titulos_dw_gb(this,'FC',gb_4)
end event

event buttonclicked;scrolltorow(row)
if getitemstring(row,'cemp')='0' and getitemstring(row,'ccontrato')='1' then return
if getitemstring(row,'desde')='G' or (getitemstring(row,'desde')='S' and not isnull(getitemnumber(row,'nrcaj'))) then 
	messagebox("Atención",'Este registro viene de la interface de Empresa/Contrato o tiene recibo, no le puede realizar cambios')
	return
end if
openwithparm(w_cambia_valores,dw_factura)
if message.stringparm='si' then 
	resumen('')
	totales()
end if

end event

event clicked;if dwo.type = "text" then 
	string cual,ojo,ss
	cual=dwo.name
	cual=mid(cual,1,len(cual) - 2)
	if i_anterior=cual then
		if i_orden="A" then
			i_orden="D"
		else
			i_orden="A"
		end if
	else
		i_orden="A"
	end if
	this.setsort(cual+" "+i_orden)
	this.sort()
	i_anterior=cual
end if
end event

event rbuttondown;if row<1 then return
scrolltorow(row)
//m_principal.m_3.m_3_10.m_3_10_5.PopMenu (w_principal.PointerX(), w_principal.PointerY())
long cons_soat,donde,j
string clug_soat
dec valor
cons_soat=getitemnumber(row,'consec_soat')
clug_soat=getitemstring(row,'clugar_soat')
valor=getitemdecimal(row,'vt_emp')
if message.stringparm='resp' then //cambiar responsable
	if getitemstring(row,'desde')='G' or (getitemstring(row,'desde')='S' and not isnull(getitemnumber(row,'nrcaj'))) then
		messagebox("Atención",'Este viene de una interface o tiene recibo y no lo puede cambiar')
		return
	end if	
	st_cambia_resp st_cr
	st_cr.dw_factura=dw_factura
	st_cr.dw_factura_cpo=dw_factura_cpo
	st_cr.dw_acum_soat=dw_acum_soat
	openwithparm(w_cambia_respon,st_cr)
	if message.stringparm='si' then
		if not isnull(cons_soat) and valor>0 then
			donde=dw_acum_soat.find('consec='+string(cons_soat)+" and clug_soat='"+clug_soat+"'",1,dw_acum_soat.rowcount())
			dw_acum_soat.setitem(donde,'lleva',dw_acum_soat.getitemnumber(donde,'lleva')-valor)
		end if
		setpointer(hourglass!)
		if getitemstring(row,"tipo_proc")='P' or getitemstring(row,"tipo_proc")='Q' then i_reviso_multiples=false
		f_cambiar_cant(row,getitemnumber(row,'cantidad'),'R')
		recalcula_todo()
		dw_factura.scrolltorow(row)
	end if
end if
if message.stringparm='noc' then //nocobrar
	if not isnull(cons_soat) and valor>0 then
		donde=dw_acum_soat.find('consec='+string(cons_soat)+" and clug_soat='"+clug_soat+"'",1,dw_acum_soat.rowcount())
		dw_acum_soat.setitem(donde,'lleva',dw_acum_soat.getitemnumber(donde,'lleva')-valor)
	end if
	dw_factura.setitem(row,'vt_proc',0)
	dw_factura.setitem(row,'vt_emp',0)
	dw_factura.setitem(row,'vt_proc',0)
	dw_factura.setitem(row,'vt_pac',0)
	dw_factura.setitem(row,'vp_unit',0)
	dw_factura.setitem(row,'cuanto_fijo',0)
	dw_factura.setitem(row,'que_paga','nada')
	if getitemstring(row,'tipo_proc')='P' or getitemstring(row,'tipo_proc')='Q' then
		dw_factura_cpo.setfilter('num_padre='+string(getitemnumber(row,'numero')))
		dw_factura_cpo.filter()
		for j=1 to dw_factura_cpo.rowcount()
			dw_factura_cpo.setitem(j,'valor',0)
		next
	end if
	f_cambiar_cant(row,getitemnumber(row,'cantidad'),'%')
	recalcula_todo()
	dw_factura.scrolltorow(row)
end if

end event

type dw_resumen from datawindow within w_simula_fac
event clickup pbm_dwnlbuttonup
event mousemove pbm_dwnmousemove
string tag = "Imprimir Estado de Cuenta por Empresa/Contrato"
integer x = 18
integer y = 1408
integer width = 3493
integer height = 404
integer taborder = 270
boolean bringtotop = true
string title = "none"
string dataobject = "dw_resumen_facturas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clickup;if dwo.name='p_1' then
	this.setitem(row,"clic",'0')
	if pb_parcial.report.dw_rep.describe('datawindow.syntax')='' then 
		if pb_parcial.inicia()=-1 then return
	end if
	long j,donde
	string cemp,cont,descontrato,pacitodo
	cemp=dw_resumen.getitemstring(row,'cemp')
	cont=dw_resumen.getitemstring(row,'ccont')
	pacitodo=td+' '+doc //+' '+w_principal.dw_1.getitemstring(1,'compute_1')+' '+w_principal.dw_1.getitemstring(1,'edad')
	for j=1 to dw_factura.rowcount()
		if dw_factura.getitemstring(j,"cemp")=cemp and dw_factura.getitemstring(j,"ccontrato")=cont then
			donde=pb_parcial.report.dw_rep.insertrow(0)
			pb_parcial.report.dw_rep.setitem(donde,'cemp',cemp)
			pb_parcial.report.dw_rep.setitem(donde,'descontrato',dw_resumen.getitemstring(row,'des_cont'))
			pb_parcial.report.dw_rep.setitem(donde,'tdoc_paci_sexo_edad',pacitodo)
			pb_parcial.report.dw_rep.setitem(donde,'tingres',i_tipoingreso)
			//pb_parcial.dw_rep.setitem(donde,'fechaingres','')
			pb_parcial.report.dw_rep.setitem(donde,'cproc',dw_factura.getitemstring(j,"cproc"))
			pb_parcial.report.dw_rep.setitem(donde,'desproc',dw_factura.getitemstring(j,"descripcion"))
			pb_parcial.report.dw_rep.setitem(donde,'cantidad',dw_factura.getitemnumber(j,"cantidad"))
			pb_parcial.report.dw_rep.setitem(donde,'tipo_serv',dw_factura.getitemstring(j,"tipo_proc"))
			pb_parcial.report.dw_rep.setitem(donde,'vproc',dw_factura.getitemnumber(j,"vt_proc"))
			pb_parcial.report.dw_rep.setitem(donde,'vemp',dw_factura.getitemnumber(j,"vt_emp"))
			pb_parcial.report.dw_rep.setitem(donde,'numero',dw_factura.getitemnumber(j,"numero"))
		end if
	next
	pb_parcial.report.dw_rep.sort()
	pb_parcial.report.dw_rep.groupcalc()
	donde=pb_parcial.report.dw_rep.print()
//	any par[1]
//	pb_parcial.imprimir(par)
end if
end event

event mousemove;if dwo.name='p_1' then
	if (xant=xpos and xant=xpos) or st_ayuda.visible then return
	xant=xpos
	yant=ypos
	st_ayuda.x=f_vent_padre(this).pointerx()+50
	st_ayuda.y=f_vent_padre(this).pointery() - 90
	st_ayuda.width=len(this.tag)*26
	st_ayuda.text=this.tag
	st_ayuda.visible=true
	timer(5)
else
	st_ayuda.visible=false
	timer(0)
end if
end event

event constructor;settransobject(sqlca)
//f_titulos_dw(this,'FC')

end event

event doubleclicked;if getrow()<1 then return
if getitemstring(getrow(),"cemp")='0' or getitemnumber(getrow(),"vtemp")=0 then return
st_xa_desc_emp st
st.dw_empres=this
st.dw_factcpo=dw_factura
openwithparm(w_descuentos,st)
if message.stringparm='si' then
	string em,ct
	long donde
	em=dw_resumen.getitemstring(row,"cemp")
	ct=dw_resumen.getitemstring(row,"ccont")
	donde=dw_acum_soat.find("emp='"+em+"' and cont='"+ct+"'",1,dw_acum_soat.rowcount())
	if donde<>0 then dw_acum_soat.setitem(donde,'lleva',dw_resumen.getitemnumber(row,'vtemp'))
end if
end event

event clicked;if dw_resumen.rowcount()=0 then return
if dwo.name='p_1' then
	setitem(row,'clic','1')
end if
end event

type dw_forma_pago from datawindow within w_simula_fac
boolean visible = false
integer x = 1957
integer y = 400
integer width = 443
integer height = 148
integer taborder = 240
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_combo_forma_pago"
boolean border = false
boolean livescroll = true
end type

event constructor;dw_forma_pago.settransobject(sqlca)
//f_titulos_dw_gb(this,'FC',gb_2)
dw_forma_pago.insertrow(1)
end event

type pb_soat from picturebutton within w_simula_fac
event mousemove pbm_mousemove
boolean visible = false
integer x = 2258
integer y = 108
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
boolean enabled = false
string text = "          &s"
boolean originalsize = true
string picturename = "buscar2.GIF"
string disabledname = "d_buscar2.GIF"
alignment htextalign = left!
string powertiptext = "Acumulados SOAT del paciente [Alt+S]"
end type

event clicked;if tag='1' then
	if f_permiso_boton(this,'FC')=0 then return
end if
st_soat st
setnull(st.nsoat)
st.newemp=dw_emppac.getitemstring(dw_emppac.getrow(),"codemp")
st.newcont=dw_emppac.getitemstring(dw_emppac.getrow(),"codcontrato")
openwithparm(w_soat,st)
end event

event constructor;//f_inicia_boton(this,i_ventana)
end event

type gb_1 from groupbox within w_simula_fac
integer x = 2432
integer width = 1115
integer height = 316
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Generalidades"
end type

type gb_2 from groupbox within w_simula_fac
boolean visible = false
integer x = 1778
integer y = 356
integer width = 1774
integer height = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Cargo a paciente"
end type

type gb_3 from groupbox within w_simula_fac
integer x = 5
integer y = 356
integer width = 805
integer height = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Asignació&n procedimientos"
end type

type gb_4 from groupbox within w_simula_fac
integer y = 556
integer width = 3552
integer height = 1268
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimientos asignados"
end type

type gb_6 from groupbox within w_simula_fac
integer x = 9
integer width = 2235
integer height = 356
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Afiliación del Paciente"
end type

type pb_facturar from picturebutton within w_simula_fac
event mousemove pbm_mousemove
boolean visible = false
integer x = 1445
integer y = 416
integer width = 146
integer height = 128
integer taborder = 220
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "          &g"
boolean originalsize = true
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
string powertiptext = "Guardar y generar Factura [Alt+G]"
end type

event clicked;if not f_hasta() then 
	messagebox("Atención","Su periodo de validez ha caducado, comuníquese con GCI Ltda. para reactivarlo")
	return
end if
////////////// ojo para que no metan goles ^
if dw_factura.rowcount()=0 or dw_resumen.rowcount()=0 then return
if tag='1' then
	if f_permiso_boton(this,'FC')=0 then return
end if
if dw_factura.getitemnumber(1,"grupos")>1 and not i_reviso_multiples then
	messagebox("Atención","No ha revisado la liquidación de las cirugias, revise esto para continuar")
end if
setpointer(hourglass!)
if factura()=-1 then
	rollback;
else
	commit;
end if
garbagecollect()
end event

event constructor;f_inicia_boton(this,'FC')
end event

type pb_calcula from picturebutton within w_simula_fac
event mousemove pbm_mousemove
boolean visible = false
integer x = 1614
integer y = 416
integer width = 146
integer height = 128
integer taborder = 230
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "          &l"
boolean originalsize = true
string picturename = "refrescar.GIF"
string disabledname = "d_refrescar.GIF"
alignment htextalign = left!
string powertiptext = "Recalcular Grupos [Alt+L]"
end type

event clicked;//if tag='1' then
//	if f_permiso_boton(this,'FC')=0 then return
//end if
//if not i_reviso_multiples and dw_factura.getitemnumber(1,'s_recal')>0 then 
//	messagebox("Atención","Debe primero revisar todas y cada una de las cirugias dando doble click sobre ellas")
//	return
//end if
//if i_reviso_multiples=true then return
//if not i_reviso_multiples and dw_factura.getitemnumber(1,'s_recal')=0 then i_reviso_multiples=true
//st_cambia_resp st_dws
//st_dws.dw_factura=dw_factura
//st_dws.dw_factura_cpo=dw_factura_cpo
//openwithparm(w_calc_multiple,st_dws)
//if message.stringparm='si' then
//	i_reviso_multiples=true
//	long j
//	setpointer(hourglass!)
//	for j=1 to dw_factura.rowcount()
//		if dw_factura.getitemstring(j,"tipo_proc")='P' or dw_factura.getitemstring(j,"tipo_proc")='Q' then
//			f_cambiar_cant(j,1,'Q')
//		end if	
//	next
//else
//	i_reviso_multiples=false
//end if
end event

event constructor;//f_inicia_boton(this,'FC')
end event

type dw_factura_cpo from datawindow within w_simula_fac
boolean visible = false
integer x = 3502
integer y = 252
integer width = 78
integer height = 80
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_factura_cpo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_simula_fac
integer x = 411
integer y = 608
integer width = 2514
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_emppac from datawindow within w_simula_fac
integer x = 50
integer y = 48
integer width = 2144
integer height = 296
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_empacguarda"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long cc
cc=getrow()
if cc<1 then return
string check_base,contr,emp
check_base=getitemstring(getrow(),"chequea_base")
if getitemstring(getrow(),"soat")='1' then
	pb_soat.enabled=true
	pb_soat.visible=true
else
	pb_soat.enabled=false
	pb_soat.visible=false
end if
if check_base="1" then
	emp=getitemstring(getrow(),"codemp")
	contr=getitemstring(getrow(),"codcontrato")
	if not i_tiene_base then
		Messagebox("Atención",'Este contrato indica que debe revisar la base capitada, pero el equipo no la tiene configurada o no se pudo conectar a ella')
		return
	end if
	string nombre1
	setnull(nombre1)
	select nombre1 into :nombre1 from capitados 
	where tipodoc=:td and documento=:doc and empresa=:emp and contrato=:contr using sqlba;
	if sqlba.sqlcode=-1 then
		Messagebox("Error leyendo capitados",sqlba.sqlerrtext)
		return
	end if
	if isnull(nombre1) and i_comprobo=0 then 
		choose case messagebox("Atención","Este paciente no se encuentra en la base de datos de la empresa,~r~ndesea facturarlo como: ~r~n~r~nSI:		A la empresa aún así ~r~n~r~nNO:		Como Particular ~r~n~r~nCancelar:		No Facturarle ",question!,yesnocancel!,2)
			case 1
				i_comprobo=3
			case 3
				dw_cont_det.reset()
				i_comprobo=2
			case 2
				i_comprobo=1
		end choose
	else
		if i_comprobo=1 then
		else
			if i_comprobo=2 then dw_cont_det.reset()
		end if
	end if
end if
end event

event constructor;settransobject(sqlca)
//f_titulos_dw_gb(this,i_ventana,gb_6)

string usua,deslugar,temp
select nombre into :usua from usuarios where usuario=:usuario;
select descripcion into :deslugar from lugar where codlugar=:clugar;
parent.title+=' ('+usuario+') '+usua//+'123456789012345678901234567890123456789012'

if ls_pro=32 THEN	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "BASE_CAPI", Regstring!, temp)
if ls_pro=64 THEN	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\", "BASE_CAPI", Regstring!, temp)
if temp='1' then
	i_tiene_base=true
	if not isvalid(sqlba ) then sqlba = create transaction
	if f_conecta_capi(sqlba)=-1 then i_tiene_base=false		
else
	i_tiene_base=false
end if
end event

type dw_rec_caj_cab from datawindow within w_simula_fac
boolean visible = false
integer x = 2455
integer y = 392
integer width = 1079
integer height = 156
integer taborder = 250
boolean bringtotop = true
string title = "dw_rec_caj_cab"
string dataobject = "dw_rec_caj_cab"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;if gettext()='1' then
	pb_pagare.visible=true
else
	pb_pagare.visible=false
end if
accepttext()
end event

type pb_pagare from pb_report within w_simula_fac
boolean visible = false
integer x = 2958
integer y = 500
integer width = 55
integer height = 48
integer taborder = 160
boolean bringtotop = true
string picturename = ""
string powertiptext = "Opciones de Pagaré"
string cod_rep = "PA"
string nombre_rep = "Pagarés"
string tipo_rep = "documento!"
end type

event clicked;call super::clicked;if report.dw_rep.describe('datawindow.syntax')='' then 
	if inicia()=-1 then return
end if
openwithparm(w_conf_pag,this.report)
end event

type pb_parcial from pb_report within w_simula_fac
boolean visible = false
integer x = 18
integer y = 1476
integer width = 96
integer height = 88
integer taborder = 280
boolean bringtotop = true
boolean enabled = false
boolean originalsize = false
string cod_rep = "CPF"
string nombre_rep = "Cuenta Parcial de Facturación"
string tipo_rep = "interno!"
boolean v_preliminar = true
end type

type dw_memory from datawindow within w_simula_fac
boolean visible = false
integer x = 2254
integer width = 64
integer height = 88
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_memory_equiv"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

