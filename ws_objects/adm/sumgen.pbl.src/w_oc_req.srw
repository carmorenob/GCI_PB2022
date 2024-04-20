$PBExportHeader$w_oc_req.srw
$PBExportComments$Ventana para documentos que usan otros documentos base
forward
global type w_oc_req from window
end type
type st_6 from statictext within w_oc_req
end type
type dw_lug from datawindow within w_oc_req
end type
type pb_areq from picturebutton within w_oc_req
end type
type pb_tempo from picturebutton within w_oc_req
end type
type pb_cancelar from picturebutton within w_oc_req
end type
type pb_anular from picturebutton within w_oc_req
end type
type pb_imp from picturebutton within w_oc_req
end type
type pb_nuevo from picturebutton within w_oc_req
end type
type pb_borrar from picturebutton within w_oc_req
end type
type pb_ter from picturebutton within w_oc_req
end type
type t1 from tab within w_oc_req
end type
type pk from userobject within t1
end type
type st_2 from statictext within pk
end type
type dw_contratos from datawindow within pk
end type
type pb_reqc from picturebutton within pk
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
st_2 st_2
dw_contratos dw_contratos
pb_reqc pb_reqc
sle_1 sle_1
rb_2 rb_2
rb_1 rb_1
pb_1 pb_1
pb_7 pb_7
dw_k dw_k
end type
type pd from userobject within t1
end type
type pb_6 from picturebutton within pd
end type
type dw_cpo from datawindow within pd
end type
type pd from userobject within t1
pb_6 pb_6
dw_cpo dw_cpo
end type
type pi from userobject within t1
end type
type st_1 from statictext within pi
end type
type pb_14 from picturebutton within pi
end type
type pb_i from picturebutton within pi
end type
type dw_fr from datawindow within pi
end type
type pi from userobject within t1
st_1 st_1
pb_14 pb_14
pb_i pb_i
dw_fr dw_fr
end type
type pb from userobject within t1
end type
type st_4 from statictext within pb
end type
type dw_obra from datawindow within pb
end type
type pb_17 from picturebutton within pb
end type
type pb_16 from picturebutton within pb
end type
type mle_1 from multilineedit within pb
end type
type pb from userobject within t1
st_4 st_4
dw_obra dw_obra
pb_17 pb_17
pb_16 pb_16
mle_1 mle_1
end type
type t1 from tab within w_oc_req
pk pk
pd pd
pi pi
pb pb
end type
type dw_c from datawindow within w_oc_req
end type
type dw_alm from datawindow within w_oc_req
end type
type gb_1 from groupbox within w_oc_req
end type
type pb_grabar from picturebutton within w_oc_req
end type
type dw_cab from datawindow within w_oc_req
end type
type pb_lote from picturebutton within w_oc_req
end type
type pb_2 from picturebutton within w_oc_req
end type
end forward

global type w_oc_req from window
integer width = 5614
integer height = 2236
boolean border = false
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
st_6 st_6
dw_lug dw_lug
pb_areq pb_areq
pb_tempo pb_tempo
pb_cancelar pb_cancelar
pb_anular pb_anular
pb_imp pb_imp
pb_nuevo pb_nuevo
pb_borrar pb_borrar
pb_ter pb_ter
t1 t1
dw_c dw_c
dw_alm dw_alm
gb_1 gb_1
pb_grabar pb_grabar
dw_cab dw_cab
pb_lote pb_lote
pb_2 pb_2
end type
global w_oc_req w_oc_req

type variables
string coddocumento, codalm, impu
DataWindowChild dwc_alm, dwc_f, dwc_i, dwc_imp,dwc_almt,idw_lugart, dwc_lugar
DataWindowChild dwc_contratos 
long nuevo, i_decs, i_aprox
string ordenar[6],tipoalm
boolean cambio
int i_dec_gral,i_aprox_gral

end variables

forward prototypes
public function integer grabar_tmp ()
public function integer f_set_pac ()
end prototypes

public function integer grabar_tmp ();if dw_cab.RowCount() = 0 then Return -1

if not(dw_cab.GetItemString(1,'estado') = '0') then
	MessageBox('Atención','El documento no está activo')
	Return -1
end if

if f_num_compu('s','o') = FALSE then Return -1

t1.pd.dw_cpo.SetFilter("")
t1.pd.dw_cpo.Filter()

if t1.pd.dw_cpo.RowCount() = 0 then 
	MessageBox('Atención','No ha agregado ningun artículo al detalle del documento')
	Return -1
end if


long i, item
double numdoc
string cod_flujo
string ls_nulo
setnull(ls_nulo)

for i = 1 to t1.pd.dw_cpo.RowCount()	
	if isnull(t1.pd.dw_cpo.getitemstring(i,'cod_impu')) or t1.pd.dw_cpo.getitemstring(i,'cod_impu')='' then t1.pd.dw_cpo.setitem(i,'cod_impu',ls_nulo)
next


if nuevo > 0 then
	numdoc = f_trae_ndoc(dw_cab.GetItemString(1,'coddoc'),clugar,this.Title)
	if numdoc < 0 then Return -1
	dw_cab.SetItem(1,'numdoc',numdoc)
	dw_c.SetItem(dw_c.GetRow(),'numdoc',numdoc)
	for i = 1 to t1.pd.dw_cpo.RowCount()
		t1.pd.dw_cpo.SetItem(i,'numdoc',numdoc)
	next
	for i = 1 to t1.pi.dw_fr.RowCount()
		t1.pi.dw_fr.SetItem(i,'num_doc1',numdoc)
	next
end if

if dw_cab.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
if t1.pd.dw_cpo.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

if t1.pb.dw_obra.Update(TRUE,FALSE) = -1 then 
	Rollback;
	Return -1
end if

cod_flujo = dw_cab.GetItemString(1,'cod_flujo')
if not isNull(cod_flujo) then
	select max(item) into :item from mod_relacion_origen
	where codigo = :cod_flujo;
	if isNull(item) then item = 0
	for i = 1 to t1.pi.dw_fr.RowCount()
		if isNull(t1.pi.dw_fr.GetItemNumber(i,'item')) then
			item = item + 1
			t1.pi.dw_fr.SetItem(i,'item',item)
		end if
	next
	
	if t1.pi.dw_fr.Update(TRUE,FALSE) = -1 then 
		Rollback;
		Return -1
	end if
end if

cambio = FALSE
Return 0

