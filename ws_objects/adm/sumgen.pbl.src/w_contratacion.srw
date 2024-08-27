$PBExportHeader$w_contratacion.srw
forward
global type w_contratacion from window
end type
type dw_anyos from datawindow within w_contratacion
end type
type pb_14 from picturebutton within w_contratacion
end type
type dw_cargo from datawindow within w_contratacion
end type
type pb_11 from picturebutton within w_contratacion
end type
type pb_23 from picturebutton within w_contratacion
end type
type pb_8 from picturebutton within w_contratacion
end type
type pb_7 from picturebutton within w_contratacion
end type
type pb_6 from picturebutton within w_contratacion
end type
type pb_anula from picturebutton within w_contratacion
end type
type pb_4 from picturebutton within w_contratacion
end type
type pb_nuevo from picturebutton within w_contratacion
end type
type t1 from tab within w_contratacion
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
type dw_req from datawindow within pp
end type
type mle_p from multilineedit within pp
end type
type pp from userobject within t1
pb_leg pb_leg
pb_5 pb_5
pb_1 pb_1
st_r st_r
st_d st_d
pb_19 pb_19
pb_18 pb_18
dw_pol dw_pol
dw_req dw_req
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
type p2 from userobject within t1
end type
type tcausa from tab within p2
end type
type caus from userobject within tcausa
end type
type pb_copi from picturebutton within caus
end type
type dw_imp from datawindow within caus
end type
type pb_import from picturebutton within caus
end type
type pb_13 from picturebutton within caus
end type
type pb_10 from picturebutton within caus
end type
type pb_20 from picturebutton within caus
end type
type dw_causa from datawindow within caus
end type
type caus from userobject within tcausa
pb_copi pb_copi
dw_imp dw_imp
pb_import pb_import
pb_13 pb_13
pb_10 pb_10
pb_20 pb_20
dw_causa dw_causa
end type
type entrada from userobject within tcausa
end type
type st_1 from statictext within entrada
end type
type pb_15 from picturebutton within entrada
end type
type dw_ent from datawindow within entrada
end type
type entrada from userobject within tcausa
st_1 st_1
pb_15 pb_15
dw_ent dw_ent
end type
type tcausa from tab within p2
caus caus
entrada entrada
end type
type pb_acta from picturebutton within p2
end type
type pb_g from picturebutton within p2
end type
type pb_autoriza from picturebutton within p2
end type
type pb_3 from picturebutton within p2
end type
type pb_2 from picturebutton within p2
end type
type dw_fpago from datawindow within p2
end type
type pb_21 from picturebutton within p2
end type
type p2 from userobject within t1
tcausa tcausa
pb_acta pb_acta
pb_g pb_g
pb_autoriza pb_autoriza
pb_3 pb_3
pb_2 pb_2
dw_fpago dw_fpago
pb_21 pb_21
end type
type p6 from userobject within t1
end type
type sle_1 from singlelineedit within p6
end type
type pb_guarr from picturebutton within p6
end type
type pb_delart from picturebutton within p6
end type
type pb_insar from picturebutton within p6
end type
type dw_carticulo from datawindow within p6
end type
type p6 from userobject within t1
sle_1 sle_1
pb_guarr pb_guarr
pb_delart pb_delart
pb_insar pb_insar
dw_carticulo dw_carticulo
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
type t1 from tab within w_contratacion
p1 p1
pp pp
p3 p3
p2 p2
p6 p6
p4 p4
p5 p5
pb pb
end type
type dw_cab from datawindow within w_contratacion
end type
type pb_minuta from picturebutton within w_contratacion
end type
type gb_1 from groupbox within w_contratacion
end type
end forward

global type w_contratacion from window
integer width = 5861
integer height = 2488
boolean titlebar = true
string title = "Contratación"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "contrato.ico"
dw_anyos dw_anyos
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
t1 t1
dw_cab dw_cab
pb_minuta pb_minuta
gb_1 gb_1
end type
global w_contratacion w_contratacion

type variables
string codDocumento, codmodulo, i_exige_origen,i_emp
long nuevo, otrosi
boolean cambio, ppto
decimal mayorCuantia,minimaCuantia
datawindowchild dwc_f, dwc_i, dwc_t,dwc_cc,idw_concep,dwc_clc
end variables

forward prototypes
public function integer grabar (string tipo)
public function long f_nuevo_contra (long ano)
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
		if t1.p1.dw_concab.GetItemNumber(t1.p1.dw_concab.GetRow(),'monto')>minimacuantia and t1.p1.dw_concab.GetItemNumber(t1.p1.dw_concab.GetRow(),'monto') < MayorCuantia then
			otrosi = 100
		else
			otrosi = 1000
		end if
	end if
	numdoc = f_nuevo_contra(t1.p1.dw_concab.GetItemNumber(1,'ano'))
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
	for i = 1 to  t1.p6.dw_carticulo.RowCount()
		t1.p6.dw_carticulo.SetItem(i,'ncontrato',numdoc)
		t1.p6.dw_carticulo.SetItem(i,'otrosi',otrosi)
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

if t1.p1.dw_concab.GetItemNumber(t1.p1.dw_concab.GetRow(),'monto') >= MayorCuantia and (otrosi = 100  or  otrosi =1) then
	MessageBox('Atención','El contrato está definido de minima/menor cuantía pero el monto es superior a '+string(MayorCuantia,'#,##0.00')+' Debe anularlo y crear otro, o verificar el monto')
	Return -1
end if
if t1.p1.dw_concab.GetItemNumber(t1.p1.dw_concab.GetRow(),'monto') >minimacuantia AND t1.p1.dw_concab.GetItemNumber(t1.p1.dw_concab.GetRow(),'monto') < MayorCuantia and (otrosi = 0 or otrosi = 1) then
	MessageBox('Atención','El contrato está definido de menor cuantía pero el monto esta entre '+string(minimaCuantia,'#,##0.00')+' y '+string(MayorCuantia,'#,##0.00')+' Debe anularlo y crear otro, o verificar el monto')
	Return -1
end if

