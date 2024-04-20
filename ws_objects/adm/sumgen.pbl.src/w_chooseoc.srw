$PBExportHeader$w_chooseoc.srw
$PBExportComments$Escoger Orden de Compra
forward
global type w_chooseoc from window
end type
type st_1 from statictext within w_chooseoc
end type
type dw_almfuente from datawindow within w_chooseoc
end type
type pb_2 from picturebutton within w_chooseoc
end type
type pb_1 from picturebutton within w_chooseoc
end type
type dw_occpo from datawindow within w_chooseoc
end type
type dw_occab from datawindow within w_chooseoc
end type
type gb_1 from groupbox within w_chooseoc
end type
type gb_2 from groupbox within w_chooseoc
end type
end forward

global type w_chooseoc from window
integer width = 2871
integer height = 1540
boolean titlebar = true
string title = "Ordenes de Compra"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "contrato.ico"
boolean center = true
st_1 st_1
dw_almfuente dw_almfuente
pb_2 pb_2
pb_1 pb_1
dw_occpo dw_occpo
dw_occab dw_occab
gb_1 gb_1
gb_2 gb_2
end type
global w_chooseoc w_chooseoc

type variables
Datawindowchild dwc_almfuente
string codDocumento, codmodulo
st_interfaz st_parm

end variables

on w_chooseoc.create
this.st_1=create st_1
this.dw_almfuente=create dw_almfuente
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_occpo=create dw_occpo
this.dw_occab=create dw_occab
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.st_1,&
this.dw_almfuente,&
this.pb_2,&
this.pb_1,&
this.dw_occpo,&
this.dw_occab,&
this.gb_1,&
this.gb_2}
end on

on w_chooseoc.destroy
destroy(this.st_1)
destroy(this.dw_almfuente)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_occpo)
destroy(this.dw_occab)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;string varnul
codDocumento = 'OC'
st_parm = Message.PowerObjectParm

dw_occab.SetTransObject(SQLCA)
dw_occab.SetFilter(st_parm.filtro)
dw_occab.Filter()

dw_almfuente.GetChild('descripcion', dwc_almfuente)
dwc_almfuente.SetTransObject(SQLCA)
dwc_almfuente.SetFilter("principal='1'")
dwc_almfuente.Filter()
if dwc_almfuente.Retrieve('%','%') = 0 then
	messageBox('Aviso','El usuario ' + usuario + ' no tiene ningun almacen a cargo')
	dwc_almfuente.InsertRow(0)
end if
dw_almfuente.SetTransObject(SQLCA)
dw_almfuente.InsertRow(0)
setnull(varnul)
dw_almfuente.SetItem(1,'codalmacen',varnul)

if st_parm.codmod = 'PDIOCPR' or st_parm.codmod = 'PDIOCSCT' then
	
else // Por definir
	st_1.Text = st_parm.dw_cab.GetItemString(st_parm.dw_cab.GetRow(),'compute_1')
end if

end event

type st_1 from statictext within w_chooseoc
integer x = 1294
integer y = 60
integer width = 1298
integer height = 56
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

type dw_almfuente from datawindow within w_chooseoc
event retornar ( )
integer x = 87
integer y = 44
integer width = 1138
integer height = 72
integer taborder = 10
string title = "none"
string dataobject = "dw_ext_almacen"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;AcceptText()
dw_occab.Reset()
dw_occpo.Reset()
dw_occab.Retrieve(GetItemString(1,'codalmacen'),'OC')

end event

type pb_2 from picturebutton within w_chooseoc
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 1239
integer y = 1312
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
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cerrar"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_chooseoc
event mousemove pbm_mousemove
string tag = "Llevar &Orden de Compra"
integer x = 1390
integer y = 1312
integer width = 151
integer height = 132
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "               &O"
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
string powertiptext = "Llevar &Orden de Compra"
end type

event clicked;string cd, cl, td, ter
long nd, fila, i
decimal monto

