$PBExportHeader$w_af_baja.srw
forward
global type w_af_baja from w_center
end type
type pb_cerrar from picturebutton within w_af_baja
end type
type gb_1 from groupbox within w_af_baja
end type
type st_1 from statictext within w_af_baja
end type
type st_2 from statictext within w_af_baja
end type
type pb_1 from picturebutton within w_af_baja
end type
type dw_lp from datawindow within w_af_baja
end type
type dw_b from datawindow within w_af_baja
end type
type pb_2 from picturebutton within w_af_baja
end type
type gb_2 from groupbox within w_af_baja
end type
type pb_buscar from picturebutton within w_af_baja
end type
type cbx_1 from checkbox within w_af_baja
end type
type dw_cp from datawindow within w_af_baja
end type
type dw_cb from datawindow within w_af_baja
end type
end forward

global type w_af_baja from w_center
string tag = "Ha realizado cambios. Desea guardarlos?"
integer width = 5202
integer height = 1956
string title = "Activos Fijos- Bajas"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_baja.ico"
boolean center = false
pb_cerrar pb_cerrar
gb_1 gb_1
st_1 st_1
st_2 st_2
pb_1 pb_1
dw_lp dw_lp
dw_b dw_b
pb_2 pb_2
gb_2 gb_2
pb_buscar pb_buscar
cbx_1 cbx_1
dw_cp dw_cp
dw_cb dw_cb
end type
global w_af_baja w_af_baja

type variables
Datawindow dw_fuente 
DataWindowChild dwc_ccosto, idw_f
string codDocumento

end variables

forward prototypes
public function integer grabar ()
end prototypes

public function integer grabar ();Return pb_grabar.Event clicked()

end function

on w_af_baja.create
int iCurrent
call super::create
this.pb_cerrar=create pb_cerrar
this.gb_1=create gb_1
this.st_1=create st_1
this.st_2=create st_2
this.pb_1=create pb_1
this.dw_lp=create dw_lp
this.dw_b=create dw_b
this.pb_2=create pb_2
this.gb_2=create gb_2
this.pb_buscar=create pb_buscar
this.cbx_1=create cbx_1
this.dw_cp=create dw_cp
this.dw_cb=create dw_cb
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_cerrar
this.Control[iCurrent+2]=this.gb_1
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.pb_1
this.Control[iCurrent+6]=this.dw_lp
this.Control[iCurrent+7]=this.dw_b
this.Control[iCurrent+8]=this.pb_2
this.Control[iCurrent+9]=this.gb_2
this.Control[iCurrent+10]=this.pb_buscar
this.Control[iCurrent+11]=this.cbx_1
this.Control[iCurrent+12]=this.dw_cp
this.Control[iCurrent+13]=this.dw_cb
end on

on w_af_baja.destroy
call super::destroy
destroy(this.pb_cerrar)
destroy(this.gb_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.pb_1)
destroy(this.dw_lp)
destroy(this.dw_b)
destroy(this.pb_2)
destroy(this.gb_2)
destroy(this.pb_buscar)
destroy(this.cbx_1)
destroy(this.dw_cp)
destroy(this.dw_cb)
end on

event open;dw_lp.Retrieve()
dw_b.Retrieve('SB')

end event

event closequery;call super::closequery;if cambio then
	if messageBox('Aviso','El documento nuevo no ha sido guardado. Desea continuar?',QUESTION!,YESNO!) = 2 then
		Return -1
	end if
end if

end event

event resize;call super::resize;//
end event

