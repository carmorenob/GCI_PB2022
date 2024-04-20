$PBExportHeader$w_cambia_lugar.srw
forward
global type w_cambia_lugar from window
end type
type pb_2 from picturebutton within w_cambia_lugar
end type
type pb_1 from picturebutton within w_cambia_lugar
end type
type dw_1 from datawindow within w_cambia_lugar
end type
end forward

global type w_cambia_lugar from window
integer width = 1353
integer height = 388
windowtype windowtype = response!
long backcolor = 67108864
string icon = "cambia_doc.ico"
boolean center = true
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
end type
global w_cambia_lugar w_cambia_lugar

on w_cambia_lugar.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_1}
end on

on w_cambia_lugar.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
end on

type pb_2 from picturebutton within w_cambia_lugar
integer x = 690
integer y = 196
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "           &c"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_cambia_lugar
integer x = 521
integer y = 196
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

type dw_1 from datawindow within w_cambia_lugar
integer x = 46
integer y = 28
integer width = 1280
integer height = 144
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

