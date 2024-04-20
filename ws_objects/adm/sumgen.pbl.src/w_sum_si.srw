$PBExportHeader$w_sum_si.srw
$PBExportComments$Saldos Iniciales - Ajustes
forward
global type w_sum_si from window
end type
type st_6 from statictext within w_sum_si
end type
type dw_lug from datawindow within w_sum_si
end type
type pb_11 from picturebutton within w_sum_si
end type
type dw_kardex from datawindow within w_sum_si
end type
type pb_tempo from picturebutton within w_sum_si
end type
type pb_cancelar from picturebutton within w_sum_si
end type
type pb_anular from picturebutton within w_sum_si
end type
type pb_imp from picturebutton within w_sum_si
end type
type pb_lote from picturebutton within w_sum_si
end type
type pb_nuevo from picturebutton within w_sum_si
end type
type pb_borrar from picturebutton within w_sum_si
end type
type pb_ter from picturebutton within w_sum_si
end type
type t1 from tab within w_sum_si
end type
type pk from userobject within t1
end type
type sle_1 from singlelineedit within pk
end type
type rb_2 from radiobutton within pk
end type
type rb_1 from radiobutton within pk
end type
type pb_1 from picturebutton within pk
end type
type pb_7 from picturebutton within pk
end type
type dw_k from datawindow within pk
end type
type pk from userobject within t1
sle_1 sle_1
rb_2 rb_2
rb_1 rb_1
pb_1 pb_1
pb_7 pb_7
dw_k dw_k
end type
type pd from userobject within t1
end type
type st_3 from statictext within pd
end type
type st_2 from statictext within pd
end type
type pb_10 from picturebutton within pd
end type
type pb_9 from picturebutton within pd
end type
type pb_8 from picturebutton within pd
end type
type pb_6 from picturebutton within pd
end type
type dw_cpo from datawindow within pd
end type
type dw_l from datawindow within pd
end type
type pd from userobject within t1
st_3 st_3
st_2 st_2
pb_10 pb_10
pb_9 pb_9
pb_8 pb_8
pb_6 pb_6
dw_cpo dw_cpo
dw_l dw_l
end type
type t1 from tab within w_sum_si
pk pk
pd pd
end type
type dw_c from datawindow within w_sum_si
end type
type dw_alm from datawindow within w_sum_si
end type
type gb_1 from groupbox within w_sum_si
end type
type pb_grabar from picturebutton within w_sum_si
end type
type dw_cab from datawindow within w_sum_si
end type
type st_1 from statictext within w_sum_si
end type
end forward

global type w_sum_si from window
integer width = 5499
integer height = 2416
boolean titlebar = true
string title = "Suministros"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
st_6 st_6
dw_lug dw_lug
pb_11 pb_11
dw_kardex dw_kardex
pb_tempo pb_tempo
pb_cancelar pb_cancelar
pb_anular pb_anular
pb_imp pb_imp
pb_lote pb_lote
pb_nuevo pb_nuevo
pb_borrar pb_borrar
pb_ter pb_ter
t1 t1
dw_c dw_c
dw_alm dw_alm
gb_1 gb_1
pb_grabar pb_grabar
dw_cab dw_cab
st_1 st_1
end type
global w_sum_si w_sum_si

type variables
string coddocumento, codalm, operacion, desdoc
DataWindowChild dwc_alm, dwc_f, dwc_i,dwc_lugar
long nuevo
string ordenar[6]
boolean tmp
int i_dec_gral,i_aprox_gral
end variables

forward prototypes
public function integer grabar_tmp ()
public function integer reversa ()
public function integer anula (string coddoc, string lugar, double numdoc, string codalmacen)
end prototypes

public function integer grabar_tmp ();if dw_cab.RowCount() = 0 then Return -1

if not(dw_cab.GetItemString(1,'estado') = '0') then
	MessageBox('Atención','El documento no está activo')
	Return -1
end if

if t1.pd.dw_cpo.RowCount() = 0 then 
	MessageBox('Atención','No ha agregado ningun artículo al detalle del documento')
	Return -1
end if

if f_num_compu('s','o') = FALSE then Return -1

t1.pd.dw_cpo.SetFilter("")
t1.pd.dw_cpo.Filter()

long i,j
double numdoc

if nuevo > 0 then
	numdoc = f_trae_ndoc(dw_cab.GetItemString(1,'coddoc'),clugar,desdoc)
	if numdoc < 0 then Return -1
	dw_cab.SetItem(1,'numdoc',numdoc)
	dw_c.SetItem(dw_c.GetRow(),'numdoc',numdoc)
	for i = 1 to t1.pd.dw_cpo.RowCount()
		t1.pd.dw_cpo.SetItem(i,'numdoc',numdoc)
		t1.pd.dw_cpo.ScrolltoRow(i)
		t1.pd.dw_cpo.Event RowFocuschanged(i)
		for j = 1 to t1.pd.dw_l.RowCount()
			t1.pd.dw_l.SetItem(j,'numdoc',numdoc)
		next
	next
end if

if dw_cab.Update(TRUE,FALSE) = -1 then
	Rollback;
	reversa()
	Return -1
end if
operacion = 'Delete'
if t1.pd.dw_l.Update(TRUE,FALSE) = -1 then
	Rollback;
	reversa()
	Return -1
end if
if t1.pd.dw_cpo.Update(TRUE,FALSE) = -1 then
	Rollback;
	reversa()
	Return -1
end if
operacion = 'Insert'
if t1.pd.dw_cpo.Update(TRUE,FALSE) = -1 then
	Rollback;
	reversa()
	Return -1
end if
if t1.pd.dw_l.Update(TRUE,FALSE) = -1 then
	Rollback;
	reversa()
	Return -1
end if

return 0

end function

public function integer reversa ();long i,j
if tmp then Return 0
dw_cab.SetItem(1,'estado','0')
//dw_cab.SetItemStatus(dw_cab.GetRow(),0, Primary!,NewModified!)
//t1.pd.dw_cpo.SetRedraw(FALSE)
//t1.pd.dw_l.SetRedraw(FALSE)
//for i = 1 to t1.pd.dw_cpo.RowCount()
//	t1.pd.dw_cpo.Scrolltorow(i)
//	t1.pd.dw_cpo.SetItemStatus(i,0, Primary!,NewModified!)
//	for j =  1 to t1.pd.dw_l.RowCount()
//		t1.pd.dw_l.SetItemStatus(j,0, Primary!,NewModified!)
//	next
//next
t1.pd.dw_cpo.SetRedraw(TRUE)
t1.pd.dw_l.SetRedraw(TRUE)

Return 0

end function

public function integer anula (string coddoc, string lugar, double numdoc, string codalmacen);uo_datastore dw_kx, dw_kardexmov, dw_lote, dw_lote_mov
decimal cProm, saldo, cPromIni, valor, cPromAnt, saldokd

dw_kx = Create uo_datastore
dw_kx.DataObject = 'dw_kardex'
dw_kx.SetTransObject(SQLCA)
//dw_kardexdeta = Create uo_datastore
//dw_kardexdeta.DataObject = 'dw_kardexdeta'
//dw_kardexdeta.SetTransObject(SQLCA)
dw_kardexmov = Create uo_datastore
dw_kardexmov.DataObject = 'dw_kardexmov'
dw_kardexmov.SetTransObject(SQLCA)

dw_lote = Create uo_datastore
dw_lote.DataObject = 'dw_lote'
dw_lote.SetTransObject(SQLCA)
dw_lote_mov = Create uo_datastore
dw_lote_mov.DataObject = 'dw_lote_mov_anula'
dw_lote_mov.SetTransObject(SQLCA)

// Reversa entradas a Kardex
string codarticulo
long i,ano, mes,fila
datetime fec
dec entra, sale

