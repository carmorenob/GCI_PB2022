$PBExportHeader$w_escoge_proc.srw
forward
global type w_escoge_proc from window
end type
type st_3 from statictext within w_escoge_proc
end type
type st_2 from statictext within w_escoge_proc
end type
type pb_cancel from picturebutton within w_escoge_proc
end type
type pb_aceptar from picturebutton within w_escoge_proc
end type
type st_1 from statictext within w_escoge_proc
end type
type dw_tarifa from datawindow within w_escoge_proc
end type
end forward

global type w_escoge_proc from window
integer width = 2345
integer height = 1124
boolean titlebar = true
string title = "Facturación: Escoger Servicio"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "DosEdit5!"
boolean clientedge = true
boolean center = true
st_3 st_3
st_2 st_2
pb_cancel pb_cancel
pb_aceptar pb_aceptar
st_1 st_1
dw_tarifa dw_tarifa
end type
global w_escoge_proc w_escoge_proc

type variables
str_proc st
end variables

on w_escoge_proc.create
this.st_3=create st_3
this.st_2=create st_2
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.st_1=create st_1
this.dw_tarifa=create dw_tarifa
this.Control[]={this.st_3,&
this.st_2,&
this.pb_cancel,&
this.pb_aceptar,&
this.st_1,&
this.dw_tarifa}
end on

on w_escoge_proc.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.st_1)
destroy(this.dw_tarifa)
end on

event open;st=message.powerobjectparm
dw_tarifa.settransobject(sqlca)
dw_tarifa.retrieve(st.rips,st.cproc)
//     equivale a: manual ,cproceq
st_2.text=st.cproc
st_3.text=st.descripcion
st.cproc=''

end event

event close;closewithreturn(this,st)
end event

type st_3 from statictext within w_escoge_proc
integer x = 320
integer y = 196
integer width = 1961
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event constructor;text=st.descripcion
end event

type st_2 from statictext within w_escoge_proc
integer x = 9
integer y = 196
integer width = 302
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event constructor;text=st.descripcion
end event

type pb_cancel from picturebutton within w_escoge_proc
integer x = 1093
integer y = 848
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_aceptar from picturebutton within w_escoge_proc
integer x = 928
integer y = 848
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;dw_tarifa.triggerevent(doubleclicked!)
end event

type st_1 from statictext within w_escoge_proc
integer x = 18
integer width = 2267
integer height = 144
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Doble click o Aceptar sobre el procedimiento CUPS que va a facturar y que sea equivalente al procedimiento:"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_tarifa from datawindow within w_escoge_proc
integer x = 5
integer y = 280
integer width = 2286
integer height = 552
integer taborder = 10
string title = "none"
string dataobject = "dw_tarifas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;st.cproc=getitemstring(getrow(),"codproced")
st.valor=getitemnumber(getrow(),"valor")
st.rips=getitemstring(getrow(),"rips")
st.agrupser=getitemstring(getrow(),"codconcepto")
st.iva=getitemdecimal(getrow(),"iva")
st.version=getitemstring(getrow(),"cod_version")
close(parent)
end event

