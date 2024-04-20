$PBExportHeader$w_carga_imagen.srw
forward
global type w_carga_imagen from window
end type
type p_1 from picture within w_carga_imagen
end type
type cb_1 from commandbutton within w_carga_imagen
end type
end forward

global type w_carga_imagen from window
integer width = 2533
integer height = 1408
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
p_1 p_1
cb_1 cb_1
end type
global w_carga_imagen w_carga_imagen

on w_carga_imagen.create
this.p_1=create p_1
this.cb_1=create cb_1
this.Control[]={this.p_1,&
this.cb_1}
end on

on w_carga_imagen.destroy
destroy(this.p_1)
destroy(this.cb_1)
end on

type p_1 from picture within w_carga_imagen
integer x = 78
integer y = 104
integer width = 242
integer height = 116
string picturename = "D:\gci_v9\histoclinic\grgallry.bmp"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_carga_imagen
integer x = 379
integer y = 120
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;messagebox(string(p_1.width),string(p_1.height))
p_1.originalsize=true
messagebox(string(p_1.width),string(p_1.height))
end event

