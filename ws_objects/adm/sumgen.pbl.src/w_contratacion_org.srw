$PBExportHeader$w_contratacion_org.srw
forward
global type w_contratacion_org from window
end type
type pb_14 from picturebutton within w_contratacion_org
end type
type dw_cargo from datawindow within w_contratacion_org
end type
type pb_11 from picturebutton within w_contratacion_org
end type
type pb_23 from picturebutton within w_contratacion_org
end type
type pb_8 from picturebutton within w_contratacion_org
end type
type pb_7 from picturebutton within w_contratacion_org
end type
type pb_6 from picturebutton within w_contratacion_org
end type
type pb_anula from picturebutton within w_contratacion_org
end type
type pb_4 from picturebutton within w_contratacion_org
end type
type pb_nuevo from picturebutton within w_contratacion_org
end type
type st_2 from statictext within w_contratacion_org
end type
type t1 from tab within w_contratacion_org
end type
type p1 from userobject within t1
end type
type dw_concab from datawindow within p1
end type
type p1 from userobject within t1
dw_concab dw_concab
end type
type pp from userobject within t1
end type
type pb_leg from picturebutton within pp
end type
type pb_5 from picturebutton within pp
end type
type pb_1 from picturebutton within pp
end type
type dw_req from datawindow within pp
end type
type st_r from statictext within pp
end type
type st_d from statictext within pp
end type
type pb_19 from picturebutton within pp
end type
type pb_18 from picturebutton within pp
end type
type dw_pol from datawindow within pp
end type
type mle_p from multilineedit within pp
end type
type pp from userobject within t1
pb_leg pb_leg
pb_5 pb_5
pb_1 pb_1
dw_req dw_req
st_r st_r
st_d st_d
pb_19 pb_19
pb_18 pb_18
dw_pol dw_pol
mle_p mle_p
end type
type p3 from userobject within t1
end type
type mle_1 from multilineedit within p3
end type
type pb_del_ppto from picturebutton within p3
end type
type pb_add_ppto from picturebutton within p3
end type
type dw_ppto from datawindow within p3
end type
type p3 from userobject within t1
mle_1 mle_1
pb_del_ppto pb_del_ppto
pb_add_ppto pb_add_ppto
dw_ppto dw_ppto
end type
type p4 from userobject within t1
end type
type pb_del_oc from picturebutton within p4
end type
type pb_add_oc from picturebutton within p4
end type
type dw_oc from datawindow within p4
end type
type p4 from userobject within t1
pb_del_oc pb_del_oc
pb_add_oc pb_add_oc
dw_oc dw_oc
end type
type p2 from userobject within t1
end type
type pb_acta from picturebutton within p2
end type
type st_4 from statictext within p2
end type
type pb_g from picturebutton within p2
end type
type pb_15 from picturebutton within p2
end type
type dw_ent from datawindow within p2
end type
type pb_autoriza from picturebutton within p2
end type
type pb_3 from picturebutton within p2
end type
type pb_2 from picturebutton within p2
end type
type st_1 from statictext within p2
end type
type dw_fpago from datawindow within p2
end type
type pb_21 from picturebutton within p2
end type
type p2 from userobject within t1
pb_acta pb_acta
st_4 st_4
pb_g pb_g
pb_15 pb_15
dw_ent dw_ent
pb_autoriza pb_autoriza
pb_3 pb_3
pb_2 pb_2
st_1 st_1
dw_fpago dw_fpago
pb_21 pb_21
end type
type pb from userobject within t1
end type
type st_fp from statictext within pb
end type
type st_3 from statictext within pb
end type
type pb_17 from picturebutton within pb
end type
type pb_16 from picturebutton within pb
end type
type dw_ob from datawindow within pb
end type
type mle_2 from multilineedit within pb
end type
type pb from userobject within t1
st_fp st_fp
st_3 st_3
pb_17 pb_17
pb_16 pb_16
dw_ob dw_ob
mle_2 mle_2
end type
type p5 from userobject within t1
end type
type pb_12 from picturebutton within p5
end type
type dw_osi from datawindow within p5
end type
type p5 from userobject within t1
pb_12 pb_12
dw_osi dw_osi
end type
type p6 from userobject within t1
end type
type pb_13 from picturebutton within p6
end type
type pb_10 from picturebutton within p6
end type
type pb_9 from picturebutton within p6
end type
type dw_causa from datawindow within p6
end type
type p6 from userobject within t1
pb_13 pb_13
pb_10 pb_10
pb_9 pb_9
dw_causa dw_causa
end type
type t1 from tab within w_contratacion_org
p1 p1
pp pp
p3 p3
p4 p4
p2 p2
pb pb
p5 p5
p6 p6
end type
type dw_cab from datawindow within w_contratacion_org
end type
type pb_minuta from picturebutton within w_contratacion_org
end type
end forward

global type w_contratacion_org from window
integer width = 4571
integer height = 2472
boolean titlebar = true
string title = "Contratación - Suministros"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "contrato.ico"
boolean center = true
pb_14 pb_14
dw_cargo dw_cargo
pb_11 pb_11
pb_23 pb_23
pb_8 pb_8
pb_7 pb_7
pb_6 pb_6
pb_anula pb_anula
pb_4 pb_4
pb_nuevo pb_nuevo
st_2 st_2
t1 t1
dw_cab dw_cab
pb_minuta pb_minuta
end type
global w_contratacion_org w_contratacion_org

type variables
string codDocumento, codmodulo, i_exige_origen,i_emp
long nuevo, otrosi
boolean cambio, ppto
decimal mayorCuantia
datawindowchild dwc_f, dwc_i, dwc_t,dwc_cc,idw_concep

end variables

forward prototypes
public function integer grabar (string tipo)
public function long f_nuevo_contra (long ano, long ots)
end prototypes

public function integer grabar (string tipo);long fila, numdoc, inicial, final, i, nd, it
string valor, cd, cl, msg
double monto, monto_int

if t1.p1.dw_concab.RowCount() = 0 then Return -1
if t1.p1.dw_concab.GetItemString(1,'estado') = '2' then
	MessageBox('Aviso','El documento ya ha sido anulado')
	Return -1
end if
if t1.p1.dw_concab.GetItemString(1,'estado') = '1' then
	MessageBox('Aviso','El documento ya ha sido cerrado')
	Return -1
end if
if isNull(t1.p1.dw_concab.GetItemString(t1.p1.dw_concab.Getrow(),'coddoc')) then
	Rollback;
	MessageBox('Atención','Debe seleccionar el tipo de documento')
	Return -1
end if
if isNull(t1.p1.dw_concab.GetItemString(t1.p1.dw_concab.GetRow(),'documento')) then
	Rollback;
	messageBox('Aviso','Debe seleccionar un tercero')
	Return -1;
end if
if isNull(t1.p1.dw_concab.GetItemString(t1.p1.dw_concab.GetRow(),'cod_flujo')) then
	if messageBox('Aviso','No ha seleccionado un flujo para el documento. desea continuar?',QUESTION!,YESNO!) = 2 then
		Rollback;
		Return -1;
	end if
end if
if isNull(t1.p1.dw_concab.GetItemDateTime(t1.p1.dw_concab.GetRow(),'inicia')) then
	Rollback;
	messageBox('Aviso','Debe seleccionar fechas válidas')
	Return -1;
end if
if isNull(t1.p1.dw_concab.GetItemNumber(t1.p1.dw_concab.GetRow(),'meses')) and isNull(t1.p1.dw_concab.GetItemNumber(t1.p1.dw_concab.GetRow(),'dias')) then
	Rollback;
	messageBox('Aviso','Debe proporcionar Duración válida')
	Return -1;
end if

if isNull(t1.p1.dw_concab.GetItemNumber(t1.p1.dw_concab.GetRow(),'monto')) or t1.p1.dw_concab.GetItemNumber(t1.p1.dw_concab.GetRow(),'monto') <= 0 then
	rollback;
	messageBox('Aviso','El monto del contrato debe ser mayor de cero')
	Return -1
end if

otrosi = t1.p1.dw_concab.GetItemNumber(1,'otrosi')

if nuevo > 0 then
	if t1.p1.dw_concab.GetItemNumber(t1.p1.dw_concab.GetRow(),'monto') >= MayorCuantia then
		otrosi = 0
	else
//		numdoc = f_trae_ndoc('NC',clugar,'Documento de Contratación - Menor Cuantía')
		otrosi = 100
	end if
	numdoc = f_nuevo_contra(t1.p1.dw_concab.GetItemNumber(1,'ano'),otrosi)
	if numdoc = -1 then
		Rollback;
		Return -1
	end if
	dw_cab.setItem(dw_cab.GetRow(),'ncontrato', numdoc)
	dw_cab.setItem(dw_cab.GetRow(),'otrosi', otrosi)
	t1.p1.dw_concab.setItem(1,'ncontrato', numdoc)
	t1.p1.dw_concab.setItem(1,'otrosi', otrosi)
	for i = 1 to t1.p2.dw_fpago.RowCount()
		t1.p2.dw_fpago.SetItem(i,'ncontrato',numdoc)
		t1.p2.dw_fpago.SetItem(i,'otrosi',otrosi)
	Next
	for i = 1 to t1.p3.dw_ppto.RowCount()
		t1.p3.dw_ppto.SetItem(i,'ncontrato',numdoc)
		t1.p3.dw_ppto.SetItem(i,'otrosi',otrosi)
	Next
	for i = 1 to  t1.p6.dw_causa.RowCount()
		t1.p6.dw_causa.SetItem(i,'ncontrato',numdoc)
		t1.p6.dw_causa.SetItem(i,'otrosi',otrosi)
	Next	
	for i = 1 to t1.p4.dw_oc.RowCount()
		t1.p4.dw_oc.SetItem(i,'ncontrato',numdoc)
		t1.p4.dw_oc.SetItem(i,'otrosi',otrosi)
	Next
	for i = 1 to t1.pb.dw_ob.RowCount()
		t1.pb.dw_ob.SetItem(i,'ncontrato',numdoc)
		t1.pb.dw_ob.SetItem(i,'otrosi',otrosi)
	Next
	for i = 1 to t1.pp.dw_pol.RowCount()
		t1.pp.dw_pol.SetItem(i,'ncontrato',numdoc)
		t1.pp.dw_pol.SetItem(i,'otrosi',otrosi)
	Next
	for i = 1 to t1.pp.dw_req.RowCount()
		t1.pp.dw_req.SetItem(i,'ncontrato',numdoc)
		t1.pp.dw_req.SetItem(i,'otrosi',otrosi)
	Next
end if

if t1.p1.dw_concab.GetItemNumber(t1.p1.dw_concab.GetRow(),'monto') >= MayorCuantia and otrosi = 100 then
	MessageBox('Atención','El contrato está definido de menor cuantía pero el monto es superior a '+string(MayorCuantia,'#,##0.00')+' Debe anularlo y crear otro, o verificar el monto')
	Return -1
end if
if t1.p1.dw_concab.GetItemNumber(t1.p1.dw_concab.GetRow(),'monto') < MayorCuantia and otrosi = 0 then
	MessageBox('Atención','El contrato está definido de mayor cuantía pero el monto es menor a '+string(MayorCuantia,'#,##0.00')+' Debe anularlo y crear otro, o verificar el monto')
	Return -1
end if

if tipo = 'definitivo' then
	if t1.p3.dw_ppto.RowCount() = 0 and ppto then
		Rollback;
		messageBox('Aviso','No puede contratar por un monto mayor al definido en presupuesto')
		Return -1;
	elseif ppto and t1.p3.dw_ppto.RowCount() > 0 then
		if (t1.p1.dw_concab.GetItemNumber(t1.p1.dw_concab.GetRow(),'monto') > t1.p3.dw_ppto.GetItemNumber(1,'total')) then
			Rollback;
			messageBox('Aviso','No puede contratar por un monto mayor al definido en presupuesto')
			Return -1;
		end if
	end if
	
	numdoc = t1.p1.dw_concab.GetItemNumber(1,'ncontrato')
	valor = t1.p2.dw_fpago.Describe("evaluate('sum(monto)',0)")
	if dec(valor) > t1.p1.dw_concab.GetItemNumber(t1.p1.dw_concab.GetRow(),'monto') then
		Rollback;
		messageBox('Aviso','La suma de montos de Forma de Pago es mayor del monto del Contrato')
		Return -1
	end if
	
	if t1.p4.dw_oc.RowCount() > 0 then
		valor = t1.p4.dw_oc.Describe("evaluate('sum(valor_agregado)',0)")
		if double(valor) > t1.p1.dw_concab.GetItemNumber(t1.p1.dw_concab.GetRow(),'monto') then
			if messageBox('Aviso','La suma de montos de Ordenes de Compra es mayor del monto del Contrato. Desea continuar?',QUESTION!,YESNO!,2) = 2 then
				Rollback;
				Return -1
			end if
		end if
	end if
	
	for i = 1 to t1.p3.dw_ppto.RowCount()
		cd = t1.p3.dw_ppto.GetItemString(i,'coddoc_dispo')
		cl = t1.p3.dw_ppto.GetItemString(i,'cLugar_dispo')
		nd = t1.p3.dw_ppto.GetItemNumber(i,'numdoc_dispo')
		it = t1.p3.dw_ppto.GetItemNumber(i,'item_dispo')
		monto = t1.p3.dw_ppto.GetItemNumber(i,'monto')
		select monto_vigente - monto_interfaz into :monto_int from pre_docu_cp
		where coddoc=:cd and clugar=:cl and numdoc=:nd and item=:it;
		if monto > monto_int then
			rollback;
			MessageBox('Atención','Excede el monto disponible ' + t1.p3.dw_ppto.GetItemString(i,'codtotal_dispo'))
			Return -1
		end if
		update pre_docu_cp set monto_interfaz=monto_interfaz + :monto
		where coddoc=:cd and clugar=:cl and numdoc=:nd and item=:it;
		IF SQLCA.SQLCode = -1 THEN 
			msg = SQLCA.SQLErrText
			Rollback;
			MessageBox("SQL error", msg)
			Return -1
		END IF
	next
	
