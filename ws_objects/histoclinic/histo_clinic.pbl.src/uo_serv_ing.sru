$PBExportHeader$uo_serv_ing.sru
forward
global type uo_serv_ing from userobject
end type
type dw_fin_proced from datawindow within uo_serv_ing
end type
type pb_3 from pb_report within uo_serv_ing
end type
type pb_2 from picturebutton within uo_serv_ing
end type
type dw_mvto_cpo from datawindow within uo_serv_ing
end type
type dw_sum_cab from datawindow within uo_serv_ing
end type
type dw_lote from datawindow within uo_serv_ing
end type
type dw_canasta from datawindow within uo_serv_ing
end type
type pb_citas from picturebutton within uo_serv_ing
end type
type pb_guarda_diags from picturebutton within uo_serv_ing
end type
type st_8 from statictext within uo_serv_ing
end type
type st_7 from statictext within uo_serv_ing
end type
type st_6 from statictext within uo_serv_ing
end type
type cb_est_ria from picturebutton within uo_serv_ing
end type
type sle_autoriza from singlelineedit within uo_serv_ing
end type
type st_15 from statictext within uo_serv_ing
end type
type pb_traerec from picturebutton within uo_serv_ing
end type
type pb_trae from picturebutton within uo_serv_ing
end type
type pb_kit from picturebutton within uo_serv_ing
end type
type cb_borra from picturebutton within uo_serv_ing
end type
type cb_4 from picturebutton within uo_serv_ing
end type
type sle_proced from singlelineedit within uo_serv_ing
end type
type st_1 from statictext within uo_serv_ing
end type
type dw_serv_ing from datawindow within uo_serv_ing
end type
type dw_diags from datawindow within uo_serv_ing
end type
type gb_2 from groupbox within uo_serv_ing
end type
end forward

global type uo_serv_ing from userobject
integer width = 5472
integer height = 1468
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event borra_serv ( long p_contador,  string p_clugar_his,  long p_nservicio )
event cambio_tto ( )
event cambia_diags ( string p_cdiag )
event cambian_serv ( readonly long p_filas )
dw_fin_proced dw_fin_proced
pb_3 pb_3
pb_2 pb_2
dw_mvto_cpo dw_mvto_cpo
dw_sum_cab dw_sum_cab
dw_lote dw_lote
dw_canasta dw_canasta
pb_citas pb_citas
pb_guarda_diags pb_guarda_diags
st_8 st_8
st_7 st_7
st_6 st_6
cb_est_ria cb_est_ria
sle_autoriza sle_autoriza
st_15 st_15
pb_traerec pb_traerec
pb_trae pb_trae
pb_kit pb_kit
cb_borra cb_borra
cb_4 cb_4
sle_proced sle_proced
st_1 st_1
dw_serv_ing dw_serv_ing
dw_diags dw_diags
gb_2 gb_2
end type
global uo_serv_ing uo_serv_ing

type variables
string i_indapdx //hace referencia mas bien al indpadx de historial 0:consulta externa 5:odontología
string tipo_ingres
int i_interface//1:facturacion 2:recibos en la ventana de interface con factu y recibo las llama por eso no son privates
picturebutton ipb_newingre //en los constructor hay que asignarlo , por eso no es private es para un nuevo ingreso
datawindow idw_emppac //en la ventana de interface con factu y recibo la llama por eso no es private, es el dw que tiene la empresa y contrato del pac
private uo_datastore idw_cont_det
private long i_contador=-1,i_nservicio,i_difp
private string i_clugar_his,i_profe,i_espe,i_atiende,i_alm,i_cdoc_cons='SC',ls_antece,ls_resgt,ls_origen,is_cext
private boolean i_confirma_ge=true,i_cambio_insumo
private st_fact st_f
DataWindowChild idw_fincon,idw_finproc,idw_causaex,idw_ambproc
end variables

forward prototypes
public subroutine cambia_emppac (datawindow dw)
public function integer reset ()
public subroutine cambia_prof_espe (string p_prof, string p_espe, string p_atiende)
public function string profe ()
public function long contador ()
public subroutine reset_dw_costos (long fila)
public function integer f_pregunta ()
public function integer f_busca_emp_cont (string as_cemp, string as_ccont)
public function long retrieve (long contador, string clugar_his, long ld_dif, string p_origen)
public subroutine f_restringue (string p_resgt, string p_origen, long p_conta, string p_lug)
public function long f_insert_servicio (string p_cups, string p_emp, string p_cont, string p_plan, long p_nfact, string p_clug_fac, long p_nitem_fac, long p_nrec, string p_clug_rec, long p_item_rec, long p_nitem_rec, string p_cproceq, string p_cmaneq, string p_coduf, string p_codcc, string p_tipo_fac, string p_autoriza, string p_pasa, string p_alm, string p_final, string p_amb)
end prototypes

event cambio_tto();//cuando atiende citas de un tto se dispara este evento

end event

event cambia_diags(string p_cdiag);//este se dispara al cambiar un diag
end event

event cambian_serv(readonly long p_filas);if dw_serv_ing.rowcount()=0 then
	sle_proced.enabled=true
	cb_4.enabled=true
	pb_kit.enabled=true
else
	sle_proced.enabled=false
	cb_4.enabled=false
	pb_kit.enabled=false
end if

end event

public subroutine cambia_emppac (datawindow dw);idw_emppac=dw
i_confirma_ge=true
end subroutine

public function integer reset ();dw_serv_ing.reset()
sle_proced.text=''
sle_autoriza.text=''
dw_diags.reset()
i_contador=-1
return 1
end function

public subroutine cambia_prof_espe (string p_prof, string p_espe, string p_atiende);i_profe=p_prof
i_espe=p_espe
i_atiende=p_atiende
setnull(i_alm)
end subroutine

public function string profe ();return i_profe
end function

public function long contador ();return i_contador
end function

public subroutine reset_dw_costos (long fila);dw_serv_ing.deleterow(fila)
dw_serv_ing.resetupdate()
dw_sum_cab.reset()
dw_canasta.reset()
dw_lote.reset()
dw_mvto_cpo.reset()
end subroutine

public function integer f_pregunta ();if not i_cambio_insumo then return 0 // continua
dw_canasta.setfilter('')
dw_canasta.filter()
if dw_canasta.rowcount()=0 then 
	i_cambio_insumo=false
	return 0
end if
choose case messagebox("Atención",'No ha guardado los insumos utilizados en el ingreso.Desea Guardarlos ahora?',question!,okcancel!,1)
	case 1
		if f_guarda_insumos(dw_sum_cab,dw_canasta,dw_mvto_cpo,dw_lote,i_cdoc_cons,i_clugar_his,i_alm,i_contador)=-1 then
			rollback;
			return 1
		else
			commit;
			dw_sum_cab.resetupdate()
			dw_canasta.resetupdate()
			dw_mvto_cpo.resetupdate()
			dw_lote.resetupdate()
			i_cambio_insumo=false
			return 0
		end if 
	case 2
		return 1
