$PBExportHeader$w_contra_otrosi.srw
forward
global type w_contra_otrosi from window
end type
type st_1 from statictext within w_contra_otrosi
end type
type pb_7 from picturebutton within w_contra_otrosi
end type
type pb_6 from picturebutton within w_contra_otrosi
end type
type pb_4 from picturebutton within w_contra_otrosi
end type
type t1 from tab within w_contra_otrosi
end type
type p1 from userobject within t1
end type
type dw_concab from datawindow within p1
end type
type p1 from userobject within t1
dw_concab dw_concab
end type
type p2 from userobject within t1
end type
type dw_fpago_ori from datawindow within p2
end type
type pb_2 from picturebutton within p2
end type
type dw_fpago from datawindow within p2
end type
type pb_3 from picturebutton within p2
end type
type p2 from userobject within t1
dw_fpago_ori dw_fpago_ori
pb_2 pb_2
dw_fpago dw_fpago
pb_3 pb_3
end type
type p3 from userobject within t1
end type
type dw_ppto_ori from datawindow within p3
end type
type pb_1 from picturebutton within p3
end type
type dw_ppto from datawindow within p3
end type
type pb_add_ppto from picturebutton within p3
end type
type pb_del_ppto from picturebutton within p3
end type
type dw_ori from datawindow within p3
end type
type mle_1 from multilineedit within p3
end type
type p3 from userobject within t1
dw_ppto_ori dw_ppto_ori
pb_1 pb_1
dw_ppto dw_ppto
pb_add_ppto pb_add_ppto
pb_del_ppto pb_del_ppto
dw_ori dw_ori
mle_1 mle_1
end type
type p4 from userobject within t1
end type
type dw_oc from datawindow within p4
end type
type pb_add_oc from picturebutton within p4
end type
type pb_del_oc from picturebutton within p4
end type
type p4 from userobject within t1
dw_oc dw_oc
pb_add_oc pb_add_oc
pb_del_oc pb_del_oc
end type
type pb from userobject within t1
end type
type pb_16 from picturebutton within pb
end type
type dw_ob from datawindow within pb
end type
type pb from userobject within t1
pb_16 pb_16
dw_ob dw_ob
end type
type t1 from tab within w_contra_otrosi
p1 p1
p2 p2
p3 p3
p4 p4
pb pb
end type
type dw_cab from datawindow within w_contra_otrosi
end type
end forward

global type w_contra_otrosi from window
integer width = 5458
integer height = 1836
boolean titlebar = true
string title = "Otrosi"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
pb_7 pb_7
pb_6 pb_6
pb_4 pb_4
t1 t1
dw_cab dw_cab
end type
global w_contra_otrosi w_contra_otrosi

type variables
boolean cambio, ppto
st_otrosi st_p
datawindowchild dwc_ori, dwc_t, dwc_f
string i_exige_origen
double monto_ant, otro_si, otro_org

end variables

forward prototypes
public function integer grabar (string tipo)
end prototypes

public function integer grabar (string tipo);long fila, numdoc, inicial, final, i, nd, it, numero
decimal monto, monto_int
string valor, cd, cl, objeto, msg
datetime fecha

if isNull(t1.p1.dw_concab.GetItemString(t1.p1.dw_concab.GetRow(),'documento')) then
	messageBox('Aviso','Debe seleccionar un tercero')
	Rollback;
	Return -1;
end if
if t1.p1.dw_concab.GetItemDateTime(t1.p1.dw_concab.GetRow(),'inicia') > t1.p1.dw_concab.GetItemDateTime(t1.p1.dw_concab.GetRow(),'termina') then
	messageBox('Aviso','Debe seleccionar fechas validas')
	Rollback;
	Return -1;
end if

if tipo = 'definitivo' then
	if t1.p3.dw_ppto.RowCount() = 0 and ppto then
		messageBox('Aviso','No puede contratar por un monto mayor al definido en presupuesto')
		Rollback;
		Return -1;
	else
		if (t1.p1.dw_concab.GetItemNumber(t1.p1.dw_concab.GetRow(),'monto') <> t1.p3.dw_ppto.GetItemNumber(1,'total') ) and ppto then
