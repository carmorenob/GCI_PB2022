$PBExportHeader$w_elige_alma.srw
forward
global type w_elige_alma from window
end type
type pb_2 from picturebutton within w_elige_alma
end type
type pb_1 from picturebutton within w_elige_alma
end type
type st_1 from statictext within w_elige_alma
end type
type dw_1 from datawindow within w_elige_alma
end type
end forward

global type w_elige_alma from window
integer width = 2331
integer height = 1140
boolean titlebar = true
string title = "Elegir Almacen"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_2 pb_2
pb_1 pb_1
st_1 st_1
dw_1 dw_1
end type
global w_elige_alma w_elige_alma

on w_elige_alma.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.st_1,&
this.dw_1}
end on

on w_elige_alma.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.dw_1)
end on

event open;st_uf_cc st
st=message.powerobjectparm
if st.codcc='-' then
	dw_1.dataobject='dw_elige_alma_areaapdx'
	dw_1.settransobject(sqlca)
	dw_1.retrieve(st.coduf)
else
	dw_1.dataobject='dw_elige_alma'
	dw_1.settransobject(sqlca)
	dw_1.retrieve(st.coduf,st.codcc,clugar)
end if
end event

type pb_2 from picturebutton within w_elige_alma
integer x = 1143
integer y = 868
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_elige_alma
integer x = 955
integer y = 868
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
string powertiptext = "Elegir"
end type

event clicked;if dw_1.getrow()<1 then return
closewithreturn(parent,dw_1.getitemstring(dw_1.getrow(),'codalmacen'))
end event

type st_1 from statictext within w_elige_alma
integer x = 18
integer width = 1385
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Elegir Almacen para descargar insumos. (Doble Click o aceptar)"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_elige_alma
integer x = 18
integer y = 68
integer width = 2231
integer height = 780
integer taborder = 10
string title = "none"
string dataobject = "dw_elige_alma"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if row<1 then return
pb_1.event clicked()
end event

event constructor;settransobject(sqlca)
end event

