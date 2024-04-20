$PBExportHeader$w_escog_profe.srw
forward
global type w_escog_profe from window
end type
type st_2 from statictext within w_escog_profe
end type
type st_1 from statictext within w_escog_profe
end type
type dw_2 from datawindow within w_escog_profe
end type
type pb_2 from picturebutton within w_escog_profe
end type
type pb_1 from picturebutton within w_escog_profe
end type
type dw_1 from datawindow within w_escog_profe
end type
end forward

global type w_escog_profe from window
integer width = 1623
integer height = 620
boolean titlebar = true
string title = "Profesional que atenderá"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Question!"
boolean clientedge = true
boolean center = true
st_2 st_2
st_1 st_1
dw_2 dw_2
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
end type
global w_escog_profe w_escog_profe

type variables
string i_cual,i_profe_ord,i_decual
end variables

on w_escog_profe.create
this.st_2=create st_2
this.st_1=create st_1
this.dw_2=create dw_2
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.Control[]={this.st_2,&
this.st_1,&
this.dw_2,&
this.pb_2,&
this.pb_1,&
this.dw_1}
end on

on w_escog_profe.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_2)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
end on

event close;if i_decual='fac' then
	w_factura.i_profe_ord=i_profe_ord
else
	w_rec_caja.i_profe_ord=i_profe_ord
end if
closewithreturn(this,i_cual)
end event

event open;i_decual=message.stringparm
if i_decual='fac' then
	if w_factura.i_profe<>'' then
		i_cual=w_factura.i_profe
		dw_1.setitem(1,1,i_cual)
	else
		setnull(i_cual)
	end if
	setnull(i_profe_ord)
	if w_factura.i_tipo_prof<>'2' then
		st_2.visible=true
		dw_2.visible=true
	end if
else
	if w_rec_caja.i_profe<>'' then
		i_cual=w_rec_caja.i_profe
		dw_1.setitem(1,1,i_cual)
	else
		setnull(i_cual)
	end if
	setnull(i_profe_ord)
	if w_rec_caja.i_tipo_prof<>'2' then//por lo general lo va a mostrar
		st_2.visible=true
		dw_2.visible=true
	end if
end if
end event

type st_2 from statictext within w_escog_profe
boolean visible = false
integer x = 41
integer y = 176
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ordenó:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_escog_profe
integer x = 41
integer y = 12
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Atenderá:"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_escog_profe
boolean visible = false
integer x = 27
integer y = 228
integer width = 1513
integer height = 104
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_profe"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
this.insertrow(1)
end event

type pb_2 from picturebutton within w_escog_profe
integer x = 745
integer y = 356
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_escog_profe
integer x = 594
integer y = 356
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;//if isnull(dw_1.getitemstring(1,1)) then return
if dw_2.visible and isnull(dw_2.getitemstring(1,1)) then return
i_cual=dw_1.getitemstring(1,1)
i_profe_ord=dw_2.getitemstring(1,1)
close(parent)
end event

type dw_1 from datawindow within w_escog_profe
integer x = 27
integer y = 64
integer width = 1513
integer height = 104
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_profe"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
this.insertrow(1)
end event