// Establecer indicador en_destino para Ordenes de Compra
//	for i = 1 to t1.p4.dw_oc.RowCount()
//		cd = t1.p4.dw_oc.GetItemString(i,'coddoc')
//		cl = t1.p4.dw_oc.GetItemString(i,'cLugar')
//		nd = t1.p4.dw_oc.GetItemNumber(i,'numdoc')
//		update sum_orden_compra_cab set en_destino = '1'
//		where coddocu=:cd and clugar=:cl and numdoc=:nd;
//		IF SQLCA.SQLCode = -1 THEN 
//			Rollback;
//			MessageBox("SQL error", SQLCA.SQLErrText)
//			Return -1
//		END IF
//	next

	t1.p1.dw_concab.SetItem(1,'estado','1')
	dw_cab.SetItem(dw_cab.Getrow(),'estado','1')
	
	if codDocumento = 'NC' then // Para contratos por servicios
		long requi,ncargo,ultimo,ano,contrato
		string td,doc,codrela,tipoemp
		datetime inicia, termina, fecha
		
		fecha = datetime(today())
		td = t1.p1.dw_concab.GetItemString(1,'tipodoc')
		doc = t1.p1.dw_concab.GetItemString(1,'documento')
		codrela = dw_cargo.GetItemString(1,'codrela')
		tipoemp = dw_cargo.GetItemString(1,'tipoemple')
		inicia = t1.p1.dw_concab.GetItemDateTime(1,'inicia')
		termina = t1.p1.dw_concab.GetItemDateTime(1,'termina')
		contrato = t1.p1.dw_concab.GetItemNumber(1,'ncontrato')

		select ncargo into :ncargo from emplecargo
		where tipodoc=:td and documento=:doc and estado='1';
		IF SQLCA.SQLCode = -1 then
			msg = SQLCA.SQLErrText
			Rollback;
			MessageBox("SQL error", msg)
			Return -1
		END IF
		
		if not isNull(ncargo) and not(ncargo=0) then
			select max(nitem) into :ultimo from emplerequi
			where tipodoc = :td and documento=:doc and ncargo=:ncargo;
			if isnull(ultimo) then ultimo=0
			ultimo++
			
			select nrequisito into :requi from tipoemplerequi
			where codrela=:codrela and tipoemple=:tipoemp and contrato='1';
			IF SQLCA.SQLCode = 100 then
				messageBox('Aviso','No existe el requisito de CONTRATO para este tipo de empleado. Se omitirá el requisito')
			ELSE
				Insert into emplerequi (tipodoc,documento,ncargo,nitem,codrela,tipoemple,nrequisito,iniciovigencia,termivigencia,numero,estado,usuario,usufecha)
				values(:td,:doc,:ncargo,:ultimo,:codrela,:tipoemp,:requi,:inicia,:termina,:contrato,'1',:usuario,:fecha);
				if SQLCA.SQLCode <> 0 then
					msg = SQLCA.SQLErrText
					Rollback;
					MessageBox("SQL error", msg)
					Return -1
				end if
			END IF
		end if
		
	end if
	
end if

if t1.p1.dw_concab.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
for i = 1 to t1.p2.dw_fpago.RowCount()
	if t1.p2.dw_fpago.GetItemNumber(i,'nuevo') = 1 then t1.p2.dw_fpago.SetItem(i,'nuevo',0)
next

if t1.p2.dw_fpago.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

if t1.p3.dw_ppto.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
//
for i = 1 to t1.p4.dw_oc.RowCount()
	if t1.p4.dw_oc.GetItemStatus(i,0,Primary!) = NewModified! then
		t1.p4.dw_oc.SetItemStatus(i,'ano',Primary!,DataModified!)
		t1.p4.dw_oc.SetItemStatus(i,'ncontrato',Primary!,DataModified!)
		t1.p4.dw_oc.SetItemStatus(i,'otrosi',Primary!,DataModified!)
		t1.p4.dw_oc.SetItemStatus(i,0,Primary!,DataModified!)
		if tipo = 'definitivo' then 
			t1.p4.dw_oc.SetItem(i,'en_destino','1')
			t1.p4.dw_oc.SetItemStatus(i,'en_destino',Primary!,DataModified!)
		end if
	end if
next

if t1.p4.dw_oc.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

if t1.pb.dw_ob.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

if t1.pp.dw_pol.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

if t1.pp.dw_req.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
if t1.p6.dw_causa.Update() = -1 then
	Rollback;
	Return -1
end if

nuevo = 0

cambio = FALSE
commit;

t1.p1.dw_concab.ResetUpdate()
t1.p2.dw_fpago.ResetUpdate()
t1.p3.dw_ppto.ResetUpdate()
t1.p4.dw_oc.ResetUpdate()
t1.pb.dw_ob.ResetUpdate()
t1.pp.dw_pol.ResetUpdate()
t1.pp.dw_req.ResetUpdate()

Return 0

end function

public function long f_nuevo_contra (long ano, long ots);string msg
long ncontrato
select max(ncontrato) into :ncontrato from contra
where ano=:ano and otrosi=:ots;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("SQL error", msg)
	Return -1
END IF
if isNull(ncontrato) then ncontrato = 0
ncontrato = ncontrato + 1
Return ncontrato

end function

on w_contratacion_org.create
this.pb_14=create pb_14
this.dw_cargo=create dw_cargo
this.pb_11=create pb_11
this.pb_23=create pb_23
this.pb_8=create pb_8
this.pb_7=create pb_7
this.pb_6=create pb_6
this.pb_anula=create pb_anula
this.pb_4=create pb_4
this.pb_nuevo=create pb_nuevo
this.st_2=create st_2
this.t1=create t1
this.dw_cab=create dw_cab
this.pb_minuta=create pb_minuta
this.Control[]={this.pb_14,&
this.dw_cargo,&
this.pb_11,&
this.pb_23,&
this.pb_8,&
this.pb_7,&
this.pb_6,&
this.pb_anula,&
this.pb_4,&
this.pb_nuevo,&
this.st_2,&
this.t1,&
this.dw_cab,&
this.pb_minuta}
end on

on w_contratacion_org.destroy
destroy(this.pb_14)
destroy(this.dw_cargo)
destroy(this.pb_11)
destroy(this.pb_23)
destroy(this.pb_8)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.pb_anula)
destroy(this.pb_4)
destroy(this.pb_nuevo)
destroy(this.st_2)
destroy(this.t1)
destroy(this.dw_cab)
destroy(this.pb_minuta)
end on

event open;codDocumento = Message.StringParm
string valor
///RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI", "MayorCuantia", Regstring!, valor)
SELECT cadena into :valor
FROM parametros_gen
WHERE (((codigo_para)=19));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 19')
	return 
end if

if (isNull(valor) or valor = '') and codDocumento = '%' then 
	if MessageBox('Atención','No ha definido un monto como MAYOR CUANTIA en el configurador. Todos sus contratos serán de mayor cuantía. Desea Continuar?',QUESTION!,YESNO!,2) = 2 then 
		pb_4.PostEvent(clicked!)
		Return 0
	end if
end if
MayorCuantia = dec(valor)
if isNull(MayorCuantia) then MayorCuantia = 0

if codDocumento = 'NC' then
	Title = 'Contratos de Servicios'
	t1.p2.dw_ent.Visible = FALSE
	t1.p2.pb_15.Visible = FALSE
	t1.p2.dw_fpago.Height = 900
	t1.p2.st_4.Visible = FALSE
	t1.p4.Visible = FALSE
elseif  codDocumento = '%' then
	Title = 'Módulo Contratación'
end if