end choose
end function

public function integer f_busca_emp_cont (string as_cemp, string as_ccont);long ll_fila
ll_fila=idw_emppac.find('codemp="'+as_cemp+'" and codcontrato="'+as_ccont+'"',1,idw_emppac.rowcount())
return ll_fila
end function

public function long retrieve (long contador, string clugar_his, long ld_dif, string p_origen);SELECT cadena into :ls_resgt
FROM parametros_gen
WHERE (((codigo_para)=68));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 68')
	return -1
end if

i_contador=contador
i_difp=ld_dif
i_clugar_his=clugar_his
ls_origen=p_origen
dw_serv_ing.setredraw(false)
dw_diags.setredraw(false)
dw_diags.reset()
dw_serv_ing.reset()
dw_canasta.reset()
dw_lote.reset()
if isnull(i_contador) then return -1
dw_serv_ing.retrieve(i_contador,i_clugar_his)
dw_serv_ing.setredraw(true)
dw_sum_cab.retrieve(i_contador,i_clugar_his)
if dw_canasta.retrieve(i_contador,i_clugar_his)>0 then
	dw_lote.retrieve(i_contador,i_clugar_his)
	dw_mvto_cpo.retrieve(i_contador,i_clugar_his)
end if
if p_origen='T' then
	sle_proced.enabled=false
	cb_4.enabled=false
	pb_kit.enabled=false
else
	if dw_serv_ing.rowcount()=0 then
		sle_proced.enabled=true
		cb_4.enabled=true
		pb_kit.enabled=true
	else
		sle_proced.enabled=false
		cb_4.enabled=false
		pb_kit.enabled=false
	end if
end if
return dw_serv_ing.rowcount()

end function

public subroutine f_restringue (string p_resgt, string p_origen, long p_conta, string p_lug);long l_cuan
SELECT Count(hclin_registro.contador) into :l_cuan
FROM hclin_registro
WHERE (((hclin_registro.contador)=:p_conta) AND ((hclin_registro.clugar)=:p_lug));
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo HclinrEgistro",sqlca.sqlerrtext)
	return
end if

if p_resgt='1' or p_origen='T' or l_cuan>0  then
	sle_proced.enabled=false
	//cb_4.enabled=false
	pb_kit.enabled=false
	//pb_trae.enabled=false
	//pb_traerec.enabled=false
	//pb_citas.enabled=false
else
	sle_proced.enabled=true
	//cb_4.enabled=true
	pb_kit.enabled=true
	pb_kit.enabled=false
	//pb_trae.enabled=true
	//pb_traerec.enabled=true
	//pb_citas.enabled=true
end if
end subroutine

public function long f_insert_servicio (string p_cups, string p_emp, string p_cont, string p_plan, long p_nfact, string p_clug_fac, long p_nitem_fac, long p_nrec, string p_clug_rec, long p_item_rec, long p_nitem_rec, string p_cproceq, string p_cmaneq, string p_coduf, string p_codcc, string p_tipo_fac, string p_autoriza, string p_pasa, string p_alm, string p_final, string p_amb);//parametros:
//	cod_cups
//	empresa
//	contrato
//	plan
//	nfactura
//	clug_fac
//	item_fac
//	nreci
//	clug_rec
//	item_rec
//	nitem_rec
//	procequiv
//	man_eq
//	ufuncional  //sobra
//	ccosto		//sobra
//p_tipo_fac
//p_autoriza
//p_pasa
//p_alm
//p_final
if i_contador=-1 or trim(text)="" then return -1
str_proc stp
if p_pasa='1' then
	stp=f_busca_cups(p_cups,w_principal.dw_1.getitemstring(1,'sexo'),w_principal.dw_1.getitemnumber(1,'dias'),'1')
else
	stp=f_busca_cups(p_cups,w_principal.dw_1.getitemstring(1,'sexo'),w_principal.dw_1.getitemnumber(1,'dias'),'0')
end if
if isnull(stp.descripcion) then return -1
if isnull(stp.rips) then stp.rips="10"
choose case i_indapdx
	case '0' //consul ext
		if stp.agrupser<>'01' and stp.agrupser<>'02' and stp.agrupser<>'03' and stp.agrupser<>'04' and stp.agrupser<>'05'then
			messagebox("Atención",'Este tipo de Servicio no puede ser cargado desde Consulta Externa')
			sle_proced.text=''
			return -1
		end if
		if  stp.odonconsul='1' then
			messagebox("Atención",'Este tipo de Servicio no puede ser cargado es de Odontología')
			sle_proced.text=''
			return -1
		end if		
	case '5','5A' //odontologia
		if  stp.odonconsul='0' then
			messagebox("Atención",'Este tipo de Servicio no puede ser cargado no es de Odontología')
			sle_proced.text=''
			return -1
		end if
		if stp.agrupser<>'01' and stp.agrupser<>'02' and stp.agrupser<>'03' and stp.agrupser<>'04' and stp.agrupser<>'05'then
			messagebox("Atención",'Este tipo de Servicio no puede ser cargado desde Odontología')
			sle_proced.text=''
			return -1
		end if
end choose

if p_emp ='' then SetNull(p_emp)
if p_cont ='' then SetNull(p_cont)

long fila , j
string ls_fin,ls_cext,ls_amb
///// fin revisa a quien le van a cargar esto
i_alm=p_alm

if isnull(p_coduf) or p_coduf='' then
	setnull(p_coduf)
	setnull(p_codcc)
	select cufuncional , cccosto into :p_coduf,:p_codcc from espprof where codprof=:i_profe and cesp=:i_espe and estado='1';
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
fila=dw_serv_ing.insertrow(0)
dw_serv_ing.setitem(fila,"cproced",stp.cproc)
dw_serv_ing.setitem(fila,"cod_cups",stp.cups)
dw_serv_ing.setitem(fila,"cemp",p_emp)
dw_serv_ing.setitem(fila,"ccontrato",p_cont)
dw_serv_ing.setitem(fila,"cplan",p_plan)
dw_serv_ing.setitem(fila,"descripcion",stp.descripcion)
dw_serv_ing.setitem(fila,"contador",i_contador)
dw_serv_ing.setitem(fila,"finalidadproced",stp.tipoproc)
dw_serv_ing.setitem(fila,"rips",stp.rips)
if stp.rips='9' then dw_serv_ing.setitem(fila,"estria",'1')

if stp.rips='1' then
	if isnull(p_final) or p_final='' then
		SELECT 
			codfin 
		INTO
			:ls_fin
		FROM 
			finconsulta
		WHERE 
			(((estado)='1') AND ((defec)='1'));
		if sqlca.sqlnrows=0 then
			messagebox('Atencíon','No hay finalidad por Defecto')
			return -1
		end if

	else
		ls_fin=p_final
	end if
	dw_serv_ing.setitem(fila,"fin_consulta",ls_fin)

	SELECT 
		codcausaexter
	into
		:ls_cext
	FROM 
		causaexterna
	WHERE 
		(((estado)='1') AND ((defec)='1'));
	if sqlca.sqlnrows=0 then
		messagebox('Atencíon','No hay CausaExterna por Defecto')
		return -1
	end if

	dw_serv_ing.setitem(fila,"causaexterna",ls_cext)
	

