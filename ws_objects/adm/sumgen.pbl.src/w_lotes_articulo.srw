$PBExportHeader$w_lotes_articulo.srw
forward
global type w_lotes_articulo from window
end type
type pb_1 from picturebutton within w_lotes_articulo
end type
type pb_cancelar from picturebutton within w_lotes_articulo
end type
type st_1 from singlelineedit within w_lotes_articulo
end type
type dw_1 from datawindow within w_lotes_articulo
end type
end forward

global type w_lotes_articulo from window
integer width = 1934
integer height = 1004
boolean titlebar = true
string title = "Lotes"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_1 pb_1
pb_cancelar pb_cancelar
st_1 st_1
dw_1 dw_1
end type
global w_lotes_articulo w_lotes_articulo

type variables
st_lote st_p
end variables

event open;st_p = Message.PowerObjectParm
st_1.Text = 'Lotes para el articulo '+st_p.codarticulo + '-'+st_p.c_itm

dw_1.Retrieve(st_p.codalmacen,st_p.codarticulo)
end event

on w_lotes_articulo.create
this.pb_1=create pb_1
this.pb_cancelar=create pb_cancelar
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.pb_1,&
this.pb_cancelar,&
this.st_1,&
this.dw_1}
end on

on w_lotes_articulo.destroy
destroy(this.pb_1)
destroy(this.pb_cancelar)
destroy(this.st_1)
destroy(this.dw_1)
end on

type pb_1 from picturebutton within w_lotes_articulo
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 914
integer y = 772
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;if dw_1.RowCount() = 0 or dw_1.Getrow() < 1 then Return
long fila
//if st_p.dw_obj.Find("codarticulo='"+st_p.codarticulo+"' and lote='"+dw_1.GetItemString(dw_1.Getrow(),'lote')+"'",1,st_p.dw_obj.RowCount()) = 0 then
if st_p.dw_obj.Find("codarticulo='"+st_p.codarticulo+"' and upper(lote)='"+upper(dw_1.GetItemString(dw_1.Getrow(),'lote'))+"'",1,st_p.dw_obj.RowCount()) = 0 then	
	fila = st_p.dw_obj.InsertRow(0)
	st_p.dw_obj.SetItem(fila,'codalmacen',st_p.codalmacen)
	st_p.dw_obj.SetItem(fila,'codarticulo',st_p.codarticulo)
	st_p.dw_obj.SetItem(fila,'coddoc',st_p.coddoc)
	st_p.dw_obj.SetItem(fila,'clugar',st_p.clugar)
	st_p.dw_obj.SetItem(fila,'numdoc',st_p.numdoc)
	st_p.dw_obj.SetItem(fila,'item',st_p.item)
	st_p.dw_obj.SetItem(fila,'lote',dw_1.GetItemString(dw_1.Getrow(),'lote'))
	st_p.dw_obj.SetItem(fila,'convenio',dw_1.GetItemString(dw_1.Getrow(),'convenio'))
	st_p.dw_obj.SetItem(fila,'fecha_venc',dw_1.GetItemDateTime(dw_1.Getrow(),'fecha_venc'))
	st_p.dw_obj.SetItem(fila,'signo',long(st_p.c_cant))
	st_p.dw_obj.SetItem(fila,'saldo_lote',dw_1.GetItemNumber(dw_1.Getrow(),'cantidad'))
	if st_p.c_cant = '1' then
		if isValid(st_p.dw_cpo) then
			st_p.dw_obj.SetItem(fila,'cantidad',st_p.dw_cpo.GetItemNumber(st_p.dw_cpo.GetRow(),'cantidad'))
		end if
	end if
	st_p.dw_obj.ScrolltoRow(fila)
end if

end event

type pb_cancelar from picturebutton within w_lotes_articulo
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 750
integer y = 772
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type st_1 from singlelineedit within w_lotes_articulo
integer x = 37
integer y = 32
integer width = 1582
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_lotes_articulo
integer x = 32
integer y = 144
integer width = 1851
integer height = 608
integer taborder = 10
string title = "none"
string dataobject = "dw_lote_config"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event doubleclicked;pb_1.TriggerEvent(clicked!)
pb_cancelar.TriggerEvent(clicked!)

end event