dw_kardexmov.Retrieve(coddoc,cLugar,numdoc,codalmacen )
for i =  1 to dw_kardexmov.RowCount() 
	codarticulo = dw_kardexmov.GetItemString(i,'codarti')
	entra = dw_kardexmov.GetItemNumber(i,'entradacant')
	sale = dw_kardexmov.GetItemNumber(i,'salidacant')
	if isNull(entra) then entra = 0
	if isNull(sale) then sale = 0
	fec = dw_kardexmov.GetItemDateTime(i,'fecha_anula')
	if not isNull(fec) then Continue
	ano = dw_kardexmov.GetItemNumber(i,'ano')
	mes = dw_kardexmov.GetItemNumber(i,'mes')
	cPromIni = dw_kardexmov.GetItemNumber(i,'valorunit')
	dw_kardexmov.SetItem(i,'fecha_anula', datetime(today(),now()))
	dw_kardexmov.SetItem(i,'usu_anula', usuario)

	fila = dw_kx.Retrieve(codalmacen,codarticulo) 
	if fila = 1 then
		if dw_kx.GetItemNumber(1,'saldoActual') + sale - entra > 0 then
			dw_kx.SetItem(1,'costoprom',(dw_kx.GetItemNumber(1,'saldoActual') * dw_kx.GetItemNumber(1,'costoprom') + cPromIni*(sale - entra))/(dw_kx.GetItemNumber(1,'saldoActual') + sale - entra))
		else
			dw_kx.SetItem(1,'costoprom', dw_kx.GetItemNumber(1,'costoprom'))
		end if
		dw_kx.SetItem(1,'saldoactual',dw_kx.GetItemNumber(1,'saldoActual') - entra + sale)
		if dw_kx.GetItemNumber(1,'saldoActual') < 0 then
			Rollback;
			messageBox('Error','Estaria registrando saldos negativos en el Kardex. Art.'+codarticulo+'. No puede procesar el documento')
			Return -1
		end if		
		if dw_kx.Update() = -1 then
			Rollback;
			MessageBox('Atención','Error Actualizando Kardex' + SQLCA.SQLErrText)
			Return -1
		end if
	else
		Rollback;
		messageBox('Error','Inconsistencia en Kardex con el artículo ' + codarticulo + ' en almacen ' + codalmacen )
	end if

Next

////// Lotes
dw_lote_mov.Retrieve(coddoc, lugar, numdoc,codalmacen)

for i = 1 to dw_lote_mov.RowCount()
	dw_lote.Retrieve(codalmacen, dw_lote_mov.GetItemString(i,'codarticulo'))
//	fila = dw_lote.find("lote='" + dw_lote_mov.GetItemString(i,'lote') + "' and convenio='"+dw_lote_mov.GetItemString(i,'convenio')+"'", 1, dw_lote.RowCount())
	fila = dw_lote.find("upper(lote)='" + upper(dw_lote_mov.GetItemString(i,'lote')) + "' and upper(convenio)='"+upper(dw_lote_mov.GetItemString(i,'convenio'))+"'", 1, dw_lote.RowCount())
	if fila = 0 then
		Rollback;
		messageBox('Error Lote','No se encuentra registro en SUM_LOTE para retirar articulos. Articulo:'+dw_lote_mov.GetItemString(i,'codarticulo'))
		Return -1
	else
		dw_lote.SetItem(fila,'cantidad',dw_lote.GetItemNumber(fila,'cantidad') + dw_lote_mov.GetItemNumber(i,'cantidad')*dw_lote_mov.GetItemNumber(i,'signo')* -1)
	end if
	if dw_lote.GetItemNumber(fila,'cantidad') < 0 then
		Rollback;
		messageBox('Error','La cantidad para el lote -'+dw_lote_mov.GetItemString(i,'lote')+'- del articulo con fecha ' + string(date(dw_lote_mov.GetItemDateTime(i,'fecha_venc')))+ 'es negativa')
		Return -1
	end if
	dw_lote_mov.SetItem(i,'estado','2')
	if dw_lote.Update() = -1 then
		Rollback;
		messageBox('Error','No pueden grabarse modificaciones a SUM_LOTE')
		Return -1
	end if
next
if dw_lote_mov.Update() = -1 then
	Rollback;
	Return -1
end if

if dw_kardexmov.Update() = -1 then
	Rollback;
	Return -1
end if

Return 0

end function

event open;codDocumento = Message.StringParm

SELECT ENTERO into :i_dec_gral
FROM parametros_gen
WHERE (((codigo_para)=31));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 31')
	return 
end if

SELECT ENTERO into :i_aprox_gral
FROM parametros_gen
WHERE (((codigo_para)=18));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 18')
	return 
end if
if i_aprox_gral=0 then i_aprox_gral=1


dw_alm.SetTransObject(SQLCA)
dw_alm.GetChild('codalmacen', dwc_alm)
dwc_alm.SetTransObject(SQLCA)

dw_cab.Modify('codalmacen_target.Visible=FALSE codalmacen_target_t.Visible=FALSE')
if codDocumento = 'SI' then
	Title = 'Suministros - Saldos Iniciales'
	icon='ribon_inicial.ico'
	desdoc = 'Saldos Iniciales'
	t1.pk.dw_k.DataObject = 'dw_articuloselec'
	t1.pd.dw_cpo.Modify('atendido.Visible=FALSE nsaldo.Visible = FALSE')
	st_1.Text = 'Seleccione los artículos haciendo click sobre la casilla selec y llévelos ' +&
	 'con el botón llevar al detalle. Escriba sobre la casilla saldo inicial si el artículo no maneja lotes (no vence), o sobre la casilla cantidad en la grilla Lotes del Artículo'
elseif codDocumento = 'SAJ' then
	Title = 'Suministros - Ajustes'
	icon='ribon_ajustes.ico'
	desdoc = 'Ajustes'
	t1.pk.dw_k.DataObject = 'dw_kardexprelote_aj'
	t1.pd.dw_cpo.Modify('cantidad_t.Text="Ajuste"')
	t1.pd.dw_l.Modify('cantidad_t.Text="Ajuste"')
//	t1.pd.dw_l.Modify('convenio.TabSequence=0')
	t1.pk.dw_k.SetFilter("")
	t1.pk.dw_k.Filter()
	st_1.Text = 'Seleccione los artículos haciendo click sobre la casilla selec y llévelos ' +&
	 'con el botón llevar al detalle. Escriba sobre la casilla Ajuste de la grilla Artículos en la pestaña detalle si el artículo no maneja lotes (no vence), o sobre la casilla Ajuste en la grilla Lotes del Artículo en caso contrario'
end if

t1.pk.dw_k.SetTransObject(SQLCA)
pb_ter.Enabled = FALSE

dw_cab.GetChild('cod_flujo',dwc_f)
dwc_f.SetTransObject(SQLCA)
if dwc_f.Retrieve(coddocumento) = 0 then
	dw_cab.Modify("cod_flujo.Edit.DisplayOnly = TRUE")
	dwc_f.InsertRow(0)
end if

t1.pd.dw_cpo.GetChild('cod_impu',dwc_i)
dwc_i.SetTransObject(SQLCA)
dwc_i.Retrieve(codDocumento)
dwc_i.InsertRow(1)
dwc_i.SetItem(1,'nombre','Ninguno')

end event

on w_sum_si.create
this.st_6=create st_6
this.dw_lug=create dw_lug
this.pb_11=create pb_11
this.dw_kardex=create dw_kardex
this.pb_tempo=create pb_tempo
this.pb_cancelar=create pb_cancelar
this.pb_anular=create pb_anular
this.pb_imp=create pb_imp
this.pb_lote=create pb_lote
this.pb_nuevo=create pb_nuevo
this.pb_borrar=create pb_borrar
this.pb_ter=create pb_ter
this.t1=create t1
this.dw_c=create dw_c
this.dw_alm=create dw_alm
this.gb_1=create gb_1
this.pb_grabar=create pb_grabar
this.dw_cab=create dw_cab
this.st_1=create st_1
this.Control[]={this.st_6,&
this.dw_lug,&
this.pb_11,&
this.dw_kardex,&
this.pb_tempo,&
this.pb_cancelar,&
this.pb_anular,&
this.pb_imp,&
this.pb_lote,&
this.pb_nuevo,&
this.pb_borrar,&
this.pb_ter,&
this.t1,&
this.dw_c,&
this.dw_alm,&
this.gb_1,&
this.pb_grabar,&
this.dw_cab,&
this.st_1}
end on

on w_sum_si.destroy
destroy(this.st_6)
destroy(this.dw_lug)
destroy(this.pb_11)
destroy(this.dw_kardex)
destroy(this.pb_tempo)
destroy(this.pb_cancelar)
destroy(this.pb_anular)
destroy(this.pb_imp)
destroy(this.pb_lote)
destroy(this.pb_nuevo)
destroy(this.pb_borrar)
destroy(this.pb_ter)
destroy(this.t1)
destroy(this.dw_c)
destroy(this.dw_alm)
destroy(this.gb_1)
destroy(this.pb_grabar)
destroy(this.dw_cab)
destroy(this.st_1)
end on

