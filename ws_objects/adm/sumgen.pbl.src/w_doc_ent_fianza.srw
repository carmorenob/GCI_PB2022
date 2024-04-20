$PBExportHeader$w_doc_ent_fianza.srw
$PBExportComments$Ventana para documentos que usan otros documentos base
forward
global type w_doc_ent_fianza from window
end type
type st_6 from statictext within w_doc_ent_fianza
end type
type dw_lug from datawindow within w_doc_ent_fianza
end type
type pb_5 from picturebutton within w_doc_ent_fianza
end type
type pb_grabartmp from picturebutton within w_doc_ent_fianza
end type
type pb_grabar from picturebutton within w_doc_ent_fianza
end type
type pb_cancelar from picturebutton within w_doc_ent_fianza
end type
type pb_anular from picturebutton within w_doc_ent_fianza
end type
type pb_3 from picturebutton within w_doc_ent_fianza
end type
type pb_lote from picturebutton within w_doc_ent_fianza
end type
type pb_nuevo from picturebutton within w_doc_ent_fianza
end type
type pb_2 from picturebutton within w_doc_ent_fianza
end type
type pb_4 from picturebutton within w_doc_ent_fianza
end type
type t1 from tab within w_doc_ent_fianza
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
type st_1 from statictext within pd
end type
type pb_10 from picturebutton within pd
end type
type pb_8 from picturebutton within pd
end type
type pb_9 from picturebutton within pd
end type
type pb_6 from picturebutton within pd
end type
type dw_l from datawindow within pd
end type
type dw_cpo from datawindow within pd
end type
type pd from userobject within t1
st_1 st_1
pb_10 pb_10
pb_8 pb_8
pb_9 pb_9
pb_6 pb_6
dw_l dw_l
dw_cpo dw_cpo
end type
type t1 from tab within w_doc_ent_fianza
pk pk
pd pd
end type
type dw_c from datawindow within w_doc_ent_fianza
end type
type dw_alm from datawindow within w_doc_ent_fianza
end type
type gb_1 from groupbox within w_doc_ent_fianza
end type
type dw_cab from datawindow within w_doc_ent_fianza
end type
end forward

global type w_doc_ent_fianza from window
integer width = 5614
integer height = 2472
boolean titlebar = true
string title = "Suministros"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_fianza.ico"
st_6 st_6
dw_lug dw_lug
pb_5 pb_5
pb_grabartmp pb_grabartmp
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
end type
global w_doc_ent_fianza w_doc_ent_fianza

type variables
string coddocumento, codalm, i_operacion
DataWindowChild dwc_alm, dwc_f, dwc_i,dwc_lugar
long nuevo
string ordenar[6]
boolean cambio
int i_dec_gral,i_aprox_gral

end variables

forward prototypes
public function integer reversa ()
public function integer grabar_tmp ()
end prototypes

public function integer reversa ();//long i,j
//dw_cab.SetItem(1,'estado','0')
//dw_cab.SetItemStatus(dw_cab.GetRow(),0, Primary!,NewModified!)
//
//t1.pd.dw_cpo.SetRedraw(FALSE)
//t1.pd.dw_l.SetRedraw(FALSE)
//for i = 1 to t1.pd.dw_cpo.RowCount()
//	t1.pd.dw_cpo.Scrolltorow(i)
//	t1.pd.dw_cpo.Event RowFocuschanged(i)
//	t1.pd.dw_cpo.SetItemStatus(i,0, Primary!,NewModified!)
//	for j =  1 to t1.pd.dw_l.RowCount()
//		t1.pd.dw_l.SetItemStatus(j,0, Primary!,NewModified!)
//	next
//next
//t1.pd.dw_cpo.SetRedraw(TRUE)
//t1.pd.dw_l.SetRedraw(TRUE)
//
Return 0

end function

public function integer grabar_tmp ();if dw_cab.RowCount() = 0 then Return -1

if not(dw_cab.GetItemString(1,'estado') = '0') then
	MessageBox('Atención','El documento no está activo')
	Return 0
end if

if f_num_compu('s','o') = FALSE then Return -1

t1.pd.dw_cpo.SetFilter("")
t1.pd.dw_cpo.Filter()

if t1.pd.dw_cpo.RowCount() = 0 then 
	MessageBox('Atención','No ha agregado ningun artículo al detalle del documento')
	Return -1
end if

long i, j, item
double numdoc
string cod_flujo