end function

public function integer f_set_pac ();long i, ano, mes, pac
string alm, gen ,sql_stx, restringepac

alm = dw_cab.GetItemString(1,'codalmacen')
ano = year(date(dw_cab.GetItemDateTime(1,'fecha')))
mes = month(date(dw_cab.GetItemDateTime(1,'fecha')))
select restringepac into :restringepac from sumalmacen where codalmacen = :alm;

for i = 1 to t1.pd.dw_cpo.RowCount()	
	setnull(pac)
	t1.pd.dw_cpo.SetItem(i,'impu',getPorcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100)
	gen = t1.pd.dw_cpo.GetItemString(i,'codgenerico')
	sql_stx = "SELECT SUMPACCPO.planeado-SUMPACCPO.CONSUMO  FROM SUMPACCAB INNER JOIN SUMPACCPO ON (SUMPACCAB.ITEM = SUMPACCPO.ITEM) AND (SUMPACCAB.ANO = SUMPACCPO.ANO) AND"+&
	" (SUMPACCAB.CODALMACEN = SUMPACCPO.CODALMACEN) WHERE ((SUMPACCPO.CODALMACEN='"+alm+"') AND (SUMPACCPO.ANO="+string(ano)+") AND (SUMPACCPO.codgenerico='"+gen+"') AND (SUMPACCAB.ESTADO='A') AND (SUMPACCPO.ESTADO<>'N')) AND ((SUMPACCPO.mes)="+string(mes)+")"
	
	DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
	PREPARE SQLSA FROM :sql_stx;

	OPEN DYNAMIC my_cursor ;
	FETCH my_cursor INTO :pac ;
	CLOSE my_cursor ;
	
	if isNull(pac) then pac = 0
	t1.pd.dw_cpo.SetItem(i,'pac',pac)
	t1.pd.dw_cpo.SetItem(i,'restringepac',restringepac)
next
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

SELECT cadena into :impu
FROM parametros_gen
WHERE (((codigo_para)=69));
if sqlca.sqlnrows=0 then
	messagebox('Atencíon','No hay parametro 69')
	return 
end if

if impu='1' then
	t1.pd.dw_cpo.Modify("cod_impu.Protect=0")
else
	t1.pd.dw_cpo.Modify("cod_impu.Protect=1")
end if

if i_aprox_gral=0 then i_aprox_gral=1

codDocumento = Message.StringParm
setnull(tipoalm)
if coddocumento = 'SR' then
	Title = 'Suministros - Requisiciones'
	icon='ribon_requisiion.ico'
	t1.pi.Visible = false
	t1.pb.Visible = false
	pb_ter.Enabled = false
	dw_cab.Modify("codalmacen_target_t.Text='Almacén proveedor' tipodoc.Edit.DisplayOnly=TRUE documento.Edit.DisplayOnly=TRUE")
	dw_c.Modify("compute_1.Visible=FALSE")
	t1.pd.dw_cpo.Modify("cod_impu.Edit.DisplayOnly=TRUE compute_1.DisplayOnly=TRUE valor_unit.Edit.DisplayOnly=TRUE")
elseif coddocumento = 'OC' then
	Title = 'Suministros - Ordenes de Compra'
	icon='ribon_ocompra.ico'
	dw_cab.Modify("codalmacen_target.Visible=FALSE valor_agregado.Visible=TRUE valor_agregado.Edit.DisplayOnly=TRUE t_5.Text='Total'")
	t1.pd.Text = 'Artículos ordenados'
end if

t1.pd.dw_cpo.GetChild('cod_impu',dwc_i)
dwc_i.SetTransObject(SQLCA)
dwc_i.Retrieve(codDocumento)
dwc_i.InsertRow(1)
dwc_i.SetItem(1,'nombre','Ninguno')

t1.pb.dw_obra.GetChild('cod_impu',dwc_imp)
dwc_imp.SetTransObject(SQLCA)
dwc_imp.Retrieve(codDocumento)
dwc_imp.InsertRow(1)
dwc_imp.SetItem(1,'nombre','Ninguno')

dw_cab.GetChild('cod_flujo',dwc_f)
dwc_f.SetTransObject(SQLCA)
if dwc_f.Retrieve(codDocumento) = 0 then
	dw_cab.Modify("cod_flujo.Protect='1'")
	dwc_f.InsertRow(0)
end if

if coddocumento = 'OC'  then 
	dwc_alm.setfilter("principal='1' or principal='5'")
	dwc_alm.filter()
end if
end event

on w_oc_req.create
this.st_6=create st_6
this.dw_lug=create dw_lug
this.pb_areq=create pb_areq
this.pb_tempo=create pb_tempo
this.pb_cancelar=create pb_cancelar
this.pb_anular=create pb_anular
this.pb_imp=create pb_imp
this.pb_nuevo=create pb_nuevo
this.pb_borrar=create pb_borrar
this.pb_ter=create pb_ter
this.t1=create t1
this.dw_c=create dw_c
this.dw_alm=create dw_alm
this.gb_1=create gb_1
this.pb_grabar=create pb_grabar
this.dw_cab=create dw_cab
this.pb_lote=create pb_lote
this.pb_2=create pb_2
this.Control[]={this.st_6,&
this.dw_lug,&
this.pb_areq,&
this.pb_tempo,&
this.pb_cancelar,&
this.pb_anular,&
this.pb_imp,&
this.pb_nuevo,&
this.pb_borrar,&
this.pb_ter,&
this.t1,&
this.dw_c,&
this.dw_alm,&
this.gb_1,&
this.pb_grabar,&
this.dw_cab,&
this.pb_lote,&
this.pb_2}
end on

on w_oc_req.destroy
destroy(this.st_6)
destroy(this.dw_lug)
destroy(this.pb_areq)
destroy(this.pb_tempo)
destroy(this.pb_cancelar)
destroy(this.pb_anular)
destroy(this.pb_imp)
destroy(this.pb_nuevo)
destroy(this.pb_borrar)
destroy(this.pb_ter)
destroy(this.t1)
destroy(this.dw_c)
destroy(this.dw_alm)
destroy(this.gb_1)
destroy(this.pb_grabar)
destroy(this.dw_cab)
destroy(this.pb_lote)
destroy(this.pb_2)
end on

event closequery;if nuevo > 0 or cambio then 
	if messageBox('Aviso','El documento no ha sido guardado, perderá los cambios. Desea continuar?',QUESTION!,YESNO!) = 2 then
		return -1
	end if
