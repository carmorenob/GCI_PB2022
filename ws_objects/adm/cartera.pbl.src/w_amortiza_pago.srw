$PBExportHeader$w_amortiza_pago.srw
forward
global type w_amortiza_pago from window
end type
type pb_cancel from picturebutton within w_amortiza_pago
end type
type pb_ok from picturebutton within w_amortiza_pago
end type
type dw_cpo from datawindow within w_amortiza_pago
end type
type dw_antis from datawindow within w_amortiza_pago
end type
end forward

global type w_amortiza_pago from window
integer width = 3867
integer height = 1648
boolean titlebar = true
string title = "Amortizaciones de Anticipos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_cancel pb_cancel
pb_ok pb_ok
dw_cpo dw_cpo
dw_antis dw_antis
end type
global w_amortiza_pago w_amortiza_pago

type variables
st_amortizar i_st
string retorna='!'
end variables

on w_amortiza_pago.create
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.dw_cpo=create dw_cpo
this.dw_antis=create dw_antis
this.Control[]={this.pb_cancel,&
this.pb_ok,&
this.dw_cpo,&
this.dw_antis}
end on

on w_amortiza_pago.destroy
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.dw_cpo)
destroy(this.dw_antis)
end on

event open;i_st=message.powerobjectparm
i_st.dw_cpo.rowscopy(i_st.dw_cpo.getrow(),i_st.dw_cpo.getrow(),primary!,dw_cpo,1,primary!)
dw_antis.retrieve(i_st.dw_cab.getitemstring(1,'clugar'),i_st.dw_cab.getitemstring(1,'tipodoc'),i_st.dw_cab.getitemstring(1,'documento'))
end event

event close;closewithreturn(this,retorna)

end event

type pb_cancel from picturebutton within w_amortiza_pago
integer x = 3584
integer y = 164
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &c"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_amortiza_pago
integer x = 3584
integer y = 32
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "         &a"
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;if dw_antis.rowcount()=0 or dw_cpo.getitemnumber(1,'a_amortizar')=0 then return
i_st.dw_cpo.setitem(i_st.dw_cpo.getrow(),'a_amortizar',dw_cpo.getitemnumber(1,'a_amortizar'))
dw_antis.setfilter('a_amortiz > 0')
dw_antis.filter()
long j
datawindow dw_t
dw_t=w_teso_cartera.dw_amtz
dw_t.reset()
for j=1 to dw_antis.rowcount()
	dw_t.insertrow(j)
	dw_t.setitem(j,'clug_anti',dw_antis.getitemstring(j,'clugar'))
	dw_t.setitem(j,'coddoc_anti',dw_antis.getitemstring(j,'coddoc'))
	dw_t.setitem(j,'num_cobro_anti',dw_antis.getitemnumber(j,'num_cobro'))
	dw_t.setitem(j,'clug_pago',dw_cpo.getitemstring(1,'clugar'))
	dw_t.setitem(j,'coddoc_pago',dw_cpo.getitemstring(1,'coddoc'))
	dw_t.setitem(j,'num_cobro_pago',dw_cpo.getitemnumber(1,'num_cobro'))
	dw_t.setitem(j,'cartipo_pago',dw_cpo.getitemstring(1,'cartipo'))
	dw_t.setitem(j,'item_pago',dw_cpo.getitemnumber(1,'item'))
	dw_t.setitem(j,'valor',dw_antis.getitemnumber(j,'a_amortiz'))
next

retorna='ok'
close(parent)
end event

type dw_cpo from datawindow within w_amortiza_pago
integer x = 23
integer y = 20
integer width = 3470
integer height = 472
integer taborder = 10
string title = "none"
string dataobject = "dw_car_cpo_pagos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;modify('datawindow.footer.height=0')
modify('cartipo.visible=0')
modify('valor.edit.displayonly=yes')
settransobject(sqlca)
end event

type dw_antis from datawindow within w_amortiza_pago
event p_itemchanged ( long p_fila )
integer x = 64
integer y = 576
integer width = 3694
integer height = 888
integer taborder = 10
string title = "none"
string dataobject = "dw_antis_a_amortiza"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged(long p_fila);accepttext()
if getitemnumber(1,'Total')>dw_cpo.getitemnumber(1,'valor') then
	if messagebox('Atención','La suma de amortizaciones es mayor al valor del pago, desea continuar?',question!,yesno!,2)=2 then
		setitem(p_fila,'a_amortiz',0)
		messagebox('Atención','Valor no válido')
		scrolltorow(p_fila)
		setcolumn('a_amortiz')
		settext('0')
		setfocus()
	end if
end if
dw_cpo.setitem(1,'a_amortizar',getitemnumber(1,'Total'))
end event

event constructor;settransobject(sqlca)
end event

event itemchanged;post event p_itemchanged(row)
end event

