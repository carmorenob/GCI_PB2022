$PBExportHeader$w_sum_ent.srw
$PBExportComments$Ventana para documentos que usan otros documentos base
forward
global type w_sum_ent from window
end type
type st_6 from statictext within w_sum_ent
end type
type dw_lug from datawindow within w_sum_ent
end type
type tab_1 from tab within w_sum_ent
end type
type tdoc from userobject within tab_1
end type
type dw_cab from datawindow within tdoc
end type
type tdoc from userobject within tab_1
dw_cab dw_cab
end type
type tnotas from userobject within tab_1
end type
type sle_1 from singlelineedit within tnotas
end type
type tnotas from userobject within tab_1
sle_1 sle_1
end type
type tab_1 from tab within w_sum_ent
tdoc tdoc
tnotas tnotas
end type
type pb_11 from picturebutton within w_sum_ent
end type
type pb_grabartmp from picturebutton within w_sum_ent
end type
type pb_cancelar from picturebutton within w_sum_ent
end type
type pb_anular from picturebutton within w_sum_ent
end type
type pb_grabardef from picturebutton within w_sum_ent
end type
type pb_3 from picturebutton within w_sum_ent
end type
type pb_lote from picturebutton within w_sum_ent
end type
type pb_nuevo from picturebutton within w_sum_ent
end type
type pb_2 from picturebutton within w_sum_ent
end type
type pb_4 from picturebutton within w_sum_ent
end type
type t1 from tab within w_sum_ent
end type
type pp from userobject within t1
end type
type st_1 from statictext within pp
end type
type pb_ca from picturebutton within pp
end type
type pb_1 from picturebutton within pp
end type
type pb_7 from picturebutton within pp
end type
type dw_p from datawindow within pp
end type
type dw_pc from datawindow within pp
end type
type pp from userobject within t1
st_1 st_1
pb_ca pb_ca
pb_1 pb_1
pb_7 pb_7
dw_p dw_p
dw_pc dw_pc
end type
type pr from userobject within t1
end type
type st_2 from statictext within pr
end type
type pb_delorden from picturebutton within pr
end type
type pb_5 from picturebutton within pr
end type
type dw_r from datawindow within pr
end type
type dw_rc from datawindow within pr
end type
type pr from userobject within t1
st_2 st_2
pb_delorden pb_delorden
pb_5 pb_5
dw_r dw_r
dw_rc dw_rc
end type
type pd from userobject within t1
end type
type st_4 from statictext within pd
end type
type st_3 from statictext within pd
end type
type st_5 from statictext within pd
end type
type pb_10 from picturebutton within pd
end type
type pb_9 from picturebutton within pd
end type
type pb_8 from picturebutton within pd
end type
type pb_6 from picturebutton within pd
end type
type dw_l from datawindow within pd
end type
type dw_cpo from datawindow within pd
end type
type pd from userobject within t1
st_4 st_4
st_3 st_3
st_5 st_5
pb_10 pb_10
pb_9 pb_9
pb_8 pb_8
pb_6 pb_6
dw_l dw_l
dw_cpo dw_cpo
end type
type t1 from tab within w_sum_ent
pp pp
pr pr
pd pd
end type
type dw_c from datawindow within w_sum_ent
end type
type dw_alm from datawindow within w_sum_ent
end type
type gb_1 from groupbox within w_sum_ent
end type
end forward

global type w_sum_ent from window
integer width = 5984
integer height = 2568
boolean titlebar = true
string title = "Suministro"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
st_6 st_6
dw_lug dw_lug
tab_1 tab_1
pb_11 pb_11
pb_grabartmp pb_grabartmp
pb_cancelar pb_cancelar
pb_anular pb_anular
pb_grabardef pb_grabardef
pb_3 pb_3
pb_lote pb_lote
pb_nuevo pb_nuevo
pb_2 pb_2
pb_4 pb_4
t1 t1
dw_c dw_c
dw_alm dw_alm
gb_1 gb_1
end type
global w_sum_ent w_sum_ent

type variables
string coddocumento, codalm, coddoc_rel, i_operacion
DataWindowChild dwc_alm, dwc_f, dwc_i,dwc_lugar
int i_dec_gral,i_aprox_gral
long nuevo
boolean cambio

end variables

forward prototypes
public function integer reversa ()
public function integer update_ori (string coddoc, string lugar, double numdoc, double item, decimal cantidad)
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

Return 0

end function

public function integer update_ori (string coddoc, string lugar, double numdoc, double item, decimal cantidad);dec atendido, valor
string msg
select atendido into :atendido from sum_mvto_cpo
where coddoc=:coddoc and clugar=:lugar and numdoc=:numdoc and item=:item;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("SQL error", msg)
	Return -1
elseif SQLCA.SQLCode = 100 THEN
	Rollback;
	MessageBox("Atención", 'No se encuentra el registro origen. Doc:'+string(numdoc)+' item:'+string(item))
	Return -1
END IF
if isNull(atendido) then atendido = 0
valor = round(atendido + cantidad,i_dec_gral)
update sum_mvto_cpo set atendido=:valor
where coddoc=:coddoc and clugar=:lugar and numdoc=:numdoc and item=:item;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("SQL error - update_ori1", msg)
	Return -1
END IF
select count(*) into :atendido from sum_mvto_cpo
where coddoc=:coddoc and clugar=:lugar and numdoc=:numdoc and cantidad <> atendido;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("SQL error - update_ori2", msg)
	Return -1
END IF
if atendido = 0 then
	update sum_mvto_cab set estado = '3'
	where coddoc=:coddoc and clugar=:lugar and numdoc=:numdoc;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("SQL error - update_ori3", msg)
		Return -1
	END IF
end if
Return 0

end function

public function integer grabar_tmp ();if tab_1.tdoc.dw_cab.RowCount() = 0 then Return -1

if not(tab_1.tdoc.dw_cab.GetItemString(1,'estado') = '0') then
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
	numdoc = f_trae_ndoc(tab_1.tdoc.dw_cab.GetItemString(1,'coddoc'),clugar,This.Title)
	if numdoc < 0 then Return -1
	tab_1.tdoc.dw_cab.SetItem(1,'numdoc',numdoc)
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
tab_1.tdoc.dw_cab.SetItem(1,'observacion',tab_1.tnotas.sle_1)
if tab_1.tdoc.dw_cab.Update(TRUE,FALSE) = -1 then
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
//RegistryGet ("HKEY_LOCAL_MACHINE\software\GCI\suministros", "dec_sum", Regstring!, ojo)
//i_dec_gral=long(ojo)
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
int ret 
choose case codDocumento
	case 'SE'
		Title = 'Suministro - Entradas a Almacén'
		icon='ribon_entrada.ico'
		coddoc_rel = 'OC'
		t1.pp.Text = 'Ordenes de Compra Pendientes'
		t1.pr.Text = 'Ordenes de Compra Relacionadas'
		dwc_alm.setfilter("principal='1'")
		dwc_alm.filter()
	case 'SEP'
		Title = 'Suministro - Entradas por prestamos'
		coddoc_rel = 'SP'
		icon='ribon_prestamos.ico'
		t1.pp.Text = 'Préstamos Pendientes'
		t1.pr.Text = 'Préstamos Relacionadas'
	case 'SVR'
		Title= 'Suministros - Entradas por Vencimiento'
		coddoc_rel = 'SV'
		icon='ribon_vence.ico'
		t1.pp.Text = 'Vencimientos Pendientes'
		t1.pr.Text = 'Vencimientos Relacionadas'
end choose
tab_1.tdoc.dw_cab.Modify("codalmacen_target.Visible=FALSE valor_agregado.Visible=TRUE valor_agregado.Edit.DisplayOnly=TRUE t_5.Text='Total'")
t1.pp.dw_pc.Modify("atendido_t.Text='Atendido'")
t1.pr.dw_rc.Modify("aentregar_t.Text='a Recibir'")
t1.pd.dw_cpo.Modify("atendido_t.Text='Devuelto' cantidad.edit.DisplayOnly=TRUE valor_unit.Edit.DisplayOnly=TRUE")