if t1.p1.dw_concab.GetItemNumber(t1.p1.dw_concab.GetRow(),'monto') < minimaCuantia and (otrosi = 0  or otrosi = 100  ) then
	MessageBox('Atención','El contrato está definido de minima cuantía pero el monto es menor a '+string(MinimaCuantia,'#,##0.00')+' Debe anularlo y crear otro, o verificar el monto')
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
if t1.p6.dw_carticulo.Update() = -1 then
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

public function long f_nuevo_contra (long ano);string msg
long ncontrato
select max(ncontrato) into :ncontrato from contra
where ano=:ano; //and otrosi=:ots;
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

on w_contratacion.create
this.dw_anyos=create dw_anyos
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
this.t1=create t1
this.dw_cab=create dw_cab
this.pb_minuta=create pb_minuta
this.gb_1=create gb_1
this.Control[]={this.dw_anyos,&
this.pb_14,&
this.dw_cargo,&
this.pb_11,&
this.pb_23,&
this.pb_8,&
this.pb_7,&
this.pb_6,&
this.pb_anula,&
this.pb_4,&
this.pb_nuevo,&
this.t1,&
this.dw_cab,&
this.pb_minuta,&
this.gb_1}
end on

on w_contratacion.destroy
destroy(this.dw_anyos)
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
destroy(this.t1)
destroy(this.dw_cab)
destroy(this.pb_minuta)
destroy(this.gb_1)
end on

event open;codDocumento = Message.StringParm
decimal valor

SELECT entero into :valor
FROM parametros_gen
WHERE (((codigo_para)=62));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 61')
	return 
end if

if (isNull(valor) or valor =0) and codDocumento = '%' then 
	MessageBox('Atención','No ha definido un monto como MÍNIMA CUANTIA en el configurador')
	pb_4.PostEvent(clicked!)
	Return 0
end if

minimaCuantia= dec(valor)
if isNull(MayorCuantia) then minimaCuantia= 0

SELECT entero into :valor
FROM parametros_gen
WHERE (((codigo_para)=19));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 19')
	return 
end if

if (isNull(valor) or valor = 0) and codDocumento = '%' then 
	if MessageBox('Atención','No ha definido un monto como MAYOR CUANTIA en el configurador. Todos sus contratos serán de mayor cuantía. Desea Continuar?',QUESTION!,YESNO!,2) = 2 then 
		pb_4.PostEvent(clicked!)
		Return 0
	end if
end if
MayorCuantia = valor
if isNull(MayorCuantia) then MayorCuantia = 0

if codDocumento = 'NC' then
	Title= 'Contratos de Servicios'
	t1.p2.tcausa.entrada.dw_ent.Visible = FALSE
	t1.p2.tcausa.entrada.pb_15.Visible = FALSE
	t1.p4.Visible = FALSE
else
	if  codDocumento = 'SCT' then
		Title= 'Módulo Suministros'
	else 
		Title= 'Módulo Contratación'
	end if
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

dw_anyos.SetTransObject(SQLCA)
t1.p1.dw_concab.SetTransObject(SQLCA)
t1.p1.dw_concab.GetChild('cod_flujo',dwc_f)
dwc_f.SetTransObject(SQLCA)
dwc_f.Retrieve(codDocumento)

t1.p1.dw_concab.GetChild('coddoc',dwc_clc)
dwc_clc.SetTransObject(SQLCA)
dwc_clc.retrieve()

if dwc_f.rowcount()=0 then
	dwc_f.InsertRow(0)
else
	if codDocumento = '%' then
		dwc_clc.SetFilter("tip_ccont='SCT' or tip_ccont='NC'")
		dwc_f.SetFilter("cod_vent='SCT' or cod_vent='NC'")
	else
		if codDocumento = 'NC' then
			dwc_f.SetFilter("cod_vent='NC'")
			dwc_clc.SetFilter("tip_ccont='NC'")
		else
			dwc_f.SetFilter("cod_vent='SCT'")
			dwc_clc.SetFilter("tip_ccont='SCT'")			
		end if
		dwc_f.Filter()
		dwc_clc.Filter()
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
	mod_string = "DataWindow.Table.Select='" + original_select + + " and contra.estado = ~~'1~~'  '"
	rc = dw_cab.Modify(mod_string)
	IF rc <> "" THEN
		MessageBox("Status", "Modify Failed" + rc)
	END IF
end if

dw_anyos.setitem(1,1,year(today()))
dw_anyos.post event itemchanged(1,dw_anyos.object.anyo, string(year(today())))

// OJO, si se deja módulo aparte 

end event

event resize;t1.resize((newwidth - 50) , (newheight * 0.65))
end event

event closequery;if nuevo > 0 then 
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

type dw_anyos from datawindow within w_contratacion
integer x = 46
integer y = 28
integer width = 786
integer height = 88
integer taborder = 40
string title = "none"
string dataobject = "dw_anyos_contr"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;insertrow(1)

end event

event itemchanged;dw_cab.reset()
dw_cab.post retrieve(codDocumento,integer(data),integer(data))
dw_cab.post setfocus()

end event

type pb_14 from picturebutton within w_contratacion
event mousemove pbm_mousemove
integer x = 5422
integer y = 476
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

if f_sol_permiso(this,'SCT') = 1 then 
	t1.p1.dw_concab.SetItem(1,'juridico','1')
end if
if t1.p1.dw_concab.Update() = -1 then
	rollback;
	Return -1
end if
commit;
Return 0

end event

type dw_cargo from datawindow within w_contratacion
boolean visible = false
integer x = 5403
integer y = 1268
integer width = 329
integer height = 120
integer taborder = 50
boolean enabled = false
string title = "none"
string dataobject = "dw_emplecargo"
boolean border = false
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)

end event

type pb_11 from picturebutton within w_contratacion
event mousemove pbm_mousemove
string tag = "Sugerir Plan"
boolean visible = false
integer x = 5559
integer y = 1128
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

type pb_23 from picturebutton within w_contratacion
event mousemove pbm_mousemove
integer x = 5253
integer y = 336
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

type pb_8 from picturebutton within w_contratacion
event mousemove pbm_mousemove
string tag = "Imprimir Reporte"
integer x = 5591
integer y = 332
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

type pb_7 from picturebutton within w_contratacion
event mousemove pbm_mousemove
string tag = "&Grabar Definitivo"
integer x = 5422
integer y = 200
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

