$PBExportHeader$w_sum_requi_acumula.srw
forward
global type w_sum_requi_acumula from window
end type
type pb_1 from picturebutton within w_sum_requi_acumula
end type
type pb_cancel from picturebutton within w_sum_requi_acumula
end type
type dw_cpo from datawindow within w_sum_requi_acumula
end type
type dw_req_cab from datawindow within w_sum_requi_acumula
end type
type gb_1 from groupbox within w_sum_requi_acumula
end type
type gb_2 from groupbox within w_sum_requi_acumula
end type
end forward

global type w_sum_requi_acumula from window
integer width = 3762
integer height = 1644
boolean titlebar = true
string title = "Requsición a Agrupar"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_1 pb_1
pb_cancel pb_cancel
dw_cpo dw_cpo
dw_req_cab dw_req_cab
gb_1 gb_1
gb_2 gb_2
end type
global w_sum_requi_acumula w_sum_requi_acumula

type variables
st_sumgen st_p
end variables

on w_sum_requi_acumula.create
this.pb_1=create pb_1
this.pb_cancel=create pb_cancel
this.dw_cpo=create dw_cpo
this.dw_req_cab=create dw_req_cab
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.pb_1,&
this.pb_cancel,&
this.dw_cpo,&
this.dw_req_cab,&
this.gb_1,&
this.gb_2}
end on

on w_sum_requi_acumula.destroy
destroy(this.pb_1)
destroy(this.pb_cancel)
destroy(this.dw_cpo)
destroy(this.dw_req_cab)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;st_p = Message.PowerObjectParm
dw_req_cab.retrieve(st_p.codalmacen,'SR')
end event

type pb_1 from picturebutton within w_sum_requi_acumula
string tag = "Insertar"
integer x = 3483
integer y = 76
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.gif"
alignment htextalign = left!
end type

event clicked;boolean cambio
string codigo,valor
int l_i,l_fila,l_k
dw_req_cab.SetFilter("")
dw_req_cab.Filter()
if dw_req_cab.Find("selec=1",1,dw_req_cab.RowCount()) = 0 then
	return
end if

for l_i = 1 to dw_req_cab.RowCount()
	if dw_req_cab.GetItemNumber(l_i,'selec') = 0 then CONTINUE
	dw_cpo.Retrieve(dw_req_cab.GetItemString(l_i ,'coddoc'),dw_req_cab.GetItemString( l_i ,'clugar'),dw_req_cab.GetItemNumber(l_i ,'numdoc'))
	for l_k = 1 to dw_cpo.RowCount()
		codigo = dw_cpo.getitemstring(l_k,'codarticulo')
		l_fila =st_p.dw_cp.Find( "codarticulo=" + "'" + codigo + "'", 1, st_p.dw_cp.RowCount())
		if l_fila< 1 then
			l_fila = st_p.dw_cp.InsertRow(0)
			valor = st_p.dw_cp.describe("Evaluate('max(item)', 1)")
			st_p.dw_cp.SetItem(l_fila, 'coddoc',st_p.dw_cb.GetItemString(st_p.dw_cb.GetRow(),'coddoc') )
			st_p.dw_cp.SetItem(l_fila, 'cLugar', st_p.dw_cb.GetItemString(st_p.dw_cb.GetRow(),'clugar') )
			st_p.dw_cp.SetItem(l_fila, 'numdoc', st_p.dw_cb.GetItemNumber(st_p.dw_cb.GetRow(),'numdoc') )
			st_p.dw_cp.SetItem(l_fila, 'item',long(valor) + 1)
			st_p.dw_cp.SetItem(l_fila, 'descripcion',dw_cpo.getitemstring(l_k,'descripcion'))
			st_p.dw_cp.SetItem(l_fila, 'codarticulo',codigo)
			st_p.dw_cp.SetItem(l_fila, 'codgenerico',dw_cpo.getitemstring(l_k,'codgenerico'))
			st_p.dw_cp.SetItem(l_fila, 'Estado','0')
			st_p.dw_cp.SetItem(l_fila, 'cantidad',dw_cpo.GetItemNumber(l_k,'cantidad'))
			st_p.dw_cp.SetItem(l_fila, 'control','1')
			
			st_p.dw_cp.ScrolltoRow(l_fila)
		else
			st_p.dw_cp.ScrolltoRow(l_fila)
			st_p.dw_cp.SetItem(l_fila, 'cantidad',st_p.dw_cp.getitemnumber(l_fila,'cantidad')+dw_cpo.GetItemNumber(l_k,'cantidad'))
		end if
	next
	dw_req_cab.SetItem(l_i,'selec','0')
	dw_req_cab.SetItem(l_i,'estado_req','1')
Next
if dw_req_cab.update()= 1 then
	commit;
else
	rollback;
	Return -1
end if
close( parent)

end event

type pb_cancel from picturebutton within w_sum_requi_acumula
integer x = 3483
integer y = 216
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
end type

event clicked;close(parent)
end event

type dw_cpo from datawindow within w_sum_requi_acumula
integer x = 69
integer y = 748
integer width = 3593
integer height = 644
integer taborder = 20
string title = "none"
string dataobject = "dw_mvto_cpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

type dw_req_cab from datawindow within w_sum_requi_acumula
integer x = 78
integer y = 72
integer width = 3109
integer height = 548
integer taborder = 10
string title = "none"
string dataobject = "dw_mvto_req_pend_selec"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

event rowfocuschanged;if currentrow = 0 or rowCount() = 0 then Return
dw_cpo.Retrieve(GetItemString(Getrow(),'coddoc'),GetItemString(Getrow(),'clugar'),GetItemNumber(Getrow(),'numdoc'))

end event

type gb_1 from groupbox within w_sum_requi_acumula
integer x = 37
integer y = 688
integer width = 3653
integer height = 756
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Artículos"
end type

type gb_2 from groupbox within w_sum_requi_acumula
integer x = 32
integer y = 12
integer width = 3666
integer height = 648
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Documentos"
end type

