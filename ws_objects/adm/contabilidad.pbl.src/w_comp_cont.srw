$PBExportHeader$w_comp_cont.srw
forward
global type w_comp_cont from w_center
end type
type dw_emp from datawindow within w_comp_cont
end type
type dw_doc from datawindow within w_comp_cont
end type
type dw_historial from datawindow within w_comp_cont
end type
type dw_resumen from datawindow within w_comp_cont
end type
type st_regi from statictext within w_comp_cont
end type
type st_cuenta from statictext within w_comp_cont
end type
type st_tercero from statictext within w_comp_cont
end type
type st_doc_ref from statictext within w_comp_cont
end type
type dw_detalle from datawindow within w_comp_cont
end type
type st_1 from statictext within w_comp_cont
end type
type dw_digita from datawindow within w_comp_cont
end type
type pb_new from picturebutton within w_comp_cont
end type
type pb_new_otro from picturebutton within w_comp_cont
end type
type pb_del from picturebutton within w_comp_cont
end type
type dw_doc_cab from datawindow within w_comp_cont
end type
type pb_del_asiento from picturebutton within w_comp_cont
end type
type pb_export from picturebutton within w_comp_cont
end type
type pb_import from picturebutton within w_comp_cont
end type
type pb_saldos from picturebutton within w_comp_cont
end type
type hpb_1 from hprogressbar within w_comp_cont
end type
type dw_cierres from datawindow within w_comp_cont
end type
type pb_abre from picturebutton within w_comp_cont
end type
type pb_del_all from picturebutton within w_comp_cont
end type
type dw_ctas_uti from datawindow within w_comp_cont
end type
type cbx_rep from checkbox within w_comp_cont
end type
type pb_new_plant from picturebutton within w_comp_cont
end type
type pb_cierre_anyo from picturebutton within w_comp_cont
end type
type pb_1 from pb_report within w_comp_cont
end type
type gb_1 from groupbox within w_comp_cont
end type
type gb_2 from groupbox within w_comp_cont
end type
type gb_3 from groupbox within w_comp_cont
end type
end forward

global type w_comp_cont from w_center
string tag = "Realizó Cambios en el Asiento Contable, desea guardarlos?"
integer width = 4594
integer height = 2040
string title = "Asientos Contables"
boolean minbox = false
boolean maxbox = false
windowtype windowtype = child!
string icon = "asi_cont.ico"
boolean center = false
dw_emp dw_emp
dw_doc dw_doc
dw_historial dw_historial
dw_resumen dw_resumen
st_regi st_regi
st_cuenta st_cuenta
st_tercero st_tercero
st_doc_ref st_doc_ref
dw_detalle dw_detalle
st_1 st_1
dw_digita dw_digita
pb_new pb_new
pb_new_otro pb_new_otro
pb_del pb_del
dw_doc_cab dw_doc_cab
pb_del_asiento pb_del_asiento
pb_export pb_export
pb_import pb_import
pb_saldos pb_saldos
hpb_1 hpb_1
dw_cierres dw_cierres
pb_abre pb_abre
pb_del_all pb_del_all
dw_ctas_uti dw_ctas_uti
cbx_rep cbx_rep
pb_new_plant pb_new_plant
pb_cierre_anyo pb_cierre_anyo
pb_1 pb_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_comp_cont w_comp_cont

type variables
string docum_contable='' ,i_codemp='',anterior,orden,anterior2,orden2,deb_cre
long num_docu_contable=0
datawindowchild dw_docus,dw_ccosto,idw_emp_docext
boolean i_cambio_llave=false
int i_dec_gral,i_aprox_gral,i_dec_rte,i_aprox_rte
end variables

forward prototypes
public function boolean f_existe_saldo (string codemp, integer ano, integer mes, string cod_largo)
public function integer f_rev_negat (string codemp)
public function integer f_new_docu (boolean p_pidefecha)
public function integer grabar (boolean p_validar)
public function integer grabar ()
public function integer f_actu_util_perd (long fila_mes, boolean sald_ini, decimal ingresos, decimal gastos, integer signo)
public function integer f_cierra_docu (integer p_signo)
public function integer f_actu_movi (string codemp, integer ano, integer mes, string cod_largo, decimal valordeb, decimal valorcred, boolean netear, boolean sald_ini, string p_corriente, string p_naturaleza)
public function decimal f_lee_saldo (integer p_ano, integer p_mes, string p_codemp, string p_cta, string p_tipo)
public function integer f_util_perd (string p_cta, decimal p_debito, decimal p_credito, boolean p_sald_ini, string p_codemp, integer p_ano, integer p_mes, string p_tipo, integer p_signo)
public function integer f_mayoriza (string mayor, string grupo, string cta, string subcta, string n1, string n2, string n3, string n4, string n5, decimal valordeb, decimal valorcred, boolean sald_ini, string p_corriente, string p_natu, integer p_ano, integer p_mes)
public function integer f_revisa_util_perd (long p_fila_mes, boolean p_sald_ini, decimal p_ing, decimal p_gas, integer p_signo)
public function integer f_todo (string codemp, integer ano, integer mes, string cod_largo, string cuenta, string t_doc, string nit, string dverif, string coduf, string codcc, decimal valordeb, decimal valorcred, boolean netear, boolean sald_ini, string p_corriente, string p_naturaleza, string p_clug)
public function integer f_insert_saldo (string codemp, integer ano, integer mes, string cod_largo, string cuenta, string t_doc, string nit, string dverif, string coduf, string codcc, string p_clug)
public function integer lf_reversa_doc ()
end prototypes

public function boolean f_existe_saldo (string codemp, integer ano, integer mes, string cod_largo);// revisa si existe o nó un saldo 
decimal saldo
setnull(saldo)
select saldodebito into :saldo from cont_saldos where cod_empresa=:codemp  and ano=:ano and mes=:mes and cod_general=:cod_largo;
if isnull(saldo)  then
	return false
else
	return true
end if
end function

public function integer f_rev_negat (string codemp);string err
update cont_saldos set saldodebito=0 , saldocredito= -saldodebito 
where cod_empresa=:codemp and saldodebito <0;
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox("Error actualizando Saldos",err)
	return -1
end if
update cont_saldos set cierredebito=0 , cierrecredito= -cierredebito 
where cod_empresa=:codemp and cierredebito <0;
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox("Error actualizando Saldos",err)
	return -1
end if
update cont_saldos set credito=-debito , debito=0 
where cod_empresa=:codemp and  debito <0;
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox("Error actualizando Saldos",err)
	return -1
end if
update cont_saldos set debito=-credito , credito=0 
where cod_empresa=:codemp and credito <0;
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox("Error actualizando Saldos",err)
	return -1
end if
return 1
end function

public function integer f_new_docu (boolean p_pidefecha);if i_codemp='' or docum_contable='' then return -1
if dw_detalle.accepttext()=-1 then return -1
f_quitafiltro(dw_detalle,string(rgb(255,255,255)))
choose case f_pregunta()
	case 1
		if grabar(false)=-1 then return -1
	case 3
		return -1
end choose
if docum_contable="SI" then
	long ndoc
	setnull(ndoc)
	select ndoc into :ndoc from cont_doc_cab where cod_empresa=:i_codemp and cdoc='SI';
	if not isnull(ndoc) then
		rollback;
		Messagebox("Atención","Ya existe el documento: "+string(ndoc)+" de saldos iniciales para esta empresa, no se puede crear otro documento de este tipo")
		return -1
	end if
end if
dw_detalle.reset()
dw_resumen.reset()
dw_doc_cab.reset()
dw_doc_cab.insertrow(1)
cambio=false

if p_pidefecha and docum_contable<>'CI' then
	open(w_pide_fecha)
	if message.stringparm<>'si' then return -1
end if
dw_doc_cab.setitem(1,"cod_empresa",i_codemp)
dw_doc_cab.setitem(1,"cdoc",docum_contable)
dw_doc_cab.setitem(1,"estado",0)
pb_new_otro.enabled =false
pb_new_plant.enabled=false
dw_digita.setfocus()
return 1
end function

public function integer grabar (boolean p_validar);if not f_demo('ter') then return -1
dw_doc_cab.accepttext()
dw_detalle.accepttext()
f_quitafiltro(dw_detalle,string(rgb(255,255,255)))
long j,ndocum,cuantos
if dw_detalle.accepttext()=-1 then return -1
if dw_detalle.rowcount()=0 then 
	messagebox("Atención","El comprobante debe tener asientos contables")
	return -1
end if
if dw_doc_cab.getitemnumber(1,"ano") <> year(date(dw_doc_cab.getitemdatetime(1,"fecha"))) then
	messagebox("Atención","El año no corresponde a la fecha del documento")
	dw_doc_cab.setcolumn("ano")
	dw_doc_cab.setfocus()
	return -1
end if
if dw_doc_cab.getitemstring(1,"cdoc")<>'CI' and dw_doc_cab.getitemnumber(1,"mes") <> month(date(dw_doc_cab.getitemdatetime(1,"fecha"))) then
	messagebox("Atención","El mes no corresponde a la fecha del documento")
	dw_doc_cab.setcolumn("mes")
	dw_doc_cab.setfocus()
	return -1
end if
if dw_cierres.find("ano="+string(dw_doc_cab.getitemnumber(1,"ano"))+" and mes="+string(dw_doc_cab.getitemnumber(1,"mes")),1,dw_cierres.rowcount())=0 then
	messagebox("Atención","Este mes contable no ha sido creado, debe crearlo primero para poder continuar")
	return -1
end if
if docum_contable='SI' then //revisar si corresponde al primer mes SALDOS INICIALES
	if dw_doc_cab.getitemnumber(1,"mes")<>dw_cierres.getitemnumber(dw_cierres.rowcount(),"mes") or dw_doc_cab.getitemnumber(1,"ano")<>dw_cierres.getitemnumber(dw_cierres.rowcount(),"ano")then
		MessageBox("Atención","El año o el mes de este documento es diferente al primer periodo de la empresa")
		return -1
	end if
end if
long ano_new
string err
if i_cambio_llave then
	long mes_new,ano_ant
	datetime fecha_new
	long regs
	regs=dw_detalle.rowcount()
	fecha_new=dw_doc_cab.getitemdatetime(1,"fecha")
	ndocum=dw_doc_cab.getitemnumber(1,"ndoc")
	ano_ant=dw_historial.getitemnumber(dw_historial.getrow(),"ano")
	ano_new=dw_doc_cab.getitemnumber(1,"ano")
	mes_new=dw_doc_cab.getitemnumber(1,"mes")
	INSERT INTO cont_doc_cab ( COD_EMPRESA, Ano, Mes, CDoc, ndoc, tipo, fecha, Estado, Tregistros, Usuario, total, fechageneracion )
	SELECT CONT_DOC_CAB.COD_EMPRESA, :Ano_new AS anonew, :mes_new AS Mesnew, CONT_DOC_CAB.CDoc, CONT_DOC_CAB.ndoc, CONT_DOC_CAB.tipo, :fecha_new as fecnew, '0', :regs as Tregs, CONT_DOC_CAB.Usuario, CONT_DOC_CAB.total, CONT_DOC_CAB.fechageneracion
	FROM CONT_DOC_CAB
	WHERE (((CONT_DOC_CAB.COD_EMPRESA)=:i_codemp) AND ((CONT_DOC_CAB.Ano)=:ano_ant) AND ((CONT_DOC_CAB.CDoc)=:docum_contable) AND ((CONT_DOC_CAB.ndoc)=:ndocum));
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox("Error insertando nuevo encabezado",err)
		return -1
	end if
end if
cuantos=dw_detalle.rowcount()
hpb_1.position=5
setnull(ndocum)
select nactual into :ndocum from cont_docu where coddoc=:docum_contable and cod_empresa=:i_codemp;
if not isnull(dw_doc_cab.getitemnumber(1,"ndoc")) then ndocum=-1
if isnull(ndocum) then
	rollback;
	messagebox("Atención","Error leyendo el documento contable, reviselo en la tabla CONT_DOCU")
	hpb_1.position=0
	return -1
end if
ndocum++
hpb_1.position=10
dw_detalle.setsort('cp_secuencia A')
dw_detalle.sort()
for j=1 to dw_detalle.rowcount()
	hpb_1.position= 10 +(j *85 / cuantos)
	if p_validar then
		if isnull(dw_detalle.getitemstring(j,"descrip")) or dw_detalle.getitemstring(j,"descrip")='' then
			rollback;
			messagebox("Atención","Revise la cuenta para el asiento Nro: "+string(j))
			dw_detalle.scrolltorow(j)
			dw_detalle.setcolumn("cp_cuenta")
			dw_detalle.setfocus()
			hpb_1.position=0
			return -1
		end if
		if not isnull(dw_detalle.getitemnumber(j,'nsopo_externo')) then
			if isnull(dw_detalle.getitemstring(j,'coddocext')) then
				rollback;
				messagebox("Atención","Debe digitar el tipo de documento para el asiento Nro: "+string(j))
				dw_detalle.scrolltorow(j)
				dw_detalle.setcolumn("coddocext")
				dw_detalle.setfocus()
				hpb_1.position=0
				return -1
			end if
		end if
		if dw_detalle.getitemstring(j,"movimiento")='0' then
			rollback;
			messagebox("Atención","Revise la cuenta no es de movimiento para el asiento Nro: "+string(j))
			dw_detalle.scrolltorow(j)
			dw_detalle.setcolumn("cp_cuenta")
			dw_detalle.setfocus()
			hpb_1.position=0
			return -1
		end if
		if not isnull(dw_detalle.getitemstring(j,'rfuente')) then
			if (isnull(dw_detalle.getitemdecimal(j,'cp_valordeb')) or dw_detalle.getitemdecimal(j,'cp_valordeb')=0)and(isnull(dw_detalle.getitemdecimal(j,'cp_valorcred')) or dw_detalle.getitemdecimal(j,'cp_valorcred')=0)and (dw_detalle.getitemdecimal(j,'base')=0 or isnull(dw_detalle.getitemdecimal(j,'base'))) then
				rollback;
				messagebox("Atención","Debe digitar la Base para el asiento Nro: "+string(j))
				dw_detalle.scrolltorow(j)
				dw_detalle.setcolumn("Base")
				dw_detalle.setfocus()
				hpb_1.position=0
				return -1
			end if	
		end if
		if dw_detalle.getitemstring(j,"nref")='1' then
			if isnull(dw_detalle.getitemnumber(j,'nsopo_externo')) then
				rollback;
				messagebox("Atención","Debe digitar el Soporte Externo para el asiento Nro: "+string(j))
				dw_detalle.scrolltorow(j)
				dw_detalle.setcolumn("nsopo_externo")
				dw_detalle.setfocus()
				hpb_1.position=0
				return -1
			end if
		end if		
		if dw_detalle.getitemstring(j,"lugar")='1' then
			if isnull(dw_detalle.getitemstring(j,"clugar")) then
				rollback;
				messagebox("Atención","Debe digitar el lugar para el asiento Nro: "+string(j))
				dw_detalle.scrolltorow(j)
				dw_detalle.setcolumn("clugar")
				dw_detalle.setfocus()
				hpb_1.position=0
				return -1
			end if
		end if
		if dw_detalle.getitemstring(j,"ccosto")='1' then
			if dw_detalle.getitemstring(j,"cp_cufuncional")='' or isnull(dw_detalle.getitemstring(j,"cp_cufuncional")) then
				rollback;
				messagebox("Atención","Debe digitar la Unidad Funcional y Centro de Costo para el asiento Nro: "+string(j))
				dw_detalle.scrolltorow(j)
				dw_detalle.setcolumn("cp_cufuncional")
				dw_detalle.setfocus()
				hpb_1.position=0
				return -1
			end if
			if dw_detalle.getitemstring(j,"cp_ccosto")='' or isnull(dw_detalle.getitemstring(j,"cp_ccosto")) then
				rollback;
				messagebox("Atención","Debe digitar la Unidad Funcional y Centro de Costo para el asiento Nro: "+string(j))
				dw_detalle.scrolltorow(j)
				dw_detalle.setcolumn("cp_ccosto")
				dw_detalle.setfocus()
				hpb_1.position=0
				return -1
			end if
		end if
		if dw_detalle.getitemstring(j,"tercero")='1' then
			if dw_detalle.getitemstring(j,"tipodoc")='' or isnull(dw_detalle.getitemstring(j,"tipodoc")) then
				rollback;
				messagebox("Atención","Debe digitar los datos del Tercero para el asiento Nro: "+string(j))
				dw_detalle.scrolltorow(j)
				dw_detalle.setcolumn("tipodoc")
				dw_detalle.setfocus()
				hpb_1.position=0
				return -1
			end if
			if dw_detalle.getitemstring(j,"documento")='' or isnull(dw_detalle.getitemstring(j,"documento")) then
				rollback;
				messagebox("Atención","Debe digitar los datos del Tercero para el asiento Nro: "+string(j))
				dw_detalle.scrolltorow(j)
				dw_detalle.setcolumn("documento")
				dw_detalle.setfocus()
				hpb_1.position=0
				return -1
			end if
		end if
		if deb_cre<>'1' then
			if dw_detalle.getitemdecimal(j,'cp_valordeb')=0 and dw_detalle.getitemdecimal(j,'cp_valorcred')=0 then
				rollback;
				messagebox("Atención","Debe digitar los valores para el asiento Nro: "+string(j))
				dw_detalle.scrolltorow(j)
				dw_detalle.setcolumn("cp_valordeb")
				dw_detalle.setfocus()
				hpb_1.position=0
				return -1
			end if
		end if
	end if
	if ndocum<>0 then dw_detalle.setitem(j,"cp_ndoc",ndocum)
