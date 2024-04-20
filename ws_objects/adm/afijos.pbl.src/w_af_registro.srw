$PBExportHeader$w_af_registro.srw
forward
global type w_af_registro from w_center
end type
type dw_cab from datawindow within w_af_registro
end type
type pb_nuevo from picturebutton within w_af_registro
end type
type pb_anular from picturebutton within w_af_registro
end type
type pb_cerrar from picturebutton within w_af_registro
end type
type st_3 from statictext within w_af_registro
end type
type pb_grabartmp from picturebutton within w_af_registro
end type
type st_4 from statictext within w_af_registro
end type
type pb_b from picturebutton within w_af_registro
end type
type t1 from tab within w_af_registro
end type
type p1 from userobject within t1
end type
type st_6 from statictext within p1
end type
type sle_1 from singlelineedit within p1
end type
type st_1 from statictext within p1
end type
type pb_delcomp from picturebutton within p1
end type
type pb_inscomp from picturebutton within p1
end type
type dw_comp from datawindow within p1
end type
type pb_borrar from picturebutton within p1
end type
type dw_cpo from datawindow within p1
end type
type p1 from userobject within t1
st_6 st_6
sle_1 sle_1
st_1 st_1
pb_delcomp pb_delcomp
pb_inscomp pb_inscomp
dw_comp dw_comp
pb_borrar pb_borrar
dw_cpo dw_cpo
end type
type p2 from userobject within t1
end type
type pb_exp from picturebutton within p2
end type
type dw_1 from datawindow within p2
end type
type rb_6 from radiobutton within p2
end type
type rb_5 from radiobutton within p2
end type
type pb_refresh from picturebutton within p2
end type
type st_5 from statictext within p2
end type
type rb_4 from radiobutton within p2
end type
type rb_3 from radiobutton within p2
end type
type st_2 from statictext within p2
end type
type dw_almfuente from datawindow within p2
end type
type pb_reg from picturebutton within p2
end type
type dw_kardexmov from datawindow within p2
end type
type rb_1 from radiobutton within p2
end type
type rb_2 from radiobutton within p2
end type
type p2 from userobject within t1
pb_exp pb_exp
dw_1 dw_1
rb_6 rb_6
rb_5 rb_5
pb_refresh pb_refresh
st_5 st_5
rb_4 rb_4
rb_3 rb_3
st_2 st_2
dw_almfuente dw_almfuente
pb_reg pb_reg
dw_kardexmov dw_kardexmov
rb_1 rb_1
rb_2 rb_2
end type
type t1 from tab within w_af_registro
p1 p1
p2 p2
end type
type st_7 from statictext within w_af_registro
end type
type sle_2 from singlelineedit within w_af_registro
end type
type pb_busca from picturebutton within w_af_registro
end type
type pb_7 from pb_report within w_af_registro
end type
type pb_3 from picturebutton within w_af_registro
end type
type gb_1 from groupbox within w_af_registro
end type
end forward

global type w_af_registro from w_center
string tag = "Ha realizado cambios. Desea guardarlos?"
integer width = 4681
integer height = 2452
string title = "Activos Fijos- Registro"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_registro.ico"
boolean center = false
dw_cab dw_cab
pb_nuevo pb_nuevo
pb_anular pb_anular
pb_cerrar pb_cerrar
st_3 st_3
pb_grabartmp pb_grabartmp
st_4 st_4
pb_b pb_b
t1 t1
st_7 st_7
sle_2 sle_2
pb_busca pb_busca
pb_7 pb_7
pb_3 pb_3
gb_1 gb_1
end type
global w_af_registro w_af_registro

type variables
DataWindowChild dwc_almfuente,dwc_alm,dwc_lugar
string codDocumento, placaAuto, prefijo, conPrefijo, codalm, i_operacion,placa_imp
int a_registrar
long nPlaca, nuevo
boolean transforma

end variables

forward prototypes
public function integer grabar (string tipo)
public function integer f_ins_comodato (string placa, integer fila)
public function integer grabar ()
public function integer grabar_cerrado ()
public function integer f_cambia_placa (long fila)
end prototypes

public function integer grabar (string tipo);long numdoc, inicial, final, i, placa, nd, j, comodato = -1
string msg, doc,splaca, l_placa,ca
if dw_cab.RowCount() = 0 then return -1
if t1.p1.dw_cpo.RowCount() = 0 then
	messageBox('Aviso','Ingrese articulos a registrar')
	Return -1
end if
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento de REGISTRO ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + &
	           ' ya ha sido cerrado')
	return -1
end if

for i = 1 to t1.p1.dw_cpo.RowCount()
	if isNull(t1.p1.dw_cpo.GetItemString(i,'placa')) or trim(t1.p1.dw_cpo.GetItemString(i,'placa')) = '' then
		t1.p1.dw_cpo.ScrolltoRow(i)
		MessageBox('Atención','Debe asignar una placa a cada activo')
		Return -1
	end if
	l_placa = trim(t1.p1.dw_cpo.GetItemString(i,'placa'))
	setNull(ca)
	select carticulo,numdoc into :ca,:nd from af_registro_cpo
	where placa=:l_placa;
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return -1
	END IF
	if not isNull(ca) then
		if nd = dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc') then
			//
		else
			MessageBox('Atención','La placa '+l_placa+' ya ha sido asignada a articulo con código '+ca+' en el documento '+string(nd))
			Return -1
		end if
	end if
next

if tipo = 'definitivo' then
	for i = 1 to t1.p1.dw_cpo.RowCount()
		if isNull(t1.p1.dw_cpo.GetItemString(i,'placa')) or trim(t1.p1.dw_cpo.GetItemString(i,'placa')) = '' then
			t1.p1.dw_cpo.ScrolltoRow(i)
			MessageBox('Atención','Debe asignar una placa a cada activo')
			Return -1
		end if
//		if isNull(t1.p1.dw_cpo.GetItemDateTime(i,'fechaservicio')) then
//			t1.p1.dw_cpo.ScrolltoRow(i)
//			MessageBox('Atención','Debe asignar una fecha de servicio a cada activo')
//			Return -1
//		end if
		if isNull(t1.p1.dw_cpo.GetItemNumber(i,'vidautil')) or t1.p1.dw_cpo.GetItemNumber(i,'vidautil') = 0 then
			t1.p1.dw_cpo.ScrolltoRow(i)
			MessageBox('Atención','Debe asignar una vida útil')
			Return -1
		end if
		if t1.p1.dw_cpo.GetItemString(i,'electrico') = '1' then
			if isNull(t1.p1.dw_cpo.GetItemNumber(i,'energia_x_unid')) or t1.p1.dw_cpo.GetItemNumber(i,'energia_x_unid') <= 0 then
				t1.p1.dw_cpo.ScrolltoRow(i)
				MessageBox('Atención','Si define como artículo eléctrico debe proveer un consumo en el campo energía')
				Return -1
			end if
		end if
	next
end if

if nuevo > 0 then
	numdoc = f_trae_ndoc(codDocumento,clugar,'Registro de Activos Fijos')
	if numdoc = -1 then 
		Rollback;
		Return -1
	end if
	dw_cab.SetItem(nuevo,'numdoc',numdoc)
	select placa into :placa from documentos
	where coddoc = :codDocumento and clugar=:clugar;
	IF SQLCA.SQLCode = -1 THEN 
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("SQL error", msg)
		Return -1
	END IF
	if isnull(placa) then
		placa=1
	else
		placa = placa + 1
	end if
	
	for i = 1 to t1.p1.dw_cpo.RowCount()
		t1.p1.dw_cpo.SetItem(i,'numdoc',numdoc)
		t1.p1.dw_cpo.ScrolltoRow(i)
		t1.p1.dw_cpo.TriggerEvent(RowFocusChanged!)
		if placaAuto = '1' then
			t1.p1.dw_cpo.SetItem(i,'placa', prefijo + string(placa,"00000"))
			placa = placa + 1
		else
			t1.p1.dw_cpo.SetItem(i,'placa',trim(t1.p1.dw_cpo.GetItemString(i,'placa')))
		end if
		for j = 1 to t1.p1.dw_comp.RowCount()
			string valor
			t1.p1.dw_comp.SetItem(j,'numdoc',numdoc)
			valor = t1.p1.dw_comp.describe("Evaluate('max(num_compo)', 1)")
			t1.p1.dw_comp.SetItem(j,'num_compo',long(valor) + 1)
			t1.p1.dw_comp.SetItem(j,'placa',t1.p1.dw_cpo.GetItemString(i,'placa')+"-"+string(long(valor) + 1))
		Next
	Next
