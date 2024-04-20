$PBExportHeader$w_escoge_pagodir.srw
forward
global type w_escoge_pagodir from window
end type
type st_1 from statictext within w_escoge_pagodir
end type
type pb_cancel from picturebutton within w_escoge_pagodir
end type
type pb_ok from picturebutton within w_escoge_pagodir
end type
type dw_1 from datawindow within w_escoge_pagodir
end type
end forward

global type w_escoge_pagodir from window
integer width = 3045
integer height = 1480
boolean titlebar = true
string title = "Escoger Pago Directo"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "rec_caja.ico"
boolean center = true
st_1 st_1
pb_cancel pb_cancel
pb_ok pb_ok
dw_1 dw_1
end type
global w_escoge_pagodir w_escoge_pagodir

type variables
st_ord_pago i_st
long i_llevar=0
end variables

on w_escoge_pagodir.create
this.st_1=create st_1
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.pb_cancel,&
this.pb_ok,&
this.dw_1}
end on

on w_escoge_pagodir.destroy
destroy(this.st_1)
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.dw_1)
end on

event open;i_st=message.powerobjectparm
dw_1.retrieve(i_st.dw_cpo.getitemstring(i_st.dw_cpo.getrow(),'tipodoc'),i_st.dw_cpo.getitemstring(i_st.dw_cpo.getrow(),'documento'),i_st.dw_conta.getitemstring(i_st.dw_conta.getrow(),'cartipo'))

end event

event close;closewithreturn(this,i_llevar)
end event

type st_1 from statictext within w_escoge_pagodir
integer x = 14
integer width = 937
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pagos del tercero Pendientes de registrar:"
boolean focusrectangle = false
end type

type pb_cancel from picturebutton within w_escoge_pagodir
integer x = 1509
integer y = 1256
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_escoge_pagodir
integer x = 1344
integer y = 1256
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_1.rowcount()=0 then return
dw_1.accepttext()
if dw_1.getitemnumber(1,'total')=0 then return
i_st.dw_conta.setitem(i_st.dw_conta.getrow(),'tvalor',dw_1.getitemnumber(1,'total'))
i_st.dw_conta.setitem(i_st.dw_conta.getrow(),'codcaja',dw_1.getitemstring(1,'codcaja'))
i_st.dw_conta.setitem(i_st.dw_conta.getrow(),'clugar_ing',dw_1.getitemstring(1,'clugar'))
i_st.dw_conta.setitem(i_st.dw_conta.getrow(),'coddoc_ing',dw_1.getitemstring(1,'coddoc'))
i_st.dw_conta.setitem(i_st.dw_conta.getrow(),'ningreso',dw_1.getitemnumber(1,'ningreso'))
i_llevar=1
close(parent)
end event

type dw_1 from datawindow within w_escoge_pagodir
integer x = 5
integer y = 56
integer width = 3003
integer height = 1180
integer taborder = 10
string title = "none"
string dataobject = "dw_pagodir_a_relfact"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

