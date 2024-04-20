$PBExportHeader$w_escoge_empresa.srw
forward
global type w_escoge_empresa from window
end type
type pb_1 from picturebutton within w_escoge_empresa
end type
type mle_1 from multilineedit within w_escoge_empresa
end type
type dw_1 from datawindow within w_escoge_empresa
end type
end forward

global type w_escoge_empresa from window
integer width = 3214
integer height = 1048
boolean titlebar = true
string title = "Escoger Empresa"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Question!"
boolean clientedge = true
boolean center = true
pb_1 pb_1
mle_1 mle_1
dw_1 dw_1
end type
global w_escoge_empresa w_escoge_empresa

type variables
datawindow idw_e
end variables

on w_escoge_empresa.create
this.pb_1=create pb_1
this.mle_1=create mle_1
this.dw_1=create dw_1
this.Control[]={this.pb_1,&
this.mle_1,&
this.dw_1}
end on

on w_escoge_empresa.destroy
destroy(this.pb_1)
destroy(this.mle_1)
destroy(this.dw_1)
end on

event open;idw_e=message.powerobjectparm
idw_e.rowscopy(1, idw_e.rowcount(), primary!, dw_1, 1, primary!)
dw_1.setfilter("estado='1'")
end event

type pb_1 from picturebutton within w_escoge_empresa
integer x = 1527
integer y = 788
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;dw_1.triggerevent(doubleclicked!)
end event

type mle_1 from multilineedit within w_escoge_empresa
integer x = 73
integer y = 32
integer width = 3031
integer height = 176
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Elija la empresa y el contrato al cual se le cargará este servicio. Escoja  la fila y de Doble Click o <Enter>"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_escoge_empresa
integer x = 59
integer y = 252
integer width = 3090
integer height = 508
integer taborder = 10
string title = "none"
string dataobject = "dw_empacguarda"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if getrow()<1 then return
idw_e.scrolltorow(getrow())
close(parent)

end event