event resize;t1.resize((newwidth - 50) , (newheight * 0.60))
t1.pk.dw_k.resize(5042,(t1.height *0.80))
t1.pd.dw_l.resize(3899,(t1.height *0.40))


end event

type st_6 from statictext within w_sum_si
integer x = 1454
integer y = 12
integer width = 247
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

type dw_lug from datawindow within w_sum_si
integer x = 37
integer y = 20
integer width = 1285
integer height = 140
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_lugar_sumi"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
dw_lug.GetChild('codlugar', dwc_lugar)
dwc_lugar.settransobject(sqlca)
dw_alm.SetTransObject(SQLCA)
dw_alm.GetChild('codalmacen', dwc_alm)
dwc_alm.SetTransObject(SQLCA)
if dwc_lugar.retrieve(USUARIO)= 0 then
	messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
	dwc_alm.InsertRow(1)
else
	if dwc_alm.Retrieve(usuario,'%',clugar) = 0 then
		messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
		dwc_alm.InsertRow(0)
	end if
	dw_alm.setitem(1,'codalmacen','')
	dw_alm.InsertRow(1)
end if
//dwc_lugar.insertrow(1)
end event

event itemchanged;string ls_clugar
ls_clugar=data
if dwc_alm.Retrieve(usuario,'%',ls_clugar) = 0 then
	messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
	dwc_alm.InsertRow(0)
end if
dw_alm.setitem(row,'codalmacen','')
dw_alm.InsertRow(0)
end event

type pb_11 from picturebutton within w_sum_si
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 3639
integer y = 24
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
string picturename = "contrato.gif"
string disabledname = "d_contrato.gif"
alignment htextalign = left!
string powertiptext = "Ver Existencias"
end type

event clicked;if not isNull(dw_alm.GetItemString(1,'codalmacen')) then
	openwithparm(w_kardex,dw_alm.GetItemString(1,'codalmacen'))
end if

end event

type dw_kardex from datawindow within w_sum_si
boolean visible = false
integer x = 5015
integer y = 48
integer width = 352
integer height = 100
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "dw_kardex"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event dberror;Rollback;
Return 0

end event

type pb_tempo from picturebutton within w_sum_si
event mousemove pbm_mousemove
string tag = "Grabar Temporal"
integer x = 4247
integer y = 24
integer width = 146
integer height = 128
integer taborder = 70
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
string powertiptext = "Grabar Temporal"
end type

event clicked;if grabar_tmp() = -1 then
	Rollback;
	Return -1
end if
commit;
nuevo = 0
dw_cab.ResetUpdate()
t1.pd.dw_cpo.ResetUpdate()
t1.pd.dw_l.ResetUpdate()
tmp = TRUE
Return 0

end event

type pb_cancelar from picturebutton within w_sum_si
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 3790
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
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_anular from picturebutton within w_sum_si
event mousemove pbm_mousemove
string tag = "Anular Documento"
integer x = 4091
integer y = 24
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
string picturename = "anulardoc.gif"
string disabledname = "d_anulardoc.gif"
alignment htextalign = left!
string powertiptext = "Anular Documento"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') = '2' then Return

if nuevo > 0 then
	pb_borrar.triggerEvent(clicked!)
	Return 0
end if
if dw_cab.GetItemString(1,'contabil') = 'C' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(1,'numdoc')) +' ya ha sido llevado a contabilidad')
	return -1
end if
if f_valida_periodo_sum(dw_cab.GetItemdatetime(1,'fecha'))= -1 then 
	messageBox('Aviso','Periodo cerrado ya no se puede anular')
	return 
end if

st_xa_anular st_anula
st_anula.tipo='SM'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return -1
if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') = '1' then
	string cd,cl,msg
	long nd,conteo,i
	If messageBox('Aviso','Se Anulará el documento y reversarán movimientos en Kardex. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return
	cd = dw_cab.GetItemString(1,'coddoc')
	cl = dw_cab.GetItemString(1,'clugar')
	nd = dw_cab.GetItemNumber(1,'numdoc')
	SELECT Count(*) INTO :conteo
	FROM AF_REGISTRO_CAB INNER JOIN (SUM_KARDEX_MOV INNER JOIN AF_REGISTRO_CPO ON (SUM_KARDEX_MOV.ITEM = AF_REGISTRO_CPO.ITEM_KAR) AND (SUM_KARDEX_MOV.MES = AF_REGISTRO_CPO.MES_KAR) AND (SUM_KARDEX_MOV.ANO = AF_REGISTRO_CPO.ANO_KAR) AND (SUM_KARDEX_MOV.CODARTI = AF_REGISTRO_CPO.CODARTI_KAR) AND (SUM_KARDEX_MOV.CODALMACEN = AF_REGISTRO_CPO.CODALMACEN_KAR)) ON (AF_REGISTRO_CAB.NUMDOC = AF_REGISTRO_CPO.NUMDOC) AND (AF_REGISTRO_CAB.clugar = AF_REGISTRO_CPO.clugar) AND (AF_REGISTRO_CAB.CODDOCU = AF_REGISTRO_CPO.CODDOCU)
	WHERE ((SUM_KARDEX_MOV.CODDOCREF=:cd) AND (SUM_KARDEX_MOV.CLUGARREF=:cl) AND (SUM_KARDEX_MOV.NUMDOCREF=:nd) AND (AF_REGISTRO_CAB.ESTADO='1'));
	IF SQLCA.SQLCode = -1 THEN 
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("SQL error", msg)
		Return -1
	end if
	if conteo > 0 then
		MessageBox('Atención','Existen activos fijos registrados a partir de este documento. Debe anular primero el documento de registro')
		Return 0
	end if
	if anula(dw_cab.GetItemString(1,'coddoc'),dw_cab.GetItemString(1,'clugar'),dw_cab.GetItemNumber(1,'numdoc'),dw_cab.GetItemString(1,'codalmacen')) = -1 then
		Rollback;
		Return -1
	end if
end if

dw_cab.SetItem(1,'estado','2')
dw_cab.SetItem(1,'anulado',usuario)
dw_cab.SetItem(1,'fechaanula',datetime(today(),now()))
dw_cab.SetItem(1,'motivo_anula',st_anula.observacion)
dw_cab.SetItem(1,'cod_anula',st_anula.motivo)
if dw_cab.Update() = -1 then
	Rollback;
	Return -1
end if
dw_c.SetItem(dw_c.GetRow(),'estado','2')
dw_c.SetItem(dw_c.GetRow(),'anulado',usuario)
dw_c.SetItem(dw_c.GetRow(),'fechaanula',today())
commit;
if codDocumento = 'SAJ' then
	t1.pk.dw_k.Retrieve(dw_alm.GetItemString(1,'codalmacen'))
end if

Return 0

end event

type pb_imp from picturebutton within w_sum_si
event mousemove pbm_mousemove
string tag = "Imprimir Reporte"
integer x = 3941
integer y = 24
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
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
alignment htextalign = left!
string powertiptext = "Imprimir Reporte"
end type

event clicked;if dw_cab.RowCount() < 1 then Return
any param[10]
param[1] = dw_cab.GetItemString(1,'coddoc')
param[2] = dw_cab.GetItemString(1,'clugar')
param[3] = dw_cab.GetItemNumber(1,'numdoc')

f_reporte(dw_cab.GetItemString(1,'coddoc'),Title,param)

end event

type pb_lote from picturebutton within w_sum_si
event mousemove pbm_mousemove
string tag = "Asignar Lotes (Vencimiento)"
boolean visible = false
integer x = 3483
integer y = 24
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
boolean enabled = false
boolean originalsize = true
string picturename = "index.gif"
string disabledname = "d_index.gif"
alignment htextalign = left!
string powertiptext = "Asignar Lotes (Vencimiento)"
end type

event constructor;//if g_vencimiento = '0' then
//	this.Enabled = FALSE
//	this.Visible = FALSE
//end if
//
end event

type pb_nuevo from picturebutton within w_sum_si
event mousemove pbm_mousemove
string tag = "Nuevo documento"
integer x = 4544
integer y = 24
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Nuevo documento"
end type

event clicked;if nuevo > 0 then
	MessageBox('Atención','Existe un documento nuevo sin grabar')
	Return -1
end if
if isNull(dw_alm.GetItemString(1,'codalmacen')) then
	MessageBox('Atención','Debe seleccionar un almacen')
	Return -1
end if
dw_cab.Reset()
dw_c.ScrolltoRow(dw_c.InsertRow(1))
dw_c.SetItem(1,'codalmacen',clugar)
dw_c.SetItem(1,'coddoc',codDocumento)
dw_c.SetItem(1,'clugar',clugar)
dw_c.SetItem(1,'fecha',today())
dw_c.SetItem(1,'estado','0')
dw_c.SetItem(1,'usuario',usuario)

dw_cab.InsertRow(1)
dw_cab.SetItem(1,'coddoc',codDocumento)
dw_cab.SetItem(1,'clugar',clugar)
dw_cab.SetItem(1,'codalmacen',dw_alm.GetItemString(1,'codalmacen'))
dw_cab.SetItem(1,'fecha',today())
dw_cab.SetItem(1,'estado','0')
dw_cab.SetItem(1,'usuario',usuario)
nuevo = 1

end event

type pb_borrar from picturebutton within w_sum_si
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 4677
integer y = 24
integer width = 146
integer height = 128
integer taborder = 80
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
string powertiptext = "Eliminar documento Nuevo"
end type

event clicked;if nuevo > 0 then
	dw_c.DeleteRow(nuevo)
	nuevo = 0
	dw_c.TriggerEvent(RowFocusChanged!)
else
	MessageBox('Atención','Solo documentos recientemente creados pueden eliminarse, los guardados temporalmente podrán ser anulados')
end if

end event

type pb_ter from picturebutton within w_sum_si
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 4827
integer y = 24
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "lupa.gif"
string disabledname = "d_lupa.gif"
alignment htextalign = left!
string powertiptext = "Buscar Tercero"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.Getrow(),'estado') = '0' then
	g_tercerodesde=13
	openwithparm(w_buscater,dw_cab)
	dw_cab.SetColumn('documento')
	dw_cab.TriggerEvent(itemchanged!)