end if
if isnull(p_amb) or p_amb='' then
	SELECT 
		codclapro
	into
		:ls_amb
	FROM 
		claseproced
	WHERE 
		(((estado)='1') AND ((defec)='1'));
	if sqlca.sqlnrows=0 then
		messagebox('Atencíon','No hay claseproced por Defecto')
		return -1
	end if
else
	ls_amb=p_amb
end if

dw_serv_ing.setitem(fila,"codespecialidad",i_espe)
dw_serv_ing.setitem(fila,"cprof",i_profe)
dw_serv_ing.setitem(fila,"persoatiende",i_atiende)

dw_serv_ing.setitem(fila,"ambitoproced",ls_amb)

dw_serv_ing.setitem(fila,"clugar",i_clugar_his)
dw_serv_ing.setitem(fila,"nfactura",p_nfact)
dw_serv_ing.setitem(fila,"nitem_fac",p_nitem_fac)
dw_serv_ing.setitem(fila,"tipo_fac",p_tipo_fac)
if p_clug_fac='' then setnull(p_clug_fac)
dw_serv_ing.setitem(fila,"clugar_fac",p_clug_fac)
dw_serv_ing.setitem(fila,"nrcaj",p_nrec)
if p_clug_rec='' then setnull(p_clug_rec)
dw_serv_ing.setitem(fila,"clugar_rec",p_clug_rec)
dw_serv_ing.setitem(fila,"items",p_item_rec)
dw_serv_ing.setitem(fila,"nitem_rec",p_nitem_rec)
if isnull(p_autoriza ) then
	dw_serv_ing.setitem(fila,"nautoriza",sle_autoriza.text)
else
	dw_serv_ing.setitem(fila,"nautoriza",p_autoriza)	
end if
if p_cproceq='' then setnull(p_cproceq)
dw_serv_ing.setitem(fila,"cprocedeq",p_cproceq)
if p_cmaneq='' then setnull(p_cmaneq)
dw_serv_ing.setitem(fila,"cmanual",p_cmaneq)
dw_serv_ing.setitem(fila,"usuario",usuario)
if p_tipo_fac='' then setnull(p_tipo_fac)

dw_serv_ing.setitem(fila,"cccosto",p_codcc)
dw_serv_ing.setitem(fila,"cufuncional",p_coduf)
dw_serv_ing.setitem(fila,"fecha",datetime(today(),now()))
dw_serv_ing.setitem(fila,"cod_modrel",'01')
SELECT Max(ServiciosIngreso.NServicio) into :i_nservicio
	FROM ServiciosIngreso
WHERE ServiciosIngreso.Contador=:i_contador and clugar=:i_clugar_his;
if isnull(i_nservicio) then i_nservicio=0
i_nservicio++
dw_serv_ing.setitem(fila,"nservicio",i_nservicio)
if dw_serv_ing.update(true,false)<1 then
	dw_serv_ing.deleterow(fila)
	return -1
end if

// ------------------------ C O H O R T E S -------------------------
string ls_id_diag
setnull(ls_id_diag)
gf_validar_proc_diag_cohorte(&
	tipdoc,docu,w_principal.dw_1.getitemstring(1,'sexo'),&
	w_principal.dw_1.getitemnumber(1,'dias'),stp.cproc,ls_id_diag,i_contador,i_clugar_his,'0')


///////////////////// C A N A S T A S
st_xa_canastas st
st.cproc=p_cups
st.sexo=w_principal.dw_1.getitemstring(1,'sexo')
st.edad_dias=w_principal.dw_1.getitemnumber(1,'dias')
st.dw_canasta=dw_canasta
st.dw_lote=dw_lote
st.contador=i_contador
st.clugar=i_clugar_his
//st.item=i_nservicio
st.nserv=i_nservicio
st.alm=i_alm
openwithparm(w_canasta_articulo,st)
if message.stringparm='!' then
	dw_serv_ing.deleterow(fila)
	dw_serv_ing.resetupdate()
	return -1
end if
IF message.stringparm<>'NI' then i_cambio_insumo=TRUE
/////////////////////    F I N     C A N A S T A S
if not isnull(p_nfact) and not isnull(p_nitem_fac) then
	update factcpo set contador=:i_contador,clugar_ser=:i_clugar_his, nservicio=:i_nservicio ,cufuncional=:p_coduf ,cccosto=:p_codcc 
	where nfact=:p_nfact and clugar=:p_clug_fac and nitem=:p_nitem_fac and tipo=:p_tipo_fac;
	if sqlca.sqlcode=-1 then
		messagebox("Error en interface con Facturación",sqlca.sqlerrtext)
		dw_serv_ing.deleterow(fila)
		dw_serv_ing.resetupdate()
		return -1
	end if
end if
if not isnull(p_nrec) and not isnull(p_item_rec) and not isnull(p_nitem_rec) then
	update tesoredetalle set contador=:i_contador,clugar_his=:i_clugar_his where nrcaj=:p_nrec and clugar=:p_clug_rec and items=:p_item_rec and nitem=:p_nitem_rec ;
	if sqlca.sqlcode=-1 then
		messagebox("Error en interface con Recibos de Caja",sqlca.sqlerrtext)
		dw_serv_ing.deleterow(fila)
		dw_serv_ing.resetupdate()
		return -1
	end if
end if
dw_serv_ing.resetupdate()
if fila<>dw_serv_ing.getrow() then
	dw_serv_ing.scrolltorow(fila)
else
	dw_serv_ing.triggerevent(rowfocuschanged!)
end if
event cambian_serv(dw_serv_ing.rowcount())
sle_proced.text=''
return i_nservicio

end function

on uo_serv_ing.create
this.dw_fin_proced=create dw_fin_proced
this.pb_3=create pb_3
this.pb_2=create pb_2
this.dw_mvto_cpo=create dw_mvto_cpo
this.dw_sum_cab=create dw_sum_cab
this.dw_lote=create dw_lote
this.dw_canasta=create dw_canasta
this.pb_citas=create pb_citas
this.pb_guarda_diags=create pb_guarda_diags
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.cb_est_ria=create cb_est_ria
this.sle_autoriza=create sle_autoriza
this.st_15=create st_15
this.pb_traerec=create pb_traerec
this.pb_trae=create pb_trae
this.pb_kit=create pb_kit
this.cb_borra=create cb_borra
this.cb_4=create cb_4
this.sle_proced=create sle_proced
this.st_1=create st_1
this.dw_serv_ing=create dw_serv_ing
this.dw_diags=create dw_diags
this.gb_2=create gb_2
this.Control[]={this.dw_fin_proced,&
this.pb_3,&
this.pb_2,&
this.dw_mvto_cpo,&
this.dw_sum_cab,&
this.dw_lote,&
this.dw_canasta,&
this.pb_citas,&
this.pb_guarda_diags,&
this.st_8,&
this.st_7,&
this.st_6,&
this.cb_est_ria,&
this.sle_autoriza,&
this.st_15,&
this.pb_traerec,&
this.pb_trae,&
this.pb_kit,&
this.cb_borra,&
this.cb_4,&
this.sle_proced,&
this.st_1,&
this.dw_serv_ing,&
this.dw_diags,&
this.gb_2}
end on

