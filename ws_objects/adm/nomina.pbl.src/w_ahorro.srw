$PBExportHeader$w_ahorro.srw
forward
global type w_ahorro from w_center
end type
type dw_cab from datawindow within w_ahorro
end type
type dw_cpo from datawindow within w_ahorro
end type
type pb_cerrar from picturebutton within w_ahorro
end type
type pb_2 from picturebutton within w_ahorro
end type
type pb_delnew from picturebutton within w_ahorro
end type
type pb_nuevo from picturebutton within w_ahorro
end type
type dw_cooperativa from datawindow within w_ahorro
end type
type st_1 from statictext within w_ahorro
end type
type st_2 from statictext within w_ahorro
end type
type pb_1 from picturebutton within w_ahorro
end type
type pb_3 from picturebutton within w_ahorro
end type
type pb_4 from picturebutton within w_ahorro
end type
type gb_1 from groupbox within w_ahorro
end type
type gb_2 from groupbox within w_ahorro
end type
end forward

global type w_ahorro from w_center
string tag = "Realizó cambios. Desea guardarlos?"
integer width = 4032
integer height = 1728
string title = "Ahorros"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
string icon = "ribon_recaudo.ico"
boolean center = false
dw_cab dw_cab
dw_cpo dw_cpo
pb_cerrar pb_cerrar
pb_2 pb_2
pb_delnew pb_delnew
pb_nuevo pb_nuevo
dw_cooperativa dw_cooperativa
st_1 st_1
st_2 st_2
pb_1 pb_1
pb_3 pb_3
pb_4 pb_4
gb_1 gb_1
gb_2 gb_2
end type
global w_ahorro w_ahorro

type variables
long nuevo
string codDocumento,estado
datawindowchild dwc_ter,dwc_tercer

end variables

forward prototypes
public function integer grabar ()
end prototypes

public function integer grabar ();Return pb_grabar.TriggerEvent(clicked!)

end function

on w_ahorro.create
int iCurrent
call super::create
this.dw_cab=create dw_cab
this.dw_cpo=create dw_cpo
this.pb_cerrar=create pb_cerrar
this.pb_2=create pb_2
this.pb_delnew=create pb_delnew
this.pb_nuevo=create pb_nuevo
this.dw_cooperativa=create dw_cooperativa
this.st_1=create st_1
this.st_2=create st_2
this.pb_1=create pb_1
this.pb_3=create pb_3
this.pb_4=create pb_4
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_cab
this.Control[iCurrent+2]=this.dw_cpo
this.Control[iCurrent+3]=this.pb_cerrar
this.Control[iCurrent+4]=this.pb_2
this.Control[iCurrent+5]=this.pb_delnew
this.Control[iCurrent+6]=this.pb_nuevo
this.Control[iCurrent+7]=this.dw_cooperativa
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.pb_1
this.Control[iCurrent+11]=this.pb_3
this.Control[iCurrent+12]=this.pb_4
this.Control[iCurrent+13]=this.gb_1
this.Control[iCurrent+14]=this.gb_2
end on

on w_ahorro.destroy
call super::destroy
destroy(this.dw_cab)
destroy(this.dw_cpo)
destroy(this.pb_cerrar)
destroy(this.pb_2)
destroy(this.pb_delnew)
destroy(this.pb_nuevo)
destroy(this.dw_cooperativa)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.pb_1)
destroy(this.pb_3)
destroy(this.pb_4)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;codDocumento = 'NA' // AHORRO

dw_cooperativa.GetChild('documento',dwc_ter)
dwc_ter.SetTransObject(SQLCA)
dwc_ter.Retrieve()
dw_cooperativa.SetTransObject(SQLCA)
dw_cooperativa.InsertRow(0)
dw_cab.SetTransObject(SQLCA)
dw_cpo.SetTransObject(SQLCA)

end event