next
if ndocum<>0 then dw_doc_cab.setitem(1,"ndoc",ndocum)
if isnull(dw_doc_cab.getitemstring(1,"usuario")) then dw_doc_cab.setitem(1,"usuario",usuario)
if isnull(dw_doc_cab.getitemdatetime(1,"fechageneracion")) then dw_doc_cab.setitem(1,"fechageneracion",datetime(today()))
dw_doc_cab.setitem(1,"tregistros",dw_detalle.rowcount())
ano_new=dw_doc_cab.getitemnumber(1,"ano")
if not i_cambio_llave then
	if dw_doc_cab.update()=-1 then
		rollback using sqlca;
		hpb_1.position=0
		setnull(j)
		if ndocum=0 then dw_doc_cab.setitem(1,"ndoc",j)
		return -1
	end if
end if

if dw_detalle.update()=-1 then
	setnull(j)
	hpb_1.position=0
	if ndocum=0 then dw_doc_cab.setitem(1,"ndoc",j)
	delete from cont_doc_cp where cod_empresa=:i_codemp and ano=:ano_new and cdoc=:docum_contable and ndoc=:ndocum;
	if sqlca.sqlcode = 0 then
		Commit;
	else
		Rollback;
	end if
	dw_doc_cab.deleterow(1)
	if dw_doc_cab.update()=-1 then
		rollback using sqlca;
		return -1
	else
		dw_doc_cab.retrieve(i_codemp,ano_new,docum_contable,ndocum)
	end if
	return -1
end if

if i_cambio_llave then
	dw_doc_cab.deleterow(1)
	if dw_doc_cab.update()=-1 then
		return -1
	else
		dw_doc_cab.retrieve(i_codemp,ano_new,docum_contable,ndocum)
	end if
end if
hpb_1.position=97
if ndocum<>0 then
	update cont_docu set nactual=:ndocum where cod_empresa=:i_codemp and coddoc=:docum_contable and nactual=:ndocum -1;
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox("Error actualizando Con_Docum",sqlca.sqlerrtext)
		hpb_1.position=0
		setnull(j)
		if ndocum=0 then dw_doc_cab.setitem(1,"ndoc",j)
		sqlca.AutoCommit=true
		return -1
	end if
end if
cambio=false
long donde_det
donde_det=dw_detalle.getrow()
if ndocum<>0 or i_cambio_llave then
	long estaba
	estaba=dw_historial.getrow()
	dw_doc.triggerevent(itemchanged!)
	if i_cambio_llave then 
		dw_historial.scrolltorow(estaba)
		dw_detalle.scrolltorow(donde_det)
	end if
	i_cambio_llave=false
end if
hpb_1.position=100
if ndocum=0 then 
	dw_historial.setitem(dw_historial.getrow(),"mes",dw_doc_cab.getitemnumber(1,"mes"))
	dw_historial.triggerevent(rowfocuschanged!)
	dw_detalle.scrolltorow(donde_det)
end if
hpb_1.position=0
dw_digita.setfocus()
pb_new_otro.enabled=true
pb_new_plant.enabled=true
return 1
end function

public function integer grabar ();return grabar(false)
end function

public function integer f_actu_util_perd (long fila_mes, boolean sald_ini, decimal ingresos, decimal gastos, integer signo);dec valor,sald_util,sald_perd
long mes_ciclo,ano_ciclo,ciclo_mes
string cta_util,cta_perd

ingresos*=signo
gastos*=signo
valor=round(ingresos -gastos,2)
cta_util=dw_ctas_uti.getitemstring(1,'cuenta_utilidad')
cta_perd=dw_ctas_uti.getitemstring(1,'cuenta_perdida')

if valor > 0 then //utilidad (credito)
	for ciclo_mes=fila_mes to 1 step -1
		ano_ciclo=dw_cierres.getitemnumber(ciclo_mes,"ano")
		mes_ciclo=dw_cierres.getitemnumber(ciclo_mes,"mes")
		sald_util=f_lee_saldo(ano_ciclo,mes_ciclo,i_codemp,cta_util,'U')
		sald_perd=f_lee_saldo(ano_ciclo,mes_ciclo,i_codemp,cta_perd,'P')
		if sald_perd=-1 or sald_util=-1 then return -1
		if sald_perd<>0 then
			if valor > sald_perd then
				if f_util_perd(cta_perd,0,sald_perd,sald_ini,i_codemp,ano_ciclo,mes_ciclo,'P',signo)=-1 then return -1
				if f_util_perd(cta_util,0,valor - sald_perd,sald_ini,i_codemp,ano_ciclo,mes_ciclo,'U',signo)=-1 then return -1
			else
				if f_util_perd(cta_perd,0,valor,sald_ini,i_codemp,ano_ciclo,mes_ciclo,'P',signo)=-1 then return -1
			end if
		else
			if f_util_perd(cta_util,0,valor,sald_ini,i_codemp,ano_ciclo,mes_ciclo,'U',signo)=-1 then return -1
		end if
		sald_ini=true
	next
else //perdida (debito)
	valor*=-1
	for ciclo_mes=fila_mes to 1 step -1 
		ano_ciclo=dw_cierres.getitemnumber(ciclo_mes,"ano")
		mes_ciclo=dw_cierres.getitemnumber(ciclo_mes,"mes")
		sald_util=f_lee_saldo(ano_ciclo,mes_ciclo,i_codemp,cta_util,'U')
		sald_perd=f_lee_saldo(ano_ciclo,mes_ciclo,i_codemp,cta_perd,'P')
		if sald_perd=-1 or sald_util=-1 then return -1
		if sald_util<>0 then
			if valor > sald_util then
				if f_util_perd(cta_util,sald_util,0,sald_ini,i_codemp,ano_ciclo,mes_ciclo,'U',signo)=-1 then return -1
				if f_util_perd(cta_perd,valor -sald_util,0,sald_ini,i_codemp,ano_ciclo,mes_ciclo,'P',signo)=-1 then return -1
			else
				if f_util_perd(cta_util,valor,0,sald_ini,i_codemp,ano_ciclo,mes_ciclo,'U',signo)=-1 then return -1
			end if
		else
			if f_util_perd(cta_perd,valor,0,sald_ini,i_codemp,ano_ciclo,mes_ciclo,'P',signo)=-1 then return -1
		end if
		sald_ini=true
	next
end if
return 1
end function

public function integer f_cierra_docu (integer p_signo);long cuantos,l_ano,l_mes
f_quitafiltro(dw_detalle,string(rgb(255,255,255)))
if dw_detalle.rowcount()=0 then return -1
if p_signo=1 then //solo cuando está aprobando
	if grabar(true)=-1 then return -1
	if round(dw_detalle.getitemdecimal(1,"totaldeb"),2)<>round(dw_detalle.getitemdecimal(1,"totalcred"),2) and dw_doc.getitemstring(1,1)<>'CI' then
		messagebox("Atención","Este documento no se encuentra balanceado, reviselo para poder continuar")
		return -1
	end if
end if
l_ano=dw_doc_cab.getitemnumber(1,"ano")
l_mes=dw_doc_cab.getitemnumber(1,"mes")
long j,fila_mes,ciclo_mes
fila_mes=dw_cierres.find("ano="+string(l_ano)+" and mes="+string(l_mes),1,dw_cierres.rowcount())
if fila_mes=0 then
	messagebox("Atención","Este mes contable no ha sido creado, debe crearlo primero para poder continuar")
	return -1
else
	if dw_cierres.getitemstring(fila_mes,"estado")='1' and dw_doc.getitemstring(1,1)<>'CI'then
		messagebox("Atención","Este mes contable se encuentra cerrado, no puede actualizarle saldos")
		return -1
	end if
end if
boolean netear,sald_ini
if docum_contable="SI" then
	sald_ini=true
	fila_mes=1
else
	sald_ini=false
end if
decimal saldo,valordeb,valorcred
string err ,cod_largo,cuenta,t_doc,nit,dverif,codcc,coduf,mayor,grupo,cta,subcta,n1,n2,n3,n4,n5,corr,natu,clug,movi
int ano_ciclo,mes_ciclo
///////////////  DOCUMENTO 'SI' ES EL UNICO QUE DEBE HACER ESTO
IF dw_doc.getitemstring(1,1)='SI' then
	if dw_ctas_uti.rowcount()=0 then
		messagebox("Atención","Esta empresa no tiene definidas las cuentas de utilidad y pérdida, definalas en las tablas básicas para poder continuar")
		return -1
	end if
	hpb_1.position=5
	string  caso
	for j=1 to dw_detalle.rowcount()
		hpb_1.position=5 + (j * 95/dw_detalle.rowcount())
		netear=false
		setnull(mayor)
		setnull(grupo)
		setnull(cta)
		setnull(subcta)
		setnull(n1)
		setnull(n2)
		setnull(n3)
		setnull(n4)
		setnull(n5)
		setnull(t_doc)
		setnull(nit)
		setnull(dverif)
		setnull(clug)
		setnull(coduf)
		setnull(codcc)
		setnull(movi)
		cod_largo=dw_detalle.getitemstring(j,"cp_cuenta")
		cuenta=cod_largo
		corr=dw_detalle.getitemstring(j,"t_corriente")
		natu=dw_detalle.getitemstring(j,"naturaleza")
		SELECT CONT_PLAN.mayor, CONT_PLAN.grupo, CONT_PLAN.cuenta, CONT_PLAN.subcuenta, CONT_PLAN.Nivel1, CONT_PLAN.Nivel2, CONT_PLAN.Nivel3, CONT_PLAN.Nivel4, CONT_PLAN.Nivel5,CONT_PLAN.movimiento
		into :mayor,:grupo,:cta,:subcta,:n1,:n2,:n3,:n4,:n5,:movi
		FROM CONT_PLAN
		WHERE CONT_PLAN.COD_EMPRESA=:i_codemp AND CONT_PLAN.CodTotal=:cuenta;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox('Error leyendo Cont_plan en f_cierra_docu',err)
			return -1
		end if
		if dw_detalle.getitemstring(j,"lugar")='1' then
			clug=dw_detalle.getitemstring(j,"clugar")
			cod_largo+='-'+clug
			caso='1'
		else
			caso='0'
		end if
		if dw_detalle.getitemstring(j,"ccosto")='1' then
			coduf=dw_detalle.getitemstring(j,"cp_cufuncional")
			codcc=dw_detalle.getitemstring(j,"cp_ccosto")
			cod_largo+="-"+coduf
			cod_largo+="-"+codcc
			caso+='1'
		else
			caso+='0'
		end if
		if dw_detalle.getitemstring(j,"tercero")='1' then
			t_doc=dw_detalle.getitemstring(j,"tipodoc")
			nit=dw_detalle.getitemstring(j,"documento")
			dverif=dw_detalle.getitemstring(j,"cp_dverificacion")
			if isnull(dverif) then dverif=''
			cod_largo+="-"+t_doc+'-'+nit
			//cod_largo+="-"+dverif//pa evitar problemas
			caso+='1'
		else
			caso+='0'
		end if
		valordeb=dw_detalle.getitemdecimal(j,"cp_valordeb")*p_signo
		valorcred=dw_detalle.getitemdecimal(j,"cp_valorcred")*p_signo
		if isnull(valordeb) then valordeb=0
		if isnull(valorcred) then valorcred=0
		//pedazo comun a todos los casos
		if f_todo(i_codemp,l_ano,l_mes,cod_largo,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,true,sald_ini,corr,natu,clug)=-1 then return -1
		for ciclo_mes=fila_mes -1 to 1 step -1 						//ciclo para actualizar hasta el mes actual si guarda un documento de meses anteriores
			ano_ciclo=dw_cierres.getitemnumber(ciclo_mes,"ano")	// si el documento es del mes en que van no entra al ciclo
			mes_ciclo=dw_cierres.getitemnumber(ciclo_mes,"mes")
			if f_todo(i_codemp,ano_ciclo,mes_ciclo,cod_largo,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,true,true,corr,natu,clug)=-1 then return -1
		next
		//fin pedazo comun a todos los casos
		netear=true
		choose case caso//el primero es lugar el segundo de cc y el ultimo de tercero
			case '000'
			case '001','010'//leva uno de los dos (o cc o tercero) y luego debe actualizar la cuenta sin arandelas
				setnull(t_doc)
				setnull(nit)
				setnull(dverif)
				setnull(coduf)
				setnull(codcc)
				setnull(clug)
				netear=true
				if f_todo(i_codemp,l_ano,l_mes,cuenta,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,netear,sald_ini,corr,natu,clug)=-1 then return -1
				for ciclo_mes=fila_mes -1 to 1 step -1
					ano_ciclo=dw_cierres.getitemnumber(ciclo_mes,"ano")
					mes_ciclo=dw_cierres.getitemnumber(ciclo_mes,"mes")
					if f_todo(i_codemp,ano_ciclo,mes_ciclo,cuenta,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,netear,true,corr,natu,clug)=-1 then return -1
				next
			case '011'//lleva cc y tercero y luego debe actualizar la cuenta sin tercero y luego la cuenta sin cc
				netear=true
				setnull(clug)
				setnull(t_doc)
				setnull(nit)
				setnull(dverif)
				if f_todo(i_codemp,l_ano,l_mes,cuenta+"-"+coduf+"-"+codcc,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,netear,sald_ini,corr,natu,clug)=-1 then return -1
				for ciclo_mes=fila_mes -1 to 1 step -1
					ano_ciclo=dw_cierres.getitemnumber(ciclo_mes,"ano")
					mes_ciclo=dw_cierres.getitemnumber(ciclo_mes,"mes")
					if f_todo(i_codemp,ano_ciclo,mes_ciclo,cuenta+"-"+coduf+"-"+codcc,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,netear,true,corr,natu,clug)=-1 then return -1
				next
				setnull(coduf)
				setnull(codcc)
				if f_todo(i_codemp,l_ano,l_mes,cuenta,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,netear,sald_ini,corr,natu,clug)=-1 then return -1
				for ciclo_mes=fila_mes -1 to 1 step -1
					ano_ciclo=dw_cierres.getitemnumber(ciclo_mes,"ano")
					mes_ciclo=dw_cierres.getitemnumber(ciclo_mes,"mes")
					if f_todo(i_codemp,ano_ciclo,mes_ciclo,cuenta,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,netear,true,corr,natu,clug)=-1 then return -1
				next
			case '100'//solo lugar , actualizar luego la sola cuenta
				netear=true
				setnull(t_doc)
				setnull(nit)
				setnull(dverif)
				setnull(coduf)
				setnull(codcc)
				setnull(clug)		
				if f_todo(i_codemp,l_ano,l_mes,cuenta,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,netear,sald_ini,corr,natu,clug)=-1 then return -1
				for ciclo_mes=fila_mes -1 to 1 step -1
					ano_ciclo=dw_cierres.getitemnumber(ciclo_mes,"ano")
					mes_ciclo=dw_cierres.getitemnumber(ciclo_mes,"mes")
					if f_todo(i_codemp,ano_ciclo,mes_ciclo,cuenta,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,netear,true,corr,natu,clug)=-1 then return -1
				next
			case '101','110'// luego con lugar y luego sin nada
				setnull(coduf)
				setnull(codcc)
				setnull(clug)				
				netear=true
				if f_todo(i_codemp,l_ano,l_mes,cuenta+'-'+t_doc+'-'+nit,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,netear,sald_ini,corr,natu,clug)=-1 then return -1
				for ciclo_mes=fila_mes -1 to 1 step -1
					ano_ciclo=dw_cierres.getitemnumber(ciclo_mes,"ano")
					mes_ciclo=dw_cierres.getitemnumber(ciclo_mes,"mes")
					if f_todo(i_codemp,ano_ciclo,mes_ciclo,cuenta+'-'+t_doc+'-'+nit,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,netear,true,corr,natu,clug)=-1 then return -1
				next
				setnull(t_doc)
				setnull(nit)
				setnull(dverif)				
				if f_todo(i_codemp,l_ano,l_mes,cuenta,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,netear,sald_ini,corr,natu,clug)=-1 then return -1
				for ciclo_mes=fila_mes -1 to 1 step -1
					ano_ciclo=dw_cierres.getitemnumber(ciclo_mes,"ano")
					mes_ciclo=dw_cierres.getitemnumber(ciclo_mes,"mes")
					if f_todo(i_codemp,ano_ciclo,mes_ciclo,cuenta,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,netear,true,corr,natu,clug)=-1 then return -1
				next