tab_1.tdoc.dw_cab.GetChild('cod_flujo',dwc_f)
dwc_f.SetTransObject(SQLCA)
if dwc_f.Retrieve(coddocumento) = 0 then
	dwc_f.InsertRow(0)
end if

t1.pd.dw_cpo.GetChild('cod_impu',dwc_i)
dwc_i.SetTransObject(SQLCA)
dwc_i.Retrieve(codDocumento)
dwc_i.InsertRow(1)
dwc_i.SetItem(1,'nombre','Ninguno')


end event

on w_sum_ent.create
this.st_6=create st_6
this.dw_lug=create dw_lug
this.tab_1=create tab_1
this.pb_11=create pb_11
this.pb_grabartmp=create pb_grabartmp
this.pb_cancelar=create pb_cancelar
this.pb_anular=create pb_anular
this.pb_grabardef=create pb_grabardef
this.pb_3=create pb_3
this.pb_lote=create pb_lote
this.pb_nuevo=create pb_nuevo
this.pb_2=create pb_2
this.pb_4=create pb_4
this.t1=create t1
this.dw_c=create dw_c
this.dw_alm=create dw_alm
this.gb_1=create gb_1
this.Control[]={this.st_6,&
this.dw_lug,&
this.tab_1,&
this.pb_11,&
this.pb_grabartmp,&
this.pb_cancelar,&
this.pb_anular,&
this.pb_grabardef,&
this.pb_3,&
this.pb_lote,&
this.pb_nuevo,&
this.pb_2,&
this.pb_4,&
this.t1,&
this.dw_c,&
this.dw_alm,&
this.gb_1}
end on

on w_sum_ent.destroy
destroy(this.st_6)
destroy(this.dw_lug)
destroy(this.tab_1)
destroy(this.pb_11)
destroy(this.pb_grabartmp)
destroy(this.pb_cancelar)
destroy(this.pb_anular)
destroy(this.pb_grabardef)
destroy(this.pb_3)
destroy(this.pb_lote)
destroy(this.pb_nuevo)
destroy(this.pb_2)
destroy(this.pb_4)
destroy(this.t1)
destroy(this.dw_c)
destroy(this.dw_alm)
destroy(this.gb_1)
end on

event closequery;if nuevo > 0 or cambio then 
	if messageBox('Aviso','El documento no ha sido guardado, perderá los cambios. Desea continuar?',QUESTION!,YESNO!) = 2 then
		return -1
	end if
end if

end event

event resize;t1.resize((newwidth - 50) , (newheight * 0.55))
t1.pp.dw_pc.resize(6193,(t1.height *0.53))
t1.pr.dw_rc.resize(5472,(t1.height *0.53))
t1.pd.dw_l.resize(3145,(t1.height *0.30))

end event

type st_6 from statictext within w_sum_ent
integer x = 1440
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

type dw_lug from datawindow within w_sum_ent
integer x = 32
integer y = 4
integer width = 1285
integer height = 140
integer taborder = 50
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
dw_alm.setitem(1,'codalmacen','')
dw_alm.InsertRow(0)
end event

type tab_1 from tab within w_sum_ent
integer x = 3557
integer y = 160
integer width = 2112
integer height = 784
integer taborder = 40
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
tdoc tdoc
tnotas tnotas
end type

on tab_1.create
this.tdoc=create tdoc
this.tnotas=create tnotas
this.Control[]={this.tdoc,&
this.tnotas}
end on

on tab_1.destroy
destroy(this.tdoc)
destroy(this.tnotas)
end on

type tdoc from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2075
integer height = 656
long backcolor = 67108864
string text = "Documento"
long tabtextcolor = 33554432
string picturename = "ap_dx.ico"
long picturemaskcolor = 536870912
dw_cab dw_cab
end type

on tdoc.create
this.dw_cab=create dw_cab
this.Control[]={this.dw_cab}
end on

on tdoc.destroy
destroy(this.dw_cab)
end on

type dw_cab from datawindow within tdoc
integer x = 18
integer y = 12
integer width = 2007
integer height = 640
integer taborder = 30
string title = "none"
string dataobject = "dw_mvto_cab_ff"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event constructor;setTransObject(SQLCA)

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

event getfocus;if t1.pr.dw_r.RowCount() > 0 then
	Modify("tipodoc.Protect='1' documento.Protect='1'")
else
	Modify("tipodoc.Protect='0' documento.Protect='0'")
end if

end event

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
		MessageBox("Atención", "Tercero no existente")
		Return 1
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
	t1.pp.dw_p.SetFilter("tipodoc='"+td+"' and documento='"+doc+"'")
	t1.pp.dw_p.Filter()
end if
if AcceptText() = -1 then Return -1

end event

event rowfocuschanged;t1.pr.dw_rc.Reset()
t1.pr.dw_r.Reset()
t1.pd.dw_l.Reset()
t1.pd.dw_cpo.Reset()
if currentRow = 0 or RowCount() = 0 then Return
if not isNull(GetItemNumber(GetRow(),'numdoc')) then
	t1.pr.dw_r.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
	t1.pd.dw_l.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
	t1.pd.dw_cpo.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
end if

end event

event dberror;Rollback;
Return 0


end event

type tnotas from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2075
integer height = 656
long backcolor = 67108864
string text = "Notas"
long tabtextcolor = 33554432
string picturename = "contrato.ico"
long picturemaskcolor = 536870912
sle_1 sle_1
end type

on tnotas.create
this.sle_1=create sle_1
this.Control[]={this.sle_1}
end on

on tnotas.destroy
destroy(this.sle_1)
end on

type sle_1 from singlelineedit within tnotas
integer x = 9
integer y = 16
integer width = 1737
integer height = 628
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
borderstyle borderstyle = stylelowered!
end type

type pb_11 from picturebutton within w_sum_ent
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 3685
integer y = 12
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "-"
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

type pb_grabartmp from picturebutton within w_sum_ent
event mousemove pbm_mousemove
string tag = "Grabar Temporal"
integer x = 4288
integer y = 12
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

tab_1.tdoc.dw_cab.ResetUpdate()
t1.pd.dw_cpo.ResetUpdate()
t1.pd.dw_l.ResetUpdate()
Return 0

end event

type pb_cancelar from picturebutton within w_sum_ent
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 3835
integer y = 12
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
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_anular from picturebutton within w_sum_ent
event mousemove pbm_mousemove
string tag = "Anular Documento"
integer x = 4137
integer y = 12
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
string picturename = "anulardoc.gif"
string disabledname = "d_anulardoc.gif"
alignment htextalign = left!
string powertiptext = "Anular Documento"
end type

event clicked;long i, nd, item, fila
string cd,cl,msg, art, alm
dec recibido, cprom

if tab_1.tdoc.dw_cab.RowCount() = 0 then Return

if tab_1.tdoc.dw_cab.GetItemString(1,'estado') = '2' then
	messageBox('Aviso','El documento ' + string(tab_1.tdoc.dw_cab.GetItemNumber(1,'numdoc')) +' ya ha sido anulado')
	return
end if
if tab_1.tdoc.dw_cab.GetItemString(1,'estado') = '3' then
	messageBox('Aviso','El documento ' + string(tab_1.tdoc.dw_cab.GetItemNumber(1,'numdoc')) +' ya ha sido atendido')
	return
end if
if tab_1.tdoc.dw_cab.GetItemString(1,'contabil') = 'C' then
	messageBox('Aviso','El documento ' + string(tab_1.tdoc.dw_cab.GetItemNumber(1,'numdoc')) +' ya ha sido llevado a contabilidad')
	return
end if
if f_valida_periodo_sum( tab_1.tdoc.dw_cab.GetItemdatetime(1,'fecha'))= -1 then 
	messageBox('Aviso','Periodo cerrado ya no se puede anular')
	return 
end if
if nuevo > 0 then
	pb_2.triggerEvent(clicked!)
	Return 0
end if