type pb_grabar from w_center`pb_grabar within w_ahorro
integer x = 1966
integer y = 1472
integer taborder = 80
string powertiptext = "Guardar"
end type

event pb_grabar::clicked;call super::clicked;long i, numdoc, inicial, final, fila
if dw_cab.RowCount() = 0 then Return 0
if nuevo > 0 then 
	i = nuevo
else
	i = dw_cab.GetRow()
end if
//for i = 1 to dw_cab.RowCount()
	if isNull(dw_cab.GetItemString(i,'documento')) or dw_cab.GetItemString(i,'documento') = '' then
		messageBox('Error','Debe seleccionar el empleado en el documento ' + string(dw_cab.GetItemNumber(i,'num_ahorro')))
		Return -1
	end if
	if isNull(dw_cab.GetItemString(i,'cod_concep'))then
		messageBox('Error','Debe seleccionar el concepto')
		Return -1
	end if
	if dw_cab.GetItemString(i,'tipo') = '1' then
//		if isNull(dw_cab.GetItemNumber(i,'porcensal')) or dw_cab.GetItemNumber(i,'porcensal') = 0 then
//			MessageBox('Atención','Debe proporcionar el porcentaje a deducir')
//			Return -1
//		end if
	else
		if isNull(dw_cab.GetItemNumber(i,'vfijo')) or dw_cab.GetItemNumber(i,'vfijo') = 0 then
			MessageBox('Atención','Debe proporcionar el monto de la cuota fija')
			Return -1
		end if
	end if
//next
fila = dw_cab.GetRow()
if nuevo > 0 then
	fila = nuevo
	if isNull(dw_cab.GetItemString(nuevo,'documento')) then
		messageBox('Error','Debe seleccionar un empleado')
		Return -1
	end if
	numdoc = f_trae_ndoc(codDocumento,clugar,'AHORROS')
	if numdoc = -1 then Return -1
	dw_cab.setItem(nuevo,'num_ahorro', numdoc)
	estado = '1'
end if
dw_cab.setItem(fila,'estado', estado)
if dw_cab.Update() = -1 then
	Rollback;
	Return -1
end if
Cambio = FALSE
commit;
nuevo = 0
Return 0

end event

type dw_cab from datawindow within w_ahorro
integer x = 101
integer y = 244
integer width = 3776
integer height = 508
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ahorrocab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_cpo.Reset()
if this.RowCount() < 1 or currentrow = 0 then Return
dw_cpo.Retrieve(this.GetItemNumber(this.GetRow(),'num_ahorro'))

end event

event clicked;if row = 0 then Return
if row <> getRow() then
	ScrolltoRow(row)
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)
end event

event itemchanged;if getColumnName() = "documento" then
	string n1,n2,a1,a2,rs,td,doc,per
	td = GetItemString(GetRow(),'tipodoc')
	if isNull(data) then
		doc = GetItemString(GetRow(),'documento')
	else
		doc = data
	end if
	select nombre1,nombre2,apellido1,apellido2,razon_social,persona into :n1,:n2,:a1,:a2,:rs,:per
	from terceros where tipodoc=:td and documento=:doc;
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return 1
	elseif SQLCA.SQLCode = 100 THEN
		MessageBox('Atención','El tercero no existe.')
		Return -1
	END IF
	SetItem(GetRow(),'nombre1',n1)
	SetItem(GetRow(),'nombre2',n2)
	SetItem(GetRow(),'apellido1',a1)
	SetItem(GetRow(),'apellido2',a2)
	SetItem(GetRow(),'razon_social',rs)
end if

if getColumnName() = "nit_dem" then
	td = GetItemString(GetRow(),'doc_tercero_dem')
	if isNull(data) then
		doc = GetItemString(GetRow(),'nit_dem')
	else
		doc = data
	end if
	select nombre1,nombre2,apellido1,apellido2,razon_social,persona into :n1,:n2,:a1,:a2,:rs,:per
	from terceros where tipodoc=:td and documento=:doc;
	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error", SQLCA.SQLErrText)
		Return 1
	elseif SQLCA.SQLCode = 100 THEN
		MessageBox('Atención','El tercero no existe.')
		Return -1
	END IF
	SetItem(GetRow(),'nombre1d',n1)
	SetItem(GetRow(),'nombre2d',n2)
	SetItem(GetRow(),'apellido1d',a1)
	SetItem(GetRow(),'apellido2d',a2)
	SetItem(GetRow(),'razon_sociald',rs)
end if

end event

event constructor;getchild('cod_concep',dwc_tercer)
dwc_tercer.SetTransObject(SQLCA)
end event

type dw_cpo from datawindow within w_ahorro
integer x = 110
integer y = 868
integer width = 3035
integer height = 512
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ahorrocpo"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_cerrar from picturebutton within w_ahorro
event mousemove pbm_mousemove
string tag = "&Cerrar"
integer x = 1330
integer y = 1472
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
string text = "                $C"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
string powertiptext = "&Cerrar"
end type

event clicked;close(parent)
end event

type pb_2 from picturebutton within w_ahorro
event mousemove pbm_mousemove
string tag = "&Anular Ahorro"
integer x = 1486
integer y = 1472
integer width = 146
integer height = 128
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $A"
boolean originalsize = true
string picturename = "anulardoc.gif"
string disabledname = "d_anulardoc.gif"
string powertiptext = "&Anular documento"
end type

event clicked;if dw_cab.RowCount() < 1 then Return

if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '1' then
	messagebox('Error','El Ahorro ya ha sido cerrado')
	Return
end if

if dw_cpo.Find("num_nomina > 0",1,dw_cpo.RowCount()) > 0 then
	messagebox('Error','Se han cancelado cuotas para el Ahorro.')
	Return
end if
if dw_cab.GetItemNumber(dw_cab.GetRow(),'nuevo') = 1 then
	dw_cab.DeleteRow(dw_cab.GetRow())
	dw_cab.TriggerEvent(rowFocuschanged!)
	Return
end if
if MessageBox('Atención','Está seguro de anular el documento seleccionado?',QUESTION!,YESNO!,2) = 2 then Return 0

dw_cab.SetItem(dw_cab.GetRow(),'estado','2')
dw_cab.SetItem(dw_cab.GetRow(),'usuario',usuario)
dw_cab.SetItem(dw_cab.GetRow(),'fecha_anulada',today())
if dw_cab.Update() = -1 then
	rollback;
end if
commit;

end event

type pb_delnew from picturebutton within w_ahorro
event mousemove pbm_mousemove
string tag = "Cerrar Documento Ahorro"
integer x = 1646
integer y = 1472
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
string picturename = "abrir2.gif"
alignment htextalign = left!
string powertiptext = "Desactivar Documento Ahorro"
end type

event clicked;if dw_cab.RowCount() > 0 then
	if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '1' then
		if messageBox('Aviso','Se desactivará el documento y no se tendrá en cuenta para la Nómina. Desea continuar?',QUESTION!,YESNO!,2) = 1 then
			estado = '3'
			cambio = TRUE
			pb_grabar.PostEvent(clicked!)
		end if
	end if
end if

end event

type pb_nuevo from picturebutton within w_ahorro
event mousemove pbm_mousemove
string tag = "Nuevo &Documento"
integer x = 1879
integer y = 52
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
string text = "                $d"
boolean originalsize = true
string picturename = "insertar.GIF"
string powertiptext = "Nuevo &Documento"
end type

event clicked;long fila, numdoc
if nuevo > 0 then
	Messagebox('Atención','Existe un documento sin grabar')
	Return -1
end if

fila = dw_cab.InsertRow(1)
dw_cab.setItem(fila,'num_ahorro', numdoc)
dw_cab.setItem(fila,'fecha', today())
dw_cab.setItem(fila,'doc_tercero', dwc_ter.GetItemString(dwc_ter.GetRow(),'tipodoc'))
dw_cab.setItem(fila,'nit', dwc_ter.GetItemString(dwc_ter.GetRow(),'documento'))
dw_cab.setItem(fila,'estado', '0')
dw_cab.setItem(fila,'nuevo', 1)
dw_cab.scrolltoRow(fila)
nuevo = fila
cambio = TRUE
dw_cpo.Reset()

end event

type dw_cooperativa from datawindow within w_ahorro
integer x = 50
integer y = 88
integer width = 1673
integer height = 76
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ahorros"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string doc
doc = data
if nuevo > 0 then
	if MessageBox('Atención','No ha guardado el documento. Desea continuar',QUESTION!,YESNO!,2) = 2 then 
		SetItem(1,'documento',doc)
		Return 2
	end if
end if
nuevo = 0 
dw_cab.Reset()
dw_cab.AcceptText()
dw_cab.Retrieve(dwc_ter.GetItemString(dwc_ter.GetRow(),'tipodoc'),dwc_ter.GetItemString(dwc_ter.GetRow(),'documento'))
dwc_tercer.retrieve(doc)

end event

type st_1 from statictext within w_ahorro
integer x = 50
integer y = 20
integer width = 375
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ahorro"
boolean focusrectangle = false
end type

type st_2 from statictext within w_ahorro
integer x = 3223
integer y = 820
integer width = 713
integer height = 572
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "Seleccionando la cooperativa, se visualizan los datos de los ahorros programados y sus respectivas cuotas o aportes pagados. Podrá, además, verificarse la nómina en la que fué descontada y crear nuevos ahorros de cuota Fija o Porcentaje del sueldo."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_ahorro
event mousemove pbm_mousemove
string tag = "&Anular Ahorro"
integer x = 2030
integer y = 52
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
string text = "                $B"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "&Borrar registro nuevo"
end type

event clicked;if dw_cab.RowCount() < 1 then Return

if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '1' then
	messagebox('Error','El Ahorro ya ha sido cerrado')
	Return
end if

if dw_cab.GetItemNumber(dw_cab.GetRow(),'nuevo') = 1 then
	dw_cab.DeleteRow(dw_cab.GetRow())
	dw_cab.TriggerEvent(rowFocuschanged!)
	Return
	nuevo = 0
	cambio = FALSE
end if

end event

type pb_3 from picturebutton within w_ahorro
event mousemove pbm_mousemove
string tag = "Nuevo &Documento"
integer x = 2181
integer y = 52
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
string text = "                $E"
boolean originalsize = true
string picturename = "medico.gif"
string powertiptext = "Buscar &Empleado"
end type

event clicked;if dw_cab.RowCount() = 0 then Return
string vnul
if dw_cab.GetItemString(dw_cab.GetRow(),'estado') =  '0' then
	setNull(vnul)
	if nuevo = 0 then Return
	g_tercerodesde=12
	openwithparm(w_buscater,dw_cab)
	if dw_cab.GetItemString(dw_cab.GetRow(),'persona') = "J" then 
		messageBox("Error","Solo personas Naturales")
		dw_cab.SetItem(dw_cab.GetRow(),'tipodoc',vnul)
		dw_cab.SetItem(dw_cab.GetRow(),'documento',vnul)
		Return
	end if
else
	MessageBox('Aviso','Solo para documentos nuevos')
end if

end event

type pb_4 from picturebutton within w_ahorro
event mousemove pbm_mousemove
string tag = "Cerrar Documento Ahorro"
integer x = 1810
integer y = 1472
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
string picturename = "cerrar.gif"
alignment htextalign = left!
string powertiptext = "Activar Documento Ahorro"
end type

event clicked;if dw_cab.RowCount() > 0 then
	if dw_cab.GetItemString(dw_cab.GetRow(),'estado') = '3' then
		if messageBox('Aviso','Se activará el documento y se tendrá en cuenta para la Nómina. Desea continuar?',QUESTION!,YESNO!,2) = 1 then
			estado = '1'
			cambio = TRUE
			pb_grabar.PostEvent(clicked!)
		end if
	end if
end if

end event

type gb_1 from groupbox within w_ahorro
integer x = 50
integer y = 796
integer width = 3127
integer height = 636
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Aportes"
end type

type gb_2 from groupbox within w_ahorro
integer x = 50
integer y = 184
integer width = 3877
integer height = 604
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ahorros"
end type