//				if f_todo(i_codemp,l_ano,l_mes,cuenta,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,netear,sald_ini,corr,natu,clug)=-1 then return -1
//				for ciclo_mes=fila_mes -1 to 1 step -1
//					ano_ciclo=dw_cierres.getitemnumber(ciclo_mes,"ano")
//					mes_ciclo=dw_cierres.getitemnumber(ciclo_mes,"mes")
//					if f_todo(i_codemp,ano_ciclo,mes_ciclo,cuenta,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,netear,true,corr,natu,clug)=-1 then return -1
//				next
			case '111'//lugar + uf cc luego lugar luego sola
				netear=true
				setnull(t_doc)
				setnull(nit)
				setnull(dverif)
				if f_todo(i_codemp,l_ano,l_mes,cuenta+'-'+clug+"-"+coduf+"-"+codcc,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,netear,sald_ini,corr,natu,clug)=-1 then return -1
				for ciclo_mes=fila_mes -1 to 1 step -1
					ano_ciclo=dw_cierres.getitemnumber(ciclo_mes,"ano")
					mes_ciclo=dw_cierres.getitemnumber(ciclo_mes,"mes")
					if f_todo(i_codemp,ano_ciclo,mes_ciclo,cuenta+'-'+clug+"-"+coduf+"-"+codcc,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,netear,true,corr,natu,clug)=-1 then return -1
				next
				setnull(coduf)
				setnull(codcc)
				if f_todo(i_codemp,l_ano,l_mes,cuenta+'-'+clug,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,netear,sald_ini,corr,natu,clug)=-1 then return -1
				for ciclo_mes=fila_mes -1 to 1 step -1
					ano_ciclo=dw_cierres.getitemnumber(ciclo_mes,"ano")
					mes_ciclo=dw_cierres.getitemnumber(ciclo_mes,"mes")
					if f_todo(i_codemp,ano_ciclo,mes_ciclo,cuenta+'-'+clug,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,netear,true,corr,natu,clug)=-1 then return -1
				next
				setnull(clug)
				if f_todo(i_codemp,l_ano,l_mes,cuenta,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,netear,sald_ini,corr,natu,clug)=-1 then return -1
				for ciclo_mes=fila_mes -1 to 1 step -1
					ano_ciclo=dw_cierres.getitemnumber(ciclo_mes,"ano")
					mes_ciclo=dw_cierres.getitemnumber(ciclo_mes,"mes")
					if f_todo(i_codemp,ano_ciclo,mes_ciclo,cuenta,cuenta,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,netear,true,corr,natu,clug)=-1 then return -1
				next
		end choose
		setnull(t_doc)
		setnull(nit)
		setnull(dverif)
		setnull(coduf)
		setnull(codcc)
		//ahora toca actualizar los niveles de ahi pa arriba
		if f_mayoriza(mayor,grupo,cta,subcta,n1,n2,n3,n4,n5,valordeb,valorcred,sald_ini,corr,natu,l_ano,l_mes)=-1 then return -1
		messagebox('',j)
	next
	decimal INGRESOS,gastos
	ingresos=dw_detalle.getitemdecimal(1,'tingreso')
	gastos=dw_detalle.getitemdecimal(1,'tgasto')
	if dw_doc.getitemstring(1,1)<>'CI' and dw_doc.getitemstring(1,1)<>'SI' then//CI=cierre de año,SI=saldos ini
		if round(ingresos - gastos,2) <>0 then 
			if f_actu_util_perd(fila_mes,false,ingresos,gastos,p_signo)=-1 then return -1
		end if
		if f_revisa_util_perd(fila_mes,false,ingresos,gastos,p_signo)=-1 then return -1
	end if
	if f_rev_negat(i_codemp)=-1 then return -1
end if ///////////////  F I N   D E    DOCUMENTO 'SI' ES EL UNICO QUE DEBE HACER ESTO

if p_signo=1 then
	dw_doc_cab.setitem(1,"estado",'3')
else
	dw_doc_cab.setitem(1,"estado",'0')
end if
if dw_doc_cab.update()=-1 then return -1
return 1
end function

public function integer f_actu_movi (string codemp, integer ano, integer mes, string cod_largo, decimal valordeb, decimal valorcred, boolean netear, boolean sald_ini, string p_corriente, string p_naturaleza);// actualiza saldosiniciales si sald_ini=true
// actualiza las columnas debito y credito en cont_saldos teniendo en cuenta si netea o no
dec valor
string err
if sald_ini then
	if p_corriente='C' then //es corriente
		if p_naturaleza='D' then //es debito
			if valordeb<>0 then
				valor=valordeb
			else
				valor=-valorcred
			end if
		else //es credito
			if valorcred<>0 then
				valor=valorcred
			else
				valor=-valordeb
			end if
		end if
		if netear then
			//1
			update cont_saldos set saldodebito=saldodebito + :valordeb -saldocredito - :valorcred , 
			saldocredito=0, cierredebito=saldodebito + :valordeb+debito -(saldocredito + :valorcred)-credito,
			cierrecredito=0,saldocorriente=saldocorriente +:valor ,cierrecorriente=cierrecorriente +:valor
			where cod_empresa=:codemp and ano=:ano and mes=:mes and cod_general=:cod_largo;
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox("Error actualizando Saldos Iniciales",err)
				return -1
			end if
		else
			//2
			update cont_saldos set saldodebito=saldodebito + :valordeb -saldocredito - :valorcred, saldocredito=0 , 
			cierredebito=saldodebito + :valordeb+debito ,cierrecredito=saldocredito + :valorcred + credito,
			saldocorriente=saldocorriente +:valor ,cierrecorriente=cierrecorriente +:valor
			where cod_empresa=:codemp and ano=:ano and mes=:mes and cod_general=:cod_largo;
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox("Error actualizando Saldos Iniciales",err)
				return -1
			end if
		end if
	else //es no corriente
		if p_naturaleza='D' then //es debito
			if valordeb<>0 then
				valor=valordeb
			else
				valor=-valorcred
			end if
		else //es credito
			if valorcred<>0 then
				valor=valorcred
			else
				valor=-valordeb
			end if
		end if
		if netear then
			update cont_saldos set saldodebito=saldodebito + :valordeb -saldocredito - :valorcred , 
			saldocredito=0, cierredebito=saldodebito + :valordeb+debito -(saldocredito + :valorcred)-credito,
			cierrecredito=0,
			saldonocorriente=saldonocorriente +:valor ,cierrenocorriente=cierrenocorriente +:valor
			where cod_empresa=:codemp and ano=:ano and mes=:mes and cod_general=:cod_largo;
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox("Error actualizando Saldos Iniciales",err)
				return -1
			end if
		else
			update cont_saldos set saldodebito=saldodebito + :valordeb -saldocredito - :valorcred, saldocredito=0 , 
			cierredebito=saldodebito + :valordeb+debito ,cierrecredito=saldocredito + :valorcred + credito,
			saldonocorriente=saldonocorriente +:valor ,cierrenocorriente=cierrenocorriente +:valor
			where cod_empresa=:codemp and ano=:ano and mes=:mes and cod_general=:cod_largo;
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox("Error actualizando Saldos Iniciales",err)
				return -1
			end if
		end if
	end if
else //no son saldos iniciales
	if p_corriente='C' then //es corriente
		if p_naturaleza='D' then //es debito
			if valordeb<>0 then
				valor=valordeb
			else
				valor=-valorcred
			end if
		else //es credito
			if valorcred<>0 then
				valor=valorcred
			else
				valor=-valordeb
			end if
		end if
		if netear then
			//1
			update cont_saldos set debito=debito + :valordeb , credito=credito + :valorcred , 
			cierredebito = saldodebito - saldocredito + (debito + :valordeb)-(credito + :valorcred),cierrecredito=0,
			cierrecorriente=cierrecorriente +:valor
			where cod_empresa=:codemp and ano=:ano and mes=:mes and cod_general=:cod_largo;
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox("Error actualizando Saldos",err)
				return -1
			end if
		else
			//2
			update cont_saldos set debito=debito + :valordeb , credito=credito + :valorcred , 
			cierredebito = saldodebito + debito + :valordeb , cierrecredito = saldocredito + credito + :valorcred,
			cierrecorriente=cierrecorriente +:valor
			where cod_empresa=:codemp and ano=:ano and mes=:mes and cod_general=:cod_largo;
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox("Error actualizando Saldos",err)
				return -1
			end if
		end if
	else //es no corriente
		if p_naturaleza='D' then //es debito
			if valordeb<>0 then
				valor=valordeb
			else
				valor=-valorcred
			end if
		else //es credito
			if valorcred<>0 then
				valor=valorcred
			else
				valor=-valordeb
			end if
		end if
		if netear then
			update cont_saldos set debito=debito + :valordeb , credito=credito + :valorcred , 
			cierredebito = saldodebito - saldocredito + (debito + :valordeb)-(credito + :valorcred),cierrecredito=0,
			cierrenocorriente=cierrenocorriente +:valor
			where cod_empresa=:codemp and ano=:ano and mes=:mes and cod_general=:cod_largo;
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox("Error actualizando Saldos",err)
				return -1
			end if
		else
			update cont_saldos set debito=debito + :valordeb , credito=credito + :valorcred , 
			cierredebito = saldodebito + debito + :valordeb , cierrecredito = saldocredito + credito + :valorcred,
			cierrenocorriente=cierrenocorriente +:valor
			where cod_empresa=:codemp and ano=:ano and mes=:mes and cod_general=:cod_largo;
			if sqlca.sqlcode=-1 then
				err=sqlca.sqlerrtext
				rollback;
				messagebox("Error actualizando Saldos",err)
				return -1
			end if
		end if
	end if
end if
return 1

end function

public function decimal f_lee_saldo (integer p_ano, integer p_mes, string p_codemp, string p_cta, string p_tipo);//p_tipo: 'U' utilidad , 'P' perdida
dec valor
string err
choose case p_tipo
	case 'U'
		select cierrecredito - cierredebito into :valor from cont_saldos 
		where cod_empresa=:p_codemp and ano=:p_ano and mes=:p_mes and cod_general=:p_cta;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox("Error leyendo saldos de Utilidad",err)
			return -1
		end if
	case 'P'
		select cierredebito - cierrecredito into :valor from cont_saldos 
		where cod_empresa=:p_codemp and ano=:p_ano and mes=:p_mes and cod_general=:p_cta;
		if sqlca.sqlcode=-1 then
			err=sqlca.sqlerrtext
			rollback;
			messagebox("Error leyendo saldos de Pérdida",err)
			return -1
		end if
end choose
if isnull(valor) then valor=0
return valor

end function

public function integer f_util_perd (string p_cta, decimal p_debito, decimal p_credito, boolean p_sald_ini, string p_codemp, integer p_ano, integer p_mes, string p_tipo, integer p_signo);string may,gru,cue,sub,n1,n2,n3,n4,n5,corr,natu,cod_largo,nulo
setnull(nulo)
if p_tipo='U' then
	may=dw_ctas_uti.getitemstring(1,'may_uti')
	gru=dw_ctas_uti.getitemstring(1,'gru_uti')
	cue=dw_ctas_uti.getitemstring(1,'cue_uti')
	sub=dw_ctas_uti.getitemstring(1,'sub_uti')
	n1=dw_ctas_uti.getitemstring(1,'ni1_uti')
	n2=dw_ctas_uti.getitemstring(1,'ni2_uti')
	n3=dw_ctas_uti.getitemstring(1,'ni3_uti')
	n4=dw_ctas_uti.getitemstring(1,'ni4_uti')
	n5=dw_ctas_uti.getitemstring(1,'ni5_uti')
	corr=dw_ctas_uti.getitemstring(1,'corr_uti')
	natu=dw_ctas_uti.getitemstring(1,'natu_uti')
else
	may=dw_ctas_uti.getitemstring(1,'may_per')
	gru=dw_ctas_uti.getitemstring(1,'gru_per')
	cue=dw_ctas_uti.getitemstring(1,'cue_per')
	sub=dw_ctas_uti.getitemstring(1,'sub_per')
	n1=dw_ctas_uti.getitemstring(1,'ni1_per')
	n2=dw_ctas_uti.getitemstring(1,'ni2_per')
	n3=dw_ctas_uti.getitemstring(1,'ni3_per')
	n4=dw_ctas_uti.getitemstring(1,'ni4_per')
	n5=dw_ctas_uti.getitemstring(1,'ni5_per')
	corr=dw_ctas_uti.getitemstring(1,'corr_per')
	natu=dw_ctas_uti.getitemstring(1,'natu_per')
end if
if f_todo(p_codemp,p_ano,p_mes,p_cta,p_cta,nulo,nulo,nulo,nulo,nulo,p_debito,p_credito,true,p_sald_ini,corr,natu,nulo)=-1 then return -1
if not isnull(n4) and trim(n4)<>'' and not isnull(n5) and trim(n5)<>'' then
	cod_largo=may+gru+cue+sub+n1+n2+n3+n4
	if p_signo=1 then
		if f_todo(p_codemp,p_ano,p_mes,cod_largo,cod_largo,nulo,nulo,nulo,nulo,nulo,p_debito,p_credito,true,p_sald_ini,corr,natu,nulo)=-1 then return -1
	else
		if f_todo(p_codemp,p_ano,p_mes,cod_largo,cod_largo,nulo,nulo,nulo,nulo,nulo,-p_credito,-p_debito,true,p_sald_ini,corr,natu,nulo)=-1 then return -1
	end if
end if
if not isnull(n3) and trim(n3)<>'' and not isnull(n4) and trim(n4)<>'' then
	cod_largo=may+gru+cue+sub+n1+n2+n3
	if p_signo=1 then
		if f_todo(p_codemp,p_ano,p_mes,cod_largo,cod_largo,nulo,nulo,nulo,nulo,nulo,p_debito,p_credito,true,p_sald_ini,corr,natu,nulo)=-1 then return -1
	else
		if f_todo(p_codemp,p_ano,p_mes,cod_largo,cod_largo,nulo,nulo,nulo,nulo,nulo,-p_credito,-p_debito,true,p_sald_ini,corr,natu,nulo)=-1 then return -1
	end if
end if
if not isnull(n2) and trim(n2)<>'' and not isnull(n3) and trim(n3)<>'' then
	cod_largo=may+gru+cue+sub+n1+n2
	if p_signo=1 then
		if f_todo(p_codemp,p_ano,p_mes,cod_largo,cod_largo,nulo,nulo,nulo,nulo,nulo,p_debito,p_credito,true,p_sald_ini,corr,natu,nulo)=-1 then return -1
	else
		if f_todo(p_codemp,p_ano,p_mes,cod_largo,cod_largo,nulo,nulo,nulo,nulo,nulo,-p_credito,-p_debito,true,p_sald_ini,corr,natu,nulo)=-1 then return -1
	end if
end if
if not isnull(n1) and trim(n1)<>'' and not isnull(n2) and trim(n2)<>'' then
	cod_largo=may+gru+cue+sub+n1
	if p_signo=1 then
		if f_todo(p_codemp,p_ano,p_mes,cod_largo,cod_largo,nulo,nulo,nulo,nulo,nulo,p_debito,p_credito,true,p_sald_ini,corr,natu,nulo)=-1 then return -1
	else
		if f_todo(p_codemp,p_ano,p_mes,cod_largo,cod_largo,nulo,nulo,nulo,nulo,nulo,-p_credito,-p_debito,true,p_sald_ini,corr,natu,nulo)=-1 then return -1
	end if
end if
if not isnull(sub) and trim(sub)<>'' and not isnull(n1) and trim(n1)<>'' then
	cod_largo=may+gru+cue+sub
	if p_signo=1 then
		if f_todo(p_codemp,p_ano,p_mes,cod_largo,cod_largo,nulo,nulo,nulo,nulo,nulo,p_debito,p_credito,true,p_sald_ini,corr,natu,nulo)=-1 then return -1
	else
		if f_todo(p_codemp,p_ano,p_mes,cod_largo,cod_largo,nulo,nulo,nulo,nulo,nulo,-p_credito,-p_debito,true,p_sald_ini,corr,natu,nulo)=-1 then return -1
	end if
