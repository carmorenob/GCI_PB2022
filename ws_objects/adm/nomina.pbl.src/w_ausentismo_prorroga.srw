$PBExportHeader$w_ausentismo_prorroga.srw
forward
global type w_ausentismo_prorroga from window
end type
type pb_2 from picturebutton within w_ausentismo_prorroga
end type
type pb_1 from picturebutton within w_ausentismo_prorroga
end type
type dw_1 from datawindow within w_ausentismo_prorroga
end type
end forward

global type w_ausentismo_prorroga from window
integer width = 2103
integer height = 656
boolean titlebar = true
string title = "Escoja Incapacidad Inicial"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "cambia_doc.ico"
boolean center = true
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
end type
global w_ausentismo_prorroga w_ausentismo_prorroga

type variables
st_ausentismo_prorroga tnom

end variables

on w_ausentismo_prorroga.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_1}
end on

on w_ausentismo_prorroga.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
end on

event open;tnom= Message.PowerObjectParm
dw_1.retrieve(tnom.tipodoc,tnom.documento,tnom.incap)
if dw_1.rowcount()<0 then pb_2.TriggerEvent(clicked!)

end event

type pb_2 from picturebutton within w_ausentismo_prorroga
integer x = 1051
integer y = 404
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

event clicked;tnom.item=-1
closewithreturn(parent,tnom)
end event

type pb_1 from picturebutton within w_ausentismo_prorroga
integer x = 887
integer y = 404
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

event clicked;window wSheet
wSheet = w_ausentismo.GetFirstSheet()
tnom.item=dw_1.getitemnumber(dw_1.getrow(),'item')
closewithreturn(parent,tnom)
end event

type dw_1 from datawindow within w_ausentismo_prorroga
integer x = 37
integer y = 28
integer width = 1993
integer height = 356
integer taborder = 10
string title = "none"
string dataobject = "dw_ausentismo_inicial"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