//		if (t1.p1.dw_concab.GetItemNumber(t1.p1.dw_concab.GetRow(),'monto') <> t1.p3.dw_ppto.GetItemNumber(1,'total_vigente') ) and ppto then
			messageBox('Aviso','No puede contratar por un monto diferente al definido en presupuesto')
			Rollback;
			Return -1;
		end if
	end if	
	if t1.p1.dw_concab.GetItemNumber(t1.p1.dw_concab.GetRow(),'monto') <= 0 then
		messageBox('Aviso','El monto del contrato debe ser mayor de cero')
		Return -1
	end if
	numdoc = t1.p1.dw_concab.GetItemNumber(1,'ncontrato')
	valor = t1.p2.dw_fpago.Describe("evaluate('sum(monto)',0)")
	if double(valor) > t1.p1.dw_concab.GetItemNumber(t1.p1.dw_concab.GetRow(),'monto') then
		messageBox('Aviso','La suma de montos de Forma de Pago es mayor del monto del Contrato')
		Rollback;
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
	
	if st_p.dw_cab.GetItemNumber(st_p.dw_cab.GetRow(),'monto') <> t1.p1.dw_concab.GetItemNumber(1,'monto') then
		monto = t1.p1.dw_concab.GetItemNumber(1,'monto')
		t1.p1.dw_concab.SetItem(1,'monto',st_p.dw_cab.GetItemNumber(st_p.dw_cab.GetRow(),'monto'))
		st_p.dw_cab.SetItem(st_p.dw_cab.GetRow(),'monto',monto)
		t1.p1.dw_concab.SetItem(1,'indmonto','1')
	end if
	if t1.p2.dw_fpago.Find("nuevo=1",1,t1.p2.dw_fpago.RowCount()) > 0  then
		t1.p1.dw_concab.SetItem(1,'indfpago','1')
	end if
	if st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'objeto') <> t1.p1.dw_concab.GetItemString(1,'objeto') then
		objeto = t1.p1.dw_concab.GetItemString(1,'objeto')
		t1.p1.dw_concab.SetItem(1,'objeto',st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'objeto'))
		st_p.dw_cab.SetItem(st_p.dw_cab.GetRow(),'objeto',objeto)
		t1.p1.dw_concab.SetItem(1,'indobje','1')
	end if
	if t1.p1.dw_concab.GetItemDateTime(t1.p1.dw_concab.GetRow(),'inicia') <> st_p.dw_cab.GetItemDateTime(st_p.dw_cab.GetRow(),'inicia') then
		fecha = t1.p1.dw_concab.GetItemDateTime(1,'inicia')
		t1.p1.dw_concab.SetItem(1,'inicia',st_p.dw_cab.GetItemDateTime(st_p.dw_cab.GetRow(),'inicia'))
		st_p.dw_cab.SetItem(st_p.dw_cab.GetRow(),'inicia',fecha)
		t1.p1.dw_concab.SetItem(1,'indfecha','1')
	end if

	if t1.p1.dw_concab.GetItemDateTime(t1.p1.dw_concab.GetRow(),'termina') <> st_p.dw_cab.GetItemDateTime(st_p.dw_cab.GetRow(),'termina') then
		fecha = t1.p1.dw_concab.GetItemDateTime(1,'termina')
		t1.p1.dw_concab.SetItem(1,'termina',st_p.dw_cab.GetItemDateTime(st_p.dw_cab.GetRow(),'inicia'))
		st_p.dw_cab.SetItem(st_p.dw_cab.GetRow(),'termina',fecha)
		t1.p1.dw_concab.SetItem(1,'indfecha','1')
	end if
	
	//// Otros valores

	if st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'codcontrato') <> t1.p1.dw_concab.GetItemString(1,'codcontrato') then
		objeto = t1.p1.dw_concab.GetItemString(1,'codcontrato')
		t1.p1.dw_concab.SetItem(1,'codcontrato',st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'codcontrato'))
		st_p.dw_cab.SetItem(st_p.dw_cab.GetRow(),'codcontrato',objeto)
	end if
	if st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'archivo') <> t1.p1.dw_concab.GetItemString(1,'archivo') then
		objeto = t1.p1.dw_concab.GetItemString(1,'archivo')
		t1.p1.dw_concab.SetItem(1,'archivo',st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'archivo'))
		st_p.dw_cab.SetItem(st_p.dw_cab.GetRow(),'archivo',objeto)
	end if
	if st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'interventor') <> t1.p1.dw_concab.GetItemString(1,'interventor') then
		objeto = t1.p1.dw_concab.GetItemString(1,'interventor')
		t1.p1.dw_concab.SetItem(1,'interventor',st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'interventor'))
		st_p.dw_cab.SetItem(st_p.dw_cab.GetRow(),'interventor',objeto)
	end if
	if st_p.dw_cab.GetItemNumber(st_p.dw_cab.GetRow(),'meses') <> t1.p1.dw_concab.GetItemNumber(1,'meses') then
		numero = t1.p1.dw_concab.GetItemNumber(1,'meses')
		t1.p1.dw_concab.SetItem(1, 'meses', st_p.dw_cab.GetItemNumber(st_p.dw_cab.GetRow(),'meses'))
		st_p.dw_cab.SetItem(st_p.dw_cab.GetRow(),'meses', numero)
	end if
	if st_p.dw_cab.GetItemNumber(st_p.dw_cab.GetRow(),'dias') <> t1.p1.dw_concab.GetItemNumber(1,'dias') then
		numero = t1.p1.dw_concab.GetItemNumber(1,'dias')
		t1.p1.dw_concab.SetItem(1, 'dias', st_p.dw_cab.GetItemNumber(st_p.dw_cab.GetRow(),'dias'))
		st_p.dw_cab.SetItem(st_p.dw_cab.GetRow(),'dias', numero)
	end if

	t1.p1.dw_concab.SetItem(1,'estado','1')
	st_p.dw_cab.SetItem(1,'en_destino','0')	
	if st_p.dw_cab.Update() = -1 then
		Rollback;
		Return -1
	end if
end if

if t1.p1.dw_concab.Update() = -1 then
	Rollback;
	Return -1
end if

if t1.p2.dw_fpago.Update() = -1 then
	Rollback;
	Return -1
end if

int l_i
for l_i = t1.p3.dw_ppto.rowcount()  to 1 step -1	
	if t1.p3.dw_ppto.getitemnumber(l_i,'otrosi')=-1 then 	t1.p3.dw_ppto.DeleteRow(l_i)
next

if t1.p3.dw_ppto.Update() = -1 then
	Rollback;
	Return -1
end if

for i = 1 to t1.p3.dw_ppto.RowCount()
	cd = t1.p3.dw_ppto.GetItemString(i,'coddoc_dispo')
	cl = t1.p3.dw_ppto.GetItemString(i,'cLugar_dispo')
	nd = t1.p3.dw_ppto.GetItemNumber(i,'numdoc_dispo')
	it = t1.p3.dw_ppto.GetItemNumber(i,'item_dispo')
	monto = t1.p3.dw_ppto.GetItemNumber(i,'monto')
	fila = t1.p3.dw_ppto_ori.Find("coddoc_dispo='" + cd + "' and clugar_dispo='" +cl+ "' and numdoc_dispo=" + string(nd) +" and item_dispo="+string(it),1,t1.p3.dw_ppto_ori.RowCount())
	if fila > 0 then
		if monto = t1.p3.dw_ppto_ori.GetItemNumber(fila,'monto') then Continue
		monto = monto - t1.p3.dw_ppto_ori.GetItemNumber(fila,'monto')
	end if
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

