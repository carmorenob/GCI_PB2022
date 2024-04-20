$PBExportHeader$w_acepta_radicacion.srw
forward
global type w_acepta_radicacion from window
end type
type pb_2 from picturebutton within w_acepta_radicacion
end type
type pb_1 from picturebutton within w_acepta_radicacion
end type
type dw_im from datawindow within w_acepta_radicacion
end type
type pb_def from picturebutton within w_acepta_radicacion
end type
type pb_cancel from picturebutton within w_acepta_radicacion
end type
type em_pago from editmask within w_acepta_radicacion
end type
type st_1 from statictext within w_acepta_radicacion
end type
type dw_facts from datawindow within w_acepta_radicacion
end type
end forward

global type w_acepta_radicacion from window
integer width = 2304
integer height = 1548
boolean titlebar = true
string title = "Distribución Radicación"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_2 pb_2
pb_1 pb_1
dw_im dw_im
pb_def pb_def
pb_cancel pb_cancel
em_pago em_pago
st_1 st_1
dw_facts dw_facts
end type
global w_acepta_radicacion w_acepta_radicacion

type variables
st_pagos st_p
datawindowChild idw_ct


end variables

on w_acepta_radicacion.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_im=create dw_im
this.pb_def=create pb_def
this.pb_cancel=create pb_cancel
this.em_pago=create em_pago
this.st_1=create st_1
this.dw_facts=create dw_facts
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_im,&
this.pb_def,&
this.pb_cancel,&
this.em_pago,&
this.st_1,&
this.dw_facts}
end on

on w_acepta_radicacion.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_im)
destroy(this.pb_def)
destroy(this.pb_cancel)
destroy(this.em_pago)
destroy(this.st_1)
destroy(this.dw_facts)
end on

event open;st_p = Message.PowerObjectParm
dw_facts.Retrieve(st_p.nradica, st_p.clugar_rad,st_p.tipo_rad)

end event

type pb_2 from picturebutton within w_acepta_radicacion
string tag = "Colocar Todas"
integer x = 745
integer y = 20
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
string picturename = "todas.gif"
alignment htextalign = right!
end type

event clicked;long j
if dw_facts.rowcount()=0 then return 1
dw_facts.SetRedraw(FALSE)
for j = 1 to dw_facts.rowcount()
	dw_facts.setitem(j,'radica_cartera',em_pago.text)
next
dw_facts.SetRedraw(TRUE)
return 0

end event

type pb_1 from picturebutton within w_acepta_radicacion
string tag = "Limpia Radicación"
integer x = 896
integer y = 20
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "limpiar.gif"
alignment htextalign = right!
end type

event clicked;if dw_facts.rowcount()=0 then return 1
dw_facts.SetRedraw(FALSE)
long j
string limpia
setnull(limpia)
for j = 1 to dw_facts.rowcount()
	dw_facts.setitem(j,'radica_cartera',limpia)
next
dw_facts.SetRedraw(TRUE)

end event

type dw_im from datawindow within w_acepta_radicacion
boolean visible = false
integer x = 2139
integer y = 1376
integer width = 576
integer height = 92
integer taborder = 20
string title = "none"
string dataobject = "dw_imp_pagos"
boolean border = false
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
end event

type pb_def from picturebutton within w_acepta_radicacion
integer x = 1861
integer y = 20
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "124"
string picturename = "guardar2.gif"
alignment htextalign = left!
string powertiptext = "Guardar Definitivo"
end type

event clicked;if dw_facts.rowCount() = 0 then return 0
if dw_facts.accepttext()=-1 then return -1
if dw_facts.update(true,false)=-1 then return -1
commit;
return 0

end event

type pb_cancel from picturebutton within w_acepta_radicacion
integer x = 2016
integer y = 16
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)

end event

type em_pago from editmask within w_acepta_radicacion
integer x = 46
integer y = 64
integer width = 645
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type st_1 from statictext within w_acepta_radicacion
integer x = 46
integer y = 4
integer width = 325
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "No Radicación"
boolean focusrectangle = false
end type

type dw_facts from datawindow within w_acepta_radicacion
integer x = 32
integer y = 168
integer width = 2199
integer height = 1204
integer taborder = 10
string title = "none"
string dataobject = "dw_facts_radica"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event clicked;if dwo.name="selec_t" then
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

event itemchanged;//if dw_facts.rowCount() = 0 then Return 0
//st_saldo.text = string(st_p.dw_pagos.getItemNumber(st_p.dw_pagos.getRow(),'valor') - dw_facts.getItemNumber(1,'sumpago'),'#,##0.00')
//
end event

