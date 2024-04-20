$PBExportHeader$w_af_devolucion.srw
forward
global type w_af_devolucion from w_center
end type
type pb_cerrar from picturebutton within w_af_devolucion
end type
type gb_1 from groupbox within w_af_devolucion
end type
type st_2 from statictext within w_af_devolucion
end type
type pb_1 from picturebutton within w_af_devolucion
end type
type dw_lp from datawindow within w_af_devolucion
end type
type dw_b from datawindow within w_af_devolucion
end type
type pb_anula from picturebutton within w_af_devolucion
end type
type gb_2 from groupbox within w_af_devolucion
end type
type pb_buscar from picturebutton within w_af_devolucion
end type
type dw_cb from datawindow within w_af_devolucion
end type
type dw_cp from datawindow within w_af_devolucion
end type
type st_3 from statictext within w_af_devolucion
end type
type dw_ter from datawindow within w_af_devolucion
end type
type dw_busca from datawindow within w_af_devolucion
end type
type sle_1 from singlelineedit within w_af_devolucion
end type
type st_1 from statictext within w_af_devolucion
end type
end forward

global type w_af_devolucion from w_center
string tag = "Ha realizado cambios. Desea guardarlos?"
integer width = 4274
integer height = 1904
string title = "Activos Fijos- Devoluciones"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_devo.ico"
boolean center = false
pb_cerrar pb_cerrar
gb_1 gb_1
st_2 st_2
pb_1 pb_1
dw_lp dw_lp
dw_b dw_b
pb_anula pb_anula
gb_2 gb_2
pb_buscar pb_buscar
dw_cb dw_cb
dw_cp dw_cp
st_3 st_3
dw_ter dw_ter
dw_busca dw_busca
sle_1 sle_1
st_1 st_1
end type
global w_af_devolucion w_af_devolucion

type variables
Datawindow dw_fuente 
DataWindowChild dwc_ccosto, idw_f
string codDocumento

end variables

forward prototypes
public function integer grabar ()
public function integer update_ori (string coddoc, string lugar, double numdoc, integer item, decimal cantidad)
end prototypes

public function integer grabar ();Return pb_grabar.Event clicked()

end function

public function integer update_ori (string coddoc, string lugar, double numdoc, integer item, decimal cantidad);double nd, it
dec atendido, devuelto, solicitado, valor
string cd,cl,codarticulo, msg
long f,i
uo_DataStore dw_ltr

select codarticulo,cantidad,atendido,coddoc_ori,clugar_ori,numdoc_ori,item_ori into :codarticulo,:solicitado,:atendido,:cd,:cl,:nd,:it 
from sum_mvto_cpo
where coddoc=:coddoc and clugar=:lugar and numdoc=:numdoc and item=:item;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("Error leyendo sum_mvto_cpo", msg)
	Return -1
elseif SQLCA.SQLCode = 100 THEN
	Rollback;
	MessageBox("Atención", 'No se encuentra el registro origen. Doc:'+string(numdoc)+' item:'+string(item))
	Return -1
END IF

if isNull(atendido) then atendido = 0
if atendido + cantidad > solicitado then
	Rollback;
	Messagebox('Aviso','La cantidad excede lo solicitado. Articulo: '+codarticulo)
	Return -1
end if
valor = round(atendido + cantidad ,2)
update sum_mvto_cpo set atendido = :valor // acumula Devuelto
where coddoc=:coddoc and clugar=:lugar and numdoc=:numdoc and item=:item;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("Error actualizando sum_mvto_cpo.atendido", msg)
	Return -1
END IF

// Lotes de Entrada
//dw_ltr = CREATE uo_DataStore
//dw_ltr.DataObject = 'dw_mvto_lote'
//dw_ltr.SetTransObject(SQLCA)
//dw_ltr.Retrieve(coddoc,clugar,numdoc)
//dw_ltr.SetFilter("item="+string(item))
//dw_ltr.Filter()
//
//for i = 1 to t1.pd.dw_l.RowCount()
//	f = dw_ltr.Find("lote='"+t1.pd.dw_l.GetItemString(i,'lote')+"'",1,dw_ltr.RowCount())
//	if f > 0 then
//		devuelto = dw_ltr.GetItemNumber(f,'devuelto')
//		if isNull(devuelto) then devuelto = 0
//		dw_ltr.SetItem(f,'devuelto',devuelto + t1.pd.dw_l.GetItemNumber(i,'cantidad'))
//	end if
//next
//
//if dw_ltr.Update() = -1 then
//	Rollback;
//	MessageBox("Error", "Error actualizando lotes de entrada.")
//	Return -1
//end if