end if

end event

type t1 from tab within w_sum_si
integer x = 46
integer y = 860
integer width = 5417
integer height = 1392
integer taborder = 120
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
pk pk
pd pd
end type

on t1.create
this.pk=create pk
this.pd=create pd
this.Control[]={this.pk,&
this.pd}
end on

on t1.destroy
destroy(this.pk)
destroy(this.pd)
end on

type pk from userobject within t1
integer x = 18
integer y = 112
integer width = 5381
integer height = 1264
long backcolor = 67108864
string text = "Artículos"
long tabtextcolor = 33554432
string picturename = "lista.ico"
long picturemaskcolor = 536870912
sle_1 sle_1
rb_2 rb_2
rb_1 rb_1
pb_1 pb_1
pb_7 pb_7
dw_k dw_k
end type

on pk.create
this.sle_1=create sle_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.pb_1=create pb_1
this.pb_7=create pb_7
this.dw_k=create dw_k
this.Control[]={this.sle_1,&
this.rb_2,&
this.rb_1,&
this.pb_1,&
this.pb_7,&
this.dw_k}
end on

on pk.destroy
destroy(this.sle_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.pb_1)
destroy(this.pb_7)
destroy(this.dw_k)
end on

type sle_1 from singlelineedit within pk
event keypressed pbm_keyup
integer x = 974
integer y = 32
integer width = 1426
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event keypressed;string texto
texto = upper(text)
if right(texto,1) <> '%' then
	texto = texto + '%'
end if
	
if rb_1.checked then
	dw_k.SetFilter("upper(codarticulo) like '" + texto + "'")
else
	dw_k.SetFilter("upper(descripcion) like '" + texto + "'")
end if
dw_k.Filter()

end event

type rb_2 from radiobutton within pk
integer x = 475
integer y = 36
integer width = 347
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Descripción"
boolean checked = true
boolean automatic = false
boolean lefttext = true
end type

event clicked;if not checked then
	checked = TRUE
	rb_1.checked = FALSE
	sle_1.Text = ''
end if

end event

type rb_1 from radiobutton within pk
integer x = 119
integer y = 36
integer width = 279
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Código"
boolean automatic = false
boolean lefttext = true
end type

event clicked;if not checked then
	checked = TRUE
	rb_2.checked = FALSE
	sle_1.Text = ''
end if

end event

type pb_1 from picturebutton within pk
event mousemove pbm_mousemove
integer x = 5120
integer y = 268
integer width = 146
integer height = 128
integer taborder = 70
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
string powertiptext = "Refrescar"
end type

event clicked;if codDocumento = 'SI' then
	dw_k.Retrieve('%')
else
	dw_k.Retrieve(dw_alm.GetItemString(1,'codalmacen'))
end if

end event

type pb_7 from picturebutton within pk
event mousemove pbm_mousemove
integer x = 5120
integer y = 140
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Llevar al detalle"
end type

event clicked;long fila, f, cant, i
string codarticulo, valor, lote, fecha_venc, codalmacen
dec cantidad,ld_cosp
if dw_cab.RowCount() <= 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado')
	return