end if
if not isnull(cue) and trim(cue)<>'' and not isnull(sub) and trim(sub)<>'' then
	cod_largo=may+gru+cue
	if p_signo=1 then
		if f_todo(p_codemp,p_ano,p_mes,cod_largo,cod_largo,nulo,nulo,nulo,nulo,nulo,p_debito,p_credito,true,p_sald_ini,corr,natu,nulo)=-1 then return -1
	else
		if f_todo(p_codemp,p_ano,p_mes,cod_largo,cod_largo,nulo,nulo,nulo,nulo,nulo,-p_credito,-p_debito,true,p_sald_ini,corr,natu,nulo)=-1 then return -1
	end if
end if
if not isnull(gru) and trim(gru)<>'' and not isnull(cue) and trim(cue)<>'' then
	cod_largo=may+gru
	if p_signo=1 then
		if f_todo(p_codemp,p_ano,p_mes,cod_largo,cod_largo,nulo,nulo,nulo,nulo,nulo,p_debito,p_credito,true,p_sald_ini,corr,natu,nulo)=-1 then return -1
	else
		if f_todo(p_codemp,p_ano,p_mes,cod_largo,cod_largo,nulo,nulo,nulo,nulo,nulo,-p_credito,-p_debito,true,p_sald_ini,corr,natu,nulo)=-1 then return -1
	end if
end if
if not isnull(may) and trim(may)<>'' and not isnull(gru) and trim(gru)<>'' then
	cod_largo=may
	if p_signo=1 then
		if f_todo(p_codemp,p_ano,p_mes,cod_largo,cod_largo,nulo,nulo,nulo,nulo,nulo,p_debito,p_credito,true,p_sald_ini,corr,natu,nulo)=-1 then return -1
	else
		if f_todo(p_codemp,p_ano,p_mes,cod_largo,cod_largo,nulo,nulo,nulo,nulo,nulo,-p_credito,-p_debito,true,p_sald_ini,corr,natu,nulo)=-1 then return -1
	end if
end if
return 1
end function

public function integer f_mayoriza (string mayor, string grupo, string cta, string subcta, string n1, string n2, string n3, string n4, string n5, decimal valordeb, decimal valorcred, boolean sald_ini, string p_corriente, string p_natu, integer p_ano, integer p_mes);string t_doc,nit,cod_largo,dverif,coduf,codcc,nulo
long mes_ciclo,ano_ciclo,ciclo_mes,fila_mes
fila_mes=dw_cierres.find("ano="+string(p_ano)+" and mes="+string(p_mes),1,dw_cierres.rowcount())
if docum_contable="SI" then
	fila_mes=1
else
	sald_ini=false
end if
setnull(t_doc)
setnull(nit)
setnull(dverif)
setnull(coduf)
setnull(codcc)
setnull(nulo)
if not isnull(n4) and trim(n4)<>'' and not isnull(n5) and trim(n5)<>'' then
	cod_largo=mayor+grupo+cta+subcta+n1+n2+n3+n4
	if f_todo(i_codemp,p_ano,p_mes,cod_largo,cod_largo,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,true,sald_ini,p_corriente,p_natu,nulo)=-1 then
		return -1
	end if
	for ciclo_mes=fila_mes -1 to 1 step -1
		ano_ciclo=dw_cierres.getitemnumber(ciclo_mes,"ano")
		mes_ciclo=dw_cierres.getitemnumber(ciclo_mes,"mes")
		if f_todo(i_codemp,ano_ciclo,mes_ciclo,cod_largo,cod_largo,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,true,true,p_corriente,p_natu,nulo)=-1 then
			return -1
		end if
	next
end if
if not isnull(n3) and trim(n3)<>'' and not isnull(n4) and trim(n4)<>'' then
	cod_largo=mayor+grupo+cta+subcta+n1+n2+n3
	if f_todo(i_codemp,p_ano,p_mes,cod_largo,cod_largo,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,true,sald_ini,p_corriente,p_natu,nulo)=-1 then
		return -1
	end if
	for ciclo_mes=fila_mes -1 to 1 step -1
		ano_ciclo=dw_cierres.getitemnumber(ciclo_mes,"ano")
		mes_ciclo=dw_cierres.getitemnumber(ciclo_mes,"mes")
		if f_todo(i_codemp,ano_ciclo,mes_ciclo,cod_largo,cod_largo,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,true,true,p_corriente,p_natu,nulo)=-1 then
			return -1
		end if
	next
end if
if not isnull(n2) and trim(n2)<>'' and not isnull(n3) and trim(n3)<>'' then
	cod_largo=mayor+grupo+cta+subcta+n1+n2
	if f_todo(i_codemp,p_ano,p_mes,cod_largo,cod_largo,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,true,sald_ini,p_corriente,p_natu,nulo)=-1 then
		return -1
	end if
	for ciclo_mes=fila_mes -1 to 1 step -1
		ano_ciclo=dw_cierres.getitemnumber(ciclo_mes,"ano")
		mes_ciclo=dw_cierres.getitemnumber(ciclo_mes,"mes")
		if f_todo(i_codemp,ano_ciclo,mes_ciclo,cod_largo,cod_largo,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,true,true,p_corriente,p_natu,nulo)=-1 then
			return -1
		end if
	next
end if
if not isnull(n1) and trim(n1)<>'' and not isnull(n2) and trim(n2)<>'' then
	cod_largo=mayor+grupo+cta+subcta+n1
	if f_todo(i_codemp,p_ano,p_mes,cod_largo,cod_largo,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,true,sald_ini,p_corriente,p_natu,nulo)=-1 then
		return -1
	end if
	for ciclo_mes=fila_mes -1 to 1 step -1
		ano_ciclo=dw_cierres.getitemnumber(ciclo_mes,"ano")
		mes_ciclo=dw_cierres.getitemnumber(ciclo_mes,"mes")
		if f_todo(i_codemp,ano_ciclo,mes_ciclo,cod_largo,cod_largo,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,true,true,p_corriente,p_natu,nulo)=-1 then
			return -1
		end if
	next
end if
if not isnull(subcta) and trim(subcta)<>'' and not isnull(n1) and trim(n1)<>'' then
	cod_largo=mayor+grupo+cta+subcta
	if f_todo(i_codemp,p_ano,p_mes,cod_largo,cod_largo,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,true,sald_ini,p_corriente,p_natu,nulo)=-1 then
		return -1
	end if
	for ciclo_mes=fila_mes -1 to 1 step -1
		ano_ciclo=dw_cierres.getitemnumber(ciclo_mes,"ano")
		mes_ciclo=dw_cierres.getitemnumber(ciclo_mes,"mes")
		if f_todo(i_codemp,ano_ciclo,mes_ciclo,cod_largo,cod_largo,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,true,true,p_corriente,p_natu,nulo)=-1 then
			return -1
		end if
	next
end if
if not isnull(cta) and trim(cta)<>'' and not isnull(subcta) and trim(subcta)<>'' then
	cod_largo=mayor+grupo+cta
	if f_todo(i_codemp,p_ano,p_mes,cod_largo,cod_largo,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,true,sald_ini,p_corriente,p_natu,nulo)=-1 then
		return -1
	end if
	for ciclo_mes=fila_mes -1 to 1 step -1
		ano_ciclo=dw_cierres.getitemnumber(ciclo_mes,"ano")
		mes_ciclo=dw_cierres.getitemnumber(ciclo_mes,"mes")
		if f_todo(i_codemp,ano_ciclo,mes_ciclo,cod_largo,cod_largo,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,true,true,p_corriente,p_natu,nulo)=-1 then
			return -1
		end if
	next
end if
if not isnull(grupo) and trim(grupo)<>'' and not isnull(cta) and trim(cta)<>'' then
	cod_largo=mayor+grupo
	if f_todo(i_codemp,p_ano,p_mes,cod_largo,cod_largo,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,true,sald_ini,p_corriente,p_natu,nulo)=-1 then
		return -1
	end if
	for ciclo_mes=fila_mes -1 to 1 step -1
		ano_ciclo=dw_cierres.getitemnumber(ciclo_mes,"ano")
		mes_ciclo=dw_cierres.getitemnumber(ciclo_mes,"mes")
		if f_todo(i_codemp,ano_ciclo,mes_ciclo,cod_largo,cod_largo,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,true,true,p_corriente,p_natu,nulo)=-1 then
			return -1
		end if
	next
end if
if not isnull(mayor) and trim(mayor)<>'' and not isnull(grupo) and trim(grupo)<>'' then
	cod_largo=mayor
	if f_todo(i_codemp,p_ano,p_mes,cod_largo,cod_largo,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,true,sald_ini,p_corriente,p_natu,nulo)=-1 then
		return -1
	end if
	for ciclo_mes=fila_mes -1 to 1 step -1
		ano_ciclo=dw_cierres.getitemnumber(ciclo_mes,"ano")
		mes_ciclo=dw_cierres.getitemnumber(ciclo_mes,"mes")
		if f_todo(i_codemp,ano_ciclo,mes_ciclo,cod_largo,cod_largo,t_doc,nit,dverif,coduf,codcc,valordeb,valorcred,true,true,p_corriente,p_natu,nulo)=-1 then
			return -1
		end if
	next
end if
return 1
end function

public function integer f_revisa_util_perd (long p_fila_mes, boolean p_sald_ini, decimal p_ing, decimal p_gas, integer p_signo);//si llegan a mover la utilidad o la perdida a mano toca dejar uno de los dos en cero
string cta_util,cta_perd
dec sald_util,sald_perd
int l_ano,l_mes
cta_util=dw_ctas_uti.getitemstring(1,'cuenta_utilidad')
cta_perd=dw_ctas_uti.getitemstring(1,'cuenta_perdida')
l_ano=dw_cierres.getitemnumber(p_fila_mes,"ano")
l_mes=dw_cierres.getitemnumber(p_fila_mes,"mes")
sald_util=f_lee_saldo(l_ano,l_mes,i_codemp,cta_util,'U')
sald_perd=f_lee_saldo(l_ano,l_mes,i_codemp,cta_perd,'P')
if sald_util=-1 or sald_perd=-1 then return -1
if sald_util<>0 and sald_perd<>0 then
	if sald_util>sald_perd then
		//poner a cero la perd(con ingresos=sald_perd) y luego disminuir la utili(con gastos=sald_perd)
		if f_actu_util_perd(p_fila_mes,p_sald_ini,sald_perd,0,p_signo)=-1 then return -1
		if f_actu_util_perd(p_fila_mes,p_sald_ini,-sald_perd,0,p_signo)=-1 then return -1	
	else//poner a cero la uti(con gastos=sald_uti) y luego disminuir la perd(con ingresos=sald_uti)
		if f_actu_util_perd(p_fila_mes,p_sald_ini,0,sald_util,p_signo)=-1 then return -1
		if f_actu_util_perd(p_fila_mes,p_sald_ini,0,-sald_util,p_signo)=-1 then return -1
	end if
end if
return 1
end function

public function integer f_todo (string codemp, integer ano, integer mes, string cod_largo, string cuenta, string t_doc, string nit, string dverif, string coduf, string codcc, decimal valordeb, decimal valorcred, boolean netear, boolean sald_ini, string p_corriente, string p_naturaleza, string p_clug);// revisa si existe el saldo, si no existe lo crea, luego actualiza el movimiento
if not f_existe_saldo(i_codemp,ano,mes,cod_largo) then
	w_principal.setmicrohelp('Creando saldo de '+string(ano)+'-'+string(mes)+' de la cuenta '+cuenta+' ('+cod_largo+')' )
	if f_insert_saldo(i_codemp,ano,mes,cod_largo,cuenta,t_doc,nit,dverif,coduf,codcc,p_clug)=-1 then
		return -1
	end if
end if
w_principal.setmicrohelp('Actualizando saldo de '+string(ano)+'-'+string(mes)+' de la cuenta '+cuenta+' ('+cod_largo+')' )
if f_actu_movi(i_codemp,ano,mes,cod_largo,valordeb,valorcred,netear,sald_ini,p_corriente,p_naturaleza)=-1 then return -1
return 1
end function

public function integer f_insert_saldo (string codemp, integer ano, integer mes, string cod_largo, string cuenta, string t_doc, string nit, string dverif, string coduf, string codcc, string p_clug);// cuando no existe el saldo se debe insertar
INSERT INTO cont_saldos ( COD_EMPRESA, ano, mes, cod_general, Cuenta, tipodoc, nit, Dverificacion, CUFuncional, ccosto, saldodebito, saldocredito, Debito, Credito, cierredebito, cierrecredito,saldocorriente,saldonocorriente,cierrecorriente,cierrenocorriente,clugar )
values (:codemp,:ano,:mes,:cod_largo,:cuenta,:t_doc,:nit,:dverif,:coduf,:codcc,0,0,0,0,0,0,0,0,0,0,:p_clug);
string err
if sqlca.sqlcode=-1 then
	err=sqlca.sqlerrtext
	rollback;
	messagebox("Error insertando nuevo saldo",err)
	return -1
end if
return 1
end function

