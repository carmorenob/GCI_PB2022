$PBExportHeader$w_req_contrato.srw
forward
global type w_req_contrato from window
end type
type pb_1 from picturebutton within w_req_contrato
end type
type dw_req from datawindow within w_req_contrato
end type
end forward

global type w_req_contrato from window
integer width = 3639
integer height = 1276
boolean titlebar = true
string title = "Requisitos del Contrato"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "Information!"
boolean clientedge = true
boolean center = true
pb_1 pb_1
dw_req dw_req
end type
global w_req_contrato w_req_contrato

on w_req_contrato.create
this.pb_1=create pb_1
this.dw_req=create dw_req
this.Control[]={this.pb_1,&
this.dw_req}
end on

on w_req_contrato.destroy
destroy(this.pb_1)
destroy(this.dw_req)
end on

type pb_1 from picturebutton within w_req_contrato
integer x = 1705
integer y = 1028
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type dw_req from datawindow within w_req_contrato
integer x = 46
integer y = 44
integer width = 3506
integer height = 956
integer taborder = 10
string title = "none"
string dataobject = "dw_req_contrato"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