end if

if tipo = 'definitivo' then
	for i = 1 to t1.p1.dw_cpo.RowCount()
		t1.p1.dw_cpo.SetItem(i,'estado','1')
	next
end if

if t1.p1.dw_cpo.AcceptText() = -1 then Return -1
if dw_cab.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
i_operacion = 'Delete'
if t1.p1.dw_comp.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
if t1.p1.dw_cpo.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
i_operacion = 'Insert'
if t1.p1.dw_cpo.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
if t1.p1.dw_comp.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

if tipo = 'definitivo' then
	for i = 1 to t1.p1.dw_cpo.RowCount()
		string codalmacen, codarticulo
		long ano, mes, item, plaq, entra
		codalmacen = t1.p1.dw_cpo.GetItemString(i,'codalmacen_kar')
		codarticulo = t1.p1.dw_cpo.GetItemString(i,'codarti_kar')
		ano = t1.p1.dw_cpo.GetItemNumber(i,'ano_kar')
		mes = t1.p1.dw_cpo.GetItemNumber(i,'mes_kar')
		item = t1.p1.dw_cpo.GetItemNumber(i,'item_kar')
		splaca = t1.p1.dw_cpo.GetItemString(i,'placa')
		select entradacant,placa,coddocref into :entra,:plaq,:doc from sum_kardex_mov
		where codalmacen=:codalmacen and codarti=:codarticulo and ano=:ano and mes=:mes and item=:item;
		IF SQLCA.SQLCode = -1 THEN 
			msg = SQLCA.SQLErrText
			Rollback;
			MessageBox("SQL error", msg)
			Return -1
		END IF
		if plaq = entra then
			Rollback;
			MessageBox('Atención','Se excede el número de artículos a plaquetizar. Se registraron en otro documento. Art '+codarticulo)
			Return -1
		end if
		
		update sum_kardex_mov set placa = placa + 1
		where codalmacen=:codalmacen and codarti=:codarticulo and ano=:ano and mes=:mes and item=:item;
		IF SQLCA.SQLCode = -1 THEN 
			msg = SQLCA.SQLErrText
			Rollback;
			MessageBox("SQL error", msg)
			Return -1
		END IF
		if comodato = -1 and doc = 'SF' then 
			comodato = MessageBox('Atención','Desea generar automáticamente los documentos de comodato?',Exclamation!,YESNO!)
		end if
		if doc = 'SF' and comodato = 1 then
			if f_ins_comodato(splaca,i) = -1 then 
				Rollback;
				Return -1
			end if
		end if
	Next
	if placaAuto = '1' then
		placa = long(t1.p1.dw_cpo.Describe("Evaluate('max(right(placa,4))',0)"))
		if placa > 0 then
			update documentos set placa = :placa
			where coddoc = :codDocumento and clugar = :clugar;
			IF SQLCA.SQLCode = -1 THEN 
				msg = SQLCA.SQLErrText
				Rollback;
				MessageBox("SQL error", msg)
				Return -1
			END IF
		else
			MessageBox('Atención','No pudo determinarse el valor de placa para controlar el consecutivo')
		end if
	end if
end if

nuevo = 0
dw_cab.ResetUpdate()
t1.p1.dw_cpo.ResetUpdate()
t1.p1.dw_comp.ResetUpdate()
t1.p2.dw_kardexmov.ResetUpdate()
if tipo = 'definitivo' then
	dw_cab.SetItem(dw_cab.GetRow(),'estado','1')
	t1.p2.dw_almfuente.TriggerEvent(itemchanged!)
end if
if dw_cab.Update() = -1 then
	Rollback;
	Return -1
end if
commit;
cambio = FALSE
t1.p2.TriggerEvent(itemchanged!)

Return 0

end function

public function integer f_ins_comodato (string placa, integer fila);long item
string msg,td,doc
datetime fechaserv,fecha

fechaserv = t1.p1.dw_cpo.GetItemDateTime(fila,'fechaservicio')
fecha = dw_cab.GetItemDateTime(fila,'fecha')
td = t1.p1.dw_cpo.GetItemString(fila,'tipodoc')
doc = t1.p1.dw_cpo.GetItemString(fila,'documento')
select estado into :item from af_comodato
where placa = :placa;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("SQL error", msg)
	Return -1
END IF
select max(item) into :item from af_comodato
where placa = :placa;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("SQL error", msg)
	Return -1
END IF
if isNull(item) then item = 0
item = item + 1
msg = 'Recibido en comodato Fianza '+string(t1.p1.dw_cpo.GetItemNumber(fila,'numdocref'))
Insert into af_comodato (placa,item,fecha,tipo,estado,fecha_entrega,tipodoc,documento,usuario,Observacion)
values (:placa,:item,:fecha,'1','1',:fechaserv,:td,:doc,:usuario,:msg);
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("SQL error", msg)
	Return -1
END IF

Return 0

end function

public function integer grabar ();Return grabar('temporal')

end function

public function integer grabar_cerrado ();if t1.p1.dw_cpo.update() = -1 then
	Rollback;
	Return -1
end if
if t1.p1.dw_comp.update() = -1 then
	Rollback;
	Return -1
end if

Return 0
end function

public function integer f_cambia_placa (long fila);long nd ,it, i, f, item
string cd, cl, msg, placa, nueva_placa

placa = t1.p1.dw_cpo.GetItemString(fila,'placa')
if isNull(placa) or trim(nueva_placa) = '' then
	Return 0
end if

cd = t1.p1.dw_cpo.GetItemString(fila,'coddocu')
cl = t1.p1.dw_cpo.GetItemString(fila,'clugar')	
nd = t1.p1.dw_cpo.GetItemNumber(fila,'numdoc')
it = t1.p1.dw_cpo.GetItemNumber(fila,'item')

t1.p1.dw_comp.Retrieve(cd,cl,nd)
t1.p1.dw_comp.SetFilter("item="+string(it))
t1.p1.dw_comp.Filter()

select max(item) into :item from af_registro_cpo
where coddocu=:cd and clugar=:cl and numdoc=:nd;
item = item + 1

Insert into af_registro_cpo (coddocu,clugar,numdoc,item,carticulo,placa,asignado,fechacompra,tipodoc,documento,serial,fechaservicio,garantia,nrogarantia,vidautil,inddeprecia,codalmacen_kar,codarti_kar,ano_kar,mes_kar,item_kar,electrico,energia_x_unid,vrcompra,vractual,vrmantto,vrvaloriza,vrdesvalor,estado)
select coddocu,clugar,numdoc,:item,carticulo,:nplaca,asignado,fechacompra,tipodoc,documento,serial,fechaservicio,garantia,nrogarantia,vidautil,inddeprecia,codalmacen_kar,codarti_kar,ano_kar,mes_kar,item_kar,electrico,energia_x_unid,vrcompra,vractual,vrmantto,vrvaloriza,vrdesvalor,estado
from af_registro_cpo where placa = :placa;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error insertando af_registro_cpo", msg)
	Return -1
end if

delete from af_reg_compo
where coddocu=:cd and clugar=:cl and numdoc=:nd and item=:it;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error borrando af_registro_cpo", msg)
	Return -1
end if