type pb_6 from picturebutton within w_contratacion
event mousemove pbm_mousemove
string tag = "Grabar &Temporal"
integer x = 5253
integer y = 476
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

if grabar('temporal') = 0 then
	dw_anyos.post event itemchanged(1, dw_anyos.object.anyo, string(dw_anyos.getItemNumber(1,'anyo')) )
end if

end event

type pb_anula from picturebutton within w_contratacion
event mousemove pbm_mousemove
string tag = "Anular Contrato"
integer x = 5422
integer y = 336
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
		
		UPDATE pre_docu_cp SET monto_interfaz = monto_interfaz - :monto_d
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
	commit;
end if

end event

type pb_4 from picturebutton within w_contratacion
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 5591
integer y = 196
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

type pb_nuevo from picturebutton within w_contratacion
event mousemove pbm_mousemove
string tag = "Nuevo Contrato"
integer x = 5253
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
nuevo = fila
dw_cab.ScrollToRow(nuevo)

dw_cab.SetItem(fila,'clugar',cLugar)
dw_cab.SetItem(fila,'ano',year(today()))
dw_cab.SetItem(fila,'estado','0')
t1.p1.dw_concab.Reset()
fila = t1.p1.dw_concab.InsertRow(1)
//dwc_f.SetFilter("cod_vent='X'")
//dwc_f.filter()
t1.p1.dw_concab.SetItem(fila,'clugar',cLugar)
t1.p1.dw_concab.SetItem(fila,'ano',year(today()))
t1.p1.dw_concab.SetItem(fila,'otrosi',0)
t1.p1.dw_concab.SetItem(fila,'estado','0')
t1.p1.dw_concab.SetItem(fila,'inicia',datetime(today(),time(0)))
t1.p1.dw_concab.SetItem(fila,'usuario',usuario)
t1.p2.tcausa.entrada.dw_ent.Reset()
t1.p2.dw_fpago.Reset()
t1.p3.dw_ppto.Reset()
t1.p4.dw_oc.Reset()
t1.pb.dw_ob.Reset()
t1.p5.dw_osi.Reset()
t1.pp.dw_pol.Reset()
t1.pp.dw_req.Reset()

cambio = TRUE




end event

type t1 from tab within w_contratacion
integer x = 32
integer y = 692
integer width = 5755
integer height = 1648
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
p2 p2
p6 p6
p4 p4
p5 p5
pb pb
end type

on t1.create
this.p1=create p1
this.pp=create pp
this.p3=create p3
this.p2=create p2
this.p6=create p6
this.p4=create p4
this.p5=create p5
this.pb=create pb
this.Control[]={this.p1,&
this.pp,&
this.p3,&
this.p2,&
this.p6,&
this.p4,&
this.p5,&
this.pb}
end on

on t1.destroy
destroy(this.p1)
destroy(this.pp)
destroy(this.p3)
destroy(this.p2)
destroy(this.p6)
destroy(this.p4)
destroy(this.p5)
destroy(this.pb)
end on

type p1 from userobject within t1
integer x = 18
integer y = 112
integer width = 5719
integer height = 1520
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
integer x = 32
integer y = 32
integer width = 5321
integer height = 1348
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
			if nuevo = 0 and GetItemNumber(GetRow(),'otrosi') > 0 then
				MessageBox('Atención','El monto es de Mayor Cuantía (desde '+string(MayorCuantia,'#,##0.00')+'), pero al ser elaborado se definió de Menor cuantía. Revise montos o el configurador. En otro caso debe anularse y crear un nuevo contrato')
				SetItem(GetRow(),'monto',monto_ant)
				SetText(string(monto_ant))
				Return 1
			else
				otrosi = 0
			end if
		else
			if dec(data)>minimacuantia AND dec(data) <MayorCuantia then
				if nuevo = 0 and (GetItemNumber(GetRow(),'otrosi') = 0 or GetItemNumber(GetRow(),'otrosi') = 1000)  then
					MessageBox('Atención','El monto es de Menor Cuantía (menor de '+string(MayorCuantia,'#,##0.00')+') pero al ser elaborado se definió de Mayor cuantía. Revise montos o el configurador. En otro caso debe anularse y crear un nuevo contrato')
					SetItem(GetRow(),'monto',monto_ant)
					setText(string(monto_ant))
					Return 1
				else
					otrosi = 100
				end if				
			else
				if nuevo = 0 and GetItemNumber(GetRow(),'otrosi') < 1000 then
					MessageBox('Atención','El monto es de Menor Cuantía (menor de '+string(MayorCuantia,'#,##0.00')+') pero al ser elaborado se definió de Mayor cuantía. Revise montos o el configurador. En otro caso debe anularse y crear un nuevo contrato')
					SetItem(GetRow(),'monto',monto_ant)
					setText(string(monto_ant))
					Return 1
				else
					otrosi = 1000
				end if
				
			end if
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
		if dwc_clc.GetItemString(dwc_clc.GetRow(),'tip_ccont')='NC' then 
//		if GetItemString(GetRow(),'coddoc') = 'NC' then
			Title = 'Contrato de Servicios'
			t1.p2.tcausa.entrada.dw_ent.Visible = FALSE
			t1.p2.tcausa.entrada.pb_15.Visible = FALSE
			dwc_f.SetFilter("cod_vent='NC'")
		else
			Title= 'Contratos de Suministros'
			t1.p2.tcausa.entrada.dw_ent.Visible =TRUE
			t1.p2.tcausa.entrada.pb_15.Visible = TRUE
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
integer width = 5719
integer height = 1520
long backcolor = 67108864
string text = "Pólizas"
long tabtextcolor = 33554432
string picturename = "libro.ico"
long picturemaskcolor = 536870912
pb_leg pb_leg
pb_5 pb_5
pb_1 pb_1
st_r st_r
st_d st_d
pb_19 pb_19
pb_18 pb_18
dw_pol dw_pol
dw_req dw_req
mle_p mle_p
end type

on pp.create
this.pb_leg=create pb_leg
this.pb_5=create pb_5
this.pb_1=create pb_1
this.st_r=create st_r
this.st_d=create st_d
this.pb_19=create pb_19
this.pb_18=create pb_18
this.dw_pol=create dw_pol
this.dw_req=create dw_req
this.mle_p=create mle_p
this.Control[]={this.pb_leg,&
this.pb_5,&
this.pb_1,&
this.st_r,&
this.st_d,&
this.pb_19,&
this.pb_18,&
this.dw_pol,&
this.dw_req,&
this.mle_p}
end on

