$PBExportHeader$w_doc_ori.srw
$PBExportComments$Ventana para documentos que usan otros documentos base
forward
global type w_doc_ori from window
end type
type st_6 from statictext within w_doc_ori
end type
type dw_lug from datawindow within w_doc_ori
end type
type pb_tempo from picturebutton within w_doc_ori
end type
type pb_12 from picturebutton within w_doc_ori
end type
type pb_11 from picturebutton within w_doc_ori
end type
type pb_grabar from picturebutton within w_doc_ori
end type
type pb_cancelar from picturebutton within w_doc_ori
end type
type pb_anular from picturebutton within w_doc_ori
end type
type pb_3 from picturebutton within w_doc_ori
end type
type pb_lote from picturebutton within w_doc_ori
end type
type pb_nuevo from picturebutton within w_doc_ori
end type
type pb_2 from picturebutton within w_doc_ori
end type
type pb_4 from picturebutton within w_doc_ori
end type
type t1 from tab within w_doc_ori
end type
type pk from userobject within t1
end type
type pb_15 from picturebutton within pk
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
pb_15 pb_15
sle_1 sle_1
rb_2 rb_2
rb_1 rb_1
pb_1 pb_1
pb_7 pb_7
dw_k dw_k
end type
type pd from userobject within t1
end type
type st_cuantos from statictext within pd
end type
type pb_14 from picturebutton within pd
end type
type st_3 from statictext within pd
end type
type st_1 from statictext within pd
end type
type pb_placa from picturebutton within pd
end type
type st_2 from statictext within pd
end type
type pb_5 from picturebutton within pd
end type
type pb_6 from picturebutton within pd
end type
type dw_l from datawindow within pd
end type
type dw_cpo from datawindow within pd
end type
type pd from userobject within t1
st_cuantos st_cuantos
pb_14 pb_14
st_3 st_3
st_1 st_1
pb_placa pb_placa
st_2 st_2
pb_5 pb_5
pb_6 pb_6
dw_l dw_l
dw_cpo dw_cpo
end type
type pr from userobject within t1
end type
type pb_13 from picturebutton within pr
end type
type st_5 from statictext within pr
end type
type pb_10 from picturebutton within pr
end type
type pb_9 from picturebutton within pr
end type
type pb_8 from picturebutton within pr
end type
type pb_buscar from picturebutton within pr
end type
type sle_codprod from singlelineedit within pr
end type
type dw_rc from datawindow within pr
end type
type dw_rl from datawindow within pr
end type
type pr from userobject within t1
pb_13 pb_13
st_5 st_5
pb_10 pb_10
pb_9 pb_9
pb_8 pb_8
pb_buscar pb_buscar
sle_codprod sle_codprod
dw_rc dw_rc
dw_rl dw_rl
end type
type t1 from tab within w_doc_ori
pk pk
pd pd
pr pr
end type
type dw_c from datawindow within w_doc_ori
end type
type dw_alm from datawindow within w_doc_ori
end type
type gb_1 from groupbox within w_doc_ori
end type
type dw_cab from datawindow within w_doc_ori
end type
type st_4 from statictext within w_doc_ori
end type
end forward

global type w_doc_ori from window
integer width = 5527
integer height = 2424
boolean titlebar = true
string title = "Suministros"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
st_6 st_6
dw_lug dw_lug
pb_tempo pb_tempo
pb_12 pb_12
pb_11 pb_11
pb_grabar pb_grabar
pb_cancelar pb_cancelar
pb_anular pb_anular
pb_3 pb_3
pb_lote pb_lote
pb_nuevo pb_nuevo
pb_2 pb_2
pb_4 pb_4
t1 t1
dw_c dw_c
dw_alm dw_alm
gb_1 gb_1
dw_cab dw_cab
st_4 st_4
end type
global w_doc_ori w_doc_ori

type variables
string coddocumento, codalm, i_convenio, desdoc,c_lote, i_operacion
DataWindowChild dwc_alm, dwc_f,dwc_almt,dwc_lugar
long nuevo
string ordenar[6]
boolean cambio,tmp
int i_dec_gral,i_aprox_gral
end variables

forward prototypes
public function integer reversa ()
public function integer calcosto ()
public function integer grabar_tmp ()
end prototypes

public function integer reversa ();long i,j
dw_cab.SetItem(1,'estado','0')
dw_cab.SetItemStatus(dw_cab.GetRow(),0, Primary!,NewModified!)

t1.pd.dw_cpo.SetRedraw(FALSE)
t1.pd.dw_l.SetRedraw(FALSE)
for i = 1 to t1.pd.dw_cpo.RowCount()
	t1.pd.dw_cpo.Scrolltorow(i)
	t1.pd.dw_cpo.Event RowFocuschanged(i)
	t1.pd.dw_cpo.SetItemStatus(i,0, Primary!,NewModified!)
	for j =  1 to t1.pd.dw_l.RowCount()
		t1.pd.dw_l.SetItemStatus(j,0, Primary!,NewModified!)
	next
next
t1.pd.dw_cpo.SetRedraw(TRUE)
t1.pd.dw_l.SetRedraw(TRUE)

t1.pr.dw_rc.SetRedraw(FALSE)
t1.pr.dw_rl.SetRedraw(FALSE)
for i = 1 to t1.pr.dw_rc.RowCount()
	t1.pr.dw_rc.ScrolltoRow(i)
	t1.pr.dw_rc.SetItemStatus(i,0, Primary!,NewModified!)
	for j =  1 to t1.pr.dw_rl.RowCount()
		t1.pr.dw_rl.SetItemStatus(j,0, Primary!,NewModified!)
	next
next
t1.pr.dw_rc.SetRedraw(TRUE)
t1.pr.dw_rl.SetRedraw(TRUE)
Return 0

end function

public function integer calcosto ();dec va, costo, v_insumo, t_insumo
if not(codDocumento = 'TR') then Return -1
va = dw_cab.GetItemNumber(1,'valor_agregado')

t_insumo = double(t1.pd.dw_cpo.Describe("Evaluate('sum(valor_unit * cantidad)',0)"))


if isNull(v_insumo) or v_insumo = 0 then
	Return -1
end if
if isNull(t1.pr.dw_rc.GetItemNumber(1,'cantidad')) or t1.pr.dw_rc.GetItemNumber(1,'cantidad') = 0 then
	Return -1
end if
costo = (v_insumo + va) / t1.pr.dw_rc.GetItemNumber(1,'cantidad')
t1.pr.dw_rc.SetItem(t1.pr.dw_rc.GetRow(),'valor_unit',costo)

Return costo

end function

public function integer grabar_tmp ();if dw_cab.RowCount() = 0 then Return -1
long i,j, ret
double numdoc

if not(dw_cab.GetItemString(1,'estado') = '0') then
	MessageBox('Atención','El documento no es nuevo')
	Return -1
end if

if f_num_compu('s','o') = FALSE then Return -1

t1.pd.dw_cpo.SetFilter("")
t1.pd.dw_cpo.Filter()

if t1.pd.dw_cpo.RowCount() = 0 then 
	MessageBox('Atención','No ha agregado ningun artículo al detalle del documento')
	Return -1
end if

