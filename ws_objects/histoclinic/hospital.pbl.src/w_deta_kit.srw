$PBExportHeader$w_deta_kit.srw
forward
global type w_deta_kit from window
end type
type dw_1 from datawindow within w_deta_kit
end type
type cb_1 from commandbutton within w_deta_kit
end type
end forward

global type w_deta_kit from window
integer width = 2459
integer height = 824
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
dw_1 dw_1
cb_1 cb_1
end type
global w_deta_kit w_deta_kit

on w_deta_kit.create
this.dw_1=create dw_1
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.cb_1}
end on

on w_deta_kit.destroy
destroy(this.dw_1)
destroy(this.cb_1)
end on

event deactivate;close(this)
end event

event open;this.y=pointery()+30
this.x=(ancho - this.width)/2
end event

type dw_1 from datawindow within w_deta_kit
integer width = 2450
integer height = 812
integer taborder = 10
string title = "none"
string dataobject = "dw_ossubdeta"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
end event

type cb_1 from commandbutton within w_deta_kit
integer x = 1330
integer y = 764
integer width = 55
integer height = 40
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean default = true
end type

event clicked;close(parent)
end event