on pp.destroy
destroy(this.pb_leg)
destroy(this.pb_5)
destroy(this.pb_1)
destroy(this.st_r)
destroy(this.st_d)
destroy(this.pb_19)
destroy(this.pb_18)
destroy(this.dw_pol)
destroy(this.dw_req)
destroy(this.mle_p)
end on

type pb_leg from picturebutton within pp
event mousemove pbm_mousemove
string tag = "Sugerir Plan"
integer x = 2048
integer y = 1088
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
integer y = 960
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
integer y = 832
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

type st_r from statictext within pp
integer x = 32
integer y = 768
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
integer y = 768
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
integer x = 5166
integer y = 156
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
integer x = 5161
integer y = 20
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
integer x = 32
integer y = 28
integer width = 5061
integer height = 720
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

type dw_req from datawindow within pp
integer x = 32
integer y = 836
integer width = 1984
integer height = 592
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

type mle_p from multilineedit within pp
boolean visible = false
integer x = 32
integer y = 836
integer width = 1975
integer height = 592
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
integer width = 5719
integer height = 1520
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
integer x = 32
integer y = 860
integer width = 4978
integer height = 580
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
integer x = 5152
integer y = 156
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
integer x = 5152
integer y = 28
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
st_parm.otrosi='0'
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
integer x = 32
integer y = 32
integer width = 4987
integer height = 800
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

type p2 from userobject within t1
integer x = 18
integer y = 112
integer width = 5719
integer height = 1520
long backcolor = 67108864
string text = "Pagos a Terceros"
long tabtextcolor = 33554432
string picturename = "Calculator.ico"
long picturemaskcolor = 536870912
tcausa tcausa
pb_acta pb_acta
pb_g pb_g
pb_autoriza pb_autoriza
pb_3 pb_3
pb_2 pb_2
dw_fpago dw_fpago
pb_21 pb_21
end type

on p2.create
this.tcausa=create tcausa
this.pb_acta=create pb_acta
this.pb_g=create pb_g
this.pb_autoriza=create pb_autoriza
this.pb_3=create pb_3
this.pb_2=create pb_2
this.dw_fpago=create dw_fpago
this.pb_21=create pb_21
this.Control[]={this.tcausa,&
this.pb_acta,&
this.pb_g,&
this.pb_autoriza,&
this.pb_3,&
this.pb_2,&
this.dw_fpago,&
this.pb_21}
end on

on p2.destroy
destroy(this.tcausa)
destroy(this.pb_acta)
destroy(this.pb_g)
destroy(this.pb_autoriza)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.dw_fpago)
destroy(this.pb_21)
end on

type tcausa from tab within p2
event create ( )
event destroy ( )
integer x = 32
integer y = 660
integer width = 5696
integer height = 832
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
caus caus
entrada entrada
end type

on tcausa.create
this.caus=create caus
this.entrada=create entrada
this.Control[]={this.caus,&
this.entrada}
end on

on tcausa.destroy
destroy(this.caus)
destroy(this.entrada)
end on

type caus from userobject within tcausa
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5659
integer height = 704
long backcolor = 67108864
string text = "Estimación"
long tabtextcolor = 33554432
string picturename = "configura.ico"
long picturemaskcolor = 536870912
pb_copi pb_copi
dw_imp dw_imp
pb_import pb_import
pb_13 pb_13
pb_10 pb_10
pb_20 pb_20
dw_causa dw_causa
end type

on caus.create
this.pb_copi=create pb_copi
this.dw_imp=create dw_imp
this.pb_import=create pb_import
this.pb_13=create pb_13
this.pb_10=create pb_10
this.pb_20=create pb_20
this.dw_causa=create dw_causa
this.Control[]={this.pb_copi,&
this.dw_imp,&
this.pb_import,&
this.pb_13,&
this.pb_10,&
this.pb_20,&
this.dw_causa}
end on

on caus.destroy
destroy(this.pb_copi)
destroy(this.dw_imp)
destroy(this.pb_import)
destroy(this.pb_13)
destroy(this.pb_10)
destroy(this.pb_20)
destroy(this.dw_causa)
end on

type pb_copi from picturebutton within caus
integer x = 5509
integer y = 32
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "copia_orden.gif"
string disabledname = "d_copia_orden.gif"
alignment htextalign = left!
string powertiptext = "Copia Causación"
end type

event clicked;st_contratos st_parm
int l_item

st_parm.anyo=t1.p1.dw_concab.GetItemNumber(1,'ano')
st_parm.ncon=t1.p1.dw_concab.GetItemNumber(1,'ncontrato')
st_parm.otros=t1.p1.dw_concab.GetItemNumber(1,'otrosi')
st_parm.item=t1.p2.dw_fpago.getitemnumber(t1.p2.dw_fpago.getrow()  ,'item')
st_parm.monto=t1.p2.dw_fpago.getitemnumber(t1.p2.dw_fpago.getrow()  ,'monto')

openwithparm(w_copia_estima,st_parm)

dw_causa.Retrieve( st_parm.anyo,st_parm.ncon,st_parm.otros,st_parm.item)
for l_item= 1 to dw_causa.RowCount()
	dw_causa.SetItem(l_item,'nuevo',1)
next
end event

type dw_imp from datawindow within caus
boolean visible = false
integer x = 5367
integer y = 460
integer width = 128
integer height = 56
integer taborder = 50
string title = "none"
string dataobject = "dw_contra_causa_import"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_import from picturebutton within caus
integer x = 5509
integer y = 164
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "import.gif"
alignment htextalign = left!
end type

event clicked;string crl,clg,cuf,ccc, item
string docname,named,l_lug,l_tipof,tipo_rad,l_rad
double valores,value ,i,ll_found,fila
decimal valor