string lic_pres  // Si tienen licencia de ppto - exige disp.
if ls_pro=32 THEN	Registryget ( "HKEY_LOCAL_MACHINE\SOFTWARE\GCI\", "LIC_PRES", regstring!, lic_pres)
if ls_pro=64 THEN	Registryget ( "HKEY_CURRENT_USER\SOFTWARE\GCI\", "LIC_PRES", regstring!, lic_pres)
if long(lic_pres) > 0 then 
	ppto = TRUE
	t1.p3.Visible = TRUE
	t1.p3.Enabled = TRUE
else
	ppto = FALSE
	t1.p3.Visible = FALSE
	t1.p3.Enabled = FALSE
end if

t1.p1.dw_concab.SetTransObject(SQLCA)
t1.p1.dw_concab.GetChild('cod_flujo',dwc_f)
dwc_f.SetTransObject(SQLCA)
dwc_f.Retrieve(codDocumento)
if dwc_f.rowcount()=0 then
	dwc_f.InsertRow(0)
else
	if codDocumento = '%' then
		dwc_f.SetFilter("cod_vent='SCT' or cod_vent='NC'")
		dwc_f.Filter()
	else
		dwc_f.SetFilter("cod_vent='NC'")
		dwc_f.Filter()
	end if	
end if

t1.p1.dw_concab.GetChild('tipo',dwc_t)
dwc_t.SetTransObject(SQLCA)
if dwc_t.Retrieve(codDocumento) = 0 then
	dwc_t.InsertRow(0)
end if

t1.pb.dw_ob.SetTransObject(SQLCA)
t1.pb.dw_ob.GetChild('cod_impu',dwc_i)
dwc_i.SetTransObject(SQLCA)
dwc_i.Retrieve()

dw_cab.SetTransObject(SQLCA)
t1.p2.dw_fpago.SetTransObject(SQLCA)
t1.p3.dw_ppto.SetTransObject(SQLCA)
t1.p4.dw_oc.SetTransObject(SQLCA)


select cod_empresa into :i_emp from lugar where codlugar=:clugar;
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo la tabla lugar",sqlca.sqlerrtext)
	return 0
end if
if isnull(i_emp) then
	messagebox("Error Código Empresa",'No existe el código de la empresa en la tabla lugar, debe colocarlo allí para poder continuar')
	return 0
end if

if coddocumento <> '%' then
	string original_select, rc, mod_string
//	pb_nuevo.Enabled = FALSE
//	pb_anula.Enabled = FALSE
	original_select = dw_cab.Describe("DataWindow.Table.Select")
	mod_string = "DataWindow.Table.Select='" + original_select + " and contra.estado = ~~'1~~'  '"
	rc = dw_cab.Modify(mod_string)
	IF rc <> "" THEN
		MessageBox("Status", "Modify Failed" + rc)
	END IF
end if

dw_cab.Retrieve(codDocumento)
// OJO, si se deja módulo aparte 

end event

type pb_14 from picturebutton within w_contratacion_org
event mousemove pbm_mousemove
integer x = 1746
integer y = 2160
integer width = 151
integer height = 132
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "novedades.gif"
string disabledname = "d_novedades.gif"
string powertiptext = "V.B. Jurídico"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '0' then
	MessageBox('Atención','solo para contratos vigentes')
	Return
end if
if t1.p1.dw_concab.GetItemString(1,'juridico') = '1' then Return
if MessageBox('Aviso','Se dará Visto Bueno de Jurídica. Desea Continuar?',QUESTION!,YESNO!,2) = 2 then Return 0

if f_sol_permiso(this,t1.p1.dw_concab.GetItemString(t1.p1.dw_concab.GetRow(),'coddoc')) = 1 then 
	t1.p1.dw_concab.SetItem(1,'juridico','1')
end if
if t1.p1.dw_concab.Update() = -1 then
	rollback;
	Return -1
end if
commit;
Return 0

end event

type dw_cargo from datawindow within w_contratacion_org
boolean visible = false
integer x = 2976
integer y = 2188
integer width = 393
integer height = 124
integer taborder = 50
boolean enabled = false
string title = "none"
string dataobject = "dw_emplecargo"
boolean border = false
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)

end event

type pb_11 from picturebutton within w_contratacion_org
event mousemove pbm_mousemove
string tag = "Sugerir Plan"
boolean visible = false
integer x = 2053
integer y = 2160
integer width = 146
integer height = 128
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
string powertiptext = "Continua/No Continua"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '1' then Return
if MessageBox('Aviso','Va a afectar la renovación o no del contrato. Desea Continuar?',QUESTION!,YESNO!,2) = 2 then Return 0

if f_sol_permiso(this,'CAP') = 1 then
	if isNull(t1.p1.dw_concab.GetItemString(1,'continua')) then
		t1.p1.dw_concab.SetItem(1,'continua','1')
	elseif t1.p1.dw_concab.GetItemString(1,'continua') = '1' then
		t1.p1.dw_concab.SetItem(1,'continua','0')
	else
		t1.p1.dw_concab.SetItem(1,'continua','1')
	end if
end if
if t1.p1.dw_concab.Update() = -1 then
	rollback;
	Return -1
end if
commit;
Return 0

end event

type pb_23 from picturebutton within w_contratacion_org
event mousemove pbm_mousemove
integer x = 4347
integer y = 232
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrador.gif"
string disabledname = "d_borrador.gif"
vtextalign vtextalign = top!
string powertiptext = "Eliminar Documento Nuevo"
end type

event clicked;if nuevo > 0 and dw_cab.GetRow() = nuevo then
	dw_cab.deleterow(dw_cab.getRow());
	nuevo = 0
	cambio = FALSE
	dw_cab.TriggerEvent(RowFocusChanged!)
else
	MessageBox('Atención','Solo se pueden borrar registros nuevos')
end if

end event

type pb_8 from picturebutton within w_contratacion_org
event mousemove pbm_mousemove
string tag = "Imprimir Reporte"
integer x = 1902
integer y = 2160
integer width = 146
integer height = 128
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
alignment htextalign = left!
string powertiptext = "Imprimir Reporte"
end type

event clicked;if dw_cab.RowCount() < 1 then Return
//any param[10]
//param[1] = dw_cab.GetItemString(dw_cab.GetRow(),'ano')
//param[2] = dw_cab.GetItemNumber(dw_cab.GetRow(),'ncontrato')
//
//f_reporte(codDocumento,"Reporte de Contratos",param)

st_parm st_parametro
st_parametro.informe = 3
st_parametro.datawindow = "dw_concabgrid"
st_parametro.dw_obj = dw_cab
st_parametro.camino = t1.p1.dw_concab.GetItemString(1,'archivo')
if isNull(st_parametro.camino) then
	select camino into :st_parametro.camino from documentos
	where coddoc=:Coddocumento;
end if
if isNull(st_parametro.camino) then
	MessageBox('Aviso','El documento no ha sido configurado')
	Return
end if
openSheetwithParm(w_rte,st_parametro,w_principal,1,original!)
w_principal.arrangesheets(layer!)

end event

type pb_7 from picturebutton within w_contratacion_org
event mousemove pbm_mousemove
string tag = "&Grabar Definitivo"
integer x = 1595
integer y = 2160
integer width = 146
integer height = 128
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                  &g"
boolean originalsize = true
string picturename = "guardar2.gif"
string disabledname = "guardar2.gif"
alignment htextalign = left!
string powertiptext = "&Grabar Definitivo"
end type

event clicked;if dw_cab.RowCount() < 1 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Error','El Contrato ya ha sido cerrado')
	Return
end if
if messageBox('Aviso','Al grabar definitivo no podrá modificarse de nuevo el documento. Desea Continuar?',Question!,YesNo!)=2 then Return
grabar('definitivo')

end event

type pb_6 from picturebutton within w_contratacion_org
event mousemove pbm_mousemove
string tag = "Grabar &Temporal"
integer x = 1445
integer y = 2160
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                     &t"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Grabar &Temporal"
end type

event clicked;if dw_cab.RowCount() < 1 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Error','El Contrato ya ha sido cerrado')
	Return
end if
grabar('temporal')

end event

type pb_anula from picturebutton within w_contratacion_org
event mousemove pbm_mousemove
string tag = "Anular Contrato"
integer x = 1294
integer y = 2160
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "anulardoc.gif"
string disabledname = "d_anulardoc.gif"
alignment htextalign = left!
string powertiptext = "Anular Documento"
end type

event clicked;if t1.p1.dw_concab.RowCount() = 0 then Return
long i, conteo,item
string cd,cl, flujo, orig, msg
double nd,monto_d
if nuevo > 0 and dw_cab.GetRow() = nuevo then
	pb_23.TriggerEvent(Clicked!)
	Return 0
end if

if t1.p1.dw_concab.GetItemString(1,'estado') = '0' then
	t1.p1.dw_concab.SetItem(1,'estado','2')
	dw_cab.SetItem(dw_cab.GetRow(),'estado','2')
	if t1.p1.dw_concab.update() = -1 then
		t1.p1.dw_concab.SetItem(1,'estado','0')
		dw_cab.SetItem(dw_cab.GetRow(),'estado','0')
		Rollback;
		Return -1
	end if
elseif t1.p1.dw_concab.GetItemString(1,'estado') = '1' then
	flujo = t1.p1.dw_concab.GetItemString(1,'cod_flujo')
	select cod_orig into :orig from mod_orig_dest
	where codigo=:flujo;
	if orig = 'PDI' or orig = 'OC' then
		for i = 1 to t1.p3.dw_ppto.RowCount()
			cd = t1.p3.dw_ppto.GetItemString(i,'coddoc_dispo')
			cl = t1.p3.dw_ppto.GetItemString(i,'cLugar_dispo')
			nd = t1.p3.dw_ppto.GetItemNumber(i,'numdoc_dispo')
			SELECT Count(*) into :conteo
			FROM pre_docu_cb INNER JOIN pre_docu_cp ON (pre_docu_cb.numdoc = pre_docu_cp.numdoc) AND (pre_docu_cb.clugar = pre_docu_cp.clugar) AND (pre_docu_cb.coddoc = pre_docu_cp.coddoc)
			WHERE (pre_docu_cp.coddoc='PR' and (pre_docu_cp.coddoc_orig=:cd) AND (pre_docu_cp.clugar_orig=:cl) AND 
			(pre_docu_cp.numdoc_orig=:nd) AND (pre_docu_cb.estado='1' or pre_docu_cb.estado='2'));
			if conteo > 0 then
				MessageBox('Atención','Se han elaborado reservas para este contrato. No puede anular el documento')
				Return -1				
			end if
		next
	end if
	for i = 1 to t1.p2.dw_fpago.RowCount()
		if t1.p2.dw_fpago.GetItemString(i,'autorizado') = '1' then
			MessageBox('Atención','Tiene autorizaciones para pagos hechas. No puede anular el documento')
			Return -1
		end if
	next
	for i = 1 to t1.p3.dw_ppto.RowCount()
		cd = t1.p3.dw_ppto.GetItemString(i,'coddoc_dispo')
		cl = t1.p3.dw_ppto.GetItemString(i,'cLugar_dispo')
		nd = t1.p3.dw_ppto.GetItemNumber(i,'numdoc_dispo')
		item=t1.p3.dw_ppto.GetItemNumber(i,'item_dispo')
		monto_d=t1.p3.dw_ppto.GetItemNumber(i,'monto')
		update pre_docu_cb set en_destino = '0'
		where coddoc=:cd and clugar=:cl and numdoc=:nd;
		IF SQLCA.SQLCode = -1 THEN
			msg = SQLCA.SQLErrText
			Rollback;
			MessageBox("SQL error", msg)
			Return -1
		END IF
		
		UPDATE pre_docu_cp SET pre_docu_cp.monto_interfaz = pre_docu_cp.monto_interfaz - :monto_d
		WHERE 
			(((pre_docu_cp.coddoc)=:cd) AND ((pre_docu_cp.clugar)=:cl) AND ((pre_docu_cp.numdoc)=:nd) AND 
			((pre_docu_cp.item)=item));
		IF SQLCA.SQLCode = -1 THEN
			msg = SQLCA.SQLErrText
			Rollback;
			MessageBox("SQL error actualizando predocucpo", msg)
			Return -1
		END IF
	next
	for i = 1 to t1.p4.dw_oc.RowCount()
		cd = t1.p4.dw_oc.GetItemString(i,'coddoc')
		cl = t1.p4.dw_oc.GetItemString(i,'clugar')
		nd = t1.p4.dw_oc.GetItemNumber(i,'numdoc')
		update sum_mvto_cab set en_destino = '0', ano=NULL, ncontrato=NULL, otrosi=NULL
		where coddoc=:cd and clugar=:cl and numdoc=:nd;
		IF SQLCA.SQLCode = -1 THEN 
			msg = SQLCA.SQLErrText
			Rollback;
			MessageBox("SQL error", msg)
			Return -1
		END IF
	next
	t1.p1.dw_concab.SetItem(1,'estado','2')
	dw_cab.SetItem(dw_cab.GetRow(),'estado','2')
	if t1.p1.dw_concab.update() = -1 then
		t1.p1.dw_concab.SetItem(1,'estado','0')
		dw_cab.SetItem(dw_cab.GetRow(),'estado','0')
		Rollback;
		Return -1
	end if
	
end if

end event

type pb_4 from picturebutton within w_contratacion_org
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 1143
integer y = 2160
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_nuevo from picturebutton within w_contratacion_org
event mousemove pbm_mousemove
string tag = "Nuevo Contrato"
integer x = 4343
integer y = 88
integer width = 146
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Nuevo Documento"
end type

event clicked;long fila
if nuevo > 0 then 
	messageBox('Error','Existe un documento sin grabar')
	Return
end if

t1.selectTab(t1.p1)
fila = dw_cab.InsertRow(1)
dw_cab.SetItem(fila,'coddoc',codDocumento)
dw_cab.SetItem(fila,'cLugar',cLugar)
dw_cab.SetItem(fila,'ano',year(today()))
dw_cab.SetItem(fila,'estado','0')
dw_cab.ScrollToRow(fila)
nuevo = fila
fila = t1.p1.dw_concab.InsertRow(1)
t1.p1.dw_concab.SetItem(fila,'cLugar',cLugar)
t1.p1.dw_concab.SetItem(fila,'ano',year(today()))
t1.p1.dw_concab.SetItem(fila,'otrosi',0)
t1.p1.dw_concab.SetItem(fila,'estado','0')
t1.p1.dw_concab.SetItem(fila,'inicia',datetime(today(),time(0)))
t1.p1.dw_concab.SetItem(fila,'usuario',usuario)
cambio = TRUE



end event

type st_2 from statictext within w_contratacion_org
integer x = 96
integer y = 24
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Contratos"
boolean focusrectangle = false
end type

type t1 from tab within w_contratacion_org
integer x = 87
integer y = 596
integer width = 4183
integer height = 1520
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
p1 p1
pp pp
p3 p3
p4 p4
p2 p2
pb pb
p5 p5
p6 p6
end type

on t1.create
this.p1=create p1
this.pp=create pp
this.p3=create p3
this.p4=create p4
this.p2=create p2
this.pb=create pb
this.p5=create p5
this.p6=create p6
this.Control[]={this.p1,&
this.pp,&
this.p3,&
this.p4,&
this.p2,&
this.pb,&
this.p5,&
this.p6}
end on

on t1.destroy
destroy(this.p1)
destroy(this.pp)
destroy(this.p3)
destroy(this.p4)
destroy(this.p2)
destroy(this.pb)
destroy(this.p5)
destroy(this.p6)
end on

type p1 from userobject within t1
integer x = 18
integer y = 112
integer width = 4146
integer height = 1392
long backcolor = 67108864
string text = "Generalidades"
long tabtextcolor = 33554432
string picturename = "contrato.ico"
long picturemaskcolor = 536870912
dw_concab dw_concab
end type

on p1.create
this.dw_concab=create dw_concab
this.Control[]={this.dw_concab}
end on

on p1.destroy
destroy(this.dw_concab)
end on

type dw_concab from datawindow within p1
integer x = 27
integer y = 16
integer width = 4014
integer height = 1164
integer taborder = 20
string title = "none"
string dataobject = "dw_concab"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;if this.GetItemString(this.getRow(),'Estado') <> '0' then Return
if string(dwo.Name) = 'b_1' then
	string dir, dep, ciu, tel, email,td,doc
	g_tercerodesde=14
	openwithparm(w_buscater,this)
	doc = this.GetItemString(this.GetRow(),'documento')
	td = this.GetItemString(this.GetRow(),'tipodoc')
	dw_cab.SetItem(dw_cab.GetRow(),'tipodoc',this.GetItemString(this.GetRow(),'tipodoc'))
	dw_cab.SetItem(dw_cab.GetRow(),'documento',this.GetItemString(this.GetRow(),'documento'))
	dw_cab.SetItem(dw_cab.GetRow(),'persona',this.GetItemString(this.GetRow(),'persona'))
	dw_cab.SetItem(dw_cab.GetRow(),'nombre1',this.GetItemString(this.GetRow(),'nombre1'))
	dw_cab.SetItem(dw_cab.GetRow(),'nombre2',this.GetItemString(this.GetRow(),'nombre2'))
	dw_cab.SetItem(dw_cab.GetRow(),'apellido1',this.GetItemString(this.GetRow(),'apellido1'))
	dw_cab.SetItem(dw_cab.GetRow(),'apellido2',this.GetItemString(this.GetRow(),'apellido2'))
	dw_cab.SetItem(dw_cab.GetRow(),'razon_social',this.GetItemString(this.GetRow(),'razon_social'))
	select direccion,tel1,email,cdpto,cciudad into :dir,:tel,:email,:dep,:ciu from terceros_direccion
	where tipodoc=:td and documento=:doc and ctdir='D01';
	SetItem(1,'tel1',tel)
	SetItem(1,'cciudad',ciu)
	SetItem(1,'direccion',dir)
	SetItem(1,'tel1',tel)
	SetItem(1,'email',email)
	if codDocumento = 'NC' then
		dw_cargo.Retrieve(GetItemString(GetRow(),'tipodoc'),GetItemString(GetRow(),'documento'))
	end if
else
	string dirname, filename
	GetFileOpenName("Select File", dirname, filename, "DOC", "Doc Files (*.DOC),*.DOC, Text Files (*.TXT),*.TXT")
	if not isNull(dirname) then
		this.SetItem(this.GetRow(),'archivo',dirname)
	end if
end if

end event

event itemchanged;long i, f
choose case this.getColumnName()
	case "inicia"
		if AcceptText() = -1 then Return -1
		dw_cab.SetItem(dw_cab.GetRow(),'inicia',this.GetItemDateTime(this.GetRow(),'inicia'))
	case "monto"
		double monto_ant
		monto_ant = GetItemNumber(GetRow(),'monto')
		if dec(data) >= MayorCuantia then
			if nuevo = 0 and GetItemNumber(GetRow(),'otrosi') = 100 then
				MessageBox('Atención','El monto es de Mayor Cuantía (desde '+string(MayorCuantia,'#,##0.00')+'), pero al ser elaborado se definió de Menor cuantía. Revise montos o el configurador. En otro caso debe anularse y crear un nuevo contrato')
				SetItem(GetRow(),'monto',monto_ant)
				SetText(string(monto_ant))
				Return 1
			end if
			otrosi = 0
		else
			if nuevo = 0 and GetItemNumber(GetRow(),'otrosi') = 0 then
				MessageBox('Atención','El monto es de Menor Cuantía (menor de '+string(MayorCuantia,'#,##0.00')+') pero al ser elaborado se definió de Mayor cuantía. Revise montos o el configurador. En otro caso debe anularse y crear un nuevo contrato')
				SetItem(GetRow(),'monto',monto_ant)
				setText(string(monto_ant))
				Return 1
			end if
			otrosi = 100
		end if
		AcceptText()
		SetItem(GetRow(),'otrosi',otrosi)
		dw_cab.SetItem(dw_cab.GetRow(),'otrosi',otrosi)
		dw_cab.SetItem(dw_cab.GetRow(),'monto',this.GetItemNumber(this.GetRow(),'monto'))
		t1.p2.dw_fpago.TriggerEvent(RetrieveEnd!)
	case 'coddoc'
		if AcceptText() = -1 then Return -1
		string vnul
		setNull(vnul)
		if GetItemString(GetRow(),'coddoc') = 'NC' then
			Title = 'Contrato de Servicios'
			t1.p2.dw_ent.Visible = FALSE
			t1.p2.pb_15.Visible = FALSE
			t1.p2.dw_fpago.Height = 900
			t1.p2.st_4.Visible = FALSE
			dwc_f.SetFilter("cod_vent='NC'")
		else
			Title = 'Contratos de Suministros'
			t1.p2.dw_ent.Visible = TRUE
			t1.p2.pb_15.Visible = TRUE
			t1.p2.dw_fpago.Height = 456
			t1.p4.Visible = TRUE
			dwc_f.SetFilter("cod_vent='SCT'")
		end if
		dw_cab.SetItem(dw_cab.Getrow(),'coddoc',GetItemString(GetRow(),'coddoc'))
		SetItem(GetRow(),'tipo',vnul)
		SetItem(GetRow(),'cod_flujo',vnul)
		dwc_f.Filter()
		
		if dwc_t.Retrieve(GetItemString(this.GetRow(),'coddoc')) = 0 then
			dwc_t.InsertRow(0)
		end if
	case "cod_flujo"
		if AcceptText() = -1 then Return -1
		if dwc_f.GetItemString(dwc_f.Getrow(),'cod_orig') = 'PDI' or dwc_f.GetItemString(dwc_f.Getrow(),'cod_orig') = 'PR' then
			t1.p3.pb_add_ppto.Enabled = TRUE
			t1.p3.pb_del_ppto.Enabled = TRUE
			t1.p4.pb_add_oc.Enabled = FALSE
			t1.p4.pb_del_oc.Enabled = FALSE
		else
			t1.p3.pb_add_ppto.Enabled = FALSE
			t1.p3.pb_del_ppto.Enabled = FALSE
			t1.p4.pb_add_oc.Enabled = TRUE
			t1.p4.pb_del_oc.Enabled = TRUE
		end if
	case "documento"
		if AcceptText() = -1 then Return -1
		string n1,n2,a1,a2,rs,td,doc,tel,ciu,depto,per
		td = GetItemString(GetRow(),'tipodoc')
		if isNull(data) then
			doc = GetItemString(GetRow(),'documento')
		else
			doc = data
		end if
		select nombre1,nombre2,apellido1,apellido2,razon_social,tel1,cdpto,cciudad,persona into :n1,:n2,:a1,:a2,:rs,:tel,:depto,:ciu,:per
		from terceros left join terceros_direccion on (terceros.documento = terceros_direccion.documento) and (terceros.tipodoc = terceros_direccion.tipodoc)
		where (((terceros.tipodoc)=:td) AND ((terceros.documento)=:doc) AND ((terceros_direccion.ctdir)='D01' Or (terceros_direccion.ctdir) Is Null));
		IF SQLCA.SQLCode = -1 THEN
			MessageBox("SQL error", SQLCA.SQLErrText)
			Return 1
		elseif SQLCA.SQLCode = 100 THEN
			if MessageBox('Atención','El tercero no existe. Desea crearlo?',QUESTION!,YESNO!,2) = 1 then
				st_general st_p
				st_p.valor = td
				st_p.documento = doc
				openwithparm(w_cfgterceros,st_p)
				select nombre1,nombre2,apellido1,apellido2,razon_social,tel1,cdpto,cciudad,persona into :n1,:n2,:a1,:a2,:rs,:tel,:depto,:ciu,:per
				from terceros left  join terceros_direccion on (terceros.documento = terceros_direccion.documento) and (terceros.tipodoc = terceros_direccion.tipodoc)
				where (((terceros.tipodoc)=:td) AND ((terceros.documento)=:doc) AND ((terceros_direccion.ctdir)='D01' Or (terceros_direccion.ctdir) Is Null));
			end if
		END IF
		SetItem(GetRow(),'nombre1',n1)
		SetItem(GetRow(),'nombre2',n2)
		SetItem(GetRow(),'apellido1',a1)
		SetItem(GetRow(),'apellido2',a2)
		SetItem(GetRow(),'razon_social',rs)
		SetItem(GetRow(),'tel1',tel)
		SetItem(GetRow(),'cdpto',depto)
		SetItem(GetRow(),'cciudad',ciu)
		dw_cab.SetItem(dw_cab.GetRow(),'nombre1',n1)
		dw_cab.SetItem(dw_cab.GetRow(),'nombre2',n2)
		dw_cab.SetItem(dw_cab.GetRow(),'apellido1',a1)
		dw_cab.SetItem(dw_cab.GetRow(),'apellido2',a2)
		dw_cab.SetItem(dw_cab.GetRow(),'razon_social',rs)
	case "tipo"
		if AcceptText() = -1 then Return -1
		uo_datastore dw_rq
		dw_rq = Create uo_datastore
		dw_rq.DataObject= 'dw_reqxtipo'
		dw_rq.SetTransOBject(SQLCA)
		dw_rq.Retrieve(data)
		
		for i = 1 to dw_rq.RowCount()
			f = t1.pp.dw_req.Find("codigo='"+dw_rq.GetItemString(i,'codigo')+"'",1,t1.pp.dw_req.RowCount())
			if f = 0 then
				f = t1.pp.dw_req.InsertRow(0)
				t1.pp.dw_req.SetItem(f,'ano',t1.p1.dw_concab.GetItemNumber(1,'ano'))
				t1.pp.dw_req.SetItem(f,'ncontrato',t1.p1.dw_concab.GetItemNumber(1,'ncontrato'))
				t1.pp.dw_req.SetItem(f,'otrosi',t1.p1.dw_concab.GetItemNumber(1,'otrosi'))
				t1.pp.dw_req.SetItem(f,'codigo',dw_rq.GetItemString(i,'codigo'))
			end if
		next
		
end choose
cambio = TRUE

end event

event editchanged;if string(dwo.Name) = 'objeto' then
	this.acceptText()
end if

end event

event retrieveend;if rowcount() > 0 then
	dw_cargo.Retrieve(GetItemString(1,'tipodoc'),GetItemString(1,'documento'))
else
	Return
end if
//if GetItemString(1,'estado') = '0' then
//	if not isNull(GetItemDateTime(1,'inicia')) and not isNull(GetItemDateTime(1,'inicia')) then
//		SetItem(GetRow(),'dias',DaysAfter(date(GetItemDateTime(GetRow(),'inicia')),date(GetItemDateTime(GetRow(),'termina'))))
//	end if
//end if
//

end event

type pp from userobject within t1
integer x = 18
integer y = 112
integer width = 4146
integer height = 1392
long backcolor = 67108864
string text = "Pólizas"
long tabtextcolor = 33554432
string picturename = "libro.ico"
long picturemaskcolor = 536870912
pb_leg pb_leg
pb_5 pb_5
pb_1 pb_1
dw_req dw_req
st_r st_r
st_d st_d
pb_19 pb_19
pb_18 pb_18
dw_pol dw_pol
mle_p mle_p
end type

on pp.create
this.pb_leg=create pb_leg
this.pb_5=create pb_5
this.pb_1=create pb_1
this.dw_req=create dw_req
this.st_r=create st_r
this.st_d=create st_d
this.pb_19=create pb_19
this.pb_18=create pb_18
this.dw_pol=create dw_pol
this.mle_p=create mle_p
this.Control[]={this.pb_leg,&
this.pb_5,&
this.pb_1,&
this.dw_req,&
this.st_r,&
this.st_d,&
this.pb_19,&
this.pb_18,&
this.dw_pol,&
this.mle_p}
end on

on pp.destroy
destroy(this.pb_leg)
destroy(this.pb_5)
destroy(this.pb_1)
destroy(this.dw_req)
destroy(this.st_r)
destroy(this.st_d)
destroy(this.pb_19)
destroy(this.pb_18)
destroy(this.dw_pol)
destroy(this.mle_p)
end on

type pb_leg from picturebutton within pp
event mousemove pbm_mousemove
string tag = "Sugerir Plan"
integer x = 2048
integer y = 1196
integer width = 146
integer height = 128
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
string powertiptext = "Guardar Pólizas y Requisitos"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
long i
if dw_pol.GetNextModified(0,Primary!) > 0 or dw_req.GetNextModified(0,Primary!) > 0 then
	if MessageBox('Atención','Desea guardar los cambios de Pólizas y Requerimientos?. No podrá modificarlos',QUESTION!,YESNO!) = 2 then Return 0
else
	Return 0
end if
if dw_pol.Update() = -1 then
	Rollback;
	Return -1
end if
if dw_req.Update() = -1 then
	Rollback;
	Return -1
end if
for i = 1 to dw_pol.RowCount()
	if dw_pol.GetItemNumber(i,'nuevo') = 1 then dw_pol.SetItem(i,'nuevo',0)
next
for i = 1 to dw_req.RowCount()
	if dw_req.GetItemNumber(i,'nuevo') = 1 then dw_req.SetItem(i,'nuevo',0)
next
dw_pol.ResetUpdate()
dw_req.ResetUpdate()
commit;
Return 0

end event

type pb_5 from picturebutton within pp
event mousemove pbm_mousemove
string tag = "Borrar Registro"
integer x = 2048
integer y = 1068
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Requisito"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '2' then
	messagebox('Error','El documento está Anulado')
	Return
end if

if dw_req.GetItemNumber(dw_req.GetRow(),'nuevo') = 0 and dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '1' then
	MessageBox('Atención','Solo registros nuevos')
	Return
end if
if dw_req.RowCount() > 0 then
	dw_req.DeleteRow(dw_req.GetRow())
	cambio = TRUE
end if

end event

type pb_1 from picturebutton within pp
event mousemove pbm_mousemove
integer x = 2048
integer y = 940
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Adicionar Requisito"
end type

event clicked;If dw_cab.RowCount() = 0 then Return
string valor
long fila
if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') = '2' then
	messageBox('Aviso','El documento ya ha sido cerrado. No puede modificarse')
	Return
end if
fila = dw_req.InsertRow(0)
dw_req.SetItem(fila,'ano',t1.p1.dw_concab.GetItemNumber(1,'ano'))
dw_req.SetItem(fila,'ncontrato',t1.p1.dw_concab.GetItemNumber(1,'ncontrato'))
dw_req.SetItem(fila,'otrosi',t1.p1.dw_concab.GetItemNumber(1,'otrosi'))
dw_req.ScrolltoRow(fila)
Return fila

end event

type dw_req from datawindow within pp
integer x = 50
integer y = 936
integer width = 1984
integer height = 416
integer taborder = 50
string title = "none"
string dataobject = "dw_contra_requi"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event itemchanged;AcceptText()
if getColumnName() = 'cumple' then
	datetime vnul
	if GetItemString(Getrow(),'cumple') = '1' then
		SetItem(GetRow(),'fecha',datetime(today(),time('0')))
	else
		setNull(vnul)
		SetItem(GetRow(),'fecha',vnul)
	end if
	SetItem(GetRow(),'usuario',usuario)
end if

end event

type st_r from statictext within pp
integer x = 59
integer y = 860
integer width = 603
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Requisitos Legalización"
boolean focusrectangle = false
end type

type st_d from statictext within pp
integer x = 55
integer y = 856
integer width = 617
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Descripción Póliza"
boolean focusrectangle = false
end type

type pb_19 from picturebutton within pp
event mousemove pbm_mousemove
string tag = "Borrar Registro"
integer x = 3131
integer y = 904
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Póliza"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '2' then
	messagebox('Error','El documento está Anulado')
	Return
end if

mle_p.Text = ''
if dw_pol.RowCount() > 0 then
	if dw_pol.GetItemString(dw_pol.GetRow(),'estado') = '1' and dw_pol.GetItemNumber(dw_pol.GetRow(),'nuevo') = 0 then
		MessageBox('Atención','Solamente registros nuevos')
		Return -1
	end if
	
	dw_pol.DeleteRow(dw_pol.GetRow())
	cambio = TRUE
end if


end event

type pb_18 from picturebutton within pp
event mousemove pbm_mousemove
integer x = 2985
integer y = 900
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Adicionar Póliza"
end type

event clicked;If dw_cab.RowCount() = 0 then Return
string valor
long fila
if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') = '2' then
	messageBox('Aviso','El documento ya ha sido cerrado. No puede modificarse')
	Return
end if
valor = dw_pol.Describe("Evaluate('max(item)',0)")
fila = dw_pol.InsertRow(0)
dw_pol.SetItem(fila,'ano',t1.p1.dw_concab.GetItemNumber(1,'ano'))
dw_pol.SetItem(fila,'ncontrato',t1.p1.dw_concab.GetItemNumber(1,'ncontrato'))
dw_pol.SetItem(fila,'otrosi',t1.p1.dw_concab.GetItemNumber(1,'otrosi'))
dw_pol.SetItem(fila,'estado',t1.p1.dw_concab.GetItemString(1,'estado'))
dw_pol.SetItem(fila,'item',long(valor) + 1)
dw_pol.ScrolltoRow(fila)
Return fila

end event

type dw_pol from datawindow within pp
integer x = 59
integer y = 40
integer width = 4041
integer height = 840
integer taborder = 40
string title = "none"
string dataobject = "dw_contra_poliza"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rowfocuschanged;mle_p.Text = ''
if currentrow = 0 then Return
if dw_pol.RowCount() > 0 then
	mle_p.Text = dw_pol.GetItemString(dw_pol.GetRow(),'descripcion')
end if

end event

event itemchanged;dec valor
datetime fec

if getColumnName() = 'base' then
	valor = GetItemNumber(GetRow(),'base')
	if not isNull(t1.p1.dw_concab.GetItemNumber(1,'monto')) then
		if dec(data) > t1.p1.dw_concab.GetItemNumber(1,'monto') then
			MessageBox('Atención','El valor sobrepasa el monto del contrato')
			SetItem(GetRow(),'base',valor)
			SetText(string(valor,'#,##0.00'))
			Return 2
		end if
	end if
elseif getColumnName() = 'fecha_expedicion' then
	fec = GetItemdateTime(GetRow(),'fecha_expedicion')
	if not isNull(GetItemDateTime(GetRow(),'fecha_expiracion')) then
		if datetime(date(left(data,10))) > GetItemDateTime(GetRow(),'fecha_expiracion') then
			MessageBox('Atención','La fecha de expedición es mayor que la fecha de expiración')
			SetItem(GetRow(),'fecha_expedicion',fec)
			SetText(string(valor,'#,##0.00'))
			Return 2
		end if
	end if
elseif getColumnName() = 'fecha_expiracion' then
	fec = GetItemdateTime(GetRow(),'fecha_expiracion')
	if not isNull(GetItemDateTime(GetRow(),'fecha_expedicion')) then
		if datetime(date(left(data,10))) < GetItemDateTime(GetRow(),'fecha_expedicion') then
			MessageBox('Atención','La fecha de expedición es mayor que la fecha de expiración')
			SetItem(GetRow(),'fecha_expiracion',fec)
			SetText(string(valor,'#,##0.00'))
			Return 2
		end if
	end if
end if

end event

event itemfocuschanged;if GetColumnName() = 'descripcion' then
	mle_p.Visible = TRUE
	st_d.Visible = TRUE
	dw_req.Visible = FALSE
	st_r.Visible = FALSE
	if GetItemNumber(GetRow(),'nuevo') = 0 and GetItemString(GetRow(),'estado') = '1' then
		mle_p.DisplayOnly = TRUE
	else
		mle_p.DisplayOnly = FALSE
	end if
else
	mle_p.Visible = FALSE
	st_d.Visible = FALSE
	dw_req.Visible = TRUE
	st_r.Visible = TRUE
end if

end event

event clicked;if dwo.name = 'descripcion' then
	mle_p.Visible = TRUE
	st_d.Visible = TRUE
	dw_req.Visible = FALSE
	st_r.Visible = FALSE
	if GetItemNumber(GetRow(),'nuevo') = 0 and GetItemString(GetRow(),'estado') = '1' then
		mle_p.DisplayOnly = TRUE
	else
		mle_p.DisplayOnly = FALSE
	end if
else
	mle_p.Visible = FALSE
	st_d.Visible = FALSE
	dw_req.Visible = TRUE
	st_r.Visible = TRUE
end if

end event

type mle_p from multilineedit within pp
boolean visible = false
integer x = 59
integer y = 940
integer width = 1975
integer height = 420
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event modified;if dw_pol.RowCount() > 0 then
	dw_pol.SetItem(dw_pol.GetRow(),'descripcion',Text)
end if

end event

type p3 from userobject within t1
integer x = 18
integer y = 112
integer width = 4146
integer height = 1392
long backcolor = 67108864
string text = "Presupuesto"
long tabtextcolor = 33554432
string picturename = "disponible.ico"
long picturemaskcolor = 536870912
mle_1 mle_1
pb_del_ppto pb_del_ppto
pb_add_ppto pb_add_ppto
dw_ppto dw_ppto
end type

on p3.create
this.mle_1=create mle_1
this.pb_del_ppto=create pb_del_ppto
this.pb_add_ppto=create pb_add_ppto
this.dw_ppto=create dw_ppto
this.Control[]={this.mle_1,&
this.pb_del_ppto,&
this.pb_add_ppto,&
this.dw_ppto}
end on

on p3.destroy
destroy(this.mle_1)
destroy(this.pb_del_ppto)
destroy(this.pb_add_ppto)
destroy(this.dw_ppto)
end on

type mle_1 from multilineedit within p3
integer x = 55
integer y = 700
integer width = 2505
integer height = 336
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type pb_del_ppto from picturebutton within p3
event mousemove pbm_mousemove
string tag = "Borrar Registro"
integer x = 3959
integer y = 160
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Rubro"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messagebox('Error','El documento ya ha sido cerrado')
	Return
end if

if dw_ppto.RowCount() = 0 then Return
dw_ppto.DeleteRow(dw_ppto.GetRow())
cambio = TRUE

end event

type pb_add_ppto from picturebutton within p3
event mousemove pbm_mousemove
string tag = "Adicionar"
integer x = 3959
integer y = 32
integer width = 142
integer height = 124
integer taborder = 3
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Buscar"
end type

event clicked;If dw_cab.RowCount() = 0 then Return
string valor
long fila,i,j,k,f
if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') <> '0' then
	messageBox('Aviso','El documento ya ha sido cerrado. No puede modificarse')
	Return
end if

st_interfaz st_parm
st_parm.dw_obj = dw_ppto
st_parm.dw_cab = t1.p1.dw_concab
if t1.p1.dw_concab.GetItemString(1,'coddoc') = 'SCT' then
	st_parm.filtro = "%SCT"
else
	st_parm.filtro = "%NC"
end if
st_parm.codmod = t1.p1.dw_concab.GetItemString(1,'cod_flujo')
openwithparm(w_choosedisp, st_parm)

uo_datastore dw_fr, dw_obra
string cod_flujo, cd,cl
double nd

dw_fr = Create uo_datastore
dw_fr.DataObject = 'dw_flujo_2s1n'
dw_fr.SetTransObject(SQLCA)
dw_obra = Create uo_datastore
dw_obra.DataObject = 'dw_orden_obra'
dw_obra.SetTransObject(SQLCA)

if codDocumento = 'NC' then Return 0

for i = 1 to dw_ppto.RowCount()
	cd = dw_ppto.GetItemString(i,'coddoc_dispo')
	cl = dw_ppto.GetItemString(i,'clugar_dispo')
	nd = dw_ppto.GetItemNumber(i,'numdoc_dispo')
	select cod_flujo into :cod_flujo from pre_docu_cb
	where coddoc=:cd and clugar=:cl and numdoc=:nd;
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Rollback;
		Return -1
	END IF
	if match(cod_flujo,'^PDIOC') then
		dw_fr.Retrieve(cod_flujo,cd,cl,nd)
		for j = 1 to dw_fr.RowCount()
			cd = dw_fr.GetItemString(j,'char_orig1')
			cl = dw_fr.GetItemString(j,'char_orig2')
			nd = dw_fr.GetItemNumber(j,'num_orig1')
			dw_obra.Retrieve(cd,cl,nd)
			for k = 1 to dw_obra.RowCount()
				f = t1.pb.dw_ob.Find("des_obra='"+dw_obra.GetItemString(k,'des_obra')+"'",1,t1.pb.dw_ob.RowCount())
				if f > 0 then Continue
				f = t1.pb.pb_16.Event Clicked()
				t1.pb.dw_ob.SetItem(f,'monto',dw_obra.GetItemNumber(k,'monto'))
				t1.pb.dw_ob.SetItem(f,'cod_impu',dw_obra.GetItemString(k,'cod_impu'))
				t1.pb.dw_ob.SetItem(f,'iva',dw_obra.GetItemNumber(k,'iva'))
				t1.pb.dw_ob.SetItem(f,'fecha_entrega',dw_obra.GetItemDateTime(k,'fecha_entrega'))
				t1.pb.dw_ob.SetItem(f,'fecha_satisfaccion',dw_obra.GetItemDateTime(k,'fecha_satisfaccion'))
				t1.pb.dw_ob.SetItem(f,'satisfaccion',dw_obra.GetItemString(k,'satisfaccion'))
				t1.pb.dw_ob.SetItem(f,'des_obra',dw_obra.GetItemString(k,'des_obra'))
				t1.pb.mle_2.Text = dw_obra.GetItemString(k,'des_obra')
			next
		next
	end if
next

end event

type dw_ppto from datawindow within p3
event type long insertafila ( long fila )
integer x = 59
integer y = 44
integer width = 3863
integer height = 624
integer taborder = 2
string title = "none"
string dataobject = "dw_contra_ppto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type long insertafila(long fila);long f
string valor
valor = t1.p3.dw_ppto.Describe("Evaluate('max(item)',0)")
f = t1.p3.dw_ppto.InsertRow(1)
t1.p3.dw_ppto.SetItem(f,'ano',t1.p1.dw_concab.GetItemNumber(1,'ano'))
t1.p3.dw_ppto.SetItem(f,'ncontrato',t1.p1.dw_concab.GetItemNumber(1,'ncontrato'))
t1.p3.dw_ppto.SetItem(f,'otrosi',t1.p1.dw_concab.GetItemNumber(1,'otrosi'))
t1.p3.dw_ppto.SetItem(f,'item',long(valor) + 1)
t1.p3.dw_ppto.SetItem(f,'usuario',usuario)

Return f

end event

event rowfocuschanged;mle_1.Text = ''
if currentrow = 0 or RowCount() = 0 then Return
mle_1.Text = GetItemString(GetRow(),'objeto')

end event

type p4 from userobject within t1
integer x = 18
integer y = 112
integer width = 4146
integer height = 1392
long backcolor = 67108864
string text = "Ordenes de Compra"
long tabtextcolor = 33554432
string picturename = "ordenar.ico"
long picturemaskcolor = 536870912
pb_del_oc pb_del_oc
pb_add_oc pb_add_oc
dw_oc dw_oc
end type

on p4.create
this.pb_del_oc=create pb_del_oc
this.pb_add_oc=create pb_add_oc
this.dw_oc=create dw_oc
this.Control[]={this.pb_del_oc,&
this.pb_add_oc,&
this.dw_oc}
end on

on p4.destroy
destroy(this.pb_del_oc)
destroy(this.pb_add_oc)
destroy(this.dw_oc)
end on

type pb_del_oc from picturebutton within p4
event mousemove pbm_mousemove
string tag = "Borrar Registro"
integer x = 3913
integer y = 224
integer width = 146
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Rubro"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messagebox('Error','El documento ya ha sido cerrado')
	Return
end if

if dw_oc.RowCount() = 0 then Return
dw_oc.DeleteRow(dw_oc.GetRow())
do while t1.p3.dw_ppto.RowCount() > 0
	t1.p3.dw_ppto.DeleteRow(1)
loop

int i, j
uo_datastore dw_fr
dw_fr = Create uo_datastore
dw_fr.DataObject = 'dw_flujo_2s1n'
dw_fr.SetTransObject(SQLCA)

for i = 1 to dw_oc.RowCount()
	if dw_oc.GetItemString(i,'cod_flujo') = 'OCPDISCT' then
		dw_fr.Retrieve(dw_oc.GetItemString(i,'cod_flujo'),dw_oc.GetItemString(i,'coddocu'),dw_oc.GetItemString(i,'clugar'),dw_oc.GetItemNumber(i,'numdoc'))
		for j = 1 to dw_fr.RowCount()
			if t1.p3.dw_ppto.Find("coddoc_dispo='"+dw_fr.GetItemString(j,'char_orig1') +"' and clugar_dispo='" + &
				dw_fr.GetItemString(j,'char_orig2') + "' and numdoc_dispo=" + string(dw_fr.GetItemNumber(j,'num_orig1')) &
				,1,t1.p3.dw_ppto.RowCount()) = 0 then
				t1.p3.dw_ppto.TriggerEvent("InsertaFila")
				t1.p3.dw_ppto.SetItem(1,'coddoc_dispo',dw_fr.GetItemString(j,'char_orig1'))
				t1.p3.dw_ppto.SetItem(1,'clugar_dispo',dw_fr.GetItemString(j,'char_orig2'))
				t1.p3.dw_ppto.SetItem(1,'numdoc_dispo',dw_fr.GetItemNumber(j,'num_orig1'))
				t1.p3.dw_ppto.SetItem(1,'monto',dw_fr.GetItemNumber(j,'valor'))
			end if
		next
	end if
next

cambio = TRUE

end event

type pb_add_oc from picturebutton within p4
event mousemove pbm_mousemove
string tag = "Adicionar"
integer x = 3913
integer y = 96
integer width = 146
integer height = 128
integer taborder = 15
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Buscar"
end type

event clicked;If dw_cab.RowCount() = 0 then Return
string valor
long fila

if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') <> '0' then
	messageBox('Aviso','El documento ya ha sido cerrado. No puede modificarse')
	Return
end if
if isNull(t1.p1.dw_concab.GetItemString(t1.p1.dw_concab.Getrow(),'coddoc')) then
	MessageBox('Atención','Debe seleccionar el tipo de documento')
	Return -1
end if

st_interfaz st_parm
if not isNull(t1.p1.dw_concab.GetItemString(t1.p1.dw_concab.GetRow(),'documento')) then
	st_parm.filtro = "documento='" + t1.p1.dw_concab.GetItemString(t1.p1.dw_concab.GetRow(),'documento') + "' and (estado = '1' or estado='3') and (isNull(ncontrato))"
else
	st_parm.filtro = "(estado='1' or estado='3') and (isNull(ncontrato))"
end if
st_parm.dw_obj = dw_oc
st_parm.dw_cab = t1.p1.dw_concab
openwithparm(w_chooseoc, st_parm)

// Interfaz Disp - Orden Compra - Contrato - Reserva
// para asignar la diponibilidad a partir de la Orden de Compra
int i, j, f
uo_datastore dw_fr, dw_obra
dw_fr = Create uo_datastore
dw_fr.DataObject = 'dw_flujo_2s1n'
dw_fr.SetTransObject(SQLCA)
dw_obra = Create uo_datastore
dw_obra.DataObject = 'dw_orden_obra'
dw_obra.SetTransObject(SQLCA)

for i = 1 to dw_oc.RowCount()
	if dw_oc.GetItemString(i,'cod_flujo') = 'OCPDISCT' or dw_oc.GetItemString(i,'cod_flujo') = 'OCPRSCT' then
		dw_fr.Retrieve(dw_oc.GetItemString(i,'cod_flujo'),dw_oc.GetItemString(i,'coddoc'),dw_oc.GetItemString(i,'clugar'),dw_oc.GetItemNumber(i,'numdoc'))
		for j = 1 to dw_fr.RowCount()
			if t1.p3.dw_ppto.Find("coddoc_dispo='"+dw_fr.GetItemString(j,'char_orig1') +"' and clugar_dispo='" + &
				dw_fr.GetItemString(j,'char_orig2') + "' and numdoc_dispo=" + string(dw_fr.GetItemNumber(j,'num_orig1')) +&
				" and item_dispo="+string(dw_fr.GetItemNumber(j,'num_orig2')),1,t1.p3.dw_ppto.RowCount()) = 0 then
				t1.p3.dw_ppto.TriggerEvent("InsertaFila")
				t1.p3.dw_ppto.SetItem(1,'coddoc_dispo',dw_fr.GetItemString(j,'char_orig1'))
				t1.p3.dw_ppto.SetItem(1,'clugar_dispo',dw_fr.GetItemString(j,'char_orig2'))
				t1.p3.dw_ppto.SetItem(1,'numdoc_dispo',dw_fr.GetItemNumber(j,'num_orig1'))
				t1.p3.dw_ppto.SetItem(1,'item_dispo',dw_fr.GetItemNumber(j,'num_orig2'))
				t1.p3.dw_ppto.SetItem(1,'monto',dw_fr.GetItemNumber(j,'valor'))
			end if
		next
//	elseif dw_oc.GetItemString(i,'cod_flujo') = 'OCPRSCT' then
//		dw_fr.Retrieve(dw_oc.GetItemString(i,'cod_flujo'),dw_oc.GetItemString(i,'coddoc'),dw_oc.GetItemString(i,'clugar'),dw_oc.GetItemNumber(i,'numdoc'))
//		for j = 1 to dw_fr.RowCount()
//			if t1.p3.dw_ppto.Find("coddoc_reser='"+dw_fr.GetItemString(j,'char_orig1') +"' and clugar_reser='" + &
//				dw_fr.GetItemString(j,'char_orig2') + "' and numdoc_reser=" + string(dw_fr.GetItemNumber(j,'num_orig1')) &
//				,1,t1.p3.dw_ppto.RowCount()) = 0 then
//				t1.p3.dw_ppto.TriggerEvent("InsertaFila")
//				t1.p3.dw_ppto.SetItem(1,'coddoc_reser',dw_fr.GetItemString(j,'char_orig1'))
//				t1.p3.dw_ppto.SetItem(1,'clugar_reser',dw_fr.GetItemString(j,'char_orig2'))
//				t1.p3.dw_ppto.SetItem(1,'numdoc_reser',dw_fr.GetItemNumber(j,'num_orig1'))
//				t1.p3.dw_ppto.SetItem(1,'monto',dw_fr.GetItemNumber(j,'valor'))
//			end if
//		next		
	end if

	dw_obra.Retrieve(dw_oc.GetItemString(i,'coddoc'),dw_oc.GetItemString(i,'clugar'),dw_oc.GetItemNumber(i,'numdoc'))
	if dw_obra.RowCount() > 0 then
		f = t1.p2.dw_fpago.Find("tipo_pago='S'",1,t1.p2.dw_fpago.RowCount())
		if f = 0 then
			f = t1.p2.pb_2.Event clicked()
			t1.p2.dw_fpago.SetItem(f,'tipo_pago','S')
			t1.p2.dw_fpago.SetItem(f,'des_pago','Entrega a satisfacción - Orden de Compra')
			t1.p2.dw_fpago.SetItem(f,'monto',dec(dw_obra.Describe("Evaluate('sum(monto)',0)")))
		end if
		t1.p2.dw_fpago.ScrolltoRow(f)
	end if
	for j = 1 to dw_obra.RowCount()
		f = t1.pb.dw_ob.Find("des_obra='"+dw_obra.GetItemString(j,'des_obra')+"'",1,t1.pb.dw_ob.RowCount())
		if f > 0 then Continue
		f = t1.pb.pb_16.Event Clicked()
		t1.pb.dw_ob.SetItem(f,'monto',dw_obra.GetItemNumber(j,'monto'))
		t1.pb.dw_ob.SetItem(f,'cod_impu',dw_obra.GetItemString(j,'cod_impu'))
		t1.pb.dw_ob.SetItem(f,'iva',dw_obra.GetItemNumber(j,'iva'))
		t1.pb.dw_ob.SetItem(f,'fecha_entrega',dw_obra.GetItemDateTime(j,'fecha_entrega'))
		t1.pb.dw_ob.SetItem(f,'fecha_satisfaccion',dw_obra.GetItemDateTime(j,'fecha_satisfaccion'))
		t1.pb.dw_ob.SetItem(f,'satisfaccion',dw_obra.GetItemString(j,'satisfaccion'))
		t1.pb.dw_ob.SetItem(f,'des_obra',dw_obra.GetItemString(j,'des_obra'))
		t1.pb.mle_2.Text = dw_obra.GetItemString(j,'des_obra')
	next

next

end event

type dw_oc from datawindow within p4
event type long insertafila ( long fila )
event actmonto ( )
integer x = 82
integer y = 100
integer width = 3730
integer height = 1268
integer taborder = 10
string title = "none"
string dataobject = "dw_contra_ordenc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type long insertafila(long fila);long f

f = this.InsertRow(1)
this.SetItem(f,'ano',t1.p1.dw_concab.GetItemNumber(1,'ano'))
this.SetItem(f,'ncontrato',t1.p1.dw_concab.GetItemNumber(1,'ncontrato'))
this.SetItem(f,'otrosi',t1.p1.dw_concab.GetItemNumber(1,'otrosi'))
this.SetItem(f,'usuario',usuario)

Return f

end event

event actmonto();dec monto1, monto2
int i
if t1.pb.dw_ob.RowCount() > 0 then
	monto1 = t1.pb.dw_ob.GetItemNumber(t1.pb.dw_ob.GetRow(),'t_monto') + t1.pb.dw_ob.GetItemNumber(t1.pb.dw_ob.GetRow(),'t_iva')
	if isNull(monto1) then monto1= 0
end if
if t1.p4.dw_oc.RowCount() > 0 then
	monto2 = t1.p4.dw_oc.GetItemNumber(1,'compute_1')
	if isNull(monto2) then monto2= 0
end if

t1.p1.dw_concab.SetItem(1,'monto',monto1 + monto2)
for i = 1 to t1.p2.dw_fpago.RowCount()
	t1.p2.dw_fpago.SetItem(i,'total',monto1 + monto2)
next

end event

event sqlpreview;if sqltype = PreviewDelete! then
	string stx
	long ps
	ps = pos(upper(sqlsyntax),'WHERE') 
	if ps > 0 then
		stx = mid(upper(sqlsyntax),ps)
		stx = "Update sum_mvto_cab set ano=NULL, ncontrato=NULL, otrosi=NULL "+stx
		SetSQLPreview(stx)
	else
		Return 2
	end if
end if

end event

type p2 from userobject within t1
integer x = 18
integer y = 112
integer width = 4146
integer height = 1392
long backcolor = 67108864
string text = "Actas"
long tabtextcolor = 33554432
string picturename = "Calculator.ico"
long picturemaskcolor = 536870912
pb_acta pb_acta
st_4 st_4
pb_g pb_g
pb_15 pb_15
dw_ent dw_ent
pb_autoriza pb_autoriza
pb_3 pb_3
pb_2 pb_2
st_1 st_1
dw_fpago dw_fpago
pb_21 pb_21
end type

on p2.create
this.pb_acta=create pb_acta
this.st_4=create st_4
this.pb_g=create pb_g
this.pb_15=create pb_15
this.dw_ent=create dw_ent
this.pb_autoriza=create pb_autoriza
this.pb_3=create pb_3
this.pb_2=create pb_2
this.st_1=create st_1
this.dw_fpago=create dw_fpago
this.pb_21=create pb_21
this.Control[]={this.pb_acta,&
this.st_4,&
this.pb_g,&
this.pb_15,&
this.dw_ent,&
this.pb_autoriza,&
this.pb_3,&
this.pb_2,&
this.st_1,&
this.dw_fpago,&
this.pb_21}
end on

on p2.destroy
destroy(this.pb_acta)
destroy(this.st_4)
destroy(this.pb_g)
destroy(this.pb_15)
destroy(this.dw_ent)
destroy(this.pb_autoriza)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.st_1)
destroy(this.dw_fpago)
destroy(this.pb_21)
end on

