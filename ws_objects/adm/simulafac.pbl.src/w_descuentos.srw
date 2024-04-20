$PBExportHeader$w_descuentos.srw
forward
global type w_descuentos from window
end type
type dw_1 from datawindow within w_descuentos
end type
type pb_cancel from picturebutton within w_descuentos
end type
type pb_ok from picturebutton within w_descuentos
end type
end forward

global type w_descuentos from window
integer width = 1554
integer height = 616
boolean titlebar = true
string title = "Descuentos a la Empresa"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "rec_caja.ico"
boolean clientedge = true
boolean center = true
dw_1 dw_1
pb_cancel pb_cancel
pb_ok pb_ok
end type
global w_descuentos w_descuentos

type variables
st_xa_desc_emp i_st
end variables

event open;i_st=message.powerobjectparm
dw_1.setitem(1,'vtot_emp',i_st.dw_empres.getitemnumber(i_st.dw_empres.getrow(),"vtemp")+i_st.dw_empres.getitemnumber(i_st.dw_empres.getrow(),"descuento_e"))
dw_1.setitem(1,'desc',i_st.dw_empres.getitemnumber(i_st.dw_empres.getrow(),"descuento_e"))
dw_1.setitem(1,'percent',dw_1.getitemnumber(1,'c_percent'))

end event

on w_descuentos.create
this.dw_1=create dw_1
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.Control[]={this.dw_1,&
this.pb_cancel,&
this.pb_ok}
end on

on w_descuentos.destroy
destroy(this.dw_1)
destroy(this.pb_cancel)
destroy(this.pb_ok)
end on

type dw_1 from datawindow within w_descuentos
integer width = 1509
integer height = 376
integer taborder = 60
string title = "none"
string dataobject = "dw_desc_emp"
boolean border = false
boolean livescroll = true
end type

event constructor;insertrow(1)
end event

event itemchanged;accepttext()
choose case dwo.name
	case 'percent'
		setitem(1,'desc',getitemnumber(1,'c_desc'))
	case 'desc'
		setitem(1,'percent',getitemnumber(1,'c_percent'))
end choose
end event

type pb_cancel from picturebutton within w_descuentos
integer x = 736
integer y = 376
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "      &c"
boolean cancel = true
boolean default = true
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_descuentos
integer x = 585
integer y = 376
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "      &a"
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;i_st.dw_empres.setitem(i_st.dw_empres.getrow(),"vtemp",dw_1.getitemnumber(1,'neto'))
i_st.dw_empres.setitem(i_st.dw_empres.getrow(),"descuento_e",dw_1.getitemnumber(1,'desc'))
dec percen
long j
string cemp
cemp=i_st.dw_empres.getitemstring(i_st.dw_empres.getrow(),"cemp")
percen=dw_1.getitemnumber(1,"percent")/100
for j=1 to i_st.dw_factcpo.rowcount()
	if i_st.dw_factcpo.getitemstring(j,'cemp')<>cemp then continue
	i_st.dw_factcpo.setitem(j,'desc_emp',round(i_st.dw_factcpo.getitemnumber(j,'vt_emp')*percen,2))
next
closewithreturn(parent,'si')
end event