value = GetFileOpenName("Importar de:", docname, named,"*.TXT","Text files, *.TXT, CSV files, *.CSV") 
IF value = 1 THEN
	value = dw_imp.ImportFile(csv!,docname)
	if value = -1  then MessageBox('Atención','No se encontraron filas')
	if value = -2  then MessageBox('Atención','Archivo vacio')
	if value = -3  then MessageBox('Atención','Argumento inválido')
	if value = -4  then MessageBox('Atención','Entrada inválida')
	if value = -5  then MessageBox('Atención','No se puede abrir el archivo')
	if value = -6  then MessageBox('Atención','No se puede cerrar el archivo')
	if value = -7  then MessageBox('Atención','Error leyendo el texto')
	if value = -8  then MessageBox('Atención','Sufijo de archivo no soportado (debe ser *.txt, *.csv, *.dbf or *.xml)')
	if value = -10 then MessageBox('Atención','Formato de archivo dBase no soportado  (solo version 2 or 3)')
	if value = -13 then MessageBox('Atención','Estilo de DataWindow no soportado para importación')
	if value = -14 then MessageBox('Atención','Error resolviendo anidamiento de DataWindow')
	if value < 0 then REturn -1
end if

for i = 1 to dw_imp.RowCount()
	crl= dw_imp.GetItemstring(i,'cod_rel')
	clg= dw_imp.GetItemstring(i,'codlugar')
	cuf= dw_imp.GetItemstring(i,'coduf')
	ccc = dw_imp.GetItemstring(i,'codcc')
	valor= dw_imp.GetItemnumber(i,'valor')

	ll_found =dw_causa.Find("cod_rel ='"+crl+"' and codlugar ='"+clg+"' and coduf='"+cuf+"' and codcc='"+ccc +"'",1,dw_causa.RowCount()) 
	if ll_found > 0 then
		dw_causa.SetItem(fila,'monto',valor)
	else
		fila =dw_causa.InsertRow(0)
		//item =dw_causa.Describe("Evaluate('max(item)',0)")
		dw_causa.SetItem(fila,'ano',t1.p1.dw_concab.GetItemNumber(1,'ano'))
		dw_causa.SetItem(fila,'ncontrato',t1.p1.dw_concab.GetItemNumber(1,'ncontrato'))
		dw_causa.SetItem(fila,'otrosi',t1.p1.dw_concab.GetItemNumber(1,'otrosi'))
		dw_causa.SetItem(fila,'item',t1.p2.dw_fpago.GetItemNumber(t1.p2.dw_fpago.getrow(),'item'))
		dw_causa.SetItem(fila ,'cod_rel',crl)
		dw_causa.SetItem(fila,'codlugar',clg)
		dw_causa.SetItem(fila ,'coduf',cuf)
		dw_causa.SetItem(fila ,'codcc',ccc)
		dw_causa.SetItem(fila,'monto',valor)
		dw_causa.SetItem(fila,'monto_vigente',valor)		
		dw_causa.SetItem(fila,'nuevo',1)
		dw_causa.SetItem(fila,'usuario',usuario)
	end if
next
end event

type pb_13 from picturebutton within caus
integer x = 5349
integer y = 304
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "guardar.gif"
alignment htextalign = left!
end type

event clicked;if dw_cab.RowCount() = 0 then Return
long i
dwitemstatus  ls_estado
boolean ldb_mod=false

for i=1  to dw_causa.rowcount()
	ls_estado=dw_causa.getitemstatus(i,0,primary!)
	if ls_estado=DataModified! then ldb_mod=true
next	

if ldb_mod=true then 
//if  dw_causa.getitemnumber(1,'total') <> t1.p2.dw_fpago.getitemnumber(t1.p2.dw_fpago.getrow(),'monto') then
	if messagebox("Atención",'Está seguro que desa modificar el Monto de la Liquidación?',question!,yesno!,2)=2 then return -1
end if

t1.p2.dw_fpago.setitem(t1.p2.dw_fpago.getrow(),'monto_vigente', dw_causa.getitemnumber(1,'total') )

if  t1.p2.dw_fpago.getitemstring(t1.p2.dw_fpago.getrow(),'contabil_mod')='C' then
	t1.p2.dw_fpago.setitem(t1.p2.dw_fpago.getrow(),'fecha_modifi', datetime(today(),now()))
end if
if t1.p2.dw_fpago.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if	 

if dw_causa.Update() = -1 then
	Rollback;
	Return -1
end if
for i = 1 to dw_causa.RowCount()
	if dw_causa.GetItemNumber(i,'nuevo') = 1 then dw_causa.SetItem(i,'nuevo',0)
next
dw_causa.ResetUpdate()
commit;
Return 0
end event

type pb_10 from picturebutton within caus
integer x = 5349
integer y = 164
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_causa.RowCount() = 0 then Return

if dw_causa.GetItemnumber(dw_causa.GetRow(),'nuevo') =0 then
	MessageBox('Atención','Solo se pueden borrar registros nuevos')
	Return -1
end if

dw_causa.DeleteRow(dw_causa.GetRow())
int recorre
for recorre=1 to dw_causa.rowcount()
	dw_causa.SetItem(recorre,'porcentaje',100/dw_causa.rowcount())
next
cambio = TRUE
end event

type pb_20 from picturebutton within caus
integer x = 5349
integer y = 32
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.gif"
alignment htextalign = left!
end type

event clicked;If dw_cab.RowCount() = 0 then Return
long fila,recorre,monto,tot
fila =dw_causa.InsertRow(0)
dw_causa.SetItem(fila,'ano',t1.p1.dw_concab.GetItemNumber(1,'ano'))
dw_causa.SetItem(fila,'ncontrato',t1.p1.dw_concab.GetItemNumber(1,'ncontrato'))
dw_causa.SetItem(fila,'otrosi',t1.p1.dw_concab.GetItemNumber(1,'otrosi'))
dw_causa.SetItem(fila,'item',t1.p2.dw_fpago.getitemnumber(t1.p2.dw_fpago.getrow(),'item'))
dw_causa.SetItem(fila,'nuevo',1)
dw_causa.SetItem(fila,'usuario',usuario)
monto=t1.p2.dw_fpago.getitemnumber(t1.p2.dw_fpago.getrow(),'monto')
tot=dw_causa.getitemnumber(1,'total')
for recorre=1 to dw_causa.rowcount()
	if dw_causa.getitemnumber(recorre,'nuevo')=1 then 
		if tot<=monto and dw_causa.getitemnumber(recorre,'monto_vigente')=0 then 
			if  t1.p2.dw_fpago.getitemstring(t1.p2.dw_fpago.getrow(),'contabil')='P' then
				dw_causa.SetItem(recorre,'monto',monto - tot)
			else
				dw_causa.SetItem(recorre,'monto',0)
			end if
			dw_causa.SetItem(recorre,'monto_vigente',monto -tot)
		end if
	end if
