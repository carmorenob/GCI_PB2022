$PBExportHeader$w_busca_articulo.srw
forward
global type w_busca_articulo from window
end type
type cb_cancel from picturebutton within w_busca_articulo
end type
type cb_aceptar from picturebutton within w_busca_articulo
end type
type st_3 from statictext within w_busca_articulo
end type
type st_1 from statictext within w_busca_articulo
end type
type st_5 from statictext within w_busca_articulo
end type
type dw_1 from datawindow within w_busca_articulo
end type
type gb_2 from groupbox within w_busca_articulo
end type
end forward

global type w_busca_articulo from window
integer width = 3145
integer height = 960
boolean titlebar = true
string title = "Busca Articulos para Tarifa"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cancel cb_cancel
cb_aceptar cb_aceptar
st_3 st_3
st_1 st_1
st_5 st_5
dw_1 dw_1
gb_2 gb_2
end type
global w_busca_articulo w_busca_articulo

type variables
st_pa_medica ist_m
st_med st_med
end variables

event open;ist_m=message.powerobjectparm
dw_1.retrieve(ist_m.valor)
st_1.text=string(dw_1.rowcount())+' Registros'
end event

on w_busca_articulo.create
this.cb_cancel=create cb_cancel
this.cb_aceptar=create cb_aceptar
this.st_3=create st_3
this.st_1=create st_1
this.st_5=create st_5
this.dw_1=create dw_1
this.gb_2=create gb_2
this.Control[]={this.cb_cancel,&
this.cb_aceptar,&
this.st_3,&
this.st_1,&
this.st_5,&
this.dw_1,&
this.gb_2}
end on

on w_busca_articulo.destroy
destroy(this.cb_cancel)
destroy(this.cb_aceptar)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.st_5)
destroy(this.dw_1)
destroy(this.gb_2)
end on

type cb_cancel from picturebutton within w_busca_articulo
event mousemove pbm_mousemove
integer x = 1861
integer y = 76
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &a"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+A]"
end type

event clicked;close(f_vent_padre(this))
end event

type cb_aceptar from picturebutton within w_busca_articulo
event mousemove pbm_mousemove
integer x = 1696
integer y = 76
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;dw_1.triggerevent(doubleclicked!)
end event

type st_3 from statictext within w_busca_articulo
integer x = 91
integer y = 72
integer width = 1495
integer height = 132
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Haga doble Click sobre el dato que desea del artículo a llevar"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_busca_articulo
integer x = 2542
integer y = 120
integer width = 462
integer height = 76
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_5 from statictext within w_busca_articulo
integer x = 2533
integer y = 60
integer width = 471
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Número de registros:"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_busca_articulo
integer x = 64
integer y = 244
integer width = 2939
integer height = 504
integer taborder = 10
string title = "none"
string dataobject = "dw_sum_articulo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(SQLCA)
end event

event doubleclicked;if rowcount()<1  then return
if isvalid(ist_m) then
	if isvalid(ist_m.dw) then//si viene este parametro lo carga en este datawindow
		long fila
		fila=ist_m.dw.getrow()
		ist_m.dw.setitem(fila,'codarticulo',getitemstring(getrow(),"sumarticulo_codarticulo"))
		ist_m.dw.setitem(fila,'fabricante',getitemstring(getrow(),"sumarticulo_fabricante"))
	end if
end if
//closewithreturn(f_vent_padre(this),st_med)
close(f_vent_padre(this))
end event

type gb_2 from groupbox within w_busca_articulo
integer x = 23
integer width = 3049
integer height = 792
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Articulos que cumplen la condición"
end type