end if

end event

event resize;t1.resize((newwidth - 50) , (newheight * 0.60))
t1.pk.dw_k.resize(4992,(t1.height *0.75))
t1.pd.dw_cpo.resize(5175,(t1.height *0.85))
t1.pi.dw_fr.resize(2747,(t1.height *0.75))
t1.pb.mle_1.resize(4302,(t1.height *0.30))


end event

type st_6 from statictext within w_oc_req
integer x = 1445
integer y = 20
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

type dw_lug from datawindow within w_oc_req
integer x = 32
integer y = 24
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
if coddocumento = 'OC'  then 
	dwc_alm.setfilter("principal='1' or principal='5'")
	dwc_alm.filter()
end if
end event

type pb_areq from picturebutton within w_oc_req
integer x = 5024
integer y = 32
integer width = 146
integer height = 128
integer taborder = 54
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "requisicion.gif"
string disabledname = "d_requisicion.gif"
alignment htextalign = left!
string powertiptext = "Requisicion Acumulada por Sitio"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
st_sumgen st_envia_cpo
if dw_cab.GetItemString(dw_cab.Getrow(),'estado') = '0' then
	st_envia_cpo.dw_cp=t1.pd.dw_cpo
	st_envia_cpo.dw_cb=dw_c
	st_envia_cpo.codalmacen=dw_alm.GetItemString(dw_alm.getrow(),'codalmacen')
	openwithparm(w_sum_requi_acumula,st_envia_cpo)
	t1.SelectTab(t1.pd)
end if

end event

type pb_tempo from picturebutton within w_oc_req
event mousemove pbm_mousemove
string tag = "Grabar Temporal"
integer x = 4265
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
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Grabar Temporal"
end type

event clicked;if grabar_tmp() = 0 then
	commit;
	dw_cab.ResetUpdate()
	t1.pd.dw_cpo.ResetUpdate()
	t1.pb.dw_obra.ResetUpdate()
	t1.pi.dw_fr.ResetUpdate()
	nuevo = 0
	Return 0
end if

end event

type pb_cancelar from picturebutton within w_oc_req
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 3808
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

type pb_anular from picturebutton within w_oc_req
event mousemove pbm_mousemove
string tag = "Anular Documento"
integer x = 4110
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

event clicked;if dw_cab.RowCount() = 0 then Return
string cd,cl, endestino,ls_estado
double nd
cd = dw_cab.GetItemString(dw_cab.GetRow(),'coddoc')
cl = dw_cab.GetItemString(dw_cab.GetRow(),'clugar')
nd = dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')
select en_destino,estado into :endestino, :ls_estado from sum_mvto_cab
where coddoc=:cd and clugar=:cl and numdoc=:nd;
if endestino = '1' then
	MessageBox('Atención','La orden de compra se ha utilizado como insumo de otro documento. No se puede anular')
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

if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') = '2' then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') = '1' or dw_cab.GetItemString(dw_cab.GetRow(),'Estado') = '3' then
	t1.pd.dw_cpo.SetFilter("")
	t1.pd.dw_cpo.Filter()
	long f
	f=t1.pd.dw_cpo.Find("atendido > 0",1,t1.pd.dw_cpo.RowCount())
	if f = 0 then
		if messageBox('Aviso','El documento ya ha sido cerrado pero No se han recibido articulos. Desea Anularlo?',Exclamation!,YesNo!) = 2 then Return
	else
		messageBox('Aviso','Se han recibido articulos para esta orden. No puede modificarse')
		Return -1
	end if
end if

if nuevo > 0 then
	pb_borrar.triggerEvent(clicked!)
	Return 0