next
dw_causa.ScrolltoRow(fila)


end event

type dw_causa from datawindow within caus
integer x = 27
integer y = 32
integer width = 5262
integer height = 656
integer taborder = 30
string title = "none"
string dataobject = "dw_contra_fpago_causa"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

Getchild('codcc',dwc_cc)
dwc_cc.SetTransObject(SQLCA)

getchild('cod_rel',idw_concep)
idw_concep.settransobject(sqlca)
idw_concep.setfilter("nomina='0'")
idw_concep.filter()
end event

event itemchanged;long f, p
if this.GetColumnName() = 'coduf' then
	dwc_cc.SetFilter("coduf='" + data + "'")
	dwc_cc.Filter()
elseif this.GetColumnName() = 'codcc' then
	this.SetItem(row,'codcc', dwc_cc.GetItemString(dwc_cc.GetRow(),'codcc'))
end if

if GetColumnName() = 'monto_vigente' then
	if  t1.p2.dw_fpago.getitemstring(t1.p2.dw_fpago.getrow(),'contabil')='P' then
		this.SetItem(row,'monto', double(data))
	end if
end if
if AcceptText() = -1 then Return

for f = 1 to RowCount()
	if GetItemNumber(f,'total')>0 then
		SetItem(f,'porcentaje',round((GetItemNumber(f,'monto_vigente') / GetItemNumber(f,'total')) * 100,2))
	else
		SetItem(f,'porcentaje',0)
	end if
next
end event

event rowfocuschanged;if this.rowcount() < 1 or currentrow = 0 then 
	pb_copi.enabled=true
	Return
end if
pb_copi.enabled=false
if not isNull(this.GetItemString(currentRow,'coduf')) then
	dwc_cc.SetFilter("coduf='" + this.GetItemString(currentRow,'coduf') + "'")
	dwc_cc.Filter()
end if
end event

event retrieverow;//dwc_cc.SetItem(row,'codcc',this.GetItemString(row,'descripcion'))
end event

type entrada from userobject within tcausa
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5659
integer height = 704
long backcolor = 67108864
string text = "Entradas"
long tabtextcolor = 33554432
string picturename = "copiar.ico"
long picturemaskcolor = 536870912
st_1 st_1
pb_15 pb_15
dw_ent dw_ent
end type

on entrada.create
this.st_1=create st_1
this.pb_15=create pb_15
this.dw_ent=create dw_ent
this.Control[]={this.st_1,&
this.pb_15,&
this.dw_ent}
end on

on entrada.destroy
destroy(this.st_1)
destroy(this.pb_15)
destroy(this.dw_ent)
end on

type st_1 from statictext within entrada
integer x = 3163
integer y = 192
integer width = 2030
integer height = 404
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "Autorización de pagos: Si tipo pago es CONTRA ENTREGA o PAGO FINAL, el sistema solicitará asociar la entrada de productos. Para Pagos Finales se autoriza y se establece como entregado en la ficha Mano de Obra (si la hay)"
boolean focusrectangle = false
end type

type pb_15 from picturebutton within entrada
string tag = "Borrar Registro"
integer x = 3145
integer y = 36
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
end type

type dw_ent from datawindow within entrada
integer x = 32
integer y = 32
integer width = 3086
integer height = 648
integer taborder = 33
string title = "none"
string dataobject = "dw_contra_fpago_ent"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type pb_acta from picturebutton within p2
event mousemove pbm_mousemove
integer x = 5509
integer y = 184
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

type pb_g from picturebutton within p2
event mousemove pbm_mousemove
string tag = "Sugerir Plan"
integer x = 5349
integer y = 316
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
for i = 1 to dw_fpago.RowCount()
	if dw_fpago.GetItemNumber(i,'nuevo') = 1 then dw_fpago.SetItem(i,'monto_vigente',dw_fpago.getitemnumber(i,'monto'))
	if isnull(dw_fpago.GetItemstring(i,'tipo_pago')) then 
		MessageBox('Atención','No puede aber registro sin tipo de pago')
		return -1
	end if
next

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

type pb_autoriza from picturebutton within p2
event mousemove pbm_mousemove
integer x = 5509
integer y = 36
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
string picturename = "pesos.GIF"
string disabledname = "d_pesos.GIF"
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
//if f_sol_permiso(this,t1.p1.dw_concab.GetItemString(t1.p1.dw_concab.GetRow(),'coddoc')) <> 1 then Return
if f_sol_permiso(this,'SCT') <> 1 then Return
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

	st_parm.dw_obj = t1.p2.tcausa.entrada.dw_ent
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
integer x = 5349
integer y = 180
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
integer x = 5349
integer y = 36
integer width = 146
integer height = 128
integer taborder = 20
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
if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') = '2' then
	messageBox('Aviso','El documento ya ha sido cerrado. No puede modificarse')
	Return
end if
valor = dw_fpago.Describe("Evaluate('max(item)',0)")
fila = dw_fpago.InsertRow(0)
dw_fpago.SetItem(fila,'ano',t1.p1.dw_concab.GetItemNumber(1,'ano'))
dw_fpago.SetItem(fila,'ncontrato',t1.p1.dw_concab.GetItemNumber(1,'ncontrato'))
dw_fpago.SetItem(fila,'otrosi',t1.p1.dw_concab.GetItemNumber(1,'otrosi'))
dw_fpago.SetItem(fila,'clugar',t1.p1.dw_concab.GetItemstring(1,'clugar'))
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

type dw_fpago from datawindow within p2
integer x = 32
integer y = 32
integer width = 5298
integer height = 572
integer taborder = 10
string title = "none"
string dataobject = "dw_contra_fpago"
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
//	for i = 1 to RowCount()
//		SetItem(i,'total',t1.p1.dw_concab.GetItemNumber(1,'monto'))
//	next
end if
if isNull(t1.p1.dw_concab.GetItemNumber(1,'monto')) or t1.p1.dw_concab.GetItemNumber(1,'monto') = 0 then Return
for i = 1 to RowCount()
	SetItem(i,'porcentaje',round((GetItemNumber(i,'monto') / t1.p1.dw_concab.GetItemNumber(1,'monto')) * 100,2))