if tab_1.tdoc.dw_cab.GetItemString(1,'estado') = '0' then
	tab_1.tdoc.dw_cab.SetItem(1,'Estado','2')
	if tab_1.tdoc.dw_cab.Update() = 1 then
		commit;
	else
		rollback;
		return -1
	end if
	dw_c.SetItem(dw_c.GetRow(),'estado','2')
	tab_1.tdoc.dw_cab.triggerEvent(RowFocuschanged!)
	Return 0
end if

If messageBox('Aviso','Se Anulará el documento y reversarán movimientos en Kardex. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return
st_xa_anular st_anula
st_anula.tipo='SM'
openwithparm (w_motiv_anula,st_anula)
st_anula=message.powerobjectparm
if not isValid(st_anula) then return -1

long conteo
cd = tab_1.tdoc.dw_cab.GetItemString(1,'coddoc')
cl = tab_1.tdoc.dw_cab.GetItemString(1,'clugar')
nd = tab_1.tdoc.dw_cab.GetItemNumber(1,'numdoc')
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

if tab_1.tdoc.dw_cab.GetItemString(1,'estado') = '1' then
	if f_kardexentanula(tab_1.tdoc.dw_cab.GetItemString(1,'coddoc'),tab_1.tdoc.dw_cab.GetItemString(1,'clugar'),tab_1.tdoc.dw_cab.GetItemNumber(1,'numdoc'),tab_1.tdoc.dw_cab.GetItemString(1,'codalmacen')) = -1 then
		rollback;
		Return -1
	end if
end if

for i = 1 to t1.pd.dw_cpo.RowCount()  
	cd = t1.pd.dw_cpo.GetItemString(i,'coddoc_ori')
	cl = t1.pd.dw_cpo.GetItemString(i,'cLugar_ori')
	nd = t1.pd.dw_cpo.GetItemNumber(i,'numdoc_ori')
	item = t1.pd.dw_cpo.GetItemNumber(i,'item_ori')
	recibido = t1.pd.dw_cpo.GetItemNumber(i,'cantidad')
	update sum_mvto_cpo set atendido = atendido - :recibido
	where coddoc=:cd and clugar=:cl and numdoc=:nd and item=:item;
	IF SQLCA.SQLCode = -1 THEN 
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("SQL error", msg)
		Return -1
	END IF
	
	if coddocumento = 'SE' then 
		alm = tab_1.tdoc.dw_cab.GetItemString(1,'codalmacen')
		art = t1.pd.dw_cpo.GetItemString(i,'codarticulo')
		select costoprom into :cprom from sum_kardex where codalmacen=:alm and codarticulo=:art;
		IF SQLCA.SQLCode = -1 THEN 
			msg = SQLCA.SQLErrText
			Rollback;
			MessageBox("SQL error", msg)
			Return -1
		END IF
		if f_costomedica(t1.pd.dw_cpo.GetItemString(i,'codgenerico'),art , cprom) = -1 then 
			Rollback;
			Return -1
		end if
	end if

Next

for i = 1 to t1.pr.dw_r.RowCount()
	cd = t1.pr.dw_r.GetItemString(i,'coddoc')
	cl = t1.pr.dw_r.GetItemString(i,'cLugar')
	nd = t1.pr.dw_r.GetItemNumber(i,'numdoc')
	update sum_mvto_cab set estado = '1'
	where coddoc=:cd and clugar=:cl and numdoc=:nd;
	IF SQLCA.SQLCode = -1 THEN 
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("SQL error", msg)
		Return -1
	END IF
next

tab_1.tdoc.dw_cab.SetItem(1,'Estado','2')
tab_1.tdoc.dw_cab.SetItem(1,'anulado',usuario)
tab_1.tdoc.dw_cab.SetItem(1,'fechaanula',datetime(today(),now()))
tab_1.tdoc.dw_cab.SetItem(1,'motivo_anula',st_anula.observacion)
tab_1.tdoc.dw_cab.SetItem(1,'cod_anula',st_anula.motivo)
if tab_1.tdoc.dw_cab.Update() = 1 then
	commit;
else
	rollback;
	return -1
end if
dw_c.SetItem(dw_c.GetRow(),'estado','2')
dw_c.SetItem(dw_c.GetRow(),'anulado',usuario)
dw_c.SetItem(dw_c.GetRow(),'fechaanula',today())
tab_1.tdoc.dw_cab.triggerEvent(RowFocuschanged!)

end event

type pb_grabardef from picturebutton within w_sum_ent
event mousemove pbm_mousemove
string tag = "Grabar Definitivo"
integer x = 4439
integer y = 12
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
string picturename = "guardar2.gif"
string disabledname = "d_guardar2.gif"
alignment htextalign = left!
string powertiptext = "Grabar Definitivo"
end type

event clicked;if tab_1.tdoc.dw_cab.RowCount() = 0 then Return -1
int ret

if not(tab_1.tdoc.dw_cab.GetItemString(1,'estado') = '0') then
	MessageBox('Atención','El documento no es nuevo')
	Return -1
end if

If messageBox('Aviso','Se grabará definitivamente, no podrá realizar cambios. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return 0

if grabar_tmp() = -1 then
	Rollback;
	Return -1
end if

t1.pd.dw_cpo.SetFilter("")
t1.pd.dw_cpo.Filter()

if t1.pd.dw_cpo.RowCount() = 0 then 
	MessageBox('Atención','No ha agregado ningun artículo al detalle del documento')
	Return -1
end if

if t1.pd.dw_cpo.getitemnumber(1,'todovalida')>0 then
	MessageBox('Atención','Hay productos sin codigo Invima o Cum Pendientes por Cargar')
	Return -1
end if


long i,j

t1.pd.dw_cpo.SetRedraw(FALSE)
i = t1.pd.dw_cpo.RowCount()
do while i > 0
	t1.pd.dw_cpo.ScrolltoRow(i)
	t1.pd.dw_cpo.Event RowFocuschanged(i)
	if isNull(t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')) or t1.pd.dw_cpo.GetItemNumber(i,'valor_unit') = 0 then
		t1.pd.dw_cpo.SetRedraw(TRUE)
		Rollback;
		Messagebox('Aviso','Debe proporcionar el valor del articulo. Articulo:' + t1.pd.dw_cpo.GetItemString(i,'codarticulo'))
		Return -1
	end if
	if isNull(t1.pd.dw_cpo.GetItemNumber(i,'cantidad')) or t1.pd.dw_cpo.GetItemNumber(i,'cantidad') = 0 then
		t1.pd.dw_cpo.SetRedraw(TRUE)
		Rollback;
		Messagebox('Aviso','Debe proporcionar la cantidad a ingresar. Articulo:' + t1.pd.dw_cpo.GetItemString(i,'codarticulo'))
		Return -1
	end if
	if t1.pd.dw_cpo.GetItemString(i,'vence') = '1' and not(t1.pd.dw_cpo.GetItemNumber(i,'cantidad') = double(t1.pd.dw_l.Describe("Evaluate('sum(cantidad)',0)"))) then
		t1.pd.dw_cpo.SetRedraw(TRUE)
		if Messagebox('Aviso','La cantidad no coincide con las cantidades en lotes. Desea eliminar el registro del articulo y Continuar?. Articulo:' + t1.pd.dw_cpo.GetItemString(i,'codarticulo'),QUESTION!,YESNO!) = 2 then 
			Rollback;
			t1.pd.dw_cpo.SetRedraw(TRUE)
			Return -1
		end if
		t1.pd.pb_6.TriggerEvent(clicked!)
	end if
	i = i - 1
loop
if  t1.pd.dw_cpo.RowCount() = 0 then
	Rollback;
	MessageBox('Atención','No hay registros para procesar')
	Return 0
end if

for i = 1 to t1.pd.dw_cpo.RowCount()
	t1.pd.dw_cpo.ScrolltoRow(i)
	t1.pd.dw_cpo.Event RowFocuschanged(i)
	if t1.pd.dw_cpo.GetItemString(i,'vence') = '1' and not(t1.pd.dw_cpo.GetItemNumber(i,'cantidad') = double(t1.pd.dw_l.Describe("Evaluate('sum(cantidad)',0)"))) then Continue

	if f_kardexentrada(tab_1.tdoc.dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo'),t1.pd.dw_cpo.GetItemNumber(i,'cantidad'),t1.pd.dw_cpo.GetItemString(i,'coddoc'),t1.pd.dw_cpo.GetItemString(i,'clugar'),t1.pd.dw_cpo.GetItemNumber(i,'numdoc'),t1.pd.dw_cpo.GetItemNumber(i,'item'),t1.pd.dw_cpo.GetItemNumber(i,'valor_unit'),getporcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100,tab_1.tdoc.dw_cab.GetItemDateTime(1,'fecha')) = -1 then
		Rollback;
		t1.pd.dw_cpo.SetRedraw(TRUE)
		Return -1
	end if
	for j = 1 to t1.pd.dw_l.RowCount()
		if f_act_lote(tab_1.tdoc.dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo'),t1.pd.dw_l.GetItemNumber(j,'cantidad'),t1.pd.dw_cpo.GetItemString(i,'coddoc'),t1.pd.dw_cpo.GetItemString(i,'clugar'),t1.pd.dw_cpo.GetItemNumber(i,'numdoc'),t1.pd.dw_cpo.GetItemNumber(i,'item'),t1.pd.dw_l.GetItemString(j,'lote'),t1.pd.dw_l.GetItemDateTime(j,'fecha_venc'),t1.pd.dw_l.GetItemNumber(j,'signo'),tab_1.tdoc.dw_cab.GetItemString(1,'codalmacen_target'),t1.pd.dw_l.GetItemString(j,'convenio')) = -1 then
			Rollback;
			t1.pd.dw_cpo.SetRedraw(TRUE)
			Return -1
		end if
	next
	
	if verificaKardex_lote(tab_1.tdoc.dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo')) = -1 then
		Rollback;
		t1.pd.dw_cpo.SetRedraw(TRUE)
		messageBox('Error verificaKardex_lote','La cantidad en Kardex no coincide con la cantidad en Lotes. Art:'+t1.pd.dw_cpo.GetItemString(i,'codarticulo'))
		Return -1
	end if
	
	if update_ori(t1.pd.dw_cpo.GetItemString(i,'coddoc_ori'),t1.pd.dw_cpo.GetItemString(i,'clugar_ori'),t1.pd.dw_cpo.GetItemNumber(i,'numdoc_ori'),t1.pd.dw_cpo.GetItemNumber(i,'item_ori'),t1.pd.dw_cpo.GetItemNumber(i,'cantidad')) = -1 then
		Rollback;
		t1.pd.dw_cpo.SetRedraw(TRUE)
		Return -1
	end if
	if coddocumento = 'SEP' then 
		string ls_r_pac_org,ls_alm_org
		ls_alm_org=tab_1.tdoc.dw_cab.GetItemString(1,'codalmacen')
		select restringepac into :ls_r_pac_org from sumalmacen where codalmacen = :ls_alm_org;
		if ls_alm_org='1' then 
			if f_updatePAC(tab_1.tdoc.dw_cab.GetItemString(1,'codalmacen'),t1.pd.dw_cpo.GetItemString(i,'codarticulo'),t1.pd.dw_cpo.GetItemNumber(i,'cantidad'),tab_1.tdoc.dw_cab.GetItemDateTime(1,'fecha')) = -1 then 
				Rollback;
				Return -1
			end if
		end if
	end if
	if coddocumento = 'SE' then 
		if f_costomedica(t1.pd.dw_cpo.GetItemString(i,'codgenerico'), t1.pd.dw_cpo.GetItemString(i,'codarticulo'),round(t1.pd.dw_cpo.GetItemNumber(i,'valor_unit') * (1 + getporcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100),i_dec_gral) ) = -1 then 
			Rollback;
			Return -1
		end if
	end if

	t1.pd.dw_cpo.SetItem(i,'lote','1')
	if mod(i,5) = 0 then GarbageCollect()
next
tab_1.tdoc.dw_cab.ResetUpdate()
t1.pd.dw_cpo.ResetUpdate()
t1.pd.dw_l.ResetUpdate()
t1.pd.dw_cpo.SetRedraw(TRUE)

tab_1.tdoc.dw_cab.SetItem(1,'estado','1')
if tab_1.tdoc.dw_cab.Update() = -1 then
	Rollback;
	Return -1
end if

nuevo = 0
cambio = FALSE
commit;
dw_c.SetItem(dw_c.GetRow(),'estado','1')
Return 0

end event

type pb_3 from picturebutton within w_sum_ent
event mousemove pbm_mousemove
string tag = "Imprimir Reporte"
integer x = 3986
integer y = 12
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
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
alignment htextalign = left!
string powertiptext = "Imprimir Reporte"
end type

event clicked;if tab_1.tdoc.dw_cab.RowCount() < 1 then Return
any param[10]
param[1] = tab_1.tdoc.dw_cab.GetItemString(1,'coddoc')
param[2] = tab_1.tdoc.dw_cab.GetItemString(1,'clugar')
param[3] = tab_1.tdoc.dw_cab.GetItemNumber(1,'numdoc')

f_reporte(tab_1.tdoc.dw_cab.GetItemString(1,'coddoc'),Title,param)

end event

type pb_lote from picturebutton within w_sum_ent
event mousemove pbm_mousemove
string tag = "Asignar Lotes (Vencimiento)"
boolean visible = false
integer x = 3534
integer y = 12
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

type pb_nuevo from picturebutton within w_sum_ent
event mousemove pbm_mousemove
string tag = "Nuevo documento"
integer x = 4590
integer y = 12
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
tab_1.tdoc.dw_cab.Reset()
dw_c.ScrolltoRow(dw_c.InsertRow(1))
dw_c.SetItem(1,'coddoc',codDocumento)
dw_c.SetItem(1,'clugar',clugar)
dw_c.SetItem(1,'fecha',today())
dw_c.SetItem(1,'estado','0')
dw_c.SetItem(1,'usuario',usuario)

tab_1.tdoc.dw_cab.InsertRow(1)
tab_1.tdoc.dw_cab.SetItem(1,'coddoc',codDocumento)
tab_1.tdoc.dw_cab.SetItem(1,'clugar',clugar)
tab_1.tdoc.dw_cab.SetItem(1,'codalmacen',dw_alm.GetItemString(1,'codalmacen'))
tab_1.tdoc.dw_cab.SetItem(1,'fecha',today())
tab_1.tdoc.dw_cab.SetItem(1,'estado','0')
tab_1.tdoc.dw_cab.SetItem(1,'usuario',usuario)
cambio = TRUE
nuevo = 1

end event

type pb_2 from picturebutton within w_sum_ent
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 4741
integer y = 12
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

type pb_4 from picturebutton within w_sum_ent
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 4891
integer y = 12
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
string picturename = "lupa.gif"
string disabledname = "d_lupa.gif"
alignment htextalign = left!
string powertiptext = "Buscar Tercero"
end type

event clicked;if tab_1.tdoc.dw_cab.RowCount() = 0 then Return
if tab_1.tdoc.dw_cab.GetItemString(tab_1.tdoc.dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(tab_1.tdoc.dw_cab.GetItemNumber(tab_1.tdoc.dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado. ')
	Return 0
end if
if t1.pr.dw_r.RowCount() > 0 then
	MessageBox('Atención','Tiene agregados documentos relacionados. Debe primero retirarlos para cambiar de tercero')
	Return -1
end if
if tab_1.tdoc.dw_cab.GetItemString(tab_1.tdoc.dw_cab.Getrow(),'estado') = '0' then
	g_tercerodesde=13
	openwithparm(w_buscater,tab_1.tdoc.dw_cab)
	tab_1.tdoc.dw_cab.SetColumn('documento')
	tab_1.tdoc.dw_cab.TriggerEvent(itemchanged!)
end if

end event

type t1 from tab within w_sum_ent
integer x = 23
integer y = 960
integer width = 5641
integer height = 1420
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
pp pp
pr pr
pd pd
end type

on t1.create
this.pp=create pp
this.pr=create pr
this.pd=create pd
this.Control[]={this.pp,&
this.pr,&
this.pd}
end on

on t1.destroy
destroy(this.pp)
destroy(this.pr)
destroy(this.pd)
end on

type pp from userobject within t1
integer x = 18
integer y = 112
integer width = 5605
integer height = 1292
long backcolor = 67108864
string text = "Pendientes"
long tabtextcolor = 33554432
string picturename = "cambia_doc.ico"
long picturemaskcolor = 536870912
st_1 st_1
pb_ca pb_ca
pb_1 pb_1
pb_7 pb_7
dw_p dw_p
dw_pc dw_pc
end type

on pp.create
this.st_1=create st_1
this.pb_ca=create pb_ca
this.pb_1=create pb_1
this.pb_7=create pb_7
this.dw_p=create dw_p
this.dw_pc=create dw_pc
this.Control[]={this.st_1,&
this.pb_ca,&
this.pb_1,&
this.pb_7,&
this.dw_p,&
this.dw_pc}
end on

on pp.destroy
destroy(this.st_1)
destroy(this.pb_ca)
destroy(this.pb_1)
destroy(this.pb_7)
destroy(this.dw_p)
destroy(this.dw_pc)
end on

type st_1 from statictext within pp
integer x = 69
integer y = 400
integer width = 402
integer height = 64
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

type pb_ca from picturebutton within pp
event mousemove pbm_mousemove
integer x = 2665
integer y = 268
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
string picturename = "anulardoc.gif"
string disabledname = "d_anulardoc.gif"
alignment htextalign = left!
string powertiptext = "Cierre Arbitrario"
end type

event clicked;If messageBox('Atención','Está seguro de querer cambiar el estado del documento '+string(dw_p.GetItemNumber(dw_p.GetRow(),'numdoc'))+' ?',question!,yesno!,2) = 2 then Return 
string cd,cl, msg
double nd

cd = dw_p.GetItemString(dw_p.GetRow(),'coddoc')
cl = dw_p.GetItemString(dw_p.GetRow(),'clugar')
nd = dw_p.GetItemNumber(dw_p.GetRow(),'numdoc')

update sum_mvto_cab set estado = '3'
where coddoc=:cd and clugar=:cl and numdoc=:nd;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("SQL error", msg)
	Return -1
END IF
pb_1.TriggerEvent(clicked!)
commit;

end event

type pb_1 from picturebutton within pp
event mousemove pbm_mousemove
integer x = 2665
integer y = 144
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
string picturename = "refrescar.gif"
string disabledname = "d_refrescar.gif"
alignment htextalign = left!
string powertiptext = "Refrescar"
end type

event clicked;dw_pc.Reset()
dw_p.Reset()
dw_p.Retrieve(dw_alm.GetItemString(1,'codalmacen'),coddoc_rel)

end event

type pb_7 from picturebutton within pp
event mousemove pbm_mousemove
integer x = 2665
integer y = 16
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
string picturename = "llevar.GIF"
string disabledname = "llevar.GIFd_"
alignment htextalign = left!
string powertiptext = "Llevar a relacionados"
end type

event clicked;long fila, f, i
string cd, cl, td, doc
double nd, it
if tab_1.tdoc.dw_cab.RowCount() <= 0 then Return
if tab_1.tdoc.dw_cab.GetItemString(tab_1.tdoc.dw_cab.GetRow(),'estado') <> '0' then
	if messageBox('Aviso','El documento ' + string(tab_1.tdoc.dw_cab.GetItemNumber(tab_1.tdoc.dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado. Desea crear uno nuevo?',QUESTION!,YESNO!) = 2 then return -1
	if pb_nuevo.Event Clicked() = -1 then Return -1
end if
td = dw_p.GetItemString(dw_p.GetRow(),'tipodoc')
doc = dw_p.GetItemString(dw_p.GetRow(),'documento')
if not isNull(tab_1.tdoc.dw_cab.GetItemString(1,'documento')) then
	if not( td = tab_1.tdoc.dw_cab.GetItemString(1,'tipodoc') and doc = tab_1.tdoc.dw_cab.GetItemString(1,'documento') ) then
		MessageBox('Atención','No puede adicionar documentos de diferentes terceros')
		return
	end if
end if

cd = dw_p.GetItemString(dw_p.GetRow(),'coddoc')
cl = dw_p.GetItemString(dw_p.GetRow(),'clugar')
nd = dw_p.GetItemNumber(dw_p.GetRow(),'numdoc')
fila = t1.pr.dw_r.Find("coddoc='"+cd+"' and clugar='"+cl+"' and numdoc="+string(nd),1,t1.pr.dw_r.RowCount())
if fila = 0 then
	tab_1.tdoc.dw_cab.SetItem(1,'tipodoc',td)
	tab_1.tdoc.dw_cab.SetItem(1,'documento',doc)
	tab_1.tdoc.dw_cab.SetItem(1,'nombre1',dw_p.GetItemString(dw_p.GetRow(),'nombre1'))
	tab_1.tdoc.dw_cab.SetItem(1,'nombre2',dw_p.GetItemString(dw_p.GetRow(),'nombre2'))
	tab_1.tdoc.dw_cab.SetItem(1,'apellido1',dw_p.GetItemString(dw_p.GetRow(),'apellido1'))
	tab_1.tdoc.dw_cab.SetItem(1,'apellido2',dw_p.GetItemString(dw_p.GetRow(),'apellido2'))
	tab_1.tdoc.dw_cab.SetItem(1,'razon_social',dw_p.GetItemString(dw_p.GetRow(),'razon_social'))
	dw_c.SetItem(dw_c.GetRow(),'tipodoc',td)
	dw_c.SetItem(dw_c.GetRow(),'documento',doc)
	dw_c.SetItem(dw_c.GetRow(),'nombre1',dw_p.GetItemString(dw_p.GetRow(),'nombre1'))
	dw_c.SetItem(dw_c.GetRow(),'nombre2',dw_p.GetItemString(dw_p.GetRow(),'nombre2'))
	dw_c.SetItem(dw_c.GetRow(),'apellido1',dw_p.GetItemString(dw_p.GetRow(),'apellido1'))
	dw_c.SetItem(dw_c.GetRow(),'apellido2',dw_p.GetItemString(dw_p.GetRow(),'apellido2'))
	dw_c.SetItem(dw_c.GetRow(),'razon_social',dw_p.GetItemString(dw_p.GetRow(),'razon_social'))
	
	fila = t1.pr.dw_r.InsertRow(0)
	t1.pr.dw_r.SetItem(fila,'coddoc',cd)
	t1.pr.dw_r.SetItem(fila,'clugar',cl)
	t1.pr.dw_r.SetItem(fila,'numdoc',nd)
	t1.pr.dw_r.SetItem(fila,'fecha',dw_p.GetItemDateTime(dw_p.GetRow(),'fecha'))
	t1.pr.dw_r.SetItem(fila,'estado',dw_p.GetItemString(dw_p.GetRow(),'estado'))
	t1.pr.dw_r.SetItem(fila,'usuario',dw_p.GetItemString(dw_p.GetRow(),'usuario'))
	
	t1.pr.dw_rc.Retrieve(cd,cl,nd)
	t1.pr.dw_r.ScrolltoRow(fila)
	t1.pr.dw_r.triggerEvent(rowfocuschanged!)
end if
t1.SelectTab(t1.pr)

end event

type dw_p from datawindow within pp
integer x = 64
integer y = 16
integer width = 2569
integer height = 388
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_mvto_oc_pend"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rowfocuschanged;dw_pc.Reset()
if currentrow = 0 or rowCount() = 0 then Return
dw_pc.Retrieve(GetItemString(Getrow(),'coddoc'),GetItemString(Getrow(),'clugar'),GetItemNumber(Getrow(),'numdoc'))

end event

event clicked;if row <= 0 then Return

if GetRow() <> row then
	ScrolltoRow(row)
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

type dw_pc from datawindow within pp
integer x = 64
integer y = 460
integer width = 5499
integer height = 792
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_mvto_cpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

type pr from userobject within t1
integer x = 18
integer y = 112
integer width = 5605
integer height = 1292
long backcolor = 67108864
string text = "Documentos Relacionados"
long tabtextcolor = 33554432
string picturename = "copiar.ico"
long picturemaskcolor = 536870912
st_2 st_2
pb_delorden pb_delorden
pb_5 pb_5
dw_r dw_r
dw_rc dw_rc
end type

on pr.create
this.st_2=create st_2
this.pb_delorden=create pb_delorden
this.pb_5=create pb_5
this.dw_r=create dw_r
this.dw_rc=create dw_rc
this.Control[]={this.st_2,&
this.pb_delorden,&
this.pb_5,&
this.dw_r,&
this.dw_rc}
end on

on pr.destroy
destroy(this.st_2)
destroy(this.pb_delorden)
destroy(this.pb_5)
destroy(this.dw_r)
destroy(this.dw_rc)
end on

type st_2 from statictext within pr
integer x = 69
integer y = 376
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

type pb_delorden from picturebutton within pr
event mousemove pbm_mousemove
string tag = "Retirar Orden"
integer x = 1586
integer y = 164
integer width = 146
integer height = 128
integer taborder = 120
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
string powertiptext = "Retirar Documento"
end type

event clicked;if tab_1.tdoc.dw_cab.RowCount() = 0 then Return
if tab_1.tdoc.dw_cab.GetItemString(tab_1.tdoc.dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(tab_1.tdoc.dw_cab.GetItemNumber(tab_1.tdoc.dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado')
	return -1
end if

string cd, cl
long nd, fila
cd = t1.pr.dw_r.GetItemString(t1.pr.dw_r.Getrow(),'coddoc')
cl = t1.pr.dw_r.GetItemString(t1.pr.dw_r.Getrow(),'clugar')
nd = t1.pr.dw_r.GetItemNumber(t1.pr.dw_r.Getrow(),'numdoc')

fila = t1.pd.dw_cpo.Find("coddoc_ori='" + cd + "' and clugar_ori='" + cl + "' and numdoc_ori=" + string(nd),1,t1.pd.dw_cpo.RowCount())
do while fila > 0
	t1.pd.dw_cpo.ScrolltoRow(fila)
	t1.pd.pb_6.TriggerEvent(clicked!)
	fila = t1.pd.dw_cpo.Find("coddoc_ori='" + cd + "' and clugar_ori='" + cl + "' and numdoc_ori=" + string(nd),1,t1.pd.dw_cpo.RowCount())
loop

dw_r.DeleteRow(dw_r.Getrow())
dw_r.TriggerEvent(rowfocuschanged!)
if dw_r.RowCount() = 0 then
	string vnul
	setNull(vnul)
	tab_1.tdoc.dw_cab.SetItem(1,'tipodoc',vnul)
	tab_1.tdoc.dw_cab.SetItem(1,'documento',vnul)
	tab_1.tdoc.dw_cab.SetItem(1,'nombre1',vnul)
	tab_1.tdoc.dw_cab.SetItem(1,'razon_social',vnul)
	dw_c.SetItem(dw_c.GetRow(),'tipodoc',vnul)
	dw_c.SetItem(dw_c.GetRow(),'documento',vnul)
	dw_c.SetItem(dw_c.GetRow(),'nombre1',vnul)
	dw_c.SetItem(dw_c.GetRow(),'razon_social',vnul)
	t1.pp.dw_p.SetFilter("")
	t1.pp.dw_p.Filter()
end if
cambio = TRUE

end event

type pb_5 from picturebutton within pr
event mousemove pbm_mousemove
string tag = "Grabar Temporal"
integer x = 1582
integer y = 24
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
string picturename = "llevar.GIF"
string disabledname = "d_llevar.GIF"
alignment htextalign = left!
string powertiptext = "Llevar a detalle"
end type

event clicked;long i, fila, v_tmp
string estado, valor
dec entregado

if tab_1.tdoc.dw_cab.RowCount() = 0 then Return

if tab_1.tdoc.dw_cab.GetItemString(1,'estado') <> '0' then
	messageBox('Aviso','El documento de  ' + string(tab_1.tdoc.dw_cab.GetItemNumber(1,'numdoc')) +  ' ya ha sido cerrado')
	return
end if
dw_rc.SetFilter("")
dw_rc.Filter()

if t1.pr.dw_rc.Find('aentregar > 0',1,t1.pr.dw_rc.RowCount()) = 0 then Return
if t1.pr.dw_rc.Find('selec = 1',1,t1.pr.dw_rc.RowCount()) = 0 then Return

if t1.pr.dw_rc.AcceptText() = -1 then
	Return
end if

For i = 1 to t1.pr.dw_rc.RowCount()
	if t1.pr.dw_rc.GetItemNumber(i,'aentregar') > 0 and t1.pr.dw_rc.GetItemNumber(i,'selec') = 1 then
		
		fila = t1.pd.dw_cpo.Find("coddoc_ori='" + t1.pr.dw_rc.GetItemString(i,'coddoc') + &
			"' and clugar_ori='" + t1.pr.dw_rc.GetItemString(i,'cLugar') +&
			"' and numdoc_ori=" + string(t1.pr.dw_rc.GetItemNumber(i,'numdoc')) +&
			" and item_ori=" + string(t1.pr.dw_rc.GetItemNumber(i,'item')) , 1, t1.pd.dw_cpo.RowCount())
		if fila = 0 then
			valor = t1.pd.dw_cpo.describe("Evaluate('max(item)', 1)")
			fila = t1.pd.dw_cpo.InsertRow(0)
			t1.pd.dw_cpo.SetItem(fila,'coddoc',tab_1.tdoc.dw_cab.GetItemString(1,'coddoc'))
			t1.pd.dw_cpo.SetItem(fila,'cLugar',tab_1.tdoc.dw_cab.GetItemString(1,'clugar'))
			t1.pd.dw_cpo.SetItem(fila,'numdoc',tab_1.tdoc.dw_cab.GetItemNumber(1,'numdoc'))
			t1.pd.dw_cpo.SetItem(fila,'item',long(valor) + 1)
			t1.pd.dw_cpo.SetItem(fila,'coddoc_ori',t1.pr.dw_rc.GetItemString(i,'coddoc'))
			t1.pd.dw_cpo.SetItem(fila,'cLugar_ori',t1.pr.dw_rc.GetItemString(i,'cLugar'))
			t1.pd.dw_cpo.SetItem(fila,'numdoc_ori',t1.pr.dw_rc.GetItemNumber(i,'numdoc'))
			t1.pd.dw_cpo.SetItem(fila,'item_ori',t1.pr.dw_rc.GetItemNumber(i,'item'))
			t1.pd.dw_cpo.SetItem(fila,'codarticulo',t1.pr.dw_rc.GetItemString(i,'codarticulo'))
			t1.pd.dw_cpo.SetItem(fila,'codgenerico',t1.pr.dw_rc.GetItemString(i,'codgenerico'))
			t1.pd.dw_cpo.SetItem(fila,'cantidad',t1.pr.dw_rc.GetItemNumber(i,'aentregar'))
			t1.pd.dw_cpo.SetItem(fila,'valor_unit',t1.pr.dw_rc.GetItemNumber(i,'valor_unit'))
			t1.pd.dw_cpo.SetItem(fila,'descripcion',t1.pr.dw_rc.GetItemString(i,'descripcion'))
			t1.pd.dw_cpo.SetItem(fila,'banco',t1.pr.dw_rc.GetItemString(i,'banco'))
			t1.pd.dw_cpo.SetItem(fila,'estado','0')
			t1.pd.dw_cpo.SetItem(fila,'cod_impu',t1.pr.dw_rc.GetItemString(i,'cod_impu'))
			t1.pd.dw_cpo.SetItem(fila,'impu',getPorcentaje(t1.pr.dw_rc.GetItemString(i,'cod_impu'))/100)
			t1.pd.dw_cpo.SetItem(fila,'vence',t1.pr.dw_rc.GetItemString(i,'vence'))
			t1.pd.dw_cpo.SetItem(fila,'act_fijo',t1.pr.dw_rc.GetItemString(i,'act_fijo'))
			t1.pd.dw_cpo.SetItem(fila,'invima',t1.pr.dw_rc.GetItemString(i,'invima'))
			t1.pd.dw_cpo.SetItem(fila,'cum',t1.pr.dw_rc.GetItemString(i,'cum'))
			t1.pd.dw_cpo.SetItem(fila,'vtotal', round( ( t1.pr.dw_rc.GetItemNumber(i,'aentregar') *  t1.pr.dw_rc.GetItemNumber(i,'valor_unit') * (1+t1.pd.dw_cpo.getitemnumber(fila,'impu'))),i_dec_gral))
		else
			t1.pd.dw_cpo.SetItem(fila,'cantidad', t1.pr.dw_rc.GetItemNumber(i,'aentregar') )
		end if
		t1.pr.dw_rc.SetItem(i,'selec',0)
	end if
Next
t1.pd.dw_cpo.TriggerEvent(itemchanged!)
t1.pd.dw_cpo.TriggerEvent(rowfocuschanged!)
t1.SelectTab(t1.pd)
cambio = TRUE

end event

type dw_r from datawindow within pr
integer x = 64
integer y = 28
integer width = 1422
integer height = 348
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_mvto_rel"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rowfocuschanged;dw_rc.SetFilter("")
dw_rc.Filter()
if currentrow = 0 or RowCount() = 0 then 
	dw_rc.Reset()
	Return
end if
string cd,cl
double nd
cd = this.GetItemstring(GetRow(),'coddoc')
cl = this.GetItemstring(GetRow(),'clugar')
nd = this.GetItemNumber(GetRow(),'numdoc')
if not isNull(nd) then
	dw_rc.SetFilter("coddoc='"+cd+"' and clugar='"+cl+"' and numdoc="+string(nd))
	dw_rc.Filter()
end if

end event

event retrieveend;string cd,cl
long nd, i
for i = 1 to rowcount()
	cd = GetItemstring(i,'coddoc')
	cl = GetItemstring(i,'clugar')
	nd = GetItemNumber(i,'numdoc')
	dw_rc.Retrieve(cd, cl, nd)
next

end event

type dw_rc from datawindow within pr
event p_clicked ( dwobject dwo )
integer x = 64
integer y = 436
integer width = 5472
integer height = 848
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_mvto_rel_cpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_clicked(dwobject dwo);if dwo.Name = 'selec_t' then
	long i
	if describe("selec_t.text") = 'Selec.' then
		for i = 1 to rowCount()
			SetItem(i,'aentregar',GetItemNumber(i,'cantidad') - GetItemNumber(i,'atendido'))
			if GetItemNumber(i,'aentregar') > 0 then 
				SetItem(i,'selec',1)
			end if
		next
		Modify("selec_t.Text='Desel.'")
	else
		for i = 1 to rowCount()
			SetItem(i,'selec',0)
			SetItem(i,'aentregar',0)
		next
		Modify("selec_t.Text='Selec.'")
	end if
end if

end event

event constructor;setTransObject(SQLCA)
end event

event retrievestart;Return 2

end event

event clicked;if dwo.name <> 'selec_t' then Return 
post event p_clicked(dwo)

end event

event itemchanged;if AcceptText() = -1 then Return
if getColumnName() = 'aentregar' then
	if GetItemNumber(GetRow(),'aentregar') > 0 then
		SetItem(GetRow(),'selec',1)
	else
		SetItem(GetRow(),'selec',0)
	end if
	if double(data) >(GetItemNumber(GetRow(),'cantidad') - GetItemNumber(getRow(),'atendido')) then
		SetItem(GetRow(),'aentregar',GetItemNumber(GetRow(),'cantidad') - GetItemNumber(getRow(),'atendido'))
		return 1
	end if
elseif getColumnName() = 'selec' then
	if data = '0' then
		SetItem(GetRow(),'aentregar',0)
	elseif data = '1' then
		SetItem(GetRow(),'aentregar',GetItemNumber(GetRow(),'cantidad') - GetItemNumber(getRow(),'atendido'))
	end if
end if
if AcceptText() = -1 then Return
end event

event retrieveend;long i,rc
rc = rowcount
if isNull(rowcount) then rc = rowcount()
for i = 1 to rc
	if i>rowcount() then continue
	if GetItemNumber(i,'aentregar') > 0 then
		SetItem(i,'selec',1)
	end if
next

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
integer width = 5605
integer height = 1292
long backcolor = 67108864
string text = "Artículos a recibir"
long tabtextcolor = 33554432
string picturename = "audita.ico"
long picturemaskcolor = 536870912
st_4 st_4
st_3 st_3
st_5 st_5
pb_10 pb_10
pb_9 pb_9
pb_8 pb_8
pb_6 pb_6
dw_l dw_l
dw_cpo dw_cpo
end type

on pd.create
this.st_4=create st_4
this.st_3=create st_3
this.st_5=create st_5
this.pb_10=create pb_10
this.pb_9=create pb_9
this.pb_8=create pb_8
this.pb_6=create pb_6
this.dw_l=create dw_l
this.dw_cpo=create dw_cpo
this.Control[]={this.st_4,&
this.st_3,&
this.st_5,&
this.pb_10,&
this.pb_9,&
this.pb_8,&
this.pb_6,&
this.dw_l,&
this.dw_cpo}
end on

on pd.destroy
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_5)
destroy(this.pb_10)
destroy(this.pb_9)
destroy(this.pb_8)
destroy(this.pb_6)
destroy(this.dw_l)
destroy(this.dw_cpo)
end on

type st_4 from statictext within pd
integer x = 87
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

type st_3 from statictext within pd
integer x = 96
integer y = 696
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
string text = "Lotes"
boolean focusrectangle = false
end type

type st_5 from statictext within pd
integer x = 3456
integer y = 752
integer width = 1947
integer height = 456
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Si desea cambiar la cantidad de la grilla Artículos, debe retirar la fila con el botón Retirar Registro y Volverlo a adicionar desde la grilla Artículos de documentos Relacionados"
boolean focusrectangle = false
end type

type pb_10 from picturebutton within pd
event mousemove pbm_mousemove
integer x = 3259
integer y = 1016
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
string picturename = "contrato.gif"
string disabledname = "d_contrato.gif"
alignment htextalign = left!
string powertiptext = "Revisar Lotes"
end type

event clicked;if tab_1.tdoc.dw_cab.RowCount() = 0 then Return
if tab_1.tdoc.dw_cab.GetItemString(tab_1.tdoc.dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(tab_1.tdoc.dw_cab.GetItemNumber(tab_1.tdoc.dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado')
	return
end if

st_lote st_p
st_p.codalmacen = tab_1.tdoc.dw_cab.GetItemString(1,'codalmacen')
st_p.codarticulo = dw_cpo.GetItemString(dw_cpo.GetRow(),'codarticulo')
st_p.coddoc = tab_1.tdoc.dw_cab.GetItemString(1,'coddoc')
st_p.clugar = tab_1.tdoc.dw_cab.GetItemString(1,'clugar')
st_p.numdoc = tab_1.tdoc.dw_cab.GetItemNumber(1,'numdoc')
st_p.item = dw_cpo.GetItemNumber(dw_cpo.GetRow(),'item')
st_p.c_itm = dw_cpo.GetItemString(dw_cpo.GetRow(),'descripcion')
st_p.c_cant = '1'
st_p.dw_obj = dw_l
st_p.dw_cpo = dw_cpo

openwithparm(w_lotes_articulo, st_p)
//dw_cpo.SetItem(dw_cpo.GetRow(),'cantidad',double(dw_l.Describe("Evaluate('sum(cantidad)',0)")))

end event

type pb_9 from picturebutton within pd
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 3259
integer y = 884
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
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Retirar registro"
end type

event clicked;if dw_l.RowCount() = 0 then Return
if tab_1.tdoc.dw_cab.GetItemString(tab_1.tdoc.dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(tab_1.tdoc.dw_cab.GetItemNumber(tab_1.tdoc.dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado')
	return
end if

string codart
long f
dec cant

//codart = dw_l.GetItemString(dw_l.GetRow(),'codarticulo')
//cant = dw_l.GetItemNumber(dw_l.GetRow(),'cantidad')
//f = dw_cpo.Find("codarticulo='"+codart+"'",1,dw_cpo.RowCount())
//if f > 0 then
	dw_l.DeleteRow(0)
//	dw_cpo.SetItem(f,'cantidad',double(dw_l.Describe("Evaluate('sum(cantidad)',0)")))
//	if dw_cpo.GetItemNumber(f,'cantidad') <= 0 then
//		dw_cpo.SetItem(f,'cantidad',0)
//	end if
//end if
dw_cpo.TriggerEvent(RowFocuschanged!)
cambio = TRUE

end event

type pb_8 from picturebutton within pd
event mousemove pbm_mousemove
string tag = "Nuevo documento"
integer x = 3259
integer y = 752
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Agregar registro"
end type

event clicked;if dw_cpo.RowCount() = 0 then Return
if tab_1.tdoc.dw_cab.GetItemString(tab_1.tdoc.dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(tab_1.tdoc.dw_cab.GetItemNumber(tab_1.tdoc.dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado')
	return
end if

long f

f = dw_l.InsertRow(0)
dw_l.SetItem(f,'codalmacen',tab_1.tdoc.dw_cab.GetItemString(1,'codalmacen'))
dw_l.SetItem(f,'codarticulo',dw_cpo.GetItemString(dw_cpo.GetRow(),'codarticulo'))
dw_l.SetItem(f,'coddoc',dw_cpo.GetItemString(dw_cpo.GetRow(),'coddoc'))
dw_l.SetItem(f,'clugar',dw_cpo.GetItemString(dw_cpo.GetRow(),'clugar'))
dw_l.SetItem(f,'numdoc',dw_cpo.GetItemNumber(dw_cpo.GetRow(),'numdoc'))
dw_l.SetItem(f,'item',dw_cpo.GetItemNumber(dw_cpo.GetRow(),'item'))
dw_l.SetItem(f,'banco',dw_cpo.GetItemString(dw_cpo.GetRow(),'banco'))
dw_l.SetItem(f,'signo',1)
dw_l.SetItem(f,'cantidad',dw_cpo.GetItemNumber(dw_cpo.GetRow(),'cantidad'))

dw_l.ScrolltoRow(f)
cambio = TRUE

end event

type pb_6 from picturebutton within pd
event mousemove pbm_mousemove
string tag = "Eliminar documento Nuevo"
integer x = 5417
integer y = 52
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
string powertiptext = "Eliminar documento Nuevo"
end type

event clicked;if dw_cpo.RowCount() = 0 then Return
if tab_1.tdoc.dw_cab.GetItemString(tab_1.tdoc.dw_cab.GetRow(),'estado') <> '0' then
	messageBox('Aviso','El documento ' + string(tab_1.tdoc.dw_cab.GetItemNumber(tab_1.tdoc.dw_cab.GetRow(),'numdoc')) + ' ya ha sido cerrado')
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
integer y = 752
integer width = 3145
integer height = 464
integer taborder = 40
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

event itemchanged;long f, it
if AcceptText() = -1 then Return
if getColumnName() = 'cantidad'  or getColumnName() = 'fecha_aprobacion' or getColumnName() = 'nro_sello' then
	 if GetItemnumber(Getrow(),'cantidad')>1 and GetItemstring(Getrow(),'banco')='1' then
	 	MessageBox('Error','No puede ser mayor 1')
		dw_l.SetItem(dw_l.GetRow(),'cantidad',1)
		AcceptText() 
	end if
end if

end event

event losefocus;setColumn('cantidad')
triggerEvent(itemchanged!)

end event

event dberror;Rollback;
Return 0

end event

event rowfocuschanged;if currentrow = 0 or rowcount() = 0 then return

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
integer y = 52
integer width = 5298
integer height = 640
integer taborder = 20
boolean bringtotop = true
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

//long f,nd
//string cd,cl
//cd = GetItemString(GetRow(),'coddoc_ori')
//cl = GetItemString(GetRow(),'clugar_ori')
//nd = GetItemNumber(GetRow(),'numdoc_ori')
//f = t1.pr.dw_r.find("coddoc='"+cd+"' and clugar='"+cl+"' and numdoc="+string(nd),1,t1.pr.dw_r.RowCount())
//if f > 0 and t1.pr.dw_r.GetRow() <> f then
//	t1.pr.dw_r.ScrolltoRow(f)
//end if

end event

event losefocus;AcceptText()

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

event itemchanged;long i
dec monto
for i = 1 to t1.pd.dw_cpo.RowCount()
	if isNull(t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')) or isNull(t1.pd.dw_cpo.GetItemNumber(i,'cantidad')) then Continue
	SetItem(i,'vtotal',  round((t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')*t1.pd.dw_cpo.GetItemNumber(i,'cantidad')*(1+getPorcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100)),i_dec_gral))
	monto = monto + round((t1.pd.dw_cpo.GetItemNumber(i,'valor_unit')*t1.pd.dw_cpo.GetItemNumber(i,'cantidad')*(1+getPorcentaje(t1.pd.dw_cpo.GetItemString(i,'cod_impu'))/100)),i_dec_gral)
next
if getColumnName() = 'cod_impu' then
	SetItem(GetRow(),'impu',getPorcentaje(GetItemString(getRow(),'cod_impu'))/100)
end if
tab_1.tdoc.dw_cab.SetItem(1,'valor_agregado',monto)

end event

event retrieveend;long i
for i = 1 to RowCount()	
	SetItem(i,'impu',getPorcentaje(GetItemString(i,'cod_impu'))/100)
next

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

type dw_c from datawindow within w_sum_ent
event borrarnuevo ( )
integer x = 64
integer y = 204
integer width = 3415
integer height = 700
integer taborder = 20
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

event rowfocuschanged;tab_1.tdoc.dw_cab.Reset()
if currentrow = 0 or RowCount() = 0 then Return

if not isNull(GetItemNumber(GetRow(),'numdoc')) then
	tab_1.tdoc.dw_cab.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))
	tab_1.tnotas.sle_1.text=tab_1.tdoc.dw_cab.getitemstring(1,'observacion')
	if tab_1.tdoc.dw_cab.getitemstring(1,'estado')='0' then 	
		tab_1.tnotas.sle_1.enabled=false
	else
		tab_1.tnotas.sle_1.enabled=true
	end if
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

event clicked;if dwo.name = 'compute_1' then
	if GetRow() <> row then ScrolltoRow(row)
end if

end event

type dw_alm from datawindow within w_sum_ent
event retornar ( )
integer x = 1435
integer y = 64
integer width = 1152
integer height = 76
integer taborder = 10
string title = "none"
string dataobject = "dw_alm_ext"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retornar();this.SetItem(1,'descripcion',codalm)

end event

event itemchanged;if nuevo > 0 or cambio then 
	if messageBox('Aviso','El documento nuevo no ha sido guardado, perderá los cambios. Desea continuar?',QUESTION!,YESNO!) = 2 then
		codalm = this.GetItemString(1,'descripcion')
		this.PostEvent("retornar")
		return -1
	end if
	nuevo = 0
	cambio = FALSE
end if
AcceptText()
dw_c.Reset()
tab_1.tdoc.dw_cab.Reset()
t1.pd.dw_l.Reset()
t1.pd.dw_cpo.Reset()
t1.pp.dw_p.Reset()
t1.pr.dw_r.Reset()
t1.pp.dw_p.Retrieve(dw_alm.GetItemString(1,'codalmacen'),coddoc_rel)
dw_c.Retrieve(dw_alm.GetItemString(1,'codalmacen'),codDocumento)


end event

type gb_1 from groupbox within w_sum_ent
integer x = 27
integer y = 140
integer width = 3488
integer height = 804
integer taborder = 30
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

