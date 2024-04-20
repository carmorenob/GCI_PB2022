$PBExportHeader$w_error_ds.srw
forward
global type w_error_ds from window
end type
type pb_1 from picturebutton within w_error_ds
end type
type mle_1 from multilineedit within w_error_ds
end type
end forward

global type w_error_ds from window
integer width = 2363
integer height = 1052
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Error!"
boolean center = true
pb_1 pb_1
mle_1 mle_1
end type
global w_error_ds w_error_ds

type variables
st_error i_st
end variables

event open;i_st=message.powerobjectparm
title='Error en Datawindow o DataStore '+i_st.ds_nombre
mle_1.text=i_st.msgerror
end event

on w_error_ds.create
this.pb_1=create pb_1
this.mle_1=create mle_1
this.Control[]={this.pb_1,&
this.mle_1}
end on

on w_error_ds.destroy
destroy(this.pb_1)
destroy(this.mle_1)
end on

type pb_1 from picturebutton within w_error_ds
integer x = 1061
integer y = 828
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;Close(parent)
end event

type mle_1 from multilineedit within w_error_ds
integer width = 2345
integer height = 808
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean vscrollbar = true
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