next
t1.p2.tcausa.caus.dw_causa.Retrieve(this.GetItemNumber(this.GetRow(),'ano'), this.GetItemNumber(this.GetRow(),'ncontrato'),this.GetItemNumber(this.GetRow(),'otrosi'),this.GetItemNumber(this.GetRow(),'item'))

for i = 1 to t1.p2.tcausa.caus.dw_causa.RowCount()
	t1.p2.tcausa.caus.dw_causa.SetItem(i,'porcentaje',round((t1.p2.tcausa.caus.dw_causa.GetItemNumber(i,'monto_vigente') / t1.p2.tcausa.caus.dw_causa.GetItemNumber(i,'total')) * 100,2))
next
end event

event rowfocuschanged;t1.p2.tcausa.entrada.dw_ent.Reset()
t1.pb.st_fp.Text = ''
if RowCount() = 0 or currentrow = 0 then Return
int f
f = GetRow()
if isNull(GetItemNumber(f,'ano')) then return
if dw_cab.GetItemString(dw_cab.GetRow(),'coddoc') = 'SCT' then
	t1.p2.tcausa.entrada.dw_ent.Retrieve(GetItemNumber(f,'ano'),GetItemNumber(f,'ncontrato'),GetItemNumber(f,'otrosi'),GetItemNumber(f,'item'))
end if
t1.pb.st_fp.Text = GetItemString(GetRow(),'des_pago')

if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '1' then
	if GetItemNumber(GetRow(),'nuevo') = 1 then
		t1.p2.dw_fpago.Modify('monto.edit.DisplayOnly=NO porcentaje.edit.DisplayOnly=NO des_pago.edit.DisplayOnly=no ')
	else
		t1.p2.dw_fpago.Modify("monto.edit.DisplayOnly=Yes porcentaje.edit.DisplayOnly=yes des_pago.edit.DisplayOnly=yes")
	end if
end if
t1.p2.tcausa.caus.dw_causa.Retrieve(GetItemNumber(f,'ano'),GetItemNumber(f,'ncontrato'),GetItemNumber(f,'otrosi'),GetItemNumber(f,'item'))
end event

type pb_21 from picturebutton within p2
event mousemove pbm_mousemove
string tag = "Sugerir Plan"
integer x = 5344
integer y = 312
integer width = 151
integer height = 132
integer taborder = 40
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

type p6 from userobject within t1
integer x = 18
integer y = 112
integer width = 5719
integer height = 1520
long backcolor = 67108864
string text = "Articulos"
long tabtextcolor = 33554432
string picturename = "larticulos.ico"
long picturemaskcolor = 536870912
sle_1 sle_1
pb_guarr pb_guarr
pb_delart pb_delart
pb_insar pb_insar
dw_carticulo dw_carticulo
end type

on p6.create
this.sle_1=create sle_1
this.pb_guarr=create pb_guarr
this.pb_delart=create pb_delart
this.pb_insar=create pb_insar
this.dw_carticulo=create dw_carticulo
this.Control[]={this.sle_1,&
this.pb_guarr,&
this.pb_delart,&
this.pb_insar,&
this.dw_carticulo}
end on

on p6.destroy
destroy(this.sle_1)
destroy(this.pb_guarr)
destroy(this.pb_delart)
destroy(this.pb_insar)
destroy(this.dw_carticulo)
end on

type sle_1 from singlelineedit within p6
boolean visible = false
integer x = 4997
integer y = 116
integer width = 343
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

event modified;string codart,descripcion,valor,impu
double fila

codart = trim(sle_1.Text)

select 
	descripcion,iva into :descripcion,:impu
from sumarticulo  
where codarticulo=:codart;
IF SQLCA.SQLCode = -1 THEN
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return -1
elseif SQLCA.SQLCode = 100 THEN
	MessageBox("Atención", 'No existe el articulo con el código dado')
	Return -1
END IF

fila = dw_carticulo.Find("codarticulo='"+codart+"'",1,dw_carticulo.RowCount())
if fila = 0 then
	valor = dw_carticulo.Describe("Evaluate('max(item)',0)")
	fila = dw_carticulo.InsertRow(0)
	dw_carticulo.SetItem(fila,'ano',t1.p1.dw_concab.GetItemNumber(1,'ano'))
	dw_carticulo.SetItem(fila,'ncontrato',t1.p1.dw_concab.GetItemNumber(1,'ncontrato'))
	dw_carticulo.SetItem(fila,'otrosi',t1.p1.dw_concab.GetItemNumber(1,'otrosi'))
	dw_carticulo.SetItem(fila,'cod_impu',impu)
	dw_carticulo.SetItem(fila,'codarticulo',codart)
	dw_carticulo.SetItem(fila,'item',long(valor) + 1)
	dw_carticulo.SetItem(fila,'usuario',usuario)
	dw_carticulo.SetItem(fila,'descripcion',descripcion)
	dw_carticulo.ScrolltoRow(fila)	
end if

end event

type pb_guarr from picturebutton within p6
boolean visible = false
integer x = 4425
integer y = 324
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

if dw_carticulo.Update() = -1 then
	Rollback;
	Return -1
end if
dw_carticulo.ResetUpdate()
commit;

end event

type pb_delart from picturebutton within p6
integer x = 4425
integer y = 184
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
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messagebox('Error','El documento ya ha sido cerrado')
	Return
end if

if dw_carticulo.RowCount() = 0 then Return
dw_carticulo.DeleteRow(dw_carticulo.GetRow())
cambio = TRUE
end event

type pb_insar from picturebutton within p6
integer x = 4425
integer y = 44
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.gif"
end type

event clicked;If dw_cab.RowCount() = 0 then Return
string valor
long fila
if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') <> '0' then
	messageBox('Aviso','El documento ya ha sido cerrado. No puede modificarse')
	Return
end if
openwithParm(w_buscaArt,sle_1)



end event

