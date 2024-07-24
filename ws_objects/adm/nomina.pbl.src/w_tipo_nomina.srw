$PBExportHeader$w_tipo_nomina.srw
forward
global type w_tipo_nomina from window
end type
type pb_2 from picturebutton within w_tipo_nomina
end type
type pb_1 from picturebutton within w_tipo_nomina
end type
type dw_1 from datawindow within w_tipo_nomina
end type
end forward

global type w_tipo_nomina from window
integer width = 1440
integer height = 752
boolean titlebar = true
string title = "Escoja Tipo Nomina"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "cambia_doc.ico"
boolean center = true
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
end type
global w_tipo_nomina w_tipo_nomina

type variables
string tnom='!'

end variables

on w_tipo_nomina.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_1}
end on

on w_tipo_nomina.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
end on

event open;tnom='!'
tnom=message.stringparm
end event

type pb_2 from picturebutton within w_tipo_nomina
integer x = 745
integer y = 496
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "           &c"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
end type

event clicked;tnom='!'
closewithreturn(parent,tnom)
end event

type pb_1 from picturebutton within w_tipo_nomina
integer x = 581
integer y = 496
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "           &a"
boolean originalsize = true
string picturename = "Aceptar.gif"
alignment htextalign = left!
end type

event clicked;dw_1.triggerevent(doubleclicked!)

end event

type dw_1 from datawindow within w_tipo_nomina
integer x = 37
integer y = 28
integer width = 1367
integer height = 456
integer taborder = 10
string title = "none"
string dataobject = "dw_tipo_nomina"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if getrow()<1 then return
closewithreturn(parent,dw_1.getitemstring(dw_1.getrow(),1))
end event