//	Insert Into af_reg_compo (coddocu,clugar,numdoc,item,num_compo,carticulo,placa,serial,fechaservicio,vrcompra,garantia,pgarantia,nrogarantia,vidautil,pvidautil,estado,descripcion)
//	select coddocu,clugar,numdoc,:item,num_compo,carticulo,placa,serial,fechaservicio,vrcompra,garantia,pgarantia,nrogarantia,vidautil,pvidautil,estado,descripcion
//	from af_reg_compo where coddocu=:cd and clugar=:cl and numdoc=:nd and item=:it;
//	if SQLCA.SQLCode = -1 then
//		msg = SQLCA.SQLErrText
//		rollback;
//		MessageBox("SQL error insertando af_reg_compo", msg)
//		Return -1
//	end if
//	hpb_1.stepIt()

update af_baja set placa=:nplaca
where placa = :placa;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error actualizando af_baja", msg)
	Return -1
end if


update af_comodato set placa=:nplaca
where placa = :placa;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error actualizando af_comodato", msg)
	Return -1
end if


update af_deprecia set placa=:nplaca
where placa = :placa;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error actualizando af_deprecia", msg)
	Return -1
end if


update af_mantenimiento set placa=:nplaca
where placa = :placa;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error actualizando af_mantenimiento", msg)
	Return -1
end if


Insert into af_respon (placa,item,codalmacen,fechaasignacion,coddoc_tras,clugar_tras,numdoc_tras,item_tras,estado,fechatraslado,usuario,anulado,fechaanulado)
select :nplaca,item,codalmacen,fechaasignacion,coddoc_tras,clugar_tras,numdoc_tras,item_tras,estado,fechatraslado,usuario,anulado,fechaanulado
from af_respon where placa = :placa;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error insertando af_respon", msg)
	Return -1
end if


Insert into af_respon_usu (placa,item,nrespon,tipodoc,documento,fechaasignacion,estado,fechatraslado,usuario,anulado,fechaanulado)
select :nplaca,item,nrespon,tipodoc,documento,fechaasignacion,estado,fechatraslado,usuario,anulado,fechaanulado 
from af_respon_usu where placa = :placa;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error insertando af_respon_usu", msg)
	Return -1
end if


delete from af_respon_usu where placa=:placa;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error borrando af_respon_usu", msg)
	Return -1
end if


delete from af_respon where placa=:placa;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error borrando af_respon", msg)
	Return -1
end if


delete from af_registro_cpo
where coddocu=:cd and clugar=:cl and numdoc=:nd and item=:it;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error borrando af_registro_cpo", msg)
	Return -1
end if

update af_registro_cpo set item=:it
where coddocu=:cd and clugar=:cl and numdoc=:nd and item=:item;
if SQLCA.SQLCode = -1 then
	msg = SQLCA.SQLErrText
	rollback;
	MessageBox("SQL error borrando af_registro_cpo", msg)
	Return -1
end if

for i = 1 to t1.p1.dw_comp.RowCount()
	 t1.p1.dw_comp.SetItemStatus(i, 0, Primary!, NewModified!)
next
if t1.p1.dw_comp.Update() = -1 then
	Rollback;
	Return -1
end if

Return 0

end function

on w_af_registro.create
int iCurrent
call super::create
this.dw_cab=create dw_cab
this.pb_nuevo=create pb_nuevo
this.pb_anular=create pb_anular
this.pb_cerrar=create pb_cerrar
this.st_3=create st_3
this.pb_grabartmp=create pb_grabartmp
this.st_4=create st_4
this.pb_b=create pb_b
this.t1=create t1
this.st_7=create st_7
this.sle_2=create sle_2
this.pb_busca=create pb_busca
this.pb_7=create pb_7
this.pb_3=create pb_3
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_cab
this.Control[iCurrent+2]=this.pb_nuevo
this.Control[iCurrent+3]=this.pb_anular
this.Control[iCurrent+4]=this.pb_cerrar
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.pb_grabartmp
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.pb_b
this.Control[iCurrent+9]=this.t1
this.Control[iCurrent+10]=this.st_7
this.Control[iCurrent+11]=this.sle_2
this.Control[iCurrent+12]=this.pb_busca
this.Control[iCurrent+13]=this.pb_7
this.Control[iCurrent+14]=this.pb_3
this.Control[iCurrent+15]=this.gb_1
end on

on w_af_registro.destroy
call super::destroy
destroy(this.dw_cab)
destroy(this.pb_nuevo)
destroy(this.pb_anular)
destroy(this.pb_cerrar)
destroy(this.st_3)
destroy(this.pb_grabartmp)
destroy(this.st_4)
destroy(this.pb_b)
destroy(this.t1)
destroy(this.st_7)
destroy(this.sle_2)
destroy(this.pb_busca)
destroy(this.pb_7)
destroy(this.pb_3)
destroy(this.gb_1)
end on

event open;call super::open;//t1.p2.dw_almfuente.SetTransObject(SQLCA)
dw_cab.SetTransObject(SQLCA)
t1.p1.dw_cpo.SetTransObject(SQLCA)
t1.p1.dw_comp.SetTransObject(SQLCA)

//t1.p2.dw_almfuente.GetChild('codalmacen', dwc_almfuente)
//dwc_almfuente.SetTransObject(SQLCA)
//if dwc_almfuente.Retrieve(usuario,'%') = 0 then
//	messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
//	dwc_almfuente.InsertRow(0)
//end if
//t1.p2.dw_almfuente.InsertRow(0)
t1.p2.dw_kardexmov.SetTransObject(SQLCA)
dw_cab.Retrieve()
//RegistryGet ("HKEY_LOCAL_MACHINE\software\GCI\ActivosFijos", "Prefijo", Regstring!, Prefijo)
//RegistryGet ("HKEY_LOCAL_MACHINE\software\GCI\ActivosFijos", "conPrefijo", Regstring!, conPrefijo)
SELECT cadena into :conPrefijo
FROM parametros_gen
WHERE (((codigo_para)=21));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 21')
	return 
end if

//RegistryGet ("HKEY_LOCAL_MACHINE\software\GCI\ActivosFijos", "placaAutomatica", Regstring!, placaAuto)
SELECT cadena into :placaAuto
FROM parametros_gen
WHERE (((codigo_para)=20));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 20')
	return 
end if

if placaAuto = '1' then 
	t1.p1.dw_cpo.Modify("placa.edit.DisplayOnly=TRUE")
	st_7.Visible = TRUE
else
	st_7.Visible = FALSE
	t1.p1.dw_cpo.Modify("placa.edit.DisplayOnly=FALSE")
end if
setNull(nplaca)

end event

event resize;call super::resize;t1.resize((newwidth - 50) , (newheight * 0.70))
t1.p1.dw_cpo.resize((newwidth - 300 ),772)
t1.p1.pb_borrar.x=t1.p1.dw_cpo.width+t1.p1.dw_cpo.x+20
t1.p1.dw_comp.resize((newwidth - 300 ),544)
t1.p1.pb_inscomp.x=t1.p1.dw_comp.width+t1.p1.dw_comp.x+20
t1.p1.pb_delcomp.x=t1.p1.dw_comp.width+t1.p1.dw_comp.x+20

t1.p2.dw_kardexmov.resize((newwidth - 100 ),(t1.height *0.73))
t1.p2.rb_1.y=t1.p2.dw_kardexmov.y+t1.p2.dw_kardexmov.height+20
t1.p2.rb_2.y=t1.p2.dw_kardexmov.y+t1.p2.dw_kardexmov.height+20
t1.p2.rb_3.y=t1.p2.dw_kardexmov.y+t1.p2.dw_kardexmov.height+20
t1.p2.rb_4.y=t1.p2.dw_kardexmov.y+t1.p2.dw_kardexmov.height+20
t1.p2.rb_5.y=t1.p2.dw_kardexmov.y+t1.p2.dw_kardexmov.height+20
t1.p2.rb_6.y=t1.p2.dw_kardexmov.y+t1.p2.dw_kardexmov.height+20