if dw_occab.RowCount() = 0 then Return
SetPointer(HourGlass!)
cd = dw_occab.GetItemString(dw_occab.getRow(),'coddoc')
cl = dw_occab.GetItemString(dw_occab.getRow(),'cLugar')
nd = dw_occab.GetItemNumber(dw_occab.getRow(),'numdoc')
td = dw_occab.GetItemString(dw_occab.getRow(),'tipodoc')
ter = dw_occab.GetItemString(dw_occab.getRow(),'documento')

if st_parm.codmod = 'PDIOCPR' or st_parm.codmod = 'PDIOCSCT' then
	fila = st_parm.dw_obj.Find("char_orig1='" + cd + "' and char_orig2='" + cl + "' and num_orig1=" + string(nd),1,st_parm.dw_obj.RowCount())
	if fila = 0 then
		st_parm.dw_Obj.InsertRow(1)
		st_parm.dw_obj.SetItem(1,'codigo',st_parm.codmod)
		st_parm.dw_obj.SetItem(1,'char_doc1',st_parm.dw_cab.GetItemString(st_parm.dw_cab.GetRow(),'coddoc'))
		st_parm.dw_obj.SetItem(1,'char_doc2',st_parm.dw_cab.GetItemString(st_parm.dw_cab.GetRow(),'clugar'))
		st_parm.dw_obj.SetItem(1,'num_doc1',st_parm.dw_cab.GetItemNumber(st_parm.dw_cab.GetRow(),'numdoc'))
		
		st_parm.dw_obj.SetItem(1,'char_orig1',cd)
		st_parm.dw_obj.SetItem(1,'char_orig2',cl)
		st_parm.dw_obj.SetItem(1,'num_orig1',nd)
		st_parm.dw_obj.SetItem(1,'valor',dw_occab.GetItemNumber(dw_occab.GetRow(),'valor_agregado'))
	end if
	fila = st_parm.dw_ter.Find("tipodoc='" + td + "' and documento='" + ter + "'",1,st_parm.dw_ter.RowCount())
	if fila = 0 then
		fila = st_parm.dw_ter.Insertrow(0)
		st_parm.dw_ter.SetItem(fila,'coddoc',st_parm.dw_cab.GetItemString(st_parm.dw_cab.GetRow(),'coddoc'))
		st_parm.dw_ter.SetItem(fila,'clugar',st_parm.dw_cab.GetItemString(st_parm.dw_cab.GetRow(),'clugar'))
		st_parm.dw_ter.SetItem(fila,'numdoc',st_parm.dw_cab.GetItemNumber(st_parm.dw_cab.GetRow(),'numdoc'))
		st_parm.dw_ter.SetItem(fila,'tipodoc',td)
		st_parm.dw_ter.SetItem(fila,'documento',ter)
		st_parm.dw_ter.SetItem(fila,'nombre1',dw_occab.GetItemString(dw_occab.getRow(),'nombre1'))
		st_parm.dw_ter.SetItem(fila,'nombre2',dw_occab.GetItemString(dw_occab.getRow(),'nombre2'))
		st_parm.dw_ter.SetItem(fila,'apellido1',dw_occab.GetItemString(dw_occab.getRow(),'apellido1'))
		st_parm.dw_ter.SetItem(fila,'apellido2',dw_occab.GetItemString(dw_occab.getRow(),'apellido2'))
		st_parm.dw_ter.SetItem(fila,'razon_social',dw_occab.GetItemString(dw_occab.getRow(),'razon_social'))
		st_parm.dw_ter.SetItem(fila,'monto',dw_occab.GetItemNumber(dw_occab.GetRow(),'valor_agregado'))
	end if