type pb_acta from picturebutton within p2
event mousemove pbm_mousemove
integer x = 3927
integer y = 32
integer width = 146
integer height = 128
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "contrato.gif"
string disabledname = "d_contrato.gif"
alignment htextalign = left!
string powertiptext = "Acta"
end type

event clicked;if dw_fpago.RowCount() = 0 then Return 0
if dw_fpago.GetItemNumber(dw_fpago.GetRow(),'nuevo') = 1 then
	MessageBox('Atención','La forma de pago no ha sido guardada. Debe grabarla primero')
	Return -1
end if
st_contrato st_p
st_p.ano = t1.p1.dw_concab.GetItemNumber(1,'ano')
st_p.ncontrato = t1.p1.dw_concab.GetItemNumber(1,'ncontrato')
st_p.otrosi = t1.p1.dw_concab.GetItemNumber(1,'otrosi')
st_p.coddoc = t1.p1.dw_concab.GetItemString(1,'coddoc')
st_p.fpago = t1.p2.dw_fpago.GetItemNumber(t1.p2.dw_fpago.GetRow(),'item')
if dw_fpago.GetItemString(dw_fpago.GetRow(),'autorizado') = '1' then
	st_p.DisplayOnly = TRUE
	MessageBox('Atención','La forma de pago ya ha sido autorizada. No podrá guardar los cambios')