on uo_serv_ing.destroy
destroy(this.dw_fin_proced)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.dw_mvto_cpo)
destroy(this.dw_sum_cab)
destroy(this.dw_lote)
destroy(this.dw_canasta)
destroy(this.pb_citas)
destroy(this.pb_guarda_diags)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.cb_est_ria)
destroy(this.sle_autoriza)
destroy(this.st_15)
destroy(this.pb_traerec)
destroy(this.pb_trae)
destroy(this.pb_kit)
destroy(this.cb_borra)
destroy(this.cb_4)
destroy(this.sle_proced)
destroy(this.st_1)
destroy(this.dw_serv_ing)
destroy(this.dw_diags)
destroy(this.gb_2)
end on

event constructor;idw_cont_det=create uo_datastore
idw_cont_det.dataobject='dw_cont_deta'
idw_cont_det.settransobject(sqlca)
end event

type dw_fin_proced from datawindow within uo_serv_ing
boolean visible = false
integer x = 3442
integer width = 686
integer height = 124
integer taborder = 90
boolean enabled = false
string title = "none"
string dataobject = "dw_finalidad_cups"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_3 from pb_report within uo_serv_ing
boolean visible = false
integer x = 4955
integer y = 724
integer taborder = 20
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
end type

type pb_2 from picturebutton within uo_serv_ing
integer x = 4955
integer y = 584
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "Guardar2.gif"
alignment htextalign = left!
string powertiptext = "Guardar Insumos"
end type

event clicked;//if not i_cambio_insumo then return
if f_guarda_insumos(dw_sum_cab,dw_canasta,dw_mvto_cpo,dw_lote,i_cdoc_cons,i_clugar_his,i_alm,i_contador)=-1 then
	rollback;
else
	commit;
	i_cambio_insumo=false
	dw_sum_cab.resetupdate()
	dw_canasta.resetupdate()
	dw_mvto_cpo.resetupdate()
	dw_lote.resetupdate()
end if
end event

type dw_mvto_cpo from datawindow within uo_serv_ing
string tag = "tabla: sum_mvto_cpo"
boolean visible = false
integer x = 2976
integer y = 4
integer width = 402
integer height = 128
integer taborder = 90
string title = "none"
string dataobject = "dw_sum_mvto_cpo_costos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;return f_dw_error(sqldbcode,sqlerrtext,sqlsyntax,dataobject)
end event

event constructor;settransobject(sqlca)
end event

type dw_sum_cab from datawindow within uo_serv_ing
string tag = "tabla: sum_mvto_cab"
boolean visible = false
integer x = 1947
integer width = 375
integer height = 144
integer taborder = 90
string title = "none"
string dataobject = "dw_sum_mvto_cab_insumos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;return f_dw_error(sqldbcode,sqlerrtext,sqlsyntax,dataobject)
end event

event constructor;settransobject(sqlca)
end event

type dw_lote from datawindow within uo_serv_ing
string tag = "tabla: sum_lote_mov"
boolean visible = false
integer x = 2619
integer y = 20
integer width = 297
integer height = 124
integer taborder = 80
string title = "none"
string dataobject = "dw_mov_lote_item"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlerrtext,sqlsyntax,dataobject)
end event

type dw_canasta from datawindow within uo_serv_ing
string tag = "tabla: serving_insumo"
boolean visible = false
integer x = 2341
integer y = 12
integer width = 261
integer height = 112
integer taborder = 70
string title = "none"
string dataobject = "dw_insum_cext"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlerrtext,sqlsyntax,dataobject)
end event

type pb_citas from picturebutton within uo_serv_ing
integer x = 1189
integer y = 12
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "asig_cita.gif"
string disabledname = "d_asig_cita.gif"
alignment htextalign = left!
string powertiptext = "Taer desde citas del Profesional"
end type

event clicked;i_interface=3
openwithparm(w_citas_asig,parent)
f_restringue(ls_resgt,ls_origen,i_contador, i_clugar_his)
end event

type pb_guarda_diags from picturebutton within uo_serv_ing
integer x = 4951
integer y = 868
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar cambios en Diagnósticos"
end type

event clicked;if dw_serv_ing.rowcount()=0 then return
dw_diags.accepttext()
long j,desde,hasta,ll_item
string rip,ls_tpant,ls_dx
datetime ld_fechadx

if dw_diags.getitemstring(1,'pa_todos')='1' then
	desde=1
	hasta=dw_serv_ing.rowcount()
else
	desde=dw_serv_ing.getrow()
	hasta=dw_serv_ing.getrow()
end if


if is_cext='1' and (isnull(dw_diags.getitemstring(1,'diagrel1')) or dw_diags.getitemstring(1,'diagrel1')='') and dw_diags.getitemstring(1,'rips')='1' then
	messagebox("Error Datos","La Causa Externa ("+dw_diags.getitemstring(1,'causaexterna')+") exige Dx Relacionado1 Obligatorio")
	return -1
end if

if dw_diags.getitemstring(1,'r_causaexterna')<>'0' then dw_serv_ing.setitem(dw_serv_ing.getrow(),'causaexterna',dw_diags.getitemstring(1,'causaexterna'))
if dw_diags.getitemstring(1,'r_fin_consulta')<>'0' then dw_serv_ing.setitem(dw_serv_ing.getrow(),'fin_consulta',dw_diags.getitemstring(1,'fin_consulta'))
if dw_diags.getitemstring(1,'r_tipo_actoqx')<>'0' then dw_serv_ing.setitem(dw_serv_ing.getrow(),'tipo_actoqx',dw_diags.getitemstring(1,'tipo_actoqx'))
if dw_diags.getitemstring(1,'r_ambitoproced')<>'0' then dw_serv_ing.setitem(dw_serv_ing.getrow(),'ambitoproced',dw_diags.getitemstring(1,'ambitoproced'))
if dw_diags.getitemstring(1,'r_finalidadproced')<>'0' then dw_serv_ing.setitem(dw_serv_ing.getrow(),'finalidadproced',dw_diags.getitemstring(1,'finalidadproced'))
if dw_diags.getitemstring(1,'r_codmodrel')<>'0' then dw_serv_ing.setitem(dw_serv_ing.getrow(),'cod_modrel',dw_diags.getitemstring(1,'cod_modrel'))
if not isnull(dw_diags.getitemstring(1,'remite')) then dw_serv_ing.setitem(dw_serv_ing.getrow(),'remite',dw_diags.getitemstring(1,'remite'))
if not isnull(dw_diags.getitemstring(1,'espe_remite')) then dw_serv_ing.setitem(dw_serv_ing.getrow(),'espe_remite',dw_diags.getitemstring(1,'espe_remite'))