else // Otro modulo - Contratacion
	
	if st_parm.dw_obj.RowCount() > 0 then
		fila = st_parm.dw_obj.Find("tipodoc='" + td + "' and documento ='" + ter + "'",1,st_parm.dw_obj.RowCount())
		if fila < 1 then 
			messageBox('Error','No puede seleccionar diferentes TERCEROS en un solo documento.')
			Return
		end if
	end if
	
	fila = st_parm.dw_obj.Find("coddoc='" + cd + "' and clugar='" + cl + "' and numdoc=" + string(nd),1,st_parm.dw_obj.RowCount())
	if fila = 0 then
		st_parm.dw_obj.TriggerEvent("insertaFila")
		st_parm.dw_obj.SetItem(1,'valor_agregado',dw_occab.GetItemNumber(dw_occab.GetRow(),'valor_agregado'))
		st_parm.dw_obj.SetItem(1,'coddoc',cd)
		st_parm.dw_obj.SetItem(1,'clugar',cl)
		st_parm.dw_obj.SetItem(1,'numdoc',nd)
		st_parm.dw_obj.SetItem(1,'tipodoc',td)
		st_parm.dw_obj.SetItem(1,'documento',ter)
		st_parm.dw_obj.SetItem(1,'fecha',dw_occab.GetItemDateTime(dw_occab.getRow(),'fecha'))
		st_parm.dw_obj.SetItem(1,'codalmacen',dw_occab.GetItemString(dw_occab.getRow(),'codalmacen'))
		st_parm.dw_obj.SetItem(1,'cod_flujo',dw_occab.GetItemString(dw_occab.getRow(),'cod_flujo'))
		st_parm.dw_obj.SetItem(1,'estado',dw_occab.GetItemString(dw_occab.getRow(),'estado'))
	end if
//	st_parm.dw_cab.SetItem(st_parm.dw_cab.GetRow(),'monto',dw_occab.GetItemNumber(dw_occab.GetRow(),'valor_agregado'))
	if isNull(st_parm.dw_cab.GetItemString(st_parm.dw_cab.GetRow(),'documento')) then
		st_parm.dw_cab.SetItem(st_parm.dw_cab.GetRow(),'tipodoc',td)
		st_parm.dw_cab.SetItem(st_parm.dw_cab.GetRow(),'documento',ter)
		st_parm.dw_cab.SetItem(st_parm.dw_cab.GetRow(),'nombre1',dw_occab.GetItemString(dw_occab.getRow(),'nombre1'))
		st_parm.dw_cab.SetItem(st_parm.dw_cab.GetRow(),'nombre2',dw_occab.GetItemString(dw_occab.getRow(),'nombre2'))
		st_parm.dw_cab.SetItem(st_parm.dw_cab.GetRow(),'apellido1',dw_occab.GetItemString(dw_occab.getRow(),'apellido1'))
		st_parm.dw_cab.SetItem(st_parm.dw_cab.GetRow(),'apellido2',dw_occab.GetItemString(dw_occab.getRow(),'apellido2'))
		st_parm.dw_cab.SetItem(st_parm.dw_cab.GetRow(),'razon_social',dw_occab.GetItemString(dw_occab.getRow(),'razon_social'))
	end if
//	st_parm.dw_obj.TriggerEvent("actMonto")
end if

end event

type dw_occpo from datawindow within w_chooseoc
integer x = 110
integer y = 772
integer width = 2656
integer height = 488
integer taborder = 30
string title = "none"
string dataobject = "dw_mvto_cpo_oc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type dw_occab from datawindow within w_chooseoc
integer x = 101
integer y = 236
integer width = 2528
integer height = 396
integer taborder = 20
string title = "none"
string dataobject = "dw_mvto_cab"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_occpo.Reset()
if this.RowCount() = 0 or currentRow = 0 then Return
dw_occpo.Retrieve(GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))

end event

event clicked;if row = 0 then Return
if this.GetRow() <> row then
	this.SetRow(row)
end if
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

type gb_1 from groupbox within w_chooseoc
integer x = 64
integer y = 164
integer width = 2624
integer height = 512
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ordenes de Compra"
end type

type gb_2 from groupbox within w_chooseoc
integer x = 64
integer y = 708
integer width = 2738
integer height = 588
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Items"
end type