// Orden de Compra
update sum_mvto_cpo set atendido=atendido - :cantidad
where coddoc=:cd and clugar=:cl and numdoc=:nd and item=:it;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("Error actulizando sum_mvto_cpo set atendido=atendido - :cantidad", msg)
	Return -1
END IF
select count(*) into :atendido from sum_mvto_cpo
where coddoc=:cd and clugar=:cl and numdoc=:nd and cantidad <> atendido;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("Error leyendo count(*) from sum_mvto_cpo", msg)
	Return -1
END IF
if atendido = 0 then
	update sum_mvto_cab set estado = '3'
	where coddoc=:cd and clugar=:cl and numdoc=:nd;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("Error actualizando sum_mvto_cab set estado = '3'", msg)
		Return -1
	END IF
else
	update sum_mvto_cab set estado = '1'
	where coddoc=:cd and clugar=:cl and numdoc=:nd;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("Error actualizando sum_mvto_cab set estado = '1'", msg)
		Return -1
	END IF
end if

select count(*) into :atendido from sum_mvto_cpo
where coddoc=:coddoc and clugar=:clugar and numdoc=:numdoc and cantidad <> atendido;
IF SQLCA.SQLCode = -1 THEN
	msg = SQLCA.SQLErrText
	Rollback;
	MessageBox("Error leyendo count(*) into :atendido from sum_mvto_cpo", msg)
	Return -1
END IF
if atendido = 0 then
	update sum_mvto_cab set estado = '3'
	where coddoc=:coddoc and clugar=:clugar and numdoc=:numdoc;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("Error actualizando sum_mvto_cab set estado = '3'", msg)
		Return -1
	END IF
elseif atendido > 0 then
	update sum_mvto_cab set estado = '1'
	where coddoc=:coddoc and clugar=:clugar and numdoc=:numdoc;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("Error actualizando sum_mvto_cab set estado = '1'", msg)
		Return -1
	END IF
end if
Return 0

end function

on w_af_devolucion.create
int iCurrent
call super::create
this.pb_cerrar=create pb_cerrar
this.gb_1=create gb_1
this.st_2=create st_2
this.pb_1=create pb_1
this.dw_lp=create dw_lp
this.dw_b=create dw_b
this.pb_anula=create pb_anula
this.gb_2=create gb_2
this.pb_buscar=create pb_buscar
this.dw_cb=create dw_cb
this.dw_cp=create dw_cp
this.st_3=create st_3
this.dw_ter=create dw_ter
this.dw_busca=create dw_busca
this.sle_1=create sle_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_cerrar
this.Control[iCurrent+2]=this.gb_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.dw_lp
this.Control[iCurrent+6]=this.dw_b
this.Control[iCurrent+7]=this.pb_anula
this.Control[iCurrent+8]=this.gb_2
this.Control[iCurrent+9]=this.pb_buscar
this.Control[iCurrent+10]=this.dw_cb
this.Control[iCurrent+11]=this.dw_cp
this.Control[iCurrent+12]=this.st_3
this.Control[iCurrent+13]=this.dw_ter
this.Control[iCurrent+14]=this.dw_busca
this.Control[iCurrent+15]=this.sle_1
this.Control[iCurrent+16]=this.st_1
end on

on w_af_devolucion.destroy
call super::destroy
destroy(this.pb_cerrar)
destroy(this.gb_1)
destroy(this.st_2)
destroy(this.pb_1)
destroy(this.dw_lp)
destroy(this.dw_b)
destroy(this.pb_anula)
destroy(this.gb_2)
destroy(this.pb_buscar)
destroy(this.dw_cb)
destroy(this.dw_cp)
destroy(this.st_3)
destroy(this.dw_ter)
destroy(this.dw_busca)
destroy(this.sle_1)
destroy(this.st_1)
end on