for j=desde to hasta //este ciclo es solo para los diags
	dw_serv_ing.setitem(j,'diagprin',dw_diags.getitemstring(1,'diagprin'))
	dw_serv_ing.setitem(j,'diagrel1',dw_diags.getitemstring(1,'diagrel1'))
	rip=dw_serv_ing.getitemstring(j,'rips')
	choose case rip
		case '1','8' //consulta
			if not isnull(dw_diags.getitemstring(1,'tipodiagprin')) then dw_serv_ing.setitem(j,'tipodiagprin',dw_diags.getitemstring(1,'tipodiagprin'))
				if dw_diags.getitemstring(1,'r_diagrel2')<>'0' then//obligatorio u opcional
				dw_serv_ing.setitem(j,'diagrel2',dw_diags.getitemstring(1,'diagrel2'))
				if dw_diags.getitemstring(1,'tipodiagprin')='2' then
					if ls_antece='1' then
						setnull(ls_tpant)
						SELECT cod_tipoa into :ls_tpant
						FROM tipo_antecedente
						WHERE (((tipo_antecedente.dx)='1'));
						if not isnull(ls_tpant) then
							ls_dx=dw_diags.getitemstring(1,'diagprin')
							setnull(ll_item)
							select 1 into :ll_item from pacientes_antecedente where tipodoc=:tipdoc and documento=:docu and cod_tipoa=:ls_tpant and dx=:ls_dx;
							if isnull(ll_item) then
								setnull(ll_item)
								select max(item) into :ll_item from pacientes_antecedente where tipodoc=:tipdoc and documento=:docu and cod_tipoa=:ls_tpant;
								if isnull(ll_item) then ll_item=0
								ll_item++
								ld_fechadx=datetime(today(),now())
								INSERT INTO pacientes_antecedente(tipodoc, documento,cod_tipoa,item,fecha,cprof,dx)
								VALUES (:tipdoc,:docu,:ls_tpant,:ll_item,:ld_fechadx,:i_profe,:ls_dx);
								if sqlca.sqlcode<0 then
									messagebox("Error SQL","Error insertando en pacientes_antecedente")
									rollback;
									return -1
								end if
							end if
						end if
					end if
				end if
			else//no requerido
				dw_serv_ing.setitem(j,'diagrel2',dw_diags.getitemstring(1,'diagcomp'))
			end if
		case '2','9'//procedimi
			if dw_diags.getitemstring(1,'r_diagcompli')<>'0' then//obligatorio u opcional
				dw_serv_ing.setitem(j,'diagcompli',dw_diags.getitemstring(1,'diagcomp'))
			else//no requerido
				dw_serv_ing.setitem(j,'diagcompli',dw_diags.getitemstring(1,'diagrel2'))
			end if
	end choose
next
if dw_serv_ing.update(true,false)=-1 then
	rollback;
	retrieve(i_contador,i_clugar_his,i_difp,ls_origen)
else
	commit;
	dw_serv_ing.resetupdate()
	
	// ------------------------ C O H O R T E S -------------------------
	string ls_proced
	setnull(ls_proced)
	
	for j=1 to dw_diags.rowcount()
	
		gf_validar_proc_diag_cohorte(&
			tipdoc,docu,w_principal.dw_1.getitemstring(1,'sexo'),&
			w_principal.dw_1.getitemnumber(1,'dias'),ls_proced,dw_diags.getitemstring(j,'diagprin'),i_contador,i_clugar_his,'0')

		gf_validar_proc_diag_cohorte(&
			tipdoc,docu,w_principal.dw_1.getitemstring(1,'sexo'),&
			w_principal.dw_1.getitemnumber(1,'dias'),ls_proced,dw_diags.getitemstring(j,'diagrel1'),i_contador,i_clugar_his,'0')

	next
	
	dw_diags.setredraw(false)
	for j=1 to dw_serv_ing.rowcount()
		dw_diags.retrieve(i_contador,i_clugar_his,dw_serv_ing.getitemnumber(j,'nservicio'))
		dw_serv_ing.setitem(j,'estria',dw_diags.getitemstring(1,'estado'))
	next
	dw_diags.retrieve(i_contador,i_clugar_his,dw_serv_ing.getitemnumber(dw_serv_ing.getrow(),'nservicio'))
	dw_diags.setredraw(true)
	if dw_serv_ing.update(true,false)=-1 then
		rollback;
	else
		commit;
		dw_serv_ing.resetupdate()
	end if
end if
end event

type st_8 from statictext within uo_serv_ing
integer x = 4942
integer y = 476
integer width = 283
integer height = 56
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 10789024
long backcolor = 16777215
string text = "Anulado"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_7 from statictext within uo_serv_ing
integer x = 4942
integer y = 416
integer width = 283
integer height = 56
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 16777215
string text = "Completo"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_6 from statictext within uo_serv_ing
integer x = 4942
integer y = 356
integer width = 283
integer height = 56
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 255
long backcolor = 16777215
string text = "Incompleto"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_est_ria from picturebutton within uo_serv_ing
event mousemove pbm_mousemove
integer x = 4955
integer y = 160
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &i"
string picturename = "rips.gif"
string disabledname = "d_rips.gif"
alignment htextalign = left!
string powertiptext = "Estado RIPS [Alt+I]"
end type

event clicked;if dw_serv_ing.rowcount()=0 then return
st_parips st_rip
st_rip.contador=i_contador
st_rip.clugar_his=i_clugar_his
st_rip.i_difs=i_difp
openwithparm(w_estad_ria,st_rip)
if message.stringparm='1' then retrieve(i_contador,i_clugar_his,i_difp,ls_origen)
end event

type sle_autoriza from singlelineedit within uo_serv_ing
integer x = 1390
integer y = 60
integer width = 434
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
textcase textcase = upper!
integer limit = 15
borderstyle borderstyle = stylelowered!
end type

type st_15 from statictext within uo_serv_ing
integer x = 1390
integer y = 8
integer width = 297
integer height = 48
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

type pb_traerec from picturebutton within uo_serv_ing
event mousemove pbm_mousemove
integer x = 1038
integer y = 12
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
string picturename = "trecibo.gif"
string disabledname = "d_trecibo.gif"
alignment htextalign = left!
string powertiptext = "Traer de recibos de caja"
end type

event clicked;i_interface=2
openwithparm(w_lleva_factu_cons,parent)
if dw_serv_ing.rowcount()>0 then f_restringue(ls_resgt,ls_origen,i_contador, i_clugar_his)

end event

type pb_trae from picturebutton within uo_serv_ing
event mousemove pbm_mousemove
integer x = 882
integer y = 12
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "tfactura.gif"
string disabledname = "d_tfactura.gif"
alignment htextalign = left!
string powertiptext = "Traer Servicios ya Facturados"
end type