else
	st_p.DisplayOnly = FALSE
end if
opensheetwithparm(w_rte,st_p,w_principal)

end event

type st_4 from statictext within p2
integer x = 3099
integer y = 924
integer width = 1010
integer height = 380
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Autorización de pagos: Si tipo pago es CONTRA ENTREGA o PAGO FINAL, el sistema solicitará asociar la entrada de productos. Para Pagos Finales se autoriza y se establece como entregado en la ficha Mano de Obra (si la hay)"
boolean focusrectangle = false
end type

type pb_g from picturebutton within p2
event mousemove pbm_mousemove
string tag = "Sugerir Plan"
integer x = 3931
integer y = 168
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
string powertiptext = "Guardar formas de pago"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
long i

if dw_fpago.GetNextModified(0,Primary!) > 0 then
	if MessageBox('Atención','Desea guardar los cambios de Actas?. No podrá modificarlos',QUESTION!,YESNO!) = 2 then Return 0
else
	Return 0
end if

if dw_fpago.Update() = -1 then
	Rollback;
	Return -1
end if
for i = 1 to dw_fpago.RowCount()
	if dw_fpago.GetItemNumber(i,'nuevo') = 1 then dw_fpago.SetItem(i,'nuevo',0)
next
dw_fpago.ResetUpdate()
commit;
Return 0

