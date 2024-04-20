$PBExportHeader$w_cambia_lugar_conf.srw
forward
global type w_cambia_lugar_conf from window
end type
type pb_2 from picturebutton within w_cambia_lugar_conf
end type
type pb_1 from picturebutton within w_cambia_lugar_conf
end type
type dw_1 from datawindow within w_cambia_lugar_conf
end type
end forward

global type w_cambia_lugar_conf from window
integer width = 1504
integer height = 400
boolean titlebar = true
string title = "Cambiar Lugar"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "cambia_doc.ico"
boolean center = true
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
end type
global w_cambia_lugar_conf w_cambia_lugar_conf

on w_cambia_lugar_conf.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_1}
end on

on w_cambia_lugar_conf.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
end on

type pb_2 from picturebutton within w_cambia_lugar_conf
integer x = 699
integer y = 160
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "           &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_cambia_lugar_conf
integer x = 549
integer y = 160
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
boolean default = true
boolean originalsize = true
string picturename = "Aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;window wSheet
wSheet = w_principal.GetFirstSheet()
IF IsValid (wSheet) THEN
	messagebox('Atención','Debe cerrar todas las ventanas para poder cambiar el Lugar')
	return
end if
clugar=dw_1.getitemstring(1,1)
w_principal.lf_titulo()
close(parent)
end event

type dw_1 from datawindow within w_cambia_lugar_conf
integer x = 78
integer y = 44
integer width = 1289
integer height = 88
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_lugar"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
setitem(1,1,clugar)
end event

