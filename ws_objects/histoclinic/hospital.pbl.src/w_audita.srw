$PBExportHeader$w_audita.srw
forward
global type w_audita from window
end type
type pb_cancel from picturebutton within w_audita
end type
type pb_del from picturebutton within w_audita
end type
type st_1 from statictext within w_audita
end type
type dw_1 from datawindow within w_audita
end type
end forward

global type w_audita from window
integer width = 2889
integer height = 1240
boolean titlebar = true
string title = "Procedimientos no entregados"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "audita.ico"
boolean clientedge = true
boolean center = true
pb_cancel pb_cancel
pb_del pb_del
st_1 st_1
dw_1 dw_1
end type
global w_audita w_audita

type variables
int xant,yant
end variables

event open;dw_1.retrieve(w_admision.tab_1.tabpage_1.dw_admi.getitemnumber(1,"nh"),w_admision.tipo_ingres,w_admision.tab_1.tabpage_1.dw_admi.getitemstring(1,"clugar"))
if dw_1.rowcount()=0 then
	w_admision.continua='si'
	close(this)
end if
end event

on w_audita.create
this.pb_cancel=create pb_cancel
this.pb_del=create pb_del
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.pb_cancel,&
this.pb_del,&
this.st_1,&
this.dw_1}
end on

on w_audita.destroy
destroy(this.pb_cancel)
destroy(this.pb_del)
destroy(this.st_1)
destroy(this.dw_1)
end on

type pb_cancel from picturebutton within w_audita
event mousemove pbm_mousemove
integer x = 1353
integer y = 972
integer width = 142
integer height = 124
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;w_admision.continua='no'
close(parent)
end event

type pb_del from picturebutton within w_audita
event mousemove pbm_mousemove
integer x = 1189
integer y = 972
integer width = 142
integer height = 124
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar y Continuar"
end type

event clicked;w_admision.continua="si"
close(parent)
end event

type st_1 from statictext within w_audita
integer x = 18
integer y = 4
integer width = 2816
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "El paciente tiene los siguientes procedimientos pendientes de entregar, desea continuar aún así ?"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_audita
integer x = 18
integer y = 108
integer width = 2811
integer height = 840
integer taborder = 10
string title = "none"
string dataobject = "dw_faltaxentreg"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

