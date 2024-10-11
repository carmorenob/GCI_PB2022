$PBExportHeader$w_chooseocppto.srw
$PBExportComments$Escoger Orden de Compra
forward
global type w_chooseocppto from window
end type
type pb_2 from picturebutton within w_chooseocppto
end type
type pb_1 from picturebutton within w_chooseocppto
end type
type dw_fr from datawindow within w_chooseocppto
end type
type dw_occab from datawindow within w_chooseocppto
end type
type gb_1 from groupbox within w_chooseocppto
end type
type gb_2 from groupbox within w_chooseocppto
end type
end forward

global type w_chooseocppto from window
integer width = 2871
integer height = 1508
boolean titlebar = true
string title = "Ordenes de Compra"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "contrato.ico"
boolean center = true
pb_2 pb_2
pb_1 pb_1
dw_fr dw_fr
dw_occab dw_occab
gb_1 gb_1
gb_2 gb_2
end type
global w_chooseocppto w_chooseocppto

type variables
Datawindowchild dwc_almfuente
string codDocumento, codmodulo
st_interfaz st_p

end variables

on w_chooseocppto.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_fr=create dw_fr
this.dw_occab=create dw_occab
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_fr,&
this.dw_occab,&
this.gb_1,&
this.gb_2}
end on

on w_chooseocppto.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_fr)
destroy(this.dw_occab)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;string varnul
st_p = Message.PowerObjectParm

dw_occab.SetTransObject(SQLCA)
dw_occab.SetFilter(st_p.filtro)
dw_occab.Filter()
dw_occab.Retrieve('OC')

end event

type pb_2 from picturebutton within w_chooseocppto
event mousemove pbm_mousemove
string tag = "Cerrar"
integer x = 1239
integer y = 1248
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

type pb_1 from picturebutton within w_chooseocppto
event mousemove pbm_mousemove
string tag = "Llevar &Orden de Compra"
integer x = 1390
integer y = 1248
integer width = 146
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "               &O"
boolean originalsize = true
string picturename = "llevar.gif"
string disabledname = "d_llevar.gif"
string powertiptext = "Llevar &Orden de Compra"
end type

event clicked;long fila, nd, i,ret 
string cd, cl, valor
uo_datastore dw_cb

dw_cb = Create uo_datastore
dw_cb.DataObject = 'dw_dispcabselec'
dw_cb.SetTransObject(SQLCA)

if dw_fr.RowCount() = 0 then Return -1

for i = 1 to dw_fr.RowCount()
	cd = dw_fr.GetItemString(i,'char_orig1')
	cl = dw_fr.GetItemString(i,'char_orig2')
	nd = dw_fr.GetItemNumber(i,'num_orig1')
	
	if dw_cb.Retrieve(cd,cl,nd) = 1 then
		fila = st_p.dw_ter.Find("coddoc='" + cd + "' and cLugar='" + cl + "' and numdoc=" + string(nd),1,st_p.dw_ter.RowCount())
		if fila = 0 then
			st_p.dw_ter.InsertRow(1)
			st_p.dw_ter.SetItem(1,'coddoc',cd)
			st_p.dw_ter.SetItem(1,'cLugar',cl)
			st_p.dw_ter.SetItem(1,'numdoc',nd)
			st_p.dw_ter.SetItem(1,'estado',dw_cb.GetItemString(1,'estado'))
			st_p.dw_ter.SetItem(1,'consecutivo',dw_cb.GetItemNumber(1,'consecutivo'))
			st_p.dw_ter.SetItem(1,'fecha',dw_cb.GetItemDateTime(1,'fecha'))
			st_p.dw_ter.SetItem(1,'fecha_consecu',dw_cb.GetItemDateTime(1,'fecha_consecu'))
			
			// Adiciona los rubros
			uo_datastore dw_discpo
			dw_discpo = CREATE uo_datastore
			dw_discpo.dataObject = "dw_dispcpo"
			dw_discpo.SetTransObject(SQLCA)
			
			if dw_discpo.Retrieve(cd,cl,nd) > 0 then
				for i = 1 to dw_discpo.RowCount()
					if dw_discpo.GetItemNumber(i,'monto_reserva') = dw_discpo.GetItemNumber(i,'monto_vigente') then CONTINUE
					valor = st_p.dw_obj.Describe("Evaluate('max(item)',0)")
					fila = st_p.dw_obj.InsertRow(0)
					st_p.dw_obj.SetItem(fila,'coddoc',st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'coddoc'))
					st_p.dw_obj.SetItem(fila,'cLugar',st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'cLugar'))
					st_p.dw_obj.SetItem(fila,'numdoc',st_p.dw_cab.GetItemNumber(st_p.dw_cab.GetRow(),'numdoc'))
					st_p.dw_obj.SetItem(fila,'item',long(valor) + 1)
					st_p.dw_obj.SetItem(fila,'coddoc_dispo',dw_discpo.GetItemString(i,'coddoc'))
					st_p.dw_obj.SetItem(fila,'cLugar_dispo',dw_discpo.GetItemString(i,'cLugar'))
					st_p.dw_obj.SetItem(fila,'numdoc_dispo',dw_discpo.GetItemNumber(i,'numdoc'))
					st_p.dw_obj.SetItem(fila,'item_dispo',dw_discpo.GetItemNumber(i,'item'))
					st_p.dw_obj.SetItem(fila,'cod_vigencia',dw_discpo.GetItemNumber(i,'cod_vigencia'))
					st_p.dw_obj.SetItem(fila,'codtotal',dw_discpo.GetItemString(i,'codtotal'))
					st_p.dw_obj.SetItem(fila,'estado','0')
					st_p.dw_obj.SetItem(fila,'descrip',dw_discpo.GetItemString(i,'descrip'))
					st_p.dw_obj.SetItem(fila,'monto',dw_discpo.GetItemNumber(i,'monto_vigente') - dw_discpo.GetItemNumber(i,'monto_reserva'))
					st_p.dw_obj.SetItem(fila,'monto_vigente',dw_discpo.GetItemNumber(i,'monto_vigente') - dw_discpo.GetItemNumber(i,'monto_reserva'))
					st_p.dw_obj.SetItem(fila,'monto_reserva',dw_discpo.GetItemNumber(i,'monto_reserva'))
					st_p.dw_obj.SetItem(fila,'monto_disp',dw_discpo.GetItemNumber(i,'monto_vigente'))
				next
			else
				MessageBox('Atención','La disponibilidad no posee rubros')
				Return -1
			end if
		else
			Return -1
		end if
	else
		MessageBox('Atención','No se encontró la disponibilidad '+string(nd))
		Return -1
	end if
