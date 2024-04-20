$PBExportHeader$w_pagares.srw
forward
global type w_pagares from window
end type
type st_4 from statictext within w_pagares
end type
type em_porc from editmask within w_pagares
end type
type st_5 from statictext within w_pagares
end type
type cbx_1 from checkbox within w_pagares
end type
type em_des from editmask within w_pagares
end type
type pb_cancel from picturebutton within w_pagares
end type
type pb_aceptar from picturebutton within w_pagares
end type
type st_3 from statictext within w_pagares
end type
type st_2 from statictext within w_pagares
end type
type st_1 from statictext within w_pagares
end type
type em_saldo from editmask within w_pagares
end type
type em_total from editmask within w_pagares
end type
type em_por from editmask within w_pagares
end type
type gb_1 from groupbox within w_pagares
end type
type gb_2 from groupbox within w_pagares
end type
type gb_3 from groupbox within w_pagares
end type
end forward

global type w_pagares from window
integer width = 1248
integer height = 1116
boolean titlebar = true
string title = "Registro de Pagarés"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "rec_caja.ico"
boolean clientedge = true
boolean center = true
st_4 st_4
em_porc em_porc
st_5 st_5
cbx_1 cbx_1
em_des em_des
pb_cancel pb_cancel
pb_aceptar pb_aceptar
st_3 st_3
st_2 st_2
st_1 st_1
em_saldo em_saldo
em_total em_total
em_por em_por
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_pagares w_pagares

type variables
datawindow i_dw
end variables

on w_pagares.create
this.st_4=create st_4
this.em_porc=create em_porc
this.st_5=create st_5
this.cbx_1=create cbx_1
this.em_des=create em_des
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.em_saldo=create em_saldo
this.em_total=create em_total
this.em_por=create em_por
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.st_4,&
this.em_porc,&
this.st_5,&
this.cbx_1,&
this.em_des,&
this.pb_cancel,&
this.pb_aceptar,&
this.st_3,&
this.st_2,&
this.st_1,&
this.em_saldo,&
this.em_total,&
this.em_por,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on w_pagares.destroy
destroy(this.st_4)
destroy(this.em_porc)
destroy(this.st_5)
destroy(this.cbx_1)
destroy(this.em_des)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_saldo)
destroy(this.em_total)
destroy(this.em_por)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;i_dw=message.powerobjectparm
em_des.text=string(i_dw.getitemnumber(1,"descuento"))
em_total.text=string(i_dw.getitemnumber(1,"trecibo"))
em_por.text=string(i_dw.getitemnumber(1,"tsaldo"))
if i_dw.getitemstring(1,"imp_pag")='1' then
	cbx_1.checked=true
else
	cbx_1.checked=false
end if
em_por.triggerevent(modified!)

end event

type st_4 from statictext within w_pagares
integer x = 759
integer y = 364
integer width = 247
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Valor"
boolean focusrectangle = false
end type

type em_porc from editmask within w_pagares
integer x = 82
integer y = 276
integer width = 306
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 1090519039
string text = "none"
borderstyle borderstyle = stylelowered!
boolean spin = true
double increment = 10
string minmax = "0~~100"
end type

event modified;if real(this.text)<0 then this.text="0"
if real(this.text)>real(em_total.text) then this.text=em_total.text
em_des.text=string(real(em_total.text)*real(this.text)/100)
em_saldo.text=string(real(em_total.text)-(real(em_total.text)*real(this.text)/100))
end event

type st_5 from statictext within w_pagares
integer x = 101
integer y = 364
integer width = 283
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Porcentaje"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_pagares
integer x = 416
integer y = 732
integer width = 421
integer height = 72
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Imprimir Pagaré"
boolean checked = true
end type

type em_des from editmask within w_pagares
integer x = 699
integer y = 276
integer width = 402
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 1090519039
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "###,###,###.00"
end type

event getfocus;this.selecttext(1,len(this.text))
end event

event modified;if real(this.text)<0 then this.text="0"
em_porc.text="0"
if real(this.text)>real(em_total.text) then this.text=em_total.text
em_por.text="0"
em_saldo.text=string(real(em_total.text)-real(this.text))
end event

type pb_cancel from picturebutton within w_pagares
event mousemove pbm_mousemove
integer x = 581
integer y = 844
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_aceptar from picturebutton within w_pagares
event mousemove pbm_mousemove
integer x = 402
integer y = 844
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &a"
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;i_dw.setitem(1,"tsaldo",real(em_por.text))
i_dw.setitem(1,"descuento",real(em_des.text))
i_dw.setitem(1,"tpago",i_dw.getitemnumber(1,"trecibo")-i_dw.getitemnumber(1,"tsaldo") -real(em_des.text))
i_dw.setitem(1,"clugar_pag",clugar)
if cbx_1.checked then
	i_dw.setitem(1,"imp_pag",'1')
else
	i_dw.setitem(1,"imp_pag",'0')
end if
if real(em_por.text)>0 or real(em_des.text)>0 then
	i_dw.visible=true
else
	i_dw.visible=false
end if
i_dw.setcolumn('imp_pag')
i_dw.triggerevent(itemchanged!)
close(parent)
end event

type st_3 from statictext within w_pagares
integer x = 146
integer y = 644
integer width = 265
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "A cancelar"
boolean focusrectangle = false
end type

type st_2 from statictext within w_pagares
integer x = 622
integer y = 652
integer width = 384
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Valor del Pagaré"
boolean focusrectangle = false
end type

type st_1 from statictext within w_pagares
integer x = 59
integer y = 4
integer width = 302
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Valor Total"
boolean focusrectangle = false
end type

type em_saldo from editmask within w_pagares
integer x = 64
integer y = 556
integer width = 402
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 1090519039
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "###,###,###.00"
end type

event modified;if real(this.text)<0 then this.text="0"
if real(this.text)>real(em_total.text)- real(em_des.text) then this.text=string(real(em_total.text) - real(em_des.text))
em_por.text=string(real(em_total.text) - real(em_des.text)-real(this.text))
end event

event getfocus;this.selecttext(1,len(this.text))
end event

type em_total from editmask within w_pagares
integer x = 402
integer y = 72
integer width = 402
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 79741120
string text = "none"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type em_por from editmask within w_pagares
integer x = 581
integer y = 556
integer width = 402
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "###,###,###.00"
end type

event modified;if real(this.text)<0 then this.text="0"
if real(this.text)>real(em_total.text) - real(em_des.text) then this.text=string(real(em_total.text) - real(em_des.text))
em_saldo.text=string(real(em_total.text) - real(em_des.text) -real(this.text))
if real(this.text)=0 then 
	cbx_1.checked =false
	cbx_1.enabled=false
else
	cbx_1.enabled=true
end if

end event

event getfocus;this.selecttext(1,len(this.text))
end event

type gb_1 from groupbox within w_pagares
integer x = 14
integer y = 488
integer width = 1161
integer height = 336
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pagares"
end type

type gb_2 from groupbox within w_pagares
integer x = 14
integer width = 1161
integer height = 188
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_3 from groupbox within w_pagares
integer x = 9
integer y = 204
integer width = 1143
integer height = 252
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Descuento"
end type

