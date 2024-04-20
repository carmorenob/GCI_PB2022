$PBExportHeader$w_escog_especialidad_pro.srw
forward
global type w_escog_especialidad_pro from window
end type
type pb_aceptar from picturebutton within w_escog_especialidad_pro
end type
type st_1 from statictext within w_escog_especialidad_pro
end type
type dw_1 from datawindow within w_escog_especialidad_pro
end type
end forward

global type w_escog_especialidad_pro from window
integer width = 2935
integer height = 820
boolean titlebar = true
string title = "Elegir Especialidad para el Procedimiento"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Question!"
boolean clientedge = true
boolean center = true
pb_aceptar pb_aceptar
st_1 st_1
dw_1 dw_1
end type
global w_escog_especialidad_pro w_escog_especialidad_pro

type variables
string i_profe
end variables

on w_escog_especialidad_pro.create
this.pb_aceptar=create pb_aceptar
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.pb_aceptar,&
this.st_1,&
this.dw_1}
end on

on w_escog_especialidad_pro.destroy
destroy(this.pb_aceptar)
destroy(this.st_1)
destroy(this.dw_1)
end on

event open;dw_1.settransobject(sqlca)
dw_1.retrieve()

end event

type pb_aceptar from picturebutton within w_escog_especialidad_pro
integer x = 1376
integer y = 576
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;dw_1.triggerevent(doubleclicked!)
end event

type st_1 from statictext within w_escog_especialidad_pro
integer x = 46
integer y = 12
integer width = 2825
integer height = 132
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Elija la Especialidad que aplique para el procedimiento, dando doble click sobre la fila o presionando aceptar"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_escog_especialidad_pro
integer x = 37
integer y = 192
integer width = 2830
integer height = 348
integer taborder = 10
string title = "none"
string dataobject = "dw_especialidades"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long fila
fila=getrow()
if fila<1 then return
closewithreturn(parent,getitemstring(fila,'codesp'))

end event