t1.pd.dw_cpo.SetRedraw(FALSE)
dec monto=0
for i = 1 to t1.pd.dw_cpo.RowCount()
	if t1.pd.dw_cpo.GetItemNumber(i,'cantidad') = 0 then
		t1.pd.dw_cpo.SetRedraw(TRUE)
		MessageBox('Atención','La cantidad debe ser mayor de cero')
		Return -1
	end if
	t1.pd.dw_cpo.ScrolltoRow(i)
	t1.pd.dw_cpo.Event RowFocuschanged(i)
	if t1.pd.dw_cpo.GetItemString(i,'vence') = '1' and not(t1.pd.dw_cpo.GetItemNumber(i,'cantidad') = double(t1.pd.dw_l.Describe("Evaluate('sum(cantidad)',0)"))) then
		t1.pd.dw_cpo.SetRedraw(TRUE)
		Messagebox('Aviso','La cantidad no coincide con las cantidades en lotes. Articulo:' + t1.pd.dw_cpo.GetItemString(i,'codarticulo'))
		Return -1
	end if
	monto = monto + round((t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')*t1.pd.dw_cpo.GetItemNumber(i,'cantidad')*(1+getPorcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100)),i_dec_gral)
next

t1.pd.dw_cpo.SetRedraw(TRUE)
dw_cab.SetItem(1,'valor_agregado',monto)

if coddocumento = 'SP' or codDocumento = 'SSD' then
	if isNull(dw_cab.GetItemString(1,'documento')) then
		MessageBox('Aviso','Debe seleccionar un tercero')
		Return -1
	end if
end if

if coddocumento = 'TR' then
	for i = 1 to t1.pr.dw_rc.RowCount()
		if isNull(t1.pr.dw_rc.GetItemString(i,'codarticulo')) then
			t1.pr.dw_rc.ScrolltoRow(i)
			t1.pr.dw_rc.SetFocus()
			MessageBox('Aviso','Debe seleccionar el articulo resultante ')
			Return -1
		end if
		if t1.pr.dw_rc.GetItemNumber(1,'cantidad') = 0 then
			t1.pr.dw_rc.ScrolltoRow(i)
			t1.pr.dw_rc.SetFocus()
			MessageBox('Atención','La cantidad resultante debe ser mayor de cero')
			Return -1
		end if
		t1.pr.dw_rc.ScrolltoRow(i)
		//t1.pr.dw_rc.Event RowFocuschanged(i)
		if t1.pr.dw_rc.GetItemString(i,'vence') = '1' and not(t1.pr.dw_rc.GetItemNumber(i,'cantidad') = double(t1.pr.dw_rl.Describe("Evaluate('sum(cantidad)',0)"))) then
			t1.pr.dw_rc.ScrolltoRow(i)
			t1.pr.dw_rc.SetFocus()
			Messagebox('Aviso','La cantidad no coincide con las cantidades en lotes para el resultante. Articulo:' + t1.pr.dw_rc.GetItemString(1,'codarticulo'))
			Return -1
		end if
	next
end if

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
	for i = 1 to t1.pr.dw_rc.RowCount()
		t1.pr.dw_rc.SetItem(i,'numdoc',numdoc)
		t1.pr.dw_rc.ScrolltoRow(i)
		t1.pr.dw_rc.Event RowFocuschanged(i)
		for j = 1 to t1.pr.dw_rl.RowCount()
			t1.pr.dw_rl.SetItem(j,'numdoc',numdoc)
		next
	next
end if

if dw_cab.Update() = -1 then
	Rollback;
	reversa()
	Return -1
end if
i_operacion = 'Delete'
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
i_operacion = 'Insert'
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
i_operacion = ''

if codDocumento = 'TR' then
	if t1.pr.dw_rc.Update() = -1 then
		Rollback;
		reversa()
		Return -1
	end if
	if t1.pr.dw_rl.Update() = -1 then
		Rollback;
		reversa()
		Return -1
	end if
end if

return 0

end function

event open;codDocumento = Message.StringParm
string ojo

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

SELECT cadena into :c_lote
FROM parametros_gen
WHERE (((codigo_para)=41));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 41')
	return 
end if

int res
dw_cab.Modify('codalmacen_target.Visible=FALSE codalmacen_target_t.Visible=FALSE')
if codDocumento = 'SV' then
	Title = 'Suministros - Salida Vencimientos'
	icon='ribon_vence.ico'
	desdoc = 'VECIMIENTOS (SALIDA A TERCERO)'
	t1.pr.Visible = FALSE
	pb_4.Enabled = TRUE
	st_4.Visible = FALSE
elseif codDocumento = 'SP' then
	Title= 'Suministros - Préstamos'
	icon='ribon_prestamose.ico'
	desdoc = 'PRESTAMO'
	t1.pr.Visible = FALSE
	pb_4.Enabled = TRUE
	st_4.Visible = FALSE
elseif codDocumento = 'SB' then
	Title = 'Suministros - Bajas'
	icon='ribon_bajas.ico'
	desdoc = 'BAJA'
	t1.pr.Visible = FALSE
	pb_4.Enabled = FALSE
	st_4.Visible = TRUE
	dw_cab.Enabled = FALSE
	t1.pk.pb_15.PowerTipText = "Baja desde Banco"
	st_4.Text = 'Seleccione los artículos a dar de baja haciendo click sobre la casilla selec y llévelos ' +&
	 'con el botón llevar al detalle. Escriba sobre la casilla Cantidad de la grilla Artículos en la pestaña detalle si el artículo no maneja lotes (no vence), o sobre la casilla Cantidad en la grilla Lotes del Artículo en caso contrario'
	dw_c.DataObject = 'dw_mvto_cab_sinter'
elseif codDocumento = 'SC' then
	Title = 'Suministros - Consumos'
	desdoc = 'CONSUMO'
	icon='ribon_consumo.ico'
	t1.pr.Visible = FALSE
	pb_4.Enabled = FALSE
	st_4.Visible = TRUE
	dw_cab.Enabled = FALSE
	t1.pk.pb_15.PowerTipText = "Consumos desde Banco"

	st_4.Text = 'Seleccione los artículos a consumir haciendo click sobre la casilla selec y llévelos ' +&
	 'con el botón llevar al detalle. Escriba sobre la casilla Cantidad de la grilla Artículos en la pestaña detalle si el artículo no maneja lotes (no vence), o sobre la casilla Cantidad en la grilla Lotes del Artículo en caso contrario'
	dw_c.DataObject = 'dw_mvto_cab_sinter'
elseif codDocumento = 'SSD' then
	Title= 'Suministros - Salidas por Donaciones'
	icon=''
	t1.pr.Visible = FALSE
	pb_4.Enabled = TRUE
	st_4.Visible = FALSE	
elseif codDocumento = 'TR' then
	Title = 'Suministros - Transformación'
	icon='ribon_trans.ico'
	desdoc = 'TRANSFORMACION'
	string sqltxt,ret
	t1.pd.Text = 'Artículos Insumo'
	t1.pr.Visible = TRUE
	dw_cab.Modify("codalmacen_target.Visible=FALSE valor_agregado.Visible=TRUE codalmacen_target_t.Text='Valor Agregado' codalmacen_target_t.Visible=TRUE")
	t1.pr.dw_rc.Modify("cod_impu.Edit.DisplayOnly=YES")
	
	sqltxt =  t1.pd.dw_cpo.Describe("DataWindow.Table.Select")
	t1.pd.dw_cpo.Modify("DataWindow.Table.Select='" + sqltxt + " AND tipo=~~'I~~'" + "'")
	sqltxt =  t1.pr.dw_rc.Describe("DataWindow.Table.Select")
	t1.pr.dw_rc.Modify("DataWindow.Table.Select='" + sqltxt + " AND tipo=~~'R~~'" + "'")
	dw_c.Modify("compute_1.Visible=FALSE")
	st_4.Visible = FALSE	
end if

t1.pd.dw_cpo.Modify('cod_impu.Edit.DisplayOnly = TRUE')
dw_c.SetTransObject(SQLCA)
dw_alm.SetTransObject(SQLCA)
dw_alm.GetChild('codalmacen', dwc_alm)
dwc_alm.SetTransObject(SQLCA)

dw_cab.GetChild('cod_flujo',dwc_f)
dwc_f.SetTransObject(SQLCA)
if dwc_f.Retrieve(coddocumento) = 0 then
	dwc_f.InsertRow(0)
end if

if ls_pro=32 THEN	RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "USACONVENIO", Regstring!, i_convenio )
if ls_pro=64 THEN	RegistryGet ("HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "USACONVENIO", Regstring!, i_convenio )

if isNull(i_convenio) or i_convenio = '' then
	res = MessageBox('Atención','No se ha definido si diferenciar movimientos por convenio. Usa movimientos por convenio?.',QUESTION!,YESNOCANCEL!)
	if res = 1 then
		if ls_pro=32 THEN	RegistrySet ( "HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "USACONVENIO", RegString!, '1' )
		if ls_pro=64 THEN	RegistrySet ( "HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "USACONVENIO", RegString!, '1' )
elseif res = 2 then
		if ls_pro=32 THEN	RegistrySet ( "HKEY_LOCAL_MACHINE\SOFTWARE\GCI\SUMINISTROS\", "USACONVENIO", RegString!, '0' )
		if ls_pro=64 THEN	RegistrySet ( "HKEY_CURRENT_USER\SOFTWARE\GCI\SUMINISTROS\", "USACONVENIO", RegString!, '0' )
	end if
end if
if g_motor='postgres' then
	t1.pk.dw_k.dataObject='dw_kardexprelote_postgres'
end if
if g_motor='sql' then
	t1.pk.dw_k.dataObject='dw_kardexprelote_sqlserver'
end if
if g_motor<>'postgres' and  g_motor<>'sql' then
	t1.pk.dw_k.dataObject='dw_kardexprelote'
end if
t1.pk.dw_k.settransobject(sqlca)

end event

on w_doc_ori.create
this.st_6=create st_6
this.dw_lug=create dw_lug
this.pb_tempo=create pb_tempo
this.pb_12=create pb_12
this.pb_11=create pb_11
this.pb_grabar=create pb_grabar
this.pb_cancelar=create pb_cancelar
this.pb_anular=create pb_anular
this.pb_3=create pb_3
this.pb_lote=create pb_lote
this.pb_nuevo=create pb_nuevo
this.pb_2=create pb_2
this.pb_4=create pb_4
this.t1=create t1
this.dw_c=create dw_c
this.dw_alm=create dw_alm
this.gb_1=create gb_1
this.dw_cab=create dw_cab
this.st_4=create st_4
this.Control[]={this.st_6,&
this.dw_lug,&
this.pb_tempo,&
this.pb_12,&
this.pb_11,&
this.pb_grabar,&
this.pb_cancelar,&
this.pb_anular,&
this.pb_3,&
this.pb_lote,&
this.pb_nuevo,&
this.pb_2,&
this.pb_4,&
this.t1,&
this.dw_c,&
this.dw_alm,&
this.gb_1,&
this.dw_cab,&
this.st_4}
end on

on w_doc_ori.destroy
destroy(this.st_6)
destroy(this.dw_lug)
destroy(this.pb_tempo)
destroy(this.pb_12)
destroy(this.pb_11)
destroy(this.pb_grabar)
destroy(this.pb_cancelar)
destroy(this.pb_anular)
destroy(this.pb_3)
destroy(this.pb_lote)
destroy(this.pb_nuevo)
destroy(this.pb_2)
destroy(this.pb_4)
destroy(this.t1)
destroy(this.dw_c)
destroy(this.dw_alm)
destroy(this.gb_1)
destroy(this.dw_cab)
destroy(this.st_4)
end on

event closequery;if nuevo > 0 or cambio then 
	if messageBox('Aviso','El documento nuevo no ha sido guardado, perderá los cambios. Desea continuar?',QUESTION!,YESNO!) = 2 then
		return -1
	end if
end if

end event

event resize;t1.resize((newwidth - 50) , (newheight * 0.56))
t1.pk.dw_k.resize(4933,(t1.height *0.77))
t1.pd.dw_l.resize(3547,(t1.height *0.35))
t1.pr.dw_rl.resize(3122,(t1.height *0.35))
end event

type st_6 from statictext within w_doc_ori
integer x = 1422
integer y = 16
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

type dw_lug from datawindow within w_doc_ori
integer x = 37
integer y = 20
integer width = 1285
integer height = 140
integer taborder = 20
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
	dwc_lugar.insertrow(1)
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

type pb_tempo from picturebutton within w_doc_ori
string tag = "Grabar Temporal"
integer x = 4489
integer y = 28
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

type pb_12 from picturebutton within w_doc_ori
event mousemove pbm_mousemove
integer x = 3730
integer y = 28
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
string picturename = "editar.gif"
string disabledname = "d_editar.gif"
alignment htextalign = left!
string powertiptext = "Usar plantilla"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
st_otrosi st_p
st_p.dw_cab = dw_cab
st_p.dw_ppto = t1.pk.dw_k
st_p.dw_obj=t1.pd.dw_cpo
st_p.dw_lote=t1.pd.dw_l
st_p.codalmacen = dw_cab.GetItemString(dw_cab.Getrow(),'codalmacen')
st_p.coddoc = 'SPT'
if dw_cab.GetItemString(dw_cab.Getrow(),'estado') = '0' then
	openWithParm(w_sum_plant,st_p)
//	t1.pr.sle_codprod.TriggerEvent(modified!)
end if


end event

type pb_11 from picturebutton within w_doc_ori
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 3881
integer y = 28
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

type pb_grabar from picturebutton within w_doc_ori
event mousemove pbm_mousemove
integer x = 4658
integer y = 28
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
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "Grabar y procesar"
end type

event clicked;if dw_cab.RowCount() = 0 then Return -1
long i,j, ret
double numdoc

If messageBox('Aviso','Se grabará definitivamente, no podrá realizar cambios. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return 0
if not(dw_cab.GetItemString(1,'estado') = '0') then
	MessageBox('Atención','El documento no es nuevo')
	Return -1
end if
if grabar_tmp() = -1 then Return -1
dw_cab.SetItem(1,'estado','1')
nuevo = 0
if dw_cab.Update() = -1 then
	Rollback;
	reversa()
	Return -1
end if


if codDocumento = 'TR' then
	if t1.pr.dw_rc.Update() = -1 then
		Rollback;
		reversa()
		Return -1
	end if
	if t1.pr.dw_rl.Update() = -1 then
		Rollback;
		reversa()
		Return -1
	end if
end if
string ls_r_pac_org,ls_alm_org
ls_alm_org=dw_cab.GetItemString(1,'codalmacen')

select restringepac into :ls_r_pac_org from sumalmacen where codalmacen = :ls_alm_org;
for i = 1 to t1.pd.dw_cpo.RowCount()
	if t1.pd.dw_cpo.GetItemNumber(i,'cantidad') = 0 then Continue
	t1.pd.dw_cpo.ScrolltoRow(i)
	t1.pd.dw_cpo.Event RowFocuschanged(i)
	if coddocumento = 'SP'  or  coddocumento = 'SC' then // Antes tambien 'SC' y 'SB'
		if ls_r_pac_org='1' then
			if f_updatePAC(dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo'),t1.pd.dw_cpo.GetItemNumber(i,'cantidad') ,dw_cab.GetItemDateTime(1,'fecha')) = -1 then 
				Rollback;
				reversa()
				Return -1
			end if
		end if
	end if

	if f_kardexsalida(dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo'),t1.pd.dw_cpo.GetItemNumber(i,'cantidad'),t1.pd.dw_cpo.GetItemString(i,'coddoc'),t1.pd.dw_cpo.GetItemString(i,'clugar'),t1.pd.dw_cpo.GetItemNumber(i,'numdoc'),t1.pd.dw_cpo.GetItemNumber(i,'item'),dw_cab.GetItemDateTime(1,'fecha')) = -1 then
		Rollback;
		reversa()
		Return -1
	end if

	for j = 1 to t1.pd.dw_l.RowCount()
		if f_act_lote(dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo'),t1.pd.dw_l.GetItemNumber(j,'cantidad'),t1.pd.dw_cpo.GetItemString(i,'coddoc'),t1.pd.dw_cpo.GetItemString(i,'clugar'),t1.pd.dw_cpo.GetItemNumber(i,'numdoc'),t1.pd.dw_cpo.GetItemNumber(i,'item'),t1.pd.dw_l.GetItemString(j,'lote'),t1.pd.dw_l.GetItemDateTime(j,'fecha_venc'),t1.pd.dw_l.GetItemNumber(j,'signo'),dw_cab.GetItemString(1,'codalmacen_target'),t1.pd.dw_l.GetItemString(j,'convenio')) = -1 then
			Rollback;
			reversa()
			Return -1
		end if
	next
	if t1.pd.dw_cpo.GetItemString(i,'vence') = '1' then
		if verificaKardex_lote(dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo')) = -1 then
			Rollback;
			reversa()
			messageBox('Error','La cantidad en Kardex no coincide con la cantidad en Lotes. Art:'+t1.pd.dw_cpo.GetItemString(i,'codarticulo'))
			Return -1
		end if
	end if
	//if mod(i,5) = 0 then GarbageCollect()
next

if codDocumento = 'TR' then
	for i = 1 to t1.pr.dw_rc.RowCount()
		t1.pr.dw_rc.ScrolltoRow(i)
		t1.pr.dw_rc.Event RowFocusChanged(i)
		if f_kardexentrada(dw_cab.GetItemString(1,'codalmacen'),t1.pr.dw_rc.GetItemString(i,'codarticulo'),t1.pr.dw_rc.GetItemNumber(i,'cantidad'),t1.pr.dw_rc.GetItemString(i,'coddoc'),t1.pr.dw_rc.GetItemString(i,'clugar'),t1.pr.dw_rc.GetItemNumber(i,'numdoc'),t1.pr.dw_rc.GetItemNumber(i,'item'),t1.pr.dw_rc.GetItemNumber(i,'valor_unit'),0,dw_cab.GetItemDateTime(1,'fecha')) = -1 then
			Rollback;
			reversa()
			Return -1
		end if
		for j = 1 to t1.pr.dw_rl.RowCount()
			if f_act_lote(dw_cab.GetItemString(1,'codalmacen'),t1.pr.dw_rl.GetItemString(j,'codarticulo'),t1.pr.dw_rl.GetItemNumber(j,'cantidad'),t1.pr.dw_rc.GetItemString(i,'coddoc'),t1.pr.dw_rc.GetItemString(i,'clugar'),t1.pr.dw_rc.GetItemNumber(i,'numdoc'),t1.pr.dw_rc.GetItemNumber(i,'item'),t1.pr.dw_rl.GetItemString(j,'lote'),t1.pr.dw_rl.GetItemDateTime(j,'fecha_venc'),t1.pr.dw_rl.GetItemNumber(j,'signo'),dw_cab.GetItemString(1,'codalmacen_target'),t1.pr.dw_rl.GetItemString(j,'convenio')) = -1 then
				Rollback;
				reversa()
				Return -1
			end if
		next
		if t1.pr.dw_rc.GetItemString(1,'vence') = '1' then
			if verificaKardex_lote(dw_cab.GetItemString(1,'codalmacen'),t1.pr.dw_rc.GetItemString(1,'codarticulo')) = -1 then
				Rollback;
				reversa()
				messageBox('Error','La cantidad en Kardex no coincide con la cantidad en Lotes. Art:'+t1.pr.dw_rc.GetItemString(1,'codarticulo'))
				Return -1
			end if
		end if
	next
end if
dw_c.SetItem(dw_c.GetRow(),'estado','1')
nuevo = 0
cambio = FALSE
commit;
t1.pk.dw_k.Retrieve(dw_alm.GetItemString(1,'codalmacen'))

Return 0

end event

type pb_cancelar from picturebutton within w_doc_ori
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 4032
integer y = 28
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

type pb_anular from picturebutton within w_doc_ori
event mousemove pbm_mousemove
string tag = "Anular Documento"
integer x = 4334
integer y = 28
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

event clicked;long i, nd, item, fila
string cd,cl
dec cantidad
string endestino,ls_estado
if dw_cab.RowCount() = 0 then Return

cd = dw_cab.GetItemString(dw_cab.GetRow(),'coddoc')
cl = dw_cab.GetItemString(dw_cab.GetRow(),'clugar')
nd = dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')
select en_destino,estado into :endestino, :ls_estado from sum_mvto_cab
where coddoc=:cd and clugar=:cl and numdoc=:nd;
if endestino = '1' then
	MessageBox('Atención','El documento se ha utilizado como insumo de otro documento. No se puede anular')
	Return 0
end if
if ls_estado= '3' then
	MessageBox('Atención','El documento cambio de estado en otra sesión. No se puede anular')
	dw_alm.triggerevent(itemchanged!)
	Return 0
end if
if dw_cab.GetItemString(1,'estado') = '2' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(1,'numdoc')) +' ya ha sido anulado')
	return
end if
if dw_cab.GetItemString(1,'estado') = '3' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(1,'numdoc')) +' ya ha sido atendido')
	return
end if
if f_valida_periodo_sum(dw_cab.GetItemdatetime(1,'fecha'))= -1 then 
	messageBox('Aviso','Periodo cerrado ya no se puede anular')
	return 
end if
if nuevo > 0 then
	pb_2.triggerEvent(clicked!)
	Return 0
end if
if dw_cab.GetItemString(1,'contabil') = 'C' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(1,'numdoc')) +' ya ha sido llevado a contabilidad')
	return
end if
If messageBox('Aviso','Se Anulará el documento y reversarán movimientos en Kardex. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return
st_xa_anular st_anula
st_anula.tipo='SM'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return -1

if dw_cab.GetItemString(1,'estado') = '1' then
	if f_kardexsalanula(dw_cab.GetItemString(1,'coddoc'),dw_cab.GetItemString(1,'clugar'),dw_cab.GetItemNumber(1,'numdoc'),dw_cab.GetItemString(1,'codalmacen')) = -1 then
		rollback;
		Return -1
	end if
	If codDocumento = 'TR' then
		if f_kardexentanula(dw_cab.GetItemString(1,'coddoc'),dw_cab.GetItemString(1,'clugar'),dw_cab.GetItemNumber(1,'numdoc'),dw_cab.GetItemString(1,'codalmacen')) = -1 then
			rollback;
			Return -1
		end if
	end if
	if coddocumento = 'SC' or coddocumento = 'SB' then
		string ls_r_pac_org,ls_alm_org
		ls_alm_org=dw_cab.GetItemString(1,'codalmacen')
		select restringepac into :ls_r_pac_org from sumalmacen where codalmacen = :ls_alm_org;
		for i = 1 to t1.pd.dw_cpo.RowCount()
			if ls_r_pac_org ='1' then 
				if f_updatePAC(dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo'),t1.pd.dw_cpo.GetItemNumber(i,'cantidad')* -1,dw_cab.GetItemDateTime(1,'fecha')) = -1 then 
					Rollback;
					Return -1
				end if
			end if
		next
	end if
end if

dw_cab.SetItem(1,'Estado','2')
dw_cab.SetItem(1,'anulado',usuario)
dw_cab.SetItem(dw_cab.GetRow(),'fechaanula',datetime(today(),now()))
dw_cab.SetItem(dw_cab.GetRow(),'motivo_anula',st_anula.observacion)
dw_cab.SetItem(dw_cab.GetRow(),'cod_anula',st_anula.motivo)
if dw_cab.Update() = 1 then
	commit;
else
	rollback;
	return -1
end if
dw_c.SetItem(dw_c.GetRow(),'estado','2')
dw_c.SetItem(dw_c.GetRow(),'anulado',usuario)
dw_c.SetItem(dw_c.GetRow(),'fechaanula',today())
dw_cab.triggerEvent(RowFocuschanged!)

end event

type pb_3 from picturebutton within w_doc_ori
event mousemove pbm_mousemove
string tag = "Imprimir Reporte"
integer x = 4183
integer y = 28
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

type pb_lote from picturebutton within w_doc_ori
event mousemove pbm_mousemove
string tag = "Asignar Lotes (Vencimiento)"
boolean visible = false
integer x = 3575
integer y = 28
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

type pb_nuevo from picturebutton within w_doc_ori
event mousemove pbm_mousemove
string tag = "Nuevo documento"
integer x = 4809
integer y = 28
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

type pb_2 from picturebutton within w_doc_ori
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 4960
integer y = 28
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

type pb_4 from picturebutton within w_doc_ori
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 5111
integer y = 28
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

type t1 from tab within w_doc_ori
integer x = 37
integer y = 880
integer width = 5422
integer height = 1408
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
pr pr
end type

on t1.create
this.pk=create pk
this.pd=create pd
this.pr=create pr
this.Control[]={this.pk,&
this.pd,&
this.pr}
end on

on t1.destroy
destroy(this.pk)
destroy(this.pd)
destroy(this.pr)
end on

type pk from userobject within t1
integer x = 18
integer y = 112
integer width = 5385
integer height = 1280
long backcolor = 67108864
string text = "Existencias"
long tabtextcolor = 33554432
string picturename = "detalle.ico"
long picturemaskcolor = 536870912
pb_15 pb_15
sle_1 sle_1
rb_2 rb_2
rb_1 rb_1
pb_1 pb_1
pb_7 pb_7
dw_k dw_k
end type

on pk.create
this.pb_15=create pb_15
this.sle_1=create sle_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.pb_1=create pb_1
this.pb_7=create pb_7
this.dw_k=create dw_k
this.Control[]={this.pb_15,&
this.sle_1,&
this.rb_2,&
this.rb_1,&
this.pb_1,&
this.pb_7,&
this.dw_k}
end on

on pk.destroy
destroy(this.pb_15)
destroy(this.sle_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.pb_1)
destroy(this.pb_7)
destroy(this.dw_k)
end on

type pb_15 from picturebutton within pk
integer x = 5056
integer y = 380
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
string picturename = "requisicion.gif"
string disabledname = "d_requisicion.gif"
alignment htextalign = left!
string powertiptext = "Consumos desde Banco"
end type

event clicked;pb_7.enabled=false
pb_1.enabled=false
st_lote str
str.codalmacen=dw_alm.GetItemString(1,'codalmacen')
str.dw_cpo=t1.pd.dw_cpo
str.dw_obj=t1.pd.dw_l
str.coddoc=codDocumento
if codDocumento='SC' then
	str.codarticulo='U'
	str.codalmacendes='U'
end if
if codDocumento='SB' then
	str.codarticulo='V'
	str.codalmacendes='X'
end if
str.clugar=clugar
str.numdoc=dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')
if dw_cab.GetItemstring(dw_cab.GetRow(),'estado')<>'0' then
	messagebox('Atención','Cree documento')
	return
end if
openwithparm(w_banco_consumo,str)
t1.SelectTab(t1.pd)
if message.stringparm='SI' then 
	t1.pd.dw_cpo.triggerevent(itemchanged!)
	pb_grabar.triggerevent(clicked!)
end if


end event

type sle_1 from singlelineedit within pk
event keypressed pbm_keyup
integer x = 933
integer y = 16
integer width = 1426
integer height = 80
integer taborder = 20
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
integer x = 434
integer y = 20
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
integer x = 78
integer y = 20
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
integer x = 5056
integer y = 244
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
string powertiptext = "Agregar artículo"
end type

event clicked;dw_k.Retrieve(dw_alm.GetItemString(1,'codalmacen'))

end event

type pb_7 from picturebutton within pk
event mousemove pbm_mousemove
integer x = 5056
integer y = 108
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
string powertiptext = "Agregar artículo"
end type

event clicked;int i
long fila, f
string codigo, descripcion, presentacion, valor, lote, fecha_venc
if dw_cab.RowCount() <= 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado')
	return
end if

dw_k.SetFilter("")
dw_k.Filter()
if dw_k.Find("selec=1",1,dw_k.RowCount()) > 0 then
	cambio = TRUE
end if
for i = 1 to dw_k.RowCount()
	if dw_k.GetItemNumber(i,'selec') = 0 then CONTINUE
	if (codDocumento = 'SC' or codDocumento = 'SB') and dw_k.GetItemString(i,'act_fijo') ='1' then 
		MessageBox('Atención','Los activos fijos no se pueden cargarse en documentos de consumo ni bajas')
		CONTINUE
	end if
	descripcion = dw_k.getitemstring(i,'descripcion')
	
	if dw_k.GetItemString(i,'vence') = '1' and isNull(dw_k.GetItemString(i,'lote')) and g_vencimiento = '1' then
		MessageBox('Atención','El artículo '+descripcion+' esta definido VENCE pero no tiene asignado lotes.')
		Continue
	end if
	
	if isnull(descripcion) then 
		Continue
	end if
	codigo = dw_k.getitemstring(i,'codarticulo')
	lote = dw_k.GetItemString(i,'lote')
	fecha_venc = string(dw_k.GetItemDateTime(i,'fecha_venc'),'yyyy-mm-dd')

	fila = t1.pd.dw_cpo.Find( "codarticulo=" + "'" + codigo + "'", 1, t1.pd.dw_cpo.RowCount())
	if fila < 1 then
		valor = t1.pd.dw_cpo.describe("Evaluate('max(item)', 1)")
		fila = t1.pd.dw_cpo.InsertRow(0)
		t1.pd.dw_cpo.SetItem(fila, 'coddoc', dw_cab.GetItemString(dw_cab.GetRow(),'coddoc') )
		t1.pd.dw_cpo.SetItem(fila, 'cLugar', dw_cab.GetItemString(dw_cab.GetRow(),'clugar') )
		t1.pd.dw_cpo.SetItem(fila, 'numdoc', dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc') )
		t1.pd.dw_cpo.SetItem(fila, 'descripcion',descripcion)
		t1.pd.dw_cpo.SetItem(fila, 'codarticulo',codigo)
		t1.pd.dw_cpo.SetItem(fila, 'Estado','0')
		t1.pd.dw_cpo.SetItem(fila, 'item',long(valor) + 1)
		t1.pd.dw_cpo.SetItem(fila, 'saldoactual',dw_k.GetItemNumber(i,'saldoactual'))	
		t1.pd.dw_cpo.SetItem(fila, 'vence',dw_k.GetItemString(i,'vence'))
		t1.pd.dw_cpo.SetItem(fila, 'valor_unit',dw_k.GetItemNumber(i,'costoprom'))
		t1.pd.dw_cpo.SetItem(fila, 'act_fijo',dw_k.GetItemString(i,'act_fijo'))
		if coddocumento = 'TR' then
			t1.pd.dw_cpo.SetItem(fila, 'tipo','I')
		end if
		t1.pd.dw_cpo.ScrolltoRow(fila)
	else
		t1.pd.dw_cpo.ScrolltoRow(fila)
	end if
	t1.pd.dw_cpo.TriggerEvent(rowfocuschanged!)
	if not isNull(lote) then // tiene Lote
		fila = t1.pd.dw_l.Find( "codarticulo=" + "'" + codigo + "' and upper(lote)='"+upper(lote)+"' and fecha_venc=datetime(date('" + fecha_venc+"'))", 1, t1.pd.dw_l.RowCount())
		if fila = 0 then
			fila = t1.pd.dw_l.InsertRow(0)
			t1.pd.dw_l.SetItem(fila, 'codalmacen', dw_cab.GetItemString(dw_cab.GetRow(),'codalmacen') )
			t1.pd.dw_l.SetItem(fila, 'codarticulo', codigo )
			t1.pr.pb_8.text=string(dw_k.GetItemDateTime(i,'fecha_venc') )
			t1.pd.dw_l.SetItem(fila, 'fecha_venc', dw_k.GetItemDateTime(i,'fecha_venc') )
			t1.pd.dw_l.SetItem(fila, 'lote',dw_k.GetItemString(i,'lote'))
			t1.pd.dw_l.SetItem(fila, 'coddoc', dw_cab.GetItemString(dw_cab.GetRow(),'coddoc') )
			t1.pd.dw_l.SetItem(fila, 'cLugar', dw_cab.GetItemString(dw_cab.GetRow(),'clugar') )
			t1.pd.dw_l.SetItem(fila, 'numdoc', dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc') )
			t1.pd.dw_l.SetItem(fila, 'item', t1.pd.dw_cpo.GetItemNumber(t1.pd.dw_cpo.GetRow(),'item') )
			t1.pd.dw_l.SetItem(fila, 'convenio', dw_k.GetItemString(i,'convenio') )
			t1.pd.dw_l.SetItem(fila, 'Estado','0')
			t1.pd.dw_l.SetItem(fila, 'signo',-1)
			t1.pd.dw_l.SetItem(fila, 'saldo_lote',dw_k.GetItemNumber(i,'cantidad'))
		end if
		if not isnull(dw_k.GetItemString(i,'tra_articulo')) then
			t1.pd.dw_cpo.SetItem(fila, 'tra_articulo',dw_k.GetItemString(i,'tra_articulo'))
			t1.pr.sle_codprod.Text=dw_k.GetItemString(i,'tra_articulo')
			t1.pr.sle_codprod.tag='1'
			t1.pd.dw_cpo.SetItem(fila,'control','1')
			t1.pr.sle_codprod.TriggerEvent(modified!)
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
integer x = 59
integer y = 116
integer width = 4933
integer height = 1124
integer taborder = 40
string title = "none"
string dataobject = "dw_kardexprelote"
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
	case "descripcion_t"
		if ordenar[2]="descripcion A" then
			ordenar[2]="descripcion D"
		else
			ordenar[2]="descripcion A"
		end if
		this.setsort(ordenar[2])
	case "saldo_t"
		if ordenar[3]="compute_1 A" then
			ordenar[3]="compute_1 D"
		else
			ordenar[3]="compute_1 A"
		end if
		this.setsort(ordenar[3])
	case "fecha_venc_t"
		if ordenar[4]="fecha_venc A" then
			ordenar[4]="fecha_venc D"
		else
			ordenar[4]="fecha_venc A"
		end if
		this.setsort(ordenar[4])
	case "lote_t"
		if ordenar[5]="lote A" then
			ordenar[5]="lote D"
		else
			ordenar[5]="lote A"
		end if
		this.setsort(ordenar[5])
	case "costoprom_t"
		if ordenar[6]="costoprom A" then
			ordenar[6]="costoprom D"
		else
			ordenar[6]="costoprom A"
		end if
		this.setsort(ordenar[6])
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

event retrieveend;Filter()

end event

type pd from userobject within t1
integer x = 18
integer y = 112
integer width = 5385
integer height = 1280
long backcolor = 67108864
string text = "Producto Insumo"
long tabtextcolor = 33554432
string picturename = "insumo.ico"
long picturemaskcolor = 536870912
st_cuantos st_cuantos
pb_14 pb_14
st_3 st_3
st_1 st_1
pb_placa pb_placa
st_2 st_2
pb_5 pb_5
pb_6 pb_6
dw_l dw_l
dw_cpo dw_cpo
end type

on pd.create
this.st_cuantos=create st_cuantos
this.pb_14=create pb_14
this.st_3=create st_3
this.st_1=create st_1
this.pb_placa=create pb_placa
this.st_2=create st_2
this.pb_5=create pb_5
this.pb_6=create pb_6
this.dw_l=create dw_l
this.dw_cpo=create dw_cpo
this.Control[]={this.st_cuantos,&
this.pb_14,&
this.st_3,&
this.st_1,&
this.pb_placa,&
this.st_2,&
this.pb_5,&
this.pb_6,&
this.dw_l,&
this.dw_cpo}
end on

on pd.destroy
destroy(this.st_cuantos)
destroy(this.pb_14)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.pb_placa)
destroy(this.st_2)
destroy(this.pb_5)
destroy(this.pb_6)
destroy(this.dw_l)
destroy(this.dw_cpo)
end on

type st_cuantos from statictext within pd
integer x = 3744
integer y = 1088
integer width = 544
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_14 from picturebutton within pd
integer x = 3739
integer y = 816
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
string picturename = "contrato.gif"
string disabledname = "d_contrato.gif"
alignment htextalign = left!
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

type st_3 from statictext within pd
integer x = 73
integer y = 640
integer width = 407
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lotes del artículo"
boolean focusrectangle = false
end type

type st_1 from statictext within pd
integer x = 73
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

type pb_placa from picturebutton within pd
event mousemove pbm_mousemove
string tag = "Asignar Responsable"
boolean visible = false
integer x = 4091
integer y = 668
integer width = 146
integer height = 128
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "carpeta hoja.gif"
string disabledname = "d_carpeta hoja.gif"
alignment htextalign = left!
string powertiptext = "Asignar Responsable"
end type

event clicked;long asignado, numdoc, item
string cl
if dw_cpo.RowCount() = 0 then Return
if dw_cpo.AcceptText() = -1 then 
	Return
end if
if not (dw_cab.GetItemString(1,'estado') = '1') then
	MessageBox('Atención','Sólo cuando haya sido grabado el documento - Estado terminado')
	Return -1
end if
if isNull(dw_cpo.GetItemString(dw_cpo.getRow(),'act_fijo')) then
	messageBox('Aviso','El artículo seleccionado no es activo fijo')
	Return
end if
	
if dw_cpo.GetItemString(dw_cpo.getRow(),'act_fijo') <> '1' then
	messageBox('Aviso','El artículo seleccionado no es activo fijo')
	Return
end if
cl = dw_cpo.GetItemString(dw_cpo.getRow(),'clugar') 
numdoc = dw_cpo.GetItemNumber(dw_cpo.getRow(),'numdoc') 
item = dw_cpo.GetItemNumber(dw_cpo.getRow(),'item') 
//select count(*) into :asignado from af_respon
//where coddocu_consu=:codDocumento and cLugar_consu =:cLugar and numdoc_consu=:numdoc
//	and item_consu = :item;
if asignado < dw_cpo.GetItemNumber(dw_cpo.getRow(),'cantidad') then
//	openSheetwithParm(w_af_respon,dw_cpo,w_principal,10, Original!)
else
	messageBox('Aviso','El número de artículos requeridos ya ha sido asignado')
end if

end event

type st_2 from statictext within pd
boolean visible = false
integer x = 3899
integer y = 832
integer width = 1157
integer height = 116
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "Si el artículo es un activo fijo, puede asignar un responsable directamente."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_5 from picturebutton within pd
event mousemove pbm_mousemove
integer x = 3739
integer y = 676
integer width = 146
integer height = 128
integer taborder = 40
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
string powertiptext = "Eliminar Lote"
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
	dw_l.DeleteRow(0)
	if dw_cpo.GetItemNumber(f,'cantidad') <= 0 then
//		dw_cpo.DeleteRow(f)
	end if
end if
dw_cpo.TriggerEvent(RowFocuschanged!)
cambio = TRUE

end event

type pb_6 from picturebutton within pd
event mousemove pbm_mousemove
integer x = 5120
integer y = 60
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
cambio = TRUE
end event

type dw_l from datawindow within pd
integer x = 73
integer y = 700
integer width = 3547
integer height = 492
integer taborder = 40
string title = "none"
string dataobject = "dw_mvto_lote_sal"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event losefocus;setColumn('cantidad')
triggerEvent(itemchanged!)

end event

event itemchanged;AcceptText()
if getColumnName() = 'cantidad' then
	dw_cpo.SetItem(dw_cpo.GetRow(),'cantidad',double(describe("Evaluate('sum(cantidad)',0)")))
end if
dw_cpo.triggerevent(itemchanged!)
//calCosto()

end event

event dberror;Rollback;
Return 0

end event

event rowfocuschanged;st_cuantos.text="Reg. "+ string(dw_l.getrow()) +" de " +string(dw_l.rowcount())
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

type dw_cpo from datawindow within pd
integer x = 73
integer y = 60
integer width = 5006
integer height = 568
integer taborder = 20
string title = "none"
string dataobject = "dw_mvto_cpo_oc_new"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rowfocuschanged;if this.RowCount() = 0 or currentRow = 0 then Return
if not isNull(GetItemNumber(GetRow(),'item')) then
	dw_l.SetFilter("item="+string(GetItemNumber(GetRow(),'item')))
	dw_l.Filter()
end if
//if GetItemString(GetRow(),'act_fijo') = '1' and codDocumento = 'SC' then
//	pb_placa.Visible = TRUE
//	st_2.Visible = TRUE
//else
//	pb_placa.Visible = FALSE
//	st_2.Visible = FALSE
//end if
//
end event

event losefocus;AcceptText()

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

event itemchanged;if AcceptText() = -1 then Return -1
cambio = TRUE
long i
dec monto
for i = 1 to t1.pd.dw_cpo.RowCount()
	if isNull(t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')) or isNull(t1.pd.dw_cpo.GetItemNumber(i,'cantidad')) then Continue
	SetItem(i,'vtotal',  round((t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')*t1.pd.dw_cpo.GetItemNumber(i,'cantidad')*(1+getPorcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100)),i_dec_gral))
	monto = monto + round((t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')*t1.pd.dw_cpo.GetItemNumber(i,'cantidad')*(1+getPorcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100)),i_dec_gral)
next


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

type pr from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5385
integer height = 1280
long backcolor = 67108864
string text = "Producto Obtenido"
long tabtextcolor = 33554432
string picturename = "obtenido.ico"
long picturemaskcolor = 536870912
pb_13 pb_13
st_5 st_5
pb_10 pb_10
pb_9 pb_9
pb_8 pb_8
pb_buscar pb_buscar
sle_codprod sle_codprod
dw_rc dw_rc
dw_rl dw_rl
end type

on pr.create
this.pb_13=create pb_13
this.st_5=create st_5
this.pb_10=create pb_10
this.pb_9=create pb_9
this.pb_8=create pb_8
this.pb_buscar=create pb_buscar
this.sle_codprod=create sle_codprod
this.dw_rc=create dw_rc
this.dw_rl=create dw_rl
this.Control[]={this.pb_13,&
this.st_5,&
this.pb_10,&
this.pb_9,&
this.pb_8,&
this.pb_buscar,&
this.sle_codprod,&
this.dw_rc,&
this.dw_rl}
end on

on pr.destroy
destroy(this.pb_13)
destroy(this.st_5)
destroy(this.pb_10)
destroy(this.pb_9)
destroy(this.pb_8)
destroy(this.pb_buscar)
destroy(this.sle_codprod)
destroy(this.dw_rc)
destroy(this.dw_rl)
end on

type pb_13 from picturebutton within pr
event mousemove pbm_mousemove
integer x = 631
integer y = 4
integer width = 133
integer height = 116
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila"
alignment htextalign = left!
string powertiptext = "Eliminar artículo"
end type

event clicked;if dw_rc.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado')
	return
end if
if dw_rc.getitemstring(dw_rl.GetRow(),'control')='1' then
	messageBox('Aviso','El articulo viene desde trasformación directa no se puede eliminar')
	return
end if

do while dw_rl.RowCount() > 0 
	dw_rl.DeleteRow(0)
loop

dw_rc.DeleteRow(dw_rl.GetRow())
dw_rc.TriggerEvent(RowFocuschanged!)
cambio = TRUE

end event

type st_5 from statictext within pr
integer x = 78
integer y = 592
integer width = 699
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lotes del Artículo Obtenido"
boolean focusrectangle = false
end type

type pb_10 from picturebutton within pr
event mousemove pbm_mousemove
integer x = 3259
integer y = 936
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
st_p.codarticulo = dw_rc.GetItemString(dw_rc.GetRow(),'codarticulo')
st_p.coddoc = dw_cab.GetItemString(1,'coddoc')
st_p.clugar = dw_cab.GetItemString(1,'clugar')
st_p.numdoc = dw_cab.GetItemNumber(1,'numdoc')
st_p.item = dw_rc.GetItemNumber(dw_rc.GetRow(),'item')
st_p.c_itm = dw_rc.GetItemString(dw_rc.GetRow(),'descripcion')
st_p.c_cant = '1'
st_p.dw_obj = dw_rl

openwithparm(w_lotes_articulo, st_p)

end event

type pb_9 from picturebutton within pr
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 3259
integer y = 800
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

event clicked;if dw_rl.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado')
	return
end if

string codart
long f
dec cant
if dw_rl.GetItemNumber(dw_rl.GetRow(),'control')=1  then
	messageBox('Aviso','Producto con lote automático no se puede eliminar')
	return
end if

codart = dw_rl.GetItemString(dw_rl.GetRow(),'codarticulo')
cant = dw_rl.GetItemNumber(dw_rl.GetRow(),'cantidad')
f = dw_rc.Find("codarticulo='"+codart+"'",1,dw_rc.RowCount())
if f > 0 then
	dw_rc.SetItem(f,'cantidad',dw_rc.GetItemNumber(f,'cantidad') - cant)
	if dw_rc.GetItemNumber(f,'cantidad') <= 0 then
		dw_rc.SetItem(f,'cantidad',0)
	end if
	dw_rl.DeleteRow(0)
end if
dw_rc.TriggerEvent(RowFocuschanged!)
cambio = TRUE
end event

type pb_8 from picturebutton within pr
event mousemove pbm_mousemove
string tag = "Nuevo documento"
integer x = 3259
integer y = 660
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Agregar registro"
end type

event clicked;if dw_rc.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado')
	return
end if

long f,con_anyo,con_art,l_control
date fven
int fuu
string l_lote,l_sufijo=' ',l_prefijo=' '

if codDocumento = 'TR' and c_lote='1' then
	fuu=year(today())
	l_control=0
	select conse_anyo, conse_arti into :con_anyo,:con_art
	from sum_lote_consecutivo
	where (((anyo)=:fuu) and ((estado)='1'));
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return -1
	elseif SQLCA.SQLCode = 100 THEN
		MessageBox("Atención", 'No existe consecutivo de Lote para el año '+string(fuu))
		Return -1
	END IF
	con_art=con_art+1
	//update sum_lote_consecutivo set  conse_arti=:con_art
	//where (((anyo)=:fuu) and ((estado)='1'));
	//commit;
	
	setnull(fuu)
	if not isnull(dw_rc.GetItemString(dw_rc.GetRow(),'prefijo')) then l_prefijo=dw_rc.GetItemString(dw_rc.GetRow(),'prefijo')
	if not isnull(dw_rc.GetItemString(dw_rc.GetRow(),'sufijo')) then l_sufijo='-'+dw_rc.GetItemString(dw_rc.GetRow(),'sufijo')
	if not isnull(dw_rc.GetItemnumber(dw_rc.GetRow(),'dias_fuu')) then 
		fuu=dw_rc.GetItemnumber(dw_rc.GetRow(),'dias_fuu')
		if  fuu<>0 then
			fven=RelativeDate(date(t1.pr.pb_8.text), fuu)
		else
			fven=date(t1.pr.pb_8.text)
		end if
		t1.pr.pb_8.text=''
		l_lote=trim(l_prefijo+'-'+string(con_anyo)+'-'+string(fven,'ddmmyyyy')+'-'+string(con_art,'000')+l_sufijo)
		l_control=1
	end if
end if

f = dw_rl.InsertRow(0)
dw_rl.SetItem(f,'fecha_venc',fven)
dw_rl.SetItem(f,'lote',l_lote)
dw_rl.SetItem(f,'codalmacen',dw_cab.GetItemString(1,'codalmacen'))
dw_rl.SetItem(f,'codarticulo',dw_rc.GetItemString(dw_rc.GetRow(),'codarticulo'))
dw_rl.SetItem(f,'coddoc',dw_rc.GetItemString(dw_rc.GetRow(),'coddoc'))
dw_rl.SetItem(f,'clugar',dw_rc.GetItemString(dw_rc.GetRow(),'clugar'))
dw_rl.SetItem(f,'numdoc',dw_rc.GetItemNumber(dw_rc.GetRow(),'numdoc'))
dw_rl.SetItem(f,'item',dw_rc.GetItemNumber(dw_rc.GetRow(),'item'))
dw_rl.SetItem(f,'signo',1)
dw_rl.SetItem(f,'control',l_control)
dw_rl.ScrolltoRow(f)
cambio = TRUE


end event

type pb_buscar from picturebutton within pr
event mousemove pbm_mousemove
string tag = "Buscar"
integer x = 494
integer y = 4
integer width = 133
integer height = 116
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "buscar.gif"
string disabledname = "d_buscar.gif"
alignment htextalign = left!
string powertiptext = "Buscar"
end type

event clicked;If dw_cab.GetRow() <= 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') <> '0' then
	messageBox('Aviso','El documento ya ha sido cerrado. No puede modificarse')
	Return
end if
openwithParm(w_buscaArt,sle_codprod)

end event

type sle_codprod from singlelineedit within pr
integer x = 64
integer y = 12
integer width = 402
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;int i,l_dias
boolean crea
long fila, maximo
string codigo, descripcion, valor, codgenerico, vence,prefijo,sufijo

if dw_cab.RowCount() < 1 then Return

if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') <> '0' then
	messageBox('Aviso','El documento ya ha sido cerrado. No puede modificarse')
	Return -1
end if

string codart
codart = trim(sle_codprod.Text)

select sumarticulo.codarticulo, sumarticulo.codgenerico, sumarticulo.descripcion, sumarticulo.vence,sumarticulo.prefijo,sumarticulo.sufijo,dias_fuu into :codigo, :codgenerico, :descripcion, :vence,:prefijo,:sufijo,:l_dias
from sumarticulo  
where codarticulo=:codart;
IF SQLCA.SQLCode = -1 THEN
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return -1
elseif SQLCA.SQLCode = 100 THEN
	MessageBox("Atención", 'No existe el articulo con el código dado')
	Return -1
END IF

fila = dw_rc.Find("codarticulo='"+codart+"'",1,dw_rc.RowCount())
if fila = 0 then
	maximo = long(t1.pd.dw_cpo.Describe("Evaluate('max(item)',1)"))
	maximo = maximo + long(dw_rc.Describe("Evaluate('max(item)',1)")) + 1
	fila = dw_rc.InsertRow(0)
	dw_rc.SetItem(fila, 'coddoc', dw_cab.GetItemString(1,'coddoc') )
	dw_rc.SetItem(fila, 'cLugar', dw_cab.GetItemString(1,'clugar') )
	dw_rc.SetItem(fila, 'numdoc', dw_cab.GetItemNumber(1,'numdoc') )
	dw_rc.SetItem(fila, 'item',maximo)
	dw_rc.SetItem(fila, 'descripcion',descripcion)
	dw_rc.SetItem(fila, 'codgenerico',codgenerico)
	dw_rc.SetItem(fila, 'codarticulo',codigo)
	dw_rc.SetItem(fila, 'tipo','R')
	dw_rc.SetItem(fila, 'estado','0')
	dw_rc.SetItem(fila, 'vence',vence)
	dw_rc.SetItem(fila, 'prefijo',prefijo)
	dw_rc.SetItem(fila, 'sufijo',sufijo)
	dw_rc.SetItem(fila, 'dias_fuu',l_dias)
	dw_rc.SetItem(fila, 'control',sle_codprod.tag)
	dw_rc.Event rowfocuschanged(fila)
	t1.pr.pb_8.Event clicked()
	cambio = TRUE
end if

end event

type dw_rc from datawindow within pr
integer x = 73
integer y = 128
integer width = 5170
integer height = 428
integer taborder = 30
string title = "none"
string dataobject = "dw_mvto_cpo_oc_new"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
Modify("datawindow.footer.height=0")
end event

event rowfocuschanged;if this.RowCount() = 0 or currentRow = 0 then Return
if not isNull(GetItemNumber(GetRow(),'item')) then
	dw_rl.SetFilter("item="+string(GetItemNumber(GetRow(),'item')))
	dw_rl.Filter()
end if
if GetItemString(GetRow(),'vence') = '1' then
	pb_8.Enabled = TRUE
	pb_9.Enabled = TRUE
	pb_10.Enabled = TRUE
else
	pb_8.Enabled = FALSE
	pb_9.Enabled = FALSE
	pb_10.Enabled = FALSE
end if

end event

event getfocus;if dw_cab.RowCount() = 0 then Return

//if dw_cab.GetItemString(1,'estado') = '0' then
//	calCosto()
//end if

end event

event itemchanged;if AcceptText() = -1 then Return -1
cambio = TRUE
long i
dec monto
for i = 1 to t1.pr.dw_rc.RowCount()
	if isNull(t1.pr.dw_rc.GetItemNumber(i,'valor_unit')) or isNull(t1.pr.dw_rc.GetItemNumber(i,'cantidad')) then Continue
	SetItem(i,'vtotal',  round((t1.pr.dw_rc.GetItemNumber(i,'valor_unit')*t1.pr.dw_rc.GetItemNumber(i,'cantidad')*(1+getPorcentaje(t1.pr.dw_rc.GetItemString(i,'cod_impu'))/100)),i_dec_gral))
	monto = monto + round((t1.pr.dw_rc.GetItemNumber(i,'valor_unit')*t1.pr.dw_rc.GetItemNumber(i,'cantidad')*(1+getPorcentaje(t1.pr.dw_rc.GetItemString(i,'cod_impu'))/100)),i_dec_gral)
next
dw_cab.SetItem(1,'valor_agregado',monto)
//calCosto()

end event

event dberror;Rollback;
Return 0

end event

type dw_rl from datawindow within pr
integer x = 69
integer y = 664
integer width = 3122
integer height = 576
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_mvto_lote_mod"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
end event

event itemchanged;if AcceptText() = -1 then Return 1
if getColumnName() = 'cantidad' then
	dw_rc.SetItem(dw_rc.GetRow(),'cantidad',long(describe("Evaluate('sum(cantidad)',0)")))
end if
cambio = TRUE
//calCosto()

end event

event losefocus;setColumn('cantidad')
triggerEvent(itemchanged!)

end event

event dberror;Rollback;
Return 0

end event

type dw_c from datawindow within w_doc_ori
event borrarnuevo ( )
integer x = 69
integer y = 256
integer width = 3374
integer height = 564
integer taborder = 100
string title = "none"
string dataobject = "dw_mvto_cab"
boolean hscrollbar = true
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

event constructor;SetTransObject(SQLCA)

end event

event rowfocuschanged;t1.pd.dw_l.Reset()
t1.pd.dw_cpo.Reset()
t1.pr.dw_rc.Reset()
t1.pr.dw_rl.Reset()
dw_cab.Reset()
If currentrow = 0 or rowCount() = 0 then Return
if not isNull(GetItemNumber(GetRow(),'numdoc')) then
	dw_cab.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
	t1.pd.dw_l.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
	t1.pd.dw_cpo.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
	t1.pr.dw_rl.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
	t1.pr.dw_rc.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
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

event clicked;if row < 1 then Return 0
if GetRow() <> row then
	Setrow(row)
end if

end event

event itemchanged;if dwo.name = 'convenio' then
	dw_cab.SetItem(1,'convenio',data)
end if

end event

type dw_alm from datawindow within w_doc_ori
event retornar ( )
integer x = 1422
integer y = 72
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

event itemchanged;if nuevo > 0 or cambio then 
	if messageBox('Aviso','El documento nuevo no ha sido guardado, perderá los cambios. Desea continuar?',QUESTION!,YESNO!) = 2 then
		codalm = this.GetItemString(1,'codalmacen')
		this.PostEvent("retornar")
		return -1
	end if
	nuevo = 0
	cambio = FALSE
end if
AcceptText()
dw_c.Reset()
dw_cab.Reset()
dw_c.Reset()
t1.pd.dw_cpo.Reset()
dw_c.Retrieve(dw_alm.GetItemString(1,'codalmacen'),codDocumento)
dwc_almt.setfilter("codlugar='"+dw_alm.GetItemString(1,'codalmacen')+"'")
dwc_almt.filter()
t1.pk.dw_k.Retrieve(dw_alm.GetItemString(1,'codalmacen'))

end event

type gb_1 from groupbox within w_doc_ori
integer x = 32
integer y = 188
integer width = 3461
integer height = 672
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

type dw_cab from datawindow within w_doc_ori
integer x = 3511
integer y = 196
integer width = 1975
integer height = 656
integer taborder = 110
string title = "none"
string dataobject = "dw_mvto_cab_ff"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event itemchanged;string n1,n2,a1,a2,rs,td,doc
if getColumnName() = 'documento' then
	td = GetItemString(GetRow(),'tipodoc')
	if isNull(data) then
		doc = GetItemString(GetRow(),'documento')
	else
		doc = data
	end if
	if td = '' or doc = '' or isNull(td) or isNull(doc) then Return
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
end if
if AcceptText() = -1 then Return -1
//if GetColumnName() = 'valor_agregado' then
//	calCosto()
//end if

end event

event dberror;Rollback;
Return 0

end event

event doubleclicked;string columna
columna=getcolumnname() 
if columna="tipodoc" or columna="documento" or columna='dverificacion' then
	g_tercerodesde=13
	openwithparm(w_buscater, this)
	if getitemstring(getrow(),"documento")<>"" then
		setcolumn("documento")
		//triggerevent(itemchanged!)
	end if
end if
end event

event constructor;SetTransObject(SQLCA)
end event

type st_4 from statictext within w_doc_ori
integer x = 3511
integer y = 204
integer width = 1806
integer height = 644
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217752
boolean focusrectangle = false
end type

