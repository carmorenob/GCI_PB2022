$PBExportHeader$w_escoge_articulo.srw
forward
global type w_escoge_articulo from window
end type
type st_3 from statictext within w_escoge_articulo
end type
type st_2 from statictext within w_escoge_articulo
end type
type pb_cancel from picturebutton within w_escoge_articulo
end type
type pb_aceptar from picturebutton within w_escoge_articulo
end type
type st_1 from statictext within w_escoge_articulo
end type
type dw_tarifa from datawindow within w_escoge_articulo
end type
end forward

global type w_escoge_articulo from window
integer width = 2583
integer height = 1052
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
global w_escoge_articulo w_escoge_articulo

type variables
st_escoge_equiv st

end variables

on w_escoge_articulo.create
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

on w_escoge_articulo.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.st_1)
destroy(this.dw_tarifa)
end on

event open;st = message.powerobjectparm
String sql_b
if st.manual='' or  isnull(st.manual) then
	sql_b="SELECT SUMARTICULO.codArticulo, SUMARTICULO.DESCRIPCION,1 as saldo&
	FROM (Medicamentos INNER JOIN SUMGENERICO ON Medicamentos.c_medica = SUMGENERICO.c_medica) INNER JOIN SUMARTICULO ON SUMGENERICO.codgenerico = SUMARTICULO.codgenerico &
	WHERE (((Medicamentos.estado)='1') AND ((Medicamentos.c_medica)='"+st.proccups+"'));"
else
	sql_b="SELECT SUMARTICULO.codArticulo, SUMARTICULO.DESCRIPCION, SUM_KARDEX.saldoactual &
	FROM ((Medicamentos INNER JOIN SUMGENERICO ON Medicamentos.c_medica = SUMGENERICO.c_medica) &
	INNER JOIN SUMARTICULO ON SUMGENERICO.codgenerico = SUMARTICULO.codgenerico) left JOIN &
	SUM_KARDEX ON SUMARTICULO.codArticulo = SUM_KARDEX.CODARTICULO &
	WHERE (((Medicamentos.estado)='1') AND ((Medicamentos.c_medica)='"+st.proccups+"') AND ((SUM_KARDEX.CODALMACEN='"+st.manual+"') OR (SUM_KARDEX.CODALMACEN Is Null)))"
end If

if dw_tarifa.setsqlselect(sql_b)=-1 then
   return -1
end if
dw_tarifa.settransobject(sqlca)
dw_tarifa.retrieve(st.proccups)
st_2.text=st.proccups
st_3.text=st.desproc

end event

type st_3 from statictext within w_escoge_articulo
integer x = 375
integer y = 140
integer width = 2117
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event constructor;text=st.desproc


end event

type st_2 from statictext within w_escoge_articulo
integer x = 27
integer y = 140
integer width = 325
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

event constructor;text=st.proccups


end event

type pb_cancel from picturebutton within w_escoge_articulo
integer x = 1266
integer y = 780
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

type pb_aceptar from picturebutton within w_escoge_articulo
integer x = 1106
integer y = 780
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

type st_1 from statictext within w_escoge_articulo
integer x = 37
integer y = 4
integer width = 2464
integer height = 116
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Doble click o Aceptar sobre el  Medicamento que va a facturar y de acuerdo a su necesidad y control de kardex, el color rosado indica que no hay existencia del artículo:"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_tarifa from datawindow within w_escoge_articulo
integer x = 23
integer y = 224
integer width = 2487
integer height = 536
integer taborder = 10
string title = "none"
string dataobject = "dw_busca_articulo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if this.getrow()<1 then return
If isnull(row) then row=1
closewithreturn(parent,dw_tarifa.getitemstring(row,'codarticulo'))
end event

event clicked;dw_tarifa.triggerevent(doubleclicked!)
end event

