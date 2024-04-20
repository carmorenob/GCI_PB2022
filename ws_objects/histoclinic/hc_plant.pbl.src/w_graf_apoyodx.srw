$PBExportHeader$w_graf_apoyodx.srw
forward
global type w_graf_apoyodx from window
end type
type dw_1 from datawindow within w_graf_apoyodx
end type
end forward

global type w_graf_apoyodx from window
integer width = 2427
integer height = 1404
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_1 dw_1
end type
global w_graf_apoyodx w_graf_apoyodx

on w_graf_apoyodx.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_graf_apoyodx.destroy
destroy(this.dw_1)
end on

event deactivate;close(this)
end event

event key;if key=keyescape! then close(this)

end event

type dw_1 from datawindow within w_graf_apoyodx
integer x = 9
integer y = 8
integer width = 2331
integer height = 1348
integer taborder = 10
string dataobject = "dw_grafico_apoyodx"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