next

fila = st_p.dw_it.Insertrow(0)
st_p.dw_it.SetItem(fila,'codigo',st_p.codmod)
st_p.dw_it.SetItem(fila,'char_orig1',dw_occab.GetItemString(dw_occab.GetRow(),'coddoc'))
st_p.dw_it.SetItem(fila,'char_orig2',dw_occab.GetItemString(dw_occab.GetRow(),'clugar'))
st_p.dw_it.SetItem(fila,'num_orig1',dw_occab.GetItemNumber(dw_occab.GetRow(),'numdoc'))
st_p.dw_it.SetItem(fila,'char_doc1',st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'coddoc'))
st_p.dw_it.SetItem(fila,'char_doc2',st_p.dw_cab.GetItemString(st_p.dw_cab.GetRow(),'clugar'))
st_p.dw_it.SetItem(fila,'num_doc1',st_p.dw_cab.GetItemNumber(st_p.dw_cab.GetRow(),'numdoc'))
st_p.dw_it.SetItem(fila,'valor',dw_occab.GetItemNumber(dw_occab.GetRow(),'valor_agregado'))

st_p.dw_cab.SetItem(st_p.dw_cab.Getrow(),'tipodoc',dw_occab.GetItemString(dw_occab.GetRow(),'tipodoc'))
st_p.dw_cab.SetItem(st_p.dw_cab.Getrow(),'documento',dw_occab.GetItemString(dw_occab.GetRow(),'documento'))
st_p.dw_cab.SetItem(st_p.dw_cab.Getrow(),'nombre1',dw_occab.GetItemString(dw_occab.GetRow(),'nombre1'))
st_p.dw_cab.SetItem(st_p.dw_cab.Getrow(),'nombre2',dw_occab.GetItemString(dw_occab.GetRow(),'nombre2'))
st_p.dw_cab.SetItem(st_p.dw_cab.Getrow(),'apellido1',dw_occab.GetItemString(dw_occab.GetRow(),'apellido1'))
st_p.dw_cab.SetItem(st_p.dw_cab.Getrow(),'apellido2',dw_occab.GetItemString(dw_occab.GetRow(),'apellido2'))
st_p.dw_cab.SetItem(st_p.dw_cab.Getrow(),'razon_social',dw_occab.GetItemString(dw_occab.GetRow(),'razon_social'))

Return 0

end event

type dw_fr from datawindow within w_chooseocppto
integer x = 110
integer y = 688
integer width = 2551
integer height = 488
integer taborder = 30
string title = "none"
string dataobject = "dw_flujo_2s1n"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type dw_occab from datawindow within w_chooseocppto
integer x = 133
integer y = 120
integer width = 2523
integer height = 396
integer taborder = 20
string title = "none"
string dataobject = "dw_it_cab_oc"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_fr.Reset()
if RowCount() = 0 or currentrow = 0 then Return

dw_fr.Retrieve(GetItemString(GetRow(),'cod_flujo'),GetItemString(GetRow(),'coddoc'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'numdoc'))

end event

event clicked;if row = 0 then Return
if this.GetRow() <> row then
	this.SetRow(row)
end if
end event

type gb_1 from groupbox within w_chooseocppto
integer x = 64
integer y = 48
integer width = 2674
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

type gb_2 from groupbox within w_chooseocppto
integer x = 64
integer y = 624
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
string text = "Disponibilidades"
end type