event clicked;i_interface=1
openwithparm(w_lleva_factu_cons,parent)
if dw_serv_ing.rowcount()>0 then f_restringue(ls_resgt,ls_origen,i_contador, i_clugar_his)

end event

type pb_kit from picturebutton within uo_serv_ing
event mousemove pbm_mousemove
integer x = 722
integer y = 12
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &k"
boolean originalsize = true
string picturename = "kits.GIF"
string disabledname = "d_kits.GIF"
alignment htextalign = left!
string powertiptext = "Cargar de Prodemientos Comunes [Alt+K]"
end type

event clicked;if i_contador= -1 then return
if i_difp>30 then
	messagebox('Atencion','No se puede Agregar servios a esta atención')
	return
end if

st_proc_comun st_pc
st_pc.sle_proc=sle_proced
if i_indapdx='5' or  i_indapdx='5A'  then 
	st_pc.veren='3' //odontologia
else
	st_pc.veren='1' //consultorio
end if

openwithparm(w_kit_new,st_pc)
if dw_serv_ing.rowcount()>0 then f_restringue(ls_resgt,ls_origen,i_contador, i_clugar_his)
end event

type cb_borra from picturebutton within uo_serv_ing
event mousemove pbm_mousemove
integer x = 576
integer y = 12
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &r"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar procedimiento [Alt+R]"
end type

event clicked;if i_difp>30 then
	messagebox('Atencion','No se puede Eliminar servios a esta atención')
	return
end if

if dw_serv_ing.getrow()<1 then return
long nfa,cont,nser,nre,itemre,nitemre,ncit,j,l_cuan=0
string clug_his,clug_fac,clug_rec,clug_cita
nre=dw_serv_ing.getitemnumber(dw_serv_ing.getrow(),"nrcaj")
itemre=dw_serv_ing.getitemnumber(dw_serv_ing.getrow(),"items")
nitemre=dw_serv_ing.getitemnumber(dw_serv_ing.getrow(),"nitem_rec")
clug_his=dw_serv_ing.getitemstring(dw_serv_ing.getrow(),"clugar")
cont=dw_serv_ing.getitemnumber(dw_serv_ing.getrow(),"contador")
nser=dw_serv_ing.getitemnumber(dw_serv_ing.getrow(),"nservicio")
nfa=dw_serv_ing.getitemnumber(dw_serv_ing.getrow(),"nfactura")
clug_fac=dw_serv_ing.getitemstring(dw_serv_ing.getrow(),"clugar_fac")
clug_rec=dw_serv_ing.getitemstring(dw_serv_ing.getrow(),"clugar_rec")

if not isnull(nfa) then
	messagebox("Atención",'Servicio ya Facturado no se puede eliminar')
	return
end if

SELECT Count(hclin_registro.contador) into :l_cuan
FROM hclin_registro
WHERE (((hclin_registro.contador)=:cont) AND ((hclin_registro.clugar)=:clug_his));
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo HclinrEgistro",sqlca.sqlerrtext)
	return
end if
if l_cuan>0  then 
	messagebox('Atención','Este procedimiento ya registró Historia Clinica, no lo puede borrar')
	return
end if
dw_canasta.setfilter('nservicio='+string(nser))
dw_canasta.filter()
for j=1 to dw_canasta.rowcount()
	if dw_canasta.getitemstatus(j,0,primary!)=notmodified! then 
		messagebox('Atención','Este procedimiento ya registró su consumo, no lo puede borrar')
		return
	end if
next
do 
dw_canasta.deleterow(0)
loop while dw_canasta.rowcount()>0
dw_lote.setfilter('nservicio_serv='+string(nser))
dw_lote.filter()
do
	dw_lote.deleterow(0)
loop while dw_lote.rowcount()>0
dw_mvto_cpo.setfilter('nservicio_serv='+string(nser))
dw_mvto_cpo.filter()
do
	dw_mvto_cpo.deleterow(0)
loop while dw_mvto_cpo.rowcount()>0
if not isnull(nfa) then
	update factcpo set contador=null,clugar_ser=null, nservicio=null where nfact=:nfa and clugar=:clug_fac and clugar_ser=:clug_his and contador=:cont and nservicio=:nser;
	if sqlca.sqlcode=-1 then
		messagebox("Error en interface con facturas",sqlca.sqlerrtext)	
		rollback;
		return
	end if
end if
if not isnull(nre) and not isnull(nitemre)then
	update tesoredetalle set contador=null,clugar_his=null where nrcaj=:nre and clugar=:clug_rec and items=:itemre and nitem=:nitemre ;
	if sqlca.sqlcode=-1 then
		messagebox("Error en interface con Recibos de Caja",sqlca.sqlerrtext)
		rollback;
		return
	end if
end if
select min(ncita),min(clugar) into :ncit ,:clug_cita from serciosturno where contador=:cont and clugar_ser=:clug_his and  nservicio_ingreso=:nser;
if ncit>0 then
	if messagebox("Atención","Este procedimiento es de una cita, desea borrarlo aún así ?",question!,yesno!,2)=2 then 
		rollback;
		return
	end if
	update serciosturno set control='5',contador=null,clugar_ser=null,nservicio_ingreso=null 
	where contador=:cont and clugar_ser=:clug_his and  nservicio_ingreso=:nser;
	if sqlca.sqlcode=-1 then 
		messagebox("Error actualizando citas",sqlca.sqlerrtext)
		rollback;
		return
	end if
	
	//update citasasig set estado='3' where ncita=:ncit and clugar=:clug_cita;
	update citasasig set estado=5  where ncita=:ncit and clugar=:clug_cita;
	if sqlca.sqlcode=-1 then 
		messagebox("Error actualizando citas",sqlca.sqlerrtext)
		rollback;
		return
	end if
end if
if i_indapdx='5A' then
	update odontratacpo set contador=null,clugar_his=null,nservicio=null ,realizado='0'
	where contador=:cont and clugar_his=:clug_his and  nservicio=:nser;
	if sqlca.sqlcode=-1 then 
		messagebox("Error actualizando OdonTrataCpo",sqlca.sqlerrtext)
		rollback;
		return
	end if
end if
dw_serv_ing.deleterow(0)
if dw_serv_ing.update()<1 then
	rollback;
	retrieve(i_contador,i_clugar_his,i_difp,ls_origen)
else
	commit;
	if dw_serv_ing.rowcount()=0 then dw_diags.reset()
	parent.event borra_serv(cont,clug_his,nser)
end if
event cambian_serv(dw_serv_ing.rowcount())
end event

type cb_4 from picturebutton within uo_serv_ing
event mousemove pbm_mousemove
integer x = 425
integer y = 12
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &p"
boolean originalsize = true
string picturename = "bisturi busca.GIF"
string disabledname = "d_bisturi busca.GIF"
alignment htextalign = left!
string powertiptext = "Buscar Procedimiento [Alt+P]"
end type

event clicked;st_pa_proc st_pr
if i_difp>30 then
	messagebox('Atencion','No se puede agregar servios a esta atención')
	return
