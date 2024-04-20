$PBExportHeader$w_val_norm.srw
forward
global type w_val_norm from window
end type
type st_1 from statictext within w_val_norm
end type
type dw_1 from datawindow within w_val_norm
end type
end forward

global type w_val_norm from window
integer width = 1298
integer height = 732
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
st_1 st_1
dw_1 dw_1
end type
global w_val_norm w_val_norm

on w_val_norm.create
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.dw_1}
end on

on w_val_norm.destroy
destroy(this.st_1)
destroy(this.dw_1)
end on

event open;if st_1.text='0' then 
	y=pointery()+30
	x=pointerx()+30
else 
	y=pointery()+550
	x=pointerx()+530
end if
end event

event deactivate;close(this)
end event

event key;if key=keyescape! then close(this)

end event

type st_1 from statictext within w_val_norm
boolean visible = false
integer x = 233
integer y = 788
integer width = 174
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "0"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_val_norm
integer width = 1262
integer height = 680
integer taborder = 10
string title = "none"
string dataobject = "dw_val_norm"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