end event

type pb_15 from picturebutton within p2
event mousemove pbm_mousemove
string tag = "Borrar Registro"
integer x = 3090
integer y = 736
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Fila"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
//if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
//	messagebox('Error','El documento ya ha sido cerrado')
//	Return
//end if
if dw_fpago.GetItemString(dw_fpago.GetRow(),'autorizado') = '1' then
	MessageBox('Atención','El pago ya está autorizado')
	Return
end if
if dw_ent.RowCount() = 0 then Return
if dw_ent.GetItemStatus(dw_ent.GetRow(),0,Primary!) = NewModified! then
	dw_ent.DeleteRow(dw_ent.GetRow())
else
	if messageBox('Atención','Se Retirará la relación de la forma de pago con la entrada en suministros. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return
	long vnul
	SetNull(vnul)
	dw_ent.SetItem(dw_ent.GetRow(),'ano',vnul)
	dw_ent.SetItem(dw_ent.GetRow(),'ncontrato',vnul)
	dw_ent.SetItem(dw_ent.GetRow(),'otrosi',vnul)
	dw_ent.SetItem(dw_ent.GetRow(),'item_fpago',vnul)
	if dw_ent.Update() = -1 then
		MessageBox('Atención','Error eliminando datos de contrato en entrada')
		rollback;
		Return -1
	end if
	dw_fpago.TriggerEvent(RowFocusChanged!)
end if

cambio = TRUE

end event

type dw_ent from datawindow within p2
event type integer insertafila ( )
integer x = 46
integer y = 756
integer width = 3013
integer height = 596
integer taborder = 50
string title = "none"
string dataobject = "dw_fpago_ent"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type integer insertafila();long f

f = InsertRow(1)
SetItem(f,'ano_contrato',t1.p1.dw_concab.GetItemNumber(1,'ano'))
SetItem(f,'ncontrato',t1.p1.dw_concab.GetItemNumber(1,'ncontrato'))
SetItem(f,'otrosi',t1.p1.dw_concab.GetItemNumber(1,'otrosi'))
SetItem(f,'item_fpago',t1.p2.dw_fpago.GetItemNumber(GetRow(),'item'))

Return f

end event

event constructor;SetTransObject(SQLCA)
end event

type pb_autoriza from picturebutton within p2
event mousemove pbm_mousemove
integer x = 3771
integer y = 300
integer width = 151
integer height = 132
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "factura.gif"
string disabledname = "d_factura.gif"
string powertiptext = "Autorizar Recepción para pago"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_fpago.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') <> '1' then
	messageBox('Aviso','El documento no esta vigente. No puede autorizarse')
	Return
end if
//if dw_fpago.GetItemString(dw_fpago.GetRow(),'autorizado') = '1' then
//	if dw_fpago.GetItemStatus(dw_fpago.GetRow(),'autorizado',Primary!) = DataModified! then
//		dw_fpago.SetItem(dw_fpago.GetRow(),'autorizado','0')
//	end if
//end if
if dw_fpago.GetItemNumber(dw_fpago.GetRow(),'nuevo') = 1 then
	if dw_fpago.Update() = -1 then
		Rollback;
		Return -1
	end if
end if
string tp
tp = dw_fpago.GetItemString(dw_fpago.GetRow(),'tipo_pago')
// OJO HABILITARLO
if f_sol_permiso(this,t1.p1.dw_concab.GetItemString(t1.p1.dw_concab.GetRow(),'coddoc')) <> 1 then Return

//if coddocumento = 'SCT' and (tp='E' or tp='F') then
if t1.p1.dw_concab.GetItemString(t1.p1.dw_concab.GetRow(),'coddoc') = 'SCT' and (tp='E' or tp='F') then
	st_interfaz st_parm
	string doc
	doc = t1.p1.dw_concab.GetItemString(t1.p1.dw_concab.GetRow(),'documento')
	if not isNull(doc) then
		st_parm.filtro = "estado = '1' and documento='" + doc + "'"
	else
		st_parm.filtro = ""
	end if

	st_parm.dw_obj = dw_ent
	st_parm.dw_cab = t1.p1.dw_concab
	st_parm.dw_ter = t1.p2.dw_fpago // para establecer Autorización
	openwithparm(w_chooseEnt, st_parm)
	//	if coddocumento = 'SCT' and tp='S' then	
elseif t1.p1.dw_concab.GetItemString(t1.p1.dw_concab.GetRow(),'coddoc') = 'SCT' and tp='S' then	
	int i
	for i = 1 to t1.pb.dw_ob.RowCount()
		t1.pb.dw_ob.SetItem(i,'satisfaccion','1')
		t1.pb.dw_ob.SetItem(i,'fecha_satisfaccion',today())
	next
	dw_fpago.SetItem(dw_fpago.GetRow(),'autorizado','1')
	if t1.pb.dw_ob.Update() = -1 then
		rollback;
		Return -1
	end if

else
	dw_fpago.SetItem(dw_fpago.GetRow(),'autorizado','1')
end if
if dw_fpago.Update() = -1 then
	rollback;
	Return -1
end if

commit;

end event

type pb_3 from picturebutton within p2
event mousemove pbm_mousemove
string tag = "Borrar Registro"
integer x = 3771
integer y = 168
integer width = 146
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Rubro"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '2' then
	messagebox('Error','El documento ya ha sido cerrado')
	Return
end if
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '1' then
	if dw_fpago.GetItemNumber(dw_fpago.Getrow(),'nuevo') = 0 then
		MessageBox('Atención','Solo se pueden borrar registros nuevos')
		Return -1
	end if
end if
if dw_fpago.RowCount() = 0 then Return
do while t1.pb.dw_ob.RowCount() > 0 
	t1.pb.dw_ob.DeleteRow(1)
loop
dw_fpago.DeleteRow(dw_fpago.GetRow())
cambio = TRUE

end event

type pb_2 from picturebutton within p2
event mousemove pbm_mousemove
integer x = 3771
integer y = 32
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Adicionar"
end type

event clicked;If dw_cab.RowCount() = 0 then Return
string valor
long fila
if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') = '2' then
	messageBox('Aviso','El documento ya ha sido cerrado. No puede modificarse')
	Return
end if
valor = dw_fpago.Describe("Evaluate('max(item)',0)")
fila = dw_fpago.InsertRow(0)
dw_fpago.SetItem(fila,'ano',t1.p1.dw_concab.GetItemNumber(1,'ano'))
dw_fpago.SetItem(fila,'ncontrato',t1.p1.dw_concab.GetItemNumber(1,'ncontrato'))
dw_fpago.SetItem(fila,'otrosi',t1.p1.dw_concab.GetItemNumber(1,'otrosi'))
dw_fpago.SetItem(fila,'item',long(valor) + 1)
dw_fpago.SetItem(fila,'fecha',today())
dw_fpago.SetItem(fila,'total',t1.p1.dw_concab.GetItemNumber(1,'monto'))
dw_fpago.SetItem(fila,'nuevo',1)
dw_fpago.SetItem(fila,'usuario',usuario)
dw_fpago.ScrolltoRow(fila)
dw_fpago.TriggerEvent(rowFocusChanged!)
if codDocumento = 'NC' then
	
end if
Return fila

end event

type st_1 from statictext within p2
integer x = 50
integer y = 684
integer width = 558
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Productos de Entradas"
boolean focusrectangle = false
end type

type dw_fpago from datawindow within p2
integer x = 32
integer y = 36
integer width = 3698
integer height = 652
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_formapago"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;long f, p
string ant

if GetColumnName() = 'porcentaje' then
	f = GetRow()
	p = GetItemNumber(f,'porcentaje')
	if double(Describe("Evaluate('sum(if(getrow()=currentrow(),0,porcentaje))',0)"))+double(data) > 100 then
		MessageBox('Error','Sobrepasa el 100 %')
		SetText(string(p))
		SetItem(f,'porcentaje',p)
		Return 2
	end if
	
	if AcceptText() = -1 then Return
	SetItem(f,'monto',round(GetItemNumber(f,'total') * GetItemNumber(f,'porcentaje') / 100,0))
elseif GetColumnName() = 'monto' then
	if AcceptText() = -1 then Return
	if GetItemNumber(GetRow(),'total') > 0 then
		SetItem(Getrow(),'porcentaje',round((GetItemNumber(GetRow(),'monto')/GetItemNumber(GetRow(),'total'))*100,2))
	end if
elseif GetColumnName() = 'tipo_pago' then
	ant = GetItemString(GetRow(),'tipo_pago')
	if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '1' and GetItemNumber(GetRow(),'nuevo') = 0 then
		SetItem(GetRow(),'tipo_pago',ant)
		SetText(ant)
		Return 2
	end if
end if

if isNull(t1.p1.dw_concab.GetItemNumber(1,'monto')) then
	t1.p1.dw_concab.SetItem(1,'monto',GetItemNumber(GetRow(),'compute_1'))
end if

end event

event retrieveend;long i
if rowcount() = 0 or rowcount = 0 then Return
if t1.p1.dw_concab.RowCount() > 0 then
	for i = 1 to RowCount()
		SetItem(i,'total',t1.p1.dw_concab.GetItemNumber(1,'monto'))
	next
end if
if isNull(t1.p1.dw_concab.GetItemNumber(1,'monto')) or t1.p1.dw_concab.GetItemNumber(1,'monto') = 0 then Return
for i = 1 to RowCount()
	SetItem(i,'porcentaje',round((GetItemNumber(i,'monto') / GetItemNumber(i,'total')) * 100,2))
next

end event

event rowfocuschanged;dw_ent.Reset()
t1.pb.st_fp.Text = ''
if RowCount() = 0 or currentrow = 0 then Return
int f
f = GetRow()
if isNull(GetItemNumber(f,'ano')) then return
if dw_cab.GetItemString(dw_cab.GetRow(),'coddoc') = 'SCT' then
	dw_ent.Retrieve(GetItemNumber(f,'ano'),GetItemNumber(f,'ncontrato'),GetItemNumber(f,'otrosi'),GetItemNumber(f,'item'))
end if
t1.pb.st_fp.Text = GetItemString(GetRow(),'des_pago')

if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '1' then
	if GetItemNumber(GetRow(),'nuevo') = 1 then
		t1.p2.dw_fpago.Modify('monto.edit.DisplayOnly=NO porcentaje.edit.DisplayOnly=NO des_pago.edit.DisplayOnly=no ')
	else
		t1.p2.dw_fpago.Modify("monto.edit.DisplayOnly=Yes porcentaje.edit.DisplayOnly=yes des_pago.edit.DisplayOnly=yes")
	end if
end if

end event

type pb_21 from picturebutton within p2
event mousemove pbm_mousemove
string tag = "Sugerir Plan"
integer x = 3771
integer y = 436
integer width = 151
integer height = 132
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "calculator.gif"
string disabledname = "d_calculator.gif"
string powertiptext = "Sugerir Plan"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messagebox('Error','El documento ya ha sido cerrado')
	Return
end if
st_otrosi st_p
st_p.dw_cab = t1.p1.dw_concab
st_p.dw_obj = t1.p2.dw_fpago
openwithparm(w_calfpago,st_p)

end event

type pb from userobject within t1
integer x = 18
integer y = 112
integer width = 4146
integer height = 1392
long backcolor = 67108864
string text = "Mano de Obra"
long tabtextcolor = 33554432
string picturename = "medico.ico"
long picturemaskcolor = 536870912
st_fp st_fp
st_3 st_3
pb_17 pb_17
pb_16 pb_16
dw_ob dw_ob
mle_2 mle_2
end type

on pb.create
this.st_fp=create st_fp
this.st_3=create st_3
this.pb_17=create pb_17
this.pb_16=create pb_16
this.dw_ob=create dw_ob
this.mle_2=create mle_2
this.Control[]={this.st_fp,&
this.st_3,&
this.pb_17,&
this.pb_16,&
this.dw_ob,&
this.mle_2}
end on

on pb.destroy
destroy(this.st_fp)
destroy(this.st_3)
destroy(this.pb_17)
destroy(this.pb_16)
destroy(this.dw_ob)
destroy(this.mle_2)
end on

type st_fp from statictext within pb
integer x = 101
integer width = 827
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_3 from statictext within pb
integer x = 105
integer y = 524
integer width = 398
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Descripción"
boolean focusrectangle = false
end type

type pb_17 from picturebutton within pb
event mousemove pbm_mousemove
string tag = "Borrar Registro"
integer x = 2999
integer y = 192
integer width = 142
integer height = 124
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Rubro"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messagebox('Error','El documento ya ha sido cerrado')
	Return
end if

if dw_ob.RowCount() = 0 then Return
dw_ob.DeleteRow(dw_ob.GetRow())
cambio = TRUE

end event

type pb_16 from picturebutton within pb
event mousemove pbm_mousemove
integer x = 2999
integer y = 64
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Adicionar"
end type

event clicked;If dw_cab.RowCount() = 0 then Return
string valor
long fila
if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') <> '0' then
	messageBox('Aviso','El documento ya ha sido cerrado. No puede modificarse')
	Return
end if
if t1.p2.dw_fpago.RowCount() = 0 then 
		messageBox('Aviso','Solo se adicionan registros para formas de pago que sean del tipo Entrega a Satisfacción')
	Return
end if

if not t1.p2.dw_fpago.GetItemString(t1.p2.dw_fpago.GetRow(),'tipo_pago') = 'S' then
	messageBox('Aviso','Solo se adicionan registros para formas de pago que sean del tipo Entrega a Satisfacción')
	Return
end if
valor = dw_ob.Describe("Evaluate('max(nobra)',0)")
fila = dw_ob.InsertRow(0)
dw_ob.SetItem(fila,'ano',t1.p1.dw_concab.GetItemNumber(1,'ano'))
dw_ob.SetItem(fila,'ncontrato',t1.p1.dw_concab.GetItemNumber(1,'ncontrato'))
dw_ob.SetItem(fila,'otrosi',t1.p1.dw_concab.GetItemNumber(1,'otrosi'))
dw_ob.SetItem(fila,'item',t1.p2.dw_fpago.GetItemNumber(t1.p2.dw_fpago.GetRow(),'item'))
dw_ob.SetItem(fila,'nobra',long(valor) + 1)
dw_ob.ScrolltoRow(fila)
Return fila

end event

type dw_ob from datawindow within pb
integer x = 101
integer y = 64
integer width = 2853
integer height = 448
integer taborder = 40
string title = "none"
string dataobject = "dw_contra_obra"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;mle_2.Text = ''
if RowCount() = 0 or currentrow = 0 then Return
mle_2.Text = GetItemString(GetRow(),'des_obra')

end event

event itemchanged;if GetColumnName() = 'cod_impu' then
	SetItem(GetRow(),'porcentaje',dwc_i.GetItemNumber(dwc_i.GetRow(),'porcentaje'))
	SetItem(GetRow(),'accion',dwc_i.GetItemString(dwc_i.GetRow(),'accion'))
end if
if not isNull(GetItemNumber(GetRow(),'monto')) and not isNull(GetItemNumber(GetRow(),'porcentaje')) then
	SetItem(Getrow(),'iva',(GetItemNumber(GetRow(),'monto')*GetItemNumber(GetRow(),'porcentaje'))/100 )
end if
//dec monto1=0, monto2=0
//monto1 = GetItemNumber(GetRow(),'t_monto') + GetItemNumber(GetRow(),'t_iva')
//if isNull(monto1) then monto1= 0
//if t1.p4.dw_oc.RowCount() > 0 then
//	monto2 = t1.p4.dw_oc.GetItemNumber(GetRow(),'t_valor')
//	if isNull(monto2) then monto2= 0
//end if

//t1.p1.dw_concab.SetItem(1,'monto',monto1 + monto2)
//int i
//for i = 1 to t1.p2.dw_fpago.RowCount()
//	t1.p2.dw_fpago.SetItem(i,'total',monto1 + monto2)
//next
//
end event

type mle_2 from multilineedit within pb
integer x = 105
integer y = 580
integer width = 3982
integer height = 764
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event modified;if dw_ob.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') <> '0' then
	messageBox('Aviso','El documento ya ha sido cerrado. No puede modificarse')
	Return
end if

dw_ob.SetItem(dw_ob.GetRow(),'des_obra',Text)
end event

type p5 from userobject within t1
integer x = 18
integer y = 112
integer width = 4146
integer height = 1392
long backcolor = 67108864
string text = "Modificaciones"
long tabtextcolor = 33554432
string picturename = "copiar.ico"
long picturemaskcolor = 536870912
pb_12 pb_12
dw_osi dw_osi
end type

on p5.create
this.pb_12=create pb_12
this.dw_osi=create dw_osi
this.Control[]={this.pb_12,&
this.dw_osi}
end on

on p5.destroy
destroy(this.pb_12)
destroy(this.dw_osi)
end on

type pb_12 from picturebutton within p5
event mousemove pbm_mousemove
string tag = "Insertar Otrosi"
integer x = 3959
integer y = 1172
integer width = 146
integer height = 128
integer taborder = 23
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Otrosi"
end type

event clicked;If dw_cab.RowCount() = 0 then Return
long f

if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') <> '1' then
	messageBox('Aviso','El documento no esta vigente.')
	Return
end if
st_otrosi st_p
st_p.dw_cab = t1.p1.dw_concab
st_p.dw_obj = dw_osi
st_p.dw_ppto=t1.p3.dw_ppto
st_p.coddoc = dw_cab.GetItemString(dw_cab.GetRow(),'coddoc')
if dw_osi.RowCount() = 0 then
	st_p.nuevo = TRUE
else
	f = dw_osi.find("estado='0'",1,dw_osi.RowCount())
	if f = 0 then
		st_p.nuevo = TRUE
	else
		dw_osi.ScrolltoRow(f)
		st_p.nuevo = FALSE
	end if
end if
openwithparm(w_contra_otrosi,st_p)
dw_cab.TriggerEvent(rowfocuschanged!)
if dw_cab.GetItemNumber(dw_cab.Getrow(),'monto') <> t1.p1.dw_concab.GetItemNumber(1,'monto') then
	dw_cab.SetItem(dw_cab.GetRow(),'monto',t1.p1.dw_concab.GetItemNumber(1,'monto'))
end if

end event

type dw_osi from datawindow within p5
integer x = 82
integer y = 52
integer width = 3854
integer height = 1260
integer taborder = 1
string title = "none"
string dataobject = "dw_contra_otrosi"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string col
col = this.getColumnName()
if this.AcceptText() = -1 then Return
choose case col
	case "inicia", "termina"
		if this.GetItemDateTime(this.GetRow(),'inicia') <> t1.p1.dw_concab.GetItemDateTime(1,'inicia') or &
			this.GetItemDateTime(this.GetRow(),'termina') <> t1.p1.dw_concab.GetItemDateTime(1,'termina') then
			this.SetItem(this.GetRow(),'indfecha','1')
		else
			this.SetItem(this.GetRow(),'indfecha','0')
		end if
	case "monto"
		if this.GetItemNumber(this.GetRow(),'monto') <> t1.p1.dw_concab.GetItemNumber(1,'monto') then
			this.SetItem(this.GetRow(),'indmonto','1')
		else
			this.SetItem(this.GetRow(),'indmonto','0')
		end if
	case "objeto"
		if this.GetItemString(this.GetRow(),'objeto') <> t1.p1.dw_concab.GetItemString(1,'objeto') then
			this.SetItem(this.GetRow(),'indobje','1')
		else
			this.SetItem(this.GetRow(),'indobje','0')
		end if
end choose

end event

event editchanged;if string(dwo.Name) = 'objeto' then
	this.acceptText()
end if

end event

event doubleclicked;if rowCount() = 0 then Return
if row < 1 then Return
st_otrosi st_p
st_p.dw_cab = dw_cab
st_p.dw_obj = dw_osi
st_p.coddoc = codDocumento

openwithparm(w_contra_otrosi,st_p)

end event

event constructor;SetTransObject(SQLCA)

end event

type p6 from userobject within t1
integer x = 18
integer y = 112
integer width = 4146
integer height = 1392
long backcolor = 67108864
string text = "Para Causación"
long tabtextcolor = 33554432
string picturename = "configura.ico"
long picturemaskcolor = 536870912
pb_13 pb_13
pb_10 pb_10
pb_9 pb_9
dw_causa dw_causa
end type

on p6.create
this.pb_13=create pb_13
this.pb_10=create pb_10
this.pb_9=create pb_9
this.dw_causa=create dw_causa
this.Control[]={this.pb_13,&
this.pb_10,&
this.pb_9,&
this.dw_causa}
end on

on p6.destroy
destroy(this.pb_13)
destroy(this.pb_10)
destroy(this.pb_9)
destroy(this.dw_causa)
end on

type pb_13 from picturebutton within p6
integer x = 3973
integer y = 320
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
alignment htextalign = left!
end type

event clicked;if dw_cab.RowCount() = 0 then Return
long i

//if dw_fpago.GetNextModified(0,Primary!) > 0 then
//	if MessageBox('Atención','Desea guardar los cambios de Actas?. No podrá modificarlos',QUESTION!,YESNO!) = 2 then Return 0
//else
//	Return 0
//end if

if dw_causa.Update() = -1 then
	Rollback;
	Return -1
end if
//for i = 1 to dw_fpago.RowCount()
//	if dw_fpago.GetItemNumber(i,'nuevo') = 1 then dw_fpago.SetItem(i,'nuevo',0)
//next
//dw_fpago.ResetUpdate()
commit;
Return 0

end event

type pb_10 from picturebutton within p6
integer x = 3973
integer y = 180
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '1' then
	if dw_causa.GetItemNumber(dw_causa.Getrow(),'nuevo') = 0 then
		MessageBox('Atención','Solo se pueden borrar registros nuevos')
		Return -1
	end if
end if
if dw_causa.RowCount() = 0 then Return
dw_causa.DeleteRow(dw_causa.GetRow())
cambio = TRUE
end event

type pb_9 from picturebutton within p6
integer x = 3973
integer y = 40
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
end type

event clicked;If dw_cab.RowCount() = 0 then Return
long fila
fila = dw_causa.InsertRow(0)
dw_causa.SetItem(fila,'ano',t1.p1.dw_concab.GetItemNumber(1,'ano'))
dw_causa.SetItem(fila,'ncontrato',t1.p1.dw_concab.GetItemNumber(1,'ncontrato'))
dw_causa.SetItem(fila,'otrosi',t1.p1.dw_concab.GetItemNumber(1,'otrosi'))
dw_causa.SetItem(fila,'nuevo',1)
dw_causa.SetItem(fila,'usuario',usuario)
dw_causa.ScrolltoRow(fila)
end event

type dw_causa from datawindow within p6
integer x = 41
integer y = 40
integer width = 3890
integer height = 1244
integer taborder = 40
string title = "none"
string dataobject = "dw_contra_causa"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
Getchild('cc',dwc_cc)
dwc_cc.SetTransObject(SQLCA)
getchild('cod_rel',idw_concep)
idw_concep.settransobject(sqlca)
end event

event retrieverow;this.SetItem(row,'cc',this.GetItemString(row,'descripcion'))
end event

event rowfocuschanged;if this.rowcount() < 1 or currentrow = 0 then Return
if not isNull(this.GetItemString(currentRow,'coduf')) then
	dwc_cc.SetFilter("coduf='" + this.GetItemString(currentRow,'ufuncional') + "'")
	dwc_cc.Filter()
end if
//idw_concep.retrieve(i_emp,'%','1')
end event

event itemchanged;if this.GetColumnName() = 'coduf' then
	dwc_cc.SetFilter("coduf='" + data + "'")
	dwc_cc.Filter()
elseif this.GetColumnName() = 'cc' then
	this.SetItem(row,'ccosto', dwc_cc.GetItemString(dwc_cc.GetRow(),'codcc'))
end if

end event

type dw_cab from datawindow within w_contratacion_org
event desecha ( )
integer x = 82
integer y = 80
integer width = 4197
integer height = 496
integer taborder = 10
string title = "none"
string dataobject = "dw_concabgrid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event desecha();if nuevo > 0 then
//	this.DeleteRow(nuevo)
	nuevo = 0
	cambio = FALSE
	this.Retrieve(coddocumento)
end if

end event

event rowfocuschanged;t1.p1.dw_concab.Reset()
t1.p2.dw_ent.Reset()
t1.p2.dw_fpago.Reset()
t1.p3.dw_ppto.Reset()
t1.p4.dw_oc.Reset()
t1.pb.dw_ob.Reset()
t1.p5.dw_osi.Reset()
t1.pp.dw_pol.Reset()
t1.pp.dw_req.Reset()
t1.pp.mle_p.DisplayOnly = TRUE

long fila
if this.RowCount() = 0 or currentrow = 0 then Return
//dwc_f.SetFilter("cod_vent='"+GetItemString(Getrow(),'coddoc')+"'")
//dwc_f.Filter()

t1.p1.dw_concab.Retrieve(this.GetItemNumber(this.GetRow(),'ano'), this.GetItemNumber(this.GetRow(),'ncontrato'),this.GetItemNumber(this.GetRow(),'otrosi'))
if GetItemString(this.GetRow(),'coddoc') = 'SCT' then
	t1.p2.dw_ent.Visible = TRUE
	t1.p2.pb_15.Visible = TRUE
	t1.p2.dw_fpago.Height = 456
	t1.p2.st_4.Visible = TRUE
//	t1.p4.Visible = TRUE
else
	t1.p2.dw_ent.Visible = FALSE
	t1.p2.pb_15.Visible = FALSE
	t1.p2.dw_fpago.Height = 900
	t1.p2.st_4.Visible = FALSE
//	t1.p4.Visible = FALSE
end if

fila = dwc_f.Find("codigo='"+ GetItemString(GetRow(),'cod_flujo') +"'",1,dwc_f.RowCount())
if fila > 0 then
	if dwc_f.GetItemString(fila,'cod_orig') = 'PDI' or dwc_f.GetItemString(fila,'cod_orig') = 'PR' then
		t1.p3.pb_add_ppto.Enabled = TRUE
		t1.p3.pb_del_ppto.Enabled = TRUE
		t1.p4.pb_add_oc.Enabled = FALSE
		t1.p4.pb_del_oc.Enabled = FALSE
	elseif dwc_f.GetItemString(fila,'cod_orig') = 'OC' then
		t1.p3.pb_add_ppto.Enabled = FALSE
		t1.p3.pb_del_ppto.Enabled = FALSE
		t1.p4.pb_add_oc.Enabled = TRUE
		t1.p4.pb_del_oc.Enabled = TRUE
	end if
end if
if dwc_t.Retrieve(GetItemString(this.GetRow(),'coddoc')) = 0 then
	dwc_t.InsertRow(0)
end if
t1.p2.dw_fpago.Retrieve(this.GetItemNumber(this.GetRow(),'ano'), this.GetItemNumber(this.GetRow(),'ncontrato'),this.GetItemNumber(this.GetRow(),'otrosi'))
t1.p3.dw_ppto.Retrieve(this.GetItemNumber(this.GetRow(),'ano'), this.GetItemNumber(this.GetRow(),'ncontrato'),this.GetItemNumber(this.GetRow(),'otrosi'))
if GetItemString(GetRow(),'coddoc') ='SCT' then
	t1.p4.dw_oc.Retrieve(this.GetItemNumber(this.GetRow(),'ano'), this.GetItemNumber(this.GetRow(),'ncontrato'),this.GetItemNumber(this.GetRow(),'otrosi'))
end if
t1.p5.dw_osi.Retrieve(this.GetItemNumber(this.GetRow(),'ano'), this.GetItemNumber(this.GetRow(),'ncontrato'))
t1.pb.dw_ob.Retrieve(this.GetItemNumber(this.GetRow(),'ano'), this.GetItemNumber(this.GetRow(),'ncontrato'),this.GetItemNumber(this.GetRow(),'otrosi'))
t1.pp.dw_pol.Retrieve(this.GetItemNumber(this.GetRow(),'ano'), this.GetItemNumber(this.GetRow(),'ncontrato'),this.GetItemNumber(this.GetRow(),'otrosi'))
t1.pp.dw_req.Retrieve(this.GetItemNumber(this.GetRow(),'ano'), this.GetItemNumber(this.GetRow(),'ncontrato'),this.GetItemNumber(this.GetRow(),'otrosi'))
if GetItemString(GetRow(),'estado') = '1' then
	t1.p2.dw_fpago.Modify("monto.edit.DisplayOnly=Yes porcentaje.edit.DisplayOnly=yes des_pago.edit.DisplayOnly=yes fecha.edit.DisplayOnly=TRUE fecha_hasta.edit.DisplayOnly=TRUE")
	t1.p2.pb_g.Visible = TRUE
	t1.pp.pb_leg.Visible = TRUE
	t1.p2.pb_21.Visible = FALSE
else
	t1.p2.dw_fpago.Modify("monto.edit.DisplayOnly=NO porcentaje.edit.DisplayOnly=NO des_pago.edit.DisplayOnly=no fecha.editmask.ddcalendar=yes  fecha.editmask.mask='dd/mm/yyyy' fecha.editmask.focusrectangle=no fecha_hasta.editmask.ddcalendar=yes fecha_hasta.editmask.mask='dd/mm/yyyy' fecha_hasta.editmask.focusrectangle=no  ")
	t1.p2.pb_g.Visible = FALSE
	t1.pp.pb_leg.Visible = FALSE
	t1.p2.pb_21.Visible = TRUE
end if
if t1.p3.dw_ppto.rowcount()>0 and  t1.p3.dw_ppto.GetItemnumber(t1.p3.dw_ppto.GetRow(),'total_utilizado')<>0 and t1.p3.dw_ppto.GetItemnumber(t1.p3.dw_ppto.GetRow(),'total_utilizado') <> dw_cab.GetItemNumber(dw_cab.GetRow(),'monto') then
	messageBox('Aviso','Ha hecho modificaciones a la Reserva debe hacer modificación al Contrato')
end if
if t1.p3.dw_ppto.rowcount()>0 and  t1.p3.dw_ppto.GetItemnumber(t1.p3.dw_ppto.GetRow(),'total_utilizado')<>0 and t1.p3.dw_ppto.GetItemnumber(t1.p3.dw_ppto.GetRow(),'total_utilizado') <> t1.p3.dw_ppto.GetItemnumber(t1.p3.dw_ppto.GetRow(),'total') then
	messageBox('Aviso','Ha hecho modificaciones al Contrato debe hacerlas en la Disponibilidad')
end if
idw_concep.retrieve(i_emp,'R','1')
end event

event clicked;if row = 0 then Return
if this.GetRow() <> row then
	this.SetRow(row)
end if


end event

event rowfocuschanging;if currentRow = nuevo and nuevo > 0 then 
	if messageBox('Aviso','El documento nuevo no ha sido guardado, perderá los cambios. Desea continuar?',QUESTION!,YESNO!) = 2 then
		return -1
	else
		this.PostEvent("desecha")//borrar = nuevo
		cambio = FALSE
	end if
	
elseif cambio then
	if messageBox('Aviso','Ha hecho modificaciones que no han sido guardadas. Desea continuar?',QUESTION!,YESNO!) = 2 then
		Return -1
	end if
	cambio = FALSE
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw = this
st_dw.dwo = dwo
st_dw.row = row
openwithparm(w_funcion_dw,st_dw)

end event

type pb_minuta from picturebutton within w_contratacion_org
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 2208
integer y = 2160
integer width = 146
integer height = 128
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "contrato.gif"
string disabledname = "d_contrato.gif"
alignment htextalign = left!
string powertiptext = "Minuta"
end type

event clicked;if dw_cab.RowCount() = 0 then Return 0
if nuevo > 0 and dw_cab.GetRow() = nuevo then
	MessageBox('Atención','Debe Grabar Temporal para poder utilizar los datos del contrato en la elaboración de la minuta')
	Return -1
end if
st_contrato st_p
st_p.ano = t1.p1.dw_concab.GetItemNumber(1,'ano')
st_p.ncontrato = t1.p1.dw_concab.GetItemNumber(1,'ncontrato')
st_p.otrosi = t1.p1.dw_concab.GetItemNumber(1,'otrosi')
if t1.p1.dw_concab.GetItemString(t1.p1.dw_concab.GetRow(),'estado') = '0' then
	st_p.DisplayOnly = FALSE
else
	st_p.DisplayOnly = TRUE
	MessageBox('Atención','El contrato ya ha sido cerrado. No podrá guardar los cambios')
end if
opensheetwithparm(w_rte,st_p,w_principal)

end event