event open;dw_b.Retrieve('SD')

end event

event closequery;call super::closequery;if cambio then
	if messageBox('Aviso','El documento nuevo no ha sido guardado. Desea continuar?',QUESTION!,YESNO!) = 2 then
		Return -1
	end if
end if

end event

event resize;call super::resize;//
end event

type pb_grabar from w_center`pb_grabar within w_af_devolucion
integer x = 2139
integer y = 1604
integer taborder = 100
boolean originalsize = false
string powertiptext = "&Guardar"
end type

event pb_grabar::clicked;long fila, f, ff, fa, i, itr
double nd, cprom, ndr
string placa, codalm, msg, codarticulo, cdr, clr
fila = dw_b.Find("estado='N'",1,dw_b.RowCount())
if fila = 0 then
	MessageBox('Atención','No ha definido ningún activo para ser devuelto')
	Return 0
end if
if MessageBox('Atención','Desea devolver los activos con estado NUEVO en la grilla inferior?',QUESTION!,YESNO!) = 2 then Return -1
fila = dw_b.Find("estado='N'",1,dw_b.RowCount())
do while fila > 0
	placa = dw_b.GetItemString(fila,'placa')
	fa = dw_lp.Find("placa='"+placa+"'",1,dw_lp.RowCount())
	if fa > 0 then
		dw_lp.SetItem(f,'estado','2')
	else
		MessageBox('Atención','El activo con placa '+placa+' no se encontró para establecerlo inactivo')
		Return -1
	end if
	codalm = dw_lp.GetItemString(fa,'codalmacen')
	if isNull(codalm) or codalm = '' then
		codalm = dw_lp.GetItemString(fa,'codalmacen_kar')
	end if
	f = dw_cb.Find("codalmacen='"+codalm+"'",1,dw_cb.RowCount())
	if f = 0 then
		nd = f_trae_ndoc('SD',clugar,'Bajas')
		if nd < 1 then Return -1
		f = dw_cb.InsertRow(0)
		dw_cb.SetItem(f,'coddoc','SD')
		dw_cb.SetItem(f,'clugar',clugar)
		dw_cb.SetItem(f,'numdoc',nd)
		dw_cb.SetItem(f,'codalmacen',codalm)
		dw_cb.SetItem(f,'fecha',dw_b.GetItemDateTime(fila,'fecha'))
		dw_cb.SetItem(f,'tipodoc',dw_ter.GetItemString(1,1))
		dw_cb.SetItem(f,'documento',dw_ter.GetItemString(1,2))
		dw_cb.SetItem(f,'estado','1')
		dw_cb.SetItem(f,'usuario',usuario)
	end if
	ff = dw_cp.InsertRow(0)
	dw_cp.SetItem(ff,'coddoc',dw_cb.GetItemString(f,'coddoc'))
	dw_cp.SetItem(ff,'clugar',dw_cb.GetItemString(f,'clugar'))
	dw_cp.SetItem(ff,'numdoc',dw_cb.GetItemNumber(f,'numdoc'))
	dw_cp.SetItem(ff,'item',long(dw_cp.Describe("Evaluate('max(item)',0)")) + 1)
	dw_cp.SetItem(ff,'coddoc_ori',dw_lp.GetItemString(fa,'coddocref'))
	dw_cp.SetItem(ff,'clugar_ori',dw_lp.GetItemString(fa,'clugarref'))
	dw_cp.SetItem(ff,'numdoc_ori',dw_lp.GetItemNumber(fa,'numdocref'))
	dw_cp.SetItem(ff,'item_ori',dw_lp.GetItemNumber(fa,'itemref'))
	dw_cp.SetItem(ff,'codarticulo',dw_lp.GetItemString(fa,'codarticulo'))
	dw_cp.SetItem(ff,'cantidad',1)
	dw_cp.SetItem(ff,'codarticulo',dw_lp.GetItemString(fa,'codarticulo'))
	dw_cp.SetItem(ff,'codgenerico',dw_lp.GetItemString(fa,'codgenerico'))
	dw_cp.SetItem(ff,'justificacion',placa)
	dw_cp.SetItem(ff,'estado','1')
	select costoprom into :cprom from sum_kardex where codalmacen=:codalm and codarticulo=:codarticulo;
	IF SQLCA.SQLCode = -1 THEN
		Rollback;
		msg = SQLCA.SQLErrText
		MessageBox("SQL error", msg)
		Return -1
	END IF
	dw_cp.SetItem(ff,'valor_unit',cprom)	
	
	dw_b.SetItem(fila,'coddoc',dw_cp.GetItemString(ff,'coddoc'))
	dw_b.SetItem(fila,'clugar',dw_cp.GetItemString(ff,'clugar'))
	dw_b.SetItem(fila,'numdoc',dw_cp.GetItemNumber(ff,'numdoc'))
	dw_b.SetItem(fila,'item_baja',dw_cp.GetItemNumber(ff,'item'))
	cdr = dw_lp.GetItemString(fa,'coddocref')
	clr = dw_lp.GetItemString(fa,'clugarref')
	ndr = dw_lp.GetItemNumber(fa,'numdocref')
	itr = dw_lp.GetItemNumber(fa,'itemref')
	update sum_kardex_mov set placa = placa - 1
	where coddocref=:cdr and clugarref=:clr and numdocref=:ndr and itemref=:itr;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("Error SQL", "Error actualizando número de placas registras sum_kardex_mov " +msg)
		Return -1
	END IF
	IF SQLCA.SQLnRows = 0 THEN
		Rollback;
		MessageBox("Error SQL", "No se actualizó ningun registro en sum_kardex_mov para número de placas")
		Return -1
	END IF
	if fila + 1 > dw_b.RowCount() then EXIT
	fila = dw_b.Find("estado='N'",fila + 1,dw_b.RowCount())
loop
if dw_cb.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
if dw_cp.Update(TRUE,FALSE) = -1 then
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
		if update_ori(dw_cp.GetItemString(i,'coddoc_ori'),dw_cp.GetItemString(i,'clugar_ori'),dw_cp.GetItemNumber(i,'numdoc_ori'),dw_cp.GetItemNumber(i,'item_ori'),dw_cp.GetItemNumber(i,'cantidad')) = -1 then
			Rollback;
			Return -1
		end if
	end if
next
fila = dw_b.Find("estado='N'",1,dw_b.RowCount())
do while fila > 0 
	dw_b.SetItem(fila,'estado','1')
	fila = dw_b.Find("estado='N'",1,dw_b.RowCount())
loop
if dw_b.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if
if dw_lp.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return -1
end if

commit;
dw_b.ResetUpdate()
dw_lp.ResetUpdate()
dw_cb.ResetUpdate()
dw_cp.ResetUpdate()
msg = ''
for i = 1 to dw_cb.RowCount()
	msg = msg + string(dw_cb.GetItemNumber(i,'numdoc')) +'  '
next
if dw_cb.RowCount() = 1 then
	MessageBox('Atención','Se creó la Devolución (suministros) '+msg)
else
	MessageBox('Atención','Se crearon Devoluciones (suministros) '+msg)
end if
dw_cp.Reset()
dw_cb.Reset()
dw_lp.Retrieve(dw_ter.GetItemString(1,1),dw_ter.GetItemString(1,2))

Return 0

end event

type pb_cerrar from picturebutton within w_af_devolucion
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 1701
integer y = 1604
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

type gb_1 from groupbox within w_af_devolucion
integer x = 37
integer y = 220
integer width = 3237
integer height = 592
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Activos adquiridos al tercero"
end type

type st_2 from statictext within w_af_devolucion
integer x = 3314
integer y = 264
integer width = 882
integer height = 532
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "Seleccionelos activos fijos que desea Devolver. Presione el botón Devolver activos seleccionados para llevarlos a la grilla inferior (de activos devueltos) y guarde los cambios para que tenga efecto la operación."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_af_devolucion
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 1989
integer y = 1604
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
string picturename = "puerta.gif"
string disabledname = "d_puerta.gif"
alignment htextalign = left!
string powertiptext = "Devolver Activos Seleccionados"
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
	end if
	dw_lp.SetItem(fila,'estado','2')
	dw_lp.SetItem(fila,'selec',0)
	fila = dw_lp.Find("selec = 1",1,dw_lp.RowCount())
loop

end event

type dw_lp from datawindow within w_af_devolucion
integer x = 82
integer y = 288
integer width = 3150
integer height = 500
integer taborder = 130
boolean bringtotop = true
string title = "none"
string dataobject = "dw_activos_x_proveedor"
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

type dw_b from datawindow within w_af_devolucion
integer x = 82
integer y = 872
integer width = 4041
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

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
st_dw.solobuscar = TRUE
openwithparm(w_funcion_dw,st_dw)

end event

type pb_anula from picturebutton within w_af_devolucion
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 1847
integer y = 1604
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
string powertiptext = "Anular Devolución resaltada"
end type

event clicked;long fila, i, ano, mes, item, f
string placa, msg, cd, cl, alm, art
double nd, ndr

if dw_b.RowCount() = 0 then Return 0
if dw_b.GetItemString(dw_b.GetRow(),'estado') = '2' then
	MessageBox('Atención','La devolución ya ha sido anulada')
	Return 0
end if

if MessageBox('Atención','Desea anular la devolución '+string(dw_b.GetItemNumber(dw_b.GetRow(),'numdoc'))+' y los activos devueltos en el mismo documento?. ',QUESTION!,YESNO!) = 2 then Return 0 
cd = dw_b.GetItemString(dw_b.GetRow(),'coddoc')
cl = dw_b.GetItemString(dw_b.GetRow(),'clugar')
nd = dw_b.GetItemNumber(dw_b.GetRow(),'numdoc')
dw_cb.Retrieve(cd,cl,nd)
dw_cp.Retrieve(cd,cl,nd)

if f_kardexsalanula(cd, cl, nd, dw_cb.GetItemString(1,'codalmacen')) = -1 then
	rollback;
	Return -1
end if
for i = 1 to dw_cp.RowCount()
	dw_cp.ScrolltoRow(i)
	if update_ori(dw_cp.GetItemString(i,'coddoc_ori'),dw_cp.GetItemString(i,'clugar_ori'),dw_cp.GetItemNumber(i,'numdoc_ori'),dw_cp.GetItemNumber(i,'item_ori'),dw_cp.GetItemNumber(i,'cantidad')* -1) = -1 then
		Rollback;
		Return -1
	end if
next

f = dw_b.Find("numdoc="+string(nd),1,dw_b.RowCount())
Do while f > 0 
	placa = dw_b.GetItemString(f,'placa')
	select codalmacen_kar, codarti_kar, ano_kar, mes_kar, item_kar into :alm, :art, :ano, :mes, :item from af_registro_cpo
	where placa=:placa;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("Error SQL", "Error actualizando número de placas registras sum_kardex_mov " +msg)
		Return -1
	END IF
	update sum_kardex_mov set placa = placa + 1
	where codalmacen=:alm and codarti=:art and ano=:ano and mes=:mes and item=:item;
	IF SQLCA.SQLCode = -1 THEN
		msg = SQLCA.SQLErrText
		Rollback;
		MessageBox("Error SQL", "Error actualizando número de placas registras sum_kardex_mov " +msg)
		Return -1
	END IF
	IF SQLCA.SQLnRows = 0 THEN
		Rollback;
		MessageBox("Error SQL", "No se actualizó ningun registro en sum_kardex_mov para número de placas")
		Return -1
	END IF
	update af_registro_cpo set estado = '1' 
	where placa=:placa;
	IF SQLCA.SQLCode = -1 THEN
		Rollback;
		msg = SQLCA.SQLErrText
		MessageBox("SQL error", msg)
		Return -1
	END IF
	dw_b.SetItem(f,'estado','2')
	if f+1 > dw_b.RowCount() then EXIT
	f = dw_b.Find("numdoc="+string(nd), f + 1, dw_b.RowCount())
Loop

dw_cb.SetItem(1,'Estado','2')

if dw_b.Update(TRUE,FALSE) = -1 then
	Rollback;
	Return
end if
if dw_cb.Update(TRUE,FALSE) = -1 then
	rollback;
	Return -1
end if

commit;
if not isNull(dw_ter.GetItemString(1,2)) then
	dw_lp.Retrieve(dw_ter.GetItemString(1,1),dw_ter.GetItemString(1,2))
end if
dw_b.ResetUpdate()
dw_cb.ResetUpdate()
Return 0

end event

type gb_2 from groupbox within w_af_devolucion
integer x = 32
integer y = 812
integer width = 4155
integer height = 788
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Activos Devueltos"
end type

type pb_buscar from picturebutton within w_af_devolucion
event mousemove pbm_mousemove
string tag = "Buscar"
boolean visible = false
integer x = 4059
integer y = 144
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

type dw_cb from datawindow within w_af_devolucion
boolean visible = false
integer x = 4261
integer y = 288
integer width = 631
integer height = 216
integer taborder = 40
boolean bringtotop = true
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

type dw_cp from datawindow within w_af_devolucion
boolean visible = false
integer x = 4270
integer y = 524
integer width = 718
integer height = 232
integer taborder = 40
boolean bringtotop = true
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

type st_3 from statictext within w_af_devolucion
integer x = 27
integer y = 20
integer width = 343
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
string text = "Proveedor"
boolean focusrectangle = false
end type

type dw_ter from datawindow within w_af_devolucion
integer x = 32
integer y = 80
integer width = 3154
integer height = 140
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_tercero_gral"
boolean border = false
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
InsertRow(0)

end event

event doubleclicked;g_tercerodesde = 1
openwithparm(w_buscater,dw_ter)
setcolumn('documento')
event itemchanged(1,object.documento,getitemstring(1,'documento'))

end event

event itemchanged;accepttext()
string doc,tdoc
tdoc=getitemstring(1,"tipodoc")
doc=getitemstring(1,"documento")
string snulo
setnull(snulo)
if dwo.name="tipodoc" and doc <> "" then
	setitem(1,"documento",snulo)
	setitem(1,"nombre1",snulo)
	setitem(1,"nombre2",snulo)
	setitem(1,"apellido1",snulo)
	setitem(1,"apellido2",snulo)
	setitem(1,'tel1',snulo)
	setitem(1,'persona',snulo)
	return
end if
if dwo.name="documento" and doc = "" then 
	setitem(1,'nombre1',snulo)
	setitem(1,'persona',snulo)
end if
if dwo.name="documento" and doc <> "" then
	if retrieve(tdoc,doc)=0 then
		insertrow(1)
		setitem(1,1,tdoc)
		setitem(1,2,doc)
		messagebox("Atención",'Tercero no existe')
	else
		dw_lp.Retrieve(tdoc,doc)
	end if
end if

end event

type dw_busca from datawindow within w_af_devolucion
boolean visible = false
integer x = 4256
integer y = 120
integer width = 686
integer height = 160
integer taborder = 20
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_busca_ter_placa"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

type sle_1 from singlelineedit within w_af_devolucion
integer x = 3269
integer y = 112
integer width = 379
integer height = 80
integer taborder = 30
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

event modified;if trim(sle_1.Text) = '' then Return 
string td, doc
if dw_busca.Retrieve(sle_1.Text) > 0 then
	td = dw_busca.GetItemString(dw_busca.GetRow(),'tipodoc')
	doc = dw_busca.GetItemString(dw_busca.GetRow(),'documento')
	if not isNull(td) and not isNull(doc) then
		dw_ter.SetItem(1,'tipodoc',td)
		dw_ter.SetItem(1,'documento',doc)
		dw_ter.Event itemchanged(1,dw_ter.object.documento,doc)
	end if
else
	MessageBox('Atención','No se encontró tercero para el activo dado')
end if

end event

type st_1 from statictext within w_af_devolucion
integer x = 3269
integer y = 52
integer width = 649
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar proveedor del activo:"
boolean focusrectangle = false
end type