end if
if i_indapdx='5' then st_pr.decual = 10 //esto es para que en esa ventana filtre los de odontología
if i_indapdx='5A' then st_pr.decual = 11
st_pr.t_ingreso=i_indapdx
st_pr.sle = sle_proced
if i_contador <> -1 then 
	st_pr.emp=idw_emppac.getitemstring(idw_emppac.getrow(),'codemp')
	st_pr.cont=idw_emppac.getitemstring(idw_emppac.getrow(),'codcontrato')
	st_pr.origen='C'+ls_resgt
	openwithparm(w_busca_proc,st_pr)
end if
if dw_serv_ing.rowcount()>0 then f_restringue(ls_resgt,ls_origen,i_contador, i_clugar_his)
end event

type sle_proced from singlelineedit within uo_serv_ing
integer x = 18
integer y = 56
integer width = 384
integer height = 84
integer taborder = 10
string dragicon = "none!"
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "ibeam!"
long textcolor = 33554432
long backcolor = 16777215
integer accelerator = 100
borderstyle borderstyle = stylelowered!
end type

event modified;if i_contador=-1 then return -1
long nulo
string snulo
setnull(nulo)
setnull(snulo)
if i_difp>30 then
	messagebox('Atencion','No se puede agregar servios a esta atención')
	return
end if
nulo=f_insert_servicio (trim(text), snulo, snulo, snulo,nulo,snulo, nulo, nulo, snulo, nulo, nulo, snulo, snulo, snulo, snulo, snulo,snulo,'1',snulo,snulo,snulo)
if nulo=-1 then
	rollback;
	return -1
else
	commit;
end if
if dw_serv_ing.rowcount()>0 then f_restringue(ls_resgt,ls_origen,i_contador, i_clugar_his)
return 1
end event

type st_1 from statictext within uo_serv_ing
integer x = 23
integer width = 338
integer height = 64
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Digite código:"
boolean focusrectangle = false
end type

type dw_serv_ing from datawindow within uo_serv_ing
integer x = 14
integer y = 164
integer width = 4837
integer height = 824
integer taborder = 10
string dragicon = "none!"
boolean bringtotop = true
string dataobject = "dw_serv_ingre"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event doubleclicked;cb_est_ria.triggerevent(clicked!)
end event

event rowfocuschanged;if getrow()<1 then return
dw_diags.accepttext()
if i_nservicio= 0 then 
	i_nservicio=getitemnumber(getrow(),'nservicio')
end if
dw_diags.setredraw(FALSE)
dw_diags.retrieve(i_contador,i_clugar_his,i_nservicio)
dw_fin_proced.retrieve(dw_serv_ing.getitemstring(dw_serv_ing.getrow(),"cproced"))
dw_diags.event itemfocuschanged(1,dw_diags.object.codrip_prin)
dw_diags.setredraw(true)

datetime ld_fecha_atn
string ls_sex,ls_filtro
int li_dias
integer li_temp_dx=10

ld_fecha_atn=dw_serv_ing.getitemdatetime(dw_serv_ing.getrow(),"fecha")
if daysAfter(date(ld_fecha_atn),date(now())) >0 then
	dw_diags.enabled=false
	cb_est_ria.enabled=false
	pb_guarda_diags.enabled=false
	dw_serv_ing.enabled=false			
else
	if  SecondsAfter(time(ld_fecha_atn),time(now())) > (integer(li_temp_dx)*5) then 
		dw_diags.enabled=false
		dw_serv_ing.enabled=false
		cb_est_ria.enabled=false
		pb_guarda_diags.enabled=false
	else
		dw_diags.enabled=true
		dw_serv_ing.enabled=true		
		cb_est_ria.enabled=true
		pb_guarda_diags.enabled=true
	end if
end if

setnull(ls_filtro)
for li_dias=1 to dw_fin_proced.rowcount()
	if li_dias=1 then
		ls_filtro="'"+dw_fin_proced.getitemstring(li_dias,'codfin')+"'"
	else
		ls_filtro+=",'"+dw_fin_proced.getitemstring(li_dias,'codfin')+"'"
	end if
next			

li_dias=w_principal.dw_1.getitemnumber(1,'dias')
if w_principal.dw_1.getitemstring(1,'sexo')="F" then ls_sex='2'
if w_principal.dw_1.getitemstring(1,'sexo')="M" then ls_sex='1'
if not isnull( ls_filtro) then 
	idw_fincon.setfilter("codfin in ("+ls_filtro+") and indsexo in('0','"+ls_sex+"') and  "+string(li_dias)+">=edadini  and  "+string(li_dias)+"<=edadfin ")
else
	idw_fincon.setfilter("indsexo in('0','"+ls_sex+"') and  "+string(li_dias)+">=edadini  and  "+string(li_dias)+"<=edadfin ")
end if
idw_fincon.filter()

idw_causaex.setfilter("xa_cext='1'")
idw_causaex.filter()

idw_finproc.setfilter(" indsexo in('0','"+ls_sex+"') and  "+string(li_dias)+">=edadini  and  "+string(li_dias)+"<=edadfin ")
idw_finproc.filter()
end event

event retrieveend;if rowcount=0 then 
	dw_diags.setredraw(true)
	sle_proced.enabled=true
	cb_4.enabled=true
	pb_kit.enabled=true
else
	sle_proced.enabled=false
	cb_4.enabled=false
	pb_kit.enabled=false
	dw_serv_ing.enabled=false		
	datetime ld_fecha_atn
	integer li_temp_dx=10
	ld_fecha_atn=dw_serv_ing.getitemdatetime(dw_serv_ing.getrow(),"fecha")
	if daysAfter(date(ld_fecha_atn),date(now())) >0 then
		idw_fincon.retrieve('%')
		idw_finproc.retrieve('%')
		idw_causaex.retrieve('%')	
		idw_ambproc.retrieve('%')	
		dw_diags.enabled=false
		cb_est_ria.enabled=false
		pb_guarda_diags.enabled=false
	else
		if  SecondsAfter(time(ld_fecha_atn),time(now())) > (integer(li_temp_dx)*5) then 
			idw_fincon.retrieve('%')
			idw_finproc.retrieve('%')
			idw_causaex.retrieve('%')
			idw_ambproc.retrieve('%')
			dw_diags.enabled=false
			dw_serv_ing.enabled=false			
			cb_est_ria.enabled=false
			pb_guarda_diags.enabled=false
		else
			idw_fincon.retrieve('1')
			idw_finproc.retrieve('1')
			idw_causaex.retrieve('1')
			idw_ambproc.retrieve('1')
			dw_diags.enabled=true
			dw_serv_ing.enabled=true			
			cb_est_ria.enabled=true
			pb_guarda_diags.enabled=true
		end if
	end if
end if
i_nservicio=0
end event

event clicked;if row>0 and row<>getrow() then setrow(row)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,dataobject)
end event

