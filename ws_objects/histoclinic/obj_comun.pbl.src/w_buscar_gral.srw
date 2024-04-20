$PBExportHeader$w_buscar_gral.srw
forward
global type w_buscar_gral from window
end type
type pb_cancel from picturebutton within w_buscar_gral
end type
type pb_ok from picturebutton within w_buscar_gral
end type
type dw_1 from datawindow within w_buscar_gral
end type
end forward

global type w_buscar_gral from window
integer width = 2482
integer height = 1500
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
boolean center = true
pb_cancel pb_cancel
pb_ok pb_ok
dw_1 dw_1
end type
global w_buscar_gral w_buscar_gral

type variables
st_xa_elegir i_st
end variables

on w_buscar_gral.create
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.dw_1=create dw_1
this.Control[]={this.pb_cancel,&
this.pb_ok,&
this.dw_1}
end on

on w_buscar_gral.destroy
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.dw_1)
end on

event resize;dw_1.resize(newwidth - 10 , newheight - 150)
pb_ok.y=newheight - 134
pb_ok.x=(newwidth/2) - 146
pb_cancel.y=newheight - 134
pb_cancel.x=(newwidth/2) + 4
end event

event open;i_st=message.powerobjectparm
title=i_st.titulo
dw_1.dataobject=i_st.dw_object
dw_1.settransobject(sqlca)
if dw_1.retrieve()=0 then return
if dw_1.dataobject='dw_ls_plants' then
	dw_1.setfilter("codplantilla<>'"+i_st.codplantilla+"'")
	dw_1.filter()
end if

if i_st.ancho>0 or i_st.alto>0 then 
	if i_st.alto=0 then i_st.alto=height
	if i_st.ancho=0 then i_st.ancho=width
	resize(i_st.ancho,i_st.alto)
end if
end event

type pb_cancel from picturebutton within w_buscar_gral
integer x = 1161
integer y = 1284
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_buscar_gral
integer x = 1010
integer y = 1284
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                 &a"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;string retorna
retorna=dw_1.getitemstring(dw_1.getrow(),1)
dw_1.setfilter('')
dw_1.filter()
if dw_1.rowcount()=0 then return
closewithreturn(parent,retorna)
end event

type dw_1 from datawindow within w_buscar_gral
integer width = 2459
integer height = 1252
integer taborder = 10
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event doubleclicked;pb_ok.event clicked()
end event