end if
SetPointer(HourGlass!)
codalmacen = dw_alm.GetItemString(1,'codalmacen')
for i = 1 to dw_k.RowCount()
	if dw_k.GetItemNumber(i,'selec') = 0 then CONTINUE
	codarticulo = dw_k.getitemstring(i,'codarticulo')
	if codDocumento = 'SI' then
		select count(*) into :cant from sum_kardex
		where codalmacen=:codalmacen and codarticulo=:codarticulo;
		if cant > 0 then
			dw_k.SetItem(i,'selec',0)
			MessageBox('Atención','El artículo tiene registro en kardex, solo se puede modificar en ajustes. Art.'+codarticulo)
			Continue
		end if		
	end if
	
	fila = t1.pd.dw_cpo.Find( "codarticulo=" + "'" + codarticulo + "'", 1, t1.pd.dw_cpo.RowCount())
	if fila < 1 then
		valor = t1.pd.dw_cpo.describe("Evaluate('max(item)', 1)")
		fila = t1.pd.dw_cpo.InsertRow(0)
		t1.pd.dw_cpo.SetItem(fila, 'coddoc', dw_cab.GetItemString(dw_cab.GetRow(),'coddoc') )
		t1.pd.dw_cpo.SetItem(fila, 'cLugar', dw_cab.GetItemString(dw_cab.GetRow(),'clugar') )
		t1.pd.dw_cpo.SetItem(fila, 'numdoc', dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc') )
		t1.pd.dw_cpo.SetItem(fila, 'item',long(valor) + 1)
		t1.pd.dw_cpo.SetItem(fila, 'codarticulo',codarticulo)
		t1.pd.dw_cpo.SetItem(fila, 'descripcion',dw_k.GetItemString(i,'descripcion'))
		t1.pd.dw_cpo.SetItem(fila, 'Estado','0')
		t1.pd.dw_cpo.SetItem(fila, 'vence',dw_k.GetItemString(i,'vence'))
		t1.pd.dw_cpo.SetItem(fila, 'act_fijo',dw_k.GetItemString(i,'act_fijo'))
		if codDocumento = 'SAJ' then
			select saldoactual,costoprom into :cantidad,:ld_cosp from sum_kardex
			where codalmacen=:codalmacen and codarticulo = :codarticulo;
			IF SQLCA.SQLCode = -1 THEN 
				MessageBox("SQL error", SQLCA.SQLErrText)
				Return -1
			END IF
			if not isNull(cantidad) then
				t1.pd.dw_cpo.setItem(fila,'atendido',cantidad)
				t1.pd.dw_cpo.setItem(fila,'nsaldo',cantidad)
				t1.pd.dw_cpo.setItem(fila,'valor_unit',ld_cosp)
			end if
		end if
		t1.pd.dw_cpo.ScrolltoRow(fila)
		t1.pd.dw_cpo.TriggerEvent(rowFocusChanged!)
	else
		t1.pd.dw_cpo.ScrolltoRow(fila)
	end if
	
	if codDocumento = 'SAJ' and t1.pd.dw_cpo.GetItemString(fila,'vence') = '1' then
		f = t1.pd.dw_l.Find("lote='"+dw_k.GetItemString(i,'lote')+"'",1,t1.pd.dw_l.RowCount())
		f = t1.pd.dw_l.Find("upper(lote)='"+upper(dw_k.GetItemString(i,'lote'))+"'",1,t1.pd.dw_l.RowCount())
		if f = 0 then
			f = t1.pd.dw_l.InsertRow(0)
			t1.pd.dw_l.SetItem(f,'codalmacen',dw_cab.GetItemString(1,'codalmacen'))
			t1.pd.dw_l.SetItem(f,'codarticulo',t1.pd.dw_cpo.GetItemString(fila,'codarticulo'))
			t1.pd.dw_l.SetItem(f,'coddoc',t1.pd.dw_cpo.GetItemString(fila,'coddoc'))
			t1.pd.dw_l.SetItem(f,'clugar',t1.pd.dw_cpo.GetItemString(fila,'clugar'))
			t1.pd.dw_l.SetItem(f,'numdoc',t1.pd.dw_cpo.GetItemNumber(fila,'numdoc'))
			t1.pd.dw_l.SetItem(f,'item',t1.pd.dw_cpo.GetItemNumber(fila,'item'))
			t1.pd.dw_l.SetItem(f,'lote',dw_k.GetItemString(i,'lote'))
			t1.pd.dw_l.SetItem(f,'convenio',dw_k.GetItemString(i,'convenio'))
			t1.pd.dw_l.SetItem(f,'fecha_venc',dw_k.GetItemDateTime(i,'fecha_venc'))
			t1.pd.dw_l.SetItem(f,'signo',1)
			t1.pd.dw_l.SetItem(f,'saldo_lote',dw_k.GetItemNumber(i,'cantidad'))
			t1.pd.dw_l.SetItem(f,'nsaldo',dw_k.GetItemNumber(i,'cantidad'))
			t1.pd.dw_l.SetItem(f,'existe',1)
		end if
	end if
	dw_k.SetItem(i,'selec',0)
Next

if dw_k.describe("selec_t.Text") = 'Desel.' then
	dw_k.Modify("selec_t.Text='Selec.'")
end if

t1.SelectTab(t1.pd)

end event

type dw_k from datawindow within pk
integer x = 64
integer y = 136
integer width = 5042
integer height = 1092
integer taborder = 40
string title = "none"
string dataobject = "dw_articuloselec"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event clicked;if dwo.type="text" then

choose case dwo.name
	case 'selec_t'
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
	case "codarticulo_t"
		if ordenar[1]="codarticulo A" then
			ordenar[1]="codarticulo D"
		else
			ordenar[1]="codarticulo A"
		end if
		this.setsort(ordenar[1])
	case "fabricante_t"
		if ordenar[2]="fabricante A" then
			ordenar[2]="fabricante D"
		else
			ordenar[2]="fabricante A"
		end if
		this.setsort(ordenar[2])
	case "descripcion_t"
		if ordenar[3]="descripcion A" then
			ordenar[3]="descripcion D"
		else
			ordenar[3]="descripcion A"
		end if
		this.setsort(ordenar[3])
	case "vence_t"
		if ordenar[4]="vence A" then
			ordenar[4]="vence D"
		else
			ordenar[4]="vence A"
		end if
		this.setsort(ordenar[4])
	case "invima_t"
		if ordenar[5]="invima A" then
			ordenar[5]="invima D"
		else
			ordenar[5]="invima A"
		end if
		this.setsort(ordenar[5])
end choose
this.sort()
triggerEvent(rowfocuschanged!)
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

type pd from userobject within t1
integer x = 18
integer y = 112
integer width = 5381
integer height = 1264
long backcolor = 67108864
string text = "Detalle"
long tabtextcolor = 33554432
string picturename = "detalle.ico"
long picturemaskcolor = 536870912
st_3 st_3
st_2 st_2
pb_10 pb_10
pb_9 pb_9
pb_8 pb_8
pb_6 pb_6
dw_cpo dw_cpo
dw_l dw_l
end type

on pd.create
this.st_3=create st_3
this.st_2=create st_2
this.pb_10=create pb_10
this.pb_9=create pb_9
this.pb_8=create pb_8
this.pb_6=create pb_6
this.dw_cpo=create dw_cpo
this.dw_l=create dw_l
this.Control[]={this.st_3,&
this.st_2,&
this.pb_10,&
this.pb_9,&
this.pb_8,&
this.pb_6,&
this.dw_cpo,&
this.dw_l}
end on

on pd.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.pb_10)
destroy(this.pb_9)
destroy(this.pb_8)
destroy(this.pb_6)
destroy(this.dw_cpo)
destroy(this.dw_l)
end on

type st_3 from statictext within pd
integer x = 59
integer y = 632
integer width = 480
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lotes del Artículo"
boolean focusrectangle = false
end type

type st_2 from statictext within pd
integer x = 64
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Artículos"
boolean focusrectangle = false
end type

type pb_10 from picturebutton within pd
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 3977
integer y = 956
integer width = 146
integer height = 128
integer taborder = 70
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
string powertiptext = "Revisar Lotes"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado')
	return
end if

st_lote st_p
st_p.codalmacen = dw_cab.GetItemString(1,'codalmacen')
st_p.codarticulo = dw_cpo.GetItemString(dw_cpo.GetRow(),'codarticulo')
st_p.coddoc = dw_cab.GetItemString(1,'coddoc')
st_p.clugar = dw_cab.GetItemString(1,'clugar')
st_p.numdoc = dw_cab.GetItemNumber(1,'numdoc')
st_p.item = dw_cpo.GetItemNumber(dw_cpo.GetRow(),'item')
st_p.c_itm = dw_cpo.GetItemString(dw_cpo.GetRow(),'descripcion')
st_p.c_cant = '1'
st_p.dw_obj = dw_l

openwithparm(w_lotes_articulo, st_p)

end event

type pb_9 from picturebutton within pd
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 3977
integer y = 824
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Retirar registro"
end type

event clicked;if dw_l.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado')
	return
end if

string codart
long f
dec cant

codart = dw_l.GetItemString(dw_l.GetRow(),'codarticulo')
cant = dw_l.GetItemNumber(dw_l.GetRow(),'cantidad')
f = dw_cpo.Find("codarticulo='"+codart+"'",1,dw_cpo.RowCount())
if f > 0 then
	dw_cpo.SetItem(f,'cantidad',dw_cpo.GetItemNumber(f,'cantidad') - cant)
	if dw_cpo.GetItemNumber(f,'cantidad') <= 0 then
		dw_cpo.SetItem(f,'cantidad',0)
		dw_cpo.SetItem(f,'nsaldo',dw_cpo.GetItemNumber(f,'atendido') + dw_cpo.GetItemNumber(f,'cantidad') )
	end if
	dw_l.DeleteRow(0)
end if
dw_cpo.TriggerEvent(RowFocuschanged!)

end event

type pb_8 from picturebutton within pd
event mousemove pbm_mousemove
string tag = "Nuevo documento"
integer x = 3977
integer y = 688
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Agregar registro"
end type

event clicked;if dw_cpo.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado')
	return
end if
if dw_l.getitemnumber(1,'nulos')>0 then  return

long f
f = dw_l.InsertRow(0)
dw_l.SetItem(f,'codalmacen',dw_cab.GetItemString(1,'codalmacen'))
dw_l.SetItem(f,'codarticulo',dw_cpo.GetItemString(dw_cpo.GetRow(),'codarticulo'))
dw_l.SetItem(f,'coddoc',dw_cpo.GetItemString(dw_cpo.GetRow(),'coddoc'))
dw_l.SetItem(f,'clugar',dw_cpo.GetItemString(dw_cpo.GetRow(),'clugar'))
dw_l.SetItem(f,'numdoc',dw_cpo.GetItemNumber(dw_cpo.GetRow(),'numdoc'))
dw_l.SetItem(f,'item',dw_cpo.GetItemNumber(dw_cpo.GetRow(),'item'))
dw_l.SetItem(f,'signo',1)
dw_l.ScrolltoRow(f)

end event

type pb_6 from picturebutton within pd
event mousemove pbm_mousemove
integer x = 5088
integer y = 40
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila"
alignment htextalign = left!
string powertiptext = "Eliminar artículo"
end type

event clicked;if dw_cpo.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado')
	return
end if

do while dw_l.RowCount() > 0 
	dw_l.DeleteRow(0)
loop

dw_cpo.DeleteRow(dw_cpo.GetRow())
dw_cpo.TriggerEvent(RowFocuschanged!)

end event