// Se guarda copia de lo original
if t1.p3.dw_ppto_ori.Update() = -1 then
	Rollback;
	Return -1
end if
if t1.p2.dw_fpago_ori.Update() = -1 then
	Rollback;
	Return -1
end if
//
for i = 1 to t1.p4.dw_oc.RowCount()
	if t1.p4.dw_oc.GetItemNumber(i,'viejo') = 1 then continue
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
if t1.p4.dw_oc.Update() = -1 then
	Rollback;
	Return -1
end if

if t1.pb.dw_ob.Update() = -1 then
	Rollback;
	Return -1
end if

st_p.Nuevo = FALSE

cambio = FALSE
commit;
Return 0

end function

on w_contra_otrosi.create
this.st_1=create st_1
this.pb_7=create pb_7
this.pb_6=create pb_6
this.pb_4=create pb_4
this.t1=create t1
this.dw_cab=create dw_cab
this.Control[]={this.st_1,&
this.pb_7,&
this.pb_6,&
this.pb_4,&
this.t1,&
this.dw_cab}
end on

on w_contra_otrosi.destroy
destroy(this.st_1)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.pb_4)
destroy(this.t1)
destroy(this.dw_cab)
end on

event open;st_p = Message.PowerObjectParm
t1.p1.dw_concab.SetTransObject(SQLCA)
t1.p1.dw_concab.GetChild('tipo',dwc_t)
dwc_t.SetTransObject(SQLCA)
if dwc_t.Retrieve(st_p.coddoc) = 0 then
	dwc_t.InsertRow(0)
end if

Int fa, ret
fa = st_p.dw_cab.GetRow()

t1.p1.dw_concab.GetChild('cod_flujo',dwc_f)
dwc_f.SetTransObject(SQLCA)
dwc_f.Retrieve(st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'coddoc'))