type pb_grabar from w_center`pb_grabar within w_af_baja
integer x = 2377
integer y = 1592
integer taborder = 100
boolean originalsize = false
string powertiptext = "&Guardar"
end type

event pb_grabar::clicked;long fila, f, ff, fa, i
double nd, cprom
string placa, codalm, msg, codarticulo

fila = dw_b.Find("estado='N'",1,dw_b.RowCount())
if fila = 0 then
	MessageBox('Atención','No ha definido ningún activo para ser dado de baja')
	Return 0
end if
if MessageBox('Atención','Desea dar de baja los activos con estado NUEVO en la grilla inferior?',QUESTION!,YESNO!) = 2 then Return -1
fila = dw_b.Find("estado='N'",1,dw_b.RowCount())
do while fila > 0
	placa = dw_b.GetItemString(fila,'placa')
	fa = dw_lp.Find("placa='"+placa+"'",1,dw_lp.RowCount())
	if fa > 0 then
		dw_lp.SetItem(fa,'estado','2')
	else
		MessageBox('Atención','El activo con placa '+placa+' no se encontró para establecerlo inactivo')
		Return -1
	end if
	dw_b.SetItem(fila,'estado','1')
	codalm = dw_lp.GetItemString(fa,'codalmacen')
	if isNull(codalm) or codalm = '' then
		codalm = dw_lp.GetItemString(fa,'codalmacen_kar')
	end if
	f = dw_cb.Find("codalmacen='"+codalm+"'",1,dw_cb.RowCount())
	if f = 0 then
		nd = f_trae_ndoc('SB',clugar,'Bajas')
		if nd < 1 then Return -1
		f = dw_cb.InsertRow(0)
		dw_cb.SetItem(f,'coddoc','SB')
		dw_cb.SetItem(f,'clugar',clugar)
		dw_cb.SetItem(f,'numdoc',nd)
		dw_cb.SetItem(f,'codalmacen',codalm)
		dw_cb.SetItem(f,'fecha',dw_b.GetItemDateTime(fila,'fecha'))
		dw_cb.SetItem(f,'estado','1')
		dw_cb.SetItem(f,'usuario',usuario)
	end if
	ff = dw_cp.InsertRow(0)
	dw_cp.SetItem(ff,'coddoc',dw_cb.GetItemString(f,'coddoc'))
	dw_cp.SetItem(ff,'clugar',dw_cb.GetItemString(f,'clugar'))
	dw_cp.SetItem(ff,'numdoc',dw_cb.GetItemNumber(f,'numdoc'))
	dw_cp.SetItem(ff,'item',long(dw_cp.Describe("Evaluate('max(item)',0)")) + 1)
	dw_cp.SetItem(ff,'codarticulo',dw_lp.GetItemString(fa,'codarticulo'))
	dw_cp.SetItem(ff,'cantidad',1)
	dw_cp.SetItem(ff,'codarticulo',dw_lp.GetItemString(fa,'codarticulo'))
	dw_cp.SetItem(ff,'codgenerico',dw_lp.GetItemString(fa,'codgenerico'))
	dw_cp.SetItem(ff,'justificacion',placa)
	dw_cp.SetItem(ff,'estado','1')
	select VrActual into :cprom from af_registro_cpo where placa=:placa;
	IF SQLCA.SQLCode = -1 THEN
		Rollback;
		msg = SQLCA.SQLErrText
		MessageBox("SQL error", msg)
		Return -1
	END IF
	dw_cp.SetItem(ff,'valor_unit',cprom)	

//	select costoprom into :cprom from sum_kardex where codalmacen=:codalm and codarticulo=:codarticulo;
//	IF SQLCA.SQLCode = -1 THEN
//		Rollback;
//		msg = SQLCA.SQLErrText
//		MessageBox("SQL error", msg)
//		Return -1
//	END IF
//	dw_cp.SetItem(ff,'valor_unit',cprom)	

	dw_b.SetItem(fila,'coddoc',dw_cp.GetItemString(ff,'coddoc'))
	dw_b.SetItem(fila,'clugar',dw_cp.GetItemString(ff,'clugar'))
	dw_b.SetItem(fila,'numdoc',dw_cp.GetItemNumber(ff,'numdoc'))
	dw_b.SetItem(fila,'item_baja',dw_cp.GetItemNumber(ff,'item'))
	
	fila = dw_b.Find("estado='N'",1,dw_b.RowCount())
loop
if dw_cb.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
if dw_cp.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
if dw_b.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
if dw_lp.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

for i = 1 to dw_cp.RowCount()
	f = dw_cb.Find("numdoc="+string(dw_cp.GetItemNumber(i,'numdoc')),1,dw_cb.RowCount())
	if f > 0 then 
		if f_kardexsalida(dw_cb.GetItemString(f,'codalmacen'),dw_cp.GetItemString(i,'codarticulo'),dw_cp.GetItemNumber(i,'cantidad'),dw_cp.GetItemString(i,'coddoc'),dw_cp.GetItemString(i,'clugar'),dw_cp.GetItemNumber(i,'numdoc'),dw_cp.GetItemNumber(i,'item'),dw_cb.GetItemDateTime(f,'fecha')) = -1 then
			Rollback;
			Return -1
		end if
	end if
next

commit;
dw_b.ResetUpdate()
dw_lp.ResetUpdate()
dw_cb.ResetUpdate()
dw_cp.ResetUpdate()
for i = 1 to dw_cb.RowCount()
	if cbx_1.checked then		
		if dw_cb.RowCount() < 1 then Return
		any param[10]
		param[1] = dw_cb.GetItemString(i,'coddoc')
		param[2] = dw_cb.GetItemString(i,'clugar')
		param[3] = dw_cb.GetItemNumber(i,'numdoc')
		f_reporte(dw_cb.GetItemString(i,'coddoc'),"Bajas de Activos",param)
	end if
next
msg = ''
for i = 1 to dw_cb.RowCount()
	msg = msg + string(dw_cb.GetItemNumber(i,'numdoc')) +'  '
next
if dw_cb.RowCount() = 1 then
	MessageBox('Atención','Se creó Baja (suministros) '+msg)
else
	MessageBox('Atención','Se crearon Bajas (suministros) '+msg)
end if
dw_cp.Reset()
dw_cb.Reset()
dw_lp.Retrieve()

Return 0

end event

type pb_cerrar from picturebutton within w_af_baja
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 1929
integer y = 1592
integer width = 142
integer height = 124
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cerrar"
end type

event clicked;close(parent)

end event

type gb_1 from groupbox within w_af_baja
integer x = 37
integer y = 24
integer width = 4347
integer height = 616
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Activos (en gris depreciados)"
end type

type st_1 from statictext within w_af_baja
integer x = 704
integer y = 124
integer width = 827
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_af_baja
integer x = 4443
integer y = 56
integer width = 686
integer height = 572
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "Seleccionelos activos fijos que desea dar de baja. (Los activos que aparecen en la lista, han sido depreciados). Presione el botón Dar de baja para llevarlos a la grilla inferior (de activos dados de baja) y guarde los cambios para que tenga efecto la operación."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_af_baja
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 2222
integer y = 1592
integer width = 142
integer height = 124
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrador.gif"
string disabledname = "d_borrador.gif"
alignment htextalign = left!
string powertiptext = "Dar de baja activos seleccionado"
end type

event clicked;long fila, fb
string valor, placa

fila = dw_lp.Find("selec = 1",1,dw_lp.RowCount())
do while fila > 0
	placa = dw_lp.GetItemString(fila,'placa')
	fb = dw_b.Find("placa='"+placa+"' and estado='1'",1,dw_b.RowCount())
	if fb = 0 then
		valor = dw_b.Describe("Evaluate('max(if(placa=~~'"+placa+"~~',item,0))',0)")
		fb = dw_b.InsertRow(0)
		dw_b.SetItem(fb,'placa',placa)
		dw_b.SetItem(fb,'item',long(valor) + 1)
		dw_b.SetItem(fb,'fecha',today())
		dw_b.SetItem(fb,'estado','N')
		dw_b.SetItem(fb,'usuario',usuario)
		dw_b.SetItem(fb,'descripcion',dw_lp.GetItemString(fila,'descripcion'))
		dw_b.ScrollToRow(fb)
	end if
	dw_lp.SetItem(fila,'estado','2')
	dw_lp.SetItem(fila,'selec',0)
	fila = dw_lp.Find("selec = 1",1,dw_lp.RowCount())
loop

end event

type dw_lp from datawindow within w_af_baja
integer x = 82
integer y = 100
integer width = 4123
integer height = 500
integer taborder = 130
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ls_depreciados"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event rowfocuschanged;string placa
long numdoc, item, asignado, fila
string coddoc,lugar, codalmacen, msg, cl, uf, cc

if RowCount() = 0 or currentrow = 0 then Return

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

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

type dw_b from datawindow within w_af_baja
integer x = 91
integer y = 764
integer width = 4960
integer height = 704
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "dw_af_baja"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event rowfocuschanged;if currentrow = 0 or RowCount() = 0 then Return 0

if GetItemString(GetRow(),'estado') = 'N' then
	Modify("justificacion.Edit.DisplayOnly = NO")
else
	Modify("justificacion.Edit.DisplayOnly = yes")
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

type pb_2 from picturebutton within w_af_baja
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 2075
integer y = 1592
integer width = 142
integer height = 124
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "anular_doc.gif"
string disabledname = "d_anular_doc.gif"
alignment htextalign = left!
string powertiptext = "Anular Baja resaltada"
end type

event clicked;long fila, it
string placa,msg, cd, cl, contabil, alm, codarticulo
double nd
datetime fecha

if dw_b.RowCount() = 0 then Return 0
if dw_b.GetItemString(dw_b.GetRow(),'estado') = '2' then
	MessageBox('Atención','La baja ya ha sido anulada')
	Return 0
end if
if dw_b.GetItemString(dw_b.GetRow(),'estado') <> '1' then
	MessageBox('Atención','La baja no está definitiva')
	Return 0
end if

if MessageBox('Atención','Desea anular la baja?',QUESTION!,YESNO!) = 2 then Return 0 
cd = dw_b.GetItemString(dw_b.GetRow(),'coddoc')
cl = dw_b.GetItemString(dw_b.GetRow(),'clugar')
nd = dw_b.GetItemNumber(dw_b.GetRow(),'numdoc')
it = dw_b.GetItemNumber(dw_b.GetRow(),'item_baja')
placa = dw_b.GetItemString(dw_b.GetRow(),'placa')
codarticulo = dw_b.GetItemString(dw_b.GetRow(),'codarticulo')

select contabil, codalmacen into :contabil, :alm from sum_mvto_cab 
where coddoc=:cd and clugar=:cl and numdoc=:nd;
if contabil = 'C' then
	messageBox('Aviso','El documento ' + string(nd) +' ya ha sido llevado a contabilidad')
	return
end if
//If messageBox('Aviso','Se Anulará el documento y reversarán movimientos en Kardex. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return
fecha = datetime(today())

if f_kardexsalanula(cd,cl,nd,alm) = -1 then
	rollback;
	Return -1
end if
string ls_r_pac_org

select restringepac into :ls_r_pac_org from sumalmacen where codalmacen = :alm;

if ls_r_pac_org='1' then 
	if f_updatePAC(alm,codarticulo, -1,fecha) = -1 then 
		Rollback;
		Return -1
	end if
end if

update sum_mvto_cab set estado = '2', anulado=:usuario, fechaanula=:fecha
where coddoc=:cd and clugar=:cl and numdoc=:nd;
IF SQLCA.SQLCode = -1 THEN
	MessageBox("SQL error", SQLCA.SQLErrText)
	Return -1
END IF

dw_b.SetItem(dw_b.Getrow(),'estado','2')
dw_b.SetItem(dw_b.Getrow(),'anulado',usuario)
dw_b.SetItem(dw_b.Getrow(),'fechaanulado',today())

update af_registro_cpo set estado = '1' 
where placa=:placa;
IF SQLCA.SQLCode = -1 THEN
	Rollback;
	msg = SQLCA.SQLErrText
	MessageBox("SQL error", msg)
	Return -1
END IF
if dw_b.Update() = -1 then
	Rollback;
	Return
end if

commit;
dw_lp.Retrieve()
Return 0

end event

type gb_2 from groupbox within w_af_baja
integer x = 41
integer y = 700
integer width = 5074
integer height = 840
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Activos dados de Baja"
end type

type pb_buscar from picturebutton within w_af_baja
event mousemove pbm_mousemove
string tag = "Buscar"
boolean visible = false
integer x = 4219
integer y = 92
integer width = 142
integer height = 124
integer taborder = 20
boolean bringtotop = true
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

event clicked;//openwithParm(w_af_bplaca,sle_1)
end event

type cbx_1 from checkbox within w_af_baja
integer x = 2546
integer y = 1632
integer width = 430
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
string text = "Imprimir Baja"
boolean checked = true
end type

type dw_cp from datawindow within w_af_baja
boolean visible = false
integer x = 2510
integer y = 1352
integer width = 718
integer height = 232
integer taborder = 40
string title = "none"
string dataobject = "dw_mvto_cpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

type dw_cb from datawindow within w_af_baja
boolean visible = false
integer x = 2560
integer y = 1068
integer width = 631
integer height = 216
integer taborder = 40
string title = "none"
string dataobject = "dw_mvto_cab_ff"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
GetChild('cod_flujo',idw_f)
idw_f.SetTransObject(SQLCA)
if idw_f.Retrieve('SB') = 0 then
	idw_f.InsertRow(0)
end if

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