type dw_cpo from datawindow within pd
integer x = 50
integer y = 48
integer width = 5001
integer height = 584
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_mvto_cpo_si"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event itemchanged;dec cant
double saldo_ant
saldo_ant = GetItemNumber(GetRow(),'nsaldo')
cant = GetItemNumber(GetRow(),'cantidad')
if AcceptText() = -1 then Return -1
if GetColumnName() = 'usastock' then
	double vnul
	SetNull(vnul)
	if GetItemString(GetRow(),'usastock') = '1' then
		SetItem(Getrow(),'stmin',vnul)
		SetItem(Getrow(),'stmax',vnul)
	end if
end if

if GetColumnName() = 'nsaldo' then
	if GetItemNumber(GetRow(),'nsaldo') - GetItemNumber(GetRow(),'atendido') < 0 and GetItemString(GetRow(),'act_fijo') = '1' then
		MessageBox('Atención','No puede retirar activos fijos en suministros')
		SetItem(GetRow(),'nsaldo',saldo_ant)
		SetText(String(saldo_ant))
		Return 1
	end if
	setItem(Getrow(),'cantidad',GetItemNumber(GetRow(),'nsaldo') - GetItemNumber(GetRow(),'atendido'))
elseif GetColumnName() = 'cantidad' then
	if GetItemNumber(GetRow(),'cantidad') < 0 and GetItemString(GetRow(),'act_fijo') = '1' then
		MessageBox('Atención','No puede retirar activos fijos en suministros')
		SetItem(GetRow(),'cantidad',cant)
		SetText(String(cant))
		Return 1
	end if
	if GetItemNumber(GetRow(),'atendido') < GetItemNumber(GetRow(),'cantidad') * -1 then
		SetItem(GetRow(),'cantidad',cant)
		SetText(String(cant))
		Return 1
	end if	
	setItem(Getrow(),'nsaldo',GetItemNumber(GetRow(),'atendido') + GetItemNumber(GetRow(),'cantidad'))
end if

end event

event rowfocuschanged;if this.RowCount() = 0 or currentRow = 0 then Return
if not isNull(GetItemNumber(GetRow(),'item')) then
	dw_l.SetFilter("item="+string(GetItemNumber(GetRow(),'item')))
	dw_l.Filter()
end if
if GetItemString(GetRow(),'vence') = '1' then
	pb_8.Enabled = TRUE
	pb_9.Enabled = TRUE
else
	pb_8.Enabled = FALSE
	pb_9.Enabled = FALSE
end if	

end event

event losefocus;AcceptText()

end event

event retrieveend;if dw_cab.RowCount() = 0 then Return
long i, rc
dec cantidad
string ca,alm

rc = rowcount
if isNull(rc) then rc = RowCount()
alm = dw_cab.GetItemString(1,'codalmacen')
if dw_cab.GetItemString(1,'estado') = '0' then
	for i = 1 to rc
		ca = GetItemString(i,'codarticulo')
		Select saldoactual into :cantidad from sum_kardex
		where codalmacen=:alm and codarticulo = :ca;
		IF SQLCA.SQLCode = -1 THEN 
			MessageBox("SQL error", SQLCA.SQLErrText)
			Return -1
		END IF
		if not isNull(cantidad) then
			setItem(i,'atendido',cantidad)
			setItem(i,'nsaldo',cantidad + GetItemNumber(i,'cantidad'))
		end if
	next
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

event dberror;Rollback;
Return 0

end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif operacion = 'Insert' then
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if

end event

type dw_l from datawindow within pd
integer x = 50
integer y = 696
integer width = 3899
integer height = 396
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_mvto_lote_si"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event itemchanged;if row < 1 or RowCount() = 0 then Return -1
dec cant, ns
cant = GetItemNumber(GetRow(),'cantidad')
ns = GetItemNumber(GetRow(),'nsaldo')

if AcceptText() = -1 then Return -1
if getColumnName() = 'cantidad' then
	if isNull(GetItemNumber(GetRow(),'saldo_lote')) and GetItemNumber(GetRow(),'cantidad') < 0 then
		SetItem(GetRow(),'cantidad',cant)
		SetText(String(cant))
		Return 1
	end if
	if GetItemNumber(GetRow(),'saldo_lote') < GetItemNumber(GetRow(),'cantidad') * -1 then
		SetItem(GetRow(),'cantidad',cant)
		SetText(String(cant))
		Return 1
	end if
	SetItem(GetRow(),'nsaldo',GetItemNumber(GetRow(),'saldo_lote') + GetItemNumber(GetRow(),'cantidad'))
	dw_cpo.SetItem(dw_cpo.GetRow(),'cantidad',double(describe("Evaluate('sum(cantidad)',0)")))
	dw_cpo.SetItem(dw_cpo.GetRow(),'nsaldo',dw_cpo.GetItemNumber(dw_cpo.GetRow(),'atendido') + dw_cpo.GetItemNumber(dw_cpo.GetRow(),'cantidad'))
end if

if getColumnName() = 'cantidad'  or getColumnName() = 'fecha_aprobacion' or getColumnName() = 'nro_sello' then
	 if GetItemnumber(Getrow(),'cantidad')>1 and GetItemstring(Getrow(),'banco')='1' then
	 	MessageBox('Error','No puede ser mayor 1')
		SetItem(GetRow(),'cantidad',1)
		AcceptText() 
	end if
end if

if GetColumnName() = 'nsaldo' then
	setItem(Getrow(),'cantidad',GetItemNumber(GetRow(),'nsaldo') - GetItemNumber(GetRow(),'saldo_lote'))
	if isNull(GetItemNumber(GetRow(),'saldo_lote')) and GetItemNumber(GetRow(),'cantidad') < 0 then
		SetItem(GetRow(),'cantidad',ns)
		SetText(String(ns))
		Return 1
	end if
	if GetItemNumber(GetRow(),'saldo_lote') < GetItemNumber(GetRow(),'cantidad') * -1 then
		SetItem(GetRow(),'cantidad',ns)
		SetText(String(ns))
		Return 1
	end if
	dw_cpo.SetItem(dw_cpo.GetRow(),'cantidad',double(describe("Evaluate('sum(cantidad)',0)")))
	dw_cpo.SetItem(dw_cpo.GetRow(),'nsaldo',dw_cpo.GetItemNumber(dw_cpo.GetRow(),'atendido') + dw_cpo.GetItemNumber(dw_cpo.GetRow(),'cantidad'))
end if
end event

event losefocus;setColumn('cantidad')
triggerEvent(itemchanged!)

end event

event dberror;Rollback;
Return 0

end event

event retrieveend;long i
for i = 1 to RowCount()
	if isNull(GetItemNumber(i,'saldo_lote')) then
		setItem(i,'saldo_lote',0)
		setItem(i,'existe',0)
	else
		setItem(i,'existe',1)
	end if
	if not isNull(GetItemNumber(i,'cantidad')) then
		setItem(i,'nsaldo',GetItemNumber(i,'saldo_lote') + GetItemNumber(i,'cantidad'))
	end if
	
next

end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif operacion = 'Insert' then
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if

end event

event retrieverow;if dw_cab.GetItemString(1,'estado') = '0' then
	if not isNull(GetItemNumber(row,'cantidad')) then
		setItem(row,'nsaldo',GetItemNumber(row,'saldo_lote') + GetItemNumber(row,'cantidad'))
	end if
end if

end event

type dw_c from datawindow within w_sum_si
event borrarnuevo ( integer fila )
integer x = 69
integer y = 240
integer width = 3264
integer height = 556
integer taborder = 100
string title = "none"
string dataobject = "dw_mvto_cab_sinter"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event borrarnuevo(integer fila);if nuevo > 0 then
	DeleteRow(nuevo)
	nuevo = 0
	PostEvent(RowFocuschanged!)
end if

end event

event constructor;SetTransObject(SQLCA)

end event

event rowfocuschanged;dw_cab.Reset()
t1.pd.dw_cpo.Reset()
t1.pd.dw_l.Reset()
If currentrow = 0 or rowCount() = 0 then Return
if GetItemString(GetRow(),'estado') = '0' then tmp = TRUE
if not isNull(GetItemNumber(GetRow(),'numdoc')) then
	dw_cab.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
	t1.pd.dw_l.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
	t1.pd.dw_cpo.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
end if

end event

