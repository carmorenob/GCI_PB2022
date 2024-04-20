$PBExportHeader$w_hora_entra.srw
forward
global type w_hora_entra from window
end type
type pb_1 from picturebutton within w_hora_entra
end type
type pb_aceptar from picturebutton within w_hora_entra
end type
type st_1 from statictext within w_hora_entra
end type
type dw_1 from datawindow within w_hora_entra
end type
end forward

global type w_hora_entra from window
integer width = 2848
integer height = 584
boolean titlebar = true
string title = "Fecha y Hora de Entrada a Cirugía"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "citas_prof.ico"
boolean clientedge = true
boolean center = true
pb_1 pb_1
pb_aceptar pb_aceptar
st_1 st_1
dw_1 dw_1
end type
global w_hora_entra w_hora_entra

on w_hora_entra.create
this.pb_1=create pb_1
this.pb_aceptar=create pb_aceptar
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.pb_1,&
this.pb_aceptar,&
this.st_1,&
this.dw_1}
end on

on w_hora_entra.destroy
destroy(this.pb_1)
destroy(this.pb_aceptar)
destroy(this.st_1)
destroy(this.dw_1)
end on

type pb_1 from picturebutton within w_hora_entra
integer x = 1358
integer y = 328
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "canelar"
end type

event clicked;closewithreturn(parent,'!')
end event

type pb_aceptar from picturebutton within w_hora_entra
integer x = 1193
integer y = 328
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if isnull(dw_1.getitemstring(1,'codigosala')) then return
//para validar que las fechas no sean mayores a la atencion actual
if string(dw_1.getitemdatetime(1,3),'dd/mm/yyyy')>string(now(),'dd/mm/yyyy') then
	messagebox("Atención","La Fecha de Inicio no puede ser mayor a la fecha actual")
	return
end if
if string(dw_1.getitemdatetime(1,5),'dd/mm/yyyy')>string(now(),'dd/mm/yyyy') then
	messagebox("Atención","La Fecha de Final no puede ser mayor a la fecha actual")
	return
end if
w_new_sala_qx.dw_new.setitem(1,1,dw_1.getitemstring(1,1))
w_new_sala_qx.dw_new.setitem(1,2,dw_1.getitemstring(1,2))
w_new_sala_qx.dw_new.setitem(1,3,dw_1.getitemdatetime(1,3))
w_new_sala_qx.dw_new.setitem(1,4,dw_1.getitemdatetime(1,4))
w_new_sala_qx.dw_new.setitem(1,5,dw_1.getitemdatetime(1,5))
w_new_sala_qx.dw_new.setitem(1,6,dw_1.getitemdatetime(1,6))
w_new_sala_qx.dw_new.setitem(1,7,dw_1.getitemstring(1,7))
close(parent)
end event

type st_1 from statictext within w_hora_entra
integer x = 14
integer y = 32
integer width = 2775
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Digite Fecha , Hora de Entrada / Salida y tipo cirugía"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_hora_entra
integer x = 9
integer y = 140
integer width = 2775
integer height = 132
integer taborder = 10
string title = "none"
string dataobject = "dw_nuevo_acto_qx"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
this.insertrow(1)
this.setitem(1,1,"4")
this.setitem(1,3,datetime(today(),time("00:00")))
this.setitem(1,4,datetime(date("1/1/1900"),time(string(now()))))
this.setitem(1,'fechafin',datetime(today(),time("00:00")))
this.setitem(1,'horafin',datetime(date("1/1/1900"),relativetime(time(string(now())),1200)))
end event

event itemchanged;if getcolumnname()="codigosala"  then
	string i_alm
	SELECT qxsala.codalmacen into :i_alm
	FROM qxsala WHERE qxsala.codigosala=:data;
	if i_alm='' or isnull(i_alm) then
		messagebox('Atención','No ha configurado almacen para esta Sala Qx')
		return 
	else
		pb_aceptar.enabled=true
	end if
end if 
end event

