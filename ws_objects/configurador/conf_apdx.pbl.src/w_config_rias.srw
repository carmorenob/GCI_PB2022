$PBExportHeader$w_config_rias.srw
forward
global type w_config_rias from window
end type
type pb_4 from picturebutton within w_config_rias
end type
type pb_3 from picturebutton within w_config_rias
end type
type pb_2 from picturebutton within w_config_rias
end type
type pb_1 from picturebutton within w_config_rias
end type
type dw_1 from datawindow within w_config_rias
end type
end forward

global type w_config_rias from window
integer width = 4229
integer height = 1540
boolean titlebar = true
string title = "Configuración de RIPS"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "Query5!"
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
end type
global w_config_rias w_config_rias

on w_config_rias.create
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.Control[]={this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_1}
end on

on w_config_rias.destroy
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
end on

event open;dw_1.settransobject(SQLCA)
dw_1.retrieve()
end event

type pb_4 from picturebutton within w_config_rias
integer x = 2112
integer y = 1276
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.GIF"
alignment htextalign = left!
end type

event clicked;dw_1.accepttext()
if dw_1.update()<1 then
	rollback;
	dw_1.retrieve()
else
	commit;
end if
end event

type pb_3 from picturebutton within w_config_rias
integer x = 1934
integer y = 1276
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "refrescar.gif"
alignment htextalign = left!
end type

event clicked;dw_1.retrieve()
end event

type pb_2 from picturebutton within w_config_rias
integer x = 1755
integer y = 1276
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;dw_1.deleterow(0)
end event

type pb_1 from picturebutton within w_config_rias
integer x = 1577
integer y = 1276
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.GIF"
alignment htextalign = left!
end type

event clicked;dw_1.scrolltorow(dw_1.insertrow(0))
dw_1.setfocus()
end event

type dw_1 from datawindow within w_config_rias
integer x = 32
integer y = 28
integer width = 4119
integer height = 1236
integer taborder = 10
string title = "none"
string dataobject = "dw_rips"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