end if
If messageBox('Aviso','Se Anulará el documento. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return
st_xa_anular st_anula
st_anula.tipo='SM'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return -1
if f_anula_interfaz(dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo'),t1.pi.dw_fr) = -1 then
	Rollback;
	Return -1
end if
dw_cab.SetItem(dw_cab.GetRow(),'Estado','2')
dw_cab.SetItem(dw_cab.GetRow(),'anulado',usuario)
dw_cab.SetItem(dw_cab.GetRow(),'fechaanula',datetime(today(),now()))
dw_cab.SetItem(dw_cab.GetRow(),'motivo_anula',st_anula.observacion)
dw_cab.SetItem(dw_cab.GetRow(),'cod_anula',st_anula.motivo)
if dw_cab.Update() = 1 then
	commit;
else
	rollback;
	Return -1
end if
dw_c.SetItem(dw_c.GetRow(),'Estado','2')

Return 0

end event

type pb_imp from picturebutton within w_oc_req
event mousemove pbm_mousemove
string tag = "Imprimir Reporte"
integer x = 3959
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

f_reporte(dw_cab.GetItemString(1,'coddoc'),Title,param)

end event

type pb_nuevo from picturebutton within w_oc_req
event mousemove pbm_mousemove
string tag = "Nuevo documento"
integer x = 4562
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
t1.pd.dw_cpo.Reset()
t1.pi.dw_fr.Reset()
t1.pb.dw_obra.Reset()
dw_c.ScrolltoRow(dw_c.InsertRow(1))
dw_c.SetItem(1,'coddoc',codDocumento)
dw_c.SetItem(1,'clugar',clugar)
dw_c.SetItem(1,'fecha',today())
dw_c.SetItem(1,'estado','0')

dw_cab.InsertRow(1)
dw_cab.SetItem(1,'coddoc',codDocumento)
dw_cab.SetItem(1,'clugar',clugar)
dw_cab.SetItem(1,'lg_target',clugar)
dw_cab.SetItem(1,'codalmacen',dw_alm.GetItemString(1,'codalmacen'))
dw_cab.SetItem(1,'fecha',today())
dw_cab.SetItem(1,'estado','0')
dw_cab.setitem(1,'usuario',usuario)
dwc_almt.setfilter("codlugar='"+clugar+"'")
dwc_almt.filter()
if dwc_almt.rowcount()= 0 then
	dwc_almt.setitem(1,'codalmacen','')
	messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
	return 1
end if
nuevo = 1




end event

type pb_borrar from picturebutton within w_oc_req
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 4713
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

type pb_ter from picturebutton within w_oc_req
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 4864
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

type t1 from tab within w_oc_req
integer x = 37
integer y = 860
integer width = 5477
integer height = 1288
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
pi pi
pb pb
end type

on t1.create
this.pk=create pk
this.pd=create pd
this.pi=create pi
this.pb=create pb
this.Control[]={this.pk,&
this.pd,&
this.pi,&
this.pb}
end on

on t1.destroy
destroy(this.pk)
destroy(this.pd)
destroy(this.pi)
destroy(this.pb)
end on

type pk from userobject within t1
integer x = 18
integer y = 112
integer width = 5440
integer height = 1160
long backcolor = 67108864
string text = "Artículos"
long tabtextcolor = 33554432
string picturename = "lista.ico"
long picturemaskcolor = 536870912
st_2 st_2
dw_contratos dw_contratos
pb_reqc pb_reqc
sle_1 sle_1
rb_2 rb_2
rb_1 rb_1
pb_1 pb_1
pb_7 pb_7
dw_k dw_k
end type

on pk.create
this.st_2=create st_2
this.dw_contratos=create dw_contratos
this.pb_reqc=create pb_reqc
this.sle_1=create sle_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.pb_1=create pb_1
this.pb_7=create pb_7
this.dw_k=create dw_k
this.Control[]={this.st_2,&
this.dw_contratos,&
this.pb_reqc,&
this.sle_1,&
this.rb_2,&
this.rb_1,&
this.pb_1,&
this.pb_7,&
this.dw_k}
end on

on pk.destroy
destroy(this.st_2)
destroy(this.dw_contratos)
destroy(this.pb_reqc)
destroy(this.sle_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.pb_1)
destroy(this.pb_7)
destroy(this.dw_k)
end on

type st_2 from statictext within pk
integer x = 2597
integer y = 32
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
string text = "Contratos Vigente"
boolean focusrectangle = false
end type

type dw_contratos from datawindow within pk
boolean visible = false
integer x = 3013
integer y = 24
integer width = 1358
integer height = 72
integer taborder = 120
string title = "none"
string dataobject = "dw_lista_contrato_articulo"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
getchild('unico',dwc_contratos)
dwc_contratos.settransobject(sqlca)
insertrow(1)
end event

event itemchanged;string td,doc
long fila
fila=dwc_contratos.getrow()
td = dw_cab.GetItemString(dw_cab.GetRow(),'tipodoc')
doc=dw_cab.GetItemString(dw_cab.GetRow(),'documento')
t1.pk.dw_k.Retrieve(td,doc,dwc_contratos.getitemnumber(fila,'ano'),dwc_contratos.getitemnumber(fila,'ncontrato'),dwc_contratos.getitemnumber(fila,'otrosi'))			
end event

event retrieveend;string td,doc
long fila
fila=dwc_contratos.getrow()
td = dw_cab.GetItemString(dw_cab.GetRow(),'tipodoc')
doc=dw_cab.GetItemString(dw_cab.GetRow(),'documento')
t1.pk.dw_k.Retrieve(td,doc,dwc_contratos.getitemnumber(fila,'ano'),dwc_contratos.getitemnumber(fila,'ncontrato'),dwc_contratos.getitemnumber(fila,'otrosi'))			
end event

type pb_reqc from picturebutton within pk
integer x = 5097
integer y = 408
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "requisicion.gif"
string disabledname = "d_requisicion.gif"
alignment htextalign = left!
string powertiptext = "Trae requisión desde Entregas"
end type

event clicked;pb_7.enabled=false
pb_1.enabled=false
st_lote str
str.codalmacen=dw_alm.GetItemString(1,'codalmacen')
str.dw_cpo=t1.pd.dw_cpo
str.coddoc=codDocumento
str.clugar=clugar
str.numdoc=dw_cab.GetItemNumber(dw_cab.GetRow(),'numdoc')
if dw_cab.GetItemstring(dw_cab.GetRow(),'estado')<>'0' then
	messagebox('Atención','Cree documento')
	return
end if
openwithparm(w_requ_entregas,str)
if message.stringparm='Si' then 
	pb_grabar.triggerevent(clicked!)
end if


end event

type sle_1 from singlelineedit within pk
event keypressed pbm_keyup
integer x = 923
integer y = 24
integer width = 1426
integer height = 80
integer taborder = 70
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
	dw_k.SetFilter("upper(codarticulo) like '" +upper( texto )+ "'")
else
	dw_k.SetFilter("upper(descripcion) like '" + upper(texto )+ "'")
end if
dw_k.Filter()

end event

type rb_2 from radiobutton within pk
integer x = 425
integer y = 28
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
integer y = 28
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
integer x = 5093
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

event clicked;if t1.pk.dw_k.DataObject = 'dw_articuloselec_oc_contra' then
else
	dw_k.Retrieve(dw_cab.GetItemString(1,'codalmacen_target'))
end if

end event

type pb_7 from picturebutton within pk
event mousemove pbm_mousemove
integer x = 5093
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
string powertiptext = "Llevar al detalle"
end type

event clicked;int i
long fila, f
string codigo, descripcion, presentacion, valor, lote, fecha_venc
if dw_cab.RowCount() <= 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') <> '0' then
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
	descripcion = dw_k.getitemstring(i,'descripcion')
	if isnull(descripcion) then Continue
	
	codigo = dw_k.getitemstring(i,'codarticulo')

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
		t1.pd.dw_cpo.SetItem(fila, 'Estado','0')
		t1.pd.dw_cpo.SetItem(fila, 'item',long(valor) + 1)
		t1.pd.dw_cpo.SetItem(fila, 'iva',dw_k.GetItemString(i,'iva'))
		t1.pd.dw_cpo.SetItem(fila, 'cum',dw_k.GetItemString(i,'cum'))
		t1.pd.dw_cpo.SetItem(fila, 'invima',dw_k.GetItemString(i,'invima'))
		if coddocumento = 'OC' then 
			if t1.pk.dw_k.DataObject = 'dw_articuloselec_oc_contra' then
				t1.pd.dw_cpo.SetItem(fila, 'cod_impu',dw_k.GetItemString(i,'cod_impu'))
			else
				t1.pd.dw_cpo.SetItem(fila, 'cod_impu',dw_k.GetItemString(i,'iva'))
				t1.pd.dw_cpo.SetItem(fila,'impu',getPorcentaje(dw_k.GetItemString(i,'iva'))/100)
				t1.pd.dw_cpo.SetItem(fila,'impu',getPorcentaje(dw_k.GetItemString(i,'iva'))/100)
			end if
			if dw_k.GetItemnumber(i,'costoprom')<>0 then 
				t1.pd.dw_cpo.SetItem(fila,'valor_unit',dw_k.GetItemnumber(i,'costoprom'))			
			end if
		end if
	end if
	t1.pd.dw_cpo.ScrolltoRow(fila)
	dw_k.SetItem(i,'selec',0)
Next

f_set_pac()

if dw_k.describe("selec_t.Text") = 'Desel.' then
	dw_k.Modify("selec_t.Text='Selec.'")
end if

t1.pd.dw_cpo.TriggerEvent(RowFocusChanged!)
t1.SelectTab(t1.pd)

end event

type dw_k from datawindow within pk
integer x = 32
integer y = 140
integer width = 4992
integer height = 984
integer taborder = 40
string dataobject = "dw_articuloselec"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

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
integer width = 5440
integer height = 1160
long backcolor = 67108864
string text = "Detalle"
long tabtextcolor = 33554432
string picturename = "detalle.ico"
long picturemaskcolor = 536870912
pb_6 pb_6
dw_cpo dw_cpo
end type

on pd.create
this.pb_6=create pb_6
this.dw_cpo=create dw_cpo
this.Control[]={this.pb_6,&
this.dw_cpo}
end on

on pd.destroy
destroy(this.pb_6)
destroy(this.dw_cpo)
end on

type pb_6 from picturebutton within pd
event mousemove pbm_mousemove
integer x = 5239
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

dw_cpo.DeleteRow(dw_cpo.GetRow())
dw_cpo.TriggerEvent(RowFocuschanged!)
dw_cpo.TriggerEvent(itemchanged!)
cambio = TRUE
end event

type dw_cpo from datawindow within pd
integer x = 32
integer y = 32
integer width = 5175
integer height = 1088
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

event itemchanged;decimal monto = 0
long i

acceptText()
SetRedraw(FALSE)
if coddocumento = 'OC' then
	for i = 1 to t1.pd.dw_cpo.RowCount()
		if isNull(t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')) or isNull(t1.pd.dw_cpo.GetItemNumber(i,'cantidad')) then Continue
		SetItem(i,'vtotal',  round((t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')*t1.pd.dw_cpo.GetItemNumber(i,'cantidad')*(1+getPorcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100)),i_dec_gral))
		monto = monto + redondeo((t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')*t1.pd.dw_cpo.GetItemNumber(i,'cantidad')*(1+getPorcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100)),i_decs,i_aprox)		
	next
	if getColumnName() = 'cod_impu' then
		SetItem(GetRow(),'impu',getPorcentaje(GetItemString(getRow(),'cod_impu'))/100)
	end if
end if
dw_cab.SetItem(1,'valor_agregado',monto)
cambio = TRUE

SetRedraw(TRUE)
Return 0

end event

event losefocus;AcceptText()

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

event retrieveend;f_set_pac()

end event

event dberror;Rollback;
Return 0

end event

type pi from userobject within t1
integer x = 18
integer y = 112
integer width = 5440
integer height = 1160
long backcolor = 67108864
string text = "Interfaz"
long tabtextcolor = 33554432
string picturename = "mejoramiento.ico"
long picturemaskcolor = 536870912
st_1 st_1
pb_14 pb_14
pb_i pb_i
dw_fr dw_fr
end type

on pi.create
this.st_1=create st_1
this.pb_14=create pb_14
this.pb_i=create pb_i
this.dw_fr=create dw_fr
this.Control[]={this.st_1,&
this.pb_14,&
this.pb_i,&
this.dw_fr}
end on

on pi.destroy
destroy(this.st_1)
destroy(this.pb_14)
destroy(this.pb_i)
destroy(this.dw_fr)
end on

type st_1 from statictext within pi
integer x = 41
integer y = 32
integer width = 1783
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

type pb_14 from picturebutton within pi
event mousemove pbm_mousemove
string tag = "Borrar Rubro"
integer x = 2921
integer y = 232
integer width = 146
integer height = 128
integer taborder = 33
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
	messagebox('Error','La Orden de Compra ya ha sido cerrada')
	Return
end if

if dw_fr.RowCount() = 0 then Return

dw_fr.DeleteRow(dw_fr.GetRow())
cambio = TRUE

end event

type pb_i from picturebutton within pi
event mousemove pbm_mousemove
integer x = 2921
integer y = 100
integer width = 146
integer height = 128
integer taborder = 44
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "buscar2.gif"
string disabledname = "d_buscar2.gif"
string powertiptext = "Traer Info de interfaz"
end type

event clicked;If dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(dw_cab.GetRow(),'Estado') <> '0' then
	messageBox('Aviso','El documento ya ha sido cerrado. No puede modificarse')
	Return
end if

string valor
long fila
st_interfaz st_parm

Choose Case dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo')
	case 'OCPDISCT', 'OCPDIPR'
		st_parm.coddoc = 'PDI'
		st_parm.dw_obj = dw_fr
		st_parm.dw_cab = dw_cab
		st_parm.filtro = "%OC"
		st_parm.codmod = dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo')
		openwithparm(w_choosedisp, st_parm)
		if dw_fr.GetNextModified(0,Primary!) > 0 then
			cambio = TRUE
		end if
	case 'OCPRSCT'
		st_parm.coddoc = 'PR'
		st_parm.dw_obj = dw_fr
		st_parm.dw_cab = dw_cab
		st_parm.filtro = "%OC"
		st_parm.codmod = dw_cab.GetItemString(dw_cab.GetRow(),'cod_flujo')
		openwithparm(w_choosedisp, st_parm)
		if dw_fr.GetNextModified(0,Primary!) > 0 then
			cambio = TRUE
		end if
end choose

end event

type dw_fr from datawindow within pi
integer x = 41
integer y = 100
integer width = 2747
integer height = 1028
integer taborder = 80
string title = "none"
string dataobject = "dw_flujo_2s1n"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event dberror;Rollback;
Return 0

end event

type pb from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5440
integer height = 1160
long backcolor = 67108864
string text = "Mano de Obra"
long tabtextcolor = 33554432
string picturename = "medico.ico"
long picturemaskcolor = 536870912
st_4 st_4
dw_obra dw_obra
pb_17 pb_17
pb_16 pb_16
mle_1 mle_1
end type

on pb.create
this.st_4=create st_4
this.dw_obra=create dw_obra
this.pb_17=create pb_17
this.pb_16=create pb_16
this.mle_1=create mle_1
this.Control[]={this.st_4,&
this.dw_obra,&
this.pb_17,&
this.pb_16,&
this.mle_1}
end on

on pb.destroy
destroy(this.st_4)
destroy(this.dw_obra)
destroy(this.pb_17)
destroy(this.pb_16)
destroy(this.mle_1)
end on

type st_4 from statictext within pb
integer x = 27
integer y = 704
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
string text = "Descripción"
boolean focusrectangle = false
end type

type dw_obra from datawindow within pb
integer x = 32
integer y = 32
integer width = 3927
integer height = 652
integer taborder = 10
string title = "none"
string dataobject = "dw_orden_obra"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event itemchanged;if GetColumnName() = 'cod_impu' then
	SetItem(GetRow(),'porcentaje',dwc_imp.GetItemNumber(dwc_imp.GetRow(),'porcentaje'))
end if
if GetColumnName() = 'satisfaccion' then
	string nulo
	setNull(nulo)
	if data = '1' then SetItem(GetRow(),'fecha_satisfaccion',today())
	if data = '0' then SetItem(GetRow(),'fecha_satisfaccion',nulo)
end if
if not isNull(GetItemNumber(GetRow(),'monto')) and not isNull(GetItemNumber(GetRow(),'porcentaje')) then
	SetItem(Getrow(),'iva',(GetItemNumber(GetRow(),'monto')*GetItemNumber(GetRow(),'porcentaje'))/100 )
else
	SetItem(Getrow(),'iva',0)
end if
cambio = TRUE

end event

event rowfocuschanged;mle_1.Text = ''
if RowCount() = 0 or currentrow = 0 then Return
mle_1.Text = GetItemString(GetRow(),'des_obra')

end event

event dberror;Rollback;
Return 0

end event

type pb_17 from picturebutton within pb
event mousemove pbm_mousemove
string tag = "Borrar Registro"
integer x = 4169
integer y = 168
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
string powertiptext = "Borrar Rubro"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
if dw_cab.GetItemString(1,'estado') <> '0' then
	messagebox('Error','El documento ya ha sido cerrado')
	Return
end if

if dw_obra.RowCount() = 0 then Return
dw_obra.DeleteRow(dw_obra.GetRow())

end event

type pb_16 from picturebutton within pb
event mousemove pbm_mousemove
integer x = 4169
integer y = 40
integer width = 146
integer height = 128
integer taborder = 10
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
if dw_cab.GetItemString(1,'Estado') <> '0' then
	messageBox('Aviso','El documento ya ha sido cerrado. No puede modificarse')
	Return
end if

valor = dw_obra.Describe("Evaluate('max(item)',0)")
fila = dw_obra.InsertRow(0)
dw_obra.SetItem(fila,'coddoc',dw_cab.GetItemString(1,'coddoc'))
dw_obra.SetItem(fila,'clugar',dw_cab.GetItemString(1,'clugar'))
dw_obra.SetItem(fila,'numdoc',dw_cab.GetItemNumber(1,'numdoc'))
dw_obra.SetItem(fila,'item',long(valor) + 1)
dw_obra.ScrolltoRow(fila)
cambio = TRUE

end event

type mle_1 from multilineedit within pb
integer x = 27
integer y = 776
integer width = 4302
integer height = 332
integer taborder = 43
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

type dw_c from datawindow within w_oc_req
event borrarnuevo ( )
integer x = 69
integer y = 244
integer width = 3351
integer height = 536
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

event rowfocuschanged;t1.pi.st_1.Text = ''
dw_cab.Reset()
t1.pd.dw_cpo.Reset()
t1.pi.dw_fr.Reset()
t1.pb.dw_obra.Reset()
If currentrow = 0 or rowCount() = 0 then Return
if not isNull(GetItemNumber(GetRow(),'numdoc')) then
	dw_cab.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
	t1.pd.dw_cpo.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
	t1.pi.dw_fr.Retrieve(GetItemString(GetRow(),'cod_flujo'),GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
	t1.pb.dw_obra.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))

	if dw_cab.GetItemString(dw_cab.GetRow(),'estado')='0' then 
		string td,doc
		long ctos
		td = dw_cab.GetItemString(dw_cab.GetRow(),'tipodoc')
		doc=dw_cab.GetItemString(dw_cab.GetRow(),'documento')
		SELECT Count(contra_articulo.codarticulo) into :ctos
		FROM contra INNER JOIN contra_articulo ON (contra.otrosi = contra_articulo.otrosi) AND (contra.ncontrato = contra_articulo.ncontrato) AND (contra.ano = contra_articulo.ano)
		WHERE (((contra.tipodoc)=:td) AND ((contra.documento)=:doc) AND ((contra.estado)='1'));
		if ctos>0 then
			t1.pk.dw_contratos.visible=true
			t1.pk.st_2.visible=true
			t1.pk.dw_k.DataObject = 'dw_articuloselec_oc_contra'
			t1.pk.dw_k.setTransObject(SQLCA)
			t1.pk.dw_contratos.retrieve(td,doc)
			//t1.pd.dw_cpo.Modify("valor_unit.protect='0~t1' cod_impu.protect='0~t1' ")
			t1.pd.dw_cpo.Modify("valor_unit.protect='0~t1'")
		else
			t1.pk.dw_contratos.visible=false
			t1.pk.st_2.visible=false		
			t1.pk.dw_k.DataObject = 'dw_articuloselec_oc'
			t1.pk.dw_k.setTransObject(SQLCA)
			//t1.pd.dw_cpo.Modify("valor_unit.protect='0~t0' cod_impu.protect='0~t0' ")
			t1.pd.dw_cpo.Modify("valor_unit.protect='0~t0'")
			t1.pk.dw_k.Retrieve()			
		end if
	else
		t1.pk.dw_contratos.visible=false
		t1.pk.st_2.visible=false		
		t1.pk.dw_k.DataObject = 'dw_articuloselec_oc'
		t1.pk.dw_k.setTransObject(SQLCA)
		//t1.pd.dw_cpo.Modify("valor_unit.protect='0~t0' cod_impu.protect='0~t0' ")
		t1.pd.dw_cpo.Modify("valor_unit.protect='0~t0'")
		t1.pk.dw_k.Retrieve()
	end if		
	
	
end if

end event

event rowfocuschanging;if nuevo > 0 then
	if MessageBox('Atención','El documento no ha sido guardado, desea continuar?',QUESTION!,YESNO!,2) = 2 then Return -1
	postEvent('borrarnuevo')
	Return -1
elseif cambio then
	if messageBox('Aviso','Ha hecho modificaciones que no han sido guardadas. Desea continuar?',QUESTION!,YESNO!) = 2 then
		Return -1
	end if
	cambio = FALSE
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

event clicked;if row < 1 then Return
if GetRow() <> row then
	SetRow(row)
end if
if dwc_alm.GetItemString(dwc_alm.getrow(),'principal')='3' and dw_c.getitemstring(dw_c.getrow(),'estado')='0'  then
	pb_areq.enabled=true
else
	pb_areq.enabled=false
end if

end event

type dw_alm from datawindow within w_oc_req
event retornar ( )
integer x = 1440
integer y = 84
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

event itemchanged;if dwc_alm.GetItemString(dwc_alm.getrow(),'principal')='3' then
	pb_areq.enabled=true
else
	pb_areq.enabled=false
end if
if dwc_alm.GetItemString(dwc_alm.getrow(),'principal')='4' /*or dwc_alm.GetItemString(dwc_alm.getrow(),'principal')='0'*/ then
	t1.pk.pb_reqc.enabled=true
	t1.pk.pb_7.enabled=false
	t1.pk.pb_1.enabled=false
else
	t1.pk.pb_reqc.enabled=false
	t1.pk.pb_7.enabled=true
	t1.pk.pb_1.enabled=true
end if
if nuevo > 0 then 
	if messageBox('Aviso','El documento nuevo no ha sido guardado, perderá los cambios. Desea continuar?',QUESTION!,YESNO!) = 2 then
		codalm = this.GetItemString(1,'codalmacen')
		this.PostEvent("retornar")
		return -1
	end if
	nuevo = 0
	cambio = FALSE
elseif cambio then
	if messageBox('Aviso','Ha hecho modificaciones que no han sido guardadas. Desea continuar?',QUESTION!,YESNO!) = 2 then
		codalm = this.GetItemString(1,'descripcion')
		this.PostEvent("retornar")
		Return -1
	end if
	cambio = FALSE
end if
AcceptText()
dw_c.Reset()
dw_cab.Reset()
t1.pd.dw_cpo.Reset()
dw_c.Retrieve(dw_alm.GetItemString(1,'codalmacen'),codDocumento)
if codDocumento='OC' then 
//	string td,doc
//	long ctos
//	if dw_cab.GetItemString(dw_cab.GetRow(),'estado')='0' then 
//		td = dw_cab.GetItemString(dw_cab.GetRow(),'tipodoc')
//		doc=dw_cab.GetItemString(dw_cab.GetRow(),'documento')
//		SELECT Count(contra_articulo.codarticulo) into :ctos
//		FROM contra INNER JOIN contra_articulo ON (contra.otrosi = contra_articulo.otrosi) AND (contra.ncontrato = contra_articulo.ncontrato) AND (contra.ano = contra_articulo.ano)
//		WHERE (((contra.tipodoc)=:td) AND ((contra.documento)=:doc) AND ((contra.estado)='1'));
//		if ctos>0 then
//			t1.pk.dw_contratos.visible=true
//			t1.pk.st_2.visible=true
//			t1.pk.dw_k.DataObject = 'dw_articuloselec_oc_contra'
//			t1.pk.dw_k.setTransObject(SQLCA)
//			t1.pk.dw_contratos.retrieve(td,doc)
//		end if
//	else
//		t1.pk.dw_contratos.visible=false
//		t1.pk.st_2.visible=false		
//		t1.pk.dw_k.DataObject = 'dw_articuloselec_oc'
//		t1.pk.dw_k.setTransObject(SQLCA)
//		t1.pk.dw_k.Retrieve()
//	end if	
else
	t1.pk.dw_k.DataObject = 'dw_articuloselec'
	t1.pk.dw_k.setTransObject(SQLCA)
	t1.pk.dw_k.Retrieve(dw_alm.GetItemString(1,'codalmacen'))
end if
end event

type gb_1 from groupbox within w_oc_req
integer x = 27
integer y = 176
integer width = 3438
integer height = 664
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

type pb_grabar from picturebutton within w_oc_req
event mousemove pbm_mousemove
integer x = 4411
integer y = 32
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

event clicked;if dwc_alm.GetItemString(dwc_alm.getrow(),'principal')<>'4' then
	If messageBox('Aviso','Se grabará definitivamente, no podrá realizar cambios. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return 0
end if
if grabar_tmp() = -1 then Return -1
long i,nd
decimal monto = 0
string cd,cl,msg

if coddocumento = 'OC' then
	if isNull(dw_cab.GetItemString(1,'documento')) then
		Rollback;
		MessageBox('Aviso','Debe seleccionar un tercero')
		Return -1
	end if
	for i = 1 to t1.pd.dw_cpo.RowCount()
		if isNull(t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')) or t1.pd.dw_cpo.GetItemNumber(i,'valor_unit') <= 0 then
			Rollback;
			Messagebox('Atención','El valor de los articulos debe ser mayor de cero')
			Return -1
		end if
		if isNull(t1.pd.dw_cpo.GetItemNumber(i,'cantidad')) or t1.pd.dw_cpo.GetItemNumber(i,'cantidad') <= 0 then
			Rollback;
			Messagebox('Atención','La cantidad de articulos debe ser mayor de cero')
			Return -1
		end if
		monto = monto + round((t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')*t1.pd.dw_cpo.GetItemNumber(i,'cantidad')*(1+getPorcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100)),i_dec_gral)
	next
end if

if coddocumento = 'SR' then
	if isNull(dw_cab.GetItemString(1,'codalmacen_target')) then
		Rollback;
		MessageBox('Aviso','Debe seleccionar el almacen requerido')
		Return -1
	end if
	for i = 1 to t1.pd.dw_cpo.RowCount()
		if t1.pd.dw_cpo.GetItemNumber(i,'cantidad') > t1.pd.dw_cpo.GetItemNumber(i,'pac') and t1.pd.dw_cpo.GetItemString(i,'restringepac') = '1' then
			Rollback;
			Messagebox('Atención','La cantidad sobrepasa el PAC mensual en artículo '+t1.pd.dw_cpo.GetItemString(i,'codarticulo'))
			Return -1
		end if
	next
end if

//dw_cab.SetItem(1,'estado','1')
//dw_cab.SetItem(1,'valor_agregado',monto)

if coddocumento = 'OC' then
	if f_upd_interfaz(dw_cab.GetItemString(1,'cod_flujo'),t1.pi.dw_fr) = -1 then
		Rollback;
		Return -1
	end if
end if

//if dw_cab.Update() = -1 then
//	dw_cab.SetItem(1,'estado','0')
//	Rollback;
//	Return -1
//end if
cd = dw_cab.GetItemString(1,'coddoc')
cl = dw_cab.GetItemString(1,'clugar')
nd = dw_cab.GetItemNumber(1,'numdoc')
update sum_mvto_cab set estado='1'
where coddoc=:cd and clugar=:cl and numdoc=:nd;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("SQL error", msg)
	Return -1
END IF

dw_c.SetItem(dw_c.GetRow(),'estado','1')
dw_cab.SetItem(dw_c.GetRow(),'estado','1')
commit;
dw_cab.ResetUpdate()
t1.pd.dw_cpo.ResetUpdate()
t1.pb.dw_obra.ResetUpdate()
t1.pi.dw_fr.ResetUpdate()

t1.pk.pb_7.enabled=true
t1.pk.pb_1.enabled=true

nuevo = 0
Return 0

end event

type dw_cab from datawindow within w_oc_req
integer x = 3502
integer y = 196
integer width = 2021
integer height = 636
integer taborder = 110
string title = "none"
string dataobject = "dw_mvto_cab_ff"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;SetTransObject(SQLCA)
getchild('lg_target',idw_lugart)
idw_lugart.settransobject(sqlca)
idw_lugart.retrieve()
getchild('codalmacen_target',dwc_almt)
dwc_almt.settransobject(sqlca)


end event

event itemchanged;string n1,n2,a1,a2,rs,td,doc
string ls_clugar
long ctos,ld_año

if getColumnName() = 'lg_target' then
	ls_clugar=data
	dwc_almt.setfilter("codlugar='"+ls_clugar+"'")
	dwc_almt.filter()
	if dwc_almt.rowcount()= 0 then
		dwc_almt.setitem(row,'codalmacen','')
		messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
		return 1
	end if
	SetNull(doc)
	SetText(doc)	
	SetItem(1,'codalmacen_target',doc)
end if

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
	
	if codDocumento='OC' then 
		ld_año=year(today())
		SELECT Count(contra_articulo.codarticulo) into :ctos
		FROM contra INNER JOIN contra_articulo ON (contra.otrosi = contra_articulo.otrosi) AND (contra.ncontrato = contra_articulo.ncontrato) AND (contra.ano = contra_articulo.ano)
		WHERE 
			(((contra.tipodoc)=:td) AND ((contra.documento)=:doc) AND ((contra.estado)='1')
			AND ((contra.ano)=:ld_año));
		if ctos>0 then
			t1.pk.dw_contratos.enabled=true
			t1.pk.dw_k.DataObject = 'dw_articuloselec_oc_contra'
			t1.pk.dw_k.setTransObject(SQLCA)
			t1.pk.dw_k.retrieve(td,doc,ld_año)
		else
			t1.pk.dw_contratos.enabled=false
			t1.pk.dw_k.DataObject = 'dw_articuloselec_oc'
			t1.pk.dw_k.setTransObject(SQLCA)
			t1.pk.dw_k.Retrieve()
		end if
	end if	
	cambio = TRUE
elseif getColumnName() = 'cod_flujo' then	
	long fila
	string desdoc, cod_orig
	if t1.pi.dw_fr.RowCount() > 0 then
		if MessageBox('Aviso','Se borrarán los documentos que se seleccionaron como origen. Desea continuar?',QUESTION!,YESNO!) = 2 then 
			SetItem(1,'cod_flujo',GetItemString(1,'cod_flujo'))
			SetText(GetItemString(1,'cod_flujo'))
			Return 1
		end if
		do while t1.pi.dw_fr.RowCount() > 0
			t1.pi.dw_fr.DeleteRow(1)
		loop
	end if
	fila = dwc_f.Find("codigo='"+data+"'",1,dwc_f.RowCount())
	if fila > 0 then
		cod_orig = dwc_f.GetItemString(fila,'cod_orig')
		select desdoc into :desdoc from documentos_gral
		where coddoc = :cod_orig;
		t1.pi.st_1.Text = desdoc
	end if
	cambio = TRUE
elseif getColumnName() = 'codalmacen_target' then
	if dw_alm.GetItemString(1,'codalmacen') = data then
		MessageBox('Aviso','El almacén origen y destino del documento no pueden ser el mismo') 
		SetNull(doc)
		SetText(doc)
		SetItem(1,'codalmacen_target',doc)
		Return 1
	end if
	t1.pk.dw_k.Retrieve(data)
	cambio = TRUE
elseif getColumnName() = 'fecha' then
	acceptText()
	t1.pd.dw_cpo.TriggerEvent(RetrieveEnd!)
end if

end event

event dberror;Rollback;
Return 0

end event

event retrieveend;long fila
string cod_orig,desdoc

fila = dwc_f.Find("codigo='"+GetItemString(GetRow(),'cod_flujo')+"'",1,dwc_f.RowCount())
if fila > 0 then
	cod_orig = dwc_f.GetItemString(fila,'cod_orig')
	select desdoc into :desdoc from documentos_gral
	where coddoc = :cod_orig;
	t1.pi.st_1.Text = desdoc
end if

end event

type pb_lote from picturebutton within w_oc_req
event mousemove pbm_mousemove
string tag = "Asignar Lotes (Vencimiento)"
boolean visible = false
integer x = 3502
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

type pb_2 from picturebutton within w_oc_req
event mousemove pbm_mousemove
integer x = 3657
integer y = 32
integer width = 146
integer height = 128
integer taborder = 54
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
st_p.dw_ppto=t1.pk.dw_k
st_p.codalmacen = dw_cab.GetItemString(dw_cab.Getrow(),'codalmacen')
st_p.coddoc = 'SPT'
if dw_cab.GetItemString(dw_cab.Getrow(),'estado') = '0' then
	openWithParm(w_sum_plant,st_p)
end if
t1.SelectTab(t1.pd)
end event

