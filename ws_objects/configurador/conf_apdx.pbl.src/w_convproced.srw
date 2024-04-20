$PBExportHeader$w_convproced.srw
forward
global type w_convproced from window
end type
type st_3 from statictext within w_convproced
end type
type cb_add from picturebutton within w_convproced
end type
type cb_del from picturebutton within w_convproced
end type
type pb_cancel from picturebutton within w_convproced
end type
type cb_grabar from picturebutton within w_convproced
end type
type st_2 from statictext within w_convproced
end type
type st_1 from statictext within w_convproced
end type
type ddlb_p from dropdownlistbox within w_convproced
end type
type ddlb_c from dropdownlistbox within w_convproced
end type
type dw_1 from datawindow within w_convproced
end type
type gb_1 from groupbox within w_convproced
end type
type dw_2 from datawindow within w_convproced
end type
end forward

global type w_convproced from window
integer width = 3826
integer height = 1784
boolean titlebar = true
string title = "Configuración Odontologia"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_3 st_3
cb_add cb_add
cb_del cb_del
pb_cancel pb_cancel
cb_grabar cb_grabar
st_2 st_2
st_1 st_1
ddlb_p ddlb_p
ddlb_c ddlb_c
dw_1 dw_1
gb_1 gb_1
dw_2 dw_2
end type
global w_convproced w_convproced

on w_convproced.create
this.st_3=create st_3
this.cb_add=create cb_add
this.cb_del=create cb_del
this.pb_cancel=create pb_cancel
this.cb_grabar=create cb_grabar
this.st_2=create st_2
this.st_1=create st_1
this.ddlb_p=create ddlb_p
this.ddlb_c=create ddlb_c
this.dw_1=create dw_1
this.gb_1=create gb_1
this.dw_2=create dw_2
this.Control[]={this.st_3,&
this.cb_add,&
this.cb_del,&
this.pb_cancel,&
this.cb_grabar,&
this.st_2,&
this.st_1,&
this.ddlb_p,&
this.ddlb_c,&
this.dw_1,&
this.gb_1,&
this.dw_2}
end on

on w_convproced.destroy
destroy(this.st_3)
destroy(this.cb_add)
destroy(this.cb_del)
destroy(this.pb_cancel)
destroy(this.cb_grabar)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.ddlb_p)
destroy(this.ddlb_c)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.dw_2)
end on

type st_3 from statictext within w_convproced
integer x = 1157
integer y = 116
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
string text = "Convención"
boolean focusrectangle = false
end type

type cb_add from picturebutton within w_convproced
event mousemove pbm_mousemove
integer x = 2203
integer y = 1544
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Adicionar Ingreso [Alt+A]"
end type

event clicked;if IsNull(ddlb_c.Text) or IsNull(ddlb_p.Text) or IsNull(dw_2.GetItemNumber(1,'cod_conven')) then Return
long fila
string valor
fila = dw_1.InsertRow(0)
dw_1.SetItem(fila,'codigo_cuadrante',long(ddlb_c.Text))
dw_1.SetItem(fila,'codigo_pieza',long(ddlb_p.Text))
dw_1.SetItem(fila,'cod_conven',dw_2.GetItemNumber(1,'cod_conven'))
valor = dw_1.Describe("Evaluate('max(item)',0)")
dw_1.SetItem(fila,'item',long(valor) + 1)
if long(valor) + 1 = 1 then
	dw_1.SetItem(fila,'sugerido','1')
else
	dw_1.SetItem(fila,'sugerido','0')
end if
dw_1.ScrolltoRow(fila)

end event

type cb_del from picturebutton within w_convproced
event mousemove pbm_mousemove
integer x = 2359
integer y = 1544
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &b"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Ingreso [Alt+B]"
end type

event clicked;if IsNull(ddlb_c.Text) or IsNull(ddlb_p.Text) or IsNull(dw_2.GetItemNumber(1,'cod_conven')) then Return
if dw_1.RowCount() > 0 then
	dw_1.DeleteRow(0)
end if

end event

type pb_cancel from picturebutton within w_convproced
event mousemove pbm_mousemove
integer x = 2048
integer y = 1544
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
string text = "        &g"
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "&Guardar Registro Odontológico - Definitivo"
end type

event clicked;close(parent)

end event

type cb_grabar from picturebutton within w_convproced
event mousemove pbm_mousemove
integer x = 2514
integer y = 1544
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
string text = "        &g"
boolean originalsize = true
string picturename = "guardar.GIF"
string disabledname = "d_guardar.GIF"
alignment htextalign = left!
string powertiptext = "&Guardar Registro Odontológico - Definitivo"
end type

event clicked;if dw_1.AcceptText() = -1 then Return

if dw_1.Update() = -1 then
	Rollback;
end if

end event

type st_2 from statictext within w_convproced
integer x = 654
integer y = 116
integer width = 334
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pieza"
boolean focusrectangle = false
end type

type st_1 from statictext within w_convproced
integer x = 123
integer y = 116
integer width = 347
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cuadrante"
boolean focusrectangle = false
end type

type ddlb_p from dropdownlistbox within w_convproced
integer x = 649
integer y = 184
integer width = 375
integer height = 412
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"1","2","3","4","5","6","7","8"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;
if not IsNull(ddlb_c.Text) and not IsNull(ddlb_p.Text) and not IsNull(dw_2.GetItemNumber(1,'cod_conven')) then
	dw_1.Retrieve(long(ddlb_c.Text),long(ddlb_p.Text),dw_2.GetItemNumber(1,'cod_conven'))
end if

end event

type ddlb_c from dropdownlistbox within w_convproced
integer x = 123
integer y = 184
integer width = 375
integer height = 412
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"1","2","3","4","5","6","7","8"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;
if not IsNull(ddlb_c.Text) and not IsNull(ddlb_p.Text) and not IsNull(dw_2.GetItemNumber(1,'cod_conven')) then
	dw_1.Retrieve(long(ddlb_c.Text),long(ddlb_p.Text),dw_2.GetItemNumber(1,'cod_conven'))
end if

end event

type dw_1 from datawindow within w_convproced
integer x = 41
integer y = 336
integer width = 3749
integer height = 1172
integer taborder = 40
string title = "none"
string dataobject = "dw_convproced"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(SQLCA)
end event

event doubleclicked;if GetColumnName() = 'cod_cups' then
	st_proced st_pr
	open(w_busca_proc)
	st_pr = Message.PowerObjectParm
	if not isValid(st_pr) then Return -1
	setItem(getrow(),'codproced',st_pr.interno)
	setItem(getrow(),'descripcion',st_pr.descrip)
	setItem(getrow(),'cod_version',st_pr.version)
	setItem(getrow(),'cod_cups',st_pr.cups)
	SetColumn('codproced')
end if

end event

type gb_1 from groupbox within w_convproced
integer x = 32
integer y = 32
integer width = 3168
integer height = 272
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Criterios"
end type

type dw_2 from datawindow within w_convproced
integer x = 1157
integer y = 184
integer width = 1285
integer height = 80
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_listconven"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(SQLCA)
this.InsertRow(1)

end event

event itemchanged;this.AcceptText()
if not IsNull(ddlb_c.Text) and not IsNull(ddlb_p.Text) and not IsNull(dw_2.GetItemNumber(1,'cod_conven')) then
	dw_1.Retrieve(long(ddlb_c.Text),long(ddlb_p.Text),dw_2.GetItemNumber(1,'cod_conven'))
end if

end event