public function integer lf_reversa_doc ();if (not isnull(dw_docus.getitemstring(dw_docus.getrow(),'tabla'))) and dw_docus.getitemstring(dw_docus.getrow(),'tabla')<>'' then
	string sql
	long l_ano,l_mes
	//docum_contable
	l_ano=dw_historial.getitemnumber(dw_historial.getrow(),2)
	l_mes=dw_historial.getitemnumber(dw_historial.getrow(),3)
	//num_docu_contable
	choose case g_motor
		case 'anywhere','access'
			choose case lower(dw_docus.getitemstring(dw_docus.getrow(),'tabla'))
				case 'tesocuentasmovi'	
					sql="UPDATE tesocuentasmovi INNER JOIN CONT_DOC_CP ON (tesocuentasmovi.item = CONT_DOC_CP.ndocR) AND (tesocuentasmovi.signo = CONT_DOC_CP.llave5) AND (tesocuentasmovi.numcuenta = CONT_DOC_CP.llave4) SET tesocuentasmovi."+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+"))"
				case 'af_deprecia'
					sql="UPDATE CONT_DOC_CP INNER JOIN AF_DEPRECIA ON (CONT_DOC_CP.NDOCR = AF_DEPRECIA.ANYO) AND (CONT_DOC_CP.LLAVE5 = AF_DEPRECIA.MES) AND (CONT_DOC_CP.LLAVE6 = AF_DEPRECIA.ITEM) AND (CONT_DOC_CP.CLUGAR_DOC = AF_DEPRECIA.CLUGAR) AND (CONT_DOC_CP.CDOCR = AF_DEPRECIA.CODDOCU) AND (CONT_DOC_CP.LLAVE4 = AF_DEPRECIA.PLACA) SET " +dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+  "='P' WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.ANO)="+string(l_ano)+") AND ((CONT_DOC_CP.CDOC)='"+docum_contable+"') AND ((CONT_DOC_CP.NDOC)="+string(num_docu_contable)+"));"
				case 'car_cobro_cpo'
					sql="UPDATE CONT_DOC_CP INNER JOIN CAR_COBRO_CPO ON (CONT_DOC_CP.llave5 = CAR_COBRO_CPO.item) AND (CONT_DOC_CP.llave4 = CAR_COBRO_CPO.cartipo) AND (CONT_DOC_CP.ndocR = CAR_COBRO_CPO.num_cobro) AND (CONT_DOC_CP.CDocR = CAR_COBRO_CPO.coddoc) AND (CONT_DOC_CP.CLugar_doc = CAR_COBRO_CPO.clugar) SET CAR_COBRO_CPO."+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+"))"
				case 'nom_cab'
					sql="UPDATE CONT_DOC_CP INNER JOIN NOM_CAB ON CONT_DOC_CP.ndocR = NOM_CAB.NUM_NOMINA SET NOM_CAB."+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+"))"
				case 'ripsradica'
					sql="UPDATE CONT_DOC_CP INNER JOIN ripsradica ON (CONT_DOC_CP.ndocR = ripsradica.num_radicacion) AND (CONT_DOC_CP.CLugar_doc = ripsradica.clugar) SET ripsradica."+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+"))"
				case 'sum_mvto_cab'
					sql="UPDATE CONT_DOC_CP INNER JOIN sum_mvto_cab ON (CONT_DOC_CP.ndocR = sum_mvto_cab.numdoc) AND (CONT_DOC_CP.CDocR = sum_mvto_cab.coddoc) AND (CONT_DOC_CP.CLugar_doc = sum_mvto_cab.clugar) SET sum_mvto_cab."+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+"))"
				case 'tesocajaegreso'
					sql="UPDATE tesocajaegreso INNER JOIN CONT_DOC_CP ON (tesocajaegreso.nrcaja = CONT_DOC_CP.ndocR) AND (tesocajaegreso.CodDoc = CONT_DOC_CP.CDocR) AND (tesocajaegreso.CLugar = CONT_DOC_CP.CLugar_doc) SET tesocajaegreso."+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+"))"
				case 'tesocajaingreso'
					sql="UPDATE CONT_DOC_CP INNER JOIN tesocajaingreso ON (CONT_DOC_CP.ndocR = tesocajaingreso.ningreso) AND (CONT_DOC_CP.CLugar_doc = tesocajaingreso.CLugar) AND (CONT_DOC_CP.CDocR = tesocajaingreso.CodDoc) SET tesocajaingreso."+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+"))"
				case 'tesorelfact'
					sql="UPDATE CONT_DOC_CP INNER JOIN tesorelfact ON (CONT_DOC_CP.ndocR = tesorelfact.nrelacion) AND (CONT_DOC_CP.CDocR = tesorelfact.CodDoc) AND (CONT_DOC_CP.CLugar_doc = tesorelfact.CLugar) SET tesorelfact."+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+"))"
				case 'tesotranscab'
					sql="UPDATE CONT_DOC_CP INNER JOIN tesotranscab ON (CONT_DOC_CP.ndocR = tesotranscab.ntransferencia) AND (CONT_DOC_CP.CDocR = tesotranscab.coddoc) AND (CONT_DOC_CP.CLugar_doc = tesotranscab.clugar) SET tesotranscab."+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+"))"
				case 'tesorecajcab'
					sql="UPDATE CONT_DOC_CP INNER JOIN TESORECAJCAB ON (CONT_DOC_CP.CLUGAR_DOC = TESORECAJCAB.CLUGAR) AND (CONT_DOC_CP.NDOCR = TESORECAJCAB.NRCAJ) SET TESORECAJCAB."+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P'  WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.ANO)="+string(l_ano)+") AND ((CONT_DOC_CP.CDOC)='"+docum_contable+"') AND ((CONT_DOC_CP.NDOC)="+string(num_docu_contable)+"))"
				case 'contra_f_pago'
				case 'tesocajareposicion'
					sql="UPDATE CONT_DOC_CP INNER JOIN TESOCAJAREPOSICION ON (CONT_DOC_CP.CDOCR = TESOCAJAREPOSICION.CODDOC) AND (CONT_DOC_CP.NDOCR = TESOCAJAREPOSICION.NREPOSICION) AND (CONT_DOC_CP.CLUGAR_DOC = TESOCAJAREPOSICION.CLUGAR) SET TESOCAJAREPOSICION."+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"'AND ((CONT_DOC_CP.ANO)="+string(l_ano)+") AND ((CONT_DOC_CP.CDOC)='"+docum_contable+"') AND ((CONT_DOC_CP.NDOC)="+string(num_docu_contable)+")))"
				case 'contra_f_pago'	
					sql="UPDATE CONT_DOC_CP INNER JOIN contra_f_pago ON (CONT_DOC_CP.llave4= contra_f_pago.ano) AND (CONT_DOC_CP.NDOCR = contra_f_pago.otrosi) AND (CONT_DOC_CP.CLUGAR_DOC = contra_f_pago.CLUGAR)  AND (CONT_DOC_CP.llave5 = contra_f_pago.item) SET "+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"'AND ((CONT_DOC_CP.ANO)="+string(l_ano)+") AND ((CONT_DOC_CP.CDOC)='"+docum_contable+"') AND ((CONT_DOC_CP.NDOC)="+string(num_docu_contable)+")))"	
				case 'car_cobro_cab'
					sql="UPDATE car_cobro_cab  SET "+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' FROM CONT_DOC_CP  WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+")) AND (CONT_DOC_CP.ndocR =car_cobro_cab.num_cobro) AND (CONT_DOC_CP.CDocR = car_cobro_cab.coddoc) AND (CONT_DOC_CP.CLugar_doc =car_cobro_cab.clugar) "					
				case else
					if messagebox('Atención','La anulación del documento que viene de la tabla '+lower(dw_docus.getitemstring(dw_docus.getrow(),'tabla'))+' no se encuentra programado, desea continuar aún así?. (No se reversara el estado contabilizado en la tabla)',question!,yesno!,2)=2 then return -1
			end choose
		case 'postgres'
			choose case lower(dw_docus.getitemstring(dw_docus.getrow(),'tabla'))
				case 'tesocuentasmovi'	
					sql="UPDATE tesocuentasmovi SET "+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' FROM CONT_DOC_CP  WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+")) AND (tesocuentasmovi.item = CONT_DOC_CP.ndocR) AND (tesocuentasmovi.signo = CONT_DOC_CP.llave5) AND (tesocuentasmovi.numcuenta = CONT_DOC_CP.llave4)  "
				case 'af_deprecia'
					sql="UPDATE af_deprecia SET  "+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P'  FROM CONT_DOC_CP INNER JOIN AF_DEPRECIA ON (CONT_DOC_CP.LLAVE4 = AF_DEPRECIA.PLACA) AND (CONT_DOC_CP.CDOCR = AF_DEPRECIA.CODDOCU) AND (CONT_DOC_CP.CLUGAR_DOC = AF_DEPRECIA.CLUGAR) SET " +dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+  "='P' WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.ANO)="+string(l_ano)+") AND ((CONT_DOC_CP.CDOC)='"+docum_contable+") AND ((CONT_DOC_CP.NDOC)="+string(num_docu_contable)+") AND ((AF_DEPRECIA.calculado)=CONT_DOC_CP.LLAVE5));"
				case 'car_cobro_cpo'
					sql="UPDATE car_cobro_cpo SET "+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' FROM CONT_DOC_CP WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+")) AND (CONT_DOC_CP.llave5 = CAR_COBRO_CPO.item) AND (CONT_DOC_CP.llave4 = CAR_COBRO_CPO.cartipo) AND (CONT_DOC_CP.ndocR = CAR_COBRO_CPO.num_cobro) AND (CONT_DOC_CP.CDocR = CAR_COBRO_CPO.coddoc) AND (CONT_DOC_CP.CLugar_doc = CAR_COBRO_CPO.clugar)  "
				case 'nom_cab'
					sql="UPDATE NOM_CAB SET "+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' FROM CONT_DOC_CP  WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+")) AND (CONT_DOC_CP.ndocR = NOM_CAB.NUM_NOMINA)"
				case 'ripsradica'
					sql="UPDATE ripsradica SET "+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' FROM CONT_DOC_CP  WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+")) AND (CONT_DOC_CP.ndocR = ripsradica.num_radicacion) AND (CONT_DOC_CP.CLugar_doc = ripsradica.clugar)  "
				case 'sum_mvto_cab'
					sql="UPDATE sum_mvto_cab SET "+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' FROM CONT_DOC_CP WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+")) AND (CONT_DOC_CP.ndocR = sum_mvto_cab.numdoc) AND (CONT_DOC_CP.CDocR = sum_mvto_cab.coddoc) AND (CONT_DOC_CP.CLugar_doc = sum_mvto_cab.clugar)  "
				case 'tesocajaegreso'
					sql="UPDATE tesocajaegreso SET "+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' FROM CONT_DOC_CP  WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+")) AND (tesocajaegreso.nrcaja = CONT_DOC_CP.ndocR) AND (tesocajaegreso.CodDoc = CONT_DOC_CP.CDocR) AND (tesocajaegreso.CLugar = CONT_DOC_CP.CLugar_doc) "
				case 'tesocajaingreso'
					sql="UPDATE tesocajaingreso SET "+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' FROM CONT_DOC_CP WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+")) AND (CONT_DOC_CP.ndocR = tesocajaingreso.ningreso) AND (CONT_DOC_CP.CLugar_doc = tesocajaingreso.CLugar) AND (CONT_DOC_CP.CDocR = tesocajaingreso.CodDoc)  "
				case 'tesorelfact'
					sql="UPDATE tesorelfact SET "+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' FROM CONT_DOC_CP  WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+")) AND (CONT_DOC_CP.ndocR = tesorelfact.nrelacion) AND (CONT_DOC_CP.CDocR = tesorelfact.CodDoc) AND (CONT_DOC_CP.CLugar_doc = tesorelfact.CLugar) "
				case 'tesotranscab'
					sql="UPDATE tesotranscab SET "+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' FROM CONT_DOC_CP WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+")) AND (CONT_DOC_CP.ndocR = tesotranscab.ntransferencia) AND (CONT_DOC_CP.CDocR = tesotranscab.coddoc) AND (CONT_DOC_CP.CLugar_doc = tesotranscab.clugar)  "
				case 'tesorecajcab'
					sql="UPDATE tesorecajca SET "+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' FROM CONT_DOC_CP WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.ANO)="+string(l_ano)+") AND ((CONT_DOC_CP.CDOC)="+docum_contable+") AND ((CONT_DOC_CP.NDOC)="+string(num_docu_contable)+")) AND (CONT_DOC_CP.CLUGAR_DOC = TESORECAJCAB.CLUGAR) AND (CONT_DOC_CP.NDOCR = TESORECAJCAB.NRCAJ) "		
				case 'tesocajareposicion'
					sql="UPDATE CONT_DOC_CP SET "+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' FROM CONT_DOC_CP INNER JOIN TESOCAJAREPOSICION ON (CONT_DOC_CP.CDOCR = TESOCAJAREPOSICION.CODDOC) AND (CONT_DOC_CP.NDOCR = TESOCAJAREPOSICION.NREPOSICION) AND (CONT_DOC_CP.CLUGAR_DOC = TESOCAJAREPOSICION.CLUGAR)  WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"'AND ((CONT_DOC_CP.ANO)="+string(l_ano)+") AND ((CONT_DOC_CP.CDOC)='"+docum_contable+"') AND ((CONT_DOC_CP.NDOC)="+string(num_docu_contable)+")))"
				case 'contra_f_pago'
					sql="UPDATE contra_f_pago SET "+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' FROM CONT_DOC_CP  WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"'AND ((CONT_DOC_CP.ANO)="+string(l_ano)+") AND ((CONT_DOC_CP.CDOC)='"+docum_contable+"') AND ((CONT_DOC_CP.NDOC)="+string(num_docu_contable)+"))) AND (cast(CONT_DOC_CP.llave4 as  double precision)= contra_f_pago.ano) AND (CONT_DOC_CP.NDOCR = contra_f_pago.otrosi) AND (CONT_DOC_CP.CLUGAR_DOC = contra_f_pago.CLUGAR)  AND (CONT_DOC_CP.llave5 = contra_f_pago.item) "
				case 'car_cobro_cab'
					sql="UPDATE car_cobro_cab  SET "+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' FROM CONT_DOC_CP  WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+")) AND (CONT_DOC_CP.ndocR =car_cobro_cab.num_cobro) AND (CONT_DOC_CP.CDocR = car_cobro_cab.coddoc) AND (CONT_DOC_CP.CLugar_doc =car_cobro_cab.clugar) "			
				case else
					if messagebox('Atención','La anulación del documento que viene de la tabla '+lower(dw_docus.getitemstring(dw_docus.getrow(),'tabla'))+' no se encuentra programado, desea continuar aún así?. (No se reversara el estado contabilizado en la tabla)',question!,yesno!,2)=2 then return -1
			end choose
		case else
			choose case lower(dw_docus.getitemstring(dw_docus.getrow(),'tabla'))
				case 'tesocuentasmovi'	
					sql="UPDATE tesocuentasmovi SET tesocuentasmovi."+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' INNER JOIN CONT_DOC_CP ON (tesocuentasmovi.item = CONT_DOC_CP.ndocR) AND (tesocuentasmovi.signo = CONT_DOC_CP.llave5) AND (tesocuentasmovi.numcuenta = CONT_DOC_CP.llave4)  WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+"))"	
				case 'af_deprecia'
					sql="UPDATE AF_deprecia SET AF_deprecia."+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' from CONT_DOC_CP INNER JOIN AF_DEPRECIA ON (CONT_DOC_CP.NDOCR = AF_DEPRECIA.ANYO) AND (CONT_DOC_CP.LLAVE5 = AF_DEPRECIA.MES) AND (CONT_DOC_CP.LLAVE6 = AF_DEPRECIA.ITEM) AND (CONT_DOC_CP.CLUGAR_DOC = AF_DEPRECIA.CLUGAR) AND (CONT_DOC_CP.CDOCR = AF_DEPRECIA.CODDOCU) AND (CONT_DOC_CP.LLAVE4 = AF_DEPRECIA.PLACA) 	WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+"))"
				case 'car_cobro_cpo'
					sql="UPDATE CAR_COBRO_CPO SET CAR_COBRO_CPO."+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' from CONT_DOC_CP INNER JOIN CAR_COBRO_CPO ON (CONT_DOC_CP.llave5 = CAR_COBRO_CPO.item) AND (CONT_DOC_CP.llave4 = CAR_COBRO_CPO.cartipo) AND (CONT_DOC_CP.ndocR = CAR_COBRO_CPO.num_cobro) AND (CONT_DOC_CP.CDocR = CAR_COBRO_CPO.coddoc) AND (CONT_DOC_CP.CLugar_doc = CAR_COBRO_CPO.clugar) WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+"))"
				case 'nom_cab'
					sql="UPDATE NOM_CAB SET NOM_CAB."+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' from CONT_DOC_CP INNER JOIN NOM_CAB ON CONT_DOC_CP.ndocR = NOM_CAB.NUM_NOMINA WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+"))"
				case 'ripsradica'
					sql="UPDATE CONT_DOC_CP INNER JOIN ripsradica ON (CONT_DOC_CP.ndocR = ripsradica.num_radicacion) AND (CONT_DOC_CP.CLugar_doc = ripsradica.clugar) SET ripsradica."+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+"))"
				case 'sum_mvto_cab'
					sql="UPDATE sum_mvto_cab SET sum_mvto_cab."+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' from CONT_DOC_CP INNER JOIN sum_mvto_cab ON (CONT_DOC_CP.ndocR = sum_mvto_cab.numdoc) AND (CONT_DOC_CP.CDocR = sum_mvto_cab.coddoc) AND (CONT_DOC_CP.CLugar_doc = sum_mvto_cab.clugar) WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+"))"
				case 'tesocajaegreso'
					sql="UPDATE tesocajaegreso SET tesocajaegreso."+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P'  from tesocajaegreso INNER JOIN CONT_DOC_CP ON (tesocajaegreso.nrcaja = CONT_DOC_CP.ndocR) AND (tesocajaegreso.CodDoc = CONT_DOC_CP.CDocR) AND (tesocajaegreso.CLugar = CONT_DOC_CP.CLugar_doc) WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+"))"
				case 'tesocajaingreso'
					sql="UPDATE tesocajaingreso SET tesocajaingreso."+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' from CONT_DOC_CP INNER JOIN tesocajaingreso ON (CONT_DOC_CP.ndocR = tesocajaingreso.ningreso) AND (CONT_DOC_CP.CLugar_doc = tesocajaingreso.CLugar) AND (CONT_DOC_CP.CDocR = tesocajaingreso.CodDoc) WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+"))"
				case 'tesorelfact'
					sql="UPDATE tesorelfact SET tesorelfact."+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' from CONT_DOC_CP INNER JOIN tesorelfact ON (CONT_DOC_CP.ndocR = tesorelfact.nrelacion) AND (CONT_DOC_CP.CDocR = tesorelfact.CodDoc) AND (CONT_DOC_CP.CLugar_doc = tesorelfact.CLugar) WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+"))"
				case 'tesotranscab'
					sql="UPDATE tesotranscab SET tesotranscab."+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' from CONT_DOC_CP INNER JOIN tesotranscab ON (CONT_DOC_CP.ndocR = tesotranscab.ntransferencia) AND (CONT_DOC_CP.CDocR = tesotranscab.coddoc) AND (CONT_DOC_CP.CLugar_doc = tesotranscab.clugar) WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+"))"
				case 'tesorecajcab'
					sql="UPDATE tesorecajca SET "+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' FROM CONT_DOC_CP WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.ANO)="+string(l_ano)+") AND ((CONT_DOC_CP.CDOC)="+docum_contable+") AND ((CONT_DOC_CP.NDOC)="+string(num_docu_contable)+")) AND (CONT_DOC_CP.CLUGAR_DOC = TESORECAJCAB.CLUGAR) AND (CONT_DOC_CP.NDOCR = TESORECAJCAB.NRCAJ) "
				case 'contra_f_pago'	
					sql="UPDATE CONT_DOC_CP INNER JOIN contra_f_pago ON (CONT_DOC_CP.llave4= contra_f_pago.ano) AND (CONT_DOC_CP.NDOCR = contra_f_pago.otrosi) AND (CONT_DOC_CP.CLUGAR_DOC = contra_f_pago.CLUGAR)  AND (CONT_DOC_CP.llave5 = contra_f_pago.item) SET "+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"'AND ((CONT_DOC_CP.ANO)="+string(l_ano)+") AND ((CONT_DOC_CP.CDOC)='"+docum_contable+"') AND ((CONT_DOC_CP.NDOC)="+string(num_docu_contable)+")))"						
				case 'car_cobro_cab'
					sql="UPDATE car_cobro_cab  SET "+dw_docus.getitemstring(dw_docus.getrow(),'nombre_campo')+" = 'P' FROM CONT_DOC_CP  WHERE (((CONT_DOC_CP.COD_EMPRESA)='"+i_codemp+"') AND ((CONT_DOC_CP.Ano)="+string(l_ano)+") AND ((CONT_DOC_CP.CDoc)='"+docum_contable+"') AND ((CONT_DOC_CP.ndoc)="+string(num_docu_contable)+")) AND (CONT_DOC_CP.ndocR =car_cobro_cab.num_cobro) AND (CONT_DOC_CP.CDocR = car_cobro_cab.coddoc) AND (CONT_DOC_CP.CLugar_doc =car_cobro_cab.clugar) "							
				case else
					if messagebox('Atención','La anulación del documento que viene de la tabla '+lower(dw_docus.getitemstring(dw_docus.getrow(),'tabla'))+' no se encuentra programado, desea continuar aún así?. (No se reversara el estado contabilizado en la tabla)',question!,yesno!,2)=2 then return -1
			end choose
	end choose
	EXECUTE IMMEDIATE :sql;
	if sqlca.sqlcode=-1 then
		string err
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error actualizando tabla origen',err)
		return -1
	end if