string lic_pres
ret = Registryget ( "HKEY_LOCAL_MACHINE\Software\GCI\", "lic_pres", regstring!, lic_pres)
if ret = -1 then
	ret = Registryget ( "HKEY_CURRENT_USER\Software\GCI\", "lic_pres", regstring!, lic_pres)
end if
if long(lic_pres) > 0 then 
	ppto = TRUE
//	t1.p3.Visible = TRUE
//	t1.p3.Enabled = TRUE
else
	ppto = FALSE
//	t1.p3.Visible = FALSE
//	t1.p3.Enabled = FALSE
end if

if st_p.dw_obj.RowCount() > 0 and not st_p.nuevo then
	dw_cab.Retrieve( st_p.dw_obj.GetItemNumber(st_p.dw_obj.GetRow(),'ano'), st_p.dw_obj.GetItemNumber(st_p.dw_obj.GetRow(),'ncontrato'),st_p.dw_obj.GetItemNumber(st_p.dw_obj.GetRow(),'otrosi'))
end if

if st_p.nuevo then
	int fila
	long contrato
	
	contrato = st_p.dw_cab.GetItemNumber(fa,'ncontrato')
	otro_org=st_p.dw_cab.GetItemNumber(fa,'otrosi')
	
	fila = dw_cab.InsertRow(1)
	dw_cab.SetItem(fila,'coddoc',st_p.dw_cab.GetItemString(fa,'coddoc'))
	dw_cab.SetItem(fila,'cLugar',st_p.dw_cab.GetItemString(fa,'clugar'))
	dw_cab.SetItem(fila,'ano',st_p.dw_cab.GetItemNumber(fa,'ano'))
	dw_cab.SetItem(fila,'ncontrato',st_p.dw_cab.GetItemNumber(fa,'ncontrato'))
	
	if isnull(st_p.dw_obj.GetItemNumber(1,'max_otrosi')) then  
		otro_si =0
	else
		otro_si=st_p.dw_obj.GetItemNumber(1,'max_otrosi')
	end if
	//otro_si = st_p.dw_cab.GetItemNumber(fa,'otrosi') + long(st_p.dw_obj.Describe("evaluate('if(ncontrato="+string(contrato)+",max(otrosi),0)',0)") ) + 1
	//otro_si=long(st_p.dw_obj.Describe("evaluate('if(ncontrato="+string(contrato)+",max(otrosi),0)',0)") ) + 1
	otro_si = st_p.dw_cab.GetItemNumber(fa,'otrosi') + otro_si +1
	dw_cab.SetItem(fila,'otrosi',otro_si)
	dw_cab.SetItem(fila,'estado','0')
	dw_cab.SetItem(fila,'tipodoc',st_p.dw_cab.GetItemString(fa,'tipodoc'))
	dw_cab.SetItem(fila,'documento',st_p.dw_cab.GetItemString(fa,'documento'))
	
	fila = t1.p1.dw_concab.InsertRow(1)
	t1.p1.dw_concab.SetItem(fila,'coddoc',st_p.dw_cab.GetItemString(fa,'coddoc'))
	t1.p1.dw_concab.SetItem(fila,'clugar',st_p.dw_cab.GetItemString(fa,'clugar'))
	t1.p1.dw_concab.SetItem(fila,'ncontrato',st_p.dw_cab.GetItemNumber(fa,'ncontrato'))
	t1.p1.dw_concab.SetItem(fila,'ano',st_p.dw_cab.GetItemNumber(fa,'ano'))
	t1.p1.dw_concab.SetItem(fila,'otrosi',otro_si)
	t1.p1.dw_concab.SetItem(fila,'estado','0')
	t1.p1.dw_concab.SetItem(fila,'tipodoc',st_p.dw_cab.GetItemString(fa,'tipodoc'))
	t1.p1.dw_concab.SetItem(fila,'documento',st_p.dw_cab.GetItemString(fa,'documento'))
	t1.p1.dw_concab.SetItem(fila,'nombre1',st_p.dw_cab.GetItemString(fa,'nombre1'))
	t1.p1.dw_concab.SetItem(fila,'nombre2',st_p.dw_cab.GetItemString(fa,'nombre2'))
	t1.p1.dw_concab.SetItem(fila,'apellido1',st_p.dw_cab.GetItemString(fa,'apellido1'))
	t1.p1.dw_concab.SetItem(fila,'apellido2',st_p.dw_cab.GetItemString(fa,'apellido2'))
	t1.p1.dw_concab.SetItem(fila,'razon_social',st_p.dw_cab.GetItemString(fa,'razon_social'))
	t1.p1.dw_concab.SetItem(fila,'tipo',st_p.dw_cab.GetItemString(fa,'tipo'))
	t1.p1.dw_concab.SetItem(fila,'codcontrato',st_p.dw_cab.GetItemString(fa,'codcontrato'))
	t1.p1.dw_concab.SetItem(fila,'inicia',st_p.dw_cab.GetItemDateTime(fa,'inicia'))
	t1.p1.dw_concab.SetItem(fila,'termina',st_p.dw_cab.GetItemDateTime(fa,'termina'))
	t1.p1.dw_concab.SetItem(fila,'interventor',st_p.dw_cab.GetItemString(fa,'interventor'))
	t1.p1.dw_concab.SetItem(fila,'archivo',st_p.dw_cab.GetItemString(fa,'archivo'))
	t1.p1.dw_concab.SetItem(fila,'objeto',st_p.dw_cab.GetItemString(fa,'objeto'))
	t1.p1.dw_concab.SetItem(fila,'usuario',usuario)
	t1.p1.dw_concab.SetItem(fila,'en_destino',st_p.dw_cab.GetItemString(fa,'en_destino'))
	t1.p1.dw_concab.SetItem(fila,'monto',st_p.dw_cab.GetItemNumber(fa,'monto'))	
	monto_ant=st_p.dw_cab.GetItemNumber(fa,'monto')
	t1.p1.dw_concab.SetItem(fila,'cod_flujo',st_p.dw_cab.GetItemString(fa,'cod_flujo'))

	t1.p1.dw_concab.SetItem(fila,'formapago',st_p.dw_cab.GetItemString(fa,'formapago'))
	t1.p1.dw_concab.SetItem(fila,'meses',st_p.dw_cab.GetItemnumber(fa,'meses'))
	t1.p1.dw_concab.SetItem(fila,'dias',st_p.dw_cab.GetItemnumber(fa,'dias'))
	
	cambio = TRUE
	t1.selectTab(t1.p1)
	
	t1.p3.dw_ppto_ori.Retrieve(dw_cab.GetItemNumber(1,'ano'), dw_cab.GetItemNumber(1,'ncontrato'), st_p.dw_cab.GetItemNumber(fa,'otrosi'))
	int i
	for i = 1 to t1.p3.dw_ppto_ori.rowcount()
		t1.p3.dw_ppto_ori.SetItem(i,'otrosi',otro_si)
		t1.p3.dw_ppto_ori.SetItemStatus(i,0,Primary!,NewModified!)
	next
	t1.p2.dw_fpago_ori.Retrieve(dw_cab.GetItemNumber(1,'ano'), dw_cab.GetItemNumber(1,'ncontrato'), st_p.dw_cab.GetItemNumber(fa,'otrosi'))
	for i = 1 to t1.p2.dw_fpago_ori.rowcount()
		t1.p2.dw_fpago_ori.SetItem(i,'otrosi',otro_si)
		t1.p2.dw_fpago_ori.SetItemStatus(i,0,Primary!,NewModified!)
	next

	t1.p3.dw_ppto.Retrieve(dw_cab.GetItemNumber(1,'ano'), dw_cab.GetItemNumber(1,'ncontrato'), st_p.dw_cab.GetItemNumber(fa,'otrosi'))
	t1.p2.dw_fpago.Retrieve(dw_cab.GetItemNumber(1,'ano'), dw_cab.GetItemNumber(1,'ncontrato'), st_p.dw_cab.GetItemNumber(fa,'otrosi'))
	t1.p4.dw_oc.Retrieve(dw_cab.GetItemNumber(1,'ano'), dw_cab.GetItemNumber(1,'ncontrato'), st_p.dw_cab.GetItemNumber(fa,'otrosi'))
	t1.pb.dw_ob.Retrieve(dw_cab.GetItemNumber(1,'ano'), dw_cab.GetItemNumber(1,'ncontrato'), st_p.dw_cab.GetItemNumber(fa,'otrosi'))
else
	t1.p3.dw_ppto.Retrieve(dw_cab.GetItemNumber(1,'ano'), dw_cab.GetItemNumber(1,'ncontrato'), st_p.dw_obj.GetItemNumber(st_p.dw_obj.getRow(),'otrosi'))
	t1.p2.dw_fpago.Retrieve(dw_cab.GetItemNumber(1,'ano'), dw_cab.GetItemNumber(1,'ncontrato'), st_p.dw_obj.GetItemNumber(st_p.dw_obj.getRow(),'otrosi'))
	t1.p4.dw_oc.Retrieve(dw_cab.GetItemNumber(1,'ano'), dw_cab.GetItemNumber(1,'ncontrato'), st_p.dw_obj.GetItemNumber(st_p.dw_obj.getRow(),'otrosi'))
	t1.pb.dw_ob.Retrieve(dw_cab.GetItemNumber(1,'ano'), dw_cab.GetItemNumber(1,'ncontrato'), st_p.dw_obj.GetItemNumber(st_p.dw_obj.getRow(),'otrosi'))
	t1.p1.dw_concab.Modify("cod_flujo.TabSequence = 0")
end if

fila = dwc_f.Find("codigo='"+ t1.p1.dw_concab.GetItemString(t1.p1.dw_concab.GetRow(),'cod_flujo') +"'",1,dwc_f.RowCount())
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

t1.p3.dw_ori.GetChild('cod_flujo',dwc_ori)
dwc_ori.SetTransObject(SQLCA)
dwc_ori.Retrieve(st_p.coddoc)

select exige_origen into :i_exige_origen from modulos_ventana where cod_ventana=:st_p.coddoc;
if i_exige_origen<>'1' or dwc_ori.rowcount()=0 then
	dwc_ori.insertrow(1)
	dwc_ori.setitem(1,2,'--- N I N G U N O ---')
end if
t1.p3.dw_ori.InsertRow(1)

end event

event closequery;int ret
if cambio then
	ret = MessageBox('Aviso','Ha realizado cambios. Desea grabarlos?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		Return grabar('temporal')
	elseif ret = 3 then
		Return -1
	end if
end if
st_p.dw_obj.Retrieve(st_p.dw_cab.GetItemNumber(st_p.dw_cab.GetRow(),'ano'),st_p.dw_cab.GetItemNumber(st_p.dw_cab.GetRow(),'ncontrato'))

end event

type st_1 from statictext within w_contra_otrosi
integer x = 59
integer y = 1500
integer width = 2907
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "La información que cambie afectará el contrato original y la información de este último se guardará en el documento de modificación"
boolean focusrectangle = false
end type

type pb_7 from picturebutton within w_contra_otrosi
event mousemove pbm_mousemove
string tag = "&Grabar Definitivo"
integer x = 2597
integer y = 1604
integer width = 146
integer height = 128
integer taborder = 120
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
	messageBox('Error','El documento ya ha sido cerrado')
	Return
end if
if messageBox('Aviso','Al grabar definitivo no podrá modificar de nuevo el documento. Desea Continuar?',Question!,YesNo!)=2 then Return
//if st_p.dw_ppto.Update(TRUE,FALSE) = -1 then
//	Rollback;
//	Return -1
//end if

if grabar('definitivo') = 0 then
	messageBox('Atención','Se guardaron las modificaciones')
	close(parent)
end if




end event

type pb_6 from picturebutton within w_contra_otrosi
event mousemove pbm_mousemove
string tag = "Grabar &Temporal"
boolean visible = false
integer x = 2752
integer y = 1604
integer width = 146
integer height = 128
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "                     &t"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Grabar &Temporal"
end type

event clicked;if dw_cab.RowCount() < 1 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Error','El documento ya ha sido cerrado')
	Return
end if
grabar('temporal')

end event

type pb_4 from picturebutton within w_contra_otrosi
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 2441
integer y = 1604
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
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type t1 from tab within w_contra_otrosi
event create ( )
event destroy ( )
integer x = 32
integer y = 20
integer width = 5381
integer height = 1464
integer taborder = 10
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
p2 p2
p3 p3
p4 p4
pb pb
end type

on t1.create
this.p1=create p1
this.p2=create p2
this.p3=create p3
this.p4=create p4
this.pb=create pb
this.Control[]={this.p1,&
this.p2,&
this.p3,&
this.p4,&
this.pb}
end on

on t1.destroy
destroy(this.p1)
destroy(this.p2)
destroy(this.p3)
destroy(this.p4)
destroy(this.pb)
end on

type p1 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5344
integer height = 1336
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
integer x = 5
integer width = 5289
integer height = 1308
integer taborder = 10
string title = "none"
string dataobject = "dw_concab"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event editchanged;if string(dwo.Name) = 'objeto' then
	this.acceptText()
end if
end event

event itemchanged;if this.AcceptText() = -1 then Return
choose case this.getColumnName()
	case "inicia"
		dw_cab.SetItem(dw_cab.GetRow(),'inicia',this.GetItemDateTime(this.GetRow(),'inicia'))
		if not isNull(GetItemDateTime(GetRow(),'termina')) then
			SetItem(GetRow(),'dias',DaysAfter(date(GetItemDateTime(GetRow(),'inicia')),date(GetItemDateTime(GetRow(),'termina'))))
		end if
	case "termina"
		dw_cab.SetItem(dw_cab.GetRow(),'termina',this.GetItemDateTime(this.GetRow(),'termina'))
		if not isNull(GetItemDateTime(GetRow(),'inicia')) then
			SetItem(GetRow(),'dias',DaysAfter(date(GetItemDateTime(GetRow(),'inicia')),date(GetItemDateTime(GetRow(),'termina'))))
		end if
	case "dias"
		if not isNull(GetItemDateTime(GetRow(),'inicia')) then
			SetItem(GetRow(),'termina',RelativeDate(date(GetItemDateTime(GetRow(),'inicia')),long(data)))
		end if
		dw_cab.SetItem(dw_cab.GetRow(),'termina',this.GetItemDateTime(this.GetRow(),'termina'))
	case "ano"
		dw_cab.SetItem(dw_cab.GetRow(),'ano',this.GetItemString(this.GetRow(),'ano'))	
//	case "monto"
//		decimal jaer
//		jaer=st_p.dw_ppto.GetItemnumber(st_p.dw_ppto.GetRow(),'total_utilizado')
//		//if st_p.dw_ppto.GetItemnumber(st_p.dw_ppto.GetRow(),'total_utilizado')<>0 and st_p.dw_ppto.GetItemnumber(st_p.dw_ppto.GetRow(),'total_utilizado') <> this.GetItemNumber(this.GetRow(),'monto') then
//		if st_p.dw_ppto.GetItemnumber(st_p.dw_ppto.GetRow(),'total')<>0 and st_p.dw_ppto.GetItemnumber(st_p.dw_ppto.GetRow(),'total') <> this.GetItemNumber(this.GetRow(),'monto') then
//			messageBox('Aviso','El documento tiene una reserva debe modificarla')
//			dw_concab.SetItem(dw_concab.GetRow(),'monto',monto_ant)
//			Return 1
//		else
//			dw_cab.SetItem(dw_cab.GetRow(),'monto',this.GetItemNumber(this.GetRow(),'monto'))
//			t1.p2.dw_fpago.TriggerEvent(RetrieveEnd!)
//		end if
end choose
cambio = TRUE

end event

event constructor;setTransObject(SQLCA)

end event

event retrieveend;if not isNull(GetItemDateTime(1,'inicia')) and not isNull(GetItemDateTime(1,'inicia')) then
	SetItem(GetRow(),'dias',DaysAfter(date(GetItemDateTime(GetRow(),'inicia')),date(GetItemDateTime(GetRow(),'termina'))))
end if

end event

event buttonclicked;if string(dwo.Name) = 'b_2' then
	string dirname, filename
	GetFileOpenName("Select File", dirname, filename, "DOC", "Doc Files (*.DOC),*.DOC, Text Files (*.TXT),*.TXT")
	if not isNull(dirname) then
		this.SetItem(this.GetRow(),'archivo',dirname)
	end if
end if

end event

event itemerror;return 1
end event

type p2 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5344
integer height = 1336
long backcolor = 67108864
string text = "Forma Pago"
long tabtextcolor = 33554432
string picturename = "Calculator.ico"
long picturemaskcolor = 536870912
dw_fpago_ori dw_fpago_ori
pb_2 pb_2
dw_fpago dw_fpago
pb_3 pb_3
end type

on p2.create
this.dw_fpago_ori=create dw_fpago_ori
this.pb_2=create pb_2
this.dw_fpago=create dw_fpago
this.pb_3=create pb_3
this.Control[]={this.dw_fpago_ori,&
this.pb_2,&
this.dw_fpago,&
this.pb_3}
end on

on p2.destroy
destroy(this.dw_fpago_ori)
destroy(this.pb_2)
destroy(this.dw_fpago)
destroy(this.pb_3)
end on

type dw_fpago_ori from datawindow within p2
boolean visible = false
integer x = 827
integer y = 956
integer width = 686
integer height = 400
integer taborder = 33
boolean enabled = false
string title = "none"
string dataobject = "dw_contra_fpago"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean border = false
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)
end event

type pb_2 from picturebutton within p2
event mousemove pbm_mousemove
integer x = 5147
integer y = 104
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
if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') = '2' then
	messageBox('Aviso','El documento ya ha sido cerrado. No puede modificarse')
	Return
end if
valor = dw_fpago.Describe("Evaluate('max(item)',0)")
fila = dw_fpago.InsertRow(0)
dw_fpago.SetItem(fila,'ano', st_p.dw_cab.GetItemNumber(st_p.dw_cab.getRow(),'ano'))
dw_fpago.SetItem(fila,'ncontrato', st_p.dw_cab.GetItemNumber(st_p.dw_cab.getRow(),'ncontrato'))
dw_fpago.SetItem(fila,'otrosi', st_p.dw_cab.GetItemNumber(st_p.dw_cab.getRow(),'otrosi'))
dw_fpago.SetItem(fila,'item',long(valor) + 1)
dw_fpago.SetItem(fila,'fecha',today())
dw_fpago.SetItem(fila,'total',t1.p1.dw_concab.GetItemNumber(1,'monto'))
dw_fpago.SetItem(fila,'nuevo',1)
dw_fpago.ScrolltoRow(fila)
dw_fpago.TriggerEvent(rowFocusChanged!)

Return fila

end event

type dw_fpago from datawindow within p2
integer x = 46
integer y = 108
integer width = 5093
integer height = 1116
integer taborder = 20
string title = "none"
string dataobject = "dw_contra_fpago"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
end event

event rowfocuschanged;//if GetItemNumber(GetRow(),'nuevo') = 1 then
//	t1.p2.dw_fpago.Modify('monto.edit.DisplayOnly=NO porcentaje.edit.DisplayOnly=NO des_pago.edit.DisplayOnly=no ')
//else
//	t1.p2.dw_fpago.Modify("monto.edit.DisplayOnly=Yes porcentaje.edit.DisplayOnly=yes des_pago.edit.DisplayOnly=yes")
//end if

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
	SetItem(i,'porcentaje',truncate((GetItemNumber(i,'monto') / GetItemNumber(i,'total')) * 100,2))
next

end event

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
	SetItem(f,'monto',GetItemNumber(f,'total') * GetItemNumber(f,'porcentaje') / 100)
elseif GetColumnName() = 'monto' then
	if AcceptText() = -1 then Return
	if GetItemNumber(GetRow(),'total') > 0 then
		SetItem(Getrow(),'porcentaje',truncate((GetItemNumber(GetRow(),'monto')/GetItemNumber(GetRow(),'total'))*100,2))
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

type pb_3 from picturebutton within p2
event mousemove pbm_mousemove
string tag = "Borrar Registro"
integer x = 5147
integer y = 228
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

if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '1' then
	if dw_fpago.GetItemNumber(dw_fpago.Getrow(),'nuevo') = 0 then
		MessageBox('Atención','Solo se pueden borrar registros nuevos')
		Return -1
	end if
end if
if dw_fpago.RowCount() = 0 then Return

dw_fpago.DeleteRow(dw_fpago.GetRow())
cambio = TRUE

end event

type p3 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5344
integer height = 1336
long backcolor = 67108864
string text = "Presupuesto"
long tabtextcolor = 33554432
string picturename = "disponible.ico"
long picturemaskcolor = 536870912
dw_ppto_ori dw_ppto_ori
pb_1 pb_1
dw_ppto dw_ppto
pb_add_ppto pb_add_ppto
pb_del_ppto pb_del_ppto
dw_ori dw_ori
mle_1 mle_1
end type

on p3.create
this.dw_ppto_ori=create dw_ppto_ori
this.pb_1=create pb_1
this.dw_ppto=create dw_ppto
this.pb_add_ppto=create pb_add_ppto
this.pb_del_ppto=create pb_del_ppto
this.dw_ori=create dw_ori
this.mle_1=create mle_1
this.Control[]={this.dw_ppto_ori,&
this.pb_1,&
this.dw_ppto,&
this.pb_add_ppto,&
this.pb_del_ppto,&
this.dw_ori,&
this.mle_1}
end on

on p3.destroy
destroy(this.dw_ppto_ori)
destroy(this.pb_1)
destroy(this.dw_ppto)
destroy(this.pb_add_ppto)
destroy(this.pb_del_ppto)
destroy(this.dw_ori)
destroy(this.mle_1)
end on

type dw_ppto_ori from datawindow within p3
boolean visible = false
integer x = 635
integer y = 852
integer width = 686
integer height = 400
integer taborder = 33
boolean enabled = false
string title = "none"
string dataobject = "dw_contra_ppto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

type pb_1 from picturebutton within p3
event mousemove pbm_mousemove
string tag = "Adicionar"
integer x = 5166
integer y = 292
integer width = 146
integer height = 128
integer taborder = 23
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "editar.gif"
string disabledname = "d_editar.gif"
alignment htextalign = left!
string powertiptext = "Reasignar Reservas"
end type

event clicked;If dw_cab.RowCount() = 0 then Return
string valor
long fila,i,j,k,f
if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') <> '0' then
	messageBox('Aviso','El documento ya ha sido cerrado. No puede modificarse')
	Return
end if

if MessageBox('Atención','Las reservas se reemplazarán con las que seleccione. Desea continuar?',Question!,yesno!) = 2 then Return 0
do while dw_ppto.RowCount() > 0 
	dw_ppto.DeleteRow(1)
loop
pb_del_ppto.Enabled = TRUE
st_interfaz st_parm
st_parm.dw_obj = dw_ppto
st_parm.dw_cab = t1.p1.dw_concab
st_parm.coddoc = 'PR'
st_parm.filtro = "en_destino='0' or isNull(en_destino) and estado ='1' and (cod_flujo like '%SCT')"
//if dw_cab.GetItemString(dw_cab.GetRow(),'coddoc') = 'SCT' then
//	st_parm.filtro = "%SCT"
//else
//	st_parm.filtro = "%NC"
//end if
st_parm.filtro = "%"
st_parm.codmod = t1.p1.dw_concab.GetItemString(1,'cod_flujo')
openwithparm(w_choosedisp, st_parm)

end event

type dw_ppto from datawindow within p3
event type long insertafila ( long fila )
integer x = 46
integer y = 32
integer width = 5047
integer height = 1044
integer taborder = 12
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
t1.p3.dw_ppto.SetItem(f,'otrosi', st_p.dw_cab.GetItemNumber(st_p.dw_cab.getRow(),'otrosi'))
t1.p3.dw_ppto.SetItem(f,'item',long(valor) + 1)
t1.p3.dw_ppto.SetItem(f,'usuario',usuario)
t1.p3.dw_ppto.SetItem(f,'nuevo',1)

Return f

end event

event rowfocuschanged;mle_1.Text = ''
if currentrow = 0 or RowCount() = 0 then Return
mle_1.Text = GetItemString(GetRow(),'objeto')

end event

event constructor;setTransObject(SQLCA)

end event

type pb_add_ppto from picturebutton within p3
event mousemove pbm_mousemove
string tag = "Adicionar"
integer x = 5166
integer y = 16
integer width = 146
integer height = 128
integer taborder = 13
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
long fila,i,j,k,f

if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') <> '0' then
	messageBox('Aviso','El documento ya ha sido cerrado. No puede modificarse')
	Return
end if

st_interfaz st_parm
st_parm.dw_fte = dw_ppto
st_parm.otrosi='1'
st_parm.dw_obj = st_p.dw_ppto
st_parm.dw_cab = t1.p1.dw_concab
st_parm.ld_row=t1.p1.dw_concab.getrow()
st_parm.filtro = "en_destino='0' or isNull(en_destino) and estado ='1' and (cod_flujo like '%SCT')"
if dw_cab.GetItemString(dw_cab.GetRow(),'coddoc') = 'SCT' then
	st_parm.filtro = "%SCT"
else
	st_parm.filtro = "%NC"
end if
st_parm.codmod = t1.p1.dw_concab.GetItemString(1,'cod_flujo')
openwithparm(w_choosedisp, st_parm)


end event

type pb_del_ppto from picturebutton within p3
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
string powertiptext = "Borrar Rubro"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messagebox('Error','El documento ya ha sido cerrado')
	Return
end if

if dw_ppto.RowCount() = 0 then Return
if dw_ppto.getItemNumber(dw_ppto.GetRow(), 'nuevo') = 0 then 
	MessageBox('Atención','Solo se puede eliminar disponibilidades agregadas en la modificación')
	return
end if
dw_ppto.DeleteRow(dw_ppto.GetRow())
cambio = TRUE

end event

type dw_ori from datawindow within p3
boolean visible = false
integer x = 553
integer y = 48
integer width = 1202
integer height = 76
integer taborder = 11
boolean enabled = false
string title = "none"
string dataobject = "dw_listmodulos"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type mle_1 from multilineedit within p3
integer x = 55
integer y = 1116
integer width = 5042
integer height = 196
integer taborder = 90
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

type p4 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5344
integer height = 1336
long backcolor = 67108864
string text = "Ordenes de Compra"
long tabtextcolor = 33554432
string picturename = "ordenar.ico"
long picturemaskcolor = 536870912
dw_oc dw_oc
pb_add_oc pb_add_oc
pb_del_oc pb_del_oc
end type

on p4.create
this.dw_oc=create dw_oc
this.pb_add_oc=create pb_add_oc
this.pb_del_oc=create pb_del_oc
this.Control[]={this.dw_oc,&
this.pb_add_oc,&
this.pb_del_oc}
end on

on p4.destroy
destroy(this.dw_oc)
destroy(this.pb_add_oc)
destroy(this.pb_del_oc)
end on

type dw_oc from datawindow within p4
event type long insertafila ( long fila )
event actmonto ( )
integer x = 78
integer y = 112
integer width = 4110
integer height = 1088
integer taborder = 30
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
this.SetItem(f,'otrosi',st_p.dw_cab.GetItemNumber(st_p.dw_cab.getRow(),'ncontrato'))
this.SetItem(f,'usuario',usuario)

Return f

end event

event actmonto();//dec monto1, monto2
//int i
//if t1.pb.dw_ob.RowCount() > 0 then
//	monto1 = t1.pb.dw_ob.GetItemNumber(t1.pb.dw_ob.GetRow(),'t_monto') + t1.pb.dw_ob.GetItemNumber(t1.pb.dw_ob.GetRow(),'t_iva')
//	if isNull(monto1) then monto1= 0
//end if
//if t1.p4.dw_oc.RowCount() > 0 then
//	monto2 = t1.p4.dw_oc.GetItemNumber(1,'compute_1')
//	if isNull(monto2) then monto2= 0
//end if
//
//t1.p1.dw_concab.SetItem(1,'monto',monto1 + monto2)
//for i = 1 to t1.p2.dw_fpago.RowCount()
//	t1.p2.dw_fpago.SetItem(i,'total',monto1 + monto2)
//next

end event

event constructor;setTransObject(SQLCA)
end event

type pb_add_oc from picturebutton within p4
event mousemove pbm_mousemove
string tag = "Adicionar"
integer x = 4265
integer y = 120
integer width = 142
integer height = 124
integer taborder = 40
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
long fila
if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') <> '0' then
	messageBox('Aviso','El documento ya ha sido cerrado. No puede modificarse')
	Return
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
	if dw_oc.GetItemNumber(i,'viejo') = 1 then Continue
	if dw_oc.GetItemString(i,'cod_flujo') = 'OCPDISCT' then
		dw_fr.Retrieve(dw_oc.GetItemString(i,'cod_flujo'),dw_oc.GetItemString(i,'coddoc'),dw_oc.GetItemString(i,'clugar'),dw_oc.GetItemNumber(i,'numdoc'))
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
	next

next

end event

type pb_del_oc from picturebutton within p4
event mousemove pbm_mousemove
string tag = "Borrar Registro"
integer x = 4270
integer y = 252
integer width = 142
integer height = 124
integer taborder = 50
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

event clicked;
if dw_oc.RowCount() = 0 then Return
if dw_oc.GetItemNumber(dw_oc.GetRow(),'viejo') = 0 then
	dw_oc.DeleteRow(dw_oc.GetRow())
	cambio = TRUE
else
	MessageBox('Atención','Solo puede retirar ordenes nuevas')
end if

end event

type pb from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5344
integer height = 1336
long backcolor = 67108864
string text = "Mano de Obra"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_16 pb_16
dw_ob dw_ob
end type

on pb.create
this.pb_16=create pb_16
this.dw_ob=create dw_ob
this.Control[]={this.pb_16,&
this.dw_ob}
end on

on pb.destroy
destroy(this.pb_16)
destroy(this.dw_ob)
end on

type pb_16 from picturebutton within pb
event mousemove pbm_mousemove
boolean visible = false
integer x = 4009
integer y = 68
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
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
dw_ob.SetItem(fila,'otrosi', st_p.dw_cab.GetItemNumber(st_p.dw_cab.getRow(),'ncontrato'))
dw_ob.SetItem(fila,'item',t1.p2.dw_fpago.GetItemNumber(t1.p2.dw_fpago.GetRow(),'item'))
dw_ob.SetItem(fila,'nobra',long(valor) + 1)
dw_ob.ScrolltoRow(fila)
Return fila

end event

type dw_ob from datawindow within pb
integer x = 142
integer y = 108
integer width = 3657
integer height = 1176
integer taborder = 50
string title = "none"
string dataobject = "dw_contra_obra"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//if GetColumnName() = 'cod_impu' then
//	SetItem(GetRow(),'porcentaje',dwc_i.GetItemNumber(dwc_i.GetRow(),'porcentaje'))
//	SetItem(GetRow(),'accion',dwc_i.GetItemString(dwc_i.GetRow(),'accion'))
//end if
//if not isNull(GetItemNumber(GetRow(),'monto')) and not isNull(GetItemNumber(GetRow(),'porcentaje')) then
//	SetItem(Getrow(),'iva',(GetItemNumber(GetRow(),'monto')*GetItemNumber(GetRow(),'porcentaje'))/100 )
//end if
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

event constructor;setTransObject(SQLCA)

end event

type dw_cab from datawindow within w_contra_otrosi
boolean visible = false
integer x = 2885
integer y = 8
integer width = 571
integer height = 96
integer taborder = 20
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_cabotrosi"
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
end event

event retrieveend;if rowcount() >0 then
	t1.p1.dw_concab.Retrieve(this.GetItemNumber(1,'ano'), this.GetItemNumber(1,'ncontrato'),this.GetItemNumber(1,'otrosi'))
	t1.p2.dw_fpago.Retrieve(this.GetItemNumber(1,'ano'), this.GetItemNumber(1,'ncontrato'),this.GetItemNumber(1,'otrosi'))
	t1.p3.dw_ppto.Retrieve(this.GetItemNumber(1,'ano'), this.GetItemNumber(1,'ncontrato'),this.GetItemNumber(1,'otrosi'))
	t1.p4.dw_oc.Retrieve(this.GetItemNumber(1,'ano'), this.GetItemNumber(1,'ncontrato'),this.GetItemNumber(1,'otrosi'))
	t1.pb.dw_ob.Retrieve(this.GetItemNumber(1,'ano'), this.GetItemNumber(1,'ncontrato'),this.GetItemNumber(1,'otrosi'))
end if

end event