event buttonclicked;if dwo.name='b_1' then
	st_xa_canastas st
	st.cproc=getitemstring(row,'cproced')
	st.sexo=w_principal.dw_1.getitemstring(1,'sexo')
	st.edad_dias=w_principal.dw_1.getitemnumber(1,'dias')
	st.dw_canasta=dw_canasta
	st.dw_lote=dw_lote
	st.contador=i_contador
	st.clugar=i_clugar_his
	st.nserv=i_nservicio
	//st.item=i_nservicio
	
	if isnull(i_alm) or i_alm='' then
		i_alm=f_alm_de_cc(getitemstring(row,'cufuncional'),getitemstring(row,'cccosto'))
		if i_alm='' then return -1
	end if
	
	st.alm=i_alm
	openwithparm(w_canasta_articulo,st)
	if message.stringparm='ok' then i_cambio_insumo=TRUE
end If

if dwo.name='b_2' then
	If dw_serv_ing.rowcount()=0 then return
	uo_report lci_rep
	lci_rep=create uo_report
	lci_rep.cod_rep=getitemstring(row,'cproced')
	lci_rep.v_preliminar=true
	lci_rep.dialogo=false
	lci_rep.tipo_rep='consenti!'
	any par[2]
	par[1]=i_contador
	par[2]=i_clugar_his
	lci_rep.imprimir(par,'','0')
end if
end event

type dw_diags from datawindow within uo_serv_ing
integer x = 14
integer y = 1008
integer width = 5381
integer height = 424
integer taborder = 10
string title = "none"
string dataobject = "dw_estad_rip_cext"
boolean border = false
end type

event constructor;settransobject(sqlca)
getchild('fin_consulta',idw_fincon)
idw_fincon.settransobject(sqlca)
dw_diags.getchild('finalidadproced',idw_finproc)
idw_finproc.settransobject(SQLCA)
dw_diags.getchild('causaexterna',idw_causaex)
idw_causaex.settransobject(sqlca)
dw_diags.getchild('ambitoproced',idw_ambproc)
idw_ambproc.settransobject(sqlca)
end event

event itemfocuschanged;if row<1 or rowcount()<1 then return
choose case dwo.name
	case 'codrip_prin'
		setitem(1,'desdiag',getitemstring(1,'desdiag_prin'))
	case 'codrip_rel1'
		setitem(1,'desdiag',getitemstring(1,'desdiag_rel1'))
	case 'codrip_rel2'
		setitem(1,'desdiag',getitemstring(1,'desdiag_rel2'))
	case 'codrip_comp'
		setitem(1,'desdiag',getitemstring(1,'desdiag_comp'))
end choose
end event

event itemchanged;int veri
string nulo
st_return_diags st

setnull(nulo)
accepttext()
choose case getcolumnname()
	case 'causaexterna','fin_consulta'
		if (this.getitemstring(row,'fin_consulta') >='01' and this.getitemstring(row,'fin_consulta') <= '08') then 
			this.setitem(row,'causaexterna',"15")
		end if 
		veri=f_valida_fin_con(this.getitemstring(row,'fin_consulta'),this.getitemstring(row,'causaexterna'),w_principal.dw_1.getitemstring(1,'sexo'), w_principal.dw_1.getitemnumber(1,"dias"),this.getitemstring(row,'diagprin'))
		if veri=-1 then
			this.setitem(row,'causaexterna',nulo)
			this.setitem(row,'fin_consulta',nulo)
			return 1
		end if
		setnull(veri)
		veri=idw_causaex.find("codcausaexter ='"+this.getitemstring(row,'causaexterna')+"'",1,idw_causaex.rowcount())
		if veri>0 then
			is_cext=idw_causaex.getitemstring(veri,'dxrel')
		else
			is_cext='0'
		end if

	case 'codrip_prin','codrip_rel1','codrip_rel2','codrip_comp'
		string este,pedazo,l_sex
		
		setnull(veri)
		veri=idw_causaex.find("codcausaexter ='"+this.getitemstring(row,'causaexterna')+"'",1,idw_causaex.rowcount())
		if veri>0 then
			is_cext=idw_causaex.getitemstring(veri,'dxrel')
		else
			is_cext='0'
		end if
		setnull(este)
		pedazo=right(getcolumnname(),4)
		if trim(gettext())<>'' then
			st=f_check_diag(data,w_principal.dw_1.getitemstring(1,'sexo'),w_principal.dw_1.getitemnumber(1,'dias'),este,'0',this.getitemstring(row,'rips'),is_cext)
			if st.descrip_diag='' or isnull(st.descrip_diag) then
				settext(getitemstring(1,getcolumnname()))
				return 1
			end if
			setitem(1,'desdiag_'+pedazo,st.descrip_diag)
			setitem(1,'diag'+pedazo,este)
			setitem(1,'desdiag',st.descrip_diag)
			setnull(ls_antece)
			ls_antece=st.antecedente
			if getcolumnName()='codrip_prin' then event cambia_diags(este)
		else
			setnull(nulo)
			setitem(1,'desdiag_'+pedazo,nulo)
			setitem(1,'diag'+pedazo,nulo)
			setitem(1,'desdiag',nulo)
		end if
end choose
accepttext()
end event

event doubleclicked;string colu,pedazo
double ldb_veri
colu=dwo.name
pedazo=right(colu,4)
choose case colu
	case 'codrip_prin','codrip_rel1','codrip_rel2','codrip_comp'
		if getcolumnname()<>dwo.name then return
		st_edadsexo st_es
		st_es.edad=w_principal.dw_1.getitemnumber(1,'dias')
		st_es.sexo=w_principal.dw_1.getitemstring(1,'sexo')
		st_es.antece='0'
		if getitemstring(getrow(),'rips')='1' then
			st_es.proced='0'
		else
			st_es.proced='1'
		end if
		setnull(ldb_veri)
		ldb_veri=idw_causaex.find("codcausaexter ='"+this.getitemstring(row,'causaexterna')+"'",1,idw_causaex.rowcount())
		if ldb_veri>0 then
			is_cext=idw_causaex.getitemstring(ldb_veri,'dxrel')
		else
			is_cext='0'
		end if		
	
		if is_cext='1' and (colu='codrip_rel1' or colu='codrip_rel2') then
			st_es.dxrel='1'
		else
			st_es.dxrel='0'			
		end if

		openwithparm(w_busca_diag,st_es)
		st_diag st_diag
		st_diag=message.powerobjectparm
		if not isvalid(st_diag) then return
		setitem(1,'diag'+pedazo,st_diag.codgeral)
		setitem(1,'codrip_'+pedazo,st_diag.codrip)
		setitem(1,'desdiag_'+pedazo,st_diag.descripcion)
		setitem(1,'desdiag',st_diag.descripcion)
		ls_antece=st_diag.antecedente
end choose
accepttext()
end event

type gb_2 from groupbox within uo_serv_ing
integer x = 4901
integer y = 300
integer width = 379
integer height = 260
integer taborder = 70
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long backcolor = 80269524
string text = "Convenciones"
end type