else
	return 1
end if
return 1
end function

on w_comp_cont.create
int iCurrent
call super::create
this.dw_emp=create dw_emp
this.dw_doc=create dw_doc
this.dw_historial=create dw_historial
this.dw_resumen=create dw_resumen
this.st_regi=create st_regi
this.st_cuenta=create st_cuenta
this.st_tercero=create st_tercero
this.st_doc_ref=create st_doc_ref
this.dw_detalle=create dw_detalle
this.st_1=create st_1
this.dw_digita=create dw_digita
this.pb_new=create pb_new
this.pb_new_otro=create pb_new_otro
this.pb_del=create pb_del
this.dw_doc_cab=create dw_doc_cab
this.pb_del_asiento=create pb_del_asiento
this.pb_export=create pb_export
this.pb_import=create pb_import
this.pb_saldos=create pb_saldos
this.hpb_1=create hpb_1
this.dw_cierres=create dw_cierres
this.pb_abre=create pb_abre
this.pb_del_all=create pb_del_all
this.dw_ctas_uti=create dw_ctas_uti
this.cbx_rep=create cbx_rep
this.pb_new_plant=create pb_new_plant
this.pb_cierre_anyo=create pb_cierre_anyo
this.pb_1=create pb_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_emp
this.Control[iCurrent+2]=this.dw_doc
this.Control[iCurrent+3]=this.dw_historial
this.Control[iCurrent+4]=this.dw_resumen
this.Control[iCurrent+5]=this.st_regi
this.Control[iCurrent+6]=this.st_cuenta
this.Control[iCurrent+7]=this.st_tercero
this.Control[iCurrent+8]=this.st_doc_ref
this.Control[iCurrent+9]=this.dw_detalle
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.dw_digita
this.Control[iCurrent+12]=this.pb_new
this.Control[iCurrent+13]=this.pb_new_otro
this.Control[iCurrent+14]=this.pb_del
this.Control[iCurrent+15]=this.dw_doc_cab
this.Control[iCurrent+16]=this.pb_del_asiento
this.Control[iCurrent+17]=this.pb_export
this.Control[iCurrent+18]=this.pb_import
this.Control[iCurrent+19]=this.pb_saldos
this.Control[iCurrent+20]=this.hpb_1
this.Control[iCurrent+21]=this.dw_cierres
this.Control[iCurrent+22]=this.pb_abre
this.Control[iCurrent+23]=this.pb_del_all
this.Control[iCurrent+24]=this.dw_ctas_uti
this.Control[iCurrent+25]=this.cbx_rep
this.Control[iCurrent+26]=this.pb_new_plant
this.Control[iCurrent+27]=this.pb_cierre_anyo
this.Control[iCurrent+28]=this.pb_1
this.Control[iCurrent+29]=this.gb_1
this.Control[iCurrent+30]=this.gb_2
this.Control[iCurrent+31]=this.gb_3
end on

