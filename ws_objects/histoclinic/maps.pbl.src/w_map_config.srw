$PBExportHeader$w_map_config.srw
forward
global type w_map_config from window
end type
type pb_4 from picturebutton within w_map_config
end type
type uo_1 from uo_dwmap within w_map_config
end type
type st_1 from statictext within w_map_config
end type
type dw_m from datawindow within w_map_config
end type
end forward

global type w_map_config from window
integer width = 3314
integer height = 2108
boolean titlebar = true
string title = "Mapas"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_4 pb_4
uo_1 uo_1
st_1 st_1
dw_m dw_m
end type
global w_map_config w_map_config

on w_map_config.create
this.pb_4=create pb_4
this.uo_1=create uo_1
this.st_1=create st_1
this.dw_m=create dw_m
this.Control[]={this.pb_4,&
this.uo_1,&
this.st_1,&
this.dw_m}
end on

on w_map_config.destroy
destroy(this.pb_4)
destroy(this.uo_1)
destroy(this.st_1)
destroy(this.dw_m)
end on

event resize;
uo_1.Resize(newwidth - 170, newHeight - 170)

end event

type pb_4 from picturebutton within w_map_config
integer x = 1289
integer y = 4
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "              &G"
boolean flatstyle = true
boolean originalsize = true
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;if uo_1.guardar() = -1 then
	rollback;
	Return -1
end if
commit;

end event

type uo_1 from uo_dwmap within w_map_config
integer x = 46
integer y = 132
integer width = 2926
integer height = 1764
integer taborder = 20
boolean edit_map = true
end type

on uo_1.destroy
call uo_dwmap::destroy
end on

type st_1 from statictext within w_map_config
integer x = 73
integer y = 32
integer width = 224
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Paises"
boolean focusrectangle = false
end type

type dw_m from datawindow within w_map_config
integer x = 256
integer y = 20
integer width = 933
integer height = 84
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_maps"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
InsertRow(0)

end event

event itemchanged;acceptText()
uo_1.Retrieve(GetItemString(1,1),'','P')

end event