event rowfocuschanging;if nuevo > 0 then
	if MessageBox('Atención','El documento no ha sido guardado, desea continuar?',QUESTION!,YESNO!,2) = 2 then Return -1
	postEvent('borrarnuevo')
	Return -1
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

type dw_alm from datawindow within w_sum_si
event retornar ( )
integer x = 1454
integer y = 64
integer width = 1152
integer height = 72
integer taborder = 10
string title = "none"
string dataobject = "dw_alm_ext"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retornar();this.SetItem(1,'codalmacen',codalm)

end event

event itemchanged;if nuevo > 0 then 
	if messageBox('Aviso','El documento nuevo no ha sido guardado, perderá los cambios. Desea continuar?',QUESTION!,YESNO!) = 2 then
		codalm = this.GetItemString(1,'codalmacen')
		this.PostEvent("retornar")
		return -1
	end if
	nuevo = 0
end if
AcceptText()
dw_c.Reset()
dw_cab.Reset()
t1.pd.dw_cpo.Reset()
dw_c.Retrieve(dw_alm.GetItemString(1,'codalmacen'),codDocumento)
if codDocumento = 'SI' then
//	t1.pk.dw_k.Retrieve('%')
	t1.pk.dw_k.Retrieve(dw_alm.GetItemString(1,'codalmacen'))
else
	t1.pk.dw_k.Retrieve(dw_alm.GetItemString(1,'codalmacen'))
end if


end event

type gb_1 from groupbox within w_sum_si
integer x = 32
integer y = 176
integer width = 3378
integer height = 656
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial"
end type

type pb_grabar from picturebutton within w_sum_si
event mousemove pbm_mousemove
integer x = 4393
integer y = 24
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
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "Grabar Definitivo"
end type