if nuevo > 0 then
	numdoc = f_trae_ndoc(dw_cab.GetItemString(1,'coddoc'),clugar,This.Title)
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
	Return -1
end if
i_operacion = 'Delete'
if t1.pd.dw_l.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
if t1.pd.dw_cpo.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
i_operacion = 'Insert'
if t1.pd.dw_cpo.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
if t1.pd.dw_l.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
i_operacion = ''

cambio = FALSE
Return 0

end function

event open;string ojo
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

codDocumento = Message.StringParm
if codDocumento = 'SF' then
	Title = 'Suministros - Entrada por Fianza'
	icon='ribon_fianza.ico'
elseif coddocumento = 'SDN' then
	Title= 'Suministros - Entrada por Donación'
	icon='ribon_donacion.ico'	
	pb_lote.Visible = FALSE
elseif coddocumento = 'SN' then
	Title = 'Suministros - Entrada por Convenio'
	icon='ribon_convenio.ico'		
	pb_lote.Visible = FALSE
end if
dw_cab.Modify("codalmacen_target.Visible=FALSE valor_agregado.Visible=TRUE valor_agregado.Edit.DisplayOnly=TRUE codalmacen_target_t.Text='Total'")
dw_alm.SetTransObject(SQLCA)

dw_cab.GetChild('cod_flujo',dwc_f)
dwc_f.SetTransObject(SQLCA)
if dwc_f.Retrieve(coddocumento) = 0 then
	dw_cab.Modify("cod_flujo.Protect='1'")
	dwc_f.InsertRow(0)
end if

t1.pd.dw_cpo.GetChild('cod_impu',dwc_i)
dwc_i.SetTransObject(SQLCA)
dwc_i.Retrieve(codDocumento)
dwc_i.InsertRow(1)
dwc_i.SetItem(1,'nombre','Ninguno')

end event

on w_doc_ent_fianza.create
this.st_6=create st_6
this.dw_lug=create dw_lug
this.pb_5=create pb_5
this.pb_grabartmp=create pb_grabartmp
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
this.Control[]={this.st_6,&
this.dw_lug,&
this.pb_5,&
this.pb_grabartmp,&
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
this.dw_cab}
end on

on w_doc_ent_fianza.destroy
destroy(this.st_6)
destroy(this.dw_lug)
destroy(this.pb_5)
destroy(this.pb_grabartmp)
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
end on

event closequery;if nuevo > 0 or cambio then 
	if messageBox('Aviso','El documento nuevo no ha sido guardado, perderá los cambios. Desea continuar?',QUESTION!,YESNO!) = 2 then
		return -1
	end if
end if

end event

event resize;t1.resize((newwidth - 50) , (newheight * 0.70))
t1.pk.dw_k.resize(5065,(t1.height *0.70))
t1.pd.dw_l.resize(3127,(t1.height *0.30))

end event

type st_6 from statictext within w_doc_ent_fianza
integer x = 1449
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

type dw_lug from datawindow within w_doc_ent_fianza
integer x = 41
integer y = 4
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

type pb_5 from picturebutton within w_doc_ent_fianza
event mousemove pbm_mousemove
integer x = 3529
integer y = 32
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
string picturename = "editar.gif"
string disabledname = "d_editar.gif"
alignment htextalign = left!
string powertiptext = "Usar plantilla"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
st_otrosi st_p
st_p.dw_cab = dw_cab
st_p.dw_obj = t1.pd.dw_cpo
st_p.codalmacen = dw_cab.GetItemString(dw_cab.Getrow(),'codalmacen')
st_p.coddoc = 'SPT'
if dw_cab.GetItemString(dw_cab.Getrow(),'estado') = '0' then
	openWithParm(w_sum_plant,st_p)
end if

end event

type pb_grabartmp from picturebutton within w_doc_ent_fianza
event mousemove pbm_mousemove
string tag = "Grabar Temporal"
integer x = 4293
integer y = 32
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
Return 0

end event

type pb_grabar from picturebutton within w_doc_ent_fianza
event mousemove pbm_mousemove
integer x = 4434
integer y = 32
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
int ret
if not(dw_cab.GetItemString(1,'estado') = '0') then
	MessageBox('Atención','El documento no es nuevo')
	Return -1
end if

if f_num_compu('s','o') = FALSE then Return -1

