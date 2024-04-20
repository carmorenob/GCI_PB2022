$PBExportHeader$w_busca_entrega_med.srw
forward
global type w_busca_entrega_med from window
end type
type pb_2 from picturebutton within w_busca_entrega_med
end type
type pb_1 from picturebutton within w_busca_entrega_med
end type
type dw_1 from datawindow within w_busca_entrega_med
end type
type st_1 from statictext within w_busca_entrega_med
end type
type sle_1 from singlelineedit within w_busca_entrega_med
end type
end forward

global type w_busca_entrega_med from window
integer width = 2907
integer height = 1296
boolean titlebar = true
string title = "Buscar Entregas Anteriores por Número"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
boolean center = true
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
st_1 st_1
sle_1 sle_1
end type
global w_busca_entrega_med w_busca_entrega_med

on w_busca_entrega_med.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.st_1=create st_1
this.sle_1=create sle_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_1,&
this.st_1,&
this.sle_1}
end on

on w_busca_entrega_med.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.sle_1)
end on

type pb_2 from picturebutton within w_busca_entrega_med
integer x = 1358
integer y = 1048
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "CAncelar"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_busca_entrega_med
integer x = 1193
integer y = 1048
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_1.rowcount()=0 then return
dw_1.triggerevent(doubleclicked!)
end event

type dw_1 from datawindow within w_busca_entrega_med
integer x = 46
integer y = 172
integer width = 2821
integer height = 844
integer taborder = 20
string title = "none"
string dataobject = "dw_busca_entrega"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event doubleclicked;if getrow()<1 then return
tipdoc=getitemstring(getrow(),"tipodoc")
docu=getitemstring(getrow(),"documento")
w_principal.busca_paciente()
w_entrega_med.dw_tip_ingres.setitem(1,1,getitemstring(getrow(),"codtingre"))
w_entrega_med.dw_tip_ingres.triggerevent(itemchanged!)
close(parent)
end event

event clicked;if row<1 then return
scrolltorow(row)
end event

type st_1 from statictext within w_busca_entrega_med
integer x = 14
integer y = 28
integer width = 306
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nro Entrega:"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_busca_entrega_med
integer x = 325
integer y = 16
integer width = 402
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

event modified;dw_1.retrieve(long(text),clugar)
end event