on w_comp_cont.destroy
call super::destroy
destroy(this.dw_emp)
destroy(this.dw_doc)
destroy(this.dw_historial)
destroy(this.dw_resumen)
destroy(this.st_regi)
destroy(this.st_cuenta)
destroy(this.st_tercero)
destroy(this.st_doc_ref)
destroy(this.dw_detalle)
destroy(this.st_1)
destroy(this.dw_digita)
destroy(this.pb_new)
destroy(this.pb_new_otro)
destroy(this.pb_del)
destroy(this.dw_doc_cab)
destroy(this.pb_del_asiento)
destroy(this.pb_export)
destroy(this.pb_import)
destroy(this.pb_saldos)
destroy(this.hpb_1)
destroy(this.dw_cierres)
destroy(this.pb_abre)
destroy(this.pb_del_all)
destroy(this.dw_ctas_uti)
destroy(this.cbx_rep)
destroy(this.pb_new_plant)
destroy(this.pb_cierre_anyo)
destroy(this.pb_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;string ojo
//RegistryGet ("HKEY_LOCAL_MACHINE\software\GCI\contabilidad", "dec_gral", Regstring!, ojo)
//i_dec_gral=long(ojo)
SELECT ENTERO into :i_dec_gral
FROM parametros_gen
WHERE (((codigo_para)=32));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 32')
	return 
end if

//RegistryGet ("HKEY_LOCAL_MACHINE\software\GCI\contabilidad", "aproxa_gral", Regstring!, ojo)
//i_aprox_gral=long(ojo)
SELECT ENTERO into :i_aprox_gral
FROM parametros_gen
WHERE (((codigo_para)=18));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 18')
	return 
end if

i_aprox_rte=i_aprox_gral
if i_aprox_gral=0 then i_aprox_gral=1
//RegistryGet ("HKEY_LOCAL_MACHINE\software\GCI\contabilidad", "dec_rte", Regstring!, ojo)
//i_dec_rte=long(ojo)
SELECT ENTERO into :i_aprox_rte
FROM parametros_gen
WHERE (((codigo_para)=24));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 24')
	return 
end if
//RegistryGet ("HKEY_LOCAL_MACHINE\software\GCI\contabilidad", "aproxa_rte", Regstring!, ojo)
//i_aprox_rte=long(ojo)
if i_aprox_rte=0 then i_aprox_rte=1

SELECT CADENA into :deb_cre
FROM parametros_gen
WHERE (((codigo_para)=46));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 46')
	return 
end if
end event

event resize;call super::resize;gb_3.resize(newwidth -20, newheight -400)
dw_detalle.resize(newwidth -50, newheight -800)
end event

type pb_grabar from w_center`pb_grabar within w_comp_cont
integer x = 69
integer y = 216
integer taborder = 40
string facename = "Tahoma"
end type

event pb_grabar::clicked;call super::clicked;if cambio then 
	long fila
	string cual
	cual=dw_detalle.getcolumnname()
	fila=dw_detalle.getrow()
	if grabar(false)=1 then 
		pb_new_otro.enabled=true
		pb_new_plant.enabled=true
		commit;
	else
		rollback;
	end if
	if dw_detalle.rowcount()=0 then return
	dw_detalle.scrolltorow(fila)
	dw_detalle.setcolumn(cual)
end if
end event

type dw_emp from datawindow within w_comp_cont
integer x = 37
integer y = 20
integer width = 1152
integer height = 148
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_cont_empresa"
boolean border = false
boolean livescroll = true
end type

event itemchanged;call super::itemchanged;
string actual
actual=getitemstring(1,1)
if dw_detalle.accepttext()=-1 then return 1
choose case f_pregunta()
	case 1
		if grabar(false)=-1 then 
			setitem(1,1,actual)
			return 1
		end if
	case 2
		pb_new_otro.enabled=true
		pb_new_plant.enabled=true
		cambio=false
	case 3
		setitem(1,1,actual)
		return 1
end choose
dw_doc.setitem(1,1,'')
docum_contable=''
accepttext()
i_codemp=getitemstring(1,1)
dw_docus.retrieve(i_codemp)
dw_cierres.retrieve(i_codemp)
idw_emp_docext.retrieve(i_codemp)
dw_ctas_uti.retrieve(i_codemp)
end event

event constructor;settransobject(SQLCA)
insertrow(1)
long cuantos
string emp
select count(*),min(cod_empresa) into :cuantos,:emp from
cont_empresa;
if cuantos=1 then 
	setitem(1,1,emp)
	post event itemchanged(1,object.cod_empresa,emp)
	dw_doc.setfocus()
end if
end event

type dw_doc from datawindow within w_comp_cont
integer x = 1239
integer y = 24
integer width = 1385
integer height = 148
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_cont_docu"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string actual
actual=getitemstring(1,1)
f_quitafiltro(dw_detalle,string(rgb(255,255,255)))
if dw_detalle.accepttext()=-1 then return 1
choose case f_pregunta()
	case 1
		if grabar(false)=-1 then 
			setitem(1,1,actual)
			return 1
		end if
	case 2
		cambio=false
		pb_new_otro.enabled=true
		pb_new_plant.enabled=true
	case 3
		setitem(1,1,actual)
		return 1
end choose
accepttext()
docum_contable=getitemstring(1,1)
DW_HISTORIAL.object.b_1.tag='1'
dw_historial.reset()
dw_resumen.reset()
dw_detalle.reset()
dw_doc_cab.reset()
dw_historial.retrieve(i_codemp,docum_contable)
end event

event constructor;getchild("coddoc",dw_docus)
dw_docus.settransobject(sqlca)
insertrow(1)
end event

type dw_historial from datawindow within w_comp_cont
integer x = 2629
integer y = 76
integer width = 1856
integer height = 368
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_comprobante_cab"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_detalle.reset()
dw_resumen.reset()
dw_doc_cab.reset()
long donde
donde=getrow()
if donde<1 then return
int l_ano,l_mes
docum_contable=getitemstring(donde,4)
l_ano=getitemnumber(donde,2)
l_mes=getitemnumber(donde,3)
num_docu_contable=getitemnumber(donde,5)
f_quitafiltro(dw_detalle,string(rgb(255,255,255)))
dw_detalle.retrieve(i_codemp,l_ano,l_mes,docum_contable,num_docu_contable,getitemstring(donde,'ESTADO'),i_dec_gral,i_dec_rte)
dw_resumen.retrieve(i_codemp,l_ano,l_mes,docum_contable,num_docu_contable,i_dec_gral)
dw_doc_cab.retrieve(i_codemp,l_ano,docum_contable,num_docu_contable)
end event

event rowfocuschanging;if dw_detalle.accepttext()=-1 then return 1
choose case f_pregunta()
	case 1
		if grabar(false)=-1 then return 1
	case 2
		cambio=false
		pb_new_otro.enabled=true
		pb_new_plant.enabled=true
	case 3
		return 1
end choose
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event clicked;if dwo.type <> "text" then return
string cual
cual=dwo.name
cual=mid(cual,1,len(cual) - 2)
if anterior2=cual then
	if orden2="A" then
		orden2="D"
	else
		orden2="A"
	end if
else
	orden2="A"
end if
setsort(cual+" "+orden2)
sort()
triggerevent(rowfocuschanged!)
anterior2=cual
end event

event buttonclicked;long j
int sel=1
if dwo.tag='0' then 
	sel=0
	dwo.tag='1'
else
	dwo.tag='0'
end if
for j=1 to rowcount()
	setitem(j,'esco',sel)
next
end event

event constructor;settransobject(SQLCA)
end event

type dw_resumen from datawindow within w_comp_cont
integer x = 1266
integer y = 216
integer width = 1303
integer height = 160
boolean bringtotop = true
string title = "none"
string dataobject = "dw_comprobante_cpo_suma"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(SQLCA)
end event

type st_regi from statictext within w_comp_cont
integer x = 50
integer y = 668
integer width = 256
integer height = 68
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_cuenta from statictext within w_comp_cont
integer x = 329
integer y = 668
integer width = 1545
integer height = 68
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_tercero from statictext within w_comp_cont
integer x = 1893
integer y = 668
integer width = 1289
integer height = 68
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_doc_ref from statictext within w_comp_cont
integer x = 3195
integer y = 668
integer width = 713
integer height = 68
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_detalle from datawindow within w_comp_cont
event keyup pbm_dwnkey
event p_replica ( long p_fila,  string p_nombre )
integer x = 46
integer y = 748
integer width = 4384
integer height = 1052
integer taborder = 90
string dragicon = "AppIcon!"
boolean bringtotop = true
string title = "Comprobante Contable"
string dataobject = "dw_comprobante_cpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event keyup;string nulo
setnull(nulo)
choose case getcolumnname()
	case "coddocext"
		if key=keydelete! then
			setitem(getrow(),"coddocext",nulo)
			setitem(getrow(),"cod_empre_doc_ext",nulo)
			cambio=true
			return
		end if
	case 'tipo_transac'
		if key=keydelete! then
			setitem(getrow(),"tipo_transac",nulo)
			//setitem(getrow(),"descont",nulo)
			cambio=true
			return
		end if
end choose
if getcolumnname()<>"cp_cuenta" then return
f_busca_cuenta(key,i_codemp,this)


end event

event p_replica(long p_fila, string p_nombre);accepttext()
if not cbx_rep.checked then return
long j,valorn
string valors,temp
boolean numero,fecha
if p_nombre='fecha_doc_ext' then
	fecha=true
elseif p_nombre='nsopo_externo' then
	numero=true
	valorn=getitemnumber(p_fila,p_nombre)
else
	valors=getitemstring(p_fila,p_nombre)
end if
for j=1 to rowcount()
	if p_fila=j then continue
	temp=mid(Describe(p_nombre+".protect"),4)
	temp=mid(temp,1,len(temp) -1)
	if Describe('evaluate("'+temp+'",'+string(j)+")")='1' then continue
	if fecha then
		if isnull(getitemdatetime(j,p_nombre)) then 
			setitem(j,p_nombre,getitemdatetime(p_fila,p_nombre))
		end if
	elseif numero then
		if isnull(getitemnumber(j,p_nombre)) then 
			setitem(j,p_nombre,valorn)
		end if
	else
		if isnull(getitemstring(j,p_nombre)) or getitemstring(j,p_nombre)='' then
			if p_nombre='documento' then
				setitem(j,p_nombre,valors)
				setitem(j,"cp_dverificacion",getitemstring(p_fila,'cp_dverificacion'))
				setitem(j,"terceros_nombre1",getitemstring(p_fila,'terceros_nombre1'))
				setitem(j,"terceros_nombre2",getitemstring(p_fila,'terceros_nombre2'))
				setitem(j,"terceros_apellido1",getitemstring(p_fila,'terceros_apellido1'))
				setitem(j,"terceros_apellido2",getitemstring(p_fila,'terceros_apellido2'))
				setitem(j,"terceros_razon_social",getitemstring(p_fila,'terceros_razon_social'))
				setitem(j,"terceros_persona",getitemstring(p_fila,'terceros_persona'))
			elseif p_nombre='descripcion' then
				if getitemstring(j,'cp_cufuncional')=getitemstring(p_fila,'cp_cufuncional') then 
					setitem(j,p_nombre,valors)
					setitem(j,"cp_ccosto",getitemstring(p_fila,'cp_ccosto'))
				end if
			elseif p_nombre='coddocext' then
				setitem(j,'cod_empre_doc_ext',i_codemp)
				setitem(j,p_nombre,valors)
			else
				setitem(j,p_nombre,valors)
			end if
		end if
	end if
next

end event

event rowfocuschanged;long fila
fila=getrow()
if fila<=0 then return
st_cuenta.text=getitemstring(fila,"descrip")
st_tercero.text=getitemstring(fila,"razon_social")
st_regi.text=string(getitemnumber(fila,'cp_secuencia'))
if getitemstring(fila,"cp_cufuncional")<>"" then
	dw_ccosto.setfilter("coduf='"+getitemstring(fila,"cp_cufuncional")+"'")//"),w_atiende_os.tipo_ingres,getitemstring(fila,56))
else
	dw_ccosto.setfilter("coduf='a'")
end if
dw_ccosto.filter()

end event

event itemchanged;if dw_doc_cab.getitemstring(1,"estado")<>'0' then
	return 1
end if
long donde
string natu,nulo
decimal base,base_desde,valor,porcentaje
setnull(natu)
setnull(nulo)
donde=getrow()
choose case getcolumnname()
	case 'cp_valordeb','cp_valorcred'
		accepttext()
		valor=round(getitemdecimal(getrow(),getcolumn()),i_dec_gral)
		if i_dec_gral=0 then
			valor=long(valor/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((valor -long(valor/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
		end if
		setitem(getrow(),getcolumn(),valor)
		settext(string(valor))
		accepttext()
		cambio=true
		return 2 //para que acepte los nuevos valores
	case "base"
		accepttext()
		base=round(getitemdecimal(donde,"base"),i_dec_gral)
		if i_dec_gral=0 then
			base=long(base/i_aprox_gral)*i_aprox_gral +i_aprox_gral*round((base -long(base/i_aprox_gral)*i_aprox_gral)/i_aprox_gral,0)
		end if
		setitem(getrow(),getcolumn(),base)
		settext(string(base))
		base_desde=getitemdecimal(donde,"base_desde")
		natu=getitemstring(donde,"naturaleza")
		porcentaje=getitemdecimal(donde,"porcentaje")
		if base < 0 then
			if base_desde<= - base then
				valor= round(-base * porcentaje/100,i_dec_rte)
				if i_dec_rte=0 then
					valor=long(valor/i_aprox_rte)*i_aprox_rte +i_aprox_rte*round((valor -long(valor/i_aprox_rte)*i_aprox_rte)/i_aprox_rte,0)
				end if
			else
				valor=0
			end if
			if natu='C' then
				setitem(donde,"cp_valordeb",valor)
				setitem(donde,"cp_valorcred",0)
			else
				setitem(donde,"cp_valorcred",valor)
				setitem(donde,"cp_valordeb",0)
			end if
		else
			if base_desde<= base then
				valor= round(base * porcentaje/100,i_dec_rte)
				if i_dec_rte=0 then
					valor=long(valor/i_aprox_rte)*i_aprox_rte +i_aprox_rte*round((valor -long(valor/i_aprox_rte)*i_aprox_rte)/i_aprox_rte,0)
				end if
			else
				valor=0
			end if
			if natu='C' then
				setitem(donde,"cp_valorcred",valor)
				setitem(donde,"cp_valordeb",0)
			else
				setitem(donde,"cp_valordeb",valor)
				setitem(donde,"cp_valorcred",0)
			end if
		end if
		accepttext()
		cambio=true
		return 2
	case "cp_cuenta"
		string tercero,rfuente,otro,ccosto,descrip,corr,coduf,codcc,descc,t_pyg,lugar
		otro=gettext()
		if trim(otro)='' then return 1
		
		SELECT cont_plan.RFUENTE, cont_plan.tercero, cont_plan.naturaleza, cont_plan.ccosto, cont_plan.descrip, cont_plan.corriente, cont_plan.CodUF, cont_plan.CodCC, CentroCostos.Descripcion as descc, cont_tipo_cta.t_pyg,cont_plan.lugar
		into :rfuente,:tercero,:natu,:ccosto,:descrip ,:corr,:coduf,:codcc,:descc,:t_pyg,:lugar
		FROM (cont_plan LEFT outer JOIN CentroCostos ON (cont_plan.CodUF = CentroCostos.CodUF) AND (cont_plan.CodCC = CentroCostos.CodCC)) INNER JOIN cont_tipo_cta ON (cont_plan.COD_EMPRESA = cont_tipo_cta.cod_empresa) AND (cont_plan.mayor = cont_tipo_cta.mayor)
		WHERE (((cont_plan.CodTotal)=:otro) AND ((cont_plan.COD_EMPRESA)=:i_codemp) AND ((cont_plan.movimiento)='1') AND ((cont_plan.estado)='1'));

		if isnull(natu) then
			//setitem(getrow(),getcolumnname(),natu)
			return 1
		else
			datetime desde,hasta
			setnull(desde)
			setnull(hasta)
			setnull(base_desde)
			setnull(porcentaje)
			if not isnull(rfuente) then
				SELECT BASE, PORCENTAJE, INICIA, TERMINA
				into :base_desde,:porcentaje,:desde,:hasta
				FROM CONT_impuesto
				WHERE CONT_impuesto.COD_CONCEP=:rfuente;
				setitem(donde,"cp_valordeb",0)
				setitem(donde,"cp_valorcred",0)
			end if
			setitem(donde,"base",0)
			setitem(donde,"base_desde",base_desde)
			setitem(donde,"porcentaje",porcentaje)
			setitem(donde,"inicia",desde)
			setitem(donde,"termina",hasta)
			setitem(donde,"naturaleza",natu)
			setitem(donde,"rfuente",rfuente)
			if isnull(tercero) then tercero='0'
			setitem(donde,"tercero",tercero)
			IF TERCERO='0' Then
				setitem(donde,"documento",nulo)
				setitem(donde,"tipodoc",nulo)
				setitem(donde,"cp_dverificacion",nulo)
			end if
			if isnull(ccosto) then ccosto='0'
			setitem(donde,"ccosto",ccosto)
			if ccosto='0' then
				setitem(donde,"cp_cufuncional",nulo)
				setitem(donde,"descripcion",nulo)
				setitem(donde,"cp_ccosto",nulo)
			else
				setitem(donde,"cp_cufuncional",coduf)
				setitem(donde,"descripcion",descc)
				setitem(donde,"cp_ccosto",codcc)
			end if
			setitem(donde,"descrip",descrip)
			setitem(donde,"corriente",corr)
			setitem(donde,"t_corriente",corr)
			setitem(donde,"lugar",lugar)
			if lugar='0' then setitem(donde,"clugar",nulo)
			setitem(donde,"t_pyg",t_pyg)
			if isnull(t_pyg) or t_pyg='I' then
				setitem(donde,"deduc_renta",nulo)
			else
				setitem(donde,"deduc_renta",'1')
			end if
			accepttext()
			cambio=true
		end if
	case 'clugar'
		accepttext()
		cambio=true
		post event p_replica(getrow(),getcolumnName())
	case "cp_cufuncional"
		accepttext()
		setitem(donde,"descripcion",'')
		setitem(donde,"cp_ccosto",natu)
		dw_ccosto.setfilter("coduf='"+data+"'")
		dw_ccosto.filter()
		cambio=true
		post event p_replica(getrow(),getcolumnName())
	case "descripcion" //del ccosto
		accepttext()
		setitem(donde,"cp_ccosto",dw_ccosto.getitemstring(dw_ccosto.getrow(),"codcc"))
		cambio=true
		post event p_replica(getrow(),getcolumnName())
	case "tipodoc"
		setitem(donde,"documento",nulo)
		accepttext()
		cambio=true
		post event p_replica(getrow(),getcolumnName())
	case "documento"
		string tdoc,doc,dverif,persona,nom1,nom2,ape1,ape2,rsoc
		tdoc=getitemstring(donde,"tipodoc")
		if isnull(tdoc) then
			setitem(donde,"documento",nulo)
			setcolumn("tipodoc")
			return 1
		end if
		doc=gettext()
		setnull(persona)
		SELECT TERCEROS.Dverificacion, TERCEROS.Persona, TERCEROS.nombre1, TERCEROS.nombre2, TERCEROS.apellido1, TERCEROS.APELLIDO2, TERCEROS.razon_social
		into :dverif,:persona,:nom1,:nom2,:ape1,:ape2,:rsoc
		FROM TERCEROS
		WHERE TERCEROS.TipoDoc=:tdoc AND TERCEROS.documento=:doc;
		if isnull(persona) then
			if messagebox("Atención","Este Tercero no se encuentra, desea crearlo?",question!,yesno!,2)=2 then
				settext(getitemstring(getrow(),getcolumn()))
				return 1
			else
				st_general messObj
				messObj.valor = getitemstring(getrow(),'tipodoc')
				messObj.documento = doc
				messObj.dw_obj = this
				openwithparm(w_cfgterceros, messObj)
				if message.stringparm='' then 
					settext(getitemstring(getrow(),getcolumn()))
					return 1
				end if
				post event p_replica(getrow(),getcolumnName())
			end if
		else
			setitem(donde,"cp_dverificacion",dverif)
			setitem(donde,"terceros_nombre1",nom1)
			setitem(donde,"terceros_nombre2",nom2)
			setitem(donde,"terceros_apellido1",ape1)
			setitem(donde,"terceros_apellido2",ape2)
			setitem(donde,"terceros_razon_social",rsoc)
			setitem(donde,"terceros_persona",persona)
			st_tercero.text=getitemstring(donde,"razon_social")
			post event p_replica(getrow(),getcolumnName())
		end if
		cambio=true
	case 'coddocext'
		setitem(donde,'cod_empre_doc_ext',i_codemp)
		accepttext()
		cambio=true
		post event p_replica(getrow(),getcolumnName())
	case 'fecha_doc_ext','fecha_doc_int'
		cambio=true
		post event p_replica(getrow(),getcolumnName())
	case 'cp_detalle','pre_sopo_externo','nsopo_externo'
		cambio=true
		post event p_replica(getrow(),getcolumnName())
	case 'tipo_transac'
//		if isnull(getitemstring(row,'tipo_transac')) then setitem(row,'descont','0')
		cambio=true
	case else
		accepttext()
		cambio=true
end choose
end event

event itemfocuschanged;f_semovio(this,i_codemp,{'cp_cuenta'})

end event

event clicked;if dwo.type <> "text" then return
string cual
cual=dwo.name
cual=mid(cual,1,len(cual) - 2)
if anterior=cual then
	if orden="A" then
		orden="D"
	else
		orden="A"
	end if
else
	orden="A"
end if
dw_detalle.setsort(cual+" "+orden)
dw_detalle.sort()
dw_detalle.groupcalc()
anterior=cual
end event

event doubleclicked;string columna
columna=dwo.name
if columna="tipodoc" or columna="cp_dverificacion" or columna="documento" then
	g_tercerodesde=10
	openwithparm(w_buscater, this)
	if getitemstring(getrow(),"documento")<>"" then
		setcolumn("documento")
		event itemchanged(row,dwo,getitemstring(getrow(),"documento"))
	end if
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event getfocus;f_semovio(this,i_codemp,{'cp_cuenta'})
end event

event constructor;settransobject(SQLCA)
getchild('coddocext',idw_emp_docext)
idw_emp_docext.settransobject(sqlca)
getchild("descripcion",dw_ccosto)
dw_ccosto.settransobject(sqlca)
dw_ccosto.retrieve('%')
dw_ccosto.setfilter('isnull(codcc)')
dw_ccosto.filter()

end event

event dberror;rollback;
return 0
end event

type st_1 from statictext within w_comp_cont
integer x = 2629
integer y = 20
integer width = 585
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
string text = "&Historial de Asientos:"
boolean focusrectangle = false
end type

type dw_digita from datawindow within w_comp_cont
event keyup pbm_dwnkey
integer x = 50
integer y = 500
integer width = 663
integer height = 160
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "dw_paraediciones"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event keyup;if i_codemp='' or docum_contable='' or dw_doc_cab.rowcount()=0 then return
if dw_doc_cab.getitemstring(1,"estado")<>'0' then
	return
end if
f_busca_cuenta(key,i_codemp,this)

end event

event itemchanged;if i_codemp='' or docum_contable='' or dw_doc_cab.rowcount()=0 then return
if dw_doc_cab.getitemstring(1,"estado")<>'0' then
	messagebox("Atención","No puede modificar este documento")
	return
end if
string tercero,rfuente,natu,otro,ccosto,descrip,corr,coduf,codcc,descc,t_pyg,nulo,lugar
setnull(nulo)
setnull(natu)
otro=gettext()
if trim(otro)='' then return

SELECT cont_plan.RFUENTE, cont_plan.tercero, cont_plan.naturaleza, cont_plan.ccosto, cont_plan.descrip, cont_plan.corriente, cont_plan.CodUF, cont_plan.CodCC, CentroCostos.Descripcion as descc, cont_tipo_cta.t_pyg,cont_plan.lugar
into :rfuente,:tercero,:natu,:ccosto,:descrip ,:corr,:coduf,:codcc,:descc,:t_pyg,:lugar
FROM (cont_plan LEFT outer JOIN CentroCostos ON (cont_plan.CodUF = CentroCostos.CodUF) AND (cont_plan.CodCC = CentroCostos.CodCC)) INNER JOIN cont_tipo_cta ON (cont_plan.COD_EMPRESA = cont_tipo_cta.cod_empresa) AND (cont_plan.mayor = cont_tipo_cta.mayor)
WHERE (((cont_plan.CodTotal)=:otro) AND ((cont_plan.COD_EMPRESA)=:i_codemp) AND ((cont_plan.movimiento)='1') AND ((cont_plan.estado)='1'));
if sqlca.sqlcode=-1 then 
	messagebox("Error leyendo cont_plan",sqlca.sqlerrtext)
	return 1
end if
if isnull(natu) then
	//setitem(getrow(),getcolumnname(),natu)
	return 1
else
	reset()
	insertrow(1)
	long donde
	real base_desde,porcentaje
	datetime desde,hasta
	setnull(desde)
	setnull(hasta)
	setnull(base_desde)
	setnull(porcentaje)
	if not isnull(rfuente) then
		SELECT BASE, PORCENTAJE, INICIA, TERMINA
		into :base_desde,:porcentaje,:desde,:hasta
		FROM cont_impuesto 
		WHERE CONT_impuesto.COD_CONCEP=:rfuente;
	end if
	f_quitafiltro(dw_detalle,string(rgb(255,255,255)))
	donde=dw_detalle.insertrow(0)
	dw_detalle.setitem(donde,"cp_cod_empresa",i_codemp)
	dw_detalle.setitem(donde,"cp_cdoc",docum_contable)
	dw_detalle.setitem(donde,"cp_ano",dw_doc_cab.getitemnumber(1,"ano"))
	dw_detalle.setitem(donde,"cp_mes",dw_doc_cab.getitemnumber(1,"mes"))
	dw_detalle.setitem(donde,"cp_secuencia",donde)
	dw_detalle.setitem(donde,"cp_ndoc",dw_doc_cab.getitemnumber(1,"ndoc"))
	dw_detalle.setitem(donde,"cp_cuenta",otro)
	dw_detalle.setitem(donde,"naturaleza",natu)
	dw_detalle.setitem(donde,"rfuente",rfuente)
	dw_detalle.setitem(donde,"base_desde",base_desde)
	dw_detalle.setitem(donde,"porcentaje",porcentaje)
	dw_detalle.setitem(donde,"inicia",desde)
	dw_detalle.setitem(donde,"termina",hasta)
	dw_detalle.setitem(donde,"tercero",tercero)
	dw_detalle.setitem(donde,"t_pyg",t_pyg)
	dw_detalle.setitem(donde,"lugar",lugar)
	if isnull(t_pyg) or t_pyg='I' then
		dw_detalle.setitem(donde,"deduc_renta",nulo)
	else
		dw_detalle.setitem(donde,"deduc_renta",'1')
	end if
	dw_detalle.setitem(donde,"ccosto",ccosto)
	dw_detalle.setitem(donde,"cp_cufuncional",coduf)
	if not isnull(coduf) then
		dw_ccosto.setfilter("coduf='"+coduf+"'")
		dw_ccosto.filter()
	end if
	dw_detalle.setitem(donde,"cp_ccosto",codcc)
	dw_detalle.setitem(donde,"descripcion",descc)
	dw_detalle.setitem(donde,"descrip",descrip)
	dw_detalle.setitem(donde,"corriente",corr)
	dw_detalle.setitem(donde,"t_corriente",corr)
	dw_detalle.setitem(donde,"estado",'0')
	dw_detalle.setcolumn("cp_valordeb")
	if dw_detalle.rowcount()>1 then //para repetir los valores anteriores
		long j,k
		dw_detalle.setitem(donde,'cp_detalle',dw_detalle.getitemstring(donde -1 ,'cp_detalle'))
		if tercero='1' then
			for k= donde -1 to 1 step -1
				if dw_detalle.getitemstring(k,"tercero")='1' then exit
			next
			if k<>0 then
				for j= 10 to 18 // todos los campos de terceros (nom1 y 2 ape1 y 2, nit , tdoc,docu,dverif,razonsoci)
					dw_detalle.setitem(donde,j,dw_detalle.getitemstring(k ,j))
				next
			end if
		end if
		if ccosto='1' and isnull(dw_detalle.getitemstring(donde,'cp_cufuncional')) then
			for k= donde -1 to 1 step -1
				if dw_detalle.getitemstring(k,"ccosto")='1' then exit
			next
			if k<>0 then
				for j= 29 to 31 // los tres campos de centros de costo
					dw_detalle.setitem(donde,j,dw_detalle.getitemstring(k ,j))
				next
			end if
			dw_detalle.setitem(donde,'clugar',dw_detalle.getitemstring(k ,'clugar'))
		end if
		for j= 21 to 23 //documento interno (el de interface)
			dw_detalle.setitem(donde,j,dw_detalle.getitemstring(donde -1 ,j))
		next
		for j= 39 to 40 //coddocext, prfdocexte
			dw_detalle.setitem(donde,j,dw_detalle.getitemstring(donde -1 ,j))
		next
		dw_detalle.setitem(donde,'fecha_doc_ext',dw_detalle.getitemdatetime(donde -1 ,'fecha_doc_ext'))
		dw_detalle.setitem(donde,'fecha_doc_int',dw_detalle.getitemdatetime(donde -1 ,'fecha_doc_int'))
		dw_detalle.setitem(donde,24,dw_detalle.getitemnumber(donde -1 ,24)) //nro doc de interfaz
		dw_detalle.setitem(donde,41,dw_detalle.getitemnumber(donde -1 ,41)) //nro doc ext
		dw_detalle.setitem(donde,44,dw_detalle.getitemstring(donde -1 ,44))//cod_empre_doc_ext
	end if
	dw_detalle.scrolltorow(donde)
	event getfocus()
	cambio=true
end if
end event

event constructor;insertrow(1)
end event

event getfocus;if isvalid(w_busca_cuenta) then 
	w_busca_cuenta.i_st.dw=this
	w_busca_cuenta.i_semovio=false
	if w_busca_cuenta.i_st.codemp<>i_codemp then
		w_busca_cuenta.i_st.codemp=i_codemp
		w_busca_cuenta.dw_1.retrieve(i_codemp)
	end if
end if

end event

type pb_new from picturebutton within w_comp_cont
event mousemove pbm_mousemove
integer x = 224
integer y = 216
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &n"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Nuevo Asiento Contable [Alt+N]"
end type

event clicked;f_new_docu(true)
end event

type pb_new_otro from picturebutton within w_comp_cont
event mousemove pbm_mousemove
string tag = "Nuevo Asiento desde Interface"
integer x = 379
integer y = 216
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "LLEVAR2.GIF"
string disabledname = "d_LLEVAR2.GIF"
string powertiptext = "Nuevo Asiento desde Interface"
end type

event clicked;if i_codemp='' then return
open(w_interface)
end event

type pb_del from picturebutton within w_comp_cont
event mousemove pbm_mousemove
integer x = 695
integer y = 216
integer width = 146
integer height = 128
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "anular_doc_3.gif"
string disabledname = "d_anular_doc_3.gif"
string powertiptext = "Anular Asiento"
end type

event clicked;if dw_historial.getrow()<1 then return
string estado
estado=dw_historial.getitemstring(dw_historial.getrow(),'estado')
choose case estado
	case '1'
		messagebox("Atención",'El asiento ya se encuentra anulado')
	case '3'
		messagebox("Atención",'El asiento ya se encuentra aprobado, debe Desaprobarlo para poder anularlo')
	case else //0 or null
		if messagebox("Atención",'Está seguro que desea anular el asiento?',question!,yesno!,2)=2 then return
		if dw_historial.getitemstring(dw_historial.getrow(),'cdoc')='CI' then
			int anyos
			anyos=year(date(dw_historial.getitemdatetime(dw_historial.getrow(),'fecha')))
			update cont_cierre set cierre_anyo=null
			where ano=:anyos and mes=12;
			if sqlca.sqlcode=-1 then
				rollback;
				return
			end if
		end if
		
		st_xa_anular st_anula
		st_anula.tipo='CB'
		openwithparm (w_motiv_anula,st_anula)
		st_anula=message.powerobjectparm
		if not isValid(st_anula) then return
		dw_historial.setitem(dw_historial.getrow(),'estado','1')
		dw_historial.setitem(dw_historial.getrow(),'usu_anula',usuario)
		dw_historial.setitem(dw_historial.getrow(),'fecha_anula',datetime(today(),now()))
		dw_historial.setitem(dw_historial.getrow(),'motiv_anula',st_anula.observacion)
		dw_historial.setitem(dw_historial.getrow(),'cod_anula',st_anula.motivo)
		if dw_historial.update()=-1 then
			rollback;
			dw_historial.setitem(dw_historial.getrow(),'estado','0')
		else
			if lf_reversa_doc()=-1 then 
				rollback;
			else
				commit;
			end if
		end if
end choose

end event

type dw_doc_cab from datawindow within w_comp_cont
integer x = 1353
integer y = 484
integer width = 1120
integer height = 176
integer taborder = 130
boolean bringtotop = true
string title = "none"
string dataobject = "dw_doc_cab"
boolean border = false
end type

event dw_doc_cab::constructor;call super::constructor;this.settransobject(sqlca)
end event

event itemchanged;this.accepttext()
long j
if this.getcolumnname()="ano" or this.getcolumnname()="mes" then
	for j=1 to dw_detalle.rowcount()
		dw_detalle.setitem(j,"cp_"+this.getcolumnname(),this.getitemnumber(1,this.getcolumnname()))
	next
	if not isnull(dw_doc_cab.getitemnumber(1,"ndoc")) and dw_detalle.rowcount()>0 and this.getcolumnname()="ano" then
		i_cambio_llave=true
	end if
end if
cambio=true
end event

event dberror;rollback;
return 0
end event

type pb_del_asiento from picturebutton within w_comp_cont
event mousemove pbm_mousemove
integer x = 709
integer y = 504
integer width = 146
integer height = 128
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "           &b"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
string powertiptext = "Borrar registro del Asiento [Alt+B]"
end type

event clicked;f_quitafiltro(dw_detalle,string(rgb(255,255,255)))
if dw_doc_cab.rowcount()=0 then return
if dw_doc_cab.getitemstring(1,"estado")<>'0' then
	messagebox("Atención","No puede modificar este documento")
	return
end if
long fila
fila=dw_detalle.getrow()
if fila< 1 then return
if dw_detalle.getitemstring(fila,'desde_inter')='1' then
	messagebox("Atención","Este asiento viene de una interface, no lo puede borrar")
	return
end if
dw_detalle.setredraw(false)
dw_detalle.deleterow(fila)
dw_detalle.setsort('cp_secuencia A')
dw_detalle.sort()
for fila=1 to dw_detalle.rowcount()
	dw_detalle.setitem(fila,"cp_secuencia",fila)
next
cambio=true
if fila<=dw_detalle.rowcount() then 
	dw_detalle.scrolltorow(fila)
elseif fila -1<= dw_detalle.rowcount() then 
	dw_detalle.scrolltorow(fila -1)
end if
dw_detalle.setredraw(true)
end event

type pb_export from picturebutton within w_comp_cont
event mousemove pbm_mousemove
integer x = 1010
integer y = 504
integer width = 146
integer height = 128
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "export.GIF"
string disabledname = "d_export.GIF"
string powertiptext = "Exportar Comprobante"
end type

event clicked;choose case f_pregunta()
	case 1
		if grabar(false)=-1 then return
	case 2
	case 3
		return
end choose
openwithparm(w_export,dw_detalle)

end event

type pb_import from picturebutton within w_comp_cont
event mousemove pbm_mousemove
integer x = 859
integer y = 504
integer width = 146
integer height = 128
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "import.GIF"
string disabledname = "d_import.GIF"
string powertiptext = "Importar Comprobante desde Archivo Plano"
end type

event clicked;if dw_doc_cab.rowcount()=0 then
	messagebox("Atención","Debe crear un nuevo ducumento para poder importarlo desde un archivo")
	return
end if
if dw_doc_cab.getitemstring(1,"estado")<>'0' then
	messagebox("Atención","El estado de este documento es diferente a No aprobado, por lo tanto no le puede importar datos")
	return
end if
if dw_detalle.rowcount()>0 then
	if messagebox("Atención","Este documento ya tiene asientos, desea importar los nuevos datos al final del mismo?",question!,yesno!,1)=2 then return
end if
string docname, named
long value,cuantos
value = GetFileOpenName("Importar desde:", docname, named,"*.TXT","Texto separado por TAB (*.TXT),*.TXT") 
cuantos=dw_detalle.rowcount()
IF value = 1 THEN
	value=dw_detalle.importfile(docname)
	if value < 0 then messagebox("Error "+string(value),"No se pudieron importar los datos")
end if
if dw_detalle.rowcount()=cuantos then return
long j
string tercero,rfuente,natu,otro,ccosto,descrip
for j=1 to dw_detalle.rowcount()
	otro=dw_detalle.getitemstring(j,"cp_cuenta")
	setnull(natu)
	select rfuente,tercero,naturaleza,ccosto,descrip into :rfuente,:tercero,:natu,:ccosto,:descrip from cont_plan where codtotal=:otro and cod_empresa=:i_codemp and movimiento='1';
	if isnull(natu) then 
		messagebox("Error","La cuenta del asiento nro: "+string(j)+" no existe o no es de movimiento, revisela para poder grabar el documento")
		setnull(descrip)
	end if
	dw_detalle.setitem(j,"cp_cod_empresa",i_codemp)
	dw_detalle.setitem(j,"cp_cdoc",docum_contable)
	dw_detalle.setitem(j,"cp_ano",dw_doc_cab.getitemstring(1,"ano"))
	dw_detalle.setitem(j,"cp_mes",dw_doc_cab.getitemstring(1,"mes"))
	dw_detalle.setitem(j,"cp_secuencia",j)
	dw_detalle.setitem(j,"cp_ndoc",dw_doc_cab.getitemnumber(1,"ndoc"))
	dw_detalle.setitem(j,"naturaleza",natu)
	dw_detalle.setitem(j,"rfuente",rfuente)
	dw_detalle.setitem(j,"tercero",tercero)
	dw_detalle.setitem(j,"ccosto",ccosto)
	dw_detalle.setitem(j,"descrip",descrip)
	dw_detalle.setitem(j,"estado",'0')
next
cambio=true
end event

type pb_saldos from picturebutton within w_comp_cont
event mousemove pbm_mousemove
integer x = 2510
integer y = 500
integer width = 146
integer height = 128
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cerrar.GIF"
string disabledname = "d_cerrar.GIF"
string powertiptext = "Aprobar (Actualizar Saldos con Comprobantes Seleccionados)"
end type

event clicked;if not f_check_menu("m_cont_cierra_asiento","ADM") then
	Messagebox("Atención",'Este usuario no tiene permiso para cerrar los asientos')
	return
end if
setpointer(hourglass!)
long j
for j=1 to dw_historial.rowcount()
	if dw_historial.getitemnumber(j,'esco')=0 or (dw_historial.getitemstring(j,'estado')<>'0') then 
		dw_historial.setitem(j,'esco',0)
		continue
	end if
	dw_historial.scrolltorow(j)
	if dw_detalle.rowcount()=0 then continue
	if f_cierra_docu(1)=-1 then
		rollback;
	else
		commit;
		dw_historial.setitem(j,"estado",'3')
	end if
	dw_historial.setitem(j,'esco',0)
next
hpb_1.position=0
DW_HISTORIAL.object.b_1.tag='1'
dw_historial.reset()
dw_resumen.reset()
dw_detalle.reset()
dw_doc_cab.reset()
dw_historial.retrieve(i_codemp,docum_contable)
w_principal.setmicrohelp('Gestión Cliente Interno')
end event

type hpb_1 from hprogressbar within w_comp_cont
integer x = 1243
integer y = 404
integer width = 1353
integer height = 52
boolean bringtotop = true
unsignedinteger maxposition = 100
integer setstep = 10
end type

type dw_cierres from datawindow within w_comp_cont
boolean visible = false
integer x = 777
integer y = 400
integer width = 357
integer height = 56
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_cierres"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type pb_abre from picturebutton within w_comp_cont
event mousemove pbm_mousemove
integer x = 2656
integer y = 500
integer width = 146
integer height = 128
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "abrir2.GIF"
string disabledname = "d_abrir2.GIF"
string powertiptext = "Abrir Comprobantes Seleccionados"
end type

event clicked;if not f_check_menu("m_cont_abre_asiento","ADM") then
	Messagebox("Atención",'Este usuario no tiene permiso para abrir los asientos')
	return
end if
long j
setpointer(hourglass!)
for j=1 to dw_historial.rowcount()
	if dw_historial.getitemnumber(j,'esco')=0 or dw_historial.getitemstring(j,'estado')='0' or dw_historial.getitemstring(j,'estado')='1' or isnull(dw_historial.getitemstring(j,'estado')) then 
		dw_historial.setitem(j,'esco',0)
		continue
	end if
	dw_historial.scrolltorow(j)
	if dw_detalle.rowcount()=0 then continue
	if f_cierra_docu(-1)=-1 then
		rollback;
	else
		commit;
		dw_historial.setitem(j,"estado",'0')
	end if
	dw_historial.setitem(j,'esco',0)
next
hpb_1.position=0
DW_HISTORIAL.object.b_1.tag='1'
dw_historial.reset()
dw_resumen.reset()
dw_detalle.reset()
dw_doc_cab.reset()
dw_historial.retrieve(i_codemp,docum_contable)
w_principal.setmicrohelp('Gestión Cliente Interno')
end event

type pb_del_all from picturebutton within w_comp_cont
event mousemove pbm_mousemove
integer x = 1161
integer y = 504
integer width = 146
integer height = 128
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "anular_doc_2.gif"
string disabledname = "d_anular_doc_2.gif"
alignment htextalign = left!
vtextalign vtextalign = top!
string powertiptext = "Borrar Todos los Registros del Asiento"
end type

event clicked;f_quitafiltro(dw_detalle,string(rgb(255,255,255)))
if dw_doc_cab.rowcount()=0 then return
if dw_doc_cab.getitemstring(1,"estado")<>'0' then
	messagebox("Atención","No puede modificar este documento")
	return
end if
if dw_detalle.rowcount()=0 then return
boolean ya=false
dw_detalle.setfilter('desde_inter="0"')
dw_detalle.filter()
DO WHILE dw_detalle.rowcount()>0
	dw_detalle.deleterow(0)
LOOP
cambio=true
dw_detalle.setfilter('')
dw_detalle.filter()
end event

type dw_ctas_uti from datawindow within w_comp_cont
boolean visible = false
integer x = 2949
integer y = 480
integer width = 576
integer height = 80
integer taborder = 160
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ctas_uti_perd"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type cbx_rep from checkbox within w_comp_cont
integer x = 3054
integer y = 580
integer width = 736
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
string text = "Replicar cambios en los vacios"
end type

type pb_new_plant from picturebutton within w_comp_cont
event mousemove pbm_mousemove
integer x = 539
integer y = 216
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "LLEVAR.GIF"
string disabledname = "d_LLEVAR.GIF"
string powertiptext = "Nuevo Asiento desde Plantillas"
end type

event clicked;if i_codemp='' or docum_contable='' then return
open(w_asiento_desde_plant)
end event

type pb_cierre_anyo from picturebutton within w_comp_cont
integer x = 850
integer y = 216
integer width = 146
integer height = 128
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cerrar.gif"
string disabledname = "d_cerrar.GIF"
alignment htextalign = left!
string powertiptext = "Cierre de Año"
end type

event clicked;openwithparm(w_cierre_cont,i_codemp)
end event

type pb_1 from pb_report within w_comp_cont
integer x = 1006
integer y = 216
integer taborder = 90
boolean bringtotop = true
string powertiptext = "Imprime Comprobante"
string cod_rep = "CCC"
string nombre_rep = "Comprobante Contable"
string tipo_rep = "interno!"
boolean v_preliminar = true
end type

event clicked;call super::clicked;if dw_detalle.rowcount()=0 then return
any par[2]
par[1]=dw_historial.getitemstring(dw_historial.getrow(),'cdoc')
par[2]=dw_historial.getitemnumber(dw_historial.getrow(),'ndoc')
imprimir(par,'','0')
end event

type gb_1 from groupbox within w_comp_cont
integer x = 41
integer y = 160
integer width = 1157
integer height = 236
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Utilidades:"
end type

type gb_2 from groupbox within w_comp_cont
integer x = 1243
integer y = 160
integer width = 1344
integer height = 236
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Totales del Asiento:"
end type

type gb_3 from groupbox within w_comp_cont
integer x = 27
integer y = 440
integer width = 4462
integer height = 1396
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle del Asiento Contable"
end type