If messageBox('Aviso','Se grabará definitivamente, no podrá realizar cambios. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return 0

//if isNull(dw_cab.GetItemString(1,'convenio')) and i_convenio = '1' then
//	ret = MessageBox('Atención','No se ha definido si la entrada es de convenio. Es entrada proveniente de Convenio?',QUESTION!,YESNOCANCEL!)
//	if ret = 1 then
//		dw_cab.SetItem(1,'convenio','1')
//	elseif ret = 2 then
//		dw_cab.SetItem(1,'convenio','0')
//	else
//		Return -1
//	end if
//end if

if grabar_tmp() = -1 then
	Rollback;
	Return -1
end if

t1.pd.dw_cpo.SetFilter("")
t1.pd.dw_cpo.Filter()

if t1.pd.dw_cpo.RowCount() = 0 then 
	MessageBox('Atención','No ha agregado ningun artículo al detalle del documento')
	Rollback;
	Return -1
end if

if isNull(dw_cab.GetItemString(1,'documento')) then
	MessageBox('Aviso','Debe seleccionar un tercero')
	Rollback;
	Return -1
end if

long i,j
double numdoc

i = t1.pd.dw_cpo.RowCount()
do while i > 0
	t1.pd.dw_cpo.ScrolltoRow(i)
	t1.pd.dw_cpo.Event RowFocuschanged(i)
	if isNull(t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')) or t1.pd.dw_cpo.GetItemNumber(i,'valor_unit') = 0 then
		t1.pd.dw_cpo.SetRedraw(TRUE)
		Messagebox('Aviso','Debe proporcionar el valor del articulo. Articulo:' + t1.pd.dw_cpo.GetItemString(i,'codarticulo'))
		Rollback;
		Return -1
	end if
	if t1.pd.dw_cpo.GetItemString(i,'vence') = '1' and not(t1.pd.dw_cpo.GetItemNumber(i,'cantidad') = double(t1.pd.dw_l.Describe("Evaluate('sum(cantidad)',0)"))) then
		t1.pd.dw_cpo.SetRedraw(TRUE)
		if Messagebox('Aviso','La cantidad no coincide con las cantidades en lotes. Desea eliminar el registro del articulo y Continuar?. Articulo:' + t1.pd.dw_cpo.GetItemString(i,'codarticulo'),QUESTION!,YESNO!) = 2 then Return -1
		t1.pd.pb_6.TriggerEvent(clicked!)
	end if
	i = i - 1
loop

for i = 1 to t1.pd.dw_cpo.RowCount()
	if t1.pd.dw_cpo.GetItemNumber(i,'cantidad') = 0 then Continue
	t1.pd.dw_cpo.ScrolltoRow(i)
	t1.pd.dw_cpo.Event RowFocuschanged(i)
	if f_kardexentrada(dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo'),t1.pd.dw_cpo.GetItemNumber(i,'cantidad'),t1.pd.dw_cpo.GetItemString(i,'coddoc'),t1.pd.dw_cpo.GetItemString(i,'clugar'),t1.pd.dw_cpo.GetItemNumber(i,'numdoc'),t1.pd.dw_cpo.GetItemNumber(i,'item'),t1.pd.dw_cpo.GetItemNumber(i,'valor_unit'),getporcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100,dw_cab.GetItemDateTime(1,'fecha')) = -1 then
		reversa()
		Rollback;
		Return -1
	end if
	for j = 1 to t1.pd.dw_l.RowCount()
		if f_act_lote(dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo'),t1.pd.dw_l.GetItemNumber(j,'cantidad'),t1.pd.dw_cpo.GetItemString(i,'coddoc'),t1.pd.dw_cpo.GetItemString(i,'clugar'),t1.pd.dw_cpo.GetItemNumber(i,'numdoc'),t1.pd.dw_cpo.GetItemNumber(i,'item'),t1.pd.dw_l.GetItemString(j,'lote'),t1.pd.dw_l.GetItemDateTime(j,'fecha_venc'),t1.pd.dw_l.GetItemNumber(j,'signo'),dw_cab.GetItemString(1,'codalmacen_target'),t1.pd.dw_l.GetItemString(j,'convenio')) = -1 then
			reversa()
			Rollback;
			Return -1
		end if
	next
	if verificaKardex_lote(dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo')) = -1 then
		Rollback;
		messageBox('Error','La cantidad en Kardex no coincide con la cantidad en Lotes. Art:'+t1.pd.dw_cpo.GetItemString(i,'codarticulo'))
		Return -1
	end if

next
dw_cab.ResetUpdate()
t1.pd.dw_cpo.ResetUpdate()
t1.pd.dw_l.ResetUpdate()
t1.pd.dw_cpo.SetRedraw(TRUE)
dw_cab.SetItem(1,'estado','1')
if dw_cab.Update() = -1 then
	Rollback;
	Return -1
end if

dw_c.SetItem(dw_c.GetRow(),'estado','1')
nuevo = 0
cambio = FALSE
commit;
Return 0

end event

type pb_cancelar from picturebutton within w_doc_ent_fianza
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 3831
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
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_anular from picturebutton within w_doc_ent_fianza
event mousemove pbm_mousemove
string tag = "Anular Documento"
integer x = 4137
integer y = 32
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
string cd,cl,ls_estado,endestino
dec cantidad

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
if f_valida_periodo_sum(dw_cab.GetItemdatetime(1,'fecha'))= -1 then 
	messageBox('Aviso','Periodo cerrado ya no se puede anular')
	return 
end if
if dw_cab.GetItemString(1,'estado') = '2' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(1,'numdoc')) +' ya ha sido anulado')
	return
end if
if dw_cab.GetItemString(1,'estado') = '3' then
	messageBox('Aviso','El documento ' + string(dw_cab.GetItemNumber(1,'numdoc')) +' ya ha sido atendido')
	return
end if
if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') = '1' then
	long f
	t1.pd.dw_cpo.Find("atendido > 0",1,t1.pd.dw_cpo.RowCount())
	if f > 0 then
		messageBox('Aviso','Se han devuelto articulos para este documento. No puede modificarse')
		Return -1
	end if
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
	if f_kardexentanula(dw_cab.GetItemString(1,'coddoc'),dw_cab.GetItemString(1,'clugar'),dw_cab.GetItemNumber(1,'numdoc'),dw_cab.GetItemString(1,'codalmacen')) = -1 then
		rollback;
		Return -1
	end if
end if

dw_cab.SetItem(1,'Estado','2')
dw_cab.SetItem(dw_cab.GetRow(),'anulado',usuario)
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

type pb_3 from picturebutton within w_doc_ent_fianza
event mousemove pbm_mousemove
string tag = "Imprimir Reporte"
integer x = 3982
integer y = 32
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

f_reporte(dw_cab.GetItemString(1,'coddoc'),"Reporte de Fianza",param)

end event

type pb_lote from picturebutton within w_doc_ent_fianza
event mousemove pbm_mousemove
string tag = "Asignar Lotes (Vencimiento)"
integer x = 3680
integer y = 32
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
string picturename = "contrato.gif"
string disabledname = "d_contrato.gif"
alignment htextalign = left!
string powertiptext = "Formalizar Orden de Compra"
end type

event clicked;if dw_cab.RowCount() = 0 then Return

if dw_cab.GetItemString(1,'estado') = '1' then
	if messageBox('Atención','Esta opción generará una orden de compra con los items de la fianza. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return -1
	
	double numdoc
	dec valor = 0
	long i,j,fila
	uo_datastore dw_cb, dw_cp
	dw_cb = Create uo_datastore
	dw_cb.DataObject = 'dw_mvto_cab_ff'
	dw_cb.SetTransObject(SQLCA)
	dw_cp = Create uo_datastore
	dw_cp.DataObject = 'dw_mvto_cpo'
	dw_cp.SetTransObject(SQLCA)
	
	numdoc = f_trae_ndoc('OC',clugar,'orden de Compra')
	if numdoc < 0 then Return -1
	dw_cb.InsertRow(1)
	dw_cb.SetItem(1,'coddoc','OC')
	dw_cb.SetItem(1,'clugar',dw_cab.GetItemString(1,'clugar'))
	dw_cb.SetItem(1,'numdoc',numdoc)
	dw_cb.SetItem(1,'codalmacen',dw_cab.GetItemString(1,'codalmacen'))
	dw_cb.SetItem(1,'fecha',today())
	dw_cb.SetItem(1,'estado','3')
	dw_cb.SetItem(1,'tipodoc',dw_cab.GetItemString(1,'tipodoc'))
	dw_cb.SetItem(1,'documento',dw_cab.GetItemString(1,'documento'))
	
	for i = 1 to t1.pd.dw_cpo.RowCount()
		fila = dw_cp.InsertRow(0)
		dw_cp.SetItem(fila,'coddoc','OC')
		dw_cp.SetItem(fila,'clugar',dw_cab.GetItemString(1,'clugar'))
		dw_cp.SetItem(fila,'numdoc',numdoc)
		dw_cp.SetItem(fila,'item',t1.pd.dw_cpo.GetItemNumber(i,'item'))
		dw_cp.SetItem(fila,'codarticulo',t1.pd.dw_cpo.GetItemString(i,'codarticulo'))
		dw_cp.SetItem(fila,'cantidad',t1.pd.dw_cpo.GetItemNumber(i,'cantidad'))
		dw_cp.SetItem(fila,'cod_impu',t1.pd.dw_cpo.GetItemString(i,'cod_impu'))
		dw_cp.SetItem(fila,'valor_unit',t1.pd.dw_cpo.GetItemNumber(i,'valor_unit'))
		dw_cp.SetItem(fila,'atendido',t1.pd.dw_cpo.GetItemNumber(i,'cantidad'))
		t1.pd.dw_cpo.SetItem(i,'coddoc_ori','OC')
		t1.pd.dw_cpo.SetItem(i,'clugar_ori',dw_cb.GetItemString(1,'clugar'))
		t1.pd.dw_cpo.SetItem(i,'numdoc_ori',numdoc)
		t1.pd.dw_cpo.SetItem(i,'item_ori',t1.pd.dw_cpo.GetItemNumber(i,'item'))
		valor = valor + (t1.pd.dw_cpo.GetItemNumber(i,'cantidad') * t1.pd.dw_cpo.GetItemNumber(i,'valor_unit') * (1+getporcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100 ))
	next
	dw_cb.SetItem(1,'valor_agregado',valor)

	if dw_cb.Update() = -1 then
		MessageBox('Atención','Error actualizando orden de compra - cab')
		Rollback;
		Return -1
	end if
	if dw_cp.Update() = -1 then
		MessageBox('Atención','Error actualizando orden de compra - cpo')
		Rollback;
		Return -1
	end if
	if t1.pd.dw_cpo.Update() = -1 then
		MessageBox('Atención','Error actualizando fianza - cpo')
		Rollback;
		Return -1
	end if
	dw_cab.SetItem(1,'estado','3')
	if dw_cab.Update() = -1 then
		MessageBox('Atención','Error actualizando estado fianza')
		Rollback;
		Return -1
	end if
	dw_c.SetItem(dw_c.GetRow(),'estado','3')
	commit;
	MessageBox('Atención','Se generó la Orden de Compra '+string(numdoc))
end if
Return 0

end event

type pb_nuevo from picturebutton within w_doc_ent_fianza
event mousemove pbm_mousemove
string tag = "Nuevo documento"
integer x = 4585
integer y = 32
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
cambio = TRUE
nuevo = 1

end event

type pb_2 from picturebutton within w_doc_ent_fianza
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 4736
integer y = 32
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

type pb_4 from picturebutton within w_doc_ent_fianza
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 4887
integer y = 32
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

type t1 from tab within w_doc_ent_fianza
integer x = 41
integer y = 872
integer width = 5467
integer height = 1460
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
integer width = 5431
integer height = 1332
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
integer x = 923
integer y = 32
integer width = 1426
integer height = 80
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
integer x = 425
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
integer x = 69
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
integer x = 5157
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
string picturename = "refrescar.gif"
string disabledname = "d_refrescar.gif"
alignment htextalign = left!
string powertiptext = "Agregar artículo"
end type

event clicked;
dw_k.Retrieve(dw_alm.GetItemString(1,'codalmacen'))

end event

type pb_7 from picturebutton within pk
event mousemove pbm_mousemove
integer x = 5157
integer y = 132
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
string codigo, descripcion, presentacion, valor, lote, fecha_venc, alm
double cProm
if dw_cab.RowCount() <= 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento de BAJA ' + string(dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado')
	return
end if
setPointer(HourGlass!)
dw_k.SetFilter("")
dw_k.Filter()
if dw_k.Find("selec=1",1,dw_k.RowCount()) > 0 then
	cambio = TRUE
end if
for i = 1 to dw_k.RowCount()
	if dw_k.GetItemNumber(i,'selec') = 0 then CONTINUE
	descripcion = dw_k.getitemstring(i,'descripcion')
		
	if isnull(descripcion) then 
		Continue
	end if
	codigo = dw_k.getitemstring(i,'codarticulo')
	alm = dw_alm.GetItemString(1,'codalmacen')
	Select costoprom into:cprom from sum_kardex
	where codalmacen=:alm and codarticulo=:codigo;
	fila = t1.pd.dw_cpo.Find( "codarticulo=" + "'" + codigo + "'", 1, t1.pd.dw_cpo.RowCount())
	if fila < 1 then
		valor = t1.pd.dw_cpo.describe("Evaluate('max(item)', 1)")
		fila = t1.pd.dw_cpo.InsertRow(0)
		t1.pd.dw_cpo.SetItem(fila, 'coddoc', dw_cab.GetItemString(dw_cab.GetRow(),'coddoc') )
		t1.pd.dw_cpo.SetItem(fila, 'cLugar', dw_cab.GetItemString(dw_cab.GetRow(),'clugar') )
		t1.pd.dw_cpo.SetItem(fila, 'numdoc', dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc') )
		t1.pd.dw_cpo.SetItem(fila, 'descripcion',descripcion)
		t1.pd.dw_cpo.SetItem(fila, 'codarticulo',codigo)
		t1.pd.dw_cpo.SetItem(fila, 'codgenerico',dw_k.getitemstring(i,'codgenerico'))
//		t1.pd.dw_cpo.SetItem(fila, 'valor_unit',round(cProm,2))
		t1.pd.dw_cpo.SetItem(fila, 'Estado','0')
		t1.pd.dw_cpo.SetItem(fila, 'item',long(valor) + 1)
		t1.pd.dw_cpo.SetItem(fila, 'vence',dw_k.GetItemString(i,'vence'))
		t1.pd.dw_cpo.SetItem(fila, 'banco',dw_k.GetItemString(i,'banco'))
		t1.pd.dw_cpo.ScrolltoRow(fila)
	end if
	t1.pd.dw_cpo.TriggerEvent(rowfocuschanged!)
	dw_k.SetItem(i,'selec',0)
Next

if dw_k.describe("selec_t.Text") = 'Desel.' then
	dw_k.Modify("selec_t.Text='Selec.'")
end if
t1.SelectTab(t1.pd)

end event

type dw_k from datawindow within pk
integer x = 64
integer y = 124
integer width = 5065
integer height = 1168
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

type pd from userobject within t1
integer x = 18
integer y = 112
integer width = 5431
integer height = 1332
long backcolor = 67108864
string text = "Artículos Recibidos"
long tabtextcolor = 33554432
string picturename = "detalle.ico"
long picturemaskcolor = 536870912
st_1 st_1
pb_10 pb_10
pb_8 pb_8
pb_9 pb_9
pb_6 pb_6
dw_l dw_l
dw_cpo dw_cpo
end type

on pd.create
this.st_1=create st_1
this.pb_10=create pb_10
this.pb_8=create pb_8
this.pb_9=create pb_9
this.pb_6=create pb_6
this.dw_l=create dw_l
this.dw_cpo=create dw_cpo
this.Control[]={this.st_1,&
this.pb_10,&
this.pb_8,&
this.pb_9,&
this.pb_6,&
this.dw_l,&
this.dw_cpo}
end on

on pd.destroy
destroy(this.st_1)
destroy(this.pb_10)
destroy(this.pb_8)
destroy(this.pb_9)
destroy(this.pb_6)
destroy(this.dw_l)
destroy(this.dw_cpo)
end on

type st_1 from statictext within pd
integer x = 82
integer y = 712
integer width = 421
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

type pb_10 from picturebutton within pd
event mousemove pbm_mousemove
integer x = 3237
integer y = 1028
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

type pb_8 from picturebutton within pd
event mousemove pbm_mousemove
string tag = "Nuevo documento"
integer x = 3237
integer y = 780
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

long f
f = dw_l.InsertRow(0)
dw_l.SetItem(f,'codalmacen',dw_cab.GetItemString(1,'codalmacen'))
dw_l.SetItem(f,'codarticulo',dw_cpo.GetItemString(dw_cpo.GetRow(),'codarticulo'))
dw_l.SetItem(f,'coddoc',dw_cpo.GetItemString(dw_cpo.GetRow(),'coddoc'))
dw_l.SetItem(f,'clugar',dw_cpo.GetItemString(dw_cpo.GetRow(),'clugar'))
dw_l.SetItem(f,'numdoc',dw_cpo.GetItemNumber(dw_cpo.GetRow(),'numdoc'))
dw_l.SetItem(f,'item',dw_cpo.GetItemNumber(dw_cpo.GetRow(),'item'))
dw_l.SetItem(f,'banco',dw_cpo.GetItemstring(dw_cpo.GetRow(),'banco'))
dw_l.SetItem(f,'signo',1)
dw_l.ScrolltoRow(f)
cambio = TRUE

end event

type pb_9 from picturebutton within pd
event mousemove pbm_mousemove
integer x = 3237
integer y = 908
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
string disabledname = "d_borrar_fila.gif"
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
	dw_l.DeleteRow(0)
	dw_cpo.SetItem(f,'cantidad',double(dw_l.Describe("Evaluate('sum(cantidad)',0)")))
	if dw_cpo.GetItemNumber(f,'cantidad') <= 0 then
		dw_cpo.SetItem(f,'cantidad',0)
	end if
end if
dw_cpo.TriggerEvent(RowFocuschanged!)
cambio = TRUE
end event

type pb_6 from picturebutton within pd
event mousemove pbm_mousemove
integer x = 5161
integer y = 28
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
integer y = 784
integer width = 3127
integer height = 520
integer taborder = 40
string title = "none"
string dataobject = "dw_mvto_lote_mod"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event itemchanged;if AcceptText() = -1 then Return 1
if getitemnumber(row,'cantidad')=0 then
	Messagebox('Atención','Cantidad debe ser mayor 0')
	Return -1
end if
if getColumnName() = 'cantidad' then
	dw_cpo.SetItem(dw_cpo.GetRow(),'cantidad',long(describe("Evaluate('sum(cantidad)',0)")))
end if
dw_cpo.TriggerEvent(itemchanged!)

end event

event losefocus;setColumn('cantidad')
triggerEvent(itemchanged!)

end event

event dberror;Rollback;
Return 0

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
integer y = 24
integer width = 5051
integer height = 700
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

event itemchanged;if AcceptText()= -1 then Return -1 
long i
dec monto
for i = 1 to t1.pd.dw_cpo.RowCount()
	if isNull(t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')) or isNull(t1.pd.dw_cpo.GetItemNumber(i,'cantidad')) then Continue
	SetItem(i,'vtotal',  round((t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')*t1.pd.dw_cpo.GetItemNumber(i,'cantidad')*(1+getPorcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100)),i_dec_gral))
	monto = monto + round((t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')*t1.pd.dw_cpo.GetItemNumber(i,'cantidad')*(1+getPorcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100)),i_dec_gral)
next
if getColumnName() = 'cod_impu' then
	SetItem(GetRow(),'impu',getPorcentaje(GetItemString(getRow(),'cod_impu'))/100)
end if
dw_cab.SetItem(1,'valor_agregado',monto)
cambio = TRUE
groupCalc()

end event

event retrieveend;long i
for i = 1 to RowCount()	
	SetItem(i,'impu',getPorcentaje(GetItemString(i,'cod_impu'))/100)
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

type dw_c from datawindow within w_doc_ent_fianza
event borrarnuevo ( )
integer x = 73
integer y = 240
integer width = 3374
integer height = 580
integer taborder = 100
string title = "none"
string dataobject = "dw_mvto_cab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event borrarnuevo();if nuevo > 0 or cambio then
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
dw_cab.Reset()
If currentrow = 0 or rowCount() = 0 then Return
if not isNull(GetItemNumber(GetRow(),'numdoc')) then
	dw_cab.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
	t1.pd.dw_l.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
	t1.pd.dw_cpo.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
end if

end event

event rowfocuschanging;if nuevo > 0 or cambio then
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
	SetRow(row)
end if

end event

type dw_alm from datawindow within w_doc_ent_fianza
event retornar ( )
integer x = 1426
integer y = 64
integer width = 1157
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
dw_cab.Reset()
dw_c.Reset()
t1.pd.dw_cpo.Reset()
dw_c.Retrieve(dw_alm.GetItemString(1,'codalmacen'),codDocumento)
t1.pk.dw_k.Retrieve(dw_alm.GetItemString(1,'codalmacen'))

end event

type gb_1 from groupbox within w_doc_ent_fianza
integer x = 37
integer y = 176
integer width = 3456
integer height = 684
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

type dw_cab from datawindow within w_doc_ent_fianza
integer x = 3547
integer y = 224
integer width = 1993
integer height = 632
integer taborder = 110
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
	cambio = TRUE
end if

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