event clicked;If messageBox('Aviso','Se grabará definitivamente, no podrá realizar cambios. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return 0
if grabar_tmp() = -1 then Return -1
long i, j, cant
double min, max, signo
dec cantidad, cprom
string codalmacen, codarticulo,ls_act

i = t1.pd.dw_cpo.RowCount()

do while i > 0
	t1.pd.dw_cpo.ScrolltoRow(i)
	if coddocumento = 'SI' then
		if isNull(t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')) or t1.pd.dw_cpo.GetItemNumber(i,'valor_unit') = 0 then
			Rollback;
			Reversa()
			MessageBox('Aviso','Debe proporcionar el Costo Promedio. Art.' + t1.pd.dw_cpo.GetItemString(i,'codarticulo'))
			Return -1
		end if
		if isNull(t1.pd.dw_cpo.GetItemNumber(i,'cantidad')) or t1.pd.dw_cpo.GetItemNumber(i,'cantidad') <= 0 then
			Rollback;
			Reversa()
			MessageBox('Aviso','Debe proporcionar el saldo Inicial. Art.' + t1.pd.dw_cpo.GetItemString(i,'codarticulo'))
			Return -1
		end if
	end if

	min = t1.pd.dw_cpo.GetItemNumber(i,'stmin')
	max = t1.pd.dw_cpo.GetItemNumber(i,'stmax')
	if t1.pd.dw_cpo.GetItemString(i,'usastock') = '1' and (isNull(min) or isNull(max) or max=0 or (min >= max)) then
		Rollback;
		Reversa()
		MessageBox('Aviso','Debe revisar stocks Máximo y Mínimo. Art.' + t1.pd.dw_cpo.GetItemString(i,'codarticulo'))
		Return -1
	end if

	if t1.pd.dw_cpo.GetItemString(i,'vence') = '1' and not(t1.pd.dw_cpo.GetItemNumber(i,'cantidad') = double(t1.pd.dw_l.Describe("Evaluate('sum(cantidad)',0)"))) then
		if Messagebox('Aviso','La cantidad no coincide con las cantidades en lotes. Desea eliminar el registro del articulo y Continuar?. Articulo:' + t1.pd.dw_cpo.GetItemString(i,'codarticulo'),QUESTION!,YESNO!) = 2 then 
			Rollback;
			Return -1
		end if
		t1.pd.pb_6.TriggerEvent(clicked!)
	end if
	i = i - 1
loop

codalmacen = dw_alm.GetItemString(1,'codalmacen')
if coddocumento = 'SI' then   ///////////// Saldos Iniciales
	dec monto=0
	for i = 1 to t1.pd.dw_cpo.RowCount() 
		t1.pd.dw_cpo.ScrolltoRow(i)
		t1.pd.dw_cpo.Event RowFocuschanged(i)
		codarticulo = t1.pd.dw_cpo.GetItemString(i,'codarticulo')
		SELECT count(*),sum_grupo.act_fijo into :cant ,:ls_act
		FROM (((sum_kardex INNER JOIN sumarticulo ON sum_kardex.codarticulo = sumarticulo.codarticulo) INNER JOIN sumgenerico ON sumarticulo.codgenerico = sumgenerico.codgenerico) INNER JOIN sum_clase ON (sumgenerico.codclase = sum_clase.codclase) AND (sumgenerico.codgrupo = sum_clase.codgrupo)) INNER JOIN sum_grupo ON sum_clase.codgrupo = sum_grupo.codgrupo
		WHERE (((sum_kardex.codalmacen)=:codalmacen) AND ((sum_kardex.codarticulo)=:codarticulo))
		GROUP BY sum_grupo.act_fijo;
		if cant > 0 and ls_act='0' then
			Rollback;
			Reversa()
			MessageBox('Atención','El artículo tiene registro en kardex, solo se puede modificar en ajustes. Art.'+codarticulo)
			Return -1
		end if
		
		cantidad = t1.pd.dw_cpo.GetItemNumber(i,'cantidad')
		if cantidad > 0 then
			if f_kardexentrada(dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo'),cantidad,t1.pd.dw_cpo.GetItemString(i,'coddoc'),t1.pd.dw_cpo.GetItemString(i,'clugar'),t1.pd.dw_cpo.GetItemNumber(i,'numdoc'),t1.pd.dw_cpo.GetItemNumber(i,'item'),t1.pd.dw_cpo.GetItemNumber(i,'valor_unit'),getporcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100,dw_cab.GetItemDateTime(1,'fecha')) = -1 then
				Rollback;
				Reversa()
				Return -1
			end if
			for j = 1 to t1.pd.dw_l.RowCount()
				if f_act_lote(dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo'),t1.pd.dw_l.GetItemNumber(j,'cantidad'),t1.pd.dw_cpo.GetItemString(i,'coddoc'),t1.pd.dw_cpo.GetItemString(i,'clugar'),t1.pd.dw_cpo.GetItemNumber(i,'numdoc'),t1.pd.dw_cpo.GetItemNumber(i,'item'),t1.pd.dw_l.GetItemString(j,'lote'),t1.pd.dw_l.GetItemDateTime(j,'fecha_venc'),t1.pd.dw_l.GetItemNumber(j,'signo'),dw_cab.GetItemString(1,'codalmacen_target'),t1.pd.dw_l.GetItemString(j,'convenio')) = -1 then
					Rollback;
					Reversa()
					Return -1
				end if
			next
		end if
		
		if verificaKardex_lote(dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo')) = -1 then
			Rollback;
			Reversa()
			messageBox('Error','La cantidad en Kardex no coincide con la cantidad en Lotes. Art:'+t1.pd.dw_cpo.GetItemString(i,'codarticulo'))
			Return -1
		end if
		//
		if dw_kardex.Retrieve(codalmacen,codarticulo) = 1 then
			if t1.pd.dw_cpo.GetItemString(i,'usastock') = '1' then
				dw_kardex.SetItem(1,'usastock','1')
				dw_kardex.SetItem(1,'stmin',min)
				dw_kardex.SetItem(1,'stmax',max)
			else
				setNull(min)
				dw_kardex.SetItem(1,'usastock','0')
				dw_kardex.SetItem(1,'stmin',min)
				dw_kardex.SetItem(1,'stmax',min)
			end if
		end if
		if dw_kardex.Update() = -1 then
			Rollback;
			Reversa()
			MessageBox('Atención','Error grabando kardex - Stock min, max')
			Return -1
		end if
		if mod(i,5) = 0 then GarbageCollect()
		//
		monto = monto + round((t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')*t1.pd.dw_cpo.GetItemNumber(i,'cantidad')*(1+getPorcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100)),i_dec_gral)
	next

elseif codDocumento = 'SAJ' then   ///////////// Ajustes
	t1.pd.dw_cpo.TriggerEvent(retrieveEnd!)
	monto=0
	for i = 1 to t1.pd.dw_cpo.RowCount() 
		t1.pd.dw_cpo.ScrolltoRow(i)
		t1.pd.dw_cpo.Event RowFocuschanged(i)
		codarticulo = t1.pd.dw_cpo.GetItemString(i,'codarticulo')
		select count(*) into :cant from sum_kardex
		where codalmacen=:codalmacen and codarticulo=:codarticulo;
		if isNull(cant) or cant = 0 then
			Rollback;
			Reversa()
			MessageBox('Atención','El artículo no tiene registro en kardex, solo se puede modificar en Saldos Iniciales. Art.'+codarticulo)
			Return -1
		end if
		
		if isNull(t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')) or t1.pd.dw_cpo.GetItemNumber(i,'valor_unit') = 0 then
			select costoProm into :cProm from sum_kardex
			where codalmacen=:codalmacen and codarticulo=:codarticulo;
			if (isNull(cProm) or cProm = 0) then
				Rollback;
				Reversa()
				MessageBox('Atención','El artículo tiene costo promedio en cero y no ha dado un valor para este en el documento. Art.'+codarticulo)
				Return -1
			end if
		else
			cProm = t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')
		end if
		
		cantidad = t1.pd.dw_cpo.GetItemNumber(i,'cantidad')
		if cantidad > 0 then
			if f_kardexentrada(dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo'),cantidad,t1.pd.dw_cpo.GetItemString(i,'coddoc'),t1.pd.dw_cpo.GetItemString(i,'clugar'),t1.pd.dw_cpo.GetItemNumber(i,'numdoc'),t1.pd.dw_cpo.GetItemNumber(i,'item'),cProm, getporcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100,dw_cab.GetItemDateTime(1,'fecha')) = -1 then
				Rollback;
				Reversa()
				Return -1
			end if
		elseif cantidad < 0 then
			if f_kardexsalida(dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo'),cantidad * -1,t1.pd.dw_cpo.GetItemString(i,'coddoc'),t1.pd.dw_cpo.GetItemString(i,'clugar'),t1.pd.dw_cpo.GetItemNumber(i,'numdoc'),t1.pd.dw_cpo.GetItemNumber(i,'item'),dw_cab.GetItemDateTime(1,'fecha')) = -1 then
				Rollback;
				Reversa()
				Return -1
			end if
		end if

		for j = 1 to t1.pd.dw_l.RowCount()
			if t1.pd.dw_l.GetItemNumber(j,'cantidad') = 0 then CONTINUE
			cantidad = t1.pd.dw_l.GetItemNumber(j,'cantidad')
			signo = t1.pd.dw_l.GetItemNumber(j,'cantidad') / ABS(t1.pd.dw_l.GetItemNumber(j,'cantidad'))
			if f_act_lote(dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo'),cantidad * signo,t1.pd.dw_cpo.GetItemString(i,'coddoc'),t1.pd.dw_cpo.GetItemString(i,'clugar'),t1.pd.dw_cpo.GetItemNumber(i,'numdoc'),t1.pd.dw_cpo.GetItemNumber(i,'item'),t1.pd.dw_l.GetItemString(j,'lote'),t1.pd.dw_l.GetItemDateTime(j,'fecha_venc'),signo,dw_cab.GetItemString(1,'codalmacen_target'),t1.pd.dw_l.GetItemString(j,'convenio')) = -1 then
				Rollback;
				Reversa()
				Return -1
			end if
		next
		if verificaKardex_lote(dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo')) = -1 then
			Rollback;
			Reversa()
			messageBox('Error','La cantidad en Kardex no coincide con la cantidad en Lotes (SUM_KARDEX - SUM_LOTE). Art:'+t1.pd.dw_cpo.GetItemString(i,'codarticulo'))
			Return -1
		end if
		//
		if dw_kardex.Retrieve(codalmacen,codarticulo) = 1 then
			if cProm <> dw_kardex.GetItemNumber(1,'CostoProm') then
				dw_kardex.SetItem(1,'costoProm',CProm)
//				dw_kardex.SetItem(1,'costoProm',t1.pd.dw_cpo.GetItemNumber(i,'valor_unit'))
			end if
			if t1.pd.dw_cpo.GetItemString(i,'usastock') = '1' then
				dw_kardex.SetItem(1,'usastock','1')
				dw_kardex.SetItem(1,'stmin',min)
				dw_kardex.SetItem(1,'stmax',max)
			else
				setNull(min)
				dw_kardex.SetItem(1,'usastock','0')
				dw_kardex.SetItem(1,'stmin',min)
				dw_kardex.SetItem(1,'stmax',min)
			end if
		end if
		if dw_kardex.Update() = -1 then
			Rollback;
			Reversa()
			MessageBox('Atención','Error grabando kardex - Stock min, max')
			Return -1
		end if
		//
		monto = monto + round((t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')*t1.pd.dw_cpo.GetItemNumber(i,'cantidad')*(1+getPorcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100)),i_dec_gral)
		if mod(i,5) = 0 then GarbageCollect()
	next
end if
dw_cab.ResetUpdate()
dw_cab.SetItem(1,'valor_agregado',monto)
dw_cab.SetItem(1,'estado','1')
if dw_cab.Update() = -1 then
	Rollback;
	reversa()
	Return -1
end if
//if t1.pd.dw_cpo.Update() = -1 then
//	Rollback;
//	Return -1
//end if
//if t1.pd.dw_l.Update() = -1 then
//	Rollback;
//	Return -1
//end if
dw_c.SetItem(dw_c.GetRow(),'estado','1')
commit;
nuevo = 0
t1.pd.dw_cpo.ResetUpdate()
t1.pd.dw_l.ResetUpdate()

if codDocumento = 'SAJ' then
	t1.pk.dw_k.Retrieve(dw_alm.GetItemString(1,'codalmacen'))
end if
Return 0

end event

type dw_cab from datawindow within w_sum_si
boolean visible = false
integer x = 3493
integer y = 208
integer width = 1975
integer height = 628
integer taborder = 110
boolean enabled = false
string title = "none"
string dataobject = "dw_mvto_cab_ff"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;SetTransObject(SQLCA)

end event

event itemchanged;string n1,n2,a1,a2,rs,td,doc
if getColumnName() = 'documento' then
	td = GetItemString(GetRow(),'tipodoc')
	if isNull(data) then
		doc = GetItemString(GetRow(),'documento')
	else
		doc = data
	end if
	select nombre1,nombre2,apellido1,apellido2,razon_social into :n1,:n2,:a1,:a2,:rs
	from terceros where tipodoc=:td and documento=:doc;
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return 1
	elseif SQLCA.SQLCode = 100 THEN
		if MessageBox('Atención','El tercero no existe. Desea crearlo?',QUESTION!,YESNO!,2) = 1 then
			st_general st_p
			st_p.valor = td
			st_p.documento = doc
			openwithparm(w_cfgterceros,st_p)
			select nombre1,nombre2,apellido1,apellido2,razon_social into :n1,:n2,:a1,:a2,:rs
			from terceros where tipodoc=:td and documento=:doc;
		end if
	END IF
	SetItem(GetRow(),'nombre1',n1)
	SetItem(GetRow(),'nombre2',n2)
	SetItem(GetRow(),'apellido1',a1)
	SetItem(GetRow(),'apellido2',a2)
	SetItem(GetRow(),'razon_social',rs)
	dw_c.SetItem(dw_c.GetRow(),'nombre1',n1)
	dw_c.SetItem(dw_c.GetRow(),'nombre2',n2)
	dw_c.SetItem(dw_c.GetRow(),'apellido1',a1)
	dw_c.SetItem(dw_c.GetRow(),'apellido2',a2)
	dw_c.SetItem(dw_c.GetRow(),'razon_social',rs)
	
elseif getColumnName() = 'codalmacen_target' then
	if dw_alm.GetItemString(1,'codalmacen') = data then
		MessageBox('Aviso','El almacén origen y destino del documento no pueden ser el mismo') 
		SetNull(doc)
		SetText(doc)
		SetItem(1,'codalmacen_target',doc)
		Return 1
	end if
end if

end event

event dberror;Rollback;
Return 0

end event

type st_1 from statictext within w_sum_si
integer x = 3502
integer y = 208
integer width = 1833
integer height = 628
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217752
boolean focusrectangle = false
end type