st_7.y=t1.y+t1.height+20
pb_cerrar.y=t1.y+t1.height+20
pb_anular.y=t1.y+t1.height+20
pb_grabartmp.y=t1.y+t1.height+20
pb_grabar.y=t1.y+t1.height+20
pb_busca.y=t1.y+t1.height+20
pb_3.y=t1.y+t1.height+20
pb_7.y=t1.y+t1.height+20
end event

type pb_grabar from w_center`pb_grabar within w_af_registro
integer x = 2473
integer y = 2076
integer taborder = 140
string powertiptext = "&Guardar Definitivo"
end type

event pb_grabar::clicked;call super::clicked;if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '1' then
	if MessageBox('Atención','Desea guardar cambios de campos permitidos?',QUESTION!,YesNo!) = 2 then Return 0
	grabar_cerrado()
else
	if MessageBox('Atención','Esta seguro de grabar definitivamente el documento?. No podrá modificarlo posteriormente',QUESTION!,YESNO!) = 2 then Return 0
	grabar('definitivo')
end if

end event

type dw_cab from datawindow within w_af_registro
event borrarnuevo ( )
integer x = 37
integer y = 88
integer width = 2277
integer height = 388
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_af_regcab"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event borrarnuevo();if nuevo > 0 then
	DeleteRow(nuevo)
	nuevo = 0
	cambio = FALSE
	PostEvent(RowFocuschanged!)
end if

end event

event rowfocuschanged;t1.p1.dw_cpo.Reset()
t1.p1.dw_comp.Reset()
if this.rowCount() = 0 then Return
t1.p1.dw_cpo.Retrieve(this.GetItemString(GetRow(),'coddocu'),this.GetItemString(GetRow(),'cLugar'),this.GetItemNumber(GetRow(),'numdoc'))
t1.p1.dw_comp.Retrieve(this.GetItemString(GetRow(),'coddocu'),this.GetItemString(GetRow(),'cLugar'),this.GetItemNumber(GetRow(),'numdoc'))

end event

event rowfocuschanging;if currentRow = nuevo and nuevo > 0 then 
	if messageBox('Aviso','El documento nuevo no ha sido guardado, perderá los cambios. Desea continuar?',QUESTION!,YESNO!) = 2 then
		return -1
	else
		postEvent('borrarnuevo')
		return -1
	end if
end if

if cambio then
	if messageBox('Aviso','El documento nuevo no ha sido guardado, perderá los cambios. Desea continuar?',QUESTION!,YESNO!) = 2 then
		return -1
	end if
	cambio = FALSE
end if

end event

event dberror;Rollback;
Return 0

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)


end event

type pb_nuevo from picturebutton within w_af_registro
event mousemove pbm_mousemove
string tag = "Nuevo Registro"
integer x = 2359
integer y = 84
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
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Nuevo Registro"
end type

event clicked;call super::clicked;long inicial, final, numdoc, fila
if nuevo > 0 then
	messageBox('Aviso','Existe un documento nuevo y no ha sido guardado')
	Return
end if
//if dw_cab.RowCount() > 0 then 
//	fila = dw_cab.find("estado='0'",1,dw_cab.RowCount())
//	if fila > 0 then
//		messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(fila,'numdoc')) + ' esta activo')
//		Return
//	end if
//end if
fila = dw_cab.InsertRow(1)
dw_cab.SetItem(fila,'coddocu',codDocumento)
dw_cab.SetItem(fila,'cLugar',cLugar)
dw_cab.SetItem(fila,'numdoc',numdoc)
dw_cab.SetItem(fila,'fecha',today())
dw_cab.SetItem(fila,'usuario',usuario)
dw_cab.SetItem(fila,'estado','0')
dw_cab.ScrollToRow(fila)
nuevo = fila
t1.p1.dw_cpo.Reset()

end event

type pb_anular from picturebutton within w_af_registro
event mousemove pbm_mousemove
string tag = "Anular Entrada"
integer x = 2181
integer y = 2076
integer width = 146
integer height = 128
integer taborder = 120
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
alignment htextalign = left!
string powertiptext = "Anular Registro"
end type

event clicked;long i, codnumero, item, recibido, ano, mes, fila, entra, plaq, com
string codalmacen, codarticulo, doc, msg, placa

if dw_cab.RowCount() = 0 then Return
if MessageBox('Atención','Esta seguro de anular el registro actual?',QUESTION!,YESNO!) = 2 then Return 0
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '2' then
	messageBox('Aviso','El documento de REGISTRO ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + &
	           ' ya ha sido anulado')
	return
end if

if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '0' and nuevo > 0 then
	pb_b.TriggerEvent(clicked!)
	Return 0
end if

if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '0' and nuevo = 0 then
	for i = 1 to t1.p1.dw_cpo.RowCount()
		t1.p1.dw_cpo.SetItem(i,'placa',anula_placa(placa))
	next
	if t1.p1.dw_cpo.Update() = -1 then
		Rollback;
		Return -1
	end if
	dw_cab.SetItem(dw_cab.GetRow(),'Estado','2')
	if dw_cab.Update() = 1 then
		commit;
	else
		rollback;
	end if
	return 0
end if

if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '1' then
	for i = 1 to t1.p1.dw_cpo.RowCount()  
		codalmacen = t1.p1.dw_cpo.GetItemString(i,'codalmacen_kar')
		codarticulo = t1.p1.dw_cpo.GetItemString(i,'codarti_kar')
		ano = t1.p1.dw_cpo.GetItemNumber(i,'ano_kar')
		mes = t1.p1.dw_cpo.GetItemNumber(i,'mes_kar')
		item = t1.p1.dw_cpo.GetItemNumber(i,'item_kar')
		placa = t1.p1.dw_cpo.GetItemString(i,'placa')
		select entradacant,placa,coddocref into :entra,:plaq,:doc from sum_kardex_mov
		where codalmacen=:codalmacen and codarti=:codarticulo and ano=:ano and mes=:mes and item=:item;
		IF SQLCA.SQLCode = -1 THEN 
			msg = SQLCA.SQLErrText
			Rollback;
			MessageBox("SQL error", msg)
			Return -1
		END IF
		if plaq = 0 then
			Rollback;
			MessageBox('Atención','Se registraría un número negativo para la cantidad plaquetizados. Art '+codarticulo)
			Return -1
		end if
		if doc = 'SF' then
			select item into :com from af_comodato 
			where placa=:placa and estado = '1';
			IF SQLCA.SQLCode = -1 THEN 
				msg = SQLCA.SQLErrText
				Rollback;
				MessageBox("SQL error", msg)
				Return -1
			END IF
			if item > 0 then
				update af_comodato set estado = '2' 
				where placa=:placa and item=:item;
				if SQLCA.SQLCode = -1 THEN 
					msg = SQLCA.SQLErrText
					Rollback;
					MessageBox("SQL error", msg)
					Return -1
				end if
			else
				//MessageBox('Atención','No se encontró comodato para anular')
			end if
		end if
		update sum_kardex_mov set placa = placa - 1
		where codalmacen=:codalmacen and codarti=:codarticulo and ano=:ano and mes=:mes and item=:item;
		IF SQLCA.SQLCode = -1 THEN 
			msg = SQLCA.SQLErrText
			Rollback;
			MessageBox("SQL error", msg)
			Return -1
		END IF
		t1.p1.dw_cpo.SetItem(i,'placa',anula_placa(placa))
		t1.p1.dw_cpo.SetItem(i,'estado','2')
	Next
	if t1.p1.dw_cpo.Update(TRUE,FALSE) = -1 then
		rollback;
		Return -1
	end if
	
	dw_cab.SetItem(dw_cab.GetRow(),'Estado','2')
	if dw_cab.Update(TRUE,FALSE) = -1 then
		rollback;
		Return -1
	end if
	commit;
	dw_cab.ResetUpdate()
	t1.p1.dw_cpo.ResetUpdate()
	
end if
t1.p2.dw_almfuente.TriggerEvent(itemchanged!)

end event

type pb_cerrar from picturebutton within w_af_registro
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 2034
integer y = 2076
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
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cerrar"
end type

event clicked;close(parent)

end event

type st_3 from statictext within w_af_registro
integer x = 46
integer y = 24
integer width = 553
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial de Registros"
boolean focusrectangle = false
end type

type pb_grabartmp from picturebutton within w_af_registro
event mousemove pbm_mousemove
string tag = "Guardar Temporal"
integer x = 2327
integer y = 2076
integer width = 146
integer height = 128
integer taborder = 130
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
alignment htextalign = left!
string powertiptext = "Guardar Temporal"
end type

event clicked;if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '1' then
	if MessageBox('Atención','Desea guardar cambios de campos permitidos?',QUESTION!,YesNo!) = 2 then Return 0
	grabar_cerrado()
else
	grabar('temporal')
end if

end event

type st_4 from statictext within w_af_registro
integer x = 2565
integer y = 80
integer width = 2011
integer height = 428
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "Seleccione el almacén del que se registrarán los artículos. Haga doble clic sobre los Artículos en Kardex y digite el número de elementos a registrar y complete los datos. Si tiene componentes adicionales, adiciónelos en la grilla componentes."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_b from picturebutton within w_af_registro
event mousemove pbm_mousemove
string tag = "Nuevo Registro"
integer x = 2359
integer y = 212
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
alignment htextalign = left!
string powertiptext = "Eliminar Registro Nuevo"
end type

event clicked;if nuevo > 0 and dw_cab.GetRow() = nuevo then
	dw_cab.DeleteRow(nuevo)
	nuevo = 0
	TriggerEvent(rowFocusChanged!)
end if

end event

type t1 from tab within w_af_registro
event create ( )
event destroy ( )
integer x = 32
integer y = 512
integer width = 4594
integer height = 1556
integer taborder = 150
boolean bringtotop = true
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
p1 p1
p2 p2
end type

on t1.create
this.p1=create p1
this.p2=create p2
this.Control[]={this.p1,&
this.p2}
end on

on t1.destroy
destroy(this.p1)
destroy(this.p2)
end on

type p1 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4558
integer height = 1428
long backcolor = 67108864
string text = "Activos Registrados"
long tabtextcolor = 33554432
string picturename = "audita.ico"
long picturemaskcolor = 536870912
st_6 st_6
sle_1 sle_1
st_1 st_1
pb_delcomp pb_delcomp
pb_inscomp pb_inscomp
dw_comp dw_comp
pb_borrar pb_borrar
dw_cpo dw_cpo
end type

on p1.create
this.st_6=create st_6
this.sle_1=create sle_1
this.st_1=create st_1
this.pb_delcomp=create pb_delcomp
this.pb_inscomp=create pb_inscomp
this.dw_comp=create dw_comp
this.pb_borrar=create pb_borrar
this.dw_cpo=create dw_cpo
this.Control[]={this.st_6,&
this.sle_1,&
this.st_1,&
this.pb_delcomp,&
this.pb_inscomp,&
this.dw_comp,&
this.pb_borrar,&
this.dw_cpo}
end on

on p1.destroy
destroy(this.st_6)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.pb_delcomp)
destroy(this.pb_inscomp)
destroy(this.dw_comp)
destroy(this.pb_borrar)
destroy(this.dw_cpo)
end on

type st_6 from statictext within p1
integer x = 2578
integer y = 524
integer width = 571
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within p1
boolean visible = false
integer x = 640
integer y = 480
integer width = 343
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
string text = "none"
borderstyle borderstyle = stylelowered!
end type

event modified;string codarticulo, descripcion
long fila

codarticulo = Text
if tag = '1' then
	tag = '0'
	fila = dw_comp.GetRow()
elseif tag = '0' then
	fila = pb_inscomp.Event clicked()
end if
select descripcion into :descripcion
from sumarticulo where codarticulo=:codarticulo;
IF SQLCA.SQLCode = -1 THEN 
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return -1
elseif SQLCA.SQLCode = 100 THEN 
	MessageBox("Error", 'El artículo no existe')
	Return -1
END IF
dw_comp.SetItem(fila,'carticulo',codarticulo)
dw_comp.SetItem(fila,'descripcion',descripcion)

end event

type st_1 from statictext within p1
integer x = 37
integer y = 792
integer width = 411
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Componentes"
boolean focusrectangle = false
end type

type pb_delcomp from picturebutton within p1
event mousemove pbm_mousemove
string tag = "Borrar Componente"
integer x = 4334
integer y = 996
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Componente"
end type

event clicked;if t1.p1.dw_cpo.RowCount() = 0 then return
if dw_cab.RowCount() = 0 then return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento de REGISTRO ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + &
	           ' ya ha sido cerrado')
	return
end if
dw_comp.DeleteRow(dw_comp.GetRow())

end event

type pb_inscomp from picturebutton within p1
event mousemove pbm_mousemove
string tag = "Insertar Componente"
integer x = 4334
integer y = 872
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Componente"
end type

event clicked;int fila
string valor
if t1.p1.dw_cpo.RowCount() = 0 then return
if dw_cab.RowCount() = 0 then return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento de REGISTRO ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + &
	           ' ya ha sido cerrado')
	return
end if
valor = dw_comp.describe("Evaluate('max(num_compo)', 1)")
fila = dw_comp.InsertRow(0)
dw_comp.SetItem(fila,'coddocu',dw_cpo.GetItemString(dw_cpo.GetRow(),'coddocu'))
dw_comp.SetItem(fila,'cLugar',dw_cpo.GetItemString(dw_cpo.GetRow(),'cLugar'))
dw_comp.SetItem(fila,'numdoc',dw_cpo.GetItemNumber(dw_cpo.GetRow(),'numdoc'))
dw_comp.SetItem(fila,'item',dw_cpo.GetItemNumber(dw_cpo.GetRow(),'item'))
dw_comp.SetItem(fila,'num_compo',long(valor) + 1)
dw_comp.SetItem(fila,'placa',dw_cpo.GetItemString(dw_cpo.GetRow(),'placa')+"-"+string(long(valor) + 1))
dw_comp.SetItem(fila,'estado','1')
dw_comp.ScrolltoRow(fila)
if not transforma then
	if not isValid(w_buscaArt) then
		sle_1.Tag = '1'
		openwithParm(w_buscaArt,sle_1)
	end if
end if
Return fila

end event

type dw_comp from datawindow within p1
integer x = 23
integer y = 860
integer width = 4256
integer height = 544
integer taborder = 160
boolean bringtotop = true
string title = "none"
string dataobject = "dw_af_regcom"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;call super::buttonclicked;
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '0' then
	sle_1.Tag = '1'
	openwithParm(w_buscaArt,sle_1)
end if

end event

event dberror;Rollback;
Return 0

end event

event itemchanged;if GetColumnName() = 'descripcion' then
	string vnul
	setNull(vnul)
	SetItem(GetRow(),'carticulo',vnul)
end if

end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	i_operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if i_operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif i_operacion = 'Insert' then
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if

end event

event losefocus;AcceptText()

end event

type pb_borrar from picturebutton within p1
event mousemove pbm_mousemove
string tag = "Borrar"
integer x = 4352
integer y = 20
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar"
end type

event clicked;long i, codnumero, item, recibido, ano, mes, fila
string codalmacen, codarticulo

if t1.p1.dw_cpo.RowCount() = 0 then return
if dw_cab.RowCount() = 0 then return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento de REGISTRO ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + &
	           ' ya ha sido cerrado')
	return
end if

i = t1.p1.dw_cpo.GetRow()
codalmacen = t1.p1.dw_cpo.GetItemString(i,'codalmacen_kar')
codarticulo = t1.p1.dw_cpo.GetItemString(i,'codarti_kar')
ano = t1.p1.dw_cpo.GetItemNumber(i,'ano_kar')
mes = t1.p1.dw_cpo.GetItemNumber(i,'mes_kar')
item = t1.p1.dw_cpo.GetItemNumber(i,'item_kar')
fila = t1.p2.dw_kardexmov.find("codalmacen='" + codalmacen + "' and codarti='" + codarticulo + &
	"' and ano=" + string(ano) + " and mes=" + string(mes) + " and item=" + string(item), &
	1,t1.p2.dw_kardexmov.RowCount())
if fila > 0 then
	t1.p2.dw_kardexmov.SetItem(fila,'placa',t1.p2.dw_kardexmov.GetItemNumber(fila,'placa') - 1)
end if
do while dw_comp.RowCount() > 0
	dw_comp.DeleteRow(1)
loop
t1.p1.dw_cpo.DeleteRow(i)

end event

type dw_cpo from datawindow within p1
integer x = 18
integer width = 4256
integer height = 772
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_af_regcpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row > 0 then
	this.SetRow(row)
end if
end event

event dberror;Rollback;
Return 0

end event

event rowfocuschanged;if currentRow = 0 or RowCount() = 0 then Return
if not isNull(GetItemNumber(dw_cpo.RowCount(),'item')) then
	dw_comp.SetFilter('item='+string(dw_cpo.GetItemNumber(dw_cpo.GetRow(),'item')))
	dw_comp.Filter()
end if
st_6.Text = 'Registro ' + string(GetRow())+ ' de '+string(RowCount())


end event

event rowfocuschanging;//if nuevo > 0 and dw_comp.RowCount() > 0 then 
//	if messageBox('Aviso','El documento no ha sido guardado, perderá los cambios de los COMPONENTES. Desea continuar?',QUESTION!,YESNO!) = 2 then
//		return -1
//	end if
//end if
//
end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	i_operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if i_operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif i_operacion = 'Insert' then
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if

end event

event itemchanged;if getColumnName() = 'fechaservicio' then
	long i
	AcceptText()
	for i = 1 to dw_comp.RowCount()
		dw_comp.SetItem(i,'fechaservicio',GetItemDateTime(GetRow(),'fechaservicio'))
	next
elseif getColumnName() = 'electrico' then
	AcceptText()
	if data = '0' then
		decimal vnul
		setNull(vnul)
		SetItem(getRow(),'energia_x_unid',vnul)
	end if
end if
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '0' then
	cambio = TRUE
end if


end event

event retrieveend;st_6.Text = 'Registro ' + string(GetRow())+ ' de '+string(RowCount())
long i
for i = 1 to RowCount()
	SetItem(i,'estado_cab',dw_cab.GetItemString(dw_cab.GetRow(),'estado'))
next

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

event losefocus;acceptText()

end event

event buttonclicked;if dw_cpo.RowCount() = 0 then Return -1
placa_imp=dw_cpo.getitemstring(row,'placa')
if pb_7.Event clicked() = -1 then Return -1


end event

type p2 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4558
integer height = 1428
long backcolor = 67108864
string text = "Pendientes de Registrar"
long tabtextcolor = 33554432
string picturename = "cambia_doc.ico"
long picturemaskcolor = 536870912
pb_exp pb_exp
dw_1 dw_1
rb_6 rb_6
rb_5 rb_5
pb_refresh pb_refresh
st_5 st_5
rb_4 rb_4
rb_3 rb_3
st_2 st_2
dw_almfuente dw_almfuente
pb_reg pb_reg
dw_kardexmov dw_kardexmov
rb_1 rb_1
rb_2 rb_2
end type

on p2.create
this.pb_exp=create pb_exp
this.dw_1=create dw_1
this.rb_6=create rb_6
this.rb_5=create rb_5
this.pb_refresh=create pb_refresh
this.st_5=create st_5
this.rb_4=create rb_4
this.rb_3=create rb_3
this.st_2=create st_2
this.dw_almfuente=create dw_almfuente
this.pb_reg=create pb_reg
this.dw_kardexmov=create dw_kardexmov
this.rb_1=create rb_1
this.rb_2=create rb_2
this.Control[]={this.pb_exp,&
this.dw_1,&
this.rb_6,&
this.rb_5,&
this.pb_refresh,&
this.st_5,&
this.rb_4,&
this.rb_3,&
this.st_2,&
this.dw_almfuente,&
this.pb_reg,&
this.dw_kardexmov,&
this.rb_1,&
this.rb_2}
end on

on p2.destroy
destroy(this.pb_exp)
destroy(this.dw_1)
destroy(this.rb_6)
destroy(this.rb_5)
destroy(this.pb_refresh)
destroy(this.st_5)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.st_2)
destroy(this.dw_almfuente)
destroy(this.pb_reg)
destroy(this.dw_kardexmov)
destroy(this.rb_1)
destroy(this.rb_2)
end on

type pb_exp from picturebutton within p2
string tag = "Exporta contenido"
integer x = 3237
integer y = 24
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
string picturename = "export.gif"
string disabledname = "d_export.gif"
alignment htextalign = left!
end type

event clicked;openwithparm(w_export,dw_kardexmov)

end event

type dw_1 from datawindow within p2
integer x = 27
integer y = 12
integer width = 1326
integer height = 132
integer taborder = 30
string title = "none"
string dataobject = "dw_combo_lugar_sumi"
boolean border = false
boolean livescroll = true
end type

event constructor;dw_1.GetChild('codlugar', dwc_lugar)
dwc_lugar.settransobject(sqlca)
dwc_lugar.retrieve(USUARIO)
insertrow(1)
setitem(1,1,clugar)

dw_almfuente.SetTransObject(SQLCA)
dw_almfuente.GetChild('codalmacen', dwc_alm)
dwc_alm.SetTransObject(SQLCA)
if dwc_alm.Retrieve(usuario,'%',clugar) = 0 then
	dw_almfuente.setitem(1,'codalmacen','')
	messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
	dw_almfuente.InsertRow(0)
end if
dw_almfuente.InsertRow(1)
end event

event itemchanged;string ls_clugar
ls_clugar=data
if dwc_alm.Retrieve(usuario,'%',ls_clugar) = 0 then
	dw_almfuente.setitem(row,'codalmacen','')
	messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
	dwc_alm.InsertRow(0)
end if
dw_almfuente.setitem(1,1,'')
dw_almfuente.InsertRow(0)
end event

type rb_6 from radiobutton within p2
integer x = 2272
integer y = 1332
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Donaciones"
end type

event clicked;if checked then
	dw_kardexmov.DataObject = 'dw_af_kardexmov'
	dw_kardexmov.SetTransObject(SQLCA)
end if	
dw_kardexmov.Retrieve(dw_almfuente.GetItemString(1,'codalmacen'),'SDN')
transforma = FALSE

end event

type rb_5 from radiobutton within p2
integer x = 1961
integer y = 1332
integer width = 320
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fianzas"
end type

event clicked;if checked then
	dw_kardexmov.DataObject = 'dw_af_kardexmov'
	dw_kardexmov.SetTransObject(SQLCA)
end if	
dw_kardexmov.Retrieve(dw_almfuente.GetItemString(1,'codalmacen'),'SF')
transforma = FALSE

end event

type pb_refresh from picturebutton within p2
event mousemove pbm_mousemove
string tag = "Registrar"
integer x = 2907
integer y = 20
integer width = 146
integer height = 128
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "refrescar.gif"
string disabledname = "d_refrescar.gif"
alignment htextalign = left!
string powertiptext = "Refrescar lista de pendientes"
end type

event clicked;if rb_1.Checked then
	rb_1.TriggerEvent(clicked!)
elseif rb_2.Checked then
	rb_2.TriggerEvent(clicked!)
elseif rb_3.Checked then
	rb_3.TriggerEvent(clicked!)
elseif rb_4.Checked then
	rb_4.TriggerEvent(clicked!)
elseif rb_5.Checked then
	rb_5.TriggerEvent(clicked!)
elseif rb_6.Checked then
	rb_6.TriggerEvent(clicked!)
end if

end event

type st_5 from statictext within p2
integer x = 2560
integer y = 928
integer width = 690
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type rb_4 from radiobutton within p2
integer x = 1330
integer y = 1332
integer width = 626
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Préstamos(comodatos)"
end type

event clicked;if checked then
	dw_kardexmov.DataObject = 'dw_af_kardexmov'
	dw_kardexmov.SetTransObject(SQLCA)
end if	
dw_kardexmov.Retrieve(dw_almfuente.GetItemString(1,'codalmacen'),'SF')
transforma = FALSE

end event

type rb_3 from radiobutton within p2
integer x = 814
integer y = 1332
integer width = 526
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Transformaciones"
end type

event clicked;if checked then
	dw_kardexmov.DataObject = 'dw_af_transmov'
	dw_kardexmov.SetTransObject(SQLCA)
end if
dw_kardexmov.Retrieve(dw_almfuente.GetItemString(1,'codalmacen'))
transforma = TRUE

end event

type st_2 from statictext within p2
integer x = 1399
integer y = 8
integer width = 274
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Almacén"
boolean focusrectangle = false
end type

type dw_almfuente from datawindow within p2
event retornar ( )
integer x = 1399
integer y = 60
integer width = 1161
integer height = 76
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_alm_ext"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retornar();this.SetItem(1,'descripcion',codalm)
end event

event itemchanged;AcceptText()
if rb_1.Checked then
	rb_1.TriggerEvent(clicked!)
elseif rb_2.Checked then
	rb_2.TriggerEvent(clicked!)
elseif rb_3.Checked then
	rb_3.TriggerEvent(clicked!)
elseif rb_4.Checked then
	rb_4.TriggerEvent(clicked!)
elseif rb_5.Checked then
	rb_5.TriggerEvent(clicked!)
elseif rb_6.Checked then
	rb_6.TriggerEvent(clicked!)
end if


end event

type pb_reg from picturebutton within p2
event mousemove pbm_mousemove
string tag = "Registrar"
integer x = 3058
integer y = 20
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
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
alignment htextalign = left!
string powertiptext = "Registrar"
end type

event clicked;long fila, i, j, fk
uo_datastore dw_cp
string alm, art, valor
long ano, mes, item,l_item

if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	if dw_cab.Find("estado='0'",1,dw_cab.RowCount()) > 0 then
		messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + ' no esta activo')
		Return
	else
		pb_nuevo.TriggerEvent(clicked!)
	end if
end if

if dw_kardexmov.RowCount() = 0 then return
fk = dw_kardexmov.Find("selec=1",1,dw_kardexmov.RowCount())
if fk = 0 then
	MessageBox('Atención','Debe seleccionar al menos un registro')
	Return 0
end if
a_registrar = 0
//open(w_cant)
//if a_registrar + dw_kardexmov.GetItemNumber(dw_kardexmov.GetRow(),'placa') > dw_kardexmov.GetItemNumber(dw_kardexmov.GetRow(),'entradacant') then
//	messageBox('Error','No puede registrar mas artículos de los recibidos')
//	Return
//end if

if isNull(nplaca) then
	select placa into :nplaca from documentos
	where coddoc = :codDocumento AND clugar=:clugar;
	IF SQLCA.SQLCode = -1 THEN 
		MessageBox("SQL error", SQLCA.SQLErrText)
		Rollback;
		Return
	END IF
	if isnull(nplaca) then
		nplaca=1
	end if
end if

l_item =t1.p1.dw_cpo.GetItemNumber(t1.p1.dw_cpo.getrow(),'max_item')
if isnull(l_item ) then
	l_item =0
end if
l_item = l_item + 1
fk = dw_kardexmov.Find("selec=1",1,dw_kardexmov.RowCount())
do while fk > 0 
	a_registrar = dw_kardexmov.GetItemNumber(fk,'registrar')
	alm = dw_kardexmov.GetItemString(fk,'codalmacen')
	art = dw_kardexmov.GetItemString(fk,'codarti')
	ano = dw_kardexmov.GetItemNumber(fk,'ano')
	mes = dw_kardexmov.GetItemNumber(fk,'mes')
	item = dw_kardexmov.GetItemNumber(fk,'item')
	valor = t1.p1.dw_cpo.Describe("Evaluate(~"sum(if(codalmacen_kar=~'"+alm+"~' and codarti_kar=~'"+art+"~' and ano_kar="+string(ano)+" and mes_kar="+string(mes)+" and item_kar="+string(item)+",1,0))~",0)")
	a_registrar = a_registrar - long(valor)
	dw_kardexmov.SetItem(dw_kardexmov.GetRow(),'placa', dw_kardexmov.GetItemNumber(dw_kardexmov.GetRow(),'placa') + a_registrar)

	if transforma then
		dw_cp = Create uo_datastore
		dw_cp.DataObject = 'dw_mvto_cpo'
		dw_cp.SetTransObject(SQLCA)
		dw_cp.SetFilter("tipo='I'")
		dw_cp.Retrieve(dw_kardexmov.GetItemString(fk,'coddocref'),dw_kardexmov.GetItemString(fk,'clugarref'),dw_kardexmov.GetItemNumber(fk,'numdocref'))
	end if

	for i = 1 to a_registrar
		nplaca = nplaca + 1
		fila=t1.p1.dw_cpo.InsertRow(0)
		t1.p1.dw_cpo.ScrolltoRow(fila)
		t1.p1.dw_cpo.SetItem(fila,'coddocu',dw_cab.GetItemString(dw_cab.GetRow(),'coddocu'))
		t1.p1.dw_cpo.SetItem(fila,'cLugar',dw_cab.GetItemString(dw_cab.GetRow(),'cLugar'))
		t1.p1.dw_cpo.SetItem(fila,'numdoc',dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc'))
		t1.p1.dw_cpo.SetItem(fila,'item',l_item)
		t1.p1.dw_cpo.SetItem(fila,'carticulo',dw_kardexmov.GetItemString(fk,'codarti'))
		t1.p1.dw_cpo.SetItem(fila,'descripcion',dw_kardexmov.GetItemString(fk,'descripcion'))
		t1.p1.dw_cpo.SetItem(fila,'fechacompra',dw_kardexmov.GetItemDateTime(fk,'fecha'))
		t1.p1.dw_cpo.SetItem(fila,'tipodoc',dw_kardexmov.GetItemString(fk,'tipodoc'))
		t1.p1.dw_cpo.SetItem(fila,'documento',dw_kardexmov.GetItemString(fk,'documento'))
		t1.p1.dw_cpo.SetItem(fila,'codalmacen_kar',dw_kardexmov.GetItemString(fk,'codalmacen'))
		t1.p1.dw_cpo.SetItem(fila,'codarti_kar',dw_kardexmov.GetItemString(fk,'codarti'))
		t1.p1.dw_cpo.SetItem(fila,'ano_kar',dw_kardexmov.GetItemNumber(fk,'ano'))
		t1.p1.dw_cpo.SetItem(fila,'mes_kar',dw_kardexmov.GetItemNumber(fk,'mes'))
		t1.p1.dw_cpo.SetItem(fila,'item_kar',dw_kardexmov.GetItemNumber(fk,'item'))
		t1.p1.dw_cpo.SetItem(fila,'coddocref',dw_kardexmov.GetItemString(fk,'coddocref'))
		t1.p1.dw_cpo.SetItem(fila,'clugarref',dw_kardexmov.GetItemString(fk,'clugarref'))
		t1.p1.dw_cpo.SetItem(fila,'numdocref',dw_kardexmov.GetItemNumber(fk,'numdocref'))
		t1.p1.dw_cpo.SetItem(fila,'vrcompra',dw_kardexmov.GetItemNumber(fk,'valorunit'))
		t1.p1.dw_cpo.SetItem(fila,'estado','0')
		t1.p1.dw_cpo.SetItem(fila,'vractual',dw_kardexmov.GetItemNumber(fk,'valorunit'))
		t1.p1.dw_cpo.SetItem(fila,'asignado','0')
		t1.p1.dw_cpo.SetItem(fila,'indDeprecia','1')
		t1.p1.dw_cpo.SetItem(fila,'estado_cab',dw_cab.GetItemString(dw_cab.GetRow(),'estado'))
		if not isNull(dw_kardexmov.GetItemString(fk,'documento')) and trim(dw_kardexmov.GetItemString(fk,'documento')) <> '' then
			t1.p1.dw_cpo.SetItem(fila,'nombre1',dw_kardexmov.GetItemString(fk,'nombre1'))
			t1.p1.dw_cpo.SetItem(fila,'nombre2',dw_kardexmov.GetItemString(fk,'nombre2'))
			t1.p1.dw_cpo.SetItem(fila,'apellido1',dw_kardexmov.GetItemString(fk,'apellido1'))
			t1.p1.dw_cpo.SetItem(fila,'apellido2',dw_kardexmov.GetItemString(fk,'apellido2'))
			t1.p1.dw_cpo.SetItem(fila,'razon_social',dw_kardexmov.GetItemString(fk,'razon_social'))
		end if
		if placaAuto = '1' then
			t1.p1.dw_cpo.SetItem(fila,'placa', prefijo + string(nplaca,"00000"))
		end if
		t1.p1.dw_cpo.TriggerEvent(rowfocuschanged!)
		if transforma then
			for j = 1 to dw_cp.RowCount()
				fila = t1.p1.pb_inscomp.Event clicked()
				t1.p1.dw_comp.SetItem(fila,'carticulo',dw_cp.GetItemString(j,'codarticulo'))
				t1.p1.dw_comp.SetItem(fila,'descripcion',dw_cp.GetItemString(j,'descripcion'))
				t1.p1.dw_comp.SetItem(fila,'vrcompra',dw_cp.GetItemNumber(j,'valor_unit'))
				t1.p1.dw_comp.SetItem(fila,'estado_cab',dw_cab.GetItemString(dw_cab.GetRow(),'estado'))
			next
		end if
		l_item=l_item+1
		cambio = TRUE
	next
//	if isNull(dw_kardexmov.GetItemNumber(dw_kardexmov.GetRow(),'placa')) then
//		dw_kardexmov.SetItem(dw_kardexmov.GetRow(),'placa', a_registrar)
//	else
//		dw_kardexmov.SetItem(dw_kardexmov.GetRow(),'placa', dw_kardexmov.GetItemNumber(dw_kardexmov.GetRow(),'placa') + a_registrar)
//	end if
	dw_kardexmov.SetItem(fk,'selec',0)
	fk = dw_kardexmov.Find("selec=1",1,dw_kardexmov.RowCount())
loop
t1.SelectTab(t1.p1)

end event

type dw_kardexmov from datawindow within p2
integer x = 27
integer y = 168
integer width = 4507
integer height = 1164
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_af_kardexmov"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;Rollback;
Return 0

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

event rowfocuschanged;if currentrow = 0 then Return 0
st_5.Text = 'Registro ' + string(GetRow())+ ' de '+string(RowCount())

end event

event retrieveend;st_5.Text = 'Registro ' + string(GetRow())+ ' de '+string(RowCount())

end event

event clicked;if dwo.Name = 'selec_t' then
	long i
	if describe("selec_t.Text") = 'Selec.' then
		for i = 1 to RowCount()
			SetItem(i,'selec',1)
		next
		Modify("selec_t.Text='Desel.'")
	else
		for i = 1 to RowCount()
			SetItem(i,'selec',0)
		next
		Modify("selec_t.Text='Selec.'")
	end if
end if

end event

event losefocus;acceptText()

end event

type rb_1 from radiobutton within p2
integer x = 27
integer y = 1332
integer width = 315
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Entradas"
boolean checked = true
end type

event clicked;if checked then
	dw_kardexmov.DataObject = 'dw_af_kardexmov'
	dw_kardexmov.SetTransObject(SQLCA)
end if	
dw_kardexmov.Retrieve(dw_almfuente.GetItemString(1,'codalmacen'),'SE')
transforma = FALSE

end event

type rb_2 from radiobutton within p2
integer x = 347
integer y = 1332
integer width = 466
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Saldos Iniciales"
end type

event clicked;if checked then
	dw_kardexmov.DataObject = 'dw_af_saldomov'
	dw_kardexmov.SetTransObject(SQLCA)
end if
dw_kardexmov.Retrieve(dw_almfuente.GetItemString(1,'codalmacen'))
transforma = FALSE

end event

type st_7 from statictext within w_af_registro
integer x = 73
integer y = 2076
integer width = 1883
integer height = 164
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "El sistema asignará la placa automáticamente. Si desea asignarla manualmente, ingrese al configurador/parámetros generales y en la ficha Activos Fijos deseleccione la casilla Generación de Placa Automática"
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_2 from singlelineedit within w_af_registro
boolean visible = false
integer x = 3397
integer y = 2108
integer width = 402
integer height = 80
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;pb_busca.Event clicked()

end event

type pb_busca from picturebutton within w_af_registro
event mousemove pbm_mousemove
string tag = "Guardar Temporal"
integer x = 2624
integer y = 2076
integer width = 146
integer height = 128
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "buscar.gif"
string disabledname = "d_buscar.gif"
alignment htextalign = left!
string powertiptext = "Buscar Activo en documentos de Registro"
end type

event clicked;openwithparm(w_busca_activos,dw_cab)
//dw_ter_tmp.TriggerEvent(itemchanged!)

//double nd
//long fila
//string l_buscar, cl
//l_buscar = sle_2.Text
//if trim(l_buscar) = '' then Return 0
//select numdoc, clugar into :nd, :cl from af_registro_cpo
//where placa=:l_buscar;
//IF SQLCA.SQLCode = -1 THEN
//	MessageBox("SQL error", SQLCA.SQLErrText)
//	Return 0
//elseif SQLCA.SQLCode = 100 THEN
//	MessageBox('Atención', 'No se encuentra el activo con placa '+l_buscar)
//	Return 0
//elseif SQLCA.SQLCode = 0 THEN
//	if MessageBox('Atención', 'el activo se encuentra registrado en el documento '+string(nd)+'  Desea ve	1 VBNr el documento?',QUESTION!,YesNo!) = 2 then Return 
//	fila = dw_cab.Find("numdoc="+string(nd)+" and clugar='"+cl+"'",1,dw_cab.RowCount())
//	if fila > 0 then
//		dw_cab.ScrolltoRow(fila)
//		fila = t1.p1.dw_cpo.Find("placa='"+l_buscar+"'",1,t1.p1.dw_cpo.RowCount())
//		if fila > 0 then
//			t1.p1.dw_cpo.ScrolltoRow(fila)
//		end if
//	else
//		MessageBox('Atención','No se encontró el documento '+string(nd)+' con lugar '+cl)
//	end if
//	Return 0
//END IF
//
end event

type pb_7 from pb_report within w_af_registro
boolean visible = false
integer x = 2953
integer y = 2076
integer taborder = 50
boolean bringtotop = true
string powertiptext = "Click contrario para propiedades"
string cod_rep = "PLAC"
string nombre_rep = "Placa"
string tipo_rep = "interno!"
boolean v_preliminar = true
end type

event clicked;call super::clicked;any par[1]
par[1]=placa_imp
imprimir(par,'','0')
end event

type pb_3 from picturebutton within w_af_registro
event mousemove pbm_mousemove
string tag = "Imprimir Reporte"
integer x = 2770
integer y = 2076
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
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
alignment htextalign = left!
string powertiptext = "Imprimir Reporte"
end type

event clicked;if dw_cab.RowCount() < 1 then Return
any param[10]
param[1] = dw_cab.GetItemString(dw_cab.getrow(),'coddocu')
param[2] = dw_cab.GetItemString(dw_cab.getrow(),'clugar')
param[3] = dw_cab.GetItemNumber(dw_cab.getrow(),'numdoc')
f_reporte(dw_cab.GetItemString(dw_cab.getrow(),'coddocu'),'REGISTRO DE ACTIVOS',param)

end event

type gb_1 from groupbox within w_af_registro
boolean visible = false
integer x = 3154
integer y = 2060
integer width = 855
integer height = 168
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar"
end type