type dw_carticulo from datawindow within p6
integer x = 41
integer y = 40
integer width = 4338
integer height = 1280
integer taborder = 40
string title = "none"
string dataobject = "dw_contra_articulo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

GetChild('cod_impu',dwc_i)
dwc_i.SetTransObject(SQLCA)
dwc_i.Retrieve(codDocumento)
dwc_i.InsertRow(1)
dwc_i.SetItem(1,'nombre','Ninguno')
end event

type p4 from userobject within t1
integer x = 18
integer y = 112
integer width = 5719
integer height = 1520
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
integer x = 3995
integer y = 164
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
integer x = 3995
integer y = 36
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
integer x = 32
integer y = 32
integer width = 3941
integer height = 1440
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

type p5 from userobject within t1
integer x = 18
integer y = 112
integer width = 5719
integer height = 1520
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
integer x = 5234
integer y = 28
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
integer x = 32
integer y = 28
integer width = 5129
integer height = 1460
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

type pb from userobject within t1
integer x = 18
integer y = 112
integer width = 5719
integer height = 1520
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
integer x = 2930
integer y = 380
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
integer x = 37
integer y = 932
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
integer x = 2921
integer y = 168
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
integer x = 2921
integer y = 40
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
integer x = 32
integer y = 32
integer width = 2853
integer height = 872
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
integer x = 32
integer y = 1004
integer width = 3982
integer height = 472
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

type dw_cab from datawindow within w_contratacion
event desecha ( )
integer x = 37
integer y = 132
integer width = 5115
integer height = 532
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

event rowfocuschanged;long fila

if this.RowCount() = 0 or currentrow = 0 then Return
t1.p1.dw_concab.Reset()
t1.p2.tcausa.entrada.dw_ent.Reset()
t1.p2.dw_fpago.Reset()
t1.p3.dw_ppto.Reset()
t1.p4.dw_oc.Reset()
t1.pb.dw_ob.Reset()
t1.p5.dw_osi.Reset()
t1.pp.dw_pol.Reset()
t1.pp.dw_req.Reset()
t1.pp.mle_p.DisplayOnly = TRUE

if currentRow = nuevo and nuevo > 0 then Return

dwc_f.SetFilter("cod_vent='"+GetItemString(Getrow(),'tip_ccont')+"'")
dwc_f.Filter()

t1.p1.dw_concab.Retrieve(this.GetItemNumber(this.GetRow(),'ano'), this.GetItemNumber(this.GetRow(),'ncontrato'),this.GetItemNumber(this.GetRow(),'otrosi'))
if GetItemString(this.GetRow(),'tip_ccont') = 'SCT' then
	t1.p2.tcausa.entrada.visible=true
	t1.p2.tcausa.entrada.dw_ent.Visible = TRUE
	t1.p2.tcausa.entrada.pb_15.Visible = TRUE
	t1.p2.tcausa.entrada.st_1.Visible = TRUE
	t1.p4.Visible = TRUE
else
	t1.p2.tcausa.entrada.visible=FALSE
	t1.p2.tcausa.entrada.dw_ent.Visible =FALSE
	t1.p2.tcausa.entrada.pb_15.Visible = FALSE
	t1.p2.tcausa.entrada.st_1.Visible = FALSE
	t1.p4.Visible = FALSE
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
if GetItemString(GetRow(),'tip_ccont') ='SCT' then
	t1.p4.dw_oc.Retrieve(this.GetItemNumber(this.GetRow(),'ano'), this.GetItemNumber(this.GetRow(),'ncontrato'),this.GetItemNumber(this.GetRow(),'otrosi'))
end if
t1.p5.dw_osi.Retrieve(this.GetItemNumber(this.GetRow(),'ano'), this.GetItemNumber(this.GetRow(),'ncontrato'))
t1.pb.dw_ob.Retrieve(this.GetItemNumber(this.GetRow(),'ano'), this.GetItemNumber(this.GetRow(),'ncontrato'),this.GetItemNumber(this.GetRow(),'otrosi'))
t1.pp.dw_pol.Retrieve(this.GetItemNumber(this.GetRow(),'ano'), this.GetItemNumber(this.GetRow(),'ncontrato'),this.GetItemNumber(this.GetRow(),'otrosi'))
t1.pp.dw_req.Retrieve(this.GetItemNumber(this.GetRow(),'ano'), this.GetItemNumber(this.GetRow(),'ncontrato'),this.GetItemNumber(this.GetRow(),'otrosi'))
t1.p6.dw_carticulo.Retrieve(this.GetItemNumber(this.GetRow(),'ano'), this.GetItemNumber(this.GetRow(),'ncontrato'),this.GetItemNumber(this.GetRow(),'otrosi'))

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
// Se quita a petición de usuarios Armando - Usuarios lo ven como error del sistema
//if t1.p3.dw_ppto.rowcount()>0 and  t1.p3.dw_ppto.GetItemnumber(t1.p3.dw_ppto.GetRow(),'total_utilizado')<>0 and t1.p3.dw_ppto.GetItemnumber(t1.p3.dw_ppto.GetRow(),'total_utilizado') <> dw_cab.GetItemNumber(dw_cab.GetRow(),'monto') then
//	messageBox('Aviso','Ha hecho modificaciones a la Reserva debe hacer modificación al Contrato')
//end if
//if t1.p3.dw_ppto.rowcount()>0 and  t1.p3.dw_ppto.GetItemnumber(t1.p3.dw_ppto.GetRow(),'total_utilizado')<>0 and t1.p3.dw_ppto.GetItemnumber(t1.p3.dw_ppto.GetRow(),'total_utilizado') <> t1.p3.dw_ppto.GetItemnumber(t1.p3.dw_ppto.GetRow(),'total') then
//	messageBox('Aviso','Ha hecho modificaciones al Contrato debe hacerlas en la Disponibilidad')
//end if
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
		nuevo = 0
		cambio = FALSE
		dw_anyos.post event itemchanged(1, dw_anyos.object.anyo, string(dw_anyos.getItemNumber(1,'anyo')) )
		//this.PostEvent("desecha")  //borrar = nuevo
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

type pb_minuta from picturebutton within w_contratacion
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 5591
integer y = 472
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

type gb_1 from groupbox within w_contratacion
integer x = 5211
integer y = 128
integer width = 558
integer height = 512
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Herramientas"
end type

