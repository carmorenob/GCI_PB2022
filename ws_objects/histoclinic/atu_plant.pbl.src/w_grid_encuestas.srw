$PBExportHeader$w_grid_encuestas.srw
forward
global type w_grid_encuestas from window
end type
type pb_2 from picturebutton within w_grid_encuestas
end type
type pb_1 from picturebutton within w_grid_encuestas
end type
type uo_1 from uo_grid_encuesta within w_grid_encuestas
end type
end forward

global type w_grid_encuestas from window
integer width = 3941
integer height = 1768
boolean titlebar = true
string title = "Listado de Encuestas"
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "ela_encu.ico"
pb_2 pb_2
pb_1 pb_1
uo_1 uo_1
end type
global w_grid_encuestas w_grid_encuestas

on w_grid_encuestas.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.uo_1=create uo_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.uo_1}
end on

on w_grid_encuestas.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.uo_1)
end on

event open;uo_1.Retrieve('',1)
w_grid_encuestas.WindowState= maximized! 
end event

type pb_2 from picturebutton within w_grid_encuestas
event mousemove pbm_mousemove
integer x = 3538
integer y = 76
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "export.gif"
string disabledname = "d_export.gif"
alignment htextalign = left!
string powertiptext = "Exportar datos"
end type

event clicked;openwithparm(w_export,uo_1.dw_1)

end event

type pb_1 from picturebutton within w_grid_encuestas
event mousemove pbm_mousemove
integer x = 3685
integer y = 76
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(w_grid_encuestas)
end event

type uo_1 from uo_grid_encuesta within w_grid_encuestas
integer x = 5
integer width = 3899
integer height = 1612
integer taborder = 70
end type

on uo_1.destroy
call uo_grid_encuesta::destroy
end on

